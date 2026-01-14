Return-Path: <linux-gpio+bounces-30581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC7ED208DD
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 18:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22F7C304767C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 17:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0D9303A35;
	Wed, 14 Jan 2026 17:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="jcwfwBoV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D692FFDD8;
	Wed, 14 Jan 2026 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768411793; cv=none; b=ekU8O85gfZ1XtFM+Vj4BhjZRNcwmwGmPMSEiOtxRF9yeMk2lzhWVd6/Kkdnov1BeBTBrhLTNqaJGxPx+2BMaataCdR40JVc6C5FIVxPGZ+ZbWCrK55OLyf1dLnKWUo8HlABbnjeYrTIO+sPHEcnrfRtamIaxXLn26VkBM7pJT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768411793; c=relaxed/simple;
	bh=XsdLxx8D0quXty9wKoTo+w0p2zZ2toIEhJldukXnxbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D8KpYGyGK7VOkF0W5eHq8ja/46IkBVeGeFiIF2dNFeEOB/QXMxA0mQ9KlozduJXGdeYczKdQx9JnjDOA7Bauc327ebK+dRBu5HL1cMct7i3dGPfyYAjy67vrJe+2oTpnU4RCpEjXZEU5SP4uSMVBWV/USriwk5L8EMRnVHyNieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=jcwfwBoV; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3993E1F74D;
	Wed, 14 Jan 2026 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1768411781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tBEjvAxx+M0ZMA0mo2qlAa1X7I1foVNl3u9lyf67WhE=;
	b=jcwfwBoVSJ3Woc89ORXyc7f0GKVO/k8OSxQ++k4B6LBOcFfC0p7nFswlJdIVU+B6twOJhS
	igi2aAFK2v61uVQ3mU8YcG/8EVm5g2b1j0rPGMjbF/0VLxEWO/NtiO0BtMJFP9hzdJ313+
	hk2bHj7Y0mMocluC+cqTEEkLVuHB4iyB+dDU6kApSirsasYGqM8HZi9aDHbRwQZ1B9WpuS
	54BDDgNeWCb24EXQBs2dJTv2Ukl0T4hmaSrijh+r5SjQKg9yqyBlnnZmSIOT6I4iLhmaiC
	FsMcl1RGoUHpmrnYSG5HlYPIZ1PG9Gz3FSfS6WX6lVA0HZ7mIpEs6ihkeUxZqw==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject:
 Re: [PATCH 2/2] dt-bindings: pinctrl: mcp23s08: Add multi-chip example
Date: Wed, 14 Jan 2026 18:29:19 +0100
Message-ID: <1987899.tdWV9SEqCh@jeanmichel-ms7b89>
In-Reply-To:
 <CAD++jLmP13oeiZJx9_Y4oOCvFbJ=TaU_exHu9qqZjnCR9DGAbA@mail.gmail.com>
References:
 <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
 <20260113-mcp23s17-multiple-addr-names-v1-2-f14b60f92c82@yoseli.org>
 <CAD++jLmP13oeiZJx9_Y4oOCvFbJ=TaU_exHu9qqZjnCR9DGAbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdefjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeflvggrnhdqofhitghhvghlucfjrghuthgsohhishcuoehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrgheqnecuggftrfgrthhtvghrnhepffevhfduvdeludeugfdtleduuedvhfeuvdevgfeiieefieevteektdettdeifeetnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmedvrgegtdemfhefrggrmeejudejvgemudefsgdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeduieelmeejudegtdemvdgrgedtmehffegrrgemjedujegvmedufegsvddphhgvlhhopehjvggrnhhmihgthhgvlhdqmhhsjegskeelrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpqhhiugepfeelleefgfduhfejgeffpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhnuhhsfieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhimhgrnhhshhhurdgshhgrvhgrnhhisehsihhlihgtohhnshhighhnrghlshdrihhopdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg

Hi Linus, Krzysztof,

