Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD15B95FE7
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2019 15:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729812AbfHTNWQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Aug 2019 09:22:16 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37092 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729810AbfHTNWQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Aug 2019 09:22:16 -0400
Received: by mail-lj1-f196.google.com with SMTP id t14so5114825lji.4
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2019 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=avheJWJajQY7PfCCSpcjgBxyhBB+prcVabC+Fv0sCJQ=;
        b=ELJDtB/01ExFyGuWaJKGDYfa6bmhTPurIolQJAtCGNR9YB5HDNVF8oHajafezRiBCn
         Q+3LTRFkwQ7B9QuyMBnMwyzD/x4PgKQqsbXOkxDu9Dh9x4SYxJq8/Luu+ooIWXovl4KC
         GhokEu/wvCF65/U6Ffpy6N+zrtlOtJ9rwufQGWgPCRyx7chtGnzHSQ5rnzxvVc3EFytH
         oVPuF10Mei8GaPtKnriyTtMG0HIWFYhRAXGfZjIQuFudNeFpY1GmhvjOcrNdAXlYoHbu
         HIvrenq2uNFgFNUgaMJSUhELTrclV2Kj4inu2h+0bMouWiG+W3cYFrE9wmpCDJ6skPyO
         +9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=avheJWJajQY7PfCCSpcjgBxyhBB+prcVabC+Fv0sCJQ=;
        b=WuVsKHCnCE+vSwIrQ0LMenLJt9EljfC6TJDS1EgZ7gd+TvkulT1rLseJM9rhwk9JHD
         FWh5dDQo1QXCStLLgNT5Z8JuiIjvob/2+Y+/G7gOXAWJecuzoFw4qOWwwWIv4HE2QHiP
         ngBF08q8MQ5bYiGqloPWWtufDEwNbXEIIu64w3oChSMfAdKQ8P9TGzJg7C5Mo8cpv1Pb
         3aP6Uo1eGifZdbuUrAOFZa/x8b1bA5rehxI8I5CpRur2+X/3wI/FZX+NYyyR2lDBhi3B
         wuHVOAwcts3Sy2loz9BMB2jEtPvwy31TFuAYZGxCE8DV1SEkQ6DnYMIVwuYGgHUqPsj2
         moKw==
X-Gm-Message-State: APjAAAVVDw3cCiBR2lU+38YEL+7StivL2AIxtVdtwIo2kQHdTk2j9yk3
        J7EFCC65f/Vp9qmrSGdqtLWA4ET6E+GBEhOqq9IwdQ==
X-Google-Smtp-Source: APXvYqySkeLD73rjtfY+rIYZuuvaf7CEzNgTjlBP3UXzkIKib0twYhKHhr46lBPmPXQ0YLG2BImPRqZQ/N3DfzDI3cI=
X-Received: by 2002:a2e:781a:: with SMTP id t26mr10879722ljc.28.1566307333073;
 Tue, 20 Aug 2019 06:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190820104252.8255-1-linus.walleij@linaro.org> <CAMuHMdWMA6r_-esqHUVkbMvQZs2o_BMyB_XS8UZUTrqwOMGCPw@mail.gmail.com>
In-Reply-To: <CAMuHMdWMA6r_-esqHUVkbMvQZs2o_BMyB_XS8UZUTrqwOMGCPw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 20 Aug 2019 15:22:01 +0200
Message-ID: <CACRpkdZ6kKkNv2iYeyqeBgDWeeXLwYs6WSpmhureVdzV16EL7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: rza2: Include the appropriate headers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 20, 2019 at 1:05 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
> On Tue, Aug 20, 2019 at 12:44 PM Linus Walleij <linus.walleij@linaro.org>=
 wrote:
> > This driver is implementing a GPIO driver so include
> > <linux/gpio/driver.h> and not the legacy API <linux/gpio.h>.
> > When testing it turns out it also relies on implicit
> > inclusion of <linux/io.h> (readw etc) so make sure to
> > include that as well.
> >
> > Cc: Chris Brandt <chris.brandt@renesas.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Geert: assuming you will pick this up if you're happy
> > with it.
>
> Unfortunately shmobile_defconfig is not happy with it:
>
> drivers/pinctrl/pinctrl-rza2.c: In function =E2=80=98rza2_pin_to_gpio=E2=
=80=99:
> drivers/pinctrl/pinctrl-rza2.c:119:13: error: =E2=80=98GPIOF_DIR_IN=E2=80=
=99

Oh drivers should not use these defines.

OK I spin a v2 fixing that too, no problem.

Yours,
Linus Walleij
