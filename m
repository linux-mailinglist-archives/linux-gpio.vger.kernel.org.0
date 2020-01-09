Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271731357A0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2020 12:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730523AbgAILIZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jan 2020 06:08:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55404 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728635AbgAILIY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jan 2020 06:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578568103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gdER25NKHzO7PNWA2X0xOynVrkCRDD8R87T3Ujm85/0=;
        b=DJJlM2JGwlHrhWPJvM3JQAVYHfbMV5tP31hnYSzWE7NQXer+SQYdFQvgNRWbqlGEN7eny7
        fUODmzb1GfSS6E7AEz4Bakix6B4PyDAmCOAnhffikz1Rm+T1CtdMK5nnvj2j3XhQJ84aIq
        gRhuKAUcLNf4fCmJB+mGhgpvLeSZQeo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-AIKyPFvvMDyn2fTFQK5ewg-1; Thu, 09 Jan 2020 06:08:22 -0500
X-MC-Unique: AIKyPFvvMDyn2fTFQK5ewg-1
Received: by mail-wm1-f71.google.com with SMTP id f25so786772wmb.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jan 2020 03:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdER25NKHzO7PNWA2X0xOynVrkCRDD8R87T3Ujm85/0=;
        b=kmQLZslWMe1fN2UbhV5ztgvY9CnVuL7IOCzrUNv/twl0oBL2zsAu9F2ZYY0/7sXczb
         4b4GqxBiQQWHECLYMvlqaCZv/R3PqxXJgf3N369nhHs64ZFYYmkzO3q85lwCVafApowt
         LA+O1pgHwLZ6W1YmtMHaQDIk3qjyd91u8L91GIsZBaM7phIV4jv4kFo6cWP0yVC2X4Bz
         UHR5FZMlLV1tdowaEi8HISNZz9FHTFLMACtuxgWLliOKoypPA0lWe0l/BaBKyLd65Qeo
         zPgTlYwf1P21ITcEuflMIgnqKdFG4rLPCUZDHtojXDa7/Qq87tgYDGtljgWqhRgeffRF
         xQ+Q==
X-Gm-Message-State: APjAAAVeDPnMSDhpNt7WxK/Jstx3dTIOXPPl9zyqNjFE0eFKCFZxHAbx
        ltKnjr7vPmuT82Ys1o7qiZsK3+bPzMjfSo6/jekkeks0QTTfIVeqUN1NN1TDHZ4+YoXIEklNn+x
        m2V/HdFGJtVEhW8YI09kIlw==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr4229344wmg.38.1578568101073;
        Thu, 09 Jan 2020 03:08:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqzV+HpvZzMnhDG1/nvE/ODroUja7OE02ypl4zwnj4Un2RVrjJFMj4c0q81IWYwGeffY243U+A==
X-Received: by 2002:a1c:20d6:: with SMTP id g205mr4229324wmg.38.1578568100878;
        Thu, 09 Jan 2020 03:08:20 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id a14sm8210096wrx.81.2020.01.09.03.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2020 03:08:20 -0800 (PST)
Subject: Re: [PATCH v3] pinctrl: baytrail: Replace WARN with dev_info_once
 when setting direct-irq pin to output
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Dmitry Mastykin <mastichi@gmail.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20200101145243.15912-1-hdegoede@redhat.com>
 <20200108174745.GG32742@smile.fi.intel.com>
 <f1ace666-1c57-0688-9737-d3ab2f5a1073@redhat.com>
 <20200109102100.GK32742@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9d6d5a74-b9b0-1cc8-1347-24d96961dd6d@redhat.com>
Date:   Thu, 9 Jan 2020 12:08:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200109102100.GK32742@smile.fi.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 09-01-2020 11:21, Andy Shevchenko wrote:
> On Thu, Jan 09, 2020 at 10:05:47AM +0100, Hans de Goede wrote:
>> On 08-01-2020 18:47, Andy Shevchenko wrote:
>>> On Wed, Jan 01, 2020 at 03:52:43PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>>    		/*
>>>>    		 * Before making any direction modifications, do a check if gpio
>>>>    		 * is set for direct IRQ.  On baytrail, setting GPIO to output
>>>>    		 * does not make sense, so let's at least warn the caller before
>>>
>>> ...if it's a warning, perhaps do a warning instead of info?
>>> Otherwise, we probably need to change a comment here.
>>
>> I went with info on purpose since this will trigger on all BYT devices with
>> a Goodix touchscreens of which we have quite a few, so my vote goes to maybe
>> the comment. Note that although the log level is info (because it is somewhat
>> expected to happen), the content of the log msg is still warning-ish.
>>
>> I guess we could replace "let's at least warn the caller before" with
>> "let's at least let the caller know before"
> 
> What about simple 'warn -> inform' ?
> (I can update myself)

Works for me, thanks.

Regards,

Hans



> 
>>>>    		 * they shoot themselves in the foot.
>>>>    		 */
>>>> -		WARN(readl(conf_reg) & BYT_DIRECT_IRQ_EN,
>>>> -		     "Potential Error: Setting GPIO with direct_irq_en to output");
>>>> +		dev_info_once(vg->dev, "Potential Error: Setting GPIO with direct_irq_en to output");
> 

