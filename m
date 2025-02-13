Return-Path: <linux-gpio+bounces-15927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC3A34A56
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D610617841E
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 16:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7020266B50;
	Thu, 13 Feb 2025 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ZjaV1ZNq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED92241698
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739464058; cv=none; b=E4XRUXM6D/8X70SmedQ+FwG9VxVuu5xgo1oNBRvVMsElxUovZ6BTULfuZgkmfxMyFRxuBQnMutZIS8QZ4Mw/c+/lO/DO7xJf6uuRe9Bwrk8e7Mkwmy+dzLFLf+PMLVKziZ/YoN1345tgaFliJR/Hu7rXDEM0rRei25J14gzoF+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739464058; c=relaxed/simple;
	bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQ+werjoM6U5cnjPcZVHLavicXtEn/Vqu1HGRvR2pEZAFoqRkQP7cTgHlm8kdL9emam9/2zwUNgG6p4p3HrKbxZhDSXG3B7cVKq2BG4q6Fx4Gs/B7gPphBrv86TOhjCmszJnULLUfMihDaD7CUGIWpfhClntpZUk4wOaoCKZwh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ZjaV1ZNq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso187944366b.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 08:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739464055; x=1740068855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
        b=ZjaV1ZNqmYvjW/J9hX4ZCLBp9Fb02u997YQh6qdKHSMif8rYRUrNHUgtB8BBQ2QLCR
         2fioYgRdEguSTwvpDMZpf0uecwykrIo89KN3KO+AyzeRBCmOuvl5eUQ/FdUQnT4FMnSA
         utyTJjZE6pSqnHtYo+a3NdRoOgrY0s9Kbvpe7QLMctxpEfxHW9IxscuVn3ZZSXntQcaf
         I86ETNlHeSSwXLw0dYbfD7MAnMOlNnz3gTLeILHthjrJLNZhzjqXtEHd74NMlGcJ859F
         9oeTD526IYnxt7OOM0CZsYyuAmBzHT7HtUvEN1lPYHZEKXPV+4hwVq+zPb31QLkUPubg
         oZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739464055; x=1740068855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aixNwfpNLYxCXcI5ccF3I2q6OoCStOmv5r5FC5BMOR4=;
        b=hKZSfI09zY1ppyVI6f8DdRY0bKWwD9YDsjiYSkxVhq9pY/bGV8gKTM5HzbcCYLCytC
         BqzqdvN1eHKTB9M7cK1SGtjdBpteX9qyC7hU8tFpprTVEvJWVNlPEeOipap1qnGsePAm
         d50hbDA1fTh8/hyeV1a1FYwI6XTUrYQ/pJnjU8S93C/Mti6MAv6JBzWe1RgZo0undEgm
         TndE0mdBBFUaKg5u3hEr1QTMuja3tRYfVpnlmfCBs0qB2X/mLUwd6V4ZX+HRB3G1qZ0U
         f+yS3dsgc+10WVXz+5CQvvjGLZqq/+OZt1OEgg3elZq7ml02MVG1cDSPjiIlarzC/WW3
         mH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZC2zjMEiWkyycKKStZfe9j079g+qOZ7HcP2zDuEUexyukvru8l9wKpvG1AZc/I1Bbeo5RGgNFrw85@vger.kernel.org
X-Gm-Message-State: AOJu0YwtSbwwUp2Xd5zlCQ0VLhD2JXN9+CNNvlLveDHXoUPSMquggByX
	G5f97eL4Z/twoOHsJXTu9LZ0A2xKAWH0FVANomjmtZIulgu5g5tA/qzddi0H6RvdVuMgYWeOhWc
	5n6ta73ZHnpkWhguKJL5MK6z4APxPheILBFl9Wg==
X-Gm-Gg: ASbGncuJzbEmX0o9Vl7bVoN2jld0iGBn6QW0NfowNse93ijTgqcJfBoQICD1LCP6HnN
	lOuvAGlDy/cYnDUA8dv2F+fmQ7/DogKSNKaglfAA28D00ECfH/Ctv+Ae7CI128NBtdl4f7CCcL2
	b7oIQjo9GIAQqHk27dhLxdmaF/5TlU
X-Google-Smtp-Source: AGHT+IGh1IZYUOs4P7JSIz9yKatxKcYCpkTha4+Vt1XXHAvpLvRRPqSwJWHf/GTRbZo8Nm9ZR0QzY9EHYI9QcB0Oy7A=
X-Received: by 2002:a17:906:7956:b0:ab7:f221:f7b4 with SMTP id
 a640c23a62f3a-ab7f34738c0mr776743366b.43.1739464054629; Thu, 13 Feb 2025
 08:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com>
In-Reply-To: <20250213171435.1c2ce376@bootlin.com>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 16:27:23 +0000
X-Gm-Features: AWEUYZl0UFEHY2kV2h1h_cYG6cbTpw7bZVsKquFMakyrJEadnvQ1Edus79HpRwQ
Message-ID: <CAMEGJJ1++aeE7WWLVVesbujME+r2WicEkK+CQgigRRp2grYf=A@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, andrew@lunn.ch, Arnd Bergmann <arnd@arndb.de>, 
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

Hi Herv=C3=A9,

On Thu, 13 Feb 2025 at 16:14, Herve Codina <herve.codina@bootlin.com> wrote=
:
>
> Hi Phil,
>
> On Thu, 13 Feb 2025 15:18:45 +0000
> Phil Elwell <phil@raspberrypi.com> wrote:
>
> > Hi Andrea,
> >
> > The problem with this approach (loading an overlay from the RP1 PCIe
> > driver), and it's one that I have raised with you offline, is that
> > (unless anyone can prove otherwise) it becomes impossible to create a
> > Pi 5 DTS file which makes use of the RP1's resources. How do you
> > declare something as simple as a button wired to an RP1 GPIO, or fan
> > connected to a PWM output?
>
> The driver could be improved in a second step.
> For instance, it could load the dtbo from user-space using request_firmar=
e()
> instead of loading the embedded dtbo.
>
> >
> > If this is the preferred route to upstream adoption, I would prefer it
> > if rp1.dtso could be split in two - an rp1.dtsi similar to what we
> > have downstream, and an rp1.dtso that #includes it. In this way we can
> > keep the patching and duplication to a minimum.
>
> Indeed, having a rp1.dtsi avoid duplication but how the rp1.dtso in
> the the kernel sources could include user customization (button, fan, ...=
)
> without being modified ?
> At least we have to '#include <my_rp1_customizations.dtsi>'.
>
> Requesting the dtbo from user-space allows to let the user to create
> its own dtso without the need to modify the one in kernel sources.
>
> Does it make sense ?

I think I understand what you are saying, but at this point the RP1
overlay would no longer be an RP1 overlay - it would be an
RP1-and-everything-connected-to-it overlay, which is inherently
board-specific. Which user-space process do you think would be
responsible for loading this alternative overlay, choosing carefully
based on the platform it is running on? Doesn't that place quite a
burden on all the OS maintainers who up to now have just needed a
kernel and a bunch of dtb files?

If it is considered essential that the upstream Pi 5 dts file does not
include RP1 and its children, then Raspberry Pi are going to have to
walk a different path until we've seen how that can work. By splitting
rp1.dtso as I suggested, and perhaps providing an alternative helper
function that only applies the built-in overlay if the device node
doesn't already exist, we get to stay as close to upstream as
possible.

Phil

