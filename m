Return-Path: <linux-gpio+bounces-29630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0164CC47A7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 17:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 491643044108
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 16:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD6B325487;
	Tue, 16 Dec 2025 16:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="Bci519GM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B14E3242AF
	for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 16:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904196; cv=none; b=BqEypK1s/NBopM/8aExJ2fT8dix+ZqFODYj7GHmnX7x8vbBKtfzFtc9AdArzdwVdfA6AzJnrfA7MyFqqW6kLZ3cZxQj7gWJ/3QLHgDNpfh7s0/YhZJKm8tazTd2bwifgnqYGaFdEg5NyOOii7BMIkb+Fc57rL5Zv3PFscB5aw00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904196; c=relaxed/simple;
	bh=Q8UWsSe4myl6JsHqQXZQYvioe1R/IQ7hZDIpoW4Rb/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpAsZDB9E657MpO5SKq6sYhV6mnkVQTok/MpTupvntnJ5JeP8tl37IZEAE3WeH0SAkQtawLgNd3m/OJHSufI5tlLJqH5Lw+l+NcUILfnIDclaoVZPkUHo2opC3tpf8idfF1lQAdLPjTLzDHHm2amRsGmTh/crUbD1+aqGnKJ+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=Bci519GM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso2895856a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Dec 2025 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904193; x=1766508993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=Bci519GMSOtC6TeCoUDyOlRLAMpK1+Q2VT7ZhSiNkVq/sylIitjnbfNXgSikndxl/A
         cd7NgVtjDoigrZ2hgv+nG6NUMdj4xZwAP7+aJX3C9nC+hC33rShtz/CMMALFyJaKN4gP
         47aeAH66w7rPn+An+lPnjgC8UK1y82k7RjHk0Laz0mRiKds6qMvdk1ypUkRe4iMFyIa2
         nURMkz/iL08EItn8+Gi9lzHxP24ZMohsictJ6bIc5meWCnwuCZiRYclWZ+JfO0qLN2T8
         mz84elWoDZq4kj7Opb6xh5i7WKc8WHHSRMg2pmXihuWhxphd7yhSNHxGPZ2wqxioow8E
         hjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904193; x=1766508993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Do5MSIsK8H3vJghWudLeWsp2L3mzUT53/Ta2p6+bLc=;
        b=vv7OUvi2mw+He+qYn+OovyBZTBJAysHJ7oCPTm07zZ1rLymBZZquhr3GpNqm0qmzKG
         89KDf7sOnQCXC8IxrUTUvnl8UGMUGduxr5D44EbKGoWf/KUroQV3B2r/EHhFvQOU6CTq
         NzvK3LemeR1ThOH6qy4VH/2iB0BtH/rfX1h0WcFgfJ/wrj3gri/LK9LKLACyPVI5HxRR
         8EGTz3+X7fXqzzjDmdzBKhVlsO8olEAxZPvlpUFj6IPbTbxE/YEQVnm+iRp0URRZtSwP
         auvOqs8cN5xEkZ69pM2pysOkjXoSUFuc35/P4B7yTJgBRmP8T/+7jeBUQcHHzGMn6Tte
         9dHw==
X-Forwarded-Encrypted: i=1; AJvYcCWrfzzLKibzo5xV2EckDd88H9QxxI5p2w6sej/SHae92gCDK18RG9txYV15BzQHfTnMuopy4b8xlyeX@vger.kernel.org
X-Gm-Message-State: AOJu0YztE3/QMWS33S3yhSYQ5rXNhX2fUic8GD73h9hIAk9B1iyD6jN+
	7LBAx5cI8Tx4H1ovikx4zQNHAPdtIu4P2DFoU7xfutgcEbF3LnUJIHJk01+QO8dihjyuFDJKZQP
	w+F+YBUGJLddrzeILj0x+qZSt8nyJ9EvFj6YFrazX9g==
X-Gm-Gg: AY/fxX6R3/cw/XRHLVedEl7sq0WEy+G3ejPv2ZIjos5A+M/hD7ejXTHbAExq0vwE4Xa
	H7UrYO8sJ/DCfwqGwLSCXwSU7cMxwt9kGfttT1zzA568bouU2sVI7mBqgAG4lOOngztqzstt4Tw
	Uf6XIIX3gq4SgV21hMZKqlf7FER2D6qxwhF6eOylcdrosZFF/WLJRXywDizilP80sgjD2Th1ew+
	adZIcTl6d5CePTY5rjrEYNCp1D0iOxzRpzO+QAipONr/rJmrM6VEKUwQwTzRF/3mmtI/T9p
X-Google-Smtp-Source: AGHT+IEe8IRzlnpv6us5Kh+xr3yaMQ8uOrd9bT9YETlEwP5WNPrUGdjkFlMhzeEA5DOez3HUYl6RwAjZzXtLufIttIA=
X-Received: by 2002:a17:907:2d28:b0:b72:9961:dc04 with SMTP id
 a640c23a62f3a-b7d236ff5fbmr1632649866b.28.1765904192972; Tue, 16 Dec 2025
 08:56:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr> <202512161628415e9896d1@mail.local>
In-Reply-To: <202512161628415e9896d1@mail.local>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:56:20 +0100
X-Gm-Features: AQt7F2rO9yn5Ak9EU9SF12LWH7YDPd4rf09lvsuy-j2tIJy7_yg0e1grszJzZqk
Message-ID: <CA+HBbNFG+xNokn5VY5G6Cgh41NZ=KteRi0D9c0B15xb77mzv8w@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net, 
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 5:29=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 15/12/2025 17:35:21+0100, Robert Marko wrote:
> > Create a new binding file named microchip.yaml, to which all Microchip
> > based devices will be moved to.
> >
> > Start by moving AT91, next will be SparX-5.
>
> Both lines of SoCs are designed by different business units and are
> wildly different and while both business units are currently owned by
> the same company, there are no guarantees this will stay this way so I
> would simply avoid merging both.

Hi Alexandre,

The merge was requested by Conor instead of adding a new binding for LAN969=
x [1]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/

Regards,
Robert

>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  .../bindings/arm/{atmel-at91.yaml =3D> microchip.yaml}       | 7 ++---=
--
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >  rename Documentation/devicetree/bindings/arm/{atmel-at91.yaml =3D> mic=
rochip.yaml} (98%)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Do=
cumentation/devicetree/bindings/arm/microchip.yaml
> > similarity index 98%
> > rename from Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > rename to Documentation/devicetree/bindings/arm/microchip.yaml
> > index 88edca9b84d2..3c76f5b585fc 100644
> > --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > @@ -1,19 +1,16 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  %YAML 1.2
> >  ---
> > -$id: http://devicetree.org/schemas/arm/atmel-at91.yaml#
> > +$id: http://devicetree.org/schemas/arm/microchip.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Atmel AT91.
> > +title: Microchip platforms
> >
> >  maintainers:
> >    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> >    - Claudiu Beznea <claudiu.beznea@microchip.com>
> >    - Nicolas Ferre <nicolas.ferre@microchip.com>
> >
> > -description: |
> > -  Boards with a SoC of the Atmel AT91 or SMART family shall have the f=
ollowing
> > -
> >  properties:
> >    $nodename:
> >      const: '/'
> > --
> > 2.52.0
> >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

