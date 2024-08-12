Return-Path: <linux-gpio+bounces-8722-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB5994F458
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 18:29:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F64EB248B0
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 16:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1161186E38;
	Mon, 12 Aug 2024 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kauK30pm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0407183CD4
	for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723480147; cv=none; b=m+6uqAAuS/p6rajgvZWE6c+589kggYxGvWJa4T2x+K/auEktZAKxRa3mDiXZh4pzUE0yzZxrQ4lZUP/RnqUo4AtZZ+rOrsQoLdJNiqZbK01ZOomzLtow0A0WMcQeGXz0UFFXH4hGERHPLPPXsu6fss9clJMSNNPxAem7jIv9uqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723480147; c=relaxed/simple;
	bh=zrNP2KYv0WqF3LdXLEDH1XuuWMpQN51bXPN7l9Gc3XM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLYjH3Yz7pDrqLU/U6pe5HH0+6guVCco6mYR2u6IhaVRjTDAJnrKGx9pqpNkJ+K6vcUx4cIrhMXlvYvryY2E91bR2rwZExIg2tqBkM8WxaaSLPt9aLO5z+8ez+Fr/UFj4sqrYoKOCe/yRmUxL6snAvzbMjNUuUUXrgXV8G4Se3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kauK30pm; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0e7b421c88so4561465276.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2024 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1723480144; x=1724084944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uMV3FW63GcPYNvV09/bzRTM0A7rqdaktyTCGiSEZP+g=;
        b=kauK30pmBisWFXt2irM/T1Y4Om50XazFQO0qcG5ToSO0rDBoakMpatP/Fl6+2xMFjg
         Eo/eKjzyLtep35cOTNZi0i0w0yYQs9KRuC4EsYMMZyWGzSMC5lxHbZ0H1kn/FkJEZo/i
         3EH7rXyXw0hLU7Ag4gJnIzENVPpvCdTWH9YqwvMhCxKkokoxpzdcaQ7VbV3VQkacahsc
         DhZ756ExUNps6a9Hasg8/aqQNuaoJYzQx3nDiaOQXR8aR7EWey+UzUnx8FZSUsKInJjL
         m8DedwSDlY1DdIOrnfajMWjAzfS6Osv9zNHORrF5UT901gH3VHCO0B6erGWl4D5BDfnv
         wf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723480144; x=1724084944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uMV3FW63GcPYNvV09/bzRTM0A7rqdaktyTCGiSEZP+g=;
        b=cOuovAlvvUm0vESfwNuYkFW6BVRJIanavwebXfEq2OQE+8i4Ej9SYNMawWn1i+ztX8
         T9zBvFPay4fV935V0Pstr9L93m5QggJknLdPjaWwiY0GOah15age6O3hZ5Vg+vobYw8J
         kNyNLWtKC3aR/izC3VYsSyv5AiAwOpzRluMd7F8+rAVWtytqpFAixbut6wfn7/a/1Xqd
         +eLU9AZcKuuWCLbNLvn/c7t1d4hW9VCs/AFoJLTuf0pzqJe0Zg9wwmd3GgDxHhbMf+Qq
         T0Rcz43+PC1aSg9EJD4SVTy8vzwVsBtADdI3xqda1Q7BNGIia1Hl0FVZ14d2I2gPDQNt
         DgPA==
X-Forwarded-Encrypted: i=1; AJvYcCVQna6pk6ZI6SjGpyqHkkUdU4CfeRICB5uwd4vUnETmYE9aEj/5pdLBJVFfAHzcDBuF3WDlCyDaE9/THJh3WjuLP8bLQwRDZjWAuQ==
X-Gm-Message-State: AOJu0YxTor45fSbEDtBveMZfGH9hBC/LAs3hvqjJA1cZHfeYPP7DscnR
	cURqkE+DSbYG9V6A52KD8n9QoGzcX0DDWXrd5R6PbrBR/EaoRQ1tDlyV/CjkNO4aNOdDnkGRtsy
	HCOazkZHW5fg0ed92VgypMe1VQ7y/edR3/vJgmQ==
X-Google-Smtp-Source: AGHT+IGj7d7yd0eiw2JYaUqx2Ht7IqYG3B/CS0se5ZXlqWOTSnVZOd4JD9GKabzcEs76SbyuZwRil8Cin7Nw6RtBZtQ=
X-Received: by 2002:a05:6902:c02:b0:e0b:2fcc:9891 with SMTP id
 3f1490d57ef6-e113d2902b2mr918707276.44.1723480143787; Mon, 12 Aug 2024
 09:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731062814.215833-1-iivanov@suse.de> <20240731062814.215833-2-iivanov@suse.de>
 <200d54a3-bedf-4bd3-bb7f-0d834c43ea78@gmx.net>
