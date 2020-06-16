Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139C91FAC50
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 11:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgFPJZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 05:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgFPJZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 05:25:04 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0807AC05BD43
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 02:25:03 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id u17so14953631qtq.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 02:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pIz5+C1tcYhpAFv1+H0LgV+UXk2RhJtRzez+BbRGR1o=;
        b=NtySO32koz0h9QFWN8Qx68jboUcoXliXmCrzukWCuoYO3MEuzk9k/EQMArIBs6/BJZ
         gPdvoeedhLevLXi4X0aag71y+0avpWxI3BNmVC5YgMg4Sr2RehDgiAc4HoEkA/CVbkZ7
         TZPWKEJtcJipTZJ1ced82HEH30FtM354ezhXwUiapqqgZZaYLypHk+aqibpgzgeJVog/
         WeWcYbUkWBPr1jG2p8Rq/1mk43quzunVCig/Gq6awB8+Np/wmgV796tQj8RgC5eHlJ4K
         DcYWabINCuqccAC+X0dJeZYKc+h8jhvK6jr/7uqROuwwUwZ4ZlhcpYoWjFPCT5XAnZ4B
         DuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pIz5+C1tcYhpAFv1+H0LgV+UXk2RhJtRzez+BbRGR1o=;
        b=JgwNmp9usiJcRzYyK++usg6CbkW8EiHCeAdiovzTSIUHYSNwsVDFMIdmQyZnlir30C
         ngAvO66vT9ZUc5rKj4y9wG0JHaa1Hn2yq6pXEDpSW3FLoUlBAImbI7Pbq92FmKlAcXyD
         6SSvk54nsM6smThYI/fLrDAx1A6x455H4r0lD7lJAkD2d7F+5ivif1pW315e2bTd/A76
         dJL1ESB/QbzArdAkGQhFI3x42mvouJlsI0QArfuu1wdPcUvSyygZK0GZDBW8NFzhhDFy
         +2NmbUVHZ9vcc1JNpuiUhLC29GWme0SCmUMEwYPzE2IwkaowkuMzYn3gDynA4hvobW0+
         bRug==
X-Gm-Message-State: AOAM531mSYAaxqIEdgaNf5D2Xj13dd0XO6cSOuQYEAo8xcDh3+QxuV0N
        A7xh1WuBsz8lGv5kB1CVBHobTRsWEJ2cq3Pg6Bf85w==
X-Google-Smtp-Source: ABdhPJzE1fK15opdk8UM5mh/6T6yAY/VIqYyKEL3jVoJzYC0u1iwrsUcu/LjlojZ/qA5DEQoo+QTC+ncVkrEZ0PejCE=
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr20317683qtr.197.1592299502520;
 Tue, 16 Jun 2020 02:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com> <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
 <20200615125349.GD2428291@smile.fi.intel.com>
In-Reply-To: <20200615125349.GD2428291@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 16 Jun 2020 11:24:51 +0200
Message-ID: <CAMpxmJWiX2750939wC+btP-Uu1oOA2iU8rsJ1wqe_c+x9HeCzw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 15 cze 2020 o 14:53 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Mon, Jun 15, 2020 at 02:20:44PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:
> > > It's a repetition of the commit aa58a21ae378
> > >   ("gpio: pca953x: disable regmap locking")
> > > which states the following:
> > >
> > >   This driver uses its own locking but regmap silently uses
> > >   a mutex for all operations too. Add the option to disable
> > >   locking to the regmap config struct.
> > >
> > > Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic addres=
s incrementing")
> > > Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Ah, good catch. I assume that I didn't have aa58a21ae378 in my tree whe=
n
> > I created the patch that then became bcf41dc480b1.
> >
> > Looks right
> >
> > Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> Thanks!
>
> Linus, Bart, just to clarify that this is material for one of the next v5=
.8-rcX
> (this cycle!).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

I applied the whole series for fixes. Thanks!

Bartosz
