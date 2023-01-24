Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50F43679139
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 07:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231772AbjAXGo4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 01:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbjAXGoz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 01:44:55 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8B527D55
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 22:44:54 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id jl3so13810756plb.8
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 22:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlRI0/qEYLRdRH4/bSJLANGKOVhsMAfKESqxrrk3t4A=;
        b=Pqflc1+WAUJ7mOwE6gD/WheafjucWIQqfFMmjuC4VH+DISBf7x7h9L6dV655Morqoq
         XUErD6X7lgBMDghCS+ddHZpTXcyPDiaW92cCXzKOdAYVIap4eC5v+Aru/0dNrGPKeEvW
         t3PzUJKX7pcHpAfjQZ+raQSjTNJQ7unRHDWPUBU7c85PUjVsksBTAqrzw7UfSgf6AMRE
         /c3827dBW6bdOio6sAhA/Nr8TAnYjeUg4tacd2eIWCs/N3MwO4ESEhvRQxws57+mL0rR
         iCzL8WWY1nTB1s0TuA2OlCHniE1srAQ8r5N27fKNJyQ+M/kcUhqYqdJzgTG4niCF1RZi
         FfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlRI0/qEYLRdRH4/bSJLANGKOVhsMAfKESqxrrk3t4A=;
        b=tkZjRoToCTLH6xByO/Y443ifQ2GjWhIkQ9ZLzAR6PcZ9L6/qIYGdd3HoGsSvKDsjX3
         BF0NqY23Zg4wyxSUoRdG2yVrUWhMiL5hZzlfsA2z/7fV4xd/S/DmQaAVeDaub8OwJF+I
         BMsp9tMvSvaalEvbGdf4VQjMWrBIR+8/pzMzlz/CcASa/HjY9kPkBgtPh6oOAMZuNNWX
         5kuastZy53UGu+vIqMYIpjvFmi7yS2EqzJRFHVR75mkyQegthGP2JPwJ++WXSNGmgyuj
         Xl42OWcI7CSOGF6P3TIDjUgqbfHGEgoj76ChrNtGeDr2cwOTA+0dASS0vR2tMi6t2niH
         wdTw==
X-Gm-Message-State: AFqh2kpKe4/roftcMofUo6aFTauM/BdqMoajzGl0XYaMYYgc0sP27HFE
        Itd/PUi/huclUntGKawNa4xJjManC8DIbMTG
X-Google-Smtp-Source: AMrXdXt8RoE63Y3LM/Rne8c7DlLLlRqd6de4PYhoYvByI+sIMUoaUnDbjqhsIk5Yo6D65IVqkF8ahA==
X-Received: by 2002:a17:90b:3755:b0:226:eec9:6b62 with SMTP id ne21-20020a17090b375500b00226eec96b62mr28338020pjb.22.1674542694392;
        Mon, 23 Jan 2023 22:44:54 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id o30-20020a17090a0a2100b00226c2d90c04sm479551pjo.38.2023.01.23.22.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 22:44:53 -0800 (PST)
Date:   Tue, 24 Jan 2023 12:14:51 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH 04/16] treewide: unify
 gpiod_line_config/request_get_offsets() functions
Message-ID: <20230124064451.2snjos7ufvvju54t@vireshk-i7>
References: <20230113215210.616812-1-brgl@bgdev.pl>
 <20230113215210.616812-5-brgl@bgdev.pl>
 <20230116055209.b6ydvderreqtqedp@vireshk-i7>
 <CAMRc=MfkoD2SRNtyoqYdriGj82m-dEP3wNXinp=mOi=9axRzMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfkoD2SRNtyoqYdriGj82m-dEP3wNXinp=mOi=9axRzMQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23-01-23, 14:58, Bartosz Golaszewski wrote:
> On Mon, Jan 16, 2023 at 6:52 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > For Rust changes, please run these as well to find any formatting
> > issues, warnings:
> >
> > cargo fmt --all -- --check
> > cargo clippy --release --workspace --bins --examples --tests --benches --all-features --all-targets -- -D warnings -D clippy::undocumented_unsafe_blocks
> >
> 
> FYI The first command introduces changes to unsafe blocks' coding
> style that the second one interprets as unsafe block with no SAFETY
> comments. :)

Heh, I also stumbled upon that (bug) earlier. Basically it
doesn't recognize this format somehow:

/// SAFETY: ***
let ret =
        unsafe { -block- };

Just ignore that for now.

-- 
viresh
