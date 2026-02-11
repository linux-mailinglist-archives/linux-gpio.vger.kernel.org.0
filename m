Return-Path: <linux-gpio+bounces-31600-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ67CoxTjGmukgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31600-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:01:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E4123167
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 11:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB863013EC1
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6EC36680F;
	Wed, 11 Feb 2026 10:01:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC49352C42
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804100; cv=none; b=qMWx6ONc0UAyHuIqBgiInLNn642JArnpQC4fi/jn4H+5uO5wsorAJKPcmV6QgO8K7samByz9LV5H50vAAltK4ubI7MBh4z7QlKzYi9ru2nUHN6s3UH1Uu9XYammVhRFtXrIU6GgUFoPYS3FOwguLhlVqgzUOIAqAyq69hxRA4i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804100; c=relaxed/simple;
	bh=Dyn5A0xBMrpzZ0V6DLf1LSrfgphC2IgYspNLzGlacfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UM0akWSM2Bp1ufQVshtGeK7i/jx10aVpHQm2Py2g2tJuy/2ovbVaMnaHUgjtgsZCI8V6OdbQR0QSFETu0FVBzVVLjKf8vAKcTkgqHh67cnGxZalAA+yxEiCpHR7+LjJGWRoTzWMx0r95DhAvPOZZi4hIB6glSXPUw2PhlcA3Yts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5673891928cso718532e0c.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 02:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804098; x=1771408898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v83DzRRw2jidt/UvVUYMQ/X8L3Y36ITUSwZjlgmX4MQ=;
        b=la9YBCa8ZtLV1nfExal/xv2F9daJfFTkKb96mmT76Vpi1mr4libcla3bKMDQRPwhNr
         3J9Oqyp0atBzyzwNmVDwdtvUt9iHRCvqgv8gVH2WzvjPlrPomIMQ9tSd7g7hMNJf5GS0
         +j4TZG9udIx/yjTZHulZzDgFOMnUPKt8Y2jevZ0XBtY0h+zYwWUGqQaqa/jUnjlZ0uHV
         AbVc52DKSFiJ3VJy7+dLDbCe3iEKAQCJhi1gMexknTbBiuDJdH+MBj8I9Oshg8odRasp
         WJwHC0vvB/e9y1NlA6PTtd48NRQz9OoKFLkNfwPGKHsTBtt4oB0HsF4PethZmtQ69y5c
         tULw==
X-Forwarded-Encrypted: i=1; AJvYcCVPmGhZY23lNG4sLlhRGwYT66LSURKU4hSuVUDLECzjwSLnYqWy2O8xhaUiQA0wNy/6sYGVaytMkBqf@vger.kernel.org
X-Gm-Message-State: AOJu0YxAmnQpeLR6QJbhKNYrZ+O5r0UGYuDZZBUHWXmNbu3RBY9WKX+U
	nYBT8R32dBwp2YRaJKoiFFT9D7PYEH5ku46r6sauln261QVUUhm9OxnlLPWY5R0ghlk=
X-Gm-Gg: AZuq6aKwGl1aPz45NKyw8KtFQo57xz1KxwJDQRRCr+OpZP20ViHpHbcD0BLuRefYt5b
	brW9Us0pz0jhUC8AxZ2rvB+8Rv2caChK1oPJ+mbsyDanldxQHup1aFekiCngP5qGjJugv8KsXSG
	PjrF3g4R0h41fJdkGqSK6pBYtcYY4Oa9tzT9ZRtV1L94CrNEJMSHsIUxqlqWhrOYAsrAoCG1FDB
	+LzYOQXfLrYXwk0qRTuUf7cGGk6p/hQQO/en/eLvq9PrHTJaNHXJ9I3k1lDWnKvU41OjHNWSxWj
	mIimK1klO6tDWoLllOYBE2GeBmg2XDOHM/bCEmiLwFSlsPkOdqSLFX8p8RpphklF9+1NSM6hvB6
	6GjJ1LvBLwbDOkjdGS8PaylNApLLFYOcJ1U5JDneJ4S5hkm6p4x9VW05ln9uyb4FreRsf+lROBV
	aV7G2Mf0cGbdl4ok1+E/Pt7x591oqCs69uyKXjSnXIOGM8zGIsqvLEN57w/vD+jMmb
X-Received: by 2002:a05:6122:3128:b0:566:ed4e:8320 with SMTP id 71dfb90a1353d-56749d3dcf9mr528129e0c.2.1770804098112;
        Wed, 11 Feb 2026 02:01:38 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674bfeff10sm468317e0c.8.2026.02.11.02.01.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:01:36 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56737fe4888so689368e0c.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 02:01:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxRsGG8r2Ylirac5uvNRH3G4qr/akOI76LQTrk4ezpTNCLv7VxTZ5YowXYzvlJ/vQqhPeMgTezGkgm@vger.kernel.org
