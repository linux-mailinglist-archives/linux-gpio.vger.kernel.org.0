Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD55419A03C
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 22:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731098AbgCaUza (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 16:55:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45443 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgCaUza (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 16:55:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id t7so27815610wrw.12;
        Tue, 31 Mar 2020 13:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fc3hIrkGUeKzO9HlP2wK7i0On1epT+EO4vUBDD3v+Js=;
        b=ieUVlR2SYjqhAQj3opVq7EVf9dEqfCxvhzKHMNSj0SiNzytiIKSc1KOvMNQjdhpbZN
         7j3siE3r/xoFuPKFXxxWiOYbuPdDtYweXPF5aatN0FwUM+7UBUvYcrX8P3WNcB6wP0k9
         LM5+loss1ej6ifoCeuxMG5mmceb77Kh3WdhEHZV87tKQ7Ok3agX3+qHYdXAf1hr7w8df
         HpjYyIFMcfxOV+zC8x8dEjPyB9g0U0+5E7pbCaVVGN6oWv7HLUQH2myDa2/cDbJIlitr
         xhSIhhBb+mdsXqbx+0FjyBr1ftmbiMwBFcuqvLXW9bA/YyfXJlRqm6DwoiQKPeG258aG
         GihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fc3hIrkGUeKzO9HlP2wK7i0On1epT+EO4vUBDD3v+Js=;
        b=F+PSadKmVxIJ1JylQQDJmjlbkcJNwji7Y6jZLYOaW5/fM8B/DICvTXHoG/B1XnxPNa
         PobpQ0hRCw+PFvTWrJWrnLE7eHjrCcYRGP0VGNKSSe87ifoKG9qCx6pSnspw0GO87cK+
         Riu9anv+qb5S+J+DCKkd8n3x18O1dbbtL4ykH2WaP7hfqvlw+PEG8VPOgrNW3Rg1yyZz
         cePVEWODwJF/6DEruc0pvER4zGrHgFz714RW2TGPObVJL9Rf7tN1aDFgOZm7ocyHpKqP
         ZUDXlGHJIqH/+1QIy79nR0AXL3fI6/hyN54JHd2d04gpeahrSbfDcgyxjFqOkHlI90xc
         +rDQ==
X-Gm-Message-State: ANhLgQ0JzAfaW3XRANdNW1mUKXrsoPMFsS5I6003qeoGbzplGjQ6DJGX
        w0DbQcbcvi+Nxi6mx9hz/FU=
X-Google-Smtp-Source: ADFU+vvvQrkHvHyq/feIWUCI04feJapay9mmX5XR9URaVoaDNOH7GT/Gqep2c9V3z9dsVwsvN2mJzg==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr21880987wrn.261.1585688126525;
        Tue, 31 Mar 2020 13:55:26 -0700 (PDT)
Received: from localhost (p200300E41F4A9B0076D02BFFFE273F51.dip0.t-ipconnect.de. [2003:e4:1f4a:9b00:76d0:2bff:fe27:3f51])
        by smtp.gmail.com with ESMTPSA id r11sm29657432wrn.24.2020.03.31.13.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 13:55:25 -0700 (PDT)
Date:   Tue, 31 Mar 2020 22:55:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: Avoid using pin ranges with !PINCTRL
Message-ID: <20200331205524.GE2954599@ulmo>
References: <20200330090257.2332864-1-thierry.reding@gmail.com>
 <CAMuHMdXiK3KLU1=s4ykxmUVSsgwbnnc476w=Nnj-HsVytK2Lqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="d8Lz2Tf5e5STOWUP"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXiK3KLU1=s4ykxmUVSsgwbnnc476w=Nnj-HsVytK2Lqg@mail.gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--d8Lz2Tf5e5STOWUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2020 at 03:05:43PM +0200, Geert Uytterhoeven wrote:
> Hi Thierry,
>=20
> Thanks for your patch!
>=20
> On Mon, Mar 30, 2020 at 11:03 AM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Do not use the struct gpio_device's .pin_ranges field if the PINCTRL
> > Kconfig symbol is not selected to avoid build failures.
> >
> > Fixes: d2fbe53a806e ("gpio: Support GPIO controllers without pin-ranges=
")
>=20
> WARNING: Unknown commit id 'd2fbe53a806e', maybe rebased or not pulled?
>=20
> Fixes: 2ab73c6d8323fa1e ("gpio: Support GPIO controllers without pin-rang=
es")

Yeah, it looks like I made this patch on top of my local tree but forgot
to rebase on the latest linux-next.

Thierry

--d8Lz2Tf5e5STOWUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6DrjwACgkQ3SOs138+
s6GmYBAAm72E9z49F2uV5boN+ycWHCndSThMfzWp4N9d1FmWBr7Qcqlgl04oBnDc
hLBFfFbcPoUj+WOXN4pWen5c7pHkB+bjp/A5lnNp4uep4+mv1fzVYn4w0H/xs8mu
tpHczDhqi7qNGgVLd+6+x5nJJx6llZSsTCsUITOjsVFahxwqpX983ghzTNZN0oGJ
3dgKFuYnaaDcuM+dQM7BRoBAUIUUPGSjJlDUHEH43cvs8h1VyKxaFHmxx1WfRuSz
VNXsNhzrBdWcEvDloCIpVWMoEcMzjZfSn/D9mRSpIm6SYdy+0p8SH6qPf7/hMRDs
Z/XntIUnU2Muj2lpnummOMlFKNgMbSg/OpZ1y5kpRH6MT9FwYW5S4msLixUU1ZRp
iJe4dU7bqKHXGUJhL+Mu/s4kBC4B6TVJxEYe2PGPiArLdUBJkF8GL8161iH0eHOm
Ogn7ZbIOiDuXOld2mloJwi9IpNNfx4bQGqMQAGBKDBozhqw7Sf5k7Vplvk1l3gmB
WKK7+wh8T+ZmywNGQOcFlHDW530Tkno4qX96s81CI7CHCWlNm5vn/Ea+63fDKxpg
OW1TqquGljYvTwkpqRU+8iIGO/qk1xyfY+P4KusP9qyRYtIfrZ31WfYCLgJvlrNV
sDz0rdE/fvqWSZSY8/DWviZJDQAosi9avH0lo3uFaMykyKUWEpA=
=NuoA
-----END PGP SIGNATURE-----

--d8Lz2Tf5e5STOWUP--
