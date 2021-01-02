Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07DB42E860D
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Jan 2021 03:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbhABCBE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jan 2021 21:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbhABCBE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jan 2021 21:01:04 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 399F9C0613C1
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jan 2021 18:00:24 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id l200so25799656oig.9
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jan 2021 18:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AfjOmrg7iUeYMXTyqaD20ilxGzURQEdJ0+CNnRFVMGU=;
        b=iI/XEOg7PaaIOrNsAsAEEKkj3XEhE3doW4phRnw41BmNpXiGegHbJw+dUKlBAY6TMj
         6R6+oaOPGgD+YGJDtV++B9D00PHR96KYErCUdRcT4f4XVqc1vgPOHn/NrDZ4PrJ8SgSa
         8o6jFWIclVSIxWCg7LVr5QoFUinUBnBGwTAqs9qec26MBo7UdR9rLpD5ZvvOxPSxiYNe
         Rj3Q3VffwK//4GY+a24Xain8SiMn4OJTdeISaUX6Opq2Az4vx5TUlGo4cQDlTLzcV4EN
         jzTf1cMR9aYTA+qu1RdF+MZit5Qq6O/JPSHV5g2S6RjnDo+gTg5ZRpDcb6US7DVJiP1F
         5iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AfjOmrg7iUeYMXTyqaD20ilxGzURQEdJ0+CNnRFVMGU=;
        b=AueiVcaTHhUVIZKr5s1JmyE8idhcb8t6Kikmv1qflGM6B4g2e33htmf5D89S4BEOgF
         7daoP4U8Y3AfKWvkWdo15AqwimaWhepO/SWMXwfNTpYmQyc2NTrQg1xWINU45KA0UVQG
         ZQb/SmRcjX+OUKVtN8CCoCqdD/2wqZQgmHFW6BgvtuyHHkMk36xS3xQU+LBWA4AkJvxa
         bE7KZRC1YSV8Am6qH/OIHKDTiiRZZpeVDG/bCc8C5/Gl2EDWeBpJM8kEaQoV5yB+O7zF
         LA9O2UFTMq4ZtqO0eowBxWt8ie2zJoGEGPGfhGCV5L8jS1o6yktZWOquv/9nLb77l6B1
         L8FA==
X-Gm-Message-State: AOAM531COwo33VS7A0Jlalz/6Phkq2Hw3P0MMGeHPrn6zV3Xvg5hVKLm
        2qqd3/3BO7STo1zhDOQSbbHeQAg6oTKGgyd5
X-Google-Smtp-Source: ABdhPJwlv05rQ4HGDJHa6LYbIvb7NZ459hQbcT8g8xZQj/pqgdMMmh7CSGdpHXYidsAxMSmTSUA2rw==
X-Received: by 2002:aca:cc89:: with SMTP id c131mr11403395oig.2.1609552823285;
        Fri, 01 Jan 2021 18:00:23 -0800 (PST)
Received: from [192.168.86.56] ([136.62.4.88])
        by smtp.gmail.com with ESMTPSA id m3sm12899049ots.72.2021.01.01.18.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jan 2021 18:00:21 -0800 (PST)
Subject: Re: [PATCH v1] sh: Drop ARCH_NR_GPIOS definition
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio <linux-gpio@vger.kernel.org>
References: <20201012154050.68039-1-andriy.shevchenko@linux.intel.com>
 <20201109121333.GC4077@smile.fi.intel.com>
 <10b4dc8e-db87-3f78-3ab7-e08469b9fe55@landley.net>
 <20201228213615.GF4077@smile.fi.intel.com>
 <3a20bc0f-cbdf-6498-5527-e7fd53c3b84d@physik.fu-berlin.de>
From:   Rob Landley <rob@landley.net>
Message-ID: <65ae5b43-d98c-8acf-8324-f83b8abbfa15@landley.net>
Date:   Fri, 1 Jan 2021 20:12:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3a20bc0f-cbdf-6498-5527-e7fd53c3b84d@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/1/21 7:51 AM, John Paul Adrian Glaubitz wrote:
> Hi Andy!
> 
> On 12/28/20 10:36 PM, Andy Shevchenko wrote:
>> On Wed, Nov 11, 2020 at 10:45:38AM -0600, Rob Landley wrote:
>>> On 11/9/20 6:13 AM, Andy Shevchenko wrote:
>>>> On Mon, Oct 12, 2020 at 06:40:50PM +0300, Andy Shevchenko wrote:
>>>>> The default by generic header is the same, hence drop unnecessary definition.
>>>>
>>>> Any comment on this?
>>>
>>> Acked-by: Rob Landley <rob@landley.net>
>>
>> Thanks!
>>
>>> It's in the stack I forwarded to Rich to look at this weekend.
>>
>> Unfortunately I still do not see this in the latest Linux Next.
> 
> Rich already mentioned that he planned to pick up any patches the next
> weeks/days.
> 
> I'm currently testing all the patches recently posted for any regressions.

I spoke to him on wednesday and he said he was working on it.

Rob
