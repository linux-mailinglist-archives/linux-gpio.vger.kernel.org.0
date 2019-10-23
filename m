Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC72E1B9C
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 14:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405413AbfJWM6d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 08:58:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32960 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405381AbfJWM6c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Oct 2019 08:58:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id 6so5971933wmf.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Oct 2019 05:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=LPwRM5SkXWTw1iz0OjlwN2KREKzgEFscadlMI1wPDW0=;
        b=ZPB2IwX5HOazqNIIwS1xuTBbA+AmiG3aY4vZ58AJpEMoyBhzjUwpHL6BHCj7oqBTMv
         E9rBSjGVUNlWSoNQH4rzvJAh5WFSSqVO67B/ib4CgrWZiK6eftbfKW0eHWO8NklXyg2D
         kbr9oo9zTKO5S0qusGbhrDBTJkJMARjEtz5aUd4WcldnEMGYus75S1axmmG1RLLeUPrc
         qxQne30qVmKM0Om6cLO34du0AA6wZQ/BNujxh4SNJzCfF0vjzGDE+T/aVPXvP1vp6VeK
         UHE8mJ/k2wo7qaqii9Ysw6yn9hlxB38xkHswaclEhXVK/5QaFQnT+2IM3obLdcNue9nj
         r19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=LPwRM5SkXWTw1iz0OjlwN2KREKzgEFscadlMI1wPDW0=;
        b=clvOQ0yUnIVEaCzDREA3D33ARK2t8Iiuj4rjb5J6zda7giH6iwcnM7sITzBaBw7C5V
         Y4KEgy6+cS5DK5XxXyIoTmPuL5Kc5WZMaHuggRNuqsGOfWVASBJlN8fzGssSwO0qRv2s
         d07DuokMf7wU3tNOt3JfssPhDUAU7FLrU0fKyr41Rc9EsO64lcE6DnFYQsCo5KR/1/g9
         GM8lhA9UuFCzf50DngUktqnX7c8lr4ngLhW49+lxF0gxCSij5CktJmz2l/Ubc2JZVeZv
         3ZiWdoUAyG9PmoK0VL7KS25aHFZn/eCW69fYXnj6FdZf2aN2Lj0WpoecJ1qjW+6efHP6
         mqHA==
X-Gm-Message-State: APjAAAVE0w7vyZdm9pnYYi/zOm8mFk5DmpRUlI/UB38twjO6IWaQCK7A
        cel1BSQdK+pqcew6Ut/irvwHfQ==
X-Google-Smtp-Source: APXvYqywg2S9jhWSpoqOwVWViWWqnSo8imGRG7G2PLFS19YVBwtNMBZCrjdmF62eeLsIl1tDrAHmTg==
X-Received: by 2002:a05:600c:2152:: with SMTP id v18mr7952882wml.170.1571835511464;
        Wed, 23 Oct 2019 05:58:31 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a186sm20669867wmd.3.2019.10.23.05.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 05:58:30 -0700 (PDT)
References: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com> <1571050492-6598-3-git-send-email-qianggui.song@amlogic.com> <1j4kzzvnrr.fsf@starbuckisacylon.baylibre.com> <4e4aa76e-d315-2b99-91f4-6667eb5221e7@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        "Jianxin Pan" <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] pinctrl: meson: add a new dt parse callback for Meson-A series SoCs
In-reply-to: <4e4aa76e-d315-2b99-91f4-6667eb5221e7@amlogic.com>
Date:   Wed, 23 Oct 2019 14:58:29 +0200
Message-ID: <1j1rv3vcsq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Wed 23 Oct 2019 at 14:33, Qianggui Song <qianggui.song@amlogic.com> wrote:

> On 2019/10/23 17:01, Jerome Brunet wrote:
>> 
>> On Mon 14 Oct 2019 at 12:54, Qianggui Song <qianggui.song@amlogic.com> wrote:
>> 
>>>
>>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>>> index 8bba9d053d9f..e8f6298fc96a 100644
>>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>>> @@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>>  	return 0;
>>>  }
>>>  
>>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>>> +				 struct device_node *node)
>> 
>> This function is the fixup for the a1 family, AFAICT.
>> It should be named as such and it belong in pinctrl-meson-a1.c
>> 
>> Every controller performing fixups should have their function as well:
>>  (1) AO of gxbb, gxl and axg 
>>  (2) AO of g12 and sm
>> 
> OK, Will try to move this function to pinctrl-meson-a1.c. That should be
> better than rewriting parse function for each chips EE/AO alone.
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = meson_pinctrl_parse_dt(pc, node);
>> 
>> As said in previous review,  meson_pinctrl_parse_dt() should be called
>> for every SoC to parse the *available* regions.
>> 
>> The fixup, if necessary, will be done by providing a callback
>> 
>> IOW, please:
>>  * rework meson_pinctrl_parse_dt() to only parse the avaialble region
>>  * don't call meson_pinctrl_parse_dt() from the extra function
>>  * provided the extra function for the AO controllers of the other SoCs
>> 
> That means I need to move not only ao fixup but ds to extra function for
> old chips do not support this.But it will touch other Socs, should I do
> this in A1 pinctrl patchset? or do this rework in another patchset.

I don't there any problem doing in a single patchset.

For example, you can make a first that does the rework for the older SoCs
and add the "extra" mechanism then another one adding A1 support

>>> +	pc->reg_ds = pc->reg_pullen;
>>> +
>>> +	return ret;
>>> +}
