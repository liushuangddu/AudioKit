//
//  TablePlayground.m
//  AudioKit
//
//  Created by Aurelius Prochazka on 3/17/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#import "Playground.h"

@implementation Playground

- (void) setup
{
    [super setup];
}

- (void)run
{
    [super run];
    [self addAudioOutputPlot];

    AKInstrument *instrument = [[AKInstrument alloc] initWithNumber:1];
    AKOscillator *oscillator = [AKOscillator oscillator];
    [instrument setAudioOutput:oscillator];
    [AKOrchestra addInstrument:instrument];

    AKTable *sine = [AKTable standardSineWave];
    AKPlaygroundTablePlot(sine);

    [self addButtonWithTitle:@"Play Sine" block:^{
        oscillator.waveform = sine;
        [AKOrchestra updateInstrument:instrument];
        [instrument playForDuration:1.0];
    }];

    AKTable *sawtooth = [AKTable standardSawtoothWave];
    AKPlaygroundTablePlot(sawtooth);

    [self addButtonWithTitle:@"Play Sawtooth" block:^{
        oscillator.waveform = sawtooth;
        [AKOrchestra updateInstrument:instrument];
        [instrument playForDuration:1.0];
    }];

    AKTable *triangle = [AKTable standardTriangleWave];
    AKPlaygroundTablePlot(triangle);

    [self addButtonWithTitle:@"Play Triangle" block:^{
        oscillator.waveform = triangle;
        [AKOrchestra updateInstrument:instrument];
        [instrument playForDuration:1.0];
    }];

    AKTable *square = [AKTable standardSquareWave];
    AKPlaygroundTablePlot(square);

    [self addButtonWithTitle:@"Play Square" block:^{
        oscillator.waveform = square;
        [AKOrchestra updateInstrument:instrument];
        [instrument playForDuration:1.0];
    }];

    AKTable *sawToothFromSines = [[AKTable alloc] init];
    AKFourierSeriesTableGenerator *sawSine = [[AKFourierSeriesTableGenerator alloc] init];
    for (int i = 0; i < 30; i++) {
        [sawSine addSinusoidWithPartialNumber:2*i+1 strength:1.0/(float)(2*i+1)];
    }
    [sawToothFromSines populateTableWithGenerator:sawSine];

    AKPlaygroundTablePlot(sawToothFromSines);

    [self addButtonWithTitle:@"Play This" block:^{
        oscillator.waveform = sawToothFromSines;
        [AKOrchestra updateInstrument:instrument];
        [instrument playForDuration:1.0];
    }];
}

@end