Return-Path: <linux-gpio+bounces-31596-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPoUIQ5RjGmukgAAu9opvQ
	(envelope-from <linux-gpio+bounces-31596-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:51:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F4122FAA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 10:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83A5230D1367
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0CF36655A;
	Wed, 11 Feb 2026 09:48:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223A36655C
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770803290; cv=none; b=WltGIPNQKyDcciB0fVpBGOmsND2uNK0mFUerpurzm+fXowbe2QRGcj23a6+psCa5mS7ASVP1m+EWPyQ43J7DQb64PkNHuiB/5Nq6tdldMhUOSLWwyLbgKykoSVpt3ma/C2INRVV/SlNCnWUmZHsIrd15ebVQ1iJzJjd0oOvXtiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770803290; c=relaxed/simple;
	bh=jyMtwfz6PT7x7i7yWX3x2fLhRVd0dJXQ6ezeHmhb+DM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EULrIyhLkv0yrcimKjwDeMoBj+7gKJiJ87wr2R2pXE4itDtkIzF5Bcdk6gIrcxYArR5XLqnBGLFgkt+SBFh/twXMfvz189TvFkGAPHV9hR0X0YcVVa+2NYRBBjnlkdK3YED+7bfUXpDwxPENrgeU9Sum/VRITcdVL63uhJiQsyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56711650601so3863842e0c.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 01:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770803285; x=1771408085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLozDRH8HbbbVVR1uH0ymCuzmIY4XWaq6dtDxYh2W3c=;
        b=GjWF5l9nPOj10MBVTm9z0DfKNqF1FXK8AkADq3yExT8K3QNvcKbL24UBWlx0ZC9P/t
         jpGgiSWHuMrbA3XqeaCO9s1mCKXKp2SsN9nUpjs0el+VMnQHXlc7CjqFS1AwOGrsSBZJ
         Mhce/Y4eL5Vkgn2UO2WgJ/OWvr83BXg/e3upj0o/u2awVK7YKilNPOgH+1psWHfDYj0k
         ziXGynMZ1BlsEr4IcDhWkBvyxt+JJ63sZrVkPY5rerJSqHbEdGOyF4eNZwAQk8rJQ8XC
         1pTpBFErIKhj+UOCKIG8Fu7upOqMcHEKXqFjZreDTgCeajV9vAkZbi/jTX1lUnErzY7S
         5MQQ==
X-Gm-Message-State: AOJu0Yw+YseK4XuKvnrbZR7UbfFW5I6kznHwEJjbb33Vn2MoPFcGRp9y
	/0CgHmByfa1UWcCauAGZQUnbNKs3goSHTC08rJgNu03yHboqFHXW9H3dYsIROYXIIMg=
X-Gm-Gg: AZuq6aLkaFhA28QrIlWQe44mox6lxfWVOPGZlpT8NTSA0upKIG/NqIztC3PuG4UWizS
	MEmo9BIeA7A/ctLcQWDkQXFFZcK3RaHFR7W9N8QiamU72tJtjahb0va5YtMi4jfOQZacVp3w6pP
	9dvrx6XwUIZ5yOVKVaSFdK17qivONN5xofP3DfWuYGXTsj4obullNY9WIfBD4FzpldRBGHabx1J
	ZBWq0kVUFB+F1vMdQfPHkztSs0h173xBbJXG1D8Wj2rcSs1DIro7cd0xSwd14YzP2RUMnD4KDn6
	2Om26Br3kV72wJAFokTjCVqj4WS/0BI6pPhUaTtsDpFC+QvMBBZFcOePbXODNgpWSURz5NTSCh3
	lSbuUKjZj/vqxrQ8H9iqA7fv0LJdZZe5m9P1cQiZlUAToOdtnjtGiQ9ezbVUTS4LC8UfMc6Evsi
	4CvP2dupcgDNZ2W8pSNnscu8wNcJb45IirqIwWgyFHqNSnBwPTnbh98A3efUpg
X-Received: by 2002:a05:6122:4081:b0:566:3608:f8dc with SMTP id 71dfb90a1353d-56749e34607mr657936e0c.11.1770803285439;
        Wed, 11 Feb 2026 01:48:05 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5674c246af1sm444043e0c.17.2026.02.11.01.48.05
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 01:48:05 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso2394365241.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 01:48:05 -0800 (PST)
X-Received: by 2002:a05:6102:4189:b0:5df:b2cd:12c9 with SMTP id
 ada2fe7eead31-5fde43fbf22mr584518137.40.1770803284774; Wed, 11 Feb 2026
 01:48:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
 <CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com> <CADvTj4oetrsLwB0q=tA+9KZ7XTXd5asZjhZf=kekbSpnBFHA-w@mail.gmail.com>
In-Reply-To: <CADvTj4oetrsLwB0q=tA+9KZ7XTXd5asZjhZf=kekbSpnBFHA-w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Feb 2026 10:47:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWTp8VsbBq0y9MKQJdkQnDADCbLbKW--gosoBt92PhAmg@mail.gmail.com>
X-Gm-Features: AZwV_QjPGdyKDxcd-FS9q6aUtMa_sneV7LtxUOCqGBzqr1A3ifoGwTeVXIGAXyA
Message-ID: <CAMuHMdWTp8VsbBq0y9MKQJdkQnDADCbLbKW--gosoBt92PhAmg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31596-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,devicetree.org:url,bootlin.com:url,linux-m68k.org:email,tq-group.com:email]
X-Rspamd-Queue-Id: 3B4F4122FAA
X-Rspamd-Action: no action

