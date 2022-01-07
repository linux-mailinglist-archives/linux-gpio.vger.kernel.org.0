Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FE24873A6
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jan 2022 08:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235128AbiAGHhz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jan 2022 02:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235176AbiAGHhz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jan 2022 02:37:55 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CF9C061245
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jan 2022 23:37:55 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id v25so4799723pge.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jan 2022 23:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MoMnrCmCJo+9tmeFKMK9XytI2RpI9qkkLVxs3xiCUxM=;
        b=C63qMB7m7bEAePeqZlj6LahYYxmS/Sygkwiy82wg+5ioR+b0HPoQ1Ytihhh6h1xuG+
         nPIA6NOA2+Zo7GlkUJMP2mOT0Bz2driIBsGfhD/45PjLFB0N2HcLaD2AoKvZXg017OsD
         6WpULVewBjzYaZi9XU2B+5Di8lHFombXXpixm/meIjEnEAg2fubBb6rjla3hUSMQ8OYa
         Ggzod3Hj4nUNuSXD6ulzO7Lvb1zsVTb/aD+YuR8lDLslTTvSPhkNDHoje9NDqHUR4tIJ
         s6D0PQh+0yaiI1L2OQL3Wiv5catAxOOz6ePCOJn+M+tYBT948fZnam6M5qsBOVHbB9ih
         BmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MoMnrCmCJo+9tmeFKMK9XytI2RpI9qkkLVxs3xiCUxM=;
        b=Pyj/i/o0uKjP0WuhTZ5DwwNOT1Wcrvk7LYLzyYuDvBex6Fe6MGtDCaz9gBcIoCRjKV
         Tcv8FEBtfXW/dHqBrv3Gzh2qvpVtea+SsmeRWzw9+mmUQoPCCGy85nj83rCQ2FrTR69t
         ee/+4Uu0M0ip9zytb5Ii7jGl3ucgL8qrbEATrzDW90qWLFyyLRCa4LVmNtdSJ9UUxrK6
         vP/xN96P9Kor4d/FHqLPBMu/yXSC/8ELJIqFj2bvIThLA3jtTcPYkuQ4q4anGf2P+ViM
         Zq7JbhtjZjdvASJX8SwwqnKi9/pTYHMDRe/ti3u2ZIOJhoyEARkz7JHD6kYUedQ9POHZ
         QJBg==
X-Gm-Message-State: AOAM531xD4yPYsFHv/BhP2BqevwmlvmKRSVxTdtt4e9QhfobChinnTE7
        8qp99erLhijZw1qPjElZc2+9gw==
X-Google-Smtp-Source: ABdhPJytXRDIOoSRf9TBAikq/4RHOnOWxGi4auzwYPcPgV0JpAYDYdf4O5ozn7IV1vQTWPhLKpsaaA==
X-Received: by 2002:a63:6687:: with SMTP id a129mr54534750pgc.477.1641541074542;
        Thu, 06 Jan 2022 23:37:54 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id j8sm5280794pfc.11.2022.01.06.23.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 23:37:54 -0800 (PST)
Date:   Fri, 7 Jan 2022 13:07:52 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org
Subject: Re: [PATCH V2 2/4] libgpiod: Add rust wrappers
Message-ID: <20220107073752.irorzkoqpztytyme@vireshk-i7>
References: <cover.1638443930.git.viresh.kumar@linaro.org>
 <7ace171379783b73a8f560737fd47900ac28924c.1638443930.git.viresh.kumar@linaro.org>
 <CAMRc=MeoTiUOjM_D36ZEU=echpM9jVhr1HY7fuxTDs0t0jf2Jg@mail.gmail.com>
 <20211217001207.GA6287@sol>
 <20211217051133.c6pipmhxxysyxdrx@vireshk-i7>
 <20220106154724.GA109697@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106154724.GA109697@sol>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06-01-22, 23:47, Kent Gibson wrote:
> In case you are interested, the first pass of my take on a Rust GPIO
> library[1] has finally gotten to the point of being core feature complete,
> and may be usable, although it is sorely lacking any integration tests.
> And the documentation is still pretty light, or even non-existant for
> github.
> And the event interface is either polled or blocking - haven't gotten to
> an async interface yet.
> 
> Anyway, there are three crates there:
>  - gpiod-uapi provides a thin and safe wrapper around the ioctls and
>    file reads, for both uAPI versions.
>  - gpiod provides a more idiomatic abstraction, and hides the uAPI
>    version being used - unless you need v2 specific features.
>  - gpiodctl provides a binary that bundles all the gpio tools into one.
> 
> There are a couple of minimal example apps in the gpiod crate, in
> addition to the example that gpiodctl provides.
> 
> Cheers,
> Kent.
> 
> [1] https://github.com/warthog618/gpiod-rs

Nice stuff, thanks Kent for sharing that.

I may end up using the libgpiod wrappers though, since I have already done the
development using it and it is going to be low maintenance work for me :)

But it is really nice to have raw ioctl interface too for the GPIO devices.

-- 
viresh
