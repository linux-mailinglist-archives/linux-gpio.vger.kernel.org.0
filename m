Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5161E4784AC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Dec 2021 06:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbhLQFuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Dec 2021 00:50:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhLQFuF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Dec 2021 00:50:05 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9D9C061574
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:50:04 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id a11-20020a17090a854b00b001b11aae38d6so1665834pjw.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Dec 2021 21:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gY86st/aAu1Xo1T5CCD3Ox9oZ6LXpfXmYwqSIw8ZXVU=;
        b=YEC2B2sLIvZma2xI9CDZJFLmD8wn5nf/1ID6qJuvdobtfMzC6yJgLtrszY45O29/gH
         VtmF+j++U/xKsEEm9VKlBcIKJ69G/RrdOO8/pQouFdOJwxAwLgNg5CmFvPM0N/auSuX9
         mk/HUn/cGEPHDEZx1pFj4PxsHzFd07inNZQ4rOinTHNRH4j7G+LcrY41Labl9xTZvfKu
         9eeOO1+76OHaUpOANdKgiQNiEYpki8lkm7Xn01Kt0O0Ae8eqe91ocOWu7jD7MfjfAsBs
         NZ796ggCND/WSKK5AEf58uCZkyRXLlOs8ms9Va2UvG7h2PdicEicKCMB2AZ41l8nemt2
         lm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gY86st/aAu1Xo1T5CCD3Ox9oZ6LXpfXmYwqSIw8ZXVU=;
        b=7euWoc06jLq1HT0mJgT/RuUpgqFAbVBQwuJWCZ7dSjmefEV82QxxNSlD2fDYCTfavk
         Fkhop2jbiiFVoeMm3x+DNzkwGMj2byoAWMLgV8rmnROzjmB1h+PCvhQMhbUzgBhSEWxk
         cnA/7sErbdjYSbrARnuk0QZGYI8Ps+FPPkowrZtfR2CVmtcEabMR8TePNPbKmZ1ibffa
         oDdqUhtUnnNl8aT4s3TfyCOuL77V1HJIUzdgE4jZF7Nllep5AmgT7slAGNZASAKH7mD1
         W3nSrTPbWKEuX6+CdGSQsN+dbJA5BINoBg1vJDbIm5PBE4fCXdiqQumVyfyve/GpwU07
         Vh5Q==
X-Gm-Message-State: AOAM530AYUkgeRmby8v8YoClVHPdy5FXCAg7qFMpEqNAijn0JxONyfFK
        ulR49KFLtpRMHhYnWoSeywk1kw==
X-Google-Smtp-Source: ABdhPJzLghrjDifiOGUxu6sKn3OVd7PJ7F3a3cB29T4TFSIcTW1zZqB609Mpy/EgI4oE6+MPMbLI7Q==
X-Received: by 2002:a17:903:2289:b0:148:a946:d50a with SMTP id b9-20020a170903228900b00148a946d50amr1441623plh.118.1639720204385;
        Thu, 16 Dec 2021 21:50:04 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id f21sm8387910pfc.85.2021.12.16.21.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 21:50:03 -0800 (PST)
Date:   Fri, 17 Dec 2021 11:20:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Gerard Ryan <g.m0n3y.2503@gmail.com>
Cc:     alex.bennee@linaro.org, brgl@bgdev.pl, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
        stratos-dev@op-lists.linaro.org, vincent.guittot@linaro.org,
        warthog618@gmail.com, wedsonaf@google.com
Subject: Re: [PATCH V2 1/4] libgpiod: Generate rust FFI bindings
Message-ID: <20211217055001.535wscahbxfkrxn5@vireshk-i7>
References: <CAKycSdDgLYRU9d5dw8SUGX5Jow1LUM4ySb5n4v4FeUFKTwnYPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKycSdDgLYRU9d5dw8SUGX5Jow1LUM4ySb5n4v4FeUFKTwnYPg@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Gerard,

On 17-12-21, 11:29, Gerard Ryan wrote:
> Hello,
> 
> I submitted https://lore.kernel.org/all/CAKycSdDMxfto6oTqt06TbJxXY=S7p_gtEXWDQv8mz0d9zt3Gvw@mail.gmail.com/
> and my attention was drawn here and have a few comments.
> 
> Firstly, I was wondering why you didn't create a separate *-sys crate
> for these bindings?
> see https://doc.rust-lang.org/cargo/reference/build-scripts.html#-sys-packages
> for more information.

I wasn't aware of it :(

I think yes this should be modified to a sys-crate, followed by wrapper crate to
contain the wrappers around it.

> Secondly, I noticed when developing my aforementioned, patch that
> `bindgen` adds quite a few dependencies that probably aren't needed by
> the average consumer of this crate.
> So I was wondering what are your thoughts about generating and
> committing a bindings.rs then optionally using these dependencies via
> a feature flag?

I don't have a strong preference either way, whatever works best.

Miguel, any suggestions ?

> Lastly, With your `make` integration, it looks like we could also
> remove the `cc` dependency by allowing `make` to build libgpiod
> instead and just linking with that, instead of compiling libgpiod
> twice.

I agree, that would be better. It wasn't integrated with Make earlier and so I
had to do it separately. But I may have some problem with it:

This is the vhost-device (gpio virtio) crate where I am using these bindings and
have the libgpiod as a dependency:

https://github.com/vireshk/vhost-device/blob/gpio/irq/src/gpio/Cargo.toml#L18

When I do a cargo build there (for vhost-device crate), it will try to build the
dependencies as well, i.e. libgpiod, and I need to build the libgpiod's C files
as well there. There are good chances that I need to build from source and
libgpiod isn't installed there. How do I do it with Make ?

-- 
viresh
