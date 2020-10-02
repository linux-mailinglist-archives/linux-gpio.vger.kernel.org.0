Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D528155A
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 16:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387974AbgJBOgn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 10:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBOgn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 10:36:43 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7511CC0613D0
        for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2020 07:36:41 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id l8so1742315ioh.11
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUEPbM4pAxhqtYTAEUI1i9+ljmdEQNehnq4bj+PDTD8=;
        b=uT/XxNHqWYw3H085ixRG/sfR0zc/Y/EY2Mopw+7r1QTq3eW3JHpvh6mZrsc2xAer1y
         1pLDW7E2p+bAl2zTHXnHcVQrbbkLSB0oMuuCTTWNui9kL+t0zzEGA5kdm4YcZ5hIinNI
         +QnJzpRjrZv19vV4o+ZkK+YT+iv2ZIFvqP3dTSZyNTPQ4psqtX1AE9O44sakdwK04ZNM
         Klz8og/IxUpRScBm6oOCmlW5zxoJB7xIzWKOfpjmCejChIfxcHRgFbcNfR5Jus2dbHQT
         NcO4DKBF5pBc5h413h0fGSHtnaGBovgHqztgRbrSrg5uNloQMxDEjHL0uK1bWKqTahW7
         /05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUEPbM4pAxhqtYTAEUI1i9+ljmdEQNehnq4bj+PDTD8=;
        b=OM9TihKYpX4xn2KCzpEGdeePPM6wpLDLcsfRlArdQ7SjHESDpXvB+NPupx7CBxQYeD
         G8C28RbJ4QeuqKxrTMLYd1rRCCpvGSqdN+G+MWsvigJLITsXCGye3afrMwWy+BVUVBLU
         MopUKtq6wC3XqDE2WyZtCENFUQe0BjT1hmkEpgF6EfdEviQSyets1XsywiPvLCB8t2nM
         oiJigUh9i6cb7jrERy3kpYGc9wIobDjUzbYP4v8nek4U6b6qiu64PaTIFxVRMLBkG7OT
         5aVPpdiCJwy7a40Eh423NNEADxNmG3o98xPWkrmq6Kb/ATjA1kecUrfZu8VLkCTyClST
         5CMQ==
X-Gm-Message-State: AOAM533hgu7w26Fv0mLdw7bauvSGcu4h1pxQtgoxw8F7y2DIYVmefTmW
        3sUDP31tpnzn1EKYNX9IE0hOa458/8EMygWttkGA9Q==
X-Google-Smtp-Source: ABdhPJxDScp9IlZ44e9VfnSLJAn7MiyweM+/jBtiEZxwMmDfWeO70E82Tx+nQDJZhpMh3ODPBU8WR10t0HPK3wRyG3k=
X-Received: by 2002:a02:6952:: with SMTP id e79mr2544510jac.24.1601649400845;
 Fri, 02 Oct 2020 07:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
 <CAMuHMdWysc7u7px6n6CJ9q1Pht5QRAL0UvDgoH=A4SGUNj9zgg@mail.gmail.com>
In-Reply-To: <CAMuHMdWysc7u7px6n6CJ9q1Pht5QRAL0UvDgoH=A4SGUNj9zgg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 2 Oct 2020 16:36:30 +0200
Message-ID: <CAMRc=Mf2P7YjFFFmSgrc54H91v9TMrOzPCt1tUUcEpWn3DaKtg@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v1.6 released
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 11:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>

[snip]

>
> > Grab source from:
> >     git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
>
> Note that the first Google hit for "libgpiod v1.6" is your github mirror, which
> has the latest code, but not the latest tags?
>

Ugh github has better SEO than kernel.org. Yeah I don't push tags
there - I'm using this repo for backup mostly and for my development
branches. I think I'll just make it private - or maybe make this one
read-only and then create a new private one for my dev stuff.

Thanks for the heads up.

Bartosz
