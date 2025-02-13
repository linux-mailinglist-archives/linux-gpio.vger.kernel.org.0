Return-Path: <linux-gpio+bounces-15932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80743A34BEC
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8225818857B7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7073621D3FC;
	Thu, 13 Feb 2025 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CDFqEyi6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5F02036FD
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 17:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467803; cv=none; b=FCL9jSTNLPdcCexnYnvTs2jnAm/+KK65VYueb4conAmI+sbM9ijSqcvstV6BfBYX14porbGtilEO0LT8yld4tNujcyQGockJ3G+dqZvqryP9lqkNPafEgitQJ7PzNmoHMndhrPYSv6eF3M0DrThXvT2l1Z3HooPyAoM0bciiulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467803; c=relaxed/simple;
	bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIWZG+wjohK4WAzXUJ3FBBbleYEi5znTnmE9fDDuFcRtdSVnAbFxGCk4yiUNvKTtqLb2pk/BnBZbWxlzR//AjQ36KBC1hp8OC2ouUrUIbMTbsKSDZEDuHX0318P9IwYa6XB3er7q0y3MmFsvMyWC6R+h+8m2nn8NXMf3TFA/++s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CDFqEyi6; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7d451f7c4so175744866b.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739467799; x=1740072599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
        b=CDFqEyi6Bv1HleC6Cy5siHHPDLJcf1a8cOladBbrJPFmDSCj334wcT0TT2E1pub8Rf
         LUG1nNpfJkCazIiYf2tXd0UrjkIps4ePzQRuqgiB7mXMtjC8acdpxZtwIk7nHV86Eoz5
         L00571aJCrVOWwF4ktJPpY1HjgK7i9G6SyM2KCi+FeY1wB2gArrUebDZKNjJj5bkZwP/
         WKPi82jRW/5qvsAZtvh2jPudofvlki+RrzyXNElThwP/gDj6dCwhJ8aRVEe872XEBFou
         bDj2rNyCMXhJjIJ0IkmHlZ3KMcRqAUnCJ4hxaU7zVqoFb42MzSDcoAEx36Oaxs06DoJA
         beWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467799; x=1740072599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCyaallTEZbcZi+JylNVW9wmEI/TBI8/RQryPjwOpa8=;
        b=oWCdZC9RJ3++DwcxM6WrQZDTcr68iPS3j30U3m25rSsZDkA5hOGnu+Xd3XwjiU3a+F
         ELrfdQgXht356gZLdbnfy0zTxGArr0birCiIzCAb/XgYgWq4m4c1Wk2Lsj8OpGveMp1o
         MJfGoZPDSQ+L+XIKVtVdY0WGodY8NBXg8AVfVuPsHa1Che+4buLD+9wIbjTXhrm8GVNW
         QxZ31mm/VrFYF0PXU6GIXeH/ispAXDpB2whZhto2Rhvt1g0EhnsT2v6l4AJIJL5JQNCf
         MkDaeZid6dUqAjFYSt6N60+X+1byFyb82mi1QMq4FYEiMzx9P3TakNhigsWfLhZzyQ1n
         LOeg==
X-Forwarded-Encrypted: i=1; AJvYcCXLzP2CcJxqrxTWL06OcFrIRFoV6OmDyz50VPdbhu7rXCK1Zw5c6CjNQujp+y2XP+EEMvQeG1waQm/l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc3S7wWxAwpWErEbxJlU7KBko9NvqiMMF1xc7otlKjtIbb2+yS
	7jDhjJJINkIomXVSz2k8ZLqL7Bv9FVfwS3KMXQFCxRf/T7zn9RAmH318C8JDM534tJflCq5tl/i
	v6b2+WcxsDLgtn6oOeE7sitkzEkc27B8F5Ctajg==
