Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AD948B2A1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jan 2022 17:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240902AbiAKQvt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jan 2022 11:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiAKQvt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jan 2022 11:51:49 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7130C06173F
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 08:51:48 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id h2so58507574lfv.9
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jan 2022 08:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=rGbTMtRi78XZwuvdbK4DgG6hbXjSMWonAiqBV9TMRfs=;
        b=N2RsdG4Y9b7aHsjJACxV1RXw1+WLljjsnqPYS9nfVJPDXgWuOUZjOQZ1RokZlyGJaA
         jNeazvfL+kV+T/GM8iJ8J2qW1eiHqJMLsf4vevwqhsOyPs2FgK++ebZ/QuFhhbTlrdIP
         vd1lI87/E7ddTn5UEKLshila81SCSDx9vBcanMYWlLlpkDfEKacpAqfA9gTHm5UjuxBP
         NdfueOl5L4o1BMw/euN+MBa7ktrG7ly5WsqXkPzhzQFxICjk2piFqm5Q4t/KO4rbdo6P
         aaDy7w9nXluLOJJCX5IioMUYGTzNoX4CfdBCJZJUj2Badl6xVENpI6Vem3/W6KqHhJWs
         s3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rGbTMtRi78XZwuvdbK4DgG6hbXjSMWonAiqBV9TMRfs=;
        b=eaqKHshapkscooNPnFOOUCsvSCyN2/bjA6kSwv77Encmx9ftvF4KuPjZCjA9JD/z7A
         hJAvstWKG0fY2Em72xYEZHnt6DiRhNxvzXgV+0DaQ5jw7yRt/IoyvRbeMlgB0Jv4JNfY
         EfJWd7kqF55zVWKr1v602mE4fsgm75X7TQD2i4D0XKiVG+eqPdz7hjXE893gVLYhrCRR
         fu1LfGSMTu4MtDuL62M2UXzA1u73zNZezVf1VlzuXHOTGtx2OyiLnbKtiCOuxef1sBmZ
         7A66AgXSWF7hhM/o6PsDz9TwthvJjVg1+4c+r6PQhOlYjd8QMaxyZ3buV/qjC4SISYnL
         CnSg==
X-Gm-Message-State: AOAM531tIAXfTVh412ThwVXiXA2Ikv5fx+YYH+/hTM5USnm+tzMngBpW
        Jj+8RNyXoPKeyW7IMo4r4Ak=
X-Google-Smtp-Source: ABdhPJzYFjaRCgGHGB4+JePLYqBRE8q71Vbh63NvOqv1nK1GCdyA3WzYUCd2sv5ECaunKNgGDayukQ==
X-Received: by 2002:a05:6512:1392:: with SMTP id p18mr4048463lfa.98.1641919907000;
        Tue, 11 Jan 2022 08:51:47 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id y10sm1330507ljp.82.2022.01.11.08.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 08:51:46 -0800 (PST)
Message-ID: <24a1e92e-51ab-ded5-1a43-682950af1fe9@gmail.com>
Date:   Tue, 11 Jan 2022 17:51:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 4/4] pinctrl: add one more "const" for generic function
 groups
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <Yd2jcfXqqKHK/NaG@archlinux-ax161>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11.01.2022 16:34, Nathan Chancellor wrote:
> On Thu, Dec 16, 2021 at 05:22:06PM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Generic code doesn't modify those strings and .get_function_groups
>> callback has that extra "const" as well. This allows more flexibility in
>> GENERIC_PINMUX_FUNCTIONS users.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   drivers/pinctrl/pinmux.c | 2 +-
>>   drivers/pinctrl/pinmux.h | 4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
>> index 6cdbd9ccf2f0..f94d43b082d9 100644
>> --- a/drivers/pinctrl/pinmux.c
>> +++ b/drivers/pinctrl/pinmux.c
>> @@ -875,7 +875,7 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
>>    */
>>   int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>>   				const char *name,
>> -				const char **groups,
>> +				const char * const *groups,
>>   				const unsigned int num_groups,
>>   				void *data)
>>   {
>> diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
>> index 78c3a31be882..72fcf03eaa43 100644
>> --- a/drivers/pinctrl/pinmux.h
>> +++ b/drivers/pinctrl/pinmux.h
>> @@ -129,7 +129,7 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
>>    */
>>   struct function_desc {
>>   	const char *name;
>> -	const char **group_names;
>> +	const char * const *group_names;
>>   	int num_group_names;
>>   	void *data;
>>   };
>> @@ -150,7 +150,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
>>   
>>   int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>>   				const char *name,
>> -				const char **groups,
>> +				const char * const *groups,
>>   				unsigned const num_groups,
>>   				void *data);
>>   
>> -- 
>> 2.31.1
>>
>>
> 
> I have not seen this reported yet, even though it has been broken for a
> couple of weeks now. I see the following error in -next:
> 
> $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- allmodconfig drivers/pinctrl/pinctrl-thunderbay.o
> drivers/pinctrl/pinctrl-thunderbay.c: In function ‘thunderbay_add_functions’:
> drivers/pinctrl/pinctrl-thunderbay.c:815:29: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>    815 |                         grp = func->group_names;
>        |                             ^
> cc1: all warnings being treated as errors
> 
> Looks like something like the third patch of the series is needed for
> the Thunderbay driver, which it appears was in development at the same
> time as this series.

Correct, this driver didn't exist in Linus's tree when I developed my changes.

Too bad thunderbay copies that old & complex logic that I just fixed in the keembay driver. I'll have to redo my changes for the thunderbay now.

I don't agree with the idea of reverting my patchset and working on V3 though. It's a relatively simple thing we need to fix, it just be just a follow-up commit.
