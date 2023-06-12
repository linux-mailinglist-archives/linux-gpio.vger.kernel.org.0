Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E16572B8DC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 09:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbjFLHlr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 03:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234972AbjFLHlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 03:41:39 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE8F99
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 00:40:58 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-33e75ca0a8bso19164435ab.0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686555574; x=1689147574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oUKpV9vfyk7GrgyZDVSJBZxFDYaJcmjInhV4WwDC8EQ=;
        b=AV5rRNwqtctWMxEDxiVlvKAVy6XpfoRdPat+2RuxsLsfOFlyQs6Mvf6NUGUNetDmad
         /mBWmDNgQkdtbQ6ZgFa75/lBbyHFfGMSUsWCRhHvY3yrXLSrgn7JbydCBqI2qKwpjo4X
         EWF5D3z6fx+WEkjDUOdNIPlRWIVJjt++clYvN+guRwJRPI+tlarlUFqb5R1SFLaS5Lxe
         WeSFcDxRYqa9R1yBwZAKcOJUSxs9PfItRWsV0HUX8PKzQgN6nOi10xEYfhZGMhjsVftl
         cheYpAGJbhKUIsvNwpaunXW3ae/5i/zqbemU/w2xZSK3d/xXqd+RGMv4DBLlRxgN4Zv4
         ieRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686555574; x=1689147574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUKpV9vfyk7GrgyZDVSJBZxFDYaJcmjInhV4WwDC8EQ=;
        b=ZxccJNC0eOYLx865tjzMxvtWQQBPpaOl//LtJBeDbW1L2AZak822Q1/sXSoVer8SDx
         StmZrtw28wABMNLVMHtZGayYzdHy/CiNTkGwxAfMtbyClbOV5MRcBGstLu+lsxwrpD0/
         7a/E1+SUGzco94TBlz2CBKsaFR8iSwQgKHPwZGhbb6y1RbxVs+juwcctEtXA79wX43aq
         7bVpPkQVraT0f0rgGajO54z5rS2WY8zJ367TxF5PZ+L9OSp+KvbLQf3U4qK7y3jy9t+U
         0eze5Hzkg4MTNqOOAALTvGC/izUb6S2sIUJ/72eGx5Jc5MvrufycYr0LYNpTuhwmaKcM
         bz+A==
X-Gm-Message-State: AC+VfDwkGP8dA6DU9as9JE5vk/anoPrAIuPw0UGa8gknQ7i+qDv4UZW2
        DfsMXLLKIbbBZFhTRjf9884aKojsgUk=
X-Google-Smtp-Source: ACHHUZ7aZo362sq6FboOozRzQIhlr7yhD28Sx3Bj4n/I3EDxgoKWf0Y9fQ1c+k/R/UnAQSx9+CkwjQ==
X-Received: by 2002:a17:902:c20b:b0:1ac:8ad0:1707 with SMTP id 11-20020a170902c20b00b001ac8ad01707mr6375319pll.1.1686555132549;
        Mon, 12 Jun 2023 00:32:12 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902cec500b001ac381f1ce9sm7520488plg.185.2023.06.12.00.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:32:12 -0700 (PDT)
Date:   Mon, 12 Jun 2023 15:32:07 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod][bug] building rust bindings requires clang headers
Message-ID: <ZIbJ9yM9zdfcj0kO@sol>
References: <ZIKQVol59uXI5PyI@sol>
 <20230609061812.4haoqdyinsp47zet@vireshk-i7>
 <ZILE258m92XrBvNP@sol>
 <20230609062456.fqw3mqvtcactx2zj@vireshk-i7>
 <ZIQJquwzNacp1Nuh@sol>
 <CTAF85GP5JIH.308KO3L1T9153@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CTAF85GP5JIH.308KO3L1T9153@fedora>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 07:26:35AM +0200, Erik Schilling wrote:
> > On a relate note, how do you run clippy now?
> >
> > When I tried `cargo clippy` I got an error about pkg-config not finding
> > libgpiod. Fixed that by pointing PKG_CONFIG_PATH at my local libgpiod
> > build.
> >
> > But now I get:
> >
> > --- stderr
> >   wrapper.h:1:10: fatal error: 'gpiod.h' file not found
> >   thread 'main' panicked at 'Unable to generate bindings: ClangDiagnostic("wrapper.h:1:10: fatal error: 'gpiod.h' file not found\n")', libgpiod-sys/build.rs:44:10
> >
> >
> > so I guess bindgen/clang needs to be pointed at the include directory,
> > but not sure how to do that without emulating whatever `make` is doing.
> >
> > Same goes for `cargo build`, come think of it - now you have to build
> > using `make`.
> >
> > How are you supposed to tell if your code is sub-par without clippy to
> > tell you?  Or, more generally, how does the development process for the
> > rust bindings work now?
> 
> Setting PKG_CONFIG_PATH will only work if you point it at the install
> folder of libgpiod.

Correct - that is exactly what I did.

> If you do not want to install, you will need to set

Yeah, I don't install on my dev machine - I deploy to separate machines
for testing.  For dev I just want to be able to use the same workflow I
would use for a general rust project, so cargo XXX, and purely in the
code tree.  At least that is what I was doing previously.

> something like this (taken from the Makefile):
> 
>     SYSTEM_DEPS_LIBGPIOD_NO_PKG_CONFIG=1 \
>     SYSTEM_DEPS_LIBGPIOD_SEARCH_NATIVE="${PWD}/../../../lib/.libs/" \
>     SYSTEM_DEPS_LIBGPIOD_LIB=gpiod \
>     SYSTEM_DEPS_LIBGPIOD_INCLUDE="${PWD}/../../../include/"  \
>     cargo clippy
> 

Something like that?
That works for me when called from the rust/xxx sub-directories - I
assume that is the correct level for the relative paths to work.

> See https://lore.kernel.org/r/20230522-crates-io-v2-2-d8de75e7f584@linaro.org/
> on why it had to become a little bit ugly for rust bindings hackers.
> 

I understand why you might be changing things to be able to package the
crates, but in an ideal world that wouldn't impact normal workflow.
Or it would be simple to switch.

> Maybe we should put that example back to the README.md (or into the top-
> level README?)
> 

Sounds like a plan to me.  I would go with the rust specific README.
Or add a file that can be sourced to setup the build environment to get
cargo working from the command line.

Cheers,
Kent.
