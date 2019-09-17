Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66873B4FEB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 16:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfIQOHi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 10:07:38 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38533 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfIQOHi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 10:07:38 -0400
Received: by mail-wr1-f65.google.com with SMTP id l11so3327770wrx.5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2019 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:references:user-agent:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=klNvHmn4dmHfYFGr5swA66ym/DQGM3Z/kdqx0uiahpE=;
        b=NSecsQS+hDnfX+rDlomI8H2OgtTXTsXgOIttvrEaypoS5p8Eb7uq3Kjwv8OskLfir9
         uMEG8ywqJETXCXNBwoBYYb0Yj5VH1X9vMwm/EQw1Pb+fHsaNMAgF0AudlFHkk3k8GbQd
         H4CazWHRz/zavuyBcm0zw+qyyfwooVI/x7gG8sMamqbYBffH4XB+luU3jNaaBk1H8wwH
         ojb/+JSLw/FNh+yuiXvVL71OyVgxbdjqKd68HHf3ZzVPEFUj5rwvN0hlNZAGyQwxWvcl
         MirXG4zUP54Uxfr7p6kuL+SAuxbyYAfyCTBA5xePg9tEPbV3tbebMi2719zy5zXQ+p8V
         ol7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:references:user-agent:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=klNvHmn4dmHfYFGr5swA66ym/DQGM3Z/kdqx0uiahpE=;
        b=VumPY4F4F9ocsK5TBUlGz71/HQtvvCnaRnqdW5Xn8du0p92WKgb8cloWLMMPe0imTW
         gUutNU86La+Ac1qTqjBlakacF8NRq48S1LmmWkj3Ql03IgchdsCSxT27ZARevtDVnwXt
         RcYd422QJzH9QKyVKsnfeB8mQtCcC788XnesUQCg2srwWGM2cS1mRxhD68TILZLoNI6X
         R9lHE8zCCTSavw49UyUJd1OmBkeZxJ4Fr3o5zH/YxeIT9j3/X06ursLX27+GeaaGL8US
         6YpBQwDb89D3ofLEPY37PfjreIMe1EGPjopJ0PtdFrzA3Tg/gBnhICEN+D+TQdZyTElA
         XgQg==
X-Gm-Message-State: APjAAAUmMFGtA9ezLTlBj8x/FqF02liZ25EQkSWC6ZijlXLJtzBf4JPj
        nMamoFrrXtauxjRh0rwhEySweQ==
X-Google-Smtp-Source: APXvYqxABF+5PaKhoVrX5R6Isn4saEC5uBpJxvivRCXdNynAdaHADyXVenpJPWk+leolVADkRJs0FA==
X-Received: by 2002:adf:f303:: with SMTP id i3mr3358580wro.242.1568729255973;
        Tue, 17 Sep 2019 07:07:35 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 33sm4458213wra.41.2019.09.17.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 07:07:35 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
X-Google-Original-From: Jerome Brunet <jbrunet@starbuckisacylon.baylibre.com>
References: <1568700442-18540-1-git-send-email-qianggui.song@amlogic.com> <1568700442-18540-3-git-send-email-qianggui.song@amlogic.com> <1jef0f46fj.fsf@starbuckisacylon.baylibre.com> <73dc56bd-d6c5-1de7-e97e-91479a89a29e@amlogic.com>
User-agent: mu4e 1.3.1; emacs 26.2
To:     Qianggui Song <qianggui.song@amlogic.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] pinctrl: meson-a1: add pinctrl driver for Meson A1 Soc
In-reply-to: <73dc56bd-d6c5-1de7-e97e-91479a89a29e@amlogic.com>
Date:   Tue, 17 Sep 2019 16:07:34 +0200
Message-ID: <1j8sqn3tjt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Tue 17 Sep 2019 at 13:51, Qianggui Song <qianggui.song@amlogic.com> wrote:
>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>>> index 8bba9d0..885b89d 100644
>>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>>> @@ -688,8 +688,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>>  
>>>  	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
>>>  	if (IS_ERR(pc->reg_ds)) {
>>> -		dev_dbg(pc->dev, "ds registers not found - skipping\n");
>>> -		pc->reg_ds = NULL;
>>> +		if (pc->data->reg_layout == A1_LAYOUT) {
>>> +			pc->reg_ds = pc->reg_pullen;
>> 
>> IMO, this kind of ID based init fixup is not going to scale and will
>> lead to something difficult to maintain in the end.
>> 
>> The way the different register sets interract with each other is already
>> pretty complex to follow.
>> 
>> You could rework this in 2 different ways:
>> #1 - Have the generic function parse all the register sets and have all
>> drivers provide a specific (as in gxbb, gxl, axg, etc ...)  function to :
>>  - Verify the expected sets have been provided
>>  - Make assignement fixup as above if necessary
>> 
>> #2 - Rework the driver to have only one single register region
>>  I think one of your colleague previously mentionned this was not
>>  possible. It is still unclear to me why ...
>> 
> Appreciate your advice.  I have an idea based on #1, how about providing
> only two dt parse function, one is for chips before A1(the old one),
> another is for A1 and later chips that share the same layout. Assign
> these two functions to their own driver.

That's roughly the same thing as your initial proposition with function
pointer instead of IDs ... IMO, this would still be a quick fix to
address your immediate topic instead of dealing with the driver as
whole, which is my concern here.

>>> +		} else {
>>> +			dev_dbg(pc->dev, "ds registers not found - skipping\n");
>>> +			pc->reg_ds = NULL;
>>> +		}
>>>  	}
>>>  
>>>  	return 0;
>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>>> index c696f32..3d0c58d 100644
>>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>>> @@ -80,6 +80,14 @@ enum meson_pinconf_drv {
>>>  };
>>>  
>>>  /**
>>> + * enum meson_reg_layout - identify two types of reg layout
>>> + */
>>> +enum meson_reg_layout {
>>> +	LEGACY_LAYOUT,
>>> +	A1_LAYOUT,
>>> +};
>>> +
>>> +/**
>>>   * struct meson bank
>>>   *
>>>   * @name:	bank name
>>> @@ -114,6 +122,7 @@ struct meson_pinctrl_data {
>>>  	unsigned int num_banks;
>>>  	const struct pinmux_ops *pmx_ops;
>>>  	void *pmx_data;
>>> +	unsigned int reg_layout;
>>>  };
>>>  
>>>  struct meson_pinctrl {
>> 
>> .
>> 

