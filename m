Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 048ED58D375
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 08:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbiHIGAM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 02:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231913AbiHIGAB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 02:00:01 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B69D1F601
        for <linux-gpio@vger.kernel.org>; Mon,  8 Aug 2022 23:00:00 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id p14-20020a17090a74ce00b001f4d04492faso11208703pjl.4
        for <linux-gpio@vger.kernel.org>; Mon, 08 Aug 2022 23:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=mFQC/N9cSWfgQ4UbI4s3F4LPxgg1eXu06ZSS3FaHZoM=;
        b=MsDa8Az3S4KsVkdkorxxEDTI4WtAvOt9n5c+wXNMvDTwTmNWcf/rIDGZDntXFiWpve
         CVUOAm6BUgAKo8n9tuZm27dTz8SEatfWgAYxv/JDMgDfMpkYN5E+7yMDckk9Ol8/eeyq
         fL1MhegqGlDaPO5VmZFZN0KS+GaSntBd6l6EblfRUSLNnXE5FocSZoMuldkZAWZ2MOOw
         JUXVAbJY2e6QT0jYOVN0dtS1v7CBLK8y6j5ouHj9IjJF4qsXxXLXrnvuvuSMLcprvnj/
         zG1cKB5Uh5zQxvpkEjPmfiDpHUuqFPqt9ENXgzzK6yvXP/eI9e3azlIomwJOTgoX4tyW
         5bdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=mFQC/N9cSWfgQ4UbI4s3F4LPxgg1eXu06ZSS3FaHZoM=;
        b=hwOu0EMMA+G4rM7To1GZ400UYm5805GeXtcz5SrthbPyh3t9o9hpvEjw5i+Ar71bq9
         TbwXEHh1e5f0T5we9yR4x6K6pwoGOJ1PcW6ju1hmVLJw64RTwWLG8H/EC9r+8wvfiSYu
         dT/tXG89kNMatffaJLh4zVhEVNn9jYLqD2S+01e8lB8g1hfDRQx+slZBegfM3ZI9Pgzu
         Kik3IEYCF9j0GjAf2xmfftilSj5tPljpRrefv40n3YyFCfVYinFqe07XIguLuhNwm897
         CUrVs6OEbAja75eDQil5GJSC28SgrJA0Wg7HALiOTvqCOCjeewGPu6bwgxRPzgwUWG1a
         mznQ==
X-Gm-Message-State: ACgBeo0kNzL+kSFj9tNRQqEwIZZfXHZMi2qNELiAmTPYB5pE8UCtWP09
        JkccSIWejNlVFhQ7OV8jQK+oUoVpwFHojw==
X-Google-Smtp-Source: AA6agR7qQg58oLdSfqVgsKNy9KPUaC7JbU58UK7CpGVG5C2cCagc1UJDDggrD7cos++erwbBQIA/jA==
X-Received: by 2002:a17:903:41cd:b0:16e:e0c0:96d1 with SMTP id u13-20020a17090341cd00b0016ee0c096d1mr21956020ple.169.1660024800120;
        Mon, 08 Aug 2022 23:00:00 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902e54200b0016a058b7547sm8837951plf.294.2022.08.08.22.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 22:59:59 -0700 (PDT)
Date:   Tue, 9 Aug 2022 11:29:57 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V5 0/8] libgpiod: Add Rust bindings
Message-ID: <20220809055957.ujmhqodfz2lxj6hf@vireshk-i7>
References: <cover.1659442066.git.viresh.kumar@linaro.org>
 <CAMRc=McD8ouds=t0GtOOUY6_F9ecqEKg=7XvU31=aZDL3+3u4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McD8ouds=t0GtOOUY6_F9ecqEKg=7XvU31=aZDL3+3u4g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05-08-22, 16:25, Bartosz Golaszewski wrote:
> Thank you for your hard work on that, we'll get it merged eventually. :)

:)

> I'm just letting you know that I am following the discussion. I sadly
> don't know Rust well enough to be able to review the patches in detail
> but from looking at the code, I can tell that you followed the C++
> bindings in how line-config works.

Not really. I wrote the wrappers based on include/gpiod.h only and
didn't look at C++ bindings for them.

The only point where I looked at C++ bindings was when I was writing
examples and tests. I am not a Python guy, so the only thing left was
C++ :)

> Looking at how line configuration
> works in C++ and Rust bindings and how I struggle to translate it well
> to Python, I decided to take one step back and revisit the line config
> in core C API.
> 
> My goal is to tweak the data model in a way that - while making the C
> API slightly more complex - will allow high-level bindings to expose
> more elegant interfaces using mutator chaining (like what is customary
> in Rust and what is also possible and often used in C++ and Python)
> while reducing the usage of quasi dynamic typing using std::any in
> C++.

Makes sense.

> I wanted to post my work this week but didn't manage to finish it and
> now I'm leaving for vacation. If you want to take a look, the C part
> is done and available here:
> https://github.com/brgl/libgpiod-private/tree/topic/rebuild-line-config.
> C++ part is in progress.

I did have a look at this yesterday. I would like make changes towards
this once this is merged, so I don't need to do it again.

> I hope you won't mind some more reworks to the Rust API

Not at all.

> but I'm sure
> it will be much better in the end and more like what Rust libraries
> typically look like.

I think that the C API is still getting worked up at the moment and
the modifications (at API level) won't stop after this too. We will
see more improvements going forward, which is the right thing to do in
order to get a robust and more user friendly API out of it.

I worry if this will keep happening and keep pushing the Rust patches
to be merged to libgpiod. I am fine to resend the patches on top of
the rebuild-line-config changes as well though.

FWIW, I will still be around after this is merged, to write/review
Rust patches based on any changes to the C API. :)

Enjoy your vacation.

-- 
viresh
