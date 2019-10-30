Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99643E9B40
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 13:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfJ3MCR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 08:02:17 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46762 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfJ3MCR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 08:02:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UC28IS081325;
        Wed, 30 Oct 2019 07:02:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572436928;
        bh=deGeWsxl2NGlv/ZORhmQRP2LBTdRI7RQVc27Zn15SaM=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=jGjSaZO7k4xCh0ML52eeMLJ0DRF9T041rvLLckM4CY5aGSu1iuKFDldYBAVSknvsT
         Su1dVL345H3TT4MlrhWF9G/Dgu46Cxy1afD2kTWEHeYiIRuM64UNC05zmyIhCq/OOL
         jVzsI+pUPKF0Lxhr5grQLD3/O+HTrUENpoqI3RrM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UC28W5104385
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 07:02:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 07:02:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 07:01:54 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UC242e014998;
        Wed, 30 Oct 2019 07:02:05 -0500
Subject: Re: [RFC 0/2] gpio: Support for shared GPIO lines on boards
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <t-kristo@ti.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>
References: <20191030114530.872-1-peter.ujfalusi@ti.com>
Message-ID: <15adbc79-a0df-5c3e-fac4-cf8a3552abfe@ti.com>
Date:   Wed, 30 Oct 2019 14:03:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030114530.872-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 30/10/2019 13.45, Peter Ujfalusi wrote:
> Hi,
> 
> The shared GPIO line for external components tends to be a common issue and
> there is no 'clean' way of handling it.

I have missed Rob and the DT list from the recipients list, I'll send
the RFC v2 asap.

- Péter

> I'm aware of the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag, which must be provided when
> a driver tries to request a GPIO which is already in use.
> However the driver must know that the component is going to be used in such a
> way, which can be said to any external components with GPIO line, so in theory
> all drivers must set this flag when requesting the GPIO...
> 
> But with the GPIOD_FLAGS_BIT_NONEXCLUSIVE all clients have full control of the
> GPIO line. For example any device using the same GPIO as reset/enable line can
> reset/enable other devices, which is not something the other device might like
> or can handle.
> For example a device needs to be configured after it is enabled, but some other
> driver would reset it while handling the same GPIO -> the device is not
> operational anymmore as it lost it's configuration.
> 
> With the gpio-shared gpiochip we can overcome this by giving the gpio-shared
> the role of making sure that the GPIO line only changes state when it will not
> disturb any of the clients sharing the same GPIO line.
> 
> The 'sticky' state of the line depends on the board design, which can be
> communicated with the hold-active-state property:
> 
> GPIO_ACTIVE_HIGH: the line must be high as long as any of the clients want it to
> be high
> GPIO_ACTIVE_LOW: the line must be low as long as any of the clients want it to
> be low
> 
> In board DTS files it is just adding the node to descibe the shared GPIO line
> and point the users of this line to the shared-gpio node instead of the real
> GPIO.
> 
> Something like this:
> 
> codec_reset: gpio-shared0 {
> 	compatible = "gpio-shared";
> 	gpio-controller;
> 	#gpio-cells = <2>;
> 
> 	root-gpios = <&audio_exp 0 GPIO_ACTIVE_HIGH>;
> 
> 	branch-count = <2>;
> 	hold-active-state = <GPIO_ACTIVE_HIGH>;
> };
> 
> &main_i2c3 {
> 	audio_exp: gpio@21 {
> 		compatible = "ti,tca6416";
> 		reg = <0x21>;
> 		gpio-controller;
> 		#gpio-cells = <2>;
> 	};
> 
> 	pcm3168a_a: audio-codec@47 {
> 		compatible = "ti,pcm3168a";
> 		reg = <0x47>;
> 
> 		#sound-dai-cells = <1>;
> 
> 		rst-gpios = <&codec_reset 0 GPIO_ACTIVE_HIGH>;
> 		...
> 	};
> 
> 	pcm3168a_b: audio-codec@46 {
> 		compatible = "ti,pcm3168a";
> 		reg = <0x46>;
> 
> 		#sound-dai-cells = <1>;
> 
> 		rst-gpios = <&codec_reset 1 GPIO_ACTIVE_HIGH>;
> 		...
> 	};
> };
> 
> If any of the codec requests the GPIO to be high, the line will go up and will
> only going to be low when both of them set's their shared line to low.
> 
> Note: other option would be to have something similar to gpio-hog (gpio-shared)
> support in the core itself, but then all of the logic and state handling for the
> users of the shared line needs to be moved there.
> Simply counting the low and high requests would not work as the GPIO framework
> by design does not refcounts the state, iow gpio_set(0) three times and
> gpio_set(1) would set the line high.
> 
> I have also looked at the reset framework, but again it can not be applied in a
> generic way for GPIOs shared for other purposes and all existing drivers must
> be converted to use the reset framework (and adding a linux only warpper on top
> of reset GPIOs).
> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (2):
>   dt-bindings: gpio: Add binding document for shared GPIO
>   gpio: Add new driver for handling 'shared' gpio lines on boards
> 
>  .../devicetree/bindings/gpio/gpio-shared.yaml | 100 ++++++++
>  drivers/gpio/Kconfig                          |   6 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-shared.c                    | 229 ++++++++++++++++++
>  4 files changed, 336 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-shared.yaml
>  create mode 100644 drivers/gpio/gpio-shared.c
> 

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
