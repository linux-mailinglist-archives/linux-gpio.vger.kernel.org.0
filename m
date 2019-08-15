Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1298F155
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2019 18:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730482AbfHOQ6v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Aug 2019 12:58:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45418 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729975AbfHOQ6v (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Aug 2019 12:58:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id w26so1593566pfq.12
        for <linux-gpio@vger.kernel.org>; Thu, 15 Aug 2019 09:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=mk8OS42x5tNaGm4TO4zYqbbeKQVTwhQLWv0nHIe2+iQ=;
        b=f96+BPwuA4+uyLOC9k4xHwnZDGyshJCgFAtNKkfaySQHjRCLjuiVuHsCA0lk9xnItF
         vQHWuxzZzT4DETY0P6b8auBbjzHNS9x5kdDJ6BNXUDrVtlkJjXcXiq2k6eH93K5mslyT
         +AIcOSrGg5qwGao/5GxoqQ7cEnNTWCUt+8dsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=mk8OS42x5tNaGm4TO4zYqbbeKQVTwhQLWv0nHIe2+iQ=;
        b=f5tvry0emSxQIEbsD7uZeXtQPEAcpHFWZsNzlEzMnunDH+afWAX6yWKbG11kn9ossz
         oOGehje6G+V7VUJSevZ4GaEvjDvvx/8uhrG1xcGsySlYdFbyuC2wbhIt3M0gSVcKq0jR
         32+4o5yB65pRZRJhbE7QJ9J2XHpHpwPpSWq7I5Fl6er0CAqd24t/vECCuZt4Ul9c43D5
         Vnv7SK3sTKJVBBxtcPGNC3wRXKYJQMIDXvh9zlbQmtEaWDVWOnEfLtt6Z2dc5xaz076W
         gz8/Qd5x3rDKloubnrkI+aUmnlHI+ViO3fe4oav1HnxO9C5blrXXVQT935jsHEe0MUcX
         3aqg==
X-Gm-Message-State: APjAAAXBkWgfUiKAW2O9VwQHM3Wd8lFIqaMAAHJSnQDZfegGqrddo0hU
        jbH/cTayL4h/oe9ZdMFor/LoBg==
X-Google-Smtp-Source: APXvYqweNWUeqUm6FonoHOljVBvvwtmTmSP50xD5OyievT6OLRnD79l+l2nte67EmZi3eHr1d+v9qA==
X-Received: by 2002:a62:5c01:: with SMTP id q1mr6442070pfb.53.1565888330174;
        Thu, 15 Aug 2019 09:58:50 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id 136sm3678106pfz.123.2019.08.15.09.58.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Aug 2019 09:58:49 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: bcm-iproc: Use SPDX header
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pramod Kumar <pramodku@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
References: <20190812130401.22769-1-linus.walleij@linaro.org>
 <60da7536-2d41-69b2-5730-4678b6e84cf9@broadcom.com>
 <CACRpkdZ4k_b=rOPvRi2wPgk1=9Md+urw6No1xcPy3nSFEcUogg@mail.gmail.com>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <d4ea0699-3c15-d5cf-2233-5f4546f9a069@broadcom.com>
Date:   Thu, 15 Aug 2019 09:58:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ4k_b=rOPvRi2wPgk1=9Md+urw6No1xcPy3nSFEcUogg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2019-08-15 12:51 a.m., Linus Walleij wrote:
> On Mon, Aug 12, 2019 at 5:59 PM Scott Branden
> <scott.branden@broadcom.com> wrote:
>
>> Please leave the file description comment separate from the license
>> header/copyright notices.
>>
>> ie. leave the above 3 lines intact.
> OK... Why?
For consistency following the internal template we follow.
>
> Is this because you have an automated tool that likes this format:
>
> /*
>   * Copyright ...
>   */
>
> /*
>   * Other stuff
>   */
>
> Or is it just a personal (perception) preference?
Yes, we do have an automated tool which performs such scans.  And then 
we need to go in and adjust the licenses back to the format you've 
described.
>
> Yours,
> Linus Walleij
