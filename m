Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3974D350077
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235406AbhCaMhX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:37:23 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:36938 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235140AbhCaMhB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 08:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617194221; x=1648730221;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8QUBc+GdNGvgWpeubvdM3VSNFlOMrxhUl5MEVhIAeUs=;
  b=K0Zqy+qrkLOsPTYhBlJGrB8PZlz27q+Bk1P6m2c6bL7OrnxdoDAVhyM3
   nyC8opHNYa6lhuwaHQDl8PwIbw635n6hINVuihwFpftkoZpWzANi8+E5N
   lC+TBReuDCy88aHmnEm3X1dk5HQ5BC7DE6RM0OKXygd9ovUKZMqkDh8Aw
   deX4L9Ra1eKzal7Z64N74JmPtbgm0Fs/qjI73zdNZnLftHyS+71ijqBps
   bYlCXBInn7Lx6mxexwko/t1W/BgEwIfVFMZrDoyak8SYIeZ8aCnEaPDXL
   FKs6MrC9jIxRnM4Ups0ITc+C8nSkANbc3zdF+HxV8kw4Gj1CUc2bUCZ9s
   g==;
IronPort-SDR: IMQumMAeww/pEPx5HXf4rQrDV5Jp3JuzIuxk9zu6+PoMSDwBPo/oeDuntz1PSoqu6jsFmZ+E+X
 06LFQN55bkepGjxzyGHw+JWqYKOWOVGjv89RWYYyFi0mknlc6QgSY3SQBALfB4Ozo+d0QX5DJF
 R1s4t3fuoIj56+yVXO1cgOg6x34Bf12sle67+CZ2fOoTaW3KT8RDcyj3Oeh6qVuJJw2yuTCakH
 /Pmq2cwj1EaA7FNS0xaXJBeqbJOHsyq+5sBSgBAUR9aZgcpLP9YOaFxdNOBNmFg4ImAzZAiTz9
 8tk=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16743962"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Mar 2021 14:36:59 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 Mar 2021 14:36:59 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 Mar 2021 14:36:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617194219; x=1648730219;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8QUBc+GdNGvgWpeubvdM3VSNFlOMrxhUl5MEVhIAeUs=;
  b=OszDt9bEWpxz3vcEbnsrdNF7IaSWZoKEUj0G/dkl1sUG58599A631xzt
   eG90zgH/lIt/8n7k8llwOatRd5DCnF4o9TB1kakzCzest42E9ANJaEPGa
   NOz8psNWl3xwXrEJGAqx4ba8JltfLwSGRiV/MkkSRxLuvpDaWm3mqyfE5
   000VHtxcjnJMgQ1uE1llXWLK/jUlxpbMf+du7IvLPs1IAi6EBfh6gDQpz
   2aG48VFW5tZw8NQcOwC28wjamKZwFzfvUPG154u9RbQEAkHizi6ma4WIa
   BJxrCdwrKrubPehbCkvryLzNc4MVj1Gor9kUOGWtoFpiKd8xuZtLX9OJQ
   w==;
IronPort-SDR: esWIwp70kk5UOLUYw2nOeHSC7bN8wuwPvZ6K2nzdTr81ReSt+MEYFzEZkH73mKdPNTprkdsKpw
 Bb7Tebm7HBLqSt8c9rnT9SrdmiIpADcEl2FIzca2TAgoEfYRASMfEqK4M+tR7e79M+YO2sVtCs
 roHk3lLaCJyZZu3pVhGNgyLBAyjktE6MDSjYk2rXJX3BT0wrBAVu1Iq2nNPaMwJVQDVUh+hDfj
 4wJFY3xHzp3/6lL9Zjc946DfgZnCNLzf/nbKWES1xaZSNLERuRJjjoFcAevAZ8y9/ATGWINU6K
 lKY=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16743961"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Mar 2021 14:36:59 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 954BF280070;
        Wed, 31 Mar 2021 14:36:59 +0200 (CEST)
X-CheckPoint: {60646CEB-9-897334A9-C80E897D}
X-MAIL-CPID: 9DBE6EC0A4F9E7B53CACFBDF6CB3555B_1
X-Control-Analysis: str=0001.0A782F19.60646CEB.00C2,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Message-ID: <4c143c8ee65fe52840ccbb4e1b422b6e473563d9.camel@ew.tq-group.com>
Subject: Re: (EXT) Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 31 Mar 2021 14:36:59 +0200
In-Reply-To: <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-31 at 15:29 +0300, Andy Shevchenko wrote:
> On Wed, Mar 31, 2021 at 2:37 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > 
> > The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
> > causes warnings with newer kernels.
> > 
> > Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
> > missing IRQ properly.
> 
> ...
> 
> > -       irq = platform_get_irq(pdev, 0);
> > -       if (irq < 0)
> > +       irq = platform_get_irq_optional(pdev, 0);
> > +       if (irq < 0 && irq != -ENXIO)
> >                 return irq;
> 
> This is a dead code now. I suggest you to do the opposite, i.e.
> if (irq < 0)
>   irq = 0;

I don't understand which part of the code is dead now. I assume the
`return irq` case is still useful for unexpected errors, or things like
EPROBE_DEFER? I'm not sure if EPROBE_DEFER is relevant for this driver,
but just ignoring the error code completely doesn't seem right to me.



> 
> In such a case below change is not required.
> 
> ...
> 
> > -       if (irq) {
> > +       if (irq > 0) {
> >                 struct irq_chip *irq_chip = &gpio->irq_chip;
> >                 u8 irq_status;
> 
> 