In-Reply-To: <200d54a3-bedf-4bd3-bb7f-0d834c43ea78@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 12 Aug 2024 17:28:47 +0100
Message-ID: <CAPY8ntB9Zf3sJejXuzrw6tUipfv71w4sDc26fg8cbMtRjrcPHg@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
To: Stefan Wahren <wahrenst@gmx.net>
Cc: "Ivan T. Ivanov" <iivanov@suse.de>, kernel-list@raspberrypi.com, 
	florian.fainelli@broadcom.com, andrea.porta@suse.com, conor+dt@kernel.org, 
	krzk+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Stefan

Sorry for the delay in responding - I was on holiday last week.

On Fri, 2 Aug 2024 at 19:10, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi,
>
> [add official Raspberry Pi kernel developer list]
>
> Am 31.07.24 um 08:28 schrieb Ivan T. Ivanov:
> > It looks like they are few revisions of this chip which varies
> > by number of pins. Perhaps not all of them are available on the
> > market. Perhaps some of them where early engineering samples,
> > I don't know. I decided to keep all of them just in case.
> The BCM2711 had also some revisions and we avoided successfully multiple
> versions of the RPi 4B DTS. So it would be nice if someone can explain
> if C0 & D0 are available in the market? Otherwise we may end up with
> multiple versions of the RPi 5 DTS.

AFAIK A0 and B0 silicon were never commercialised.
C0 is the current revision in use with Pi5.
D0 will be in devices imminently. CM5 will use it from launch, but
subsequently standard Pi5s will do as well.

In addition to putting in the few fixes that were desired, some
registers and DMA dreqs got shuffled around, hence some drivers will
need additional compatible strings (vc4 certainly does) and other
minor DT tweaks.

Checking our downstream dt files, we have bcm2712d0-rpi-5-b.dts[1]
that includes and patches the original (C0) bcm2712-rpi-5-b.dts[2].
The cleaner option would be to have a common bcm2712-rpi-5-b.dts(i)
and separate bcm2712c0-rpi-5-b.dts bcm2712d0-rpi-5-b.dts which include
the base and add the relevant customisations. Later a
bcm2712d0-rpi-cm5.dts DT should be able to include that same base file
as well.

I'm not quite sure why the GPIO names are redefined in our d0 file -
other than the unused ones using "-" instead of "", they appear
identical.

> I'm missing an explanation in the commit message, what's the difference
> between brcm,bcm2712-pinctrl and brcm,bcm2712-aon-pinctrl?

Two separate instantiations of the same IP block, but they differ in
the number of pins that are associated and the pinmux functions for
each of those pins. AFAIK there is no way from DT to specify those
pinmux function names, so otherwise
/sys/kernel/debug/pinctrl/<node>/pins will give the wrong function
mappings.

> According to the driver brcm,bcm2712-pinctrl is the same as
> brcm,bcm2712c0-pinctrl. So the former is more a fallback?

I'd need to check with Phil (who's on holiday this week) or Dom, but I
believe you are correct that "brcm,bcm2712-pinctrl" is a fallback.
Most likely due to our early DT files not having the c0 designation.
Obviously for mainline that is irrelevant, so dropping the
non-specific compatibles is fine.

I hope that makes some more sense.

  Dave

[1] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm64/boot/dts/broadcom/bcm2712d0-rpi-5-b.dts
[2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts

> Thanks
> >
> > Cc: Andrea della Porta <andrea.porta@suse.com>
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > ---
> >   .../pinctrl/brcm,brcmstb-pinctrl.yaml         | 73 +++++++++++++++++++
> >   1 file changed, 73 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..c5afdb49d784
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom STB family pin controller
> > +
> > +maintainers:
> > +  - Ivan T. Ivanov <iivanov@suse.de>
> > +
> > +description:
> > +  Broadcom's STB family memory-mapped pin controller.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - brcm,bcm2712-pinctrl
> > +      - brcm,bcm2712-aon-pinctrl
> > +      - brcm,bcm2712c0-pinctrl
> > +      - brcm,bcm2712c0-aon-pinctrl
> > +      - brcm,bcm2712d0-pinctrl
> > +      - brcm,bcm2712d0-aon-pinctrl
> > +
> >
>

