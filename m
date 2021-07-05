Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2D53BB78E
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jul 2021 09:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhGEHPo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Jul 2021 03:15:44 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:27440 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhGEHPn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Jul 2021 03:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625469187; x=1657005187;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WFs6iuzL8MTjqxfVBFBGlzOm4RIn2wwlIlaO03FepJI=;
  b=bPnE+a6PSn9nOfxEXGjf4bWO1bvR7pQZvzXO9/Df99WQGetZYBsSBeeR
   CpAJpyTRqdrdqBJADjXgtQ94A01kvJro6c+w8Ekd+ZcBAZzkguzMGVyQG
   dw67woxmj3LEJBuyM7S4+DKjt1TPBIxKLknOfF1qngyzJoRow762jwu8L
   h2qLDzHbVD42miEcM/K503naYg0yvSa0RhK/RXpYGYmGzkfk9y1HCjQIm
   ZkBWQdAxBNaIi4EAg5PbdSD30bRHt4LE4/GuqclD07XZ7Srwkf8u1HASu
   qVw3jLUYhDifmd+iFY/Qse61xIund69iV7vAqSmu2DSB1bdDg/4oXlaL0
   g==;
X-IronPort-AV: E=Sophos;i="5.83,325,1616454000"; 
   d="scan'208";a="18268919"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 Jul 2021 09:13:05 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 05 Jul 2021 09:13:05 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 05 Jul 2021 09:13:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1625469185; x=1657005185;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WFs6iuzL8MTjqxfVBFBGlzOm4RIn2wwlIlaO03FepJI=;
  b=fX9Qdpz8A0eRAksLNfmOq/9UAbh5ThVynvVMO94j92LYW78pWacZbFk0
   /VqWBwhGI+zmj6PuGuXQx6TLV7EoWktV4b6NotTwkB2rf6C9oOIxJzcqy
   Hm2AuX064/ELC3XjVuqrGb3IdHL7BjpyukLQokeaKmqhQFTjMTwCYmzh1
   xCyzX9OHqBsXO+4rkRV3bbIvhcMTNl/6zL7N9PhzFr1ML+Ri1PjzcDhn1
   RU0wSj/vH+vhab61B6MnE28DzQymPXAGJDWZj/BrPT0elraiHbfrF7x8O
   06wvJ/oMyNx8TY+dCeSW4Q6Fei93aBglq0aVk94mOyCeHz6wFaHjBdQxy
   g==;
X-IronPort-AV: E=Sophos;i="5.83,325,1616454000"; 
   d="scan'208";a="18268918"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 Jul 2021 09:13:05 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 16D9C280070;
        Mon,  5 Jul 2021 09:13:05 +0200 (CEST)
Message-ID: <be0f9d179f0adcc13f46c0b8d36bec78fa99c2e6.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 0/7] TQMx86: TQMx110EB and TQMxE40x MFD/GPIO support
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 05 Jul 2021 09:13:02 +0200
In-Reply-To: <YN8Xhu3XXGeLAlhj@lunn.ch>
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
         <YN8Xhu3XXGeLAlhj@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 2021-07-02 at 15:41 +0200, Andrew Lunn wrote:
> On Fri, Jul 02, 2021 at 02:23:46PM +0200, Matthias Schiffer wrote:
> > Updated patch series:
> > 
> > - A number of new patches (more hardware support and a few fixes)
> > - Patches 1-3 have gained Fixes tags
> > - Patch 2 depends on 1, so maybe we can push the GPIO patch through the
> >   MFD tree to keep them together?
> > - The change in patch 7 was somewhat controversial. I've added a
> >   warning, but it is the last patch of the series, so it doesn't affect
> >   the rest of the series if it is rejected.
> 
> Hi Matthias
> 
> Nice to see the vendor involved. That does not happen enough.
> 
> Please split these into fixes and new features. They go into different
> trees, so splitting them makes it easier for the maintainers.
> 
> I would also suggest splitting the patches per subsystem, and send
> them to the specific subsystem maintainer. The exception would be when
> there is cross subsystem dependencies.
> 
>      Andrew

Hi Andrew,

thanks for the quick review.

As mentioned in the cover letter, patch 2 depends on 1, so I think it
would make sense to push all through the MFD tree, including the GPIO
fix.

I guess patches 5 and 6 would be covered by the "new device IDs and
quirks" rule of the stable kernel rules. Does that mean they should
also go through the "fixes" rather than the "next" branch, making 4 and
7 the only ones for "next"?

Should I add "Cc: stable@vger.kernel.org" to all patches for the
"fixes" tree?

Kind regards,
Matthias