X-Received: by 2002:a05:6122:4599:b0:566:3c22:c131 with SMTP id
 71dfb90a1353d-56749e4d3efmr486903e0c.10.1770804095886; Wed, 11 Feb 2026
 02:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com>
 <CADvTj4oetrsLwB0q=tA+9KZ7XTXd5asZjhZf=kekbSpnBFHA-w@mail.gmail.com>
 <CAMuHMdWTp8VsbBq0y9MKQJdkQnDADCbLbKW--gosoBt92PhAmg@mail.gmail.com> <20260211105735.0e8e65b4@bootlin.com>
In-Reply-To: <20260211105735.0e8e65b4@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 11:01:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUG3fMdVk3CVVJpacnZE=j7feke9Nb+Mq6obsCdCr7Dg@mail.gmail.com>
X-Gm-Features: AZwV_QhkZTLrLJeARWTdqpegZ05E_mRSU_756dbNFLjpCGMjC-Dcphy4OobnZeU
Message-ID: <CAMuHMdXUG3fMdVk3CVVJpacnZE=j7feke9Nb+Mq6obsCdCr7Dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Herve Codina <herve.codina@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,ew.tq-group.com];
	TAGGED_FROM(0.00)[bounces-31600-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RSPAMD_URIBL_FAIL(0.00)[linux-m68k.org:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tq-group.com:email,bootlin.com:url,bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D10E4123167
X-Rspamd-Action: no action

Hi Herv=C3=A9,

On Wed, 11 Feb 2026 at 10:57, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Wed, 11 Feb 2026 10:47:53 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, 11 Feb 2026 at 09:35, James Hilliard <james.hilliard1@gmail.com=
> wrote:
> > > On Wed, Feb 11, 2026 at 1:26=E2=80=AFAM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Wed, 11 Feb 2026 at 09:14, James Hilliard <james.hilliard1@gmail=
.com> wrote:
> > > > > Document the gpio-aggregator virtual GPIO controller with a dedic=
ated
> > > > > schema and compatible string.
> > > > >
> > > > > Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the ne=
w
> > > > > binding file.
> > > > >
> > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> > > > > @@ -0,0 +1,54 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: GPIO aggregator controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Alexander Stein <linux@ew.tq-group.com>
> > > > > +
> > > > > +description:
> > > > > +  GPIO aggregator forwards selected GPIO lines from one or more =
GPIO
> > > > > +  controllers and exposes them as a virtual GPIO controller.
> > > >
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > +
> > > > > +    gpio_agg: gpio-aggregator {
> > > > > +        compatible =3D "gpio-aggregator";
> > > > > +        #gpio-cells =3D <2>;
> > > > > +        gpio-controller;
> > > > > +        gpios =3D <&gpio0 3 GPIO_ACTIVE_LOW>,
> > > > > +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> > > > > +        gpio-line-names =3D "modem-reset", "modem-enable";
> > > > > +    };
> > > >
> > > > Looking at the example, it seems you intend to use the gpio-aggrega=
tor
> > > > as a "Generic GPIO Driver", like in the example in the documentatio=
n[1].
> > > > Hence I think you should not introduce and abuse the "gpio-aggregat=
or"
> > > > compatible value for this, but instead:
> > > >   1. Use a proper compatible value that matches your device,
> > > >   2. Write proper DT bindings for the device,
> > > >   3. Add the proper device's compatible value to the gpio-aggregato=
r
> > > >      driver's match table.
> > > > The above is very similar to how spidev is handled, which also forb=
ids
> > > > using the spidev compatible value in DTS.
> > >
> > > Isn't this gpio-aggregator driver supposed to be non-hardware
> > > specific?
> > >
> > > I'm trying to use it as described here, I noticed the compatible
> > > in the blog post was missing and just needed adding to the
> > > driver: https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/
> >
> > Let's kick Herv=C3=A9 to fix that ;-)
>
> Where is it missing ?

In the driver ;-)

DTS must never use 'compatible =3D "gpio-aggregator"'.
Instead, you must use a suitable compatible value, as described in [1]:

   "Binding a device to the GPIO Aggregator is performed either
    by modifying the gpio-aggregator driver, or by writing to the
    =E2=80=9Cdriver_override=E2=80=9D file in Sysfs."

> In the DTS snippet example I see:
> --- 8< ---
> gpio-aggregator {
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&gpio_pins>;
>     compatible =3D "gpio-aggregator";
>     ...
> };
> --- 8< ---

> > > > [1] https://docs.kernel.org/6.2/admin-guide/gpio/gpio-aggregator.ht=
ml#generic-gpio-driver

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

