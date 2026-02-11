Return-Path: <linux-gpio+bounces-31591-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNYiF1Q/jGlyjwAAu9opvQ
	(envelope-from <linux-gpio+bounces-31591-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:35:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5171224A6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 09:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AD49306AF26
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 08:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CB7353EEC;
	Wed, 11 Feb 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTysi+Lh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1561C350A0B
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770798902; cv=pass; b=jiyOmTLqxfNSJTYIkY6Qwva3DKRjOtC06AXXEsexQwv4qv3Zbl6qQRC0beINvAGZCEAeXlh6pAS4bDqrz604Ej2TfUcYSuP1171FGQ/2q8vtCUyJ3Y0OrFs+uTtsRpINKsPYCjrJrTXThW3KkuV4tm9IdvAroCyEVfDTXrSyqe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770798902; c=relaxed/simple;
	bh=9sy1CT/jZthF5HQbc+sg67yNK28VFMTbC0Tg+M3zmKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AoRPbHQT8OvxSSBDWTHz7oHpnDcW82Bg8JxiJJiDcFIvNL1Z+EiB9mT2t6a8vRkTAhuRz0Yzq2VUQtDT1fxts5sUsX+kPRzjNoPSnWYUFpfiRjcEKq9H7871Eh5JTN0a3eTv8TGx1EZFZ9N2AWUmD72MyxATD7ZlfgR3lcLHIHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTysi+Lh; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5f9ed174ebcso4123062137.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 00:34:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770798899; cv=none;
        d=google.com; s=arc-20240605;
        b=O5P/w7Rf96xJd4PWlAws2G9IcLnaBf+Izf0kd4dG7+KGa9kkwWyFFz0gNbErkbEz4t
         ZLkCyRGYg2NnCIVlVDsa02I6eJWz2oBFyGvQX+hakWGbS2iM6d5L+FbYsiqVctOEC6L0
         bgbFRX8tErJqqFgghB8SuEhqhuZzDdi/ep/6dnwLLtWhFBKUD90zYa2h+MVa2AYaYbJD
         AHlcQ0i+jGvMzcwJDssytZsuTxzTIJAjlJ71gSKgsuQ4Qj2H6g6Hebuyg1LiBoOjuIbw
         xMtEPy0LWvO/GhycDznN5mfGBI5BjysCOGfNX+r1mjkrfEU7lhU9yxMN5T0cXucxBnQl
         BmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gB+voJ9pXS/NiL9Z4eXXKfd2kHrjxz2mBCt1N1H1pBU=;
        fh=RWqPcKGe6zMhGzVBRltox8x30IUZnhH2XzeShK5EfQY=;
        b=H/98fdr1RBjpcvv3QRlOBvo2GvGx7VEnXXFSqNqgwfdUdwkPjxQ5yImptIrHqVF8Aj
         EPUmrL+EXwWb7x0eWO5o5HMzZ1jk9Z5GxNLygUS4LLgWR+E3HOuVtP0IQfJfL94ODD0u
         1+IRCwlHcplmJtt6l89BQZv6dV42BjaxzvR3Buk7QfCuK3AyGXlIyy3YzayYxZLvCC3z
         /0/aicCBejJRrK8Sil+0NtcohQGtuMXAM0YDHRJf56VE1UtZsDgrfGhecnKIFMdKFDPF
         NjOZ4FKKJjcKNXktHexUnkiFeyfUkhmLxwrfg0o6+huWrEikX++22LVI4D+CVmDTIT1z
         kcpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798899; x=1771403699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gB+voJ9pXS/NiL9Z4eXXKfd2kHrjxz2mBCt1N1H1pBU=;
        b=nTysi+LhaKxPDmuCmoyRznvBF44bfY/+KEr0/wZrvHLKaRMm2k/iFDKdaJtkQ+UQzh
         Mbvz7RpHoNpRaH+otPt4lJ54gsG2CwP0W+TgWCWDyOaPy7df3ky+FPo8Qh7tmeFriBx9
         mx4Hyb/jIR3H1quoz6N/Civc/dUk49cAKddmtjnx46n4rMS7900DvRFGCX6oGPQKiQ+S
         g7ScqJxo5lEgDey27VkYIKqiF238wiKrqt/b8SG8Fx9vuiw+/omsMQvVJUabKQfBQQ+s
         dYxM5rbvP47iJ5QZ/isjVaKOIUKbw+Nxwdmi9k1CJ7HhaXuWxlZ6F2ADuBQqIr88preN
         Fy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798899; x=1771403699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gB+voJ9pXS/NiL9Z4eXXKfd2kHrjxz2mBCt1N1H1pBU=;
        b=KLS95YoyDD7Al2HWVD/6iIA3NMmHUMq8QzIh39YeJu0U0bivC5dlQv2E8HMlw837KI
         YcybzwAqe6Vx+n/h4QsVeoVPpZfmEMIreRN5mpikYnJISqzNw8tnJhJHXmdUSxzDSAac
         Ty7QllCouWCaxbqsF4WndSXLthN583+B4NDRoZTl650qvflWHPlp6DqFU++QKIvLumFg
         t7E21hFukqUrBnmHBIiOaZxp4LQQrgw6dnAZfCxmyxZFQ+JZb3pOheMQBRyufa2oQjKs
         R7jWztJqxSmBZIsEfe3QMF1JU9FAnwQFoZ6x8/NOEdmxfD82+32avihXaDRpGl65K4LE
         i2dw==
X-Gm-Message-State: AOJu0YywrZc5VtKH6DKGfsMFq3sMkhwzLfZVxFxvUHrKRYS+GwzP7zOa
	GPg6UUR+t8caMuvwINfCZhJXzZPlugKI5pHILdXXTyYf+9MJgOfGJQb538gMzD2RFJRpy/QdUxj
	kdRv0Q/2oy9iQljHQsg99nsn2ZHztdIo=
X-Gm-Gg: AZuq6aKr8cV4sGnjhuyS27KnANpLkuyQEOhp+uFbMlhQF56CUqKfT0JIW8eK8lPWFCn
	D5OchG/4eAsFR55ZWJMQ0c+wWkiPfLvibxRdko4H5mXUV84Jdq+g3rr0Ecp8FDFoewHlLux6Bbc
	lX91owCjva4f9cbH622xOrMXjzXLTXLy8nWfbSF2VgWl8vGLXgTbZJKymskBgxrs1dsEdlMiwgL
	8bizSzSBONztzefw3RaldMMaexnFTZn6fjj6NSTDsMooxHYZMEMVUIiw+a+Jl4tEgtjv67Qh/Dm
	sZR1lHyzErfaZLFdFqwhrBDcsXSlMXa95dYStp2jhiIAH/KmXzNMbT2E0F0HFLYmJ8S3
X-Received: by 2002:a05:6102:3e89:b0:5f5:4e0e:c826 with SMTP id
 ada2fe7eead31-5fc48c111bbmr1444766137.5.1770798899019; Wed, 11 Feb 2026
 00:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211081355.3028947-1-james.hilliard1@gmail.com> <CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com>
In-Reply-To: <CAMuHMdXWAx1Kfb84bhp0c8Gya5yaQjtYOnVFqJzyc4Wjc_KtqA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Feb 2026 01:34:48 -0700
X-Gm-Features: AZwV_Qj7Gzo2wnLCjGYX7X_WPDa_y5ffPDK6j_-RPcUd2pnezANnMEtpl04M6GI
Message-ID: <CADvTj4oetrsLwB0q=tA+9KZ7XTXd5asZjhZf=kekbSpnBFHA-w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add gpio-aggregator binding
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Stein <linux@ew.tq-group.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31591-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jameshilliard1@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tq-group.com:email,devicetree.org:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:url,linux-m68k.org:email]
X-Rspamd-Queue-Id: CB5171224A6
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 1:26=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi James,
>
> On Wed, 11 Feb 2026 at 09:14, James Hilliard <james.hilliard1@gmail.com> =
wrote:
> > Document the gpio-aggregator virtual GPIO controller with a dedicated
> > schema and compatible string.
> >
> > Also extend the GPIO AGGREGATOR MAINTAINERS entry to cover the new
> > binding file.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-aggregator.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/gpio-aggregator.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO aggregator controller
> > +
> > +maintainers:
> > +  - Alexander Stein <linux@ew.tq-group.com>
> > +
> > +description:
> > +  GPIO aggregator forwards selected GPIO lines from one or more GPIO
> > +  controllers and exposes them as a virtual GPIO controller.
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    gpio_agg: gpio-aggregator {
> > +        compatible =3D "gpio-aggregator";
> > +        #gpio-cells =3D <2>;
> > +        gpio-controller;
> > +        gpios =3D <&gpio0 3 GPIO_ACTIVE_LOW>,
> > +                <&gpio3 1 GPIO_ACTIVE_HIGH>;
> > +        gpio-line-names =3D "modem-reset", "modem-enable";
> > +    };
>
> Looking at the example, it seems you intend to use the gpio-aggregator
> as a "Generic GPIO Driver", like in the example in the documentation[1].
> Hence I think you should not introduce and abuse the "gpio-aggregator"
> compatible value for this, but instead:
>   1. Use a proper compatible value that matches your device,
>   2. Write proper DT bindings for the device,
>   3. Add the proper device's compatible value to the gpio-aggregator
>      driver's match table.
> The above is very similar to how spidev is handled, which also forbids
> using the spidev compatible value in DTS.

Isn't this gpio-aggregator driver supposed to be non-hardware
specific?

I'm trying to use it as described here, I noticed the compatible
in the blog post was missing and just needed adding to the
driver: https://bootlin.com/blog/gpio-aggregator-a-virtual-gpio-chip/

> [1] https://docs.kernel.org/6.2/admin-guide/gpio/gpio-aggregator.html#gen=
eric-gpio-driver
> [2] https://docs.kernel.org/spi/spidev.html
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

