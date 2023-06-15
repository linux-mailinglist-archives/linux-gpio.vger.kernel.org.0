Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9657F731CD9
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 17:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345209AbjFOPkW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 11:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjFOPjx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 11:39:53 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE12B6
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 08:39:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-25e7fe2fbc9so1089624a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jun 2023 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686843592; x=1689435592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IQx9qjKxxMNCHdwpW4UHPwR38ZIzlONqN+EUZwtFXYU=;
        b=QUAVyWQeAv34sgznMfZjqMiDzslvZ7YPuirpmQhs6Tx9QJ4259ZXwi8yNMwotbzndG
         TBAIJRWbBI5fpfBDihaz53d2Phi+IvPd9fgBEX2I27ndip2zVm8wMKMKt0ca2UI5U09/
         SHPIQwulOH5YaBLjd7nq5sxM80BbBzjkrGNwEqgIu8yfjFRNXT4RfCNPHO3pdZxcs/Pn
         HgQK3ZU/AVKKqf3ZX9k8AnbjrS8BSrLJvbXCVYmrNr/fy0B92HGxtT7eH9WRYFwg1S0r
         DscC1CZjs2kFmP8C89sAzD338sYPDrZ0/6uzDz1O/NTXaLLhnJqybaRAdJ44+TXv702R
         DEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843592; x=1689435592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQx9qjKxxMNCHdwpW4UHPwR38ZIzlONqN+EUZwtFXYU=;
        b=VoW0QqnUkgT2lh0mm9tOdjP+GcPqPLszcUm4c9JMztj1Kxwvo55Vx/h55EH/fq58yr
         OJlcnkDgAhnO6nqguOwnD1IdWvewShXNYrfpwUC2uOgXkvd6EOqqMAA+yQ1fGA+nNpR7
         LOqWwTkRzA5D1NC/RyXeAE3U5A7J5U+zapwims1C7laAf1pCDBCVfDyHMn3vU7e5p7fX
         8qGkXz8j6y50z1lUACuhddD06pvzNw3UvLtFmOsK7sqrNDMXLnEriWvZIVBWZqUqEx6J
         q7zMgINw1Qu33cdmIcA5TK0Nizq4HZGth/4A07shHbWPuw4sGnzArO9VP238U/Yqs6qE
         m/lA==
X-Gm-Message-State: AC+VfDxelxRfPPAUMgAeUBC4P+D74ixr4EKkob5inWYmd00EED4S+N/P
        R4rFk5uwms7uz/llrIH4r4gyq9vuMyA=
X-Google-Smtp-Source: ACHHUZ6b8Py81nlsYnqE3AMo7FZyaVov1hgRxGfbamekt8EFYLETgW2KKtJaItnFfkBvXjxp6rpbaA==
X-Received: by 2002:a17:90a:7342:b0:259:548b:d394 with SMTP id j2-20020a17090a734200b00259548bd394mr4281232pjs.28.1686843592088;
        Thu, 15 Jun 2023 08:39:52 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id qe10-20020a17090b4f8a00b00259b53dccddsm12875146pjb.34.2023.06.15.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 08:39:51 -0700 (PDT)
Date:   Thu, 15 Jun 2023 23:39:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 0/4] dedicated examples
Message-ID: <ZIsww5gkT0dVYvSb@sol>
References: <20230614035426.15097-1-warthog618@gmail.com>
 <CAMRc=Mf3vtfUyprLcJ7g8Y_Jt0k4=FoKMjjxqRA__YNmqeCDLQ@mail.gmail.com>
 <ZIm+4qmSUgFrVzLc@sol>
 <CAMRc=Mc3-SfvYYYvocMyjLtbPk=f=EyAOHXcKj+eFWvVWrGurQ@mail.gmail.com>
 <ZInHSgsfALvbTmAX@sol>
 <CAMRc=McCKjU9NbarB-0awfUXwECMFna5aKi9yB68pwxHEebUhA@mail.gmail.com>
 <ZInkHSGf/HeBttPc@sol>
 <CAMRc=MdqZtqnBuMjGLKo6FOSfAAanGsYu9aAWiZuhnTgzEVaDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdqZtqnBuMjGLKo6FOSfAAanGsYu9aAWiZuhnTgzEVaDA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 05:16:04PM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 14, 2023 at 6:00 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > The C ones are specifically for simple sysfs-like equivalence, as telling
> > users they need to replace a single write to a file with ~100 lines of C
> > is really hard to sell.
> 
> You don't really need 100 LOC for a trivial request in C (it's a bit
> over-dramatic :) ) but my thinking is: whether it's 5 lines or 10 or
> 100 - it doesn't change the fact that it is a fundamental change from
> sysfs in that you need to write the code, compile it, link it against
> the right libraries etc. etc. It will be so much more work no matter
> how much you simplify the API and that is already enough to scare away
> a lot of folks used to just writing to a bunch of files.
> 

Sure - those using scripts would probably go for Python anyway.
But no one in their right mind would elect to use the C API given the
alternatives, which makes it basically pointless.

> This is why I'm proposing the DBus API as a way of replacing several
> features of sysfs that are so beloved by users: central authority over
> GPIOs, easy to use from shell scripts (just replace "echo 223 >
> export; echo output > 223/direction" etc. with "gdbus call --system
> --dest io.gpiod1 --object-path /io/gpiod1/gpiochip2 --method
> io.gpiod1.Chip.RequestLines <args>" which is just a tiny bit more
> verbose but achieves the same goal and exposes all uAPI v2 features)
> and only requires including the dbus daemon in your system which would
> be packaged by most distros shipping libgpiod eventually. DBus has the
> advantage of being usable from any language you fancy and still being
> relatively fast.
> 
> In other words, I'm thinking that packing a lot of "helper" features
> into libgpiod will only lead to feature creep but not achieve the goal
> of pulling people away from sysfs.
> 

And you think I'm exaggerating.
Removing a few pain points is not "packing a lot of "helper" features".

Cheers,
Kent.

