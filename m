Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDB46B6E67
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Mar 2023 05:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbjCMEZj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Mar 2023 00:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCMEZi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 00:25:38 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6992A6C4
        for <linux-gpio@vger.kernel.org>; Sun, 12 Mar 2023 21:25:36 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so10362536pjg.4
        for <linux-gpio@vger.kernel.org>; Sun, 12 Mar 2023 21:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678681536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ilTZwrkROtA93tqncN9e7LxKRGS6dxCNGuJc1ZvezU=;
        b=H+B0k/DN7gZpBgelh04NyWMhbKhyjZQE993iaYgmXQssE8w2IT1WANajL4xV5tLVhf
         jyM4vRhpR+uPXJNb3+C5xMFHmechHNARW2eYy0nt/B473LIBafGg7CK9gpTKLLMWIv3x
         sZF2BmMFBXM+TQb8RYPHVvKP8ehw1FCXlITWoUD7KQCjCMgB5GL0rwAJYU8Oux/X02Q6
         2ytQ5CinZsws4aM9VU5ybiI1/WEIc5TXr3zFNdZcWncqZyIp45v+271azdSb2q/w7Qut
         XYQRKjdNiM2gZFZSmA5K3+WSdNrpJSlfR/AT/eAwaLzHoHC4lsHTSevoUdUiWc5n2w+N
         7FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678681536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ilTZwrkROtA93tqncN9e7LxKRGS6dxCNGuJc1ZvezU=;
        b=0sRH/1KqeYW0svdED4CRh2MoIpWwhnSTL6eXFT95Yi5PhR5zC3MZGMmDmHllRY7wng
         xqCKxAwXQiwh7t3KmwjVYy3DvfsaaKSNPddo3ZHicI1h39rnRlROWvhpbwFVq9/CdY66
         4MGDrxGini+h0WxoEq43Cf3rRkasgbdeB/NpK45PBSzKqiEfBxBbHqDoEwMdG2vIJXug
         F29u7J8oCEWoUjdAMHDHBK8N9ix/WgMPktY7Tr3mJzFaaSeCtySoAamgQSS/V92m+bK+
         39az+Go8USs8JegnrHrtz3m1vKcud/r0XYVeZoIdiTgOglW+D3WmL1fApjp26TNVvRpN
         +rTg==
X-Gm-Message-State: AO0yUKUKll5Pk1v6IbPCO7MfD4EB/XiPsP7D5C6ab96ToxhI8R3P2egN
        Lh5wMzIz1A7yep0SpPjqQVGLGw==
X-Google-Smtp-Source: AK7set/Y46We3y8oPRLq9iCdsRvPD9E6cPTaUpFq533IX6U0Vz+RvS7+0pchH1VtfLR+NqBg+xlI5w==
X-Received: by 2002:a17:903:24f:b0:19e:bad3:4c6 with SMTP id j15-20020a170903024f00b0019ebad304c6mr28965320plh.58.1678681536129;
        Sun, 12 Mar 2023 21:25:36 -0700 (PDT)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id jy3-20020a17090342c300b0019eae6fd925sm3595904plb.115.2023.03.12.21.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:25:35 -0700 (PDT)
Date:   Mon, 13 Mar 2023 09:55:33 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] bindings: rust: examples: add a
 reimplementation of gpionotify
Message-ID: <20230313042533.ixm5qhynnzbvaosv@vireshk-i7>
References: <20230310104555.62813-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310104555.62813-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 10-03-23, 11:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add a new rust example - a simplified reimplementation of the gpionotify
> tool.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Viresh, please take a look at my attempt at a rust sample. :)
> 
>  bindings/rust/libgpiod/examples/Makefile.am   |  1 +
>  bindings/rust/libgpiod/examples/gpionotify.rs | 53 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 bindings/rust/libgpiod/examples/gpionotify.rs

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
