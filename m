Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C371AA3FE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2020 15:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506209AbgDONPt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 09:15:49 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49160 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505099AbgDONPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 09:15:43 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03FDFW7K072672;
        Wed, 15 Apr 2020 08:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1586956532;
        bh=ZoOgY9+C5dQVf6mcmFiWsFaUClaZkhoQYaPRtZS4H4A=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fXoHUS+faSbW95u/pTN/NLlCXB+MKDjLVruwONhJr/N4pbqCYchG/J6Bl77NDzrXq
         Ozezi0DXpffJDJ0UVhH1FoQbzy8NE6ZWo6w2IdwThlYwKzQu4Z3NSTSeDY9Q6GkMMr
         n0KQ1LVZhMzRmNo7ywD5sL2k1qWelihDdc7HGAAA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03FDFWDj119718
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Apr 2020 08:15:32 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 15
 Apr 2020 08:15:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 15 Apr 2020 08:15:32 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03FDFS3o011255;
        Wed, 15 Apr 2020 08:15:29 -0500
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
To:     Drew Fustini <drew@pdp7.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>
CC:     Drew Fustini <pdp7pdp7@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
Date:   Wed, 15 Apr 2020 16:15:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200413123921.GA32586@x1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 13/04/2020 15:39, Drew Fustini wrote:
> On Fri, Mar 13, 2020 at 01:23:15PM +0800, Haojian Zhuang wrote:
>> On Fri, 13 Mar 2020 at 08:38, Drew Fustini <pdp7pdp7@gmail.com> wrote:
>>>
>>> On Thu, Mar 12, 2020 at 1:43 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>>> Do we have a datasheet for this GPIO block somewhere? Should
>>>> be the datasheet for the ASIC.
>>>
>>> I am looking at the AM335x reference manual [0] but I can not actually
>>> find any references to pull-up/down or bias for GPIO pins.  I guess I
>>> was making of the mistake of assuming this would be something the gpio
>>> pins support.
>>>
>>>> We already have the required .set_config() callback on the OMAP
>>>> driver, it's just that it only uses it for debounce.
>>>>
>>>> The driver is a bit convoluted with register offsets in a struct
>>>> omap_gpio_reg_offs depending on variant, but if they have
>>>> a register for this I'd say just get hacking.
>>>>
>>>> If the GPIO driver is using pin control as back-end you are
>>>> looking at something more complex similar to what Intel is
>>>> doing inside drivers/pinctrl/intel/pinctrl-intel.c: this driver
>>>> is just calling up to gpiochip_generic_config() which will
>>>> try to configure the lines behind the GPIO using pin config,
>>>> which works if the proper ranges are defined so the
>>>> framework can map a GPIO line to a pin control pin.
>>>
>>> Thank you for the feedback, Linus.
>>>
>>> Upon further review of drivers/pinctrl/pinctrl-single.c, I am not
>>> certain it actually supports pull-up/down.
>>>
>>> I see there is pcs_pinconf_clear_bias() and pcs_pinconf_bias_disable()
>>> but I don't see a place where the PIN_CONFIG_BIAS_PULL_DOWN or
>>> PIN_CONFIG_BIAS_PULL_UP get set.
>>>
>>
>>                          /* 4 parameters */
>>                          case PIN_CONFIG_BIAS_DISABLE:
>>                                  pcs_pinconf_clear_bias(pctldev, pin);
>>                                  break;
>>                          case PIN_CONFIG_BIAS_PULL_DOWN:
>>                          case PIN_CONFIG_BIAS_PULL_UP:
>>                                  if (arg)
>>                                          pcs_pinconf_clear_bias(pctldev, pin);
>>                                  /* fall through */
>>                          case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
>>                                  data &= ~func->conf[i].mask;
>>                                  if (arg)
>>                                          data |= func->conf[i].enable;
>>                                  else
>>                                          data |= func->conf[i].disable;
>>                                  break;
>>
>> Because it does fall through, pullup/pulldown is set in the snippet of
>> "PIN_CONFIG_INPUT_SCHMITT_ENABLE".
>>
>> Best Regards
>> Haojian
> 
> Thank you for the insights, Haojian and Linus.
> 
> I've added debug print statements and it seems that pcs_pinconf_set()
> is never called on the BeagleBone (TI AM3358) either during boot or
> when gpiomon runs with bias switch that invokes GPIO_GET_LINEEVENT_IOCTL
> with GPIOHANDLE_REQUEST_BIAS_PULL_UP flag.
> 
> The pinctrl-single driver and gpio-omap driver bind as a result of these
> device tree nodes in arch/arm/boot/dts/am33xx-l4.dtsi:
> 
>      am33xx_pinmux: pinmux@800 {
>          compatible = "pinctrl-single";
>          reg = <0x800 0x238>;
>          #pinctrl-cells = <1>;
>          pinctrl-single,register-width = <32>;
>          pinctrl-single,function-mask = <0x7f>;
>      };
> 
>      gpio0: gpio@0 {
>          compatible = "ti,omap4-gpio";
>          gpio-controller;
>          #gpio-cells = <2>;
>          interrupt-controller;
>          #interrupt-cells = <2>;
>          reg = <0x0 0x1000>;
>          interrupts = <96>;
>          gpio-line-names =
>          "MDIO_DATA",    // 0
>          <snip>
> 
> I see in Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> 
>      "pinctrl-single" means that pinconf isn't supported.
> 
> I believe this is why pcs_pinconf_set() never gets called.
> 
> Any suggestions as to how I could proceed?
> 
> Is it reasonable to change the compatible to "pinconf-single"?

For this platforms the dynamic GPIO muxing/configuration is not supported, and GPIO block by itself
does not provide such functions as pullup/pulldown.

Before use the pin has to be configured like;
&am33xx_pinmux {

	user_leds_s0: user_leds_s0 {
		pinctrl-single,pins = <
			AM33XX_PADCONF(AM335X_PIN_GPMC_A5, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_a5.gpio1_21 */
			AM33XX_PADCONF(AM335X_PIN_GPMC_A6, PIN_OUTPUT_PULLUP, MUX_MODE7)	/* gpmc_a6.gpio1_22 */
			AM33XX_PADCONF(AM335X_PIN_GPMC_A7, PIN_OUTPUT_PULLDOWN, MUX_MODE7)	/* gpmc_a7.gpio1_23 */
			AM33XX_PADCONF(AM335X_PIN_GPMC_A8, PIN_OUTPUT_PULLUP, MUX_MODE7)	/* gpmc_a8.gpio1_24 */
		>;
	};

	mmc1_pins: pinmux_mmc1_pins {
		pinctrl-single,pins = <
			AM33XX_PADCONF(AM335X_PIN_SPI0_CS1, PIN_INPUT, MUX_MODE7)		/* spio0_cs1.gpio0_6 */


-- 
Best regards,
grygorii
