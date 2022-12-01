Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7DB63EBC4
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 10:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiLAJBF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Dec 2022 04:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbiLAJBD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 04:01:03 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 395DD4E436
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 01:01:01 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id 4so1072789pli.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Dec 2022 01:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1VlNlOvUV/fLltQLYSfckHQSZY7b54K0SGQ12ZTygI=;
        b=k2Q+RkRIPT4rlXmAA0fzqkzC3UKbFQFcvGwBJbRgJd6Op7jQQ6RrbZ1s2Uiuk1xe0a
         tub15I6L3oL67Lg1zGMuYitzO5ck42ExKBe/2EhZXVT9Xpv1F/7bWP7mnFDo0cNkaU+V
         Yg42G6ss4fczmLzHoUbSFg0QZhHUwyEYLcvfd1Ic4Kr6f3oyuHpbTyyCdoXrBv1Qxu8h
         aaARCzjp2j1kgWozr3wnkD+3FZThjUg1adlkxWGoW+EdJ3d4Le5KEQvEHglm23dCeaaU
         W+dEApcd2zY1fSaJDI6/69S2LcXkHtaZQuJgIeh7aj/Hy7At9CnN/Z/W1cZ2NVd2HXQz
         GKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1VlNlOvUV/fLltQLYSfckHQSZY7b54K0SGQ12ZTygI=;
        b=R6jrEG9rpwLBnEMM8ecJFLW/33xjM9uZ5uBFuq69swdciY1qp/NKTeQVKw1PKniyxT
         CGQZclHCJsZP13XBgn2u9kw+SnPQsOxD2IubYpusC4tIZF6q95wBxc8BzVWyNGcC00sa
         K7ElOx+zzV/HOHd6bOvY0hjYwLz8z2/XsiiXJiV1t9VBzDgVLPY1kyOSz5Leyu/nCJeh
         YOKz1VVxbzeUf0GOPPumV6Kd71r13NM6DwtK1gsFB//mjiJBg5ZaqZWWTen2/TlGxa8S
         MfsjUfPo4QGZVMZTLNLXco5wGKFagOvCbkMsWPODtWDKabjeIZCnsamV0/ZdEuGhXfmR
         rIjQ==
X-Gm-Message-State: ANoB5pnIy+eOHbob7tGOeevHOAUk90pR9UJSFmqqEC2HNf/6YemJw/pZ
        Bh33MqElgO7rASiO45q+fD4EJw==
X-Google-Smtp-Source: AA0mqf763QQBakS/UaQVtsmygPebMnnsiY6xt5P2lCFroXqhU2sZBICIpoqnFvkGZ7wYYX3U7sby+Q==
X-Received: by 2002:a17:902:bd42:b0:188:ca57:8945 with SMTP id b2-20020a170902bd4200b00188ca578945mr47103642plx.116.1669885260605;
        Thu, 01 Dec 2022 01:01:00 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id z4-20020a170902d54400b001769206a766sm2984381plf.307.2022.12.01.01.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:00:59 -0800 (PST)
Date:   Thu, 1 Dec 2022 14:30:57 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 07/11] bindings: rust: make reuse happy
Message-ID: <20221201090057.bysvguyssvhty6kk@vireshk-i7>
References: <20221130124231.1054001-1-brgl@bgdev.pl>
 <20221130124231.1054001-8-brgl@bgdev.pl>
 <Y4djKAW2Y1RQb98Z@smile.fi.intel.com>
 <CAMRc=MfUo2dq6qCiP4q0K0W2b=fBWdb9Jo3b6b=u9DQDQNArDw@mail.gmail.com>
 <20221201022012.cc24ljwdmu6zuuak@vireshk-i7>
 <CAMRc=MfNK9u87Q17cjbpRcF3Y0Wxnka7mhPWVBV=crrvgppBCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfNK9u87Q17cjbpRcF3Y0Wxnka7mhPWVBV=crrvgppBCA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01-12-22, 09:29, Bartosz Golaszewski wrote:
> OMG cargo cares about the VCS of the project it builds? Good to know I guess.

By default it is git. You can specify --vcs option to Cargo init [1].

--vcs vcs

Initialize a new VCS repository for the given version control system (git, hg,
pijul, or fossil) or do not initialize any version control at all (none). If not
specified, defaults to git or the configuration value cargo-new.vcs, or none if
already inside a VCS repository.

-- 
viresh

[1] https://doc.rust-lang.org/cargo/commands/cargo-new.html
