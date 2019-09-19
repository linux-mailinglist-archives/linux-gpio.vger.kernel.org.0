Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE9C7B7F0A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 18:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404278AbfISQ0Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 12:26:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40267 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404291AbfISQ0V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2019 12:26:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id l3so3745144wru.7
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=eb8f6VuJqsSMS2/D/ckOQPK7W3A97rYvCXWb3UVC6+4=;
        b=0TbJzFxYZopHqvYwhH1BVVBEYrOmtm1w81nyw8Wyw5JulXLOQOjIYq9hyFlcqfF52/
         byLel52p0mJoHcWGe0iYOuZz4+2JFKTd2D7s0t/uPjlZFX2AV7vj0De/JaH0kw/gh1OH
         fE8W8IHheejwM8ReGx87CVquAnConNpINqlWgRJBXyQlkXQaz6xFoMCNNY0fBWxc3+93
         2w1riLyGAZd1mX9ujVzUNWAtUGpNmZk38oQ9RBU7ds2NCOOOQe1+BqCa7q2LzkWDDJk7
         RBkbkf7r6w2IRiOOiY0M/9mDwYCDgPCcZ1F+2fvKXBPMRen/ng4R6NFp8oVq7StCIKNt
         ubVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=eb8f6VuJqsSMS2/D/ckOQPK7W3A97rYvCXWb3UVC6+4=;
        b=bxuCNE9MUQ5Kq/EFpUySb/gO6CnusDlRlmtqOT2sFBpT2+QV7zD3B9i2as8LtYNWue
         kHf53ZrlYvpjAu2Ej/4zHk5PNzzVE6BuKp9Pg4ENf/YlSpKMaeeK2G4l9LGK0BKvn0tw
         rHR2I8WnzJT1Y8pB6k21tDd91s/0P5WWiH+SEeT1W/XvXKFcj5bVD8JoU6XLQKNvX+cU
         jedZBY4dbvx+N243JgRzq/lOuzyk4DrBhH4NxdGXMKs3bKZ32kguTIbqmxYJMeVC9DUn
         VyakHOjv38TFMRaANj1iC2g6KowhPHPILwmV4uyvH1FgZEqr26iHVfE/FY3/70sIAIsI
         h27w==
X-Gm-Message-State: APjAAAWdu/+qymHJPLEYeVRLiVqFjGaLn48pdDrtGq/dpSkUjvKuklst
        vVwR5lOOx21YkeAKWKZtSzg1ZA==
X-Google-Smtp-Source: APXvYqwTyge27dKIdDfTXksz1QHnAKrUp59hkcTX1p/cAbYcmRmSomHcTOHZ1TvU0jQsbUUt0YXudQ==
X-Received: by 2002:a5d:6647:: with SMTP id f7mr8068290wrw.170.1568910377158;
        Thu, 19 Sep 2019 09:26:17 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h26sm19458181wrc.13.2019.09.19.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 09:26:16 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: meson-a1: add pinctrl driver for Meson A1 Soc
In-Reply-To: <45b97927-c771-808a-b214-509af6c16931@amlogic.com>
References: <1568700442-18540-1-git-send-email-qianggui.song@amlogic.com> <1568700442-18540-3-git-send-email-qianggui.song@amlogic.com> <1jef0f46fj.fsf@starbuckisacylon.baylibre.com> <73dc56bd-d6c5-1de7-e97e-91479a89a29e@amlogic.com> <1j8sqn3tjt.fsf@starbuckisacylon.baylibre.com> <45b97927-c771-808a-b214-509af6c16931@amlogic.com>
Date:   Thu, 19 Sep 2019 18:26:15 +0200
Message-ID: <1jk1a4b6c8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 18 Sep 2019 at 14:36, Qianggui Song <qianggui.song@amlogic.com> wrote:

