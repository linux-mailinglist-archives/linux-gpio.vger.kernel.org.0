Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201EB337A4C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 18:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCKRBE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 12:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhCKRAt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 12:00:49 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1181C061574;
        Thu, 11 Mar 2021 09:00:48 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id y16so2821828wrw.3;
        Thu, 11 Mar 2021 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nv3Bt+wyhmaUxolKz9s/4n1ecqoVoh5mx8YPZNvPh5A=;
        b=hMzqZ1F2YrouFiYVDdAsPduxuFF7r7u6RKxggfl1N2v4ambqH25aN+n4WdDvPQBULZ
         fU4SEZ+kTfGCz4TM+OJqagrCL13DKDdYysgjnpEXkuPOTB04kUntblYK9+oragdTwlF2
         Z2Ur84DKnXqnCdg1d7KEJo59nSbvpmkjW1T2wOQeCtSxdpZ/pHS/uqCZfmUQDrDwtv5n
         EIuEqErhaRCDRSupI0RDGbAOKBM3ft4MtMVR7sx1vXt349DsTCiks2OgFFcxhxIjWHtm
         nM0fMwAuA7mEPKeZ8ysDcxcBrb7kVOvnbzXXGm0Doy5Y+sHog+p01jbmtROXex+J8tei
         LA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nv3Bt+wyhmaUxolKz9s/4n1ecqoVoh5mx8YPZNvPh5A=;
        b=ennnktnS7PU+ep6PLzqSO+SSpIv82GU94adY1OaY4dIaPI/pLPtjLqCa3hZdpROev/
         +b/Tl6MK/HSPcYkVa8lOPVki/Tsa5jySGjCwaVJMzBAyYkwvLor3kdSuGVAso1Gu4pn5
         hZVazKTqjE7sugp1XbwmO+icnSXbqXPEWpicJ309OQEArUResRVCL7W+mhl02Ot3X+8C
         cfKww8sd6+sn4HcIGaMNfSKTAPhyV4KqaYr+gV5euT+AOwXBpGy5iMcEn8y0tdD5DIhZ
         91AzDYi2vEXAQ1qz3x6bOJXhc574m8r07eRYMyLDue8MK3YWVTw2QXTLx/FM81Hwh3iH
         kwgQ==
X-Gm-Message-State: AOAM532Lf0TEm2GoFJ7ZmtR6cFMM6LExIjnxW2uxgRgTIUpGMy5MVznb
        ZCQvaOwUK0/UE3tXGSSPpgM=
X-Google-Smtp-Source: ABdhPJzz11W/uZTQgu7aNOz29beMG8pW503e2hxP/UDzv94J+4At0QolFNVnWW8yEDTZoXCY8aV1XQ==
X-Received: by 2002:a5d:6703:: with SMTP id o3mr9643855wru.357.1615482042083;
        Thu, 11 Mar 2021 09:00:42 -0800 (PST)
Received: from [192.168.1.10] ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id a6sm5011778wmm.0.2021.03.11.09.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 09:00:41 -0800 (PST)
Subject: Re: [PATCH v6 03/15] pinctrl: bcm: add bcm63xx base code
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-4-noltari@gmail.com>
 <CAL_JsqKZA-j2iXvVTXWtiuyKPOWeOUP0r+x-bV6QP6=_moy2VA@mail.gmail.com>
 <CACRpkda=isBSW8BwYJ2pCaPcByRoo2GFNVoZCxhaCbEKk9iNsg@mail.gmail.com>
 <CAL_Jsq+FfYE2SrzwB_A=d-LMut-JrqdivKz6x8EQhkc3Zh5NAA@mail.gmail.com>
 <CACRpkdaMYy_Z34i+0uRgciC=xBtoeNsWViHU9ZysvxqrFXB5+w@mail.gmail.com>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <edb31609-e138-9844-7168-004c882cae97@gmail.com>
Date:   Thu, 11 Mar 2021 18:00:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaMYy_Z34i+0uRgciC=xBtoeNsWViHU9ZysvxqrFXB5+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob and Linus,

