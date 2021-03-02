Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC07F32AD1E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381742AbhCBVXn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379991AbhCBQJb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 11:09:31 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91FFC06178A
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 08:08:33 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id f3so22442747oiw.13
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 08:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Iyg5/gmDpXa1jkqB7UpkDVF44ozbQk+LrXdmXFLi+mQ=;
        b=QlDW0kV0xR7d2PI3OkkjYDQpbg2TthQphcKDaLqyXEZXPDcXbIpI+twvLrDUW7TmXk
         j2tmHJKJlU7FpO2f/Mo4UQg2Gc+p0H0b0tpTneFZ2mWdMj0nmT93HFOne2ZcoYI1Hyys
         5NYKslYuXBbYVwbLKBuaJ0WSn97OjjsEi+IdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Iyg5/gmDpXa1jkqB7UpkDVF44ozbQk+LrXdmXFLi+mQ=;
        b=o52W6S3jDnSWtNxBnauE8mTQU4Mv33vsbmX1YTEQZtxD1o06DK2CkiAtykyjCmc4OT
         tarMnuooG8REjGgHSTUGwUTx6Zijfpop719BhfIbF+UQm0vqXOay59HIt9nQv8YWTDUc
         +1X08Huh/mtYr+sQcQVZL8nKYehU2ZqEUHAPBQoqkxzlT0saCElUShJTzwyjXZCMCMXQ
         pqpfHRn+wMgmnbP1HXswu2L08vu6Pog2gaOJ+AiV6vwxERTZsondk9Vn1IkLPdxl5kDa
         SajTf4XfZsSIEidBVKfk/dGxS1gowcGmz3ekgwYU6B7nBxtY0sYCJqrTkKkwWPnCiriK
         aAcw==
X-Gm-Message-State: AOAM533LXW4F4YsZjzGo66H/3SkkmmlRCKz/huY66SI7Wuevte8CL15L
        mlF2eZaAvWI/gb4/DNEtsL1VQg==
X-Google-Smtp-Source: ABdhPJwrREsvHfrVd40PiwsLPqs6KjdgJfB62cZobVP3fc1O90rLaYVIgSpH68HkxEkKK9+nwNmWxw==
X-Received: by 2002:aca:4587:: with SMTP id s129mr3726303oia.133.1614701313281;
        Tue, 02 Mar 2021 08:08:33 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id z17sm4330351oto.58.2021.03.02.08.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 08:08:32 -0800 (PST)
Subject: Re: [PATCH] selftests: gpio: update .gitignore
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210224185316.17942-1-brgl@bgdev.pl>
 <CACRpkdZ915TABrSt0A_1tM3Jt_op4gcCY1b-d2ocM7wjKJFoPA@mail.gmail.com>
 <b188690a-31e5-fca9-1226-9dbf7c9f9448@linuxfoundation.org>
 <CAMpxmJUu3x7iCT=Zsung1TFU-f2qY-oTujoDNkF+sMG4SXJXgw@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ca7a7b4d-1f8e-f109-3db1-59332ba2edd4@linuxfoundation.org>
Date:   Tue, 2 Mar 2021 09:08:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMpxmJUu3x7iCT=Zsung1TFU-f2qY-oTujoDNkF+sMG4SXJXgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/2/21 9:07 AM, Bartosz Golaszewski wrote:
> On Tue, Mar 2, 2021 at 4:27 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 3/2/21 7:44 AM, Linus Walleij wrote:
>>> On Wed, Feb 24, 2021 at 7:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> The executable that we build for GPIO selftests was renamed to
>>>> gpio-mockup-cdev. Let's update .gitignore so that we don't show it
>>>> as an untracked file.
>>>>
>>>> Fixes: 8bc395a6a2e2 ("selftests: gpio: rework and simplify test implementation")
>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Yours,
>>> Linus Walleij
>>>
>>
>>
>> Thank you. I will queue this up.
>>
>> thanks,
>> -- Shuah
> 
> Hi Shuah,
> 
> Please let me queue this through the GPIO tree as I have some more
> development coming up this cycle that will require this. This will be
> a new driver + selftests so it will all have to go through the GPIO
> tree anyway.
> 
> Bart
> 

Perfect.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
