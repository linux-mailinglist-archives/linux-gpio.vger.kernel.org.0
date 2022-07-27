Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73F4D582065
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jul 2022 08:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiG0Gra (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jul 2022 02:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbiG0Gqf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jul 2022 02:46:35 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07B51024
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:45:11 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id a8-20020a17090a8c0800b001f30e4c002bso439537pjo.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jul 2022 23:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L9x/E3EzdEZGmDZf7vvQwpEGdyRhDioO7j51WnHY3xo=;
        b=K+uyFmSOQZwd+Tmz91pUMsVEV+u0pl+xym/rnwQjHbdYdAHVho3xLd5Zbsk0DB8LQN
         MnkWFCGpKsrscDFtYl9ggq8Mkpav2g/UlY0jwtpNnl9zkah/9Or1wF1t4hlAz+nvOx76
         +sOgyNME/fnJX3Kf1/afoSjyJ7np6CXdFUcFO4Baj1M0SujW1a83QijpJdYwcYEShYg2
         erTKHDLGUkaPbZ3NmtvSWrJwapXQuOeqDIGsBpDgvAZQ32TpNa10yzll0ZSled1fzd4i
         DPI97kocNxcw27qQofZoTl3Bdy7cJG4hFrnqdZ+0e9+QmqXYIPCpuZyZqeXxXO8QccAz
         ceOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L9x/E3EzdEZGmDZf7vvQwpEGdyRhDioO7j51WnHY3xo=;
        b=hPiqtSIYLNLs9qex1vkM3NvUzRX0+kBpns/uQGfmLxvKIzrDFjpcWVkqTS2Dme+FT1
         h6gHC8Y4PRmkzxQQ/vRhcHqNmMFGg6qOI8u5skIqdG7ASMJxkXKRoKJHwJB7awsD/PA7
         y6y6c4I3ofvbIlDHfJHklXoeGMrBkWEpKbfoIPY47D1P1E4oL6h9eM/OQXxkTrVfiWsV
         rNpEnlxQQoh7sxOoP8ZptUUDoKypWa+YCG+JQdGKxDze//t5vlRvVR+wMIyzcYI+esAz
         2JSrqJ441HZfZYl1hWOpSMLL6I/NSUERFEZrtpQqmYyqVtpAgx6UsRlB7hvgTP//8xya
         CGxg==
X-Gm-Message-State: AJIora8dz4up/rK5Kn6pwT+fOx68LoObYwJbg5vhuR0cFKWnQ7Lkl0Qh
        nke90TnES8bNxd8dDNGvdqwI4w1cCYQ=
X-Google-Smtp-Source: AGRyM1u3YvoyunAps8/08vksK5ezFLJX+bwqvRFTaKyUGGHQvT7Bq7GjPjW/ABYjefrVvIyPanAHWg==
X-Received: by 2002:a17:902:b702:b0:16c:4e4f:94f9 with SMTP id d2-20020a170902b70200b0016c4e4f94f9mr20001702pls.78.1658904310659;
        Tue, 26 Jul 2022 23:45:10 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016be527753bsm12989931plh.264.2022.07.26.23.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 23:45:09 -0700 (PDT)
Date:   Wed, 27 Jul 2022 14:45:03 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V4 8/8] libgpiod: Integrate building of rust bindings
 with make
Message-ID: <20220727064503.GA112390@sol>
References: <cover.1657279685.git.viresh.kumar@linaro.org>
 <584910baf342bee3511361c3e486ad4f3e5437f2.1657279685.git.viresh.kumar@linaro.org>
 <20220727025903.GH88787@sol>
 <20220727061824.lune6xhtv2hpgidv@vireshk-i7>
 <20220727062557.GA111905@sol>
 <20220727063527.xspojxe3w2tpg7k5@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727063527.xspojxe3w2tpg7k5@vireshk-i7>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 27, 2022 at 12:05:27PM +0530, Viresh Kumar wrote:
> On 27-07-22, 14:25, Kent Gibson wrote:
> > So you can't run tests on those platforms where bindgen is problematic?
> 
> Specifically for my case, that environment (rust-vmm-container) never runs
> libgpiod tests, but just vhost-device/gpio tests. So it works.
> 

That may work for you, but in general it would be better if the tests
can be run even if the bindings can't be regenerated, so the two should
be independent.

Cheers,
Kent.