El 11/03/2021 a las 17:13, Linus Walleij escribió:
> On Thu, Mar 11, 2021 at 3:58 PM Rob Herring <robh+dt@kernel.org> wrote:
>> On Wed, Mar 10, 2021 at 6:09 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Wed, Mar 10, 2021 at 6:51 PM Rob Herring <robh+dt@kernel.org> wrote:
>>>
>>>>> +static const struct of_device_id bcm63xx_gpio_of_match[] = {
>>>>> +       { .compatible = "brcm,bcm6318-gpio", },
>>>>> +       { .compatible = "brcm,bcm6328-gpio", },
>>>>> +       { .compatible = "brcm,bcm6358-gpio", },
>>>>> +       { .compatible = "brcm,bcm6362-gpio", },
>>>>> +       { .compatible = "brcm,bcm6368-gpio", },
>>>>> +       { .compatible = "brcm,bcm63268-gpio", },
>>>>
>>>> All these would be moved to gpio-mmio.c (or maybe that can have a
>>>> fallback compatible?).
>>>
>>> This is gpio-regmap.c and it can only be used as a library
>>> by a certain driver. gpio-mmio.c can be used stand-alone
>>> for certain really simple hardware (though most use that
>>> as a library as well).
>>
>> I don't really care which one is used, but the problem is that this
>> choice is leaking into the binding design.
> 
> Aha I guess I misunderstood your comment.
> 
>> The primary problem here is
>> once someone uses regmap, then they think they must have a syscon and
>> can abandon using 'reg' and normal address properties as Linux happens
>> to not use them (currently). I think we really need some better regmap
>> vs. mmio handling to eliminate this duplication of foo-mmio and
>> foo-regmap drivers and difference in binding design. Not sure exactly
>> what that looks like, but basically some sort of 'reg' property to
>> regmap creation.
> 
> I see the problem. Yeah we should try to be more strict around
> these things. To me there are syscons and "other regmaps",
> where syscon is a real hurdle of registers while "other regmaps"
> are just regmaps by convenience.
> 
> Documentation/devicetree/bindings/mfd/syscon.yaml
> describes what a syscon really is so if everyone could
> just read the documentation that would be great ...
> 
>> Given we already have a Broadcom GPIO binding for what looks to be
>> similar to this one, I'm left wondering what's the real difference
>> here?
> 
> Which one is similar? I can take a look.

@Linus I think @Rob is referring to brcm,bcm6345-gpio:
https://github.com/torvalds/linux/blob/a74e6a014c9d4d4161061f770c9b4f98372ac778/drivers/gpio/gpio-mmio.c#L686

However, the real difference between BCM6345 (and BCM6338) is that these 
SoCs have no pin controller at all, only a GPIO controller:

BCM6345:
typedef struct GpioControl {
   uint16        unused0;
   byte          unused1;
   byte          TBusSel;
   uint16        unused2;
   uint16        GPIODir;
   byte          unused3;
   byte          Leds;
   uint16        GPIOio;
   uint32        UartCtl;
} GpioControl;

BCM6338:
typedef struct GpioControl {
   uint32        unused0;
   uint32        GPIODir;      /* bits 7:0 */
   uint32        unused1;
   uint32        GPIOio;       /* bits 7:0 */
   uint32        LEDCtrl;
   uint32        SpiSlaveCfg;
   uint32        vRegConfig;
} GpioControl;

BCM6348 and newer also have pinctrl.
That's the main difference between that driver @Rob's referring to and 
the ones in this patch series.

> 
> We currently have four Broadcom GPIO bindings,
> which are stand alone GPIO blocks and eight Broadcom
> pin controllers that all do GPIO as well.
> 
> This family of pin controllers are (as per subject) is
> the bcm63xx series which is a MIPS-based family of SoCs
> found in routers, top bindings in
> Documentation/devicetree/bindings/mips/brcm/soc.txt
> These all have a GPIO block as part of the pin controller
> and the GPIO block is a distinct sub-function of the
> pin controller, and it has up to 32 GPIOs per block,
> hence it has its own subnode inside the pin controller.
> 
> This driver follows the pattern of the Ingenic
> pin controller, another MIPS SoC:
> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
> 
> Another SoC with several GPIO blocks inside the pin
> controller is SparX5 and that also follows this pattern:
> Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> (This has an example with more than one GPIO block
> inside the pin controller.)
> 
> Yours,
> Linus Walleij
> 
