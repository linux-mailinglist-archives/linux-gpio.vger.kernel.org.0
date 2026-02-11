Return-Path: <linux-gpio+bounces-31612-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGefCxqFjGmfqAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31612-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 14:33:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3516124CC0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 14:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F2B430624BF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 13:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8945126FDAC;
	Wed, 11 Feb 2026 13:30:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4735269B1C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770816658; cv=none; b=nDmfyuRqKxEbhjgaJ9olk0MFc6O8LkwjQme9rJhPPm/10wkJ3Ja4DZbxPrHnkktAaBo5TW15y8eBXkR6ay0CBSJ1wYBcfApsPvNBDgLpT9kMS8Tetlm8sLYcQecmnysAXZknQV3DX1kCcl0SzzdP4Xu9rVy0NScWmTAsUXDIu1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770816658; c=relaxed/simple;
	bh=s3EU2LjgOLRowZzF/wdJpBYxBfVigwGPIBOtUhjXyYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMPy6WqZecA+yFH04fVlw5Ammruqy8PCkXbyDQUXw9RbsrnbNJ4Z3LNZfkRIVuCi5qMD8I+8KvC5LaizPKHQ3CQjfQsMdH25GPxV/Rn9mTxz4pqHVD69H5zNu89jIjGI/M3Jaa6MoX2lKGhW1KSLyNYGNCy/WxUYMwbjrbzmFKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94abd52b274so529308241.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 05:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770816656; x=1771421456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EY2MdV7+apuNG1WYYGWR7W8whGLUoks5nRWrMCbyHpY=;
        b=K9pzhoI5xOTG8sQDvsxUH0OYl/tZS4iHlIAojGQu9psBZ0T6On4gSn/RKOkyWwfP6z
         JVjMXBltNIEGoSlzyd349P01kzIgDZSHrTXZHOqMWAn5NdV0Y4b8eww/b2pztVYEd+FM
         ZhukM67Wsp8ycnLjlROyNXxkDCnZ2VlkM1YyaZWqk6j1eOjaQUnuyBkjV28Tgj/EpAGs
         y0xzuN/W169O7B2YluzQOoXFLbcWo6Iwkn0dNrJxguvkPI4DmYWQE4o0z+kPip1w7QLg
         YA3XtIzgPL8vcUPWc4KgtfwpSkCmTABN+FwdUjKwfW334hQ2Tx3e3BG/7BGmbYKiq0C0
         LwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE86L+cgNavTtkjRYkRQO0GAS5PJQdG3i8viq3s/Vq5NSpcF6I13zNYeZxhuY8VO+tVfDuP2HSkZ3k@vger.kernel.org
X-Gm-Message-State: AOJu0YwtpUgvZbxDDBDOJIqykZ+6y3QvJ5b9pygAUpDxVl/Ez1rCpITh
	aMhXbwUXdr3jhrSWIA3cK5/UdjrgGVM4/xT5Mzf3jzcyjaC/4SWYCSOqxOymvrb9uTo=
X-Gm-Gg: AZuq6aJC3VTDgMUIMt222wTmZN/op2azzFaUGjXRcfwvgAVa/LliuEFlnfTN9Lra2rP
	H5Q4lCIZC50td+ss8qWSwHqOSZr6I0bwJueHbnpVWf7Mhp9kMu0S01AKeYSLMNhrMB3pD+0aYoJ
	piVl5M0uJhW8+x+usj8SqQs6+te/vbTMY9aSj2UchqjtjVH5AnEo9ZHtXcgdGfaTKM06moklQ5y
	uqd0P8SILwQp7+N4QuDyDg0FREiDWm7+BsisgisVGu+oLshcfCDk6/rInNN1iDBYpn+7pQy33MU
	EfFwC1Tm4hx1KA8g6GmXDBjZXgCiJ7vJ96A/MiMXBpVOS4BDQ0TSfKk3Omrs7b7ud6kKuyVDK8K
	+fZ+r+shaHyVWxmAxKfpPlBBmxr0on+n0JxSeChAR4jpDKdtaLlEg+C0D/WDLwVw5MDREI1pDPP
	AlLo3/yXyAPAAEi2GIkXv7XwRBntFOZg1bzD8hL8eFuv2pmBp+CLvNlPtFpMh4
X-Received: by 2002:a05:6102:3054:b0:5ef:6709:4738 with SMTP id ada2fe7eead31-5fae8bfa1a9mr5697628137.30.1770816654186;
        Wed, 11 Feb 2026 05:30:54 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fde88575b3sm594843137.5.2026.02.11.05.30.53
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 05:30:53 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-948e7c39668so569754241.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 05:30:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOi6q4zpNM+Fuv9/gTl5nmxS3oMWqDEdVkWAej4ghLu93LiwyltFtgygC3NAqPKdLb4lb9ZE/eMIOQ@vger.kernel.org
X-Received: by 2002:a05:6102:440c:b0:5f1:55c9:11a2 with SMTP id
 ada2fe7eead31-5fae8c583aamr4757436137.43.1770816653310; Wed, 11 Feb 2026
 05:30:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com>
 <CADvTj4oetrsLwB0q=tA+9KZ7XTXd5asZjhZf=kekbSpnBFHA-w@mail.gmail.com>
 <CAMuHMdWTp8VsbBq0y9MKQJdkQnDADCbLbKW--gosoBt92PhAmg@mail.gmail.com>
 <20260211105735.0e8e65b4@bootlin.com> <CAMuHMdXUG3fMdVk3CVVJpacnZE=j7feke9Nb+Mq6obsCdCr7Dg@mail.gmail.com>
 <20260211115837.265c46cd@bootlin.com>
