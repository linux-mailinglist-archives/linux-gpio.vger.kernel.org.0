Return-Path: <linux-gpio+bounces-16702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 373B3A47C77
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 12:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3399716AA9C
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 11:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA8422759D;
	Thu, 27 Feb 2025 11:46:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D626FB0;
	Thu, 27 Feb 2025 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740656808; cv=none; b=KQaYJWx7nrqNsyPQyTH2BKgQF2AKcVWYlL6AVrr8qOex62PPbiEEQ2+tewO9k3cu0CGwJOq4l3f44t9AR9WoO4CClqlpl5+kdqavRhn+HAz+D7G3Ip7hbAzyQdmVxpP3SJTIerMZl3z5LIaiOaROj3u2HRl9QKD6GDkR7F8VApc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740656808; c=relaxed/simple;
	bh=fbJlN7jitHcpATJIzTdtSIk8V9emdxHiUWGjROlMWy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R6O03qkWVUZfXJN+Rs9kgSgRY82WgpensZ0+v01HrT7CKPjXVH7Pov5HONJVszKW8ZYWWehtKK0Cgqwv+BvIWP/mMOccmiB9MylsJzmEnrNW2ypVjFbzc8xgREHBgfxttJIZQmAgEuNMhJmRPSnovjLHbNva6wGd+Qf7m2ybGFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F48F15A1;
	Thu, 27 Feb 2025 03:47:02 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F9093F6A8;
	Thu, 27 Feb 2025 03:46:44 -0800 (PST)
Date: Thu, 27 Feb 2025 11:46:42 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland
 <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] pinctrl: sunxi: allow reading mux values from DT
Message-ID: <20250227114642.28752709@donnerap.manchester.arm.com>
In-Reply-To: <12609538.O9o76ZdvQC@jernej-laptop>
References: <20250214003734.14944-1-andre.przywara@arm.com>
	<20250214003734.14944-6-andre.przywara@arm.com>
	<12609538.O9o76ZdvQC@jernej-laptop>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Feb 2025 18:09:09 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne petek, 14. februar 2025 ob 01:37:31 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > So far every Allwinner SoC needs a large table in the kernel code, to
> > describe the mapping between the pinctrl function names ("uart") and
> > the actual pincontroller mux value to be written into the registers.
> > This adds a lot of data into a single image kernel, and also looks
> > somewhat weird, as the DT can easily store the mux value.
> >=20
> > Add some code that allows to avoid that table: the struct that describes
> > the existing pins will be build at *runtime*, based on very basic
> > information provided by the respective SoC's pinctrl driver. This
> > consists of the number of pins per bank, plus information which bank
> > provides IRQ support, along with the mux value to use for that.
> > The code will then iterate over all children of the pincontroller DT
> > node (which describe each pin group), and populate that struct with the
> > mapping between function names and mux values. The only thing that needs
> > adding in the DT is a property with that value, per pin group.
> >=20
> > When this table is built, it will be handed over to the existing sunxi
> > pinctrl driver, which cannot tell a difference between a hardcoded
> > struct and this new one built at runtime. It will take care of
> > registering the pinctrl device with the pinctrl subsystem.
> >=20
> > All a new SoC driver would need to do is to provide two arrays, and then
> > call the sunxi_pinctrl_dt_table_init() function.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> I went through the code and it makes sense.

Many thanks, that's much appreciated!

> I wonder if we really need to
> build whole table instead of having on demand lookups into DT. However,
> for now, this will do. So:

I agree that would make some sense, but is also quite a departure from the
current driver, which we have been using for more than a decade now. And I
guess that would mean that we would need to maintain the two approaches,
for the old SoCs, and the new ones? With that patch here generic changes
can be applied just to the one core driver, dealing with the pinctrl
subsystem.

> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks,
Andre

> Thanks!
>=20
> Best regards,
> Jernej
>=20

