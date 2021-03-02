Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FC532AD04
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448217AbhCBVTA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384620AbhCBPas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 10:30:48 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 233EBC061756
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 07:27:24 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id g8so16672713otk.4
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 07:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e79b35YG0+gbCiDJj+I5H6NghEAUI7GEkWLA6tEg4Gs=;
        b=IrRzArdgfVJVnwyHN0l6DUYd6q03xZbe5WO6GjoukZLcSYEk2SAZkuVEYpYNnInBKG
         aA11Abo4VkwO+cqjr5RfFYdhNNew8gF7Y1tXDnOn1gnc4LpTj0ZObGaGzV674P2JbLCH
         fpU2HPp3QK3RgfhbtjhrAuDv3ljEKuIO6o9aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e79b35YG0+gbCiDJj+I5H6NghEAUI7GEkWLA6tEg4Gs=;
        b=WLRIR78hPv3g7Ge/vNv12Q8Jni6I3eW39iHxrLKuRDrz8kzXJY0jbOmL8ryRi7sjOT
         7wuH2s3/hu3TQDrmml95LOzClDDXSW6/k+obun7enOLvo38RLO8uy/9g/sMF9Xyh/UHA
         ZzyY+4ns+GdmZxOGQxuhI6PYSVzAbxePcrAvgbMAExIyl5XcDTlJZHICFEZ0wAR2oX0a
         VaYKGLbvV1JF994GCbFEZ69JhkJtNsHKgAayDJlJJAP1mt7Kgs3ugOGTGQx13SEaQzYD
         A1c97wOoenw7uYY1FD+8ewDMKCH+knG2Nnj+MToEHprpsviQr+qPFvQVA32qT0AEyCtY
         tc2Q==
X-Gm-Message-State: AOAM5311d2to1BXa+0gETob1F+ANykvVHAnwuFBKcIJyRVWQQ9vTwVcA
        2Xew2UJYzlxLOJuwth7w0S5SHw==
X-Google-Smtp-Source: ABdhPJztO3JExaOGej7r1rUpoB3z2m2zvTOXTtPpQ5UQVgKRMGDv9fZFfSTrouU/trOVqlMC87vJEA==
X-Received: by 2002:a05:6830:15cf:: with SMTP id j15mr18821705otr.268.1614698843545;
        Tue, 02 Mar 2021 07:27:23 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id t2sm4586768otq.45.2021.03.02.07.27.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 07:27:23 -0800 (PST)
Subject: Re: [PATCH] selftests: gpio: update .gitignore
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>, Shuah Khan <shuah@kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210224185316.17942-1-brgl@bgdev.pl>
 <CACRpkdZ915TABrSt0A_1tM3Jt_op4gcCY1b-d2ocM7wjKJFoPA@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <b188690a-31e5-fca9-1226-9dbf7c9f9448@linuxfoundation.org>
Date:   Tue, 2 Mar 2021 08:27:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ915TABrSt0A_1tM3Jt_op4gcCY1b-d2ocM7wjKJFoPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/2/21 7:44 AM, Linus Walleij wrote:
> On Wed, Feb 24, 2021 at 7:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> 
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> The executable that we build for GPIO selftests was renamed to
>> gpio-mockup-cdev. Let's update .gitignore so that we don't show it
>> as an untracked file.
>>
>> Fixes: 8bc395a6a2e2 ("selftests: gpio: rework and simplify test implementation")
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij
> 


Thank you. I will queue this up.

thanks,
-- Shuah
