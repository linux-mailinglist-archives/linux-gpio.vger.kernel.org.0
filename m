Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2CB62288D
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 11:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiKIKgV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 05:36:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbiKIKgU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 05:36:20 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FB9193FE
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 02:36:18 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id io19so16694789plb.8
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vKGPZN6CaDW/W758veLJq3VgUkMyYMOe083MaAE+njE=;
        b=qyj1MuiRQphz1fnb+vlFQdQtYr0Ri12Ok+re1ZblcrJ/EWFMUZOiGlPaEfdfnwspTk
         yz6oTFT3Bmtx9V+bHO7L8FlQN1fRQ1ktXWa29WuoQysPHO1GBnTN8ZJp6SFJXXDv7qjb
         G2O4OlYPZZYaSTZsSxas55YCtlyP3y5zJxBrTuneg3HOt3yQTbNgMPYuqJxzijjFIYL2
         AiMZZzpEghz/bSSwPrOhNthwTv95rIyGDa6ewOLYT0lcXFDTHKUT9Gij1hMoEmlHyDwR
         o+HzPdtWfnHfmuVmjxSRUhbei5tWjUY0yZPqRNtb8FzDwvZ9Ee7xHZX22td8FMseAmaZ
         3j+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKGPZN6CaDW/W758veLJq3VgUkMyYMOe083MaAE+njE=;
        b=4dHfZ19RIVeQaCp3oBCjydCbezpGw9iOEfSxeYXAqWdbMq/uuga/w3ng0aKXLDkDlY
         c5Ct/zDRX9qOHFN/VopK85sbYjxCYarqyrn3VjLn8pRbF9aEdtYM1hoKRK+zGm8DZx/r
         DtT8T8FwC9w8S0imnhyTmrMaZw1t0xnanhhUQQERaHeZZ31+rc3B1gmvivfDnj88zWba
         J3Cu8586fK6soXwkI/juevAARdF28OWNSNBoBrEBVzbU/cXLdPoxtl6yp7cJlTshElBE
         uCOmSULc7YV2teOv7y2Rzm3jchdWGGQeovxV6oPQ+9VPs8RjZF9J0lRZEZL3rWQbL6jA
         DOpA==
X-Gm-Message-State: ACrzQf3LSwZAjCVs2nRMFBqioOQrEVJe0jKljb6R9tbF331P7Av9mYdv
        mRNCwTGnZ0yr0EmdfBviz4I=
X-Google-Smtp-Source: AMsMyM71W+fraSHnfAqb+uWi6Nu1QSnlwFlhgddMHBJdNflCaHTZFKA8kL+uQOZr/q2gn7oH0j8Fkg==
X-Received: by 2002:a17:90a:f0d1:b0:213:473e:6ff0 with SMTP id fa17-20020a17090af0d100b00213473e6ff0mr60451670pjb.87.1667990177571;
        Wed, 09 Nov 2022 02:36:17 -0800 (PST)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id mp4-20020a17090b190400b0020647f279fbsm893684pjb.29.2022.11.09.02.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 02:36:17 -0800 (PST)
Date:   Wed, 9 Nov 2022 18:36:09 +0800
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
Message-ID: <Y2uCmSiSatVQD/Hb@sol>
References: <cover.1667815011.git.viresh.kumar@linaro.org>
 <d9d71dc939ad39abf262f5442d423c2241336548.1667815011.git.viresh.kumar@linaro.org>
 <CAMRc=Mfb+CVA+2fThZqUFWYYmk1dU9NiMMP+rZtbcNFyGehKrQ@mail.gmail.com>
 <Y2t30tYwSqGW8HlA@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2t30tYwSqGW8HlA@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 09, 2022 at 05:50:10PM +0800, Kent Gibson wrote:
> On Wed, Nov 09, 2022 at 10:30:55AM +0100, Bartosz Golaszewski wrote:
> > On Mon, Nov 7, 2022 at 10:58 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Add tests for the rust bindings, quite similar to the ones in cxx
> > > bindings.
> > >
> > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > 
> > Without modifying udev rules on my system - is there a one-liner I
> > could use to launch the tests? I guess using cargo as sudo is wrong
> > but the executables are there so can I somehow run them all at once as
> > if running `cargo test`?
> > 
> 
> I use:
> 
> sudo /home/dev/.cargo/bin/cargo test
> 
> so using the cargo installed in the dev account on my test machine.
> 
> That way I can build, clippy and generate docs etc as dev, but require
> sudo for the tests.
> 
> I would love to know how to do it without the sudo, but as you suggest,
> that would probably require some udev magic or something to set the
> configfs and sysfs file permissions, as well as the gpiochips themselves,
> and given the above works for me I've not had sufficient incentive to
> look into it.
> 

And just to be clear, my libgpiod test machine is a VM, so running as
root isn't a huge issue.

Being able to run tests against gpiosim on a real machine, without
requiring root, would be really nice to have though.

Cheers,
Kent.

