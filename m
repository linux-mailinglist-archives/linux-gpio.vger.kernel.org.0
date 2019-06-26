Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45C77563FD
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 10:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfFZIFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 04:05:55 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45114 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfFZIFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 04:05:55 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so895142lfm.12
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XNWToJOMk+CfNNifzCHhCz3YIayxAe4PxF0Ow/xhtl0=;
        b=O3V4COvnrAQL4BqPIh4+NbBNzJgVlY9McNdQaltHCbOA8wfG9H/gxrA64BDh/O2tCY
         nxZHu8J2tgJ4JI8P6q3hZ9mv4lPPgCA7M6DLTwKhvoFvJRAGm/OlJFhHcO9WRh262OkC
         +nKMEe50nuMuB6agiWD811ESeQRh2GOIYTan+o9I/gJWqRLThxM9iZDatNg1iLpvVL1u
         Blw2aIE/cJNTij9AtT97j1iYbYSIkuVxJxrvHQOL9dAcxcu6MPj6199faxbPOzcSEhcu
         DvIqYk36H5ab1gz6GKLo6gdVJCJScjB4xgiMsJ0satVxsDSywfJTo91AWa5W63zNLZA3
         nDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XNWToJOMk+CfNNifzCHhCz3YIayxAe4PxF0Ow/xhtl0=;
        b=XZDE/PdGaFw9xvnbi90HYupH3Q+w3k9I1c7mYH5FqvBHr2Bjpr1ZjMyWUZ6tsAs97q
         79L0P8e9SG9Nh8NNmo39TkBcbI+ih3coKpHAApBi5KWu1ehyWi0amcU7t+2MweukmU2Q
         lx1zFlWq2wAIccErrnzhVbGEXwJIVAYA1DeRfQA51SE6qxY1Aw4ZsElA2mNaePa7BAD2
         gbXYRjAAn9CJlCiasg0F0DAbLvMzWKqS1hyW3Tm1aXyhEuddnSthLzo1SI6NSsIOgQ8U
         Kv0lBkmJJxqLcSqpI+ddOd7j8LZb2FEgsxsjR/NGUqNto3Ez+vqqixtkmsSfIVO9XmdO
         +0Mw==
X-Gm-Message-State: APjAAAVVITkO97zkBclE14RpQeHq3jid6mqTWeup8/QVuOT/ZTmFY9ba
        dzCe/9zGdbZjMYY2MddsxvHuLmMhkFbdAnEpBYAYsw==
X-Google-Smtp-Source: APXvYqx7n0Fb5OBvFlsZO8AYoUhuR/waInW7axvQPKhxjS/l7vc+8Zj2pQH+uniqsyqUqGAQqgraXhmrkIjbUfalsKo=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr1948205lfm.61.1561536353425;
 Wed, 26 Jun 2019 01:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190625105346.3267-1-linus.walleij@linaro.org> <20190625193328.sxvhastsatc62msh@pengutronix.de>
In-Reply-To: <20190625193328.sxvhastsatc62msh@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Jun 2019 10:05:42 +0200
Message-ID: <CACRpkdaKY-SScLRrOGQbZwRX5sYP=A9ABKxwj3YA_XLp839FEw@mail.gmail.com>
Subject: Re: [PATCH] gpio: siox: Pass irqchip when adding gpiochip
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Thorsten Scherer <t.scherer@eckelmann.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 25, 2019 at 9:33 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jun 25, 2019 at 12:53:46PM +0200, Linus Walleij wrote:

> > The siox GPIO driver passes a IRQ_TYPE_EDGE_RISING as
> > default IRQ trigger type which seems wrong, as consumers
> > should explicitly set this up, so set IRQ_TYPE_NONE instead.
> >
> > Also gpiochip_remove() was called on the errorpath if
> > gpiochip_add() failed: this is wrong, if the chip failed
> > to add it is not there so it should not be removed.
>
> So we have a bugfix (gpiochip_remove() in error path), a change of
> default behaviour (IRQ_TYPE_EDGE_RISING -> IRQ_TYPE_NONE) and a cleanup
> for an API change (I'm guessing here) in a single patch. :-|

Yes I tend to do that to save time because I am a bit overwhelmed
by all the stuff that falls upwards to the GPIO maintainer.

More often than not there is zero feedback from the maintainer(s)
of the drivers, and the kernel looks better after than before.

But since you provide some feedback I'll just go and split
the patch.

> @Thorsten: I'm not entirely sure if there is code relying on the default
> IRQ_TYPE_EDGE_RISING. Do you know off-hand?

I saw that the driver has #include <linux/of.h> (hm seems unused) so
if this is used on devicetree systems with normal twocell irqchips then
there shouldn't be a need for any default type. The default type
is only used with board files. The siox seems not even possible
to use with board files (no platform data path).

Yours,
Linus Walleij