Le mercredi 14 janvier 2026, 14:52:00 heure normale d=E2=80=99Europe centra=
le Linus=20
Walleij a =C3=A9crit :
> Hi Jean-Michel,
>=20
> thanks for your patch!

Thanks for reviewing !

>=20
> On Tue, Jan 13, 2026 at 3:29=E2=80=AFPM Jean-Michel Hautbois via B4 Relay
>=20
> <devnull+jeanmichel.hautbois.yoseli.org@kernel.org> wrote:
> > +  gpio-line-names: true
>=20
> I have a bit of similar concerns as Krzysztof, this is unlimited.
>=20
> This is actually:
> - 8 for microchip,mcp23008 and microchip,mcp23s08
> - 16 for microchip,mcp23017, microchip,mcp23018, microchip,mcp23s17
> and microchip,mcp23s18
>=20
> (The "s" variants are just the SPI variants of the same chip...)
>=20
> Make some fancy - if: clauses to decide the maxItems from the compatible.
> Don't hesitate to ask for help if this gets complicated, I get a panic
> every time I have to deal with it because of the whitespacing business.
>=20

Indeed, I was probably a bit optimistic :-).
What about this:
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp23s08
+              - microchip,mcp23008
+    then:
+      properties:
+        gpio-line-names:
+          maxItems: 32
+        pinmux:
+          properties:
+            pins:
+              maxItems: 32
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mcp23s17
+              - microchip,mcp23s18
+              - microchip,mcp23017
+              - microchip,mcp23018
+    then:
+      properties:
+        gpio-line-names:
+          maxItems: 128
+        pinmux:
+          properties:
+            pins:
+              maxItems: 128
+

This would allow up to 4 chips to be on the same CS. But in the=20
microchip,mcp23s17 datasheet, it says:
"Three Hardware Address Pins to Allow Up to Eight Devices On the Bus"

So, the maxItems could even be 256 for microchip,mcp23x17/18 family !

What do you think (sorry for the headache !) ?
Thanks,
JM

>  +            /*
>=20
> > +             * Names assigned sequentially in address order.
> > +             * First 16 names for chip at address 0 (GPA0-7, GPB0-7).
> > +             * Next 16 names for chip at address 1 (GPA0-7, GPB0-7).
> > +             */
> > +            gpio-line-names =3D
> > +                "EXP0_GPA0", "EXP0_GPA1", "EXP0_GPA2", "EXP0_GPA3",
> > +                "EXP0_GPA4", "EXP0_GPA5", "EXP0_GPA6", "EXP0_GPA7",
> > +                "EXP0_GPB0", "EXP0_GPB1", "EXP0_GPB2", "EXP0_GPB3",
> > +                "EXP0_GPB4", "EXP0_GPB5", "EXP0_GPB6", "EXP0_GPB7",
> > +                "EXP1_GPA0", "EXP1_GPA1", "EXP1_GPA2", "EXP1_GPA3",
> > +                "EXP1_GPA4", "EXP1_GPA5", "EXP1_GPA6", "EXP1_GPA7",
> > +                "EXP1_GPB0", "EXP1_GPB1", "EXP1_GPB2", "EXP1_GPB3",
> > +                "EXP1_GPB4", "EXP1_GPB5", "EXP1_GPB6", "EXP1_GPB7";
>=20
> So we get this, and we already have this (from the example):
>=20
>             gpiopullups: pinmux {
>                 pins =3D "gpio0", "gpio1", "gpio2", "gpio3",
>                        "gpio4", "gpio5", "gpio6", "gpio7",
>                        "gpio8", "gpio9", "gpio10", "gpio11",
>                        "gpio12", "gpio13", "gpio14", "gpio15";
>                 bias-pull-up;
>             };
>=20
> This is wild, we need some constraints I think.
>=20
> Whatever we come up with to limit the number of items in gpio-line-names
> should also be applied to the "pins" list in the pinmux node.



> Yours,
> Linus Walleij





