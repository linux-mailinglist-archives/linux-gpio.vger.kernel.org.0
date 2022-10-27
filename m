Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6AB460F6FF
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Oct 2022 14:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbiJ0MSR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Oct 2022 08:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234509AbiJ0MSP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Oct 2022 08:18:15 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85007A2856
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 05:18:13 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id v129so1356146vsb.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Oct 2022 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c/1v3MDHKmUuMDnZkY9CyXTvRNdsSCP8+f7KKAGBU3Q=;
        b=Q5H/8HKhffVOo4TlSWhG9ElPAum8MttNHhP8gR0S7zYb/250VLuqrzcu6cbPon5waX
         ETBLpJgV8U4DWpf59DFum3E5dxaaXJvIwE1b9k3f7RNlk6ww5+qkfsMuBMM4woIncCQn
         X/ozk5rQQisQuI5ZxWxNY1hZWKQmO+dg+X7wOUpklWITBS0kky2zuQyVEw8QWfYY5xyK
         mWfQQYny1ThKReVEVnzV3OGqFdIfiqQTMEgSRWlON0TxKaVnpzTylTK9xiVsutdVldZS
         aiz+Ekh+jhImN0kga33Ip16ZXI6XPS9hDmHlr/BuO0aKCxesgLEtxvELt/hW/1kZ5qEt
         cp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/1v3MDHKmUuMDnZkY9CyXTvRNdsSCP8+f7KKAGBU3Q=;
        b=CtNW4yEnps8+aiTs0IRYTyAU1Rc0X/MqGy9A7zi4NVrp0fRCEvQOiTiAI9eSZBRy1F
         rrMW0xuRqPupFi+/X1cEk98NFWPGT6xjVmmlv6Pa3rCFqusUJJUe9D2CHvoWEdlPJQhC
         8bhdOpKIdduydeT+J9INtdssVSef0oCJOiDSpYvJn0PMykNPsBLQulggaOpX3S9HM76z
         1zD7djNIQAOqDrX53+8qfCQPZu3fnYljbJghO/X/aSXHNeHrQaXeKV6yhAgg44ViV0o8
         G5vPx7/D5vUkdjFwSYv9stYCHFxF+cYClMfdVK4GId13IXR2j/AW3HBlZJgCg9AEv5D1
         30EA==
X-Gm-Message-State: ACrzQf2+ARcm4Yf7W6fzQE2VERNkgHTCpsezKDngJAaEzSpIo02+UVEn
        PY1lFnXWnWOuaudypiCD451hLfN0OAU3TCv+Pazv8V6rVYM=
X-Google-Smtp-Source: AMsMyM6120L+UszFvw7eU681Mvz+9iFz5rgQCavi57hJD6b6GDOjXcrssfntw+TYPdqKRjAO2dSRxfC/c6EDn2r+nJs=
X-Received: by 2002:a67:ac0e:0:b0:3aa:86c3:e6fc with SMTP id
 v14-20020a67ac0e000000b003aa86c3e6fcmr410460vse.9.1666873092599; Thu, 27 Oct
 2022 05:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665744170.git.viresh.kumar@linaro.org> <c8ef89c343a0c31e4132cc6757fdff8dec0d1669.1665744170.git.viresh.kumar@linaro.org>
 <Y01RqjgZINnkcyIC@sol> <20221018112204.l36wnimrqvexnvat@vireshk-i7>
 <Y06S5GCFYeaPEW9E@sol> <20221019064612.p4gu33dm65rnjwl6@vireshk-i7>
 <Y0+lZ9qcNGX1Q/Of@sol> <20221019112251.oyfek3gjodyt67lh@vireshk-i7> <Y0/nNRu0OOXXfq/h@sol>
In-Reply-To: <Y0/nNRu0OOXXfq/h@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 27 Oct 2022 14:18:01 +0200
Message-ID: <CAMRc=Mc_f2=Qhok3b3FCcu3Hsu4pYhGVo4upow7LtCf-dNRXdg@mail.gmail.com>
Subject: Re: [PATCH V7 1/8] libgpiod: Add libgpiod-sys rust crate
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 2:02 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Oct 19, 2022 at 04:52:51PM +0530, Viresh Kumar wrote:
> > On 19-10-22, 15:21, Kent Gibson wrote:
> > > That doesn't really work - you get a link to the files in github, not
> > > as a web site.  You need somewhere that will host those generated files
> > > as a web site.  You could do that with github-pages if you don't have other
> > > options.
> >
> > I don't have other options for now, so it is github.
> >
> > > When I've done that I would commit the docs to a separate
> > > branch, just for the docs, and have github-pages host that branch.
> >
> > Okay.
> >
> > > If you eventually publish your crate to crates.io you get documentation on
> > > docs.rs for free - and you can skip the documentation key in that case too
> > > - it defaults to the appropriate page on docs.rs.
> >
> > Right, that I knew.
> >
> > > I assume that would be the case long term - you just need to find
> > > someway to host them in the meantime.
> >
> > I wonder if we should be doing this at all right now, or if required
> > only Bartosz should do it instead of me, once this is merged ?
> >
>
> I was assuming it was an interim solution, so it doesn't matter so much.
>
> I'd be happy with docs.rs once libgpiod v2 is released and the bindings
> published to crates.io, and I'm personally good with looking at the
> generated docs locally in the meantime.
>
> It would be easier for others to take a look if the docs were hosted,
> but I don't have any feel as to whether that is worth the effort or not.
>
> > Maybe we need a libgpiod username for that on github ? To make it
> > independent of personal usernames ? From what I saw, the website name
> > will be username.github.io eventually.
> >
>
> A libgpiod group account might be useful.
>
> And it would be nice to have a libgpiod space somewhere, not just
> piggybacking on the gpio mailing list.  Not sure if github is the best
> place - but I haven't given it much thought.
>
> Bart, do you have any opinions?
>

For a long time I tried avoiding github etc. but I think I'll finally
have to give in and at least set up a git mirror and a discussion
place. Not sure which one is better, github, gitlab, something else?

BTW about crates.io - the python bindings in libgpiod v2 use setup.py
and I also plan to publish a python package on pypi so
decentralization is happening this time.

I also plan to split the yocto recipe into libgpiod and python3-libgpiod.

Bart
