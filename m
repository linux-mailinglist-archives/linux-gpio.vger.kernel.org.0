Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC031F9918
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 15:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbgFONig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 09:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730167AbgFONif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Jun 2020 09:38:35 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAC7C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 06:38:35 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id h185so7837743pfg.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2020 06:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QB77RvqxcDPK6i58CmJroMCIfGPAP68L8RULqBqE3O8=;
        b=NEucoYlzaE2iuFQ6/Gf1q08SAifrzklNlcHWXckjkPQa16PQLlOZCVuF9sB/WiLlcA
         6ao0yi31ClXqUUPQeju3m7slggAhcuCy4sIBaySw4V/eNny/RRH2byjFB7ttOXX9hG7m
         giI/1QvNw8H0Fg3E6wbEvmvSY4LYOisQvehABICwaaT9EIEv6RxgUZz7rh+vq8jPW0D/
         o56sP2jk9UJbWeZm7w5acD+dBxmYPg2npa6lrZSz4S3BHZ3h6h4Svi61Dd9hdXwj3XCE
         D9/DOie2XCQNYa/f6/pP0NGuEZnMA+6man8N8YInYsAGHjtmW114SQ8kTCYJ3tX1DtVU
         gKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QB77RvqxcDPK6i58CmJroMCIfGPAP68L8RULqBqE3O8=;
        b=RsBcBET1TpT6jV4WZ67WsNWp+9Phwhj2otbFLmVda1TdUkblwTP+D3kEskhylEcGHu
         8D097fg2h0UuVZaYbdzF+RWa8fKo46tPZNF3GJczQ4SzoRZUsZ590gYBSR7bclZM6VEd
         d7E6WpEVO25dBYM/oJPv2sgmD/inZSzu1w8xBBuXrM2wbrbb3hLCcmW2bs+Ip6l7B8cu
         RGgv5S/wzUMnpuwgT5FINJTcb/dCxzwgyfWZ23yeIpAqmXlHh2EfvapdNbxsC7VxCW6u
         PLOA8DmpUNKqLpybC9bv/6qg+FSoNGhHt4Z2GMExgx7b4bmV9G/TGq+p9oRavKcE4q/a
         IuVA==
X-Gm-Message-State: AOAM5318BHroIu6Iub7rpmDC63EwRXWG4nyKssH8+6aQzBjUC3EFAz8H
        XIeLpkNUU19TMGYlNRewJEs+vt6fYn81L/RUpLY=
X-Google-Smtp-Source: ABdhPJwGW/qvuBvUOmXIHdsGZmWK6FMDI+TuedUNdr9IRha0M6zJdZGqcP5txUwsjM9Ah/IV2/GpmQCRMqKKbOcU9YA=
X-Received: by 2002:a62:5284:: with SMTP id g126mr17049397pfb.36.1592228315413;
 Mon, 15 Jun 2020 06:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
 <20200605134036.9013-4-andriy.shevchenko@linux.intel.com> <20200615122044.j2vdhpmhbpsw6qkb@taurus.defre.kleine-koenig.org>
 <20200615125349.GD2428291@smile.fi.intel.com> <20200615132027.flexasjahrn6floq@taurus.defre.kleine-koenig.org>
In-Reply-To: <20200615132027.flexasjahrn6floq@taurus.defre.kleine-koenig.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Jun 2020 16:38:23 +0300
Message-ID: <CAHp75VcA8ExfpBXyo=nB0KqP5+s9RWq8YtZ03Z8UTp7RSPvTmQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] gpio: pca953x: disable regmap locking for
 automatic address incrementing
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 4:23 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> [adding Geert to Cc as he was involved with
> aa58a21ae37894d456a2f91a37e9fd71ad4aa27e]
>
> On Mon, Jun 15, 2020 at 03:53:49PM +0300, Andy Shevchenko wrote:
> > On Mon, Jun 15, 2020 at 02:20:44PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Fri, Jun 05, 2020 at 04:40:36PM +0300, Andy Shevchenko wrote:
> > > > It's a repetition of the commit aa58a21ae378
> > > >   ("gpio: pca953x: disable regmap locking")
> > > > which states the following:
> > > >
> > > >   This driver uses its own locking but regmap silently uses
> > > >   a mutex for all operations too. Add the option to disable
> > > >   locking to the regmap config struct.
> > > >
> > > > Fixes: bcf41dc480b1 ("gpio: pca953x: fix handling of automatic addr=
ess incrementing")
> > > > Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Ah, good catch. I assume that I didn't have aa58a21ae378 in my tree w=
hen
> > > I created the patch that then became bcf41dc480b1.
> > >
> > > Looks right
> > >
> > > Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >
> > Thanks!
> >
> > Linus, Bart, just to clarify that this is material for one of the next =
v5.8-rcX
> > (this cycle!).
>
> I didn't test but I wonder if this patch is really urgent.

I'm talking about this entire fix-series.

> Just from
> looking I'd say two locks are not nice but also don't hurt much. If it
> is more urgent the commit log should maybe mention how the driver is
> broken without this change? (Also applies to
> aa58a21ae37894d456a2f91a37e9fd71ad4aa27e of course (but too late).)

--=20
With Best Regards,
Andy Shevchenko
