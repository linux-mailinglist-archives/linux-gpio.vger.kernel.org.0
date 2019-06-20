Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B78BB4CE6C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2019 15:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731779AbfFTNQu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Jun 2019 09:16:50 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49394 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfFTNQu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Jun 2019 09:16:50 -0400
Received: from broadband.bt.com (unknown [IPv6:2a00:23c5:58d:db00:36ee:cfb1:e0d:7749])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: martyn)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2387927FB86;
        Thu, 20 Jun 2019 14:16:48 +0100 (BST)
Message-ID: <bee53b48c96603ae8970d42bc4bff386b876bc51.camel@collabora.com>
Subject: [RFC] Initial state for GPIOs
From:   Martyn Welch <martyn.welch@collabora.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>, kernel@collabora.com
Date:   Thu, 20 Jun 2019 14:16:46 +0100
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob, Mark,

Attempts have been made to define an approach for describing the
initial state of gpios (direction and value when driven as an output) a
number of times in the past, but a concensus on the approach to take
seems to have never been reached.

The aim is to be able to describe GPIOs which a definitive use exists
(i.e. are routed from an SoC to a pin on another device with a
definitive purpose) and which the desired, and possibly required, state
of the pin is known. This differs from gpio-hog in that there is an
expectation that a consumer of the gpio may appear at a later date,
which may take the form of the GPIO being exported to user space.

Previous attempts have suggested a variation of the gpio-hogs[1][2].
"gpio-hogs" uses a node for each GPIO containing the "gpio-hogs"
property, with which the Linux kernel will act as a consumer,
statically setting the provided state on the GPIO line, for example:

        qe_pio_a: gpio-controller@1400 {
                compatible = "fsl,qe-pario-bank-a", 
			     "fsl,qe-pario-bank";
                reg = <0x1400 0x18>;
                gpio-controller;
                #gpio-cells = <2>;

                line_b {
                        gpio-hog;
                        gpios = <6 0>;
                        output-low;
                        line-name = "foo-bar-gpio";
                };
        };

It had been suggested to either replace "gpio-hogs" with "gpio-initval" 
or to include a node without the "gpio-hogs" property to set an inital
state, but allow another consumer to come along at a later date.

A previous related attempt to upstream a "gpio-switch" consumer[3] also
took the approach of defining nodes in the device tree. The
conversation pointed towards a suggestion of using nodes with
compatible properties, for example:

        &gpiochip {
                some_led {
                        compatible = "gpio-leds";
                        default-state = "on";
                        gpios = <3 0>;
                        line-name = "leda";
                };

                some_switch {
                        compatible = "gpio-switch", "gpio-initval";
                        gpios = <4 0>;
                        line-name = "switch1";

                        /*
			 * This is used by gpio-initval in case 
			 * gpio-switch is not implemented
			 */
                        output-low;
                };

                some_interrupt {
                        gpios = <5 0>;
                        line-name = "some_interrupt_line";
                };

                line_b {
                        gpios = <6 0>;
                        line-name = "line-b";
                };
        };

An alternative that has been briefly raised[4] when I approached the
subject recently on the GPIO mailing list is to add a property to the
controller node, rather than child nodes, that listed the expected
initial states of the pins as an array, much like the line names are
handled through "gpio-line-names". I'm not quite sure how it would best
to treat offsets where no special initial state is required (gpio-line-
names uses empty strings). Something like this?:

--- gpio.h
        /* Bit 4 express initial state */
        #define GPIO_INPUT 0
        #define GPIO_OUTPUT 16

        /* Bit 5 express initial state */
        #define GPIO_INITIAL_LOW 0
        #define GPIO_INITIAL_HIGH 32
        
        #define GPIO_OUTPUT_LOW (GPIO_OUTPUT | GPIO_INITIAL_LOW)
        #define GPIO_OUTPUT_HIGH (GPIO_OUTPUT | GPIO_INITIAL_HIGH)
---

--- device tree
        &gpiochip {
                gpio-line-names = "", "", "", "widget_en",
			"widget_signal";
                gpio-initial-states = <>, <>, <>,
			<GPIO_OUTPUT_HIGH | GPIO_LINE_OPEN_DRAIN>,
			<GPIO_INPUT | GPIO_ACTIVE_LOW>;
        };
---        

An alternative option may be to provide the offset as the first item
(though this is then different from "gpio-line-names"), so:

--- device tree
        &gpiochip {
                gpio-line-names = "", "", "", "widget_en",
			"widget_signal";
                gpio-initial-states =
			<3 GPIO_OUTPUT_HIGH | GPIO_LINE_OPEN_DRAIN>,
			<4 GPIO_INPUT | GPIO_ACTIVE_LOW>;
        };
---        

I'm interested in understanding what form would be acceptable as part
of the device tree binding.

Thanks in advance,

Martyn

[1] https://marc.info/?l=devicetree&m=145621411916777&w=2
[2] https://patchwork.ozlabs.org/patch/545493/
[3] https://lore.kernel.org/patchwork/patch/624195/
[4] https://www.spinics.net/lists/linux-gpio/msg39810.html