X-Gm-Gg: ASbGnctXVfs2hJCx7ZEhy3ue202ck5skfRPqiaoY5jNCXMgCEx487pRWV5YGOZM2LT6
	xA9J8n2D0TX91zz4/RSCyWj5Nodb0gM6M6QMc6c2koOzRdEVTYBbQCQkSr62Bbcj4zHc2pZEsmu
	ibR6kCEN+H1ILQja3PRn8RdRM2Wddp
X-Google-Smtp-Source: AGHT+IEHpzGOhWWzUiRDzPOLNzp9YXUJMsGD72YcUx4PUeutR3aym3wR77yLoxsgRGXTk2VSMsiRI1k+qJ+nezQ3KC8=
X-Received: by 2002:a17:907:86a7:b0:ab7:c284:7245 with SMTP id
 a640c23a62f3a-ab7f339c875mr683201066b.18.1739467799148; Thu, 13 Feb 2025
 09:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com> <20250213180733.11999e07@bootlin.com>
In-Reply-To: <20250213180733.11999e07@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 17:29:47 +0000
X-Gm-Features: AWEUYZklu9_MY3YY8SePLjBKtjUgGs0eTYBH-ezMm1VNb2UMos7_-NKxbQAJTns
Message-ID: <CAMEGJJ2FB-wwyOtjjCmPJ-vUDpZaV-8MMXxV13qXnKxYSzt9pw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrea della Porta <andrea.porta@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Herv=C3=A9,

On Thu, 13 Feb 2025 at 17:07, Herve Codina <herve.codina@bootlin.com> wrote=
:
>
> On Thu, 13 Feb 2025 16:30:44 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > Hi Andrew,
> >
> > On Thu, 13 Feb 2025 at 16:27, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > On Thu, Feb 13, 2025 at 05:14:35PM +0100, Herve Codina wrote:
> > > > Hi Phil,
> > > >
> > > > On Thu, 13 Feb 2025 15:18:45 +0000
> > > > Phil Elwell <phil@raspberrypi.com> wrote:
> > > >
> > > > > Hi Andrea,
> > > > >
> > > > > The problem with this approach (loading an overlay from the RP1 P=
CIe
> > > > > driver), and it's one that I have raised with you offline, is tha=
t
> > > > > (unless anyone can prove otherwise) it becomes impossible to crea=
te a
> > > > > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > > > > declare something as simple as a button wired to an RP1 GPIO, or =
fan
> > > > > connected to a PWM output?
> > >
> > > Where is this button or fan? On a pluggable board? Isn't that what
> > > overlays are for, and they are stackable. So when you probe the
> > > pluggable board via its eeprom etc, you find the overlay and load it?
> >
> > In the Raspberry Pi ecosystem it would be the firmware that applies
> > the overlay, and it can't do that if the resources the overlay refers
> > to are not yet present in the dtb.
>
> What do you mean by the 'the resources are not yet present in the dtb' ?

Consider the fan connector on the Pi 5 PCB. It is wired to GPIO 45 on
RP1. In our current Pi 5 dtb there is an instance of pwm-fan whose
"pwms" property links to rp1_pwm node, which declares a PWM block on
RP1. Similarly, the camera and display ports make use of I2C
interfaces on RP1. The camera and display overlays, applied by the
firmware, have references to those interfaces.

If RP1 is not present in the dtb then neither of those scenarios -
board features and overlays applied the firmware - will work because
the necessary nodes and symbols are not present until the kernel has
started running, at which point dtb has been handed over.

> Also what you call the 'firmware' is the bootloader ? the kernel ?
> Can you tell me who is the 'firmware' what is the mecanisme it uses to
> load the overlay.

In the case of the Pi 5, the firmware is an EEPROM image containing
code run by the VPU embedded processor. It can load overlays using the
same mechanisms it uses to load the kernel - SD/EMMC, NVME, USB, TFTP,
etc. The same problem would exist for U-boot. Even though RP1 has a
standard XHCI controller, U-boot wouldn't be able to detect it and
make use of it, say to load a kernel from a USB stick, because it
isn't declared in the DTB.

Phil

