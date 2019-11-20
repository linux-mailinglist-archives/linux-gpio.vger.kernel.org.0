Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8116103C8E
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2019 14:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729776AbfKTNuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 08:50:07 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37242 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729591AbfKTNuG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 08:50:06 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKDntNk044995;
        Wed, 20 Nov 2019 07:49:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1574257795;
        bh=igM4FKkHdrSc7hws60TYIUKdxK6fHbvh4VrbAU0B0qg=;
        h=Subject:From:To:CC:References:Date:In-Reply-To;
        b=BzRe+u7s+vnkppJrguEj85EG3WqE4wAKog+ctPf92slMETrjH8ejv45M7RgYClLnm
         7+/Rkl5lJ+HUltj2xwbh3Ab+rpZjsbgtw8449hJwH5uxI85vrAmog7ky2FCKxWw9UC
         ylaQ2L3yk5qERQhTz/l0oCKpl5MADxkRn5VJ5Q6c=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAKDntBN009270
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 Nov 2019 07:49:55 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 20
 Nov 2019 07:49:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 20 Nov 2019 07:49:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKDnpEt093218;
        Wed, 20 Nov 2019 07:49:52 -0600
Subject: Re: [RFC 0/2] gpiolib: Initial, basic support for shared GPIO lines
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <robh+dt@kernel.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <mripard@kernel.org>, <p.zabel@pengutronix.de>,
        <devicetree@vger.kernel.org>
References: <20191120133409.9217-1-peter.ujfalusi@ti.com>
Message-ID: <4c7eeb1c-12b6-9073-3755-8ce1ffc803e4@ti.com>
Date:   Wed, 20 Nov 2019 15:49:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120133409.9217-1-peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 20/11/2019 15.34, Peter Ujfalusi wrote:
> Hi,
> 
> The initial support can replace all use of GPIOD_FLAGS_BIT_NONEXCLUSIVE if the
> shared GPIO is configured to follow pass through 'strategy' for the shared GPIO
> pin.
> 
> I have only implemented DT support.
> 
> With the shared gpio support one can choose between three different strategy for
> managing the shared gpio:
> refcounted low: Keep the line low as long as there is at least one low
> 		request is registered
> refcounted high: Keep the line high as long as there is at least one high
> 		request is registered
> pass through: all requests are allowed to go through without refcounting.
> 
> Few shortcomings as of now:
> - can not handle different GPIO_ACTIVE_ on the user side, both the root GPIO
>   (which is shared) and clients must have the same GPIO_ACTIVE_ mode.
>   We are using common gpio_desc.
>   Like with GPIOD_FLAGS_BIT_NONEXCLUSIVE
> - refcounting counts _all_ 1/0 requests coming from the users of the shared
>   GPIO. This could cause issues if clients are using the gpiod API in unbalanced
>   way.
>   We would need to have separate tracking for each of the clients and agregate
>   the level they are asking for at any moment. Basically a new gpio-chip on top
>   of the real gpio pin can solve this.

I forgot to add an example for DT.

I have this for two pcm3168a codec, their RST pin is connected to
tca6416's p0 pin.
The codec's RST line is low active, so the gpio-shared is configured to
refcounted high to make sure that a codec is not placed in reset when it
does not want it.

&main_i2c3 {
	#address-cells = <1>;
	#size-cells = <0>;

	audio_exp: gpio@21 {
		compatible = "ti,tca6416";
		reg = <0x21>;
		gpio-controller;
		#gpio-cells = <2>;

		p00 {
			gpio-shared;
			gpios = <0 GPIO_ACTIVE_LOW>;
			output-high;
			refcounted-high;
			line-name = "CODEC RESET";
		};
	};

	pcm3168a_a: audio-codec@47 {
		compatible = "ti,pcm3168a";
		reg = <0x47>;
		#sound-dai-cells = <1>;

		reset-gpios = <&audio_exp 0 GPIO_ACTIVE_LOW>;
	};

	pcm3168a_b: audio-codec@46 {
		compatible = "ti,pcm3168a";
		reg = <0x46>;
		#sound-dai-cells = <1>;

		reset-gpios = <&audio_exp 0 GPIO_ACTIVE_LOW>;
	};
};


> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (2):
>   dt-bindings: gpio: Document shared GPIO line usage
>   gpiolib: Support for (output only) shared GPIO line
> 
>  .../devicetree/bindings/gpio/gpio.txt         |  66 +++++++++
>  drivers/gpio/gpiolib-of.c                     |  28 +++-
>  drivers/gpio/gpiolib.c                        | 132 ++++++++++++++++--
>  drivers/gpio/gpiolib.h                        |  10 ++
>  4 files changed, 223 insertions(+), 13 deletions(-)
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
