Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D176350149
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 15:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235811AbhCaNd1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 09:33:27 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:56715 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235777AbhCaNdH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 31 Mar 2021 09:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617197587; x=1648733587;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bh348drtFEjwrIRlznr3fpl5AEkvn6x1oZPB/pt9Omc=;
  b=oRj7azO9zEpHKcOz/gmQjOdoqZNnXFa1a/Fjzi3uodk5v+vBZ2pExJ08
   2tWYJK97QrsuOnvWpapncAcxKQ3tJGnN96L2D4BUJ+fjH+3ObPRxnhkaw
   Q1UpExNKLE/WKMmEO7KQNu4daLrC/WSTlGkB+fVUr3CSneXbwgAwCEaqn
   IdWtu/UST95GPHhM9qIgZ+Oe3dRqPNrX7Vu9lOe8oQ138kCu973ypCg/X
   3io38umBF5aipAp6qIpHgPQZ9QZQ6Df2om3rWPdEAGsQGettAmFy/E6N7
   j56IJRY5iBXBwfYnAKPZrU5gKSONjOsdAET8l5Fv8ZvbynZBPDu3VcoXq
   g==;
IronPort-SDR: stlymYC9Sk4/vqOp1O6KaNj8AwfWRU9DUyfcbfIYD46+5v1vnhsjV1+JrMKnvh2DafePgeuhxt
 2jwhgpq5k8V8Olfvn6Nk7acMI+m0dgGHAGckm1zgQbQc5MfH4ntU35CD0sdsqOnY686jnIWm5f
 OwKjq8rm47j7ZSysjVkkgxZlqKxjG50yeYS9xn+FQWh2dWzK8/Dz7biABorWbcIuJZs482DkB1
 KJcqtsuVa891K63Vf+/bmj0KiCYO7OWAeqhg8XxrisFINL4meUKlesYSS5QfAOHy55KE99jAgJ
 KwY=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16745447"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 31 Mar 2021 15:33:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 31 Mar 2021 15:33:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 31 Mar 2021 15:33:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617197585; x=1648733585;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bh348drtFEjwrIRlznr3fpl5AEkvn6x1oZPB/pt9Omc=;
  b=hj8eA/sDKqZ1XM1NHHh3mcW6ZRHocZjDO7MNLOnVHrO+Tu/iac5GUPhS
   KbMHcie11WP+gcKzQ+3TkfsQDarzDK1knPhBNQPUiVeznH47A9rvP/Fdo
   pIdU6PUOM+KSOFCbryGiUWuijLvYSSJjPeQAbeBBJcIAhsaYXO4vyExWf
   bZWUENm3jZAfUXoIasjvMlGTVVeRBlfDVwHOGnKkVcfGvfwFKjVuE3PSv
   QbqILly0aweSOAtYVdAU6AxGngyMqL6zW6PwUDa6S52Jwn6D0+YO7czXZ
   UD9cMaCuhTQceuryNuht2Y3OTVKkPfN3/8yse+iCLSOPY4mQUo5ARA///
   A==;
IronPort-SDR: cFx/mfEX3vpsKSfoxbfzBaDgmm8vFsgZbV8xs3mOKznHwxH2u2CruhfhZJnDWZWGpWiioQO3y5
 NKiKrvi1Ney3+9F6DJSXnRUW3rnGUG+D2dTDj62olnu9Nj5j+iym4/w38Zi7fbj2paeLrF0jId
 0LGYY6Y8pI8Z5j5FMlTNjum/1BuwlBZSFj6l/b9aCDo9jkkMZs6aCvNKXJR2By9Xvvp3DmK16H
 HYT9ZnB0d4PJux1a84KrEE5jJciOUsu4MkXNDBfScBqJiuYEL3zyhvVTcd/soA17zgO0SNGkdt
 7NU=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; 
   d="scan'208";a="16745446"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 31 Mar 2021 15:33:05 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 3A371280070;
        Wed, 31 Mar 2021 15:33:05 +0200 (CEST)
X-CheckPoint: {60647A11-5-5AD1F46D-D119F3D7}
X-MAIL-CPID: 088F16F821604AB6F57D5637B79775EA_5
X-Control-Analysis: str=0001.0A782F21.60647A11.0069,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Message-ID: <83d7ea27b27225727fec7b077efe1a67ba1184a9.camel@ew.tq-group.com>
Subject: Re: [PATCH 3/3] mfd: tqmx86: add support for TQMxE40M
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 31 Mar 2021 15:33:04 +0200
In-Reply-To: <CAHp75Vdk4rxiD_nm8Cb53oTYNvMqkAOM4U5zEn5tchtptQZEBw@mail.gmail.com>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <3c19d714645f788913956223097adc360ceb6203.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <CAHp75Vdk4rxiD_nm8Cb53oTYNvMqkAOM4U5zEn5tchtptQZEBw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 2021-03-31 at 15:37 +0300, Andy Shevchenko wrote:
> On Wed, Mar 31, 2021 at 2:38 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > 
> > All future TQMx86 SoMs will use a 24MHz LPC clock, so we can use that as
> > a default instead of listing each new module individually.
> 
> ...
> 
> >         case TQMX86_REG_BOARD_ID_90UC:
> >                 return "TQMx90UC";
> > +       case TQMX86_REG_BOARD_ID_E40M:
> > +               return "TQMxE40M";
> >         default:
> >                 return "Unknown";
> >         }
> > @@ -138,12 +141,6 @@ static const char *tqmx86_board_id_to_name(u8 board_id)
> >  static int tqmx86_board_id_to_clk_rate(u8 board_id)
> >  {
> >         switch (board_id) {
> > -       case TQMX86_REG_BOARD_ID_50UC:
> > -       case TQMX86_REG_BOARD_ID_60EB:
> > -       case TQMX86_REG_BOARD_ID_70EB:
> > -       case TQMX86_REG_BOARD_ID_80UC:
> > -       case TQMX86_REG_BOARD_ID_90UC:
> > -               return 24000;
> >         case TQMX86_REG_BOARD_ID_E39M:
> >         case TQMX86_REG_BOARD_ID_E39C:
> >         case TQMX86_REG_BOARD_ID_E39x:
> > @@ -152,7 +149,7 @@ static int tqmx86_board_id_to_clk_rate(u8 board_id)
> >         case TQMX86_REG_BOARD_ID_E38C:
> >                 return 33000;
> >         default:
> > -               return 0;
> > +               return 24000;
> 
> AFAICS it will return 24 MHz for "Unknown" board. Is it okay to be so brave?

As noted in the commit message, our hardware developers intend to use
24 MHz for all future x86 SoMs.

