Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8722D3421E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2019 10:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfFDIps (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jun 2019 04:45:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726637AbfFDIps (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 4 Jun 2019 04:45:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 733F524B92;
        Tue,  4 Jun 2019 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559637947;
        bh=I+Hr1IOWxOSZh9ifGDTbR184BWfexzHUQvmzmVuliog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DaBNyHK7SaR7BXIDiAU6hevCpUbotQvlhA0Fndf1U7isyZ8KUWUorVIP1thCIsedy
         vzRG0CmiI/N7S8GVY8f4zH5zjGp2I1I//4nJxVzw+ubC5Jx8yYasSPFbCG6fJkJkoc
         CNJaPU3qUMnQ6k6MTn65R1p9UBKIDlSUDqtqfIFw=
Date:   Tue, 4 Jun 2019 10:45:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] pinctrl: nomadik: Fix SPDX tags
Message-ID: <20190604084545.GA1129@kroah.com>
References: <20190602210918.32741-1-linus.walleij@linaro.org>
 <CAMuHMdX8idAx9QnOMYyS0htYFw66Zs08pbGb7OEf5ED7Egv9rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX8idAx9QnOMYyS0htYFw66Zs08pbGb7OEf5ED7Egv9rg@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 04, 2019 at 10:26:06AM +0200, Geert Uytterhoeven wrote:
> Hi Linus,
> 
> On Sun, Jun 2, 2019 at 11:12 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > Some files were missing the appropriate SPDX tags so
> > fixed it up.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/pinctrl/nomadik/Kconfig           | 2 ++
> >  drivers/pinctrl/nomadik/pinctrl-ab8500.c  | 5 +----
> >  drivers/pinctrl/nomadik/pinctrl-ab8505.c  | 5 +----
> >  drivers/pinctrl/nomadik/pinctrl-abx500.c  | 6 +-----
> >  drivers/pinctrl/nomadik/pinctrl-nomadik.c | 5 +----
> >  5 files changed, 6 insertions(+), 17 deletions(-)
> 
> Please note this conflicts with commit ec8f24b7faaf3d47 ("treewide: Add
> SPDX license identifier - Makefile/Kconfig") upstream, which added
> (different) tags.
> 
> > diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
> > index c3efe7d7e91f..749466fa8f97 100644
> > --- a/drivers/pinctrl/nomadik/Kconfig
> > +++ b/drivers/pinctrl/nomadik/Kconfig
> > @@ -1,3 +1,5 @@
> > +# SPDX-License-Identifier: GPL-2.0

The tags added mean the same thing, what is there today is
"GPL-2.0-only" and this "GPL-2.0" is stating the identical thing, but in
a different way.

So all is good for when the merge happens.

thnaks,

greg k-h
