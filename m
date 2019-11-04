Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E74BEE394
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbfKDPV0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:21:26 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42576 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfKDPVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:21:25 -0500
Received: by mail-oi1-f194.google.com with SMTP id i185so14387262oif.9
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m6CiWPA8G8Uq1GDWejV2PJcbtK9o73yo5NgLPE2/PkE=;
        b=B57C7oyusn/XXPB/BbpXcX9E6OTMYls5dmpYswFDOtHZQ2YtIUJ8+EGBOuNziP5AA1
         U42+xE7mrJ7lJZJTzWaG75BEzqpY+W+pcMzOsCecn7NTWPXMYkX2G5HsoW4c02EeaeMa
         uzCGs15fchbdJxLWdUPX08PvYHpbEebEBGLNc1QjAKE4Qm3GNI6LgZHnJJct/BYr0aEr
         TVe1astEbgi5ranJr1yPrVOBcC0o+EGD7SH8qvEZqc8yn3MzZQhj3An51SLOS8mLPIz9
         r1wXzQrXc8iB217lkj6NHNss1vSPVPAUu52Yul+2/mHuY2Ux0nEiFmhy7oID/3Tusw6O
         b90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m6CiWPA8G8Uq1GDWejV2PJcbtK9o73yo5NgLPE2/PkE=;
        b=U+6KZs7QDhGe2/GnPzhQD16ZJ4v5TFQxxNmusJcTLkzFgXItOWZbZCk3GUYKF2Z893
         YFkxvNKrrVJtO9MUMmoJv1XKAyRWzuetTM+rQmIqTaJESCo6bPA+fPLtWRSW1fMqVx10
         suuf4Xv89hA7IzzKU1uFeBLu/J8WD9h+cdUx4gtm0N2TAPzkIMmWxOqzIOE1EwPv/DLM
         bMRz4qW3NtM9yuk3wih88fMuqVINDGkzcsig9E9yGaU0LGTjKHeHZlTEi3KVWPYkLFE0
         uWrm8cua13af9pPX3tIFFkJcRnQthpLXvkSmo2caSXXjo6+ZDuTjzebwUi8ozrRyMGNv
         BJMg==
X-Gm-Message-State: APjAAAUEVO5An2AapzeAoIamafII9BUQvGUtg7L7VFQQ4GWQeMctv7gI
        YdCmR+v8ip+nOGGWvghyk2V9q5LXjU4hnlGlAx74Ew==
X-Google-Smtp-Source: APXvYqz55/vf+SDcpUSsfFygQWFfODvKL1/3uXVYuWSV2BxOR+bMOfXXZe12DieuRhmKN2UxlL2TYw/PuA4UynGaZPw=
X-Received: by 2002:a05:6808:498:: with SMTP id z24mr4589053oid.114.1572880884297;
 Mon, 04 Nov 2019 07:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20191024122224.11776-1-geert+renesas@glider.be>
 <20191024122224.11776-2-geert+renesas@glider.be> <CACRpkdZ5DB4fBDpkCG7NMrRohHcejj0EfjqN882c5wc+pahW2A@mail.gmail.com>
In-Reply-To: <CACRpkdZ5DB4fBDpkCG7NMrRohHcejj0EfjqN882c5wc+pahW2A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Nov 2019 16:21:13 +0100
Message-ID: <CAMpxmJUnbYGwd0ZudV=aSddviYGaHqr9n9eHZzS7HrOrV3vBdw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] gpio: em: Use proper irq_chip name
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 4 lis 2019 o 16:10 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Thu, Oct 24, 2019 at 2:22 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
>
> > The irq_chip .name field should contain the device's class name, not th=
e
> > instance's name.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Untested due to lack of hardware.
> > .parent_device not filled in as this driver doesn't use Runtime PM.
> >
> > v2:
> >   - No changes.
>
> Patch applied.
>

Oops I already have those in my tree. I'll back them out before the next PR=
.

Bart

> Yours,
> Linus Walleij
