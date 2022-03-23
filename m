Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A51C4E5A03
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Mar 2022 21:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344691AbiCWUqE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Mar 2022 16:46:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344228AbiCWUqE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2022 16:46:04 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32A0410FE0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 13:44:34 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id t11so4904215ybi.6
        for <linux-gpio@vger.kernel.org>; Wed, 23 Mar 2022 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qrk6r9glyK9xF4CKtMgGQNnRspxyzNOiodD1+Os1QjY=;
        b=QLVocad0NWOVxzNN1cy/5Y+/WAMd3y+BrUQBFyy9oyoeuQX84gYTvEWgwJvsvyIJ5D
         eJhDhFBSHzh6vh6xr/TCN6QKqd9hz90VhLezr6Wn7uzQQXw5u6Lei2MOSLukwMoHdRd5
         8ggBfGMJQn+zAP2Y57w3jRnN+0GSUxJJZHK2DQ5705fFeS/mmfCcB3iXX2PKJiHpSyzv
         uWBw2F+l5zbtbFTr2rWF9eC33TXYNyNwfS8j9vEb2WB3B/MlFI0PHbxVJ8700K2AoUGI
         81ZQGsZVQ+NzcUrweXGs5ekkJc7p7DNUYgEt3p07hXVM1VsWSZ459q7+6eDrQ/FRIifU
         YL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qrk6r9glyK9xF4CKtMgGQNnRspxyzNOiodD1+Os1QjY=;
        b=qvGSqTMxnTHp3Aa47O9LNHMDGswU5vwziJYvhvTWcng9Hp+RXax/NMMlF9IQGNLcPR
         D0I2UG1G87nx1lx1w5im44ExlSNQya035gBe8qj/uGGNUbwiUhWpXbMYYMxbB0vT54SI
         T1MDHpJhQIpFbFZoDFcwt4voWQFbLRsxA6uZSqMOeXyniCvZfNYnz5sDT12G49cOA5M9
         jaLEUfG56rYpGLvQ/JEdJcQONSLdF/SK7A48u56JCZPZcZBkBjwl60WK9argaOvnVyE+
         IxKfQsqNdw/z5QhD3gl+lI8bw35ITZSacOpTnTjTJR7F6bMeK+QwM8gtRrTY3m5OeFSE
         PqLA==
X-Gm-Message-State: AOAM532Yj5Jq1M+L5jTPbrC/0HVm30Xd2L21jyL+PCAnIVDnmh+ndFn+
        KFRCAgtP/OdlX0AWNaCZs66Tr00tPqVFxP6giQhWsTkSHag=
X-Google-Smtp-Source: ABdhPJwxVZQNQM3ne9IIOOS3d2mczZlQmDlPD2L0W1UhsjRIYTP9Tq2F54UvnNDaHZhQ8pa/XK8DJwHsgRnFKOiL3dk=
X-Received: by 2002:a25:f406:0:b0:628:c29b:5c39 with SMTP id
 q6-20020a25f406000000b00628c29b5c39mr1868489ybd.369.1648068273416; Wed, 23
 Mar 2022 13:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220310150905.1.Ie0a005d7a763d501e03b7abe8ee968ca99d23282@changeid>
 <CAHp75Vfbs6sPsrjwxNWLZQu=pEoar2K5sY=fX9a7KkOe=mwsZw@mail.gmail.com>
 <CAMRc=Mc_bw40uY68jcPYR-Lwe-qLcxmQeZO47WrexZtSiE_M5Q@mail.gmail.com>
 <CAHp75VcK0JDkTXuPc2N8G+OotXK0mqfQn7i4nDqXDODe1SqcrQ@mail.gmail.com> <CA+ASDXPncB=edDfXqkmWMqToQSt85UkAMzoApgyQATROoR1x9g@mail.gmail.com>
In-Reply-To: <CA+ASDXPncB=edDfXqkmWMqToQSt85UkAMzoApgyQATROoR1x9g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 23 Mar 2022 21:44:21 +0100
Message-ID: <CACRpkdZjSr_-EoZughRLaa83w-0Djj2hM=rqNe4RENudG4eizA@mail.gmail.com>
Subject: Re: [PATCH] gpio: Drop CONFIG_DEBUG_GPIO
To:     Brian Norris <briannorris@chromium.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 5:31 PM Brian Norris <briannorris@chromium.org> wrote:

> I'm also curious: does dynamic debug not suit you?
> https://www.kernel.org/doc/html/v4.19/admin-guide/dynamic-debug-howto.html
> TBH, I never remember its syntax, and it seems very easy to get wrong,
> so I often throw in #define's myself, if I want it foolproof. But I'm
> curious others thoughts too.

Dynamic debug almost always assume that the system comes up so you
can go in and enable it manually. What about problems during boot. Or
if the system doesn't even get to userspace?

GPIO and pin control can be critical system resources and the
platform may not boot completely or mount root as a result of some
problem you're debugging.

True, there are ways to pass arguments also on the command line
argument when the kernel boots.

Figuring out how the command line should
look to enable -DDEBUG at boot time on say drivers/pinctrl/intel/* is
a pretty horrific
exercise. Add to that using the boot loader interactively to type that
long argument in for every reboot.

In all such scenarios what people do is go into the Makefile
and add -DDEBUG to the CFLAGS as a hack instead, because it
is faster and persistent.

Adding that as an option in KConfig achieves the same thing, just
easier than hacking the Makefile.

Yours,
Linus Walleij
