Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED2893A663
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 16:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728635AbfFIOg0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 10:36:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34844 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727649AbfFIOgZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 10:36:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id x25so1039334ljh.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2019 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JK4vu4sLdSULC2fSMGogH6TEKgCHvesH+mwHY+UBzDY=;
        b=kBeuKMwwFXVi/W2FO+ZpRO3DvYUswwRt1xpZtOtqqVCchYyTz6lE9ei78oqmmEmVrA
         4hNHxhi2FYaGSdPSzJbDfa+oPuF2skJ5/4gQVwZ/nvOrFwBdLaSKmXz+m1NYWlBNgwAZ
         GCNANUYgP4KDcSmCC/lEF/q8DxgXnnECzZI+8ujqwdvPt3zG7xlzkf+/4Gvs5T5g09DX
         +9Ic62GbnswMqbLDX7Aj6qJLnnDMmKccSkPX5Vf1k0/JIlIu8YEHqgvl7BehWz/Muk1+
         mqAjGFYG9AFMIfRCniFHeLuXB4nAFYVBWraOgQqFfQsyVara5FCsLkTBYjaST26Fbr9U
         a5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JK4vu4sLdSULC2fSMGogH6TEKgCHvesH+mwHY+UBzDY=;
        b=AQa3knoWD6CUVG42bGLpAfIp3N9m4YUCZBxOTxrKIM6DOZgnkyY+c1yKqBbB0lrWkz
         C+kKqm7z/LWVMii4x5ev9Sp6FV2r3+bIAEInOPVOXjOmMbZys5gnDbxrNNL3wfToAFNX
         /ENQlptAzt9tY0Ty2G3zBx7mqazBezKJHkKl29oMNXIG9pzHQussrRcZjqrbRwjfPwNw
         VCdX8XOA3tpo0NCPWRsbmo4TXegYzavFU9g91T7HAkegmMLNoylyNxYGC2B4h7uU1gxZ
         Fg7uwoAfS16WI0N0OQSQLXMC5H6rrn0SyrkazIBpNKU4TfW226BlnVcDANmnRWDB/Jcg
         K3Dg==
X-Gm-Message-State: APjAAAU8NjvCWCdpF39USGjN8WyBTNWtIjzD/rx8qWDYwOfJNePQy4R9
        9XS5qzgOPYdobUjgab8h8pDMxO4xXMUCrtcosQTecV46
X-Google-Smtp-Source: APXvYqw97CQhtz/Z07DubzbfOmpbMBvaIzWVgPxSNP/D82OPJh6ZogHQPXicKFxb26EycmA43o+u6osu8RykyNXEbDM=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr27624245ljk.104.1560090983783;
 Sun, 09 Jun 2019 07:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190602210918.32741-1-linus.walleij@linaro.org>
 <CAMuHMdX8idAx9QnOMYyS0htYFw66Zs08pbGb7OEf5ED7Egv9rg@mail.gmail.com>
 <20190604084545.GA1129@kroah.com> <CACRpkdY-HCGd_ScGNNDAOqY66jvfQZ9Gjm7o9tj+YUuxwV8i4g@mail.gmail.com>
 <CAK7LNAT0rMF5U8mOTeA1uggJJUDOArW4JO3Bz9Tf=hQk_64D8Q@mail.gmail.com>
In-Reply-To: <CAK7LNAT0rMF5U8mOTeA1uggJJUDOArW4JO3Bz9Tf=hQk_64D8Q@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Jun 2019 16:36:16 +0200
Message-ID: <CACRpkdYRHtMB+wyu3DPnjUW642U3LDK2S=_=u18a7Pi3v5K-6Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Fix SPDX tags
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 4:30 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> On Sat, Jun 8, 2019 at 7:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> > I guess I could tag on "-only" to cut down the buzz and make git
> > resolution happier.
>
> You do not need to apply this patch.
> No sense to add the equivalent changes via different trees.

Hm good point, I should have looked closer to see if the same things
were identical in both patches :/

Right now I can't rebase the tree since I pulled in development from
submaintainers.

But it's impossible to avoid stepping on each others toes when we do
treewide changes so let's try to just live with the result that sometimes
two patches contest about the same changes.

Yours,
Linus Walleij
