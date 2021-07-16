Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425A03CB53C
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 11:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232617AbhGPJ0w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jul 2021 05:26:52 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:64833 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231354AbhGPJ0v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 16 Jul 2021 05:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626427437; x=1657963437;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fl/EXT2tNjsgdTiy3OICqnEHZekrSV4EfOt/zoVrF98=;
  b=YNrsxQNKVfpejlOmOj8gs6yjMXBDvL4oUg47kOrJpPS03y12pulMPV9l
   RmmYEhaUFC0vvKKLu+0zMbT28zoZcWv8jflnHp840wPPGnncTVoU/QG3N
   q2gUhc9j/hGXPgDmktmvKWY4UhpshBzJzyuTFD3ccIxjYFoty8CwJb6fJ
   WL3ntSzZO3B7TFFsgyChewqyGl9wf7mHBsjJZwZ8N+AwLBwy44850hxGi
   RIrZJdYpKSEvDOuBRw/mEOxKNyqnvqXUe5ahMbGAFL3TpYwOTATJXu1rc
   Nh0ADHAnPh6JaqRBDCtPyCTUJwv8umpKGl6OHlgp+xi8uzzfCErT7aajL
   w==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18490951"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jul 2021 11:23:55 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Jul 2021 11:23:55 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 16 Jul 2021 11:23:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626427435; x=1657963435;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fl/EXT2tNjsgdTiy3OICqnEHZekrSV4EfOt/zoVrF98=;
  b=JsSC5jPRA0Y9yV5q9jxyt0l9hXRjXEIhEyPnj2ax00Pu/yHOMOZbhfvF
   NizivZai7M6wTyQfc7Qu1RKptVAJi2ZW6C0vm8vNaVhHtgSmTuct41YWE
   i2dC0XG82sD4BGqqZedVJs1Xoq+jfBbFzmCukYgneraMSOuP/2K7BvdNb
   vJsbeQ4W7tCZ5iBhgTw+CxwwtJl19+Uc4yK3U2Ok4KW2VC4c70fGatlMQ
   E0cEAVaGzlucUXLinI3LLRbiAQXOXg9h31Z6mGB0dOllgzVZYfGzDgNun
   UDcmzFdgJf2+vocnch474G73NZLr2K3mFwnVEgGZCWBOsW3zrVrCCXQkC
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,244,1620684000"; 
   d="scan'208";a="18490950"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jul 2021 11:23:55 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 29A91280070;
        Fri, 16 Jul 2021 11:23:55 +0200 (CEST)
Message-ID: <b98a99330e250b51d09c904c9e274ae461118238.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 0/7] TQMx86: TQMx110EB and TQMxE40x MFD/GPIO support
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Fri, 16 Jul 2021 11:23:53 +0200
In-Reply-To: <YPFPT+5z5J43kBzL@google.com>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
         <YPFPT+5z5J43kBzL@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2021-07-16 at 10:20 +0100, Lee Jones wrote:
> On Fri, 02 Jul 2021, Matthias Schiffer wrote:
> 
> > Updated patch series:
> > 
> > - A number of new patches (more hardware support and a few fixes)
> > - Patches 1-3 have gained Fixes tags
> > - Patch 2 depends on 1, so maybe we can push the GPIO patch through the
> >   MFD tree to keep them together?
> > - The change in patch 7 was somewhat controversial. I've added a
> >   warning, but it is the last patch of the series, so it doesn't affect
> >   the rest of the series if it is rejected.
> > 
> > 
> > Matthias Schiffer (7):
> >   gpio: tqmx86: really make IRQ optional
> >   mfd: tqmx86: clear GPIO IRQ resource when no IRQ is set
> >   mfd: tqmx86: remove incorrect TQMx90UC board ID
> >   mfd: tqmx86: fix typo in "platform"
> >   mfd: tqmx86: add support for TQMx110EB and TQMxE40x
> >   mfd: tqmx86: add support for TQ-Systems DMI IDs
> >   mfd: tqmx86: assume 24MHz LPC clock for unknown boards
> > 
> >  drivers/gpio/gpio-tqmx86.c |  6 ++---
> >  drivers/mfd/tqmx86.c       | 48 ++++++++++++++++++++++++++++++--------
> >  2 files changed, 41 insertions(+), 13 deletions(-)
> 
> Patches look good.
> 
> Could you please collect up Andrew's acks, remove the suggested Fixes:
> lines and resubmit please?

Are you referring to the Fixes: line in "[PATCH v2 3/7] mfd: tqmx86:
remove incorrect TQMx90UC board ID"?

> 
> I'll quickly apply them once resent (probably Monday - if you get them
> out today).
> 

Thanks, I'll try to get it done today.