> On 2019/9/17 22:07, Jerome Brunet wrote:
>> 
>> On Tue 17 Sep 2019 at 13:51, Qianggui Song <qianggui.song@amlogic.com> wrote:
>>>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>>>>> index 8bba9d0..885b89d 100644
>>>>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>>>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>>>>> @@ -688,8 +688,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>>>>  
>>>>>  	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
>>>>>  	if (IS_ERR(pc->reg_ds)) {
>>>>> -		dev_dbg(pc->dev, "ds registers not found - skipping\n");
>>>>> -		pc->reg_ds = NULL;
>>>>> +		if (pc->data->reg_layout == A1_LAYOUT) {
>>>>> +			pc->reg_ds = pc->reg_pullen;
>>>>
>>>> IMO, this kind of ID based init fixup is not going to scale and will
>>>> lead to something difficult to maintain in the end.
>>>>
>>>> The way the different register sets interract with each other is already
>>>> pretty complex to follow.
>>>>
>>>> You could rework this in 2 different ways:
>>>> #1 - Have the generic function parse all the register sets and have all
>>>> drivers provide a specific (as in gxbb, gxl, axg, etc ...)  function to :
>>>>  - Verify the expected sets have been provided
>>>>  - Make assignement fixup as above if necessary
>>>>
>>>> #2 - Rework the driver to have only one single register region
>>>>  I think one of your colleague previously mentionned this was not
>>>>  possible. It is still unclear to me why ...
>>>>
>>> Appreciate your advice.  I have an idea based on #1, how about providing
>>> only two dt parse function, one is for chips before A1(the old one),
>>> another is for A1 and later chips that share the same layout. Assign
>>> these two functions to their own driver.
>> 
>> That's roughly the same thing as your initial proposition with function
>> pointer instead of IDs ... IMO, this would still be a quick fix to
>> address your immediate topic instead of dealing with the driver as
>> whole, which is my concern here.
>> 
> For #1. It would be like
> generic_parse_dt()
> {
> 	1. parse all register regions (mux gpio pull pull_en ds)
> 	
> 	2. call  specific function through function pointer in
>  	   meson_pinctrl_data.(each platform should have AO and EE two
>            specific functions for they are not the same)
> 	{
> 		do work you mentioned above
> 	}
> }
> right ?
> If that so, maybe there are a lot of duplicated codes

Only if you make it so. Providing a callback and duplicating code are
not the same thing

> for most Socs share the same reg layout.

That's not really accurate:

So far they all have the "mux" and "gpio" region but

gxbb, gxl, axg, meson8 EE:
 has: pull, pull-en
 remap: non
 unsupported: ds

gxbb, gxl, axg, meson8 AO:
 has: pull
 remap: pull-en -> pull
 unsupported: ds

g12 and sm1 EE:
 has: pull, pull-en, ds
 remap: none

g12 and sm1 AO:
 has: ds
 remap: pull->gpio, pull_en->gpio

And now a1 chip remaps "ds" to "pull_en" ...

As said previouly all this is getting pretty difficult to follow and
maintain. Adding a proper callback for each meson pinctrl would make the
above explicit in the code ... which helps maintain thing, at least for
a while ...

Judging by the offsets between those regions, I still think one single
region would make things a whole lot simpler. If it is not possible to
map it with one single region, could you tell us why ? What non-pinctrl
related device do we have there ?

> So I guess five specific functions are
> enough: AXG and before(ao,ee), G12A(ao,ee) and A1(will place them in
> pinctrl_meson.c). Since m8 to AXG are the same register layout for both
> ee and ao, G12A with new feature ds and new ao register layout.
>
> Or I misunderstood the #1 ?
>>>>> +		} else {
>>>>> +			dev_dbg(pc->dev, "ds registers not found - skipping\n");
>>>>> +			pc->reg_ds = NULL;
>>>>> +		}
>>>>>  	}
>>>>>  
>>>>>  	return 0;
>>>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>>>>> index c696f32..3d0c58d 100644
>>>>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>>>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>>>>> @@ -80,6 +80,14 @@ enum meson_pinconf_drv {
>>>>>  };
>>>>>  
>>>>>  /**
>>>>> + * enum meson_reg_layout - identify two types of reg layout
>>>>> + */
>>>>> +enum meson_reg_layout {
>>>>> +	LEGACY_LAYOUT,
>>>>> +	A1_LAYOUT,
>>>>> +};
>>>>> +
>>>>> +/**
>>>>>   * struct meson bank
>>>>>   *
>>>>>   * @name:	bank name
>>>>> @@ -114,6 +122,7 @@ struct meson_pinctrl_data {
>>>>>  	unsigned int num_banks;
>>>>>  	const struct pinmux_ops *pmx_ops;
>>>>>  	void *pmx_data;
>>>>> +	unsigned int reg_layout;
>>>>>  };
>>>>>  
>>>>>  struct meson_pinctrl {
>>>>
>>>> .
>>>>
>> 
>> .
>> 