Hi James,

CC Herv=C3=A9

On Wed, 11 Feb 2026 at 09:35, James Hilliard <james.hilliard1@gmail.com> wr=
ote:
> On Wed, Feb 11, 2026 at 1:26=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 11 Feb 2026 at 09:14, James Hilliard <james.hilliard1@gmail.com=
> wrote:
> > > Document the gpio-aggregator virtual GPIO controller with a dedicated
> > > schema and compatible string.
> > >
> > > Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the new
> > > binding file.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> > > @@ -0,0 +1,54 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: GPIO aggregator controller
> > > +
> > > +maintainers:
> > > +  - Alexander Stein <linux@ew.tq-group.com>
> > > +
> > > +description:
> > > +  GPIO aggregator forwards selected GPIO lines from one or more GPIO
> > > +  controllers and exposes them as a virtual GPIO controller.
> >
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/gpio/gpio.h>
> > > +
> > > +    gpio_agg: gpio-aggregator {
> > > +        compatible =3D "gpio-aggregator";
> > > +        #gpio-cells =3D <2>;
> > > +        gpio-controller;
> > > +        gpios =3D <&gpio0 3 GPIO_ACTIVE_LOW>,
> > > +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> > > +        gpio-line-names =3D "modem-reset", "modem-enable";
> > > +    };
> >
> > Looking at the example, it seems you intend to use the gpio-aggregator
> > as a "Generic GPIO Driver", like in the example in the documentation[1]=
.
> > Hence I think you should not introduce and abuse the "gpio-aggregator"
> > compatible value for this, but instead:
> >   1. Use a proper compatible value that matches your device,
> >   2. Write proper DT bindings for the device,
> >   3. Add the proper device's compatible value to the gpio-aggregator
> >      driver's match table.
> > The above is very similar to how spidev is handled, which also forbids
> > using the spidev compatible value in DTS.
>
> Isn't this gpio-aggregator driver supposed to be non-hardware
> specific?
>
> I'm trying to use it as described here, I noticed the compatible
> in the blog post was missing and just needed adding to the
> driver: https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/

Let's kick Herv=C3=A9 to fix that ;-)

> > [1] https://docs.kernel.org/6.2/admin-guide/gpio/gpio-aggregator.html#g=
eneric-gpio-driver
> > [2] https://docs.kernel.org/spi/spidev.html

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

