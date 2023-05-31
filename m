Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7815B71730B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 May 2023 03:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbjEaBRy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 21:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbjEaBRx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 21:17:53 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D1D93
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 18:17:52 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-33b6c47898dso15399215ab.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 18:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685495872; x=1688087872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jhC5pz1Tc5mkDxexd5UaEcBIiR1PVqQq8612BCmFh4Q=;
        b=Pa5sAkw4YMBmgYO0mz7lbMP72MupBmpMxrxOlGfw0UNMN2hSyxCo0xQTtta/Ne1wDj
         cx9Naf8OFFsW4RfNpRLIeZqb19Z9w1fhVGGmfNhQLazGvsNsQDNexu2WUOd4mcERyRyi
         o+r91liFQoYMYMgsge2qryO02FxCV4qNbNQo/nnUPMolbL4MzmE78OXGWXNbvWc3Vw6r
         ZAesCu5xz7cKZattjT3TIns05y+9AGd71/p7SyaSQikYL2KpoyAROLDRWHtQSR2vS89s
         G2w6bHysYvPr74G1kOtX3iCwBv508OxctXs0W+ciaUHEXzWM5LFrNzAOdQCeUxgFd255
         83vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685495872; x=1688087872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhC5pz1Tc5mkDxexd5UaEcBIiR1PVqQq8612BCmFh4Q=;
        b=bQmqVfxAT1KsNRlxkcPtQCdKtSMClew15spR+aqmH7mMO9Mw8mB9r07A1PUBCdsP4j
         e8CD9XQy4HlFpbe7PBoiChoXoqXPtyZPskWUzOrsRuBCgUptyKrh0r/roJ26oHWd/Dzd
         1A0WGMxUs0XqwjuI3RzfRsHlC2n1/lzjA4NJwKAIYtplHcqK3KLekvLfhrI07Obo0Zt2
         9zAorc0+/84PQuC8S/eKCQ/DWJLsBhA89hwyVm75pYGB/cX7XVYPS6WoudyV2uhC2R5O
         6mv74bHPxzXZMjsa8cUGlpd3Mcde+VeAFeNwtR5j8TyWZkQlczaIJ6nnUlGIoWoLW8TL
         wTvw==
X-Gm-Message-State: AC+VfDzzEBKS7MmxF0ixVpbpCa1sfg1/Gd4Wchy2mMGR0gT0eShtPfiL
        omukll7cpp/nN6lGg4nomXrRZZu8aeE=
X-Google-Smtp-Source: ACHHUZ7n649yOtNmq9wTLP9CnGfbCAdvLmBvNNA20fE6sD5xH6wBb6t5kXVl10beabyb0aXbOGIRzg==
X-Received: by 2002:a92:d08a:0:b0:339:f011:77f5 with SMTP id h10-20020a92d08a000000b00339f01177f5mr1142378ilh.12.1685495872027;
        Tue, 30 May 2023 18:17:52 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902d2cb00b001a1a07d04e6sm126054plc.77.2023.05.30.18.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 18:17:51 -0700 (PDT)
Date:   Wed, 31 May 2023 09:17:46 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "Slater, Joseph" <joe.slater@windriver.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZHagOu0OcWKkMQ+9@sol>
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol>
 <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
 <ZHXKRtJOYSw42BAi@sol>
 <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
 <ZHYHAXLPwX0C7aTK@sol>
 <CAMRc=MciugO5qS_fzfEipWN7vHBUKWLVkAJFLShZeuK8u9W9Bw@mail.gmail.com>
 <ZHYTqIt+CZOf4XTR@sol>
 <CAMRc=MdHTjFeY_ba0o1YcnYp2JvdovBc0LiWY9oRaMNkMLBZqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdHTjFeY_ba0o1YcnYp2JvdovBc0LiWY9oRaMNkMLBZqQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 06:07:52PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 30, 2023 at 5:18 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, May 30, 2023 at 04:52:36PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, May 30, 2023 at 4:24 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Tue, May 30, 2023 at 04:13:06PM +0200, Bartosz Golaszewski wrote:
> > > > > On Tue, May 30, 2023 at 12:05 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > I went with bats because it looked the fastest to write tests in -
> > > it's shell after all.
> > >
> >
> > Really?  I wouldn't write anything of consequence in shell if Python was
> > an option.
> >
> > How about Rust?  I've gotten over how spartan the Rust test framework is
> > so I wouldn't have a problem writing it in that either.
> >
> 
> I have a very strong preference for Python. I am quite bad at Rust.
> Whatever is in bindings/rust/ is Viresh' jurisdiction and I defer to
> him but I would prefer to be able to keep track of what's happening in
> tools/ and work on it myself without too much frustration. And writing
> anything in rust has been pure frustration so far.
> 

Fair enough, Python it is then.

I personally had no problem picking up Rust - seems Rust and I have a
similar view - I've always had issues with the vagueness of ownership
and lifetimes in other languages, particularly C/C++.  Rust gets it.
And if you do make a hash of something clippy provides good suggestions,
or at least clearly identifies the problem. That helped me a lot with
the learning curve.

Cheers,
Kent.
