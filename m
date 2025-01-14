Return-Path: <linux-gpio+bounces-14790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E05A10B66
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 16:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C8F216AB98
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 15:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6111ADC88;
	Tue, 14 Jan 2025 15:46:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A6E23245C;
	Tue, 14 Jan 2025 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736869595; cv=none; b=l/G92Sik108rz1vu705iIYYQqIu0XRIrsMfPIeXZVzic8CZChP9h/THUztw4DLuXzf1cdy5nenUPUJIrg5TC3ST7ZF12B1A/Szf9jX3/jYcNefVRqFgpRl7fzfwcQU0zH0vqwVZZZtRBOE8a/vNFNUQVDsa2ZEJvrsY7Gn1BzyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736869595; c=relaxed/simple;
	bh=aa7NdIF/RsOjWlxdLoQ1fr760uFjUhbc7xZg2HditVM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMNMoIiu4U0RNzg3fLgcRXBSoyzkjqGsgoxtK1GSt2VKlICGZ355eRl50x4sfBk20GkOsAUOz2LxiQHP41zANbt3vPOaRodrjypbn6MyFUaq0BSHHhVyasaXiJdzPWObcTga/CSl3zz+hJOZoKGbPurQ3iImhSGVD0uKUPLUttQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C884E11FB;
	Tue, 14 Jan 2025 07:47:01 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B6E3F673;
	Tue, 14 Jan 2025 07:46:28 -0800 (PST)
Date: Tue, 14 Jan 2025 15:46:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for
 a100/a133
Message-ID: <20250114154625.7d82c858@donnerap.manchester.arm.com>
In-Reply-To: <CACRpkdY29s6Cz3zvtksLO8sESwxhkVdmGUipVAqiEtix3E1=Vw@mail.gmail.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
	<20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
	<CACRpkdY29s6Cz3zvtksLO8sESwxhkVdmGUipVAqiEtix3E1=Vw@mail.gmail.com>
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

On Mon, 13 Jan 2025 15:30:24 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Fri, Dec 27, 2024 at 12:09=E2=80=AFPM Parthiban Nallathambi
> <parthiban@linumiz.com> wrote:
>=20
> > lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> > data 3 lines and lvds1 pins are missed, add them.
> >
> > Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com> =20
>=20
> Nobody seems to have any objections about this patch and it seems
> technically correct so I just applied it to the pin control tree.

I think Parthiban had troubles with his email server, so not the whole
series was sent out:
https://lore.kernel.org/linux-sunxi/314b6bbe-613e-41a6-955e-50db6e11ef8e@li=
numiz.com/T/#u
At least that put me off from reviewing it in anger.

I do have a comment on this, will reply in another mail. So can you hold
this patch back still, for now?

Cheers,
Andre

