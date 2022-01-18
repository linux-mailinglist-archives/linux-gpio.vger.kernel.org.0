Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22FB1492029
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jan 2022 08:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbiARHWE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jan 2022 02:22:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245116AbiARHV7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jan 2022 02:21:59 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC97C061751
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 23:21:59 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id o15so66913772lfo.11
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jan 2022 23:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=zAdeq8bbSl6Gd3eWXBvQfBQUwFD100je3SoyG2akF/8=;
        b=Iofy/LppByxmxU1MIgzoi0TiEq54yHL+kfqqZp7aHovTOY7ShrxxbJehUMFO7mGTzd
         8sSLb7bEa5aVHpfxTg1ncii97ZeJxtnM6AR3QnC+/g3iWq1mEq93mcmypH2StfK3Cddo
         +j+HRALEagYPO6Bz7xL+4BzMzmenWzag4rfSFROEy1Yplr952JjaV3GIG+W/Ug3IYG4M
         4anOznQCiHbjLdEhWAB3Zm1QODuox6GikTnORhw5p8p+lchv9eySKmgVRDydsDLkllu5
         HFWN0E09Yh4G03spXXR4QqodN6wtmjfc87Fk7AqJ7UtGOtVcHrEo2HWUj7IieVVgyj33
         me8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zAdeq8bbSl6Gd3eWXBvQfBQUwFD100je3SoyG2akF/8=;
        b=mOz8YeiXJosndxMAvP0dfMcYdwti+xiz+Mm4Dqrg+UWmn+CMEnAdzCYi7PN48a6Psi
         mEZdeP091GFKMjGhb4VEPKJ2wmWcsKMhW6Aquu9Hh4QaCiVkWJkdzh0qUKKq8pGin06B
         PjnUexRRtaMOYbjPMjMd6E3R9VBtntHfiMFR4YQA/fh5d2T28XX0bZoGkmzjdNaBQ+Em
         8SXp0K7KS+lBW36hdQX97+ZoTZAdoB7w7KQtz2w5xfpSq4Lkuzka9b7A6JP6ZeJ38tZ7
         /kkxOz1ev58KHJ9pRaXMMq53CVGj7zC0vWWnqVl1zB2fD8Agc4hF0QRrp2G9os08JvpG
         Z98Q==
X-Gm-Message-State: AOAM53118vYEidC9u1VsjE+mQgc8eYZTvZrIGaoXx0g1vVTNOxjDfl+7
        kMmWxENWKixk2e/uG0HYlUA=
X-Google-Smtp-Source: ABdhPJycPHQKGfnK8VztK7HcWiHD+jU0l8qEMyE6lGz7VXs6iNk+2Jl4W+/dpBvP/MOUEf+UMsoxUw==
X-Received: by 2002:ac2:5fc8:: with SMTP id q8mr20202598lfg.275.1642490517453;
        Mon, 17 Jan 2022 23:21:57 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id u15sm892575lfs.93.2022.01.17.23.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 23:21:57 -0800 (PST)
Message-ID: <7cbe1015-a942-4887-7762-7c1dce243958@gmail.com>
Date:   Tue, 18 Jan 2022 08:21:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 4/4] pinctrl: add one more "const" for generic function
 groups
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211216162206.8027-1-zajec5@gmail.com>
 <20211216162206.8027-4-zajec5@gmail.com> <Yd2jcfXqqKHK/NaG@archlinux-ax161>
 <24a1e92e-51ab-ded5-1a43-682950af1fe9@gmail.com>
 <20220118070220.5bfgubz4mx2l33jd@pengutronix.de>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220118070220.5bfgubz4mx2l33jd@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 18.01.2022 08:02, Uwe Kleine-König wrote:
> On Tue, Jan 11, 2022 at 05:51:44PM +0100, Rafał Miłecki wrote:
>> On 11.01.2022 16:34, Nathan Chancellor wrote:
>>> On Thu, Dec 16, 2021 at 05:22:06PM +0100, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Generic code doesn't modify those strings and .get_function_groups
>>>> callback has that extra "const" as well. This allows more flexibility in
>>>> GENERIC_PINMUX_FUNCTIONS users.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>>    drivers/pinctrl/pinmux.c | 2 +-
>>>>    drivers/pinctrl/pinmux.h | 4 ++--
>>>>    2 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
>>>> index 6cdbd9ccf2f0..f94d43b082d9 100644
>>>> --- a/drivers/pinctrl/pinmux.c
>>>> +++ b/drivers/pinctrl/pinmux.c
>>>> @@ -875,7 +875,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
>>>>     */
>>>>    int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>>>>    				const char *name,
>>>> -				const char **groups,
>>>> +				const char * const *groups,
>>>>    				const unsigned int num_groups,
>>>>    				void *data)
>>>>    {
>>>> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
>>>> index 78c3a31be882..72fcf03eaa43 100644
>>>> --- a/drivers/pinctrl/pinmux.h
>>>> +++ b/drivers/pinctrl/pinmux.h
>>>> @@ -129,7 +129,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
>>>>     */
>>>>    struct function_desc {
>>>>    	const char *name;
>>>> -	const char **group_names;
>>>> +	const char * const *group_names;
>>>>    	int num_group_names;
>>>>    	void *data;
>>>>    };
>>>> @@ -150,7 +150,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
>>>>    int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>>>>    				const char *name,
>>>> -				const char **groups,
>>>> +				const char * const *groups,
>>>>    				unsigned const num_groups,
>>>>    				void *data);
>>>> -- 
>>>> 2.31.1
>>>>
>>>>
>>>
>>> I have not seen this reported yet, even though it has been broken for a
>>> couple of weeks now. I see the following error in -next:
>>>
>>> $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- allmodconfig drivers/pinctrl/pinctrl-thunderbay.o
>>> drivers/pinctrl/pinctrl-thunderbay.c: In function ‘thunderbay_add_functions’:
>>> drivers/pinctrl/pinctrl-thunderbay.c:815:29: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>>>     815 |                         grp = func->group_names;
>>>         |                             ^
>>> cc1: all warnings being treated as errors
>>>
>>> Looks like something like the third patch of the series is needed for
>>> the Thunderbay driver, which it appears was in development at the same
>>> time as this series.
>>
>> Correct, this driver didn't exist in Linus's tree when I developed my changes.
> 
> I stumbled above this issue, too. For the record, this patch fixes the
> build issue:

[PATCH 5.17 1/2] pinctrl: thunderbay: comment process of building functions a bit
[PATCH 5.17 2/2] pinctrl: thunderbay: rework loops looking for groups names
https://patchwork.ozlabs.org/project/linux-gpio/list/?series=280568

Patches already queued in the:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=fixes
