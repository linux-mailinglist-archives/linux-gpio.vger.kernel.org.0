Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A1D209C68
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 12:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390321AbgFYKBe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 06:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390074AbgFYKBd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 06:01:33 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA6EC061573;
        Thu, 25 Jun 2020 03:01:32 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r18so3061797pgk.11;
        Thu, 25 Jun 2020 03:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pbidNKZ88M/LeU43LgPuIuXUmOhI8ZLf9+XNKNcTndw=;
        b=KPc8D+gjjY/NuzdXHcww6DSdMuTKus4MMk7YixiSHESOBaCRB+gRjkgF2WM56PgIpl
         GX2bk32EqGYDyzDo3+3qUF416IWGjUeDZn7MYQ7OcX+4hDaVOu7bjIoV3kd/5xVmnOvq
         QYe1SRhGs4R8X4EQw8Um8PJ9imcjp651yCiAo6QRrDjAbziiQMb/rXB02zhsAiq2vgaN
         /Z1LBVIN0OhceYupzdgwK//ocTtG2zmI7tLtqhrpj+CkOnUF1Pkn8mfZJasJWuSqNHIo
         VLzE1HjRN6Dxhj8mwqdTp5SrzWc8DjdBHzxgrbNHzknkhE92Kbg7rZGbMgIRBiKfaLuS
         KP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pbidNKZ88M/LeU43LgPuIuXUmOhI8ZLf9+XNKNcTndw=;
        b=keD9EDkg1BXBBRjyhe86qJn3llQNhDalR/sUCIYO/J0nqmDAo64FvPrsgfIPLJmP1p
         s9O3IuDS46AozhhI26k+UWTKqOlcTYeM+ngWmomL0TmMWn3gK3BnsclAG+PI/oj1DDG2
         OaG3KBvqkHI9QaDkEEVmo1bPncVV+vTtZKefRxIuTAVyIVgI2W3mWS53oFrc+07Zh2zv
         BWh6F+DmOXQRIQx4myoLTCx62dJDjHSWbWxhx2z8nZR8boo8aXxSW7Pj2K5SvV28rFaL
         XCAUynvmafRXuTsvFwT1B8fl1PTvMriCgZ8K+VtpYBu4ofSZZPdhR0QOmKy2b7r1kCAx
         xX2w==
X-Gm-Message-State: AOAM531+nfDwVeYiIxn1CrLQkPNpNmyHLqI6JFJtEPNItCSyQDLHfvuW
        tvjv3If1ai+EKgXHoUklyRc=
X-Google-Smtp-Source: ABdhPJz73gurkGAasOiaTC5tR1dkA9uGqDzLRMT4d1JlbfpNzlJ//4TaPFIgl4vPZFpKSdX2GbmPBQ==
X-Received: by 2002:a63:29c8:: with SMTP id p191mr26534263pgp.333.1593079292321;
        Thu, 25 Jun 2020 03:01:32 -0700 (PDT)
Received: from sol (220-235-108-194.dyn.iinet.net.au. [220.235.108.194])
        by smtp.gmail.com with ESMTPSA id j2sm5103971pjy.1.2020.06.25.03.01.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 03:01:31 -0700 (PDT)
Date:   Thu, 25 Jun 2020 18:01:26 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/22] gpiolib: cdev: complete the irq/thread timestamp
 handshake
Message-ID: <20200625100126.GA18788@sol>
References: <20200623040107.22270-1-warthog618@gmail.com>
 <20200623040107.22270-9-warthog618@gmail.com>
 <CAMpxmJVbiH9mh2c8aAS+GG9a76w9c0Nrrv-VDVhpo+wSyQ2NeQ@mail.gmail.com>
 <20200624140806.GA7569@sol>
 <CAMpxmJXbzFvR9h4fXvCwDMz4t6N16o2Y88K94aPwu6MFuCzqrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMpxmJXbzFvR9h4fXvCwDMz4t6N16o2Y88K94aPwu6MFuCzqrg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2020 at 11:44:30AM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 24, 2020 at 4:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Jun 24, 2020 at 04:00:42PM +0200, Bartosz Golaszewski wrote:
> > > wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisał(a):
[ snip ]
> >
> > I'm not totally sure myself, as my understanding of how interrupts are
> > shared in the kernel is pretty sketchy, but my concern is that if we
> > are sharing the irq then whoever we are sharing with may release the irq
> > and we go from nested to unnested.  Or vice versa.  Not sure if that is
> > valid, but that was my concern, and it seemed like a minor change to
> > cover it just in case.
> >
> 
> It's my understanding that a shared interrupt must be explicitly
> requested as shared by all previous users or request_irq() will fail.
> In this case: we call request_threaded_irq() without the IRQF_SHARED
> flag so it's never a shared interrupt. Even if someone previously
> requested it as shared - our call will simply fail.
> 

OK.  Is there a reason not to share the interrupt?

> I still think that resetting the timestamp is fine because it's not
> being set to 0 in hardirq context. We just need a different
> explanation.
> 

Or just drop it?

Cheers,
Kent.
