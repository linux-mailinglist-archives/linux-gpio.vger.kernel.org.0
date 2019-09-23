Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E45FBAE7A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2019 09:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393490AbfIWH2G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Sep 2019 03:28:06 -0400
Received: from mail-sz.amlogic.com ([211.162.65.117]:32336 "EHLO
        mail-sz.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393460AbfIWH2F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Sep 2019 03:28:05 -0400
Received: from [10.28.18.45] (10.28.18.45) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 23 Sep
 2019 15:29:00 +0800
Subject: Re: [PATCH 2/3] pinctrl: meson-a1: add pinctrl driver for Meson A1
 Soc
To:     Jerome Brunet <jbrunet@baylibre.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <1568700442-18540-1-git-send-email-qianggui.song@amlogic.com>
 <1568700442-18540-3-git-send-email-qianggui.song@amlogic.com>
 <1jef0f46fj.fsf@starbuckisacylon.baylibre.com>
 <73dc56bd-d6c5-1de7-e97e-91479a89a29e@amlogic.com>
 <1j8sqn3tjt.fsf@starbuckisacylon.baylibre.com>
 <45b97927-c771-808a-b214-509af6c16931@amlogic.com>
 <1jk1a4b6c8.fsf@starbuckisacylon.baylibre.com>
From:   Qianggui Song <qianggui.song@amlogic.com>
Message-ID: <2c476d5b-2c16-ede0-58c3-d83b286b7d8a@amlogic.com>
Date:   Mon, 23 Sep 2019 15:29:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1jk1a4b6c8.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.28.18.45]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2019/9/20 0:26, Jerome Brunet wrote:
> On Wed 18 Sep 2019 at 14:36, Qianggui Song <qianggui.song@amlogic.com> wrote:
> 
>> On 2019/9/17 22:07, Jerome Brunet wrote:
>>>
>>> On Tue 17 Sep 2019 at 13:51, Qianggui Song <qianggui.song@amlogic.com> wrote:
>>>>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>>>>>> index 8bba9d0..885b89d 100644
>>>>>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>>>>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>>>>>> @@ -688,8 +688,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>>>>>  
>>>>>>  	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
>>>>>>  	if (IS_ERR(pc->reg_ds)) {
>>>>>> -		dev_dbg(pc->dev, "ds registers not found - skipping\n");
>>>>>> -		pc->reg_ds = NULL;
>>>>>> +		if (pc->data->reg_layout == A1_LAYOUT) {
>>>>>> +			pc->reg_ds = pc->reg_pullen;
>>>>>
>>>>> IMO, this kind of ID based init fixup is not going to scale and will
>>>>> lead to something difficult to maintain in the end.
>>>>>
>>>>> The way the different register sets interract with each other is already
>>>>> pretty complex to follow.
>>>>>
>>>>> You could rework this in 2 different ways:
>>>>> #1 - Have the generic function parse all the register sets and have all
>>>>> drivers provide a specific (as in gxbb, gxl, axg, etc ...)  function to :
>>>>>  - Verify the expected sets have been provided
>>>>>  - Make assignement fixup as above if necessary
>>>>>
>>>>> #2 - Rework the driver to have only one single register region
>>>>>  I think one of your colleague previously mentionned this was not
>>>>>  possible. It is still unclear to me why ...
>>>>>
>>>> Appreciate your advice.  I have an idea based on #1, how about providing
>>>> only two dt parse function, one is for chips before A1(the old one),
>>>> another is for A1 and later chips that share the same layout. Assign
>>>> these two functions to their own driver.
>>>
>>> That's roughly the same thing as your initial proposition with function
>>> pointer instead of IDs ... IMO, this would still be a quick fix to
>>> address your immediate topic instead of dealing with the driver as
>>> whole, which is my concern here.
>>>
>> For #1. It would be like
>> generic_parse_dt()
>> {
>> 	1. parse all register regions (mux gpio pull pull_en ds)
>> 	
>> 	2. call  specific function through function pointer in
>>  	   meson_pinctrl_data.(each platform should have AO and EE two
>>            specific functions for they are not the same)
>> 	{
>> 		do work you mentioned above
>> 	}
>> }
>> right ?
>> If that so, maybe there are a lot of duplicated codes
> 
> Only if you make it so. Providing a callback and duplicating code are
> not the same thing
> 
>> for most Socs share the same reg layout.
> 
> That's not really accurate:
> 
> So far they all have the "mux" and "gpio" region but
> 
> gxbb, gxl, axg, meson8 EE:
>  has: pull, pull-en
>  remap: non
>  unsupported: ds
> 
> gxbb, gxl, axg, meson8 AO:
>  has: pull
>  remap: pull-en -> pull
>  unsupported: ds
> 
> g12 and sm1 EE:
>  has: pull, pull-en, ds
>  remap: none
> 
> g12 and sm1 AO:
>  has: ds
>  remap: pull->gpio, pull_en->gpio
> 
> And now a1 chip remaps "ds" to "pull_en" ...
> 
> As said previouly all this is getting pretty difficult to follow and
> maintain. Adding a proper callback for each meson pinctrl would make the
> above explicit in the code ... which helps maintain thing, at least for
> a while ...
> 
> Judging by the offsets between those regions, I still think one single
> region would make things a whole lot simpler. If it is not possible to
> map it with one single region, could you tell us why ? What non-pinctrl
> related device do we have there ?
>Here I mean duplicated is that m8/m8b/gxl/gxbb/axg use the same layout,
while g12a/b/sm1 are the same, so don't need to implement every Socs
parser functions just as I said below AXG type for m8/m8b/gxl/gxbb/axg,
g12a type for g12a/b/sm1, the last one is for a1. three types functions
(with ao and ee) can cover all platform. But I still consider that
providing an extra meson_a1_pasert_dt like function for a1 or later is
more simpler.

The reason why we can not use one single region for previous Socs, it'
that there is non-pinctrl related device for some Socs region.
Take an example for g12a:

#define	PREG_PAD_GPIO0_EN_N	(0xff634400 + (0x010 << 2))
#define	PREG_PAD_GPIO0_O	(0xff634400 + (0x011 << 2))
#define	PREG_PAD_GPIO0_I	(0xff634400 + (0x012 << 2))

	...continue region...

#define	PAD_PULL_UP_EN_REG5	(0xff634400 + (0x04d << 2))

	... ETH/NAND/VPU/TIMER...  a lot of no-pinctrl registers

#define	PERIPHS_PIN_MUX_0	(0xff634400 + (0x0b0 << 2))

	...continue region...

#define	PERIPHS_PIN_MUX_F	(0xff634400 + (0x0bf << 2))

	...no use region...

#define	EFUSE_CFG_LOCK		(0xff634400 + (0x0c0 << 2))

	...other EFUSE relative registers...
	...no use region...

#define	PAD_DS_REG0A		(0xff634400 + (0x0d0 << 2))

	...continue region for all ds...

#define	PAD_DS_REG5A		(0xff634400 + (0x0d6 << 2))

So from the above we can see there are lots of other registers between
gpio and ds register.When map gpio to ds region, they will bury a lot of
other registers.

>> So I guess five specific functions are
>> enough: AXG and before(ao,ee), G12A(ao,ee) and A1(will place them in
>> pinctrl_meson.c). Since m8 to AXG are the same register layout for both
>> ee and ao, G12A with new feature ds and new ao register layout.
>>
>> Or I misunderstood the #1 ?
>>>>>> +		} else {
>>>>>> +			dev_dbg(pc->dev, "ds registers not found - skipping\n");
>>>>>> +			pc->reg_ds = NULL;
>>>>>> +		}
>>>>>>  	}
>>>>>>  
>>>>>>  	return 0;
>>>>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>>>>>> index c696f32..3d0c58d 100644
>>>>>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>>>>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>>>>>> @@ -80,6 +80,14 @@ enum meson_pinconf_drv {
>>>>>>  };
>>>>>>  
>>>>>>  /**
>>>>>> + * enum meson_reg_layout - identify two types of reg layout
>>>>>> + */
>>>>>> +enum meson_reg_layout {
>>>>>> +	LEGACY_LAYOUT,
>>>>>> +	A1_LAYOUT,
>>>>>> +};
>>>>>> +
>>>>>> +/**
>>>>>>   * struct meson bank
>>>>>>   *
>>>>>>   * @name:	bank name
>>>>>> @@ -114,6 +122,7 @@ struct meson_pinctrl_data {
>>>>>>  	unsigned int num_banks;
>>>>>>  	const struct pinmux_ops *pmx_ops;
>>>>>>  	void *pmx_data;
>>>>>> +	unsigned int reg_layout;
>>>>>>  };
>>>>>>  
>>>>>>  struct meson_pinctrl {
>>>>>
>>>>> .
>>>>>
>>>
>>> .
>>>
> 
> .
> 
