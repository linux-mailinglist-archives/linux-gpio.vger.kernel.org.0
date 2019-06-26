Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8427567E4
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 13:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZLuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 07:50:07 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45524 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZLuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 07:50:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so1842555lje.12
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tjB6x/YHKyQp+3JT3QUuR9JR/DZ5Tu8sBXRch8BieQU=;
        b=CUovzAiFnW7tSI5EOrd7iIrxNOC1fZZ3ZyyNgAH40V2tdF00VdisVuCDdKgPpNkil/
         1/6SbmPatYAZGxC24ZceHGDUuJrNK5P0nJ0cFxao3Xf472RhjBacbY07oLD1BXmPDj0m
         q5Hs9Cr8fIKmONhqQE4PeaZQAikg1W6jtje7u+508OSp7b5jZ9AE6EOFboxOv/UoUeEh
         8zLDmYVQwltpkgugXvnVFs1JfrHjTgozVVLsRxuCRW4uQK3GmKBhbFipe+LCpJE7wIN2
         GVRT5Q3Mn+cPgCqsc5BJ93OhkTHTYZnrCluUhSppFZTaA66K6eKQiubBC7hR1tTMNl3x
         lOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tjB6x/YHKyQp+3JT3QUuR9JR/DZ5Tu8sBXRch8BieQU=;
        b=n7lnICOGkgKkiycj7LGILDiUpbUb4uH5GNUDKTZqqcV7TLVvKDefm5WGP8ZATfPnSR
         H4Ofgw33R5pSVjHc5oegeq1Mi/oFhq/NSJZ/zvmo4cSfmqPjPrHaxgfmMCRGrH9wYyHq
         sfAh7LBO4rpfbOZ/c9ymCD9zHXrY2kMr+6lionWJVWpqXu5/MMKbLqPWRG3uQbsHum/s
         SOKyEcW6Qg/p89cwWJ6c5z/gKi+6S6+aYcNzBaNE8aQQrpdyeWIPlRGDSAeGqgdn54nZ
         Mn/f6soMc7H6JTozozRWlSVjyUe++Nu0HBRHY6h5PG6o+G3Qb9V/FO16AHvzulssX+GC
         O0Vw==
X-Gm-Message-State: APjAAAV3BsMiUNMuTIRWcBX+HiMvlaI7ToaSHQuFsBb1OjiIYS9DaZ7l
        BelqXZU+2dcll6rRYTy3iT2gmVygEZoMeY3LqYnyZg==
X-Google-Smtp-Source: APXvYqziecWKXA90xY4PNAcsVEsukAXZn05Dif08Hd5lAC4jMrqR/HQ8VtJKccNCeWh9Ny5E1dfToi4Pjjjoh1ouTGc=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr2642699ljm.69.1561549805000;
 Wed, 26 Jun 2019 04:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190626084407.27976-1-linus.walleij@linaro.org> <20190626091220.zemlwyf4ubaawvds@pengutronix.de>
In-Reply-To: <20190626091220.zemlwyf4ubaawvds@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Jun 2019 13:49:53 +0200
Message-ID: <CACRpkdY0iJwPuPZ9SqEzm+GCBzcEP5=Y+w4te=q709=QUupaOg@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: siox: Do not call gpiochip_remove() on errorpath
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 11:12 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Wed, Jun 26, 2019 at 10:44:03AM +0200, Linus Walleij wrote:
> > gpiochip_remove() was called on the errorpath if
> > gpiochip_add() failed: this is wrong, if the chip failed
> > to add it is not there so it should not be removed.
> >
> > Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>
> Does this warrant a
>
>         Fixes: be8c8facc707 ("gpio: new driver to work with a 8x12 siox")

Thanks yeah I put the fixes in as a lowprio fix that goes
in with the rest of the v5.3 patches.

Yours,
Linus Walleij
