Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FFDEAB62
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2019 09:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfJaIM1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Oct 2019 04:12:27 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38177 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfJaIM1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Oct 2019 04:12:27 -0400
Received: by mail-io1-f66.google.com with SMTP id u8so5693386iom.5
        for <linux-gpio@vger.kernel.org>; Thu, 31 Oct 2019 01:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rOCUGAkw41wVs89+EhO5yewU1a4RTtYYZqQvXNtrcs0=;
        b=GR9/xp6H+4NBpu+XucDM5RhhleRHZ/B36we0Tx9iqC0S9iWspFCAyw35gLfklGkCwD
         VwXz2x3iqgf4+egjISYf6W4F1r5LHTnnNd/hl1pMf8CaAnU4gK7E6d0ypCSt47LXJq4B
         lDPLtGzh4baJj4iXZDxDNVz2fvlhG0F01/GAcbza8d1rnx7s6+Vj/KXMJlM6ZYxPnhTP
         MxyiRodNGpY4zXxB+D6KALdMtbKmAPWUmeHKpKvU+IiLpSTjBRh+E1PxjRFu73Ud6nmI
         3So3HJcb5HBwkKEYIhk9Bk6KTaoEkz53UcPNUlbq0SWQdCpYXw05aKhxhrn+zlm5JWX/
         9AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rOCUGAkw41wVs89+EhO5yewU1a4RTtYYZqQvXNtrcs0=;
        b=RPhnPezn2zvLmeVn8nIP6ANmtcoJ55v+xVfbNR3jpqH0k8w8uooEQLBGmyYXWYmDOY
         abkO1aQNt9uVAWKG1hwzAVlKXruJoO7hpM3dDT+Hab9Ux5NVVC33QxLO2PkI1BV8Wv+6
         CiaS+pUn3ks7LrTHsPJ2pwOCsU0rETJk8DSnrvi9NpAi9p/IXma/vQh38Ir1Lw8HHXK5
         cIPKODQlk1AhqU1vpuUW7R7tnBNL9uOM3jsN33/ArW95WOlAMbxRJz3Yv5ghtFaFVBzK
         K0tpSg3PBAgb93XLtKoU+cgLyxfbmdxCbNuo2dAf4dDhJH1PHKJsOvCAxyRsbMsXEVwI
         zUAA==
X-Gm-Message-State: APjAAAXjdPDfCk2PkYJZUmGBdKHPDRTCSX/L6tdaFIZO2LIxKUZYCbCl
        SYMcR+NmrvEG+3FVxJLu9hbPXODjZ+dD2B56Na72Kw==
X-Google-Smtp-Source: APXvYqzCS2TeB4sqdrLijb5Y1d6jjSdnZ6MQdPlO/+Ixz45cbwTzvFNMP7rQQMznswokntR4fKoTP6lgkkSuzK7nlgY=
X-Received: by 2002:a02:742a:: with SMTP id o42mr2364jac.24.1572509546182;
 Thu, 31 Oct 2019 01:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191006053916.8849-1-brgl@bgdev.pl> <CAMRc=Me3Q=67fCDrFM38LAGXCd+apJybLYVfyrfwmwYa5L1CmQ@mail.gmail.com>
 <CAK8P3a3tUg4SBtO0xb2GAHfegp23WF4TLymzqFfra2-fGLRO7w@mail.gmail.com>
 <CAMRc=Me8g2gFiag0UQwuu4UZONcowQw900+MUbGF+4-E0z09Zg@mail.gmail.com>
 <CAK8P3a2mh+Eh+W1GFL2Mi5R3t55SRwWyXW_iBxXB-nBhdCO8LA@mail.gmail.com>
 <20191030213555.GA25515@infradead.org> <CAMpxmJXOANjxZgTcReRmd6TGaUKNi=8Cxwj4K69aRY=bF3jDiw@mail.gmail.com>
In-Reply-To: <CAMpxmJXOANjxZgTcReRmd6TGaUKNi=8Cxwj4K69aRY=bF3jDiw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 31 Oct 2019 09:12:15 +0100
Message-ID: <CAMRc=MeYe4X1zXAnsK_cAYfcAE-t3X0nW7+NbsVtsBU4f+C_KA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 31 pa=C5=BA 2019 o 07:41 Bartosz Golaszewski
<bgolaszewski@baylibre.com> napisa=C5=82(a):
>
> =C5=9Br., 30 pa=C5=BA 2019 o 22:35 Christoph Hellwig <hch@infradead.org> =
napisa=C5=82(a):
> >
> > On Mon, Oct 21, 2019 at 09:29:30PM +0200, Arnd Bergmann wrote:
> > > > Is Christoph's work in next? The series doesn't apply cleanly on ne=
xt,
> > > > I needed to fix a couple conflicts. What branch should I rebase it =
on
> > > > before resending?
> > >
> > > Not sure, maybe Christoph can comment.
> > >
> > > Your patches would best go through the char-misc tree and be based
> > > on top of that, for Christoph's I think the idea is to have some go
> > > through the architecture maintainer trees, and have whatever is
> > > left go through my asm-generic tree.
> >
> > Actually I thought of just doing an ioremap tree for this merge window.
> >
> > What kind of changes does Bartosz have?  I'm kinda missing the context
> > here.
>
> Just the series you've responded to here, but I don't think it should
> conflict with your changes (not very much anyway).
>
> Greg: can this be picked up into char-misc?
>
> Bart

I refer of course to the re-sent version rebased on top of char-misc.

Bart
