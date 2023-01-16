Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4497166B713
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 07:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjAPGCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 01:02:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjAPGCy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 01:02:54 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29829901F
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 22:02:53 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 36so18932978pgp.10
        for <linux-gpio@vger.kernel.org>; Sun, 15 Jan 2023 22:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+pKxCfcqE4qFAgCtzU1NuUd6ru8g0qHu3lm0TV5pD8g=;
        b=E6dBUXu3p8QeBFmchJYF78CI5faDnlwkMyE3jEuGWMbegl+wy5sZUY+lUkYM+0DrJB
         YRnPEpkLk8Ehf65PLZFxk5lktzDLPrTe6j7GbzTMs7ybSjNKatwytmKehzH1b88ixwMB
         sRZewyg/v3PYGHp+LnOR0bUJB9YaAlrGmM0Esem8sRD8e0kZZbppYvrrA9+t5qoykPhL
         WhGMN9KRZDLARjpFnLkOkOgXq8qbnUaTU/hmlStoEjej175lVIU68TcmFtEogWz4O2Rp
         A8F+GYrOXpU2ZRsGMj9netJZZPNVtYBY0N3TuJbpvhFVDAWFIspEaGrR55DhoqdBo6AV
         /rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pKxCfcqE4qFAgCtzU1NuUd6ru8g0qHu3lm0TV5pD8g=;
        b=IJFHlbOMgmPEdzoZm/v6ICiv9D/xR9F4Ghla3Ah1JjG+daJ+0p+6jCgG/h2Tyx5VSZ
         YimiSbooZ2fVs7TM4IlHMEOTzPvBhxWIIw36tLU+04ngGI/GkMTM/C1IM79qstUcSo8S
         gyV/qI5PlxIJx6221FFGTbp67FiVeOa1I5oyZH92FBKBWDaqjNP0wA9zy5onrN6MOYG5
         wjcIvWXCH0fkZC6bw9WluZ4napekhBbz1WGYJVZxSCjub2eV9L58aOu838E2RATFJ9Nd
         1q3HCT8QqeuliByeT3Rz4H+cR7p5+ySClGhfi2hXVijnuyzpOYPtgIVpvSQXfzGcwgSo
         U6Aw==
X-Gm-Message-State: AFqh2kqQnhqrxTK9Uq1kRjb2S3UkQ6/Qd5iSzh2HzzdDzq4RmkdzrIGt
        8/q4ak/OH+N/UCi1EnbdXiRoJw==
X-Google-Smtp-Source: AMrXdXu2uCLgbfLO/Rx24LuKhOP1zRdNySR7zQt99W6TxdIGNPbXdvEWaFhzTYJoDQidK7zWhjHdLA==
X-Received: by 2002:a62:1ad6:0:b0:58b:b29c:50c2 with SMTP id a205-20020a621ad6000000b0058bb29c50c2mr13399661pfa.26.1673848972692;
        Sun, 15 Jan 2023 22:02:52 -0800 (PST)
Received: from localhost ([122.172.81.45])
        by smtp.gmail.com with ESMTPSA id z13-20020aa7990d000000b0058a313f4e4esm11593299pff.149.2023.01.15.22.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 22:02:52 -0800 (PST)
Date:   Mon, 16 Jan 2023 11:32:50 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 15/16] bindings: rust: make mutators return
 &mut self
Message-ID: <20230116060250.c6i6ouu2ojutubcd@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-16-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113215210.616812-16-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13-01-23, 22:52, Bartosz Golaszewski wrote:
> diff --git a/bindings/rust/libgpiod/tests/line_request.rs b/bindings/rust/libgpiod/tests/line_request.rs
> index c3fc37b..561f4e8 100644
> --- a/bindings/rust/libgpiod/tests/line_request.rs
> +++ b/bindings/rust/libgpiod/tests/line_request.rs
> @@ -97,13 +97,11 @@ mod line_request {
>              config.lconfig_add_settings(&offsets);
>              config.request_lines().unwrap();
>  
> -            let request = config.request();
> -

Why remove this ? And open-code it ?

-- 
viresh
