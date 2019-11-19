Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF3CF102054
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2019 10:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfKSJ2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Nov 2019 04:28:17 -0500
Received: from ns.iliad.fr ([212.27.33.1]:46540 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbfKSJ2R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 19 Nov 2019 04:28:17 -0500
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 33CF620193;
        Tue, 19 Nov 2019 10:28:15 +0100 (CET)
Received: from [192.168.108.51] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 1F5FB20415;
        Tue, 19 Nov 2019 10:28:15 +0100 (CET)
To:     GPIO <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Using a GPIO as an interrupt line
Message-ID: <f0d383f3-8efa-ae68-62af-68f69cd4143f@free.fr>
Date:   Tue, 19 Nov 2019 10:28:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue Nov 19 10:28:15 2019 +0100 (CET)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

The board I'm working on provides a TCA9539 I/O expander.
Or, as the datasheet(*) calls it, a "Low Voltage 16-Bit I2C and
SMBus Low-Power I/O Expander with Interrupt Output, Reset Pin,
and Configuration Registers"

(*) http://www.ti.com/lit/ds/symlink/tca9539.pdf

The binding is documented in Documentation/devicetree/bindings/gpio/gpio-pca953x.txt

I have some doubts about the interrupt output, described as:

Optional properties:
 - interrupts: interrupt specifier for the device's interrupt output.

In my board's DT, the I/O expander is described as:

	exp1: gpio@74 {
		compatible = "ti,tca9539";
		reg = <0x74>;
		gpio-controller;
		#gpio-cells = <2>;
		reset-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
		pinctrl-names = "default";
		pinctrl-0 = <&top_exp_rst>;
		interrupt-parent = <&tlmm>;
		interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
	};


("tlmm" is a pinctrl for qualcomm SoCs.)

The problem with this DT node is that nowhere have I specified that
the interrupt output is itself a GPIO line... I see other drivers
calling gpiod_to_irq() to handle this kind of setup. I assume this
function marks the GPIO as "used for interrupt, no longer available
as software-controlled GPIO"?

The tlmm node has the following properties:

	tlmm: pinctrl@03400000 {
		compatible = "qcom,msm8998-pinctrl";
		reg = <0x03400000 0xc00000>;
		interrupts = <0 208 0>;
		gpio-controller;
		#gpio-cells = <2>;
		interrupt-controller;
		#interrupt-cells = <2>;

Does gpio-controller and/or interrupt-controller mean something
is automagically happening when exp1's interrupts = <42 IRQ_TYPE_LEVEL_HIGH>
prop is being processed?

Or maybe I just have no idea what gpiod_to_irq() is used for?

I'd appreciate any help clearing my confusion.

Regards.

