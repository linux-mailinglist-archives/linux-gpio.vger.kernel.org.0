Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1181719C1C
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 14:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjFAM1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 08:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbjFAM1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 08:27:40 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8786B133;
        Thu,  1 Jun 2023 05:27:39 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51456392cbbso4419810a12.0;
        Thu, 01 Jun 2023 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685622458; x=1688214458;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldhSPM8DY/S/KcQWSOQ5gju1alxBVqBhcPt+dp3nPQ0=;
        b=HwgpRU8q0WU13FKHg3jk93qCrPsjwaN3fSSoi2ubwdaFdtIT1rgCKJXCgT6H9MC9/T
         k4G/GYML1m6WVu2zSa0uR8cIuFfbdMV+TC2DMdvhYLJkY9s3ep0CufOhCbPNiOe3yAic
         A+GR3AF84u1A5LGso+ew3xIF4n7j6Mm1yEsUWICgni4z6LHBib+MEAe1mETcrjmRmJtp
         S6EmeASu0GCwhTcQW+s9IUhZmTtdI60MDZdyo9mf64COCh+eayOZxmOWoOHCEk4Mgi6N
         0k7LkV33UoqHbJ6UEKOkkh0sDjfqm/cBoPfmeGKsox8f3Tyy/7j6psU1h0pTry+pVLRR
         iOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685622458; x=1688214458;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldhSPM8DY/S/KcQWSOQ5gju1alxBVqBhcPt+dp3nPQ0=;
        b=N71QZjQMEYMZ6EZPTxfadu6h+7sT0WK2kWKdLaolxT2doVXhm3ehS9KMRCLNe2xlNX
         dLM95IutZMn5CvEjbuyG+43RVoLcqX7DCfBHCX3eR9Ct+PKRLVy66FMpRadupEaM9nkE
         nKYtAmKe558ErVqRwRCWIncbXKC0O1VkPXAMimre/KXkKKNrVhylsr34WgWtw8vFc8uO
         WKABoqWTBb0Loerx6sP2D/MTGw5plabbDp++o9FmY+7WSxdtlvsx3wpAEpUe20Y1YvQs
         C9EEUxuPCK6BQF9SAleZb3SfzniYXglINaqxHKYMkaonH+K/63gGIdlk2NWLzS2DN8Pf
         dXhQ==
X-Gm-Message-State: AC+VfDyik1YAxHUnglmXK5uHyl7OCiw/6tNCHr5nCbs8Y9t0UaUngUD9
        hW5Fxi1wO6EVDJ8c+G0fvrQEkxWhzNk=
X-Google-Smtp-Source: ACHHUZ55eJf5FAXWWroUSGH7a8LTNO9faoiLwg9lQmooASXS1nWHBgtYjwiYjIrzHPhYn+T3FVl5cA==
X-Received: by 2002:a17:907:d13:b0:96f:8d00:43be with SMTP id gn19-20020a1709070d1300b0096f8d0043bemr1394049ejc.0.1685622457657;
        Thu, 01 Jun 2023 05:27:37 -0700 (PDT)
Received: from orome (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c6-20020a170906924600b0096f694609f3sm10590404ejx.31.2023.06.01.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 05:27:37 -0700 (PDT)
Date:   Thu, 1 Jun 2023 14:27:35 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: tegra: Duplicate pinmux functions table
Message-ID: <ZHiOt7Jsp_PP7Se4@orome>
References: <20230530105308.1292852-1-thierry.reding@gmail.com>
 <CACRpkdaN2r24QrL5t-_SsUQ-9o=BhZx0eFgpbsA+QiFTicPnKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DqrzsBErqR2fs//S"
Content-Disposition: inline
In-Reply-To: <CACRpkdaN2r24QrL5t-_SsUQ-9o=BhZx0eFgpbsA+QiFTicPnKg@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--DqrzsBErqR2fs//S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 01:19:45PM +0200, Linus Walleij wrote:
> On Tue, May 30, 2023 at 12:53=E2=80=AFPM Thierry Reding
> <thierry.reding@gmail.com> wrote:
>=20
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The function table is filled with group information based on other
> > instance-specific data at runtime. However, the function table can be
> > shared between multiple instances, causing the ->probe() function for
> > one instance to overwrite the table of a previously probed instance.
> >
> > Fix this by sharing only the function names and allocating a separate
> > function table for each instance.
> >
> > Fixes: 5a0047360743 ("pinctrl: tegra: Separate Tegra194 instances")
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> Both patches applied!
>=20
> I can't figure out if the problem is urgent or just wasting memory, so
> I applied it as non-urgent fix for now, tell me if this needs to go
> upstream pronto.

I think you might be able to write a device tree that triggers this, but
so far I've only seen it cause an WARN splat when accessing the debugfs
attribute that reads out the pinmux functions. I think Prathamesh had
mentioned it could also hang the system when you access debugfs.

Overall I don't think this is very urgent. We only observed this as part
of testing the Tegra234 patches that are under review, so it's probably
uncommon for people to run the problematic code paths.

No matter what you decide, the Fixes: tag should make sure it goes into
stable releases which is probably good enough.

Thierry

--DqrzsBErqR2fs//S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmR4jrUACgkQ3SOs138+
s6Fb2w/+N6PHCT9n7J+hSBPSe/8M3IIc2rbY5EwGNyi7+iAZ8O2wlN88OyzMn8kC
IxMt/n+0mKYo4FdpdsAk/z1VnKLz/1bu33czaaNd9a33QsvBLmXWvRYJ3V7i+ucS
VsBVJivKmzzWDaAjJqUAckWyvZCvVxLpHTdVjdIrZyz+lD+JqP+adNFSan/il+nO
T4jxj7IujkzbtgnSJAf7zu0+U146zxkPc5wxM+oLK43jb9+daLWrU1kU02sxOVLr
SqpDdQ50IVWEuuF4DodLCJRs8u77zYELj78Dk8DzNb8Zs4O4KhE7N0gVcjSTP6JE
b3BetqYgVFlCIPkRX7R5KbjwiTvsIo87Xf8IkTnxMlyoEwePs35SI84hGmunr5zW
Uig4qoOtGI1GSZCKxo2rKr3WHOeq9M9ElhiFceOFhgHEItZPNq4I30ybfo1ewdXK
S77eJqNFQXPn1MsSUVLHvuxrsQdZTTCGcPbfuXyBA4G3eqcDrylvflqxxCDvrE4U
TKbZsOyz20x+WrbQJ7wjRfHgKnKVfPdO4euFYbEqbJULasI44TTiK5y5Mjy/wSdR
WDxY2KNcum0a653atgyeMxPSRk5FbvHKOJWvZNugoCWN5H068mdlgDLhMIzOqwF/
X0IaoIpWQFCPqKzevhs0IzwGzeJulohjL7XZpZOcfy4mevtYjtA=
=0/Ig
-----END PGP SIGNATURE-----

--DqrzsBErqR2fs//S--
