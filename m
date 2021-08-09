Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C1B3E40B5
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Aug 2021 09:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhHIHMJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Aug 2021 03:12:09 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:4125 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232094AbhHIHMI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 9 Aug 2021 03:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1628493108; x=1660029108;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jchn+0QaoRgRfHcg8wEX42Cbtdnk/xP5dCyP3/ZW7kU=;
  b=CGzrxVLUXPVOXIuCvtzTD1l2im0+xPddDZ6/5NKPCzyKH8hVMsltJjXE
   ZHdVsXDjY0434MtAJUXZtp2QCi5ph2sZhfLe7BwA4PDGER8/xAQgSZ+6h
   A95U4msjfwJ5ghQPczhR6XuifVZtS9qR3CfM3utRG7LTNk/aOdVJ0+qEo
   x6k1gChyZgjMv3ObosDO291ZFe/cgcKN+7zkkVh/Fg8u73kqtbPf+GxC/
   508ovVYGvpHeBlvdWj8c2Mgaq4mCRrcUICMtFHbpbS4jDXr14TkOuOtxM
   q8ro9OabA3Jn/P2+zxY4SYx0EvMI53/OFh66J041mSx4F6Fm8XBs5+KBB
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,305,1620684000"; 
   d="scan'208";a="18880859"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Aug 2021 09:11:46 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 09 Aug 2021 09:11:46 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 09 Aug 2021 09:11:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1628493106; x=1660029106;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jchn+0QaoRgRfHcg8wEX42Cbtdnk/xP5dCyP3/ZW7kU=;
  b=AV7WBQqYwhGgX+hTgUW+47B9c9O6rFIC0RmlirE4K8RmqxkPk1gtN4/U
   nxWvIL/kJEDgpXDh3DwUOJLTcCdl8+VPWgMcJrF7SAOF1+q1EoWz+prpW
   6KTO2444O6D8TerRIEbNkpr/rFCBRSvullUThQcPRu1c/FKe25ufo4m+a
   PpsUcz00QNDzq8QpFepfyl4FXzd1TGkeQm2nUex1IAn0dTmeQS34ZgxRR
   UMFkAotBzcCq+j//+BYGVxskMebJ1o/FEDHhJuJQAzdCyu1Q6ugMhj6Lv
   uduGRJn2K2yo1BRFOOhTYRCg4n9frlRwBzOjprqgQpxTlK1Va9coXum/v
   Q==;
X-IronPort-AV: E=Sophos;i="5.84,305,1620684000"; 
   d="scan'208";a="18880858"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Aug 2021 09:11:46 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 5D561280070;
        Mon,  9 Aug 2021 09:11:46 +0200 (CEST)
Message-ID: <8419a1b779a65ab3df8c90e7abc46759360066aa.camel@ew.tq-group.com>
Subject: Re: [PATCH v3 2/7] mfd: tqmx86: clear GPIO IRQ resource when no IRQ
 is set
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Mon, 09 Aug 2021 09:11:44 +0200
In-Reply-To: <CAHp75VeQxr3pkX9j10wUi3NjZY-Nkn=waPsMDxG=pDprY3Wsyg@mail.gmail.com>
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
         <65f9787ebd6725e90fad9ea7f936ee0d5712da94.1626429286.git.matthias.schiffer@ew.tq-group.com>
         <YQvn9dkFluRYj80r@google.com>
         <9dc9fb4b37f7afa661bf1bb9148e5109b3f4329c.camel@ew.tq-group.com>
         <CAHp75VeQxr3pkX9j10wUi3NjZY-Nkn=waPsMDxG=pDprY3Wsyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-08-05 at 16:42 +0300, Andy Shevchenko wrote:
> On Thu, Aug 5, 2021 at 4:40 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > On Thu, 2021-08-05 at 14:30 +0100, Lee Jones wrote:
> > > On Fri, 16 Jul 2021, Matthias Schiffer wrote:
> 
> ...
> 
> > > Strange - why is this !0 in the first place?
> > 
> > I don't see anything strange here. DEFINE_RES_IRQ() sets flags to
> > IORESOURCE_IRQ. We reset it to 0 when there is no IRQ to clear that
> > resource entry.
> > 
> > An alternative would be to start with an empty entry and only fill in
> > the fields when an IRQ is used, but that seems more cumbersome than the
> > current code to me.
> 
> Another alternative is to start using the IRQ DISABLED resource flag,
> but I'm afraid that OF code is not ready for that.
> https://elixir.bootlin.com/linux/latest/source/include/linux/ioport.h#L331
> 

As this patch is a fairly simple bugfix, I'd prefer to get it (or a
similar fix) applied without having to wait for improvements of the
core code - also for the sake of stable backports.

