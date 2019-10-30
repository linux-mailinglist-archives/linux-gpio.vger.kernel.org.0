Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1E40E9B00
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 12:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfJ3Loh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 07:44:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44758 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3Loh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 07:44:37 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UBiQfA074905;
        Wed, 30 Oct 2019 06:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572435866;
        bh=nlVr6Zj9+j0vCKO0OY9fSOQFWnGg/l/NYJihfhV2J2g=;
        h=From:To:CC:Subject:Date;
        b=RgatHrPxo2Qk0S5LfG5lMAsKmRmuhWcfQ9Tcx+2t6LoYftkhRtEO0vHf/JSFcYPWl
         xO2pH2PSCt1MW/f0e0hHWAF36vH63zBdL4SeUbcGvJXTkXS8A0ORlA+p3vNQWtZaq3
         KJMa7v5xtB9qNyJvygaHk6HlZ/cfzQh+xq3t9vQw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UBiQuT090539
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 06:44:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 06:44:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 06:44:13 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UBiMSv006902;
        Wed, 30 Oct 2019 06:44:23 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <t-kristo@ti.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>
Subject: [RFC 0/2] gpio: Support for shared GPIO lines on boards
Date:   Wed, 30 Oct 2019 13:45:28 +0200
Message-ID: <20191030114530.872-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

The shared GPIO line for external components tends to be a common issue and
there is no 'clean' way of handling it.

I'm aware of the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag, which must be provided when
a driver tries to request a GPIO which is already in use.
However the driver must know that the component is going to be used in such a
way, which can be said to any external components with GPIO line, so in theory
all drivers must set this flag when requesting the GPIO...

But with the GPIOD_FLAGS_BIT_NONEXCLUSIVE all clients have full control of the
GPIO line. For example any device using the same GPIO as reset/enable line can
reset/enable other devices, which is not something the other device might like
or can handle.
For example a device needs to be configured after it is enabled, but some other
driver would reset it while handling the same GPIO -> the device is not
operational anymmore as it lost it's configuration.

With the gpio-shared gpiochip we can overcome this by giving the gpio-shared
the role of making sure that the GPIO line only changes state when it will not
disturb any of the clients sharing the same GPIO line.

The 'sticky' state of the line depends on the board design, which can be
communicated with the hold-active-state property:

GPIO_ACTIVE_HIGH: the line must be high as long as any of the clients want it to
be high
GPIO_ACTIVE_LOW: the line must be low as long as any of the clients want it to
be low

In board DTS files it is just adding the node to descibe the shared GPIO line
and point the users of this line to the shared-gpio node instead of the real
GPIO.

Something like this:

codec_reset: gpio-shared0 {
	compatible = "gpio-shared";
	gpio-controller;
	#gpio-cells = <2>;

	root-gpios = <&audio_exp 0 GPIO_ACTIVE_HIGH>;

	branch-count = <2>;
	hold-active-state = <GPIO_ACTIVE_HIGH>;
};

&main_i2c3 {
	audio_exp: gpio@21 {
		compatible = "ti,tca6416";
		reg = <0x21>;
		gpio-controller;
		#gpio-cells = <2>;
	};

	pcm3168a_a: audio-codec@47 {
		compatible = "ti,pcm3168a";
		reg = <0x47>;

		#sound-dai-cells = <1>;

		rst-gpios = <&codec_reset 0 GPIO_ACTIVE_HIGH>;
		...
	};

	pcm3168a_b: audio-codec@46 {
		compatible = "ti,pcm3168a";
		reg = <0x46>;

		#sound-dai-cells = <1>;

		rst-gpios = <&codec_reset 1 GPIO_ACTIVE_HIGH>;
		...
	};
};

If any of the codec requests the GPIO to be high, the line will go up and will
only going to be low when both of them set's their shared line to low.

Note: other option would be to have something similar to gpio-hog (gpio-shared)
support in the core itself, but then all of the logic and state handling for the
users of the shared line needs to be moved there.
Simply counting the low and high requests would not work as the GPIO framework
by design does not refcounts the state, iow gpio_set(0) three times and
gpio_set(1) would set the line high.

I have also looked at the reset framework, but again it can not be applied in a
generic way for GPIOs shared for other purposes and all existing drivers must
be converted to use the reset framework (and adding a linux only warpper on top
of reset GPIOs).

Regards,
Peter
---
Peter Ujfalusi (2):
  dt-bindings: gpio: Add binding document for shared GPIO
  gpio: Add new driver for handling 'shared' gpio lines on boards

 .../devicetree/bindings/gpio/gpio-shared.yaml | 100 ++++++++
 drivers/gpio/Kconfig                          |   6 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-shared.c                    | 229 ++++++++++++++++++
 4 files changed, 336 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-shared.yaml
 create mode 100644 drivers/gpio/gpio-shared.c

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