In-Reply-To: <20260211115837.265c46cd@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 14:30:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8=oJMmiB4KaJQUpAO5gGHUkiWVPJ3A0X=ggz_QaNCRQ@mail.gmail.com>
X-Gm-Features: AZwV_QgY5m1QtY86-Ou_zkPGv-XebJFNUKF7P8jP_rlrUc2-Po8dRt-6TfVQYjY
Message-ID: <CAMuHMdX8=oJMmiB4KaJQUpAO5gGHUkiWVPJ3A0X=ggz_QaNCRQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,ew.tq-group.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31612-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,tq-group.com:email,bootlin.com:url,bootlin.com:email]
X-Rspamd-Queue-Id: C3516124CC0
X-Rspamd-Action: no action

Hi Herv=C3=A9,

On Wed, 11 Feb 2026 at 11:58, Herve Codina <herve.codina@bootlin.com> wrote=
:
> On Wed, 11 Feb 2026 11:01:24 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, 11 Feb 2026 at 10:57, Herve Codina <herve.codina@bootlin.com> w=
rote:
> > > On Wed, 11 Feb 2026 10:47:53 +0100
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Wed, 11 Feb 2026 at 09:35, James Hilliard <james.hilliard1@gmail=
.com> wrote:
> > > > > On Wed, Feb 11, 2026 at 1:26=E2=80=AFAM Geert Uytterhoeven <geert=
@linux-m68k.org> wrote:
> > > > > > On Wed, 11 Feb 2026 at 09:14, James Hilliard <james.hilliard1@g=
mail.com> wrote:
> > > > > > > Document the gpio-aggregator virtual GPIO controller with a d=
edicated
> > > > > > > schema and compatible string.
> > > > > > >
> > > > > > > Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover th=
e new
> > > > > > > binding file.
> > > > > > >
> > > > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > > >
> > > > > > > --- /dev/null
> > > > > > > +++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.=
yaml
> > > > > > > @@ -0,0 +1,54 @@
> > > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > > +%YAML 1.2
> > > > > > > +---
> > > > > > > +$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml=
#
> > > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > > +
> > > > > > > +title: GPIO aggregator controller
> > > > > > > +
> > > > > > > +maintainers:
> > > > > > > +  - Alexander Stein <linux@ew.tq-group.com>
> > > > > > > +
> > > > > > > +description:
> > > > > > > +  GPIO aggregator forwards selected GPIO lines from one or m=
ore GPIO
> > > > > > > +  controllers and exposes them as a virtual GPIO controller.
> > > > > >
> > > > > > > +examples:
> > > > > > > +  - |
> > > > > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > > > > +
> > > > > > > +    gpio_agg: gpio-aggregator {
> > > > > > > +        compatible =3D "gpio-aggregator";
> > > > > > > +        #gpio-cells =3D <2>;
> > > > > > > +        gpio-controller;
> > > > > > > +        gpios =3D <&gpio0 3 GPIO_ACTIVE_LOW>,
> > > > > > > +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> > > > > > > +        gpio-line-names =3D "modem-reset", "modem-enable";
> > > > > > > +    };
> > > > > >
> > > > > > Looking at the example, it seems you intend to use the gpio-agg=
regator
> > > > > > as a "Generic GPIO Driver", like in the example in the document=
ation[1].
> > > > > > Hence I think you should not introduce and abuse the "gpio-aggr=
egator"
> > > > > > compatible value for this, but instead:
> > > > > >   1. Use a proper compatible value that matches your device,
> > > > > >   2. Write proper DT bindings for the device,
> > > > > >   3. Add the proper device's compatible value to the gpio-aggre=
gator
> > > > > >      driver's match table.
> > > > > > The above is very similar to how spidev is handled, which also =
forbids
> > > > > > using the spidev compatible value in DTS.
> > > > >
> > > > > Isn't this gpio-aggregator driver supposed to be non-hardware
> > > > > specific?
> > > > >
> > > > > I'm trying to use it as described here, I noticed the compatible
> > > > > in the blog post was missing and just needed adding to the
> > > > > driver: https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-c=
hip/
> > > >
> > > > Let's kick Herv=C3=A9 to fix that ;-)
> > >
> > > Where is it missing ?
> >
> > In the driver ;-)
> >
> > DTS must never use 'compatible =3D "gpio-aggregator"'.
>
> Why?
>
> gpio-aggregator can be used as a virtual device to aggregate GPIOs for
> user-space.

It can be used for that, but that is not hardware description.

> I think we should have 'compatible =3D "gpio-aggregator"' in dts.

Proper hardware description requires a proper compatible value.

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

