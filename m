Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED1311AB87
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 14:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbfLKNFr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 08:05:47 -0500
Received: from ns.iliad.fr ([212.27.33.1]:53312 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727402AbfLKNFr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 11 Dec 2019 08:05:47 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id E878620714;
        Wed, 11 Dec 2019 14:05:45 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D27A020482;
        Wed, 11 Dec 2019 14:05:45 +0100 (CET)
To:     GPIO <linux-gpio@vger.kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Trying to understand basic concepts about GPIO reset pin
Message-ID: <e8b645da-9921-0436-ccfa-9abf4ae5b9d6@free.fr>
Date:   Wed, 11 Dec 2019 14:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Dec 11 14:05:45 2019 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I've asked linusw a few times on IRC, and every time, I /think/ I understand,
then I get confused again later. So I'm trying to understand once and for all.

Please do not hesitate to correct any mistake/misconception below.

I want to discuss a "simple" GPIO reset pin.

1) When a reset pin is ACTIVE, the corresponding circuit is "held" in reset.
In other words, when a reset pin is ACTIVE, the circuit is DISABLED / does not
receive power, clocks don't tick, nothing changes state.

2a) If a signal is ACTIVE HIGH, that means the signal is ACTIVE when the voltage
on the line is HIGH (e.g. 3.3V or 5V)

2b) If a signal is ACTIVE LOW, that means the signal is ACTIVE when the voltage
on the line is LOW (e.g. 0V, connected to ground)

3) Usually(?) a reset signal is ACTIVE LOW. That way, when the SoC is coming up,
and current has not propagated everywhere, LOW voltage on the reset pin means
the circuit is "held" in reset, until we are ready to set voltage HIGH on the
reset pin to disable the reset, and enable the circuit.


Suppose a circuit's HW description states:

RESET_N:
External Reset.
Active LOW reset signal to the device.
See Figure 4.6 on page 21 for reset timing requirements.
Figure 4.6 shows the minimum timing interval for RESET_N.
RESET_N must be driven LOW for at least the period of 200 µs before accessing registers.


4) The DT node for this device should describe the reset pin as GPIO_ACTIVE_LOW:

	reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;


OK, now we're getting into the parts of the GPIO API I don't understand well.

If I just call

	devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

then I am able to interact with the device. How can that be?

Is GPIOD_OUT_LOW a /logical/ low?
In other words, does the call above really set the line HIGH
=> RESET INACTIVE => CIRCUIT ENABLED ?

The problem is that it does not guarantee that the line was LOW for 200 µs
before being set HIGH, right?

It would appear that the correct sequence of calls for my circuit should be:

a)	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
b)	usleep_range(200, 300);
c)	gpiod_set_value_cansleep(reset, 0);

If I understand correctly:
a) configures the pin as an output, and sets it to LOGICAL HIGH, i.e. PHYSICAL LOW
b) keeps the RESET_N signal at PHYSICAL LOW for 200-300 µs
c) sets the pin to LOGICAL 0/LOW = PHYSICAL HIGH


For my own reference, I'll paste the last conversation I had on IRC:

(10:33:29 AM) marc|gonzalez: Heya! linusw: for an optional reset GPIO pin, IIRC, just doing devm_gpiod_get_optional(cdev, "reset", GPIOD_OUT_LOW);  will have the gpiod framework "do the right thing" to tweak/frob/toggle the pin to bring the device out of reset.  Am I misremembering?
(10:34:53 AM) marc|gonzalez: and also, properly naming the pin in the DT : reset-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
(10:35:00 AM) ukleinek: marc|gonzalez: IMHO this should be: GPIOD_OUT_INACTIVE (not sure this exists, but the purpose would be much more obvious.)
(11:02:45 AM) linusw: marc|gonzalez: it will do the right thing provided you don't want devm_gpiod_get_optional() to assert reset, since it is active low, this will bring it inactive (de-asserted).
(11:03:33 AM) linusw: marc|gonzalez: you would have to request it GPIOD_OUT_HIGH if you also want it to assert reset (then later you need to toggle it to low explicitly).
(11:04:15 AM) linusw: marc|gonzalez: sometimes you want to request it GPIO_ASIS and take full control of asserting/deasserting the reset.


AFAIU, linusw is precisely describing the a) b) c) sequence above.

I'd be happy to read anyone's thoughts on the topic.

Regards.
