Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73AA362D83D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 11:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbiKQKkM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 05:40:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233096AbiKQKkK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 05:40:10 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FD01D4
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:40:09 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y4so1252538plb.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Nov 2022 02:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4VdVnlDOjWBA6i/Nv4MctX/lZfs664kDzRL2ZRRKDio=;
        b=grK8HhS11DKWolWhRSOJ9gaKG59GR5xsAEfMx0SwLUyFiuXE8d0GCZgTffuVlDEyBR
         2er21j92HB+kr/KNfGKX5Xa15x2xtndcPBgEEAL0PcEgkhl19q1EhUW0aVpVZecYwlOR
         5FZSREtXSppS98Ytm+YYoCPc/uHtK7FOyzi/ePthAf4ZIV12IApH6qhcglTo3lTvr328
         PF6yvta6q2cOegcGcpAM5naISBjK92Fc2WMhQyGjA3Hq2Hy9sdALp6XPAkn78VBnkmBx
         RAg15tntO2KJX3rgyP+PKwThNG4mnL+fYjzrx9cFYeCe+X63iSWr1C2jp9vFoBtXF7mG
         FUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VdVnlDOjWBA6i/Nv4MctX/lZfs664kDzRL2ZRRKDio=;
        b=nOYG2RpTh87XqciQJpmQuCVNzXWd8aBGbYFBlSidOs12iL2Mj1XUDABMG+3gdOn11g
         22XE9L5n7p+BaoGk2zzpPSUouqACbJ4E04wxxtPb65PeNdaS6B4u4czU0wDjVGqSmBGl
         jWhFwdOqD5/3n5iPRsMRRIYQ3S+QxQYdVoLvIhKnYL660ZwkzM41pHFOeGyz+1YazeHm
         k1pC49s4PcXmEpORnFA4IGX/182B8rXnMcnnR7CVAFgQOlKalb+UbbCHRP1iwtyztsoM
         yagk7vZ5QLMZ/9ffgC/B13BxAZdbODmCwrcXye1moSroY0h+do7O2d+G7BcGM7KWMKTg
         m8Qw==
X-Gm-Message-State: ANoB5plwB25WJmu5vG0yD0u/oZTBjDcdfHVVf071uvoczheE16bB6bx8
        kb3rNaAUfT3O1NOaWN2KMMetlA==
X-Google-Smtp-Source: AA0mqf4QVfWE4G6PwhiOoT4S6XxH5KBwPmn50TsbLUgiYkNTCNShpxGaRER37neqvfgTf6KDFTi5XQ==
X-Received: by 2002:a17:902:6946:b0:188:5c52:83e1 with SMTP id k6-20020a170902694600b001885c5283e1mr2165867plt.128.1668681608871;
        Thu, 17 Nov 2022 02:40:08 -0800 (PST)
Received: from localhost ([122.172.85.60])
        by smtp.gmail.com with ESMTPSA id c6-20020a170903234600b00174c1855cd9sm904796plh.267.2022.11.17.02.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 02:40:08 -0800 (PST)
Date:   Thu, 17 Nov 2022 16:10:06 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 0/8] libgpiod: Add Rust bindings
Message-ID: <20221117104006.wvpuenedh7wqsjjj@vireshk-i7>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=McWo-kUrMitbm-_YgeEYXx+ARneezAF-Tg7OMwgGydXkQ@mail.gmail.com>
 <20221117073120.g6xhn6i2dbzougx3@vireshk-i7>
 <CAMRc=MdNJV7gnz6-TKYCWt1uus0=urrtiBgmFdASAK7-dvSbzQ@mail.gmail.com>
 <20221117095609.uyamyqi5uuchrxdt@vireshk-i7>
 <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeOVWV=dp_ytxazwoWq4JW1dbr5mfEvQVYFxe-HYgKn_g@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17-11-22, 11:18, Bartosz Golaszewski wrote:
> Do these problems you faced apply to libgpiod too?

I faced them with libgpiod only :(

> Honestly, putting
> automatically generated files in the repo just feels wrong.

I agree, but ...

> It defeats
> the whole purpose of code generation. If we can't reliably regenerate
> them, then it sounds like a problem with the tools, not the library.
> Maybe we don't need to worry about that just yet?

it isn't about reliability of the generated code, but making everyone do it,
even if they don't need to.

Also, the code generated here is Rust code wrappers and other declarations,
which let us call the C helpers eventually. It can be considered like hand
written code here, for the argument that it is automatically generated stuff.
Just that we have a tool (bindgen) here which lets us generate it automatically,
without introducing bugs.

Anyway, I am fine with whatever you decide.

-- 
viresh
