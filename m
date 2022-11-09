Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC0E622780
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 10:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbiKIJuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 04:50:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbiKIJuV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 04:50:21 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7614D15707
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 01:50:19 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id c15-20020a17090a1d0f00b0021365864446so1401706pjd.4
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 01:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qnPWSPYTJoMaTghHts5IPiQP4RDsU18CYNBfTcok5a0=;
        b=UINB9H0XdXDdkyU3A6WMvzFCw6OrOSuSM8kINefuxQi2yknHassUfYt7VzgSrdKUHZ
         0OO5kr/20+6ccOCeCZCnW6wKw0ZOjspal3+HVzt6cI33/8cbzICqx7ESFEYbxDbq3fDe
         PC0G+YlmoxJO4OWC98n0ultDzDuMa3Y2Ld4nHPJMefxzDhJctLJ4SsUfXqcfEikz5UNM
         pHGK3sISwBNziE/hiFunzsntS1MdUEjzCQ4wAulwRxMMIV6T+RQ8ezH/dGTNdrVQujm9
         1imn5eWVl9NQgPvvPmTHdfmqwDDpTUBgRd/TMy1Sh4uytOVvQjKMLrdW5fancLJ1MGi5
         e/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnPWSPYTJoMaTghHts5IPiQP4RDsU18CYNBfTcok5a0=;
        b=v9B4Jz5isMvfTd6ADhB+hgq7XKGccZvIYayroku+J4nz5MdFl3wWImRaR0+NGTchYW
         cuimmddf5WabFAM/99GuTaXhjX91YRyieHTIxIs9eQI9or0d+MbLrT6hHpoj0e+myqiL
         GNVYeKnisK+cYPb70kChvgiQAsQA9Ng+I2oj9WBfiv4qgzJrkviMUGTno1sX/4lbasZE
         EJ+zn4rUYpGwAvUoLfnAFcsARHjyCiQkx/4ybAIkdOedTyJPd6bXRkc8VaJeknxB4yrn
         +91IEpqvXCaWSGJvWOBFPBNiGI+dvys6E0ksyCkmkUyMh4K5OgejS1y6P+PUsdhLK3ql
         koow==
X-Gm-Message-State: ACrzQf2hUFyQuox/nQJfZ3rh18Ma13wVz4h0zuc36BdvTwd1grWQWiJb
        NQYdCHrdKgWR2kdmbx9h2js=
X-Google-Smtp-Source: AMsMyM6VHYfzlxKFO7q6Fu7qlxy7cGRfEFa0al11ASg0FBU6qR/p9+ktnprwBdkHZYqAusdiq1du0w==
X-Received: by 2002:a17:90b:24f:b0:216:7247:4b9a with SMTP id fz15-20020a17090b024f00b0021672474b9amr31851350pjb.163.1667987418955;
        Wed, 09 Nov 2022 01:50:18 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b00186b945c0d1sm8668318plj.2.2022.11.09.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 01:50:18 -0800 (PST)
Date:   Wed, 9 Nov 2022 17:50:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        y86-dev <y86-dev@protonmail.com>
Subject: Re: [libgpiod][PATCH V9 7/8] bindings: rust: Add tests for libgpiod
 crate
Message-ID: <Y2t30tYwSqGW8HlA@sol>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <d9d71dc939ad39abf262f5442d423c2241336548.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 10:30:55AM +0100, Bartosz Golaszewski wrote:
> On Mon, Nov 7, 2022 at 10:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Add tests for the rust bindings, quite similar to the ones in cxx
> > bindings.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Without modifying udev rules on my system - is there a one-liner I
> could use to launch the tests? I guess using cargo as sudo is wrong
> but the executables are there so can I somehow run them all at once as
> if running `cargo test`?
> 

I use:

sudo /home/dev/.cargo/bin/cargo test

so using the cargo installed in the dev account on my test machine.

That way I can build, clippy and generate docs etc as dev, but require
sudo for the tests.

I would love to know how to do it without the sudo, but as you suggest,
that would probably require some udev magic or something to set the
configfs and sysfs file permissions, as well as the gpiochips themselves,
and given the above works for me I've not had sufficient incentive to
look into it.

Cheers,
Kent.
