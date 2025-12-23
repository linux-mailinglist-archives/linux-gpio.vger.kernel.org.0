Return-Path: <linux-gpio+bounces-29839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85675CD9CEB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 16:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C9EF30C116D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 15:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60D434F46D;
	Tue, 23 Dec 2025 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="lDOkL1Fy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799AF34F24F
	for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503777; cv=none; b=UJomBsMDtgUnFgAs5+CvvTC/gsY+mnFPKlZZL8ToCbLjo5ke2qKSGHIMLX3GZuGmQ0Se3dzoumCqNSNd8sTonrIJMC+0d3L3Df8IyLHzGkFnMHSMpjuyFuHjkP65aiLQi59y15uMK4R9u5eWE0icIZjrfjmRJq9IF6AR2ZDrFeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503777; c=relaxed/simple;
	bh=UJ4a8K9wry/JPIeGH5DwpGba6bA4R4gax6qub7x2SY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqLHEDi5fwEr1dnpAEYxBNmwQ6MtDjTL3inAU9Pv1U08SJA8iWRLRA0AQnFuZK6jEw1PdbLfU1oXuAKM2kT3nv4/53IxqbHPJmJbXGamr/xsCWFcaYVosAPqUOABe41/VrxOqC//UAB8cwS/trYFDbpZptlWWOrmXGtCVhnov9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=lDOkL1Fy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b727f452fffso986225266b.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Dec 2025 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766503774; x=1767108574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLjISIOInag6cJNCp9GAXmtvydDuwUZOD3O+6EuGMpA=;
        b=lDOkL1FyHZFJ/9/OvPdkMyYxnkNuTkuKFAJlUBUCP6HN0MqcClWvGh955PsXfCG+TE
         XTJ9K//mvDtqzzy+8UpL1y6RStVl9cIPSZrvePcdWuCn+ocgGrIKDtG9+54W1w2//ou8
         OA5XU6YHOGYGLPwmx49l4TBtdurcyXq+U5KGyoNvmaVZMCeozr9d58t7zZ1j+zZEQDsh
         Kf3pekwyW72hmnLuSoSmitxCpGyWf6IWLHLSubohN8Q1uFEJ0jlLdVAnxp2afKolq/Di
         Hpo3XANTXWdDsDg7UaN6dPqi5wLfeRPeuisBuru1875FAqqqDaYDIxgxJJ2SJLG7SJGQ
         +dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503774; x=1767108574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLjISIOInag6cJNCp9GAXmtvydDuwUZOD3O+6EuGMpA=;
        b=X0e2Btynn8jNtspQ9l6WkzXrEixbY7Dkg2qnGUpV7t6VAgTJWtJBYY3Ziy6c2zHU3P
         a/vLfJpqyYYEtXMyxIibQqlLBvamRYgxM//4iTBeDtym/WEpUiB1rYtMshNX6wFn49Vc
         jbAyyTIbW2efErXS+IJ/ANZMrhqg+pFBnecUYbcOQM8hF82EsWeUUZB79+eZaKqQ6vEm
         JdFA59MNyvy30m/qKZ66HLMt5WNwh6ID7wPXb1nAC5ddI3bNRoU2G80bbGLwNE5TI6RQ
         gbbvPnik2Eny46ErqDD+jAEi644pegJMvZn8k7VHxrB/tIKp0M0V+/5oU0UvHkEPaAFp
         xP1g==
X-Forwarded-Encrypted: i=1; AJvYcCXQSW5R4gPvWYO93gwiCLZ5U6DY8G7VsUTw6k/VKS08/j92e7ln0WDIzRNRgfvsUug4r1XF8WxpmHxo@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKrPk+KIDJ9xM5k/sxNMHZ+GkdTQWlXuvqBL/VvM619xFCcn+
	23nJW3oav9oJ59uquIom+X6dbBX3rdnur9YhN8eeu+XgTlhdzrToOaBEPvR9MB1d/FVveDS8v4y
	r3js2jT9+ZnjJxA4f7DYKhMlcJWhFQSFsTAEHLBNSiw==
X-Gm-Gg: AY/fxX5sb9Ny0jgf8mcry4/biZNE+f1WK/PRAl5OmbnEDfFK4osiI1Et0ikfumAlMgm
	gEXz54gM0Gq9ZFWAG6+ksXvy5uVgUxiLAapqGPk6wreKzRo6kdD1eEPgDS4XROnmfS+JvnLAXCd
	2A2+LHTloWS96H3Zj4L8AumffMTfzfIR5EXtciUxsYrdHFRpcXkbyFLX07BcRMiBha3PdCeuPys
	TSrW8h7fkbWORi8d7qbA0n1dtX+DD3sJNxNNpY/VBNAztSBrgtsGhd2G62636T8H+0QFNnni6R5
	1ZHfaQFuedJjLaiJy+bx7QkXTkQH5dpu4q9Jb2UGBP8iGMiiFA==
X-Google-Smtp-Source: AGHT+IE+xxKz9WunQGu5xp3nWvZrKUFIZLNano4iauMvK7wBVyl981tNBySUR5mcD+g4BmTew6KluXuH/rQplznm+8E=
X-Received: by 2002:a17:906:30d4:b0:b7c:cc8d:14f4 with SMTP id
 a640c23a62f3a-b8020400995mr1538956066b.4.1766503773539; Tue, 23 Dec 2025
 07:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-18-robert.marko@sartura.hr> <20251216-endorse-password-ae692dda5a9c@spud>
 <CA+HBbNF-=W7A3Joftsqn+A6s170sqOZ77jpS105s5HPqkskQzA@mail.gmail.com> <20251223-chrome-simile-8cf1e9afe155@spud>
In-Reply-To: <20251223-chrome-simile-8cf1e9afe155@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 23 Dec 2025 16:29:22 +0100
X-Gm-Features: AQt7F2rjEyMDZrOpK1oplok3NPPf4ZxKJg97_UNzU27UIMOHDSKt5OOOHzhM_mA
Message-ID: <CA+HBbNFhVVoaiVJtH-fB3Wmeh6O3C_H=bwz2vBDR2MO4o0qy_w@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] dt-bindings: arm: microchip: document EV23X71A board
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, mwalle@kernel.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 3:43=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Dec 23, 2025 at 11:34:55AM +0100, Robert Marko wrote:
> > On Tue, Dec 16, 2025 at 6:32=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > On Mon, Dec 15, 2025 at 05:35:35PM +0100, Robert Marko wrote:
> > > > Microchip EV23X71A board is an LAN9696 based evaluation board.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/microchip.yaml | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/microchip.yaml b=
/Documentation/devicetree/bindings/arm/microchip.yaml
> > > > index 910ecc11d5d7..b20441edaac7 100644
> > > > --- a/Documentation/devicetree/bindings/arm/microchip.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> > > > @@ -239,6 +239,14 @@ properties:
> > > >            - const: microchip,lan9668
> > > >            - const: microchip,lan966
> > > >
> > > > +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 1=
0G
> > > > +          Ethernet development system board.
> > > > +      - items:
> > > > +          - enum:
> > > > +              - microchip,ev23x71a
> > > > +              - microchip,lan9696
> > >
> > > This looks wrong, unless "microchip,lan9696" is a board (which I susp=
ect
> > > it isn't).
> >
> > Hi,
> > No, LAN9696 is the exact SoC SKU used on the board.
> > I will drop it in v3.
>
> Instead of dropping it, this should become an items list with 3 consts I
> think.

Ok, that lines up with what other boards in the binding do, will do that in=
 v3.

Regards,
Robert



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

