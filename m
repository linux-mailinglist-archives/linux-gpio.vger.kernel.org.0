Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E55C36F7F1
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Apr 2021 11:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhD3JbA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Apr 2021 05:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhD3JbA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Apr 2021 05:31:00 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A597C06174A
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 02:30:11 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id n2so104244216ejy.7
        for <linux-gpio@vger.kernel.org>; Fri, 30 Apr 2021 02:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fVoXNjeEt03nUrGUTubkMACBqqtvUCclEmlslAx16AM=;
        b=AnjPcooLOpK3RAQl++wYM1GDe+y7x1LJxqwsOfXh1cGvfsx/RtMhHxZsLwVF3g8Qpz
         wfgWPzazSqXYcqI4lsD9S9Tx4oQOnZUDxpjF4RLFg8DuUTbhZZ3+fBKRpWFbF9tnkkgb
         lYBWsFFiBkZC7IvKdzLKmrsVTawMljCQq0VjMYvzwi/9AoTr8Z56Ouu7ei/2pxVTp8i3
         Yn20DAHHsNMqNwoTNvzwTPQTD0+BA9JtmNd0pcT/R11eMkqoZkMLFpsQVR3MmAzdtaws
         u9SfFmLluv2NA6n7QO54HAiYykqgGZlVb6CvfDrB0U4l1MtQd56xcIiHY7A2eA0snrK0
         IF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVoXNjeEt03nUrGUTubkMACBqqtvUCclEmlslAx16AM=;
        b=osQCcq3G+9l4RAzpAs07aCUKc4wEs4LH6h2yKiQ+OUC1fZdF6wQJ2Twx8eTHasELBQ
         9l4XKJZOOlwINRcnjr6jIKi8xoJLSKH5vGCb5VS2P+5SHJGwgbs5/8PdN7YXTzIlVB6b
         14PLalKizTI/A12vVX66IR8SZma45hvJQ6wzq5J48ka8zmzk8YqAjI/uVjhsDCJnthrK
         poApIzxaMmW2fLUKHrk8taW14rEBCZD2zSp++plTJazcYUpisaqzB6uT1t/zt/8H6F7A
         CKmSkxuoCqivtsO1/3/pnpZFiBISwyNM77fvOw8IFeneDdH/IX/lgBz2p5oQmbpqkFs/
         /wlQ==
X-Gm-Message-State: AOAM530xP5U/JyivlqSvpnFGjEsj/TCQLh6onEDfa70Ksk8yQENv34n1
        pVt9paM16/TyqzjosNjAlD69I4tsGTAaZG2gzqAgmpkSqQ43+FJY
X-Google-Smtp-Source: ABdhPJxXR9jNF/kasKZ4Yt0WJDVVgeabuXpUqsfenk8lbIZrqJUAC1yNCv1Syc8ah4XZabYSru8Ez8KOb8hTM2uJRpo=
X-Received: by 2002:a17:907:78c4:: with SMTP id kv4mr3199459ejc.445.1619775009966;
 Fri, 30 Apr 2021 02:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210429094734.9585-1-brgl@bgdev.pl> <20210429094734.9585-3-brgl@bgdev.pl>
 <YIqXHXU/tqxXjaKA@smile.fi.intel.com> <CAMRc=MeKciVDxdFvq6_d8mN8M08tqDSc1qDqmywswF2gbUa=Dg@mail.gmail.com>
 <YIrmHkaKnrr4IdCT@smile.fi.intel.com> <YIrmxckO0P1Z4w/a@smile.fi.intel.com> <YIrnK105JB0vNVva@smile.fi.intel.com>
In-Reply-To: <YIrnK105JB0vNVva@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Apr 2021 11:29:59 +0200
Message-ID: <CAMRc=Mcf_wpBx6z3p=cEvFitnv+eSiNPp6w7Uus4K2CZLR-G4A@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/3] libgpiosim: new library for controlling the
 gpio-sim module
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 29, 2021 at 7:04 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Apr 29, 2021 at 08:03:01PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 29, 2021 at 08:00:14PM +0300, Andy Shevchenko wrote:
> > > On Thu, Apr 29, 2021 at 03:07:49PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > Still you may advance the pointer by the length of P_tmpdir + 1.
> >
> > There is also tempnam().
>
> Scratch it. It seems legacy one that actually tries to create file...
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

And also this:

libgpiod/tests/gpiosim/gpiosim.c:331: warning: the use of `tmpnam_r'
is dangerous, better use `mkstemp'

So I'll go with my solution.

Bart
