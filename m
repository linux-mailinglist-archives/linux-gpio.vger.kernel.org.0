Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC2E67ADB1
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jan 2023 10:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbjAYJZM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Jan 2023 04:25:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235262AbjAYJZJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2023 04:25:09 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4F34A200
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 01:25:06 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id jm10so17273054plb.13
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2023 01:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9wskpszGjxoC7g41N3LUHsXFuT2NDRYLtWAlN+gnb0=;
        b=Fxcml/0TWApGdzaQEqyhWfNPpQDTg7hvSTE5tlW8C8k7Fd81LG8AM2o+hfSM0WDCM6
         LrOZ3rymin7JaHcU+t2JrXWj5Ubt9F4PHxLYOS6HTyKOhhOvSEIn2+xeofa+xMACYQvQ
         1KdhNrmnuY9udIXyZfSaDtfNyjAeTTaUEeaJOLz7C7o3o0nEJg/qckRX6L8POIY2rDbE
         WJBkixp8HP2aVKXzQ/4iy0wtWlVodz9OwmSE+Sx1VW8N5TmlGXaEHP3+4ZuYBGTBgLfe
         IWMI7EWmiky+jlUE2vGolBtdkosoZa8awl5M4ZpGlVBRHCR3f5LB6NJWUsRcX1zcXgH4
         wj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9wskpszGjxoC7g41N3LUHsXFuT2NDRYLtWAlN+gnb0=;
        b=otNNC20hqxWjulU2SEUOt2j6n0iWoRGlcG9NUT0MJcT+Vc0R+EE1v3khea0fW9KMO0
         UfjL8XciCDgS7BYvC5mRMPH//MZ6M2BhNjYf9d26LEQDOt60cxKWdJEBl6IPDy5kdXUD
         doXQAQ0y/q6ceZTdeXdgHTgZIfV1GiGogfrVYoidja7zhQjEQi4wkHMQ1Lp2aO6/Zdy8
         GwCuVwRbDczxDE1hP/6BolGxdo4EMczeZ4/PwUYh5Ex3WvL+5IOgeL32lm5i+pXQnoAP
         9nVPe/GDjvk8C82TPL/ZWZxvlWEupA7UOLp1wYhan/0ZpwrGzbzv+DH8yElKRH9Xnzau
         NdsQ==
X-Gm-Message-State: AO0yUKUvlW/D4Sbuxsa4JfDF210fPtGZMtfk8VDEiwUmvFWOciysSErw
        HShlSofRNAwGGWFNXX4yZ+2ZaQ==
X-Google-Smtp-Source: AK7set8h2VECj9gPLq+jctB3PGStp+Gd3vnXU4S2y4m+Fa2KiiQokRqDT3pwMDKqGpcL/L0WkM9nSQ==
X-Received: by 2002:a17:902:ec87:b0:196:1087:ee04 with SMTP id x7-20020a170902ec8700b001961087ee04mr6865606plg.18.1674638705671;
        Wed, 25 Jan 2023 01:25:05 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id p18-20020a170902e75200b00194d14d8e54sm1407569plf.96.2023.01.25.01.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:25:05 -0800 (PST)
Date:   Wed, 25 Jan 2023 14:55:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH v2 7/8] bindings: rust: make mutators return
 &mut self
Message-ID: <20230125092503.e6v27pmnv57wqued@vireshk-i7>
References: <20230120094515.40464-1-brgl@bgdev.pl>
 <20230120094515.40464-8-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120094515.40464-8-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 20-01-23, 10:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In C++ bindings we can chain the mutators as they all return a reference
> to the object they modify. It's a common practice to allow that in Rust
> too so make all mutators that don't already do it return a mutable
> reference to self.
> 
> It's also logically incorrect to make mutators borrow an immutable
> reference to self. Even if that builds - as we're fiddling with C
> pointers - it could change in the future. It's fine for getters but
> setters should all use mutable references.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../rust/libgpiod/examples/gpio_events.rs     |  2 +-
>  .../examples/gpio_threaded_info_events.rs     |  6 +-
>  bindings/rust/libgpiod/examples/gpioget.rs    |  4 +-
>  bindings/rust/libgpiod/examples/gpiomon.rs    |  2 +-
>  bindings/rust/libgpiod/examples/gpioset.rs    |  4 +-
>  bindings/rust/libgpiod/src/line_config.rs     |  4 +-
>  bindings/rust/libgpiod/src/line_request.rs    | 16 ++--
>  bindings/rust/libgpiod/src/request_config.rs  |  8 +-
>  bindings/rust/libgpiod/tests/common/config.rs |  8 +-
>  bindings/rust/libgpiod/tests/info_event.rs    |  6 +-
>  bindings/rust/libgpiod/tests/line_config.rs   |  2 +-
>  bindings/rust/libgpiod/tests/line_request.rs  | 73 ++++++++-----------
>  .../rust/libgpiod/tests/request_config.rs     |  2 +-
>  13 files changed, 65 insertions(+), 72 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
