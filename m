Return-Path: <linux-gpio+bounces-23948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29993B18185
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5A271C8189E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A0D239E91;
	Fri,  1 Aug 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jm6lQfiz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E61F78E6;
	Fri,  1 Aug 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050637; cv=none; b=sBPPX9YOx0013I3SuV5Ib+JZIq9LlpaNQzYBzfhfbydGMOPUr6Ljl/9ZNGoTdkRP/+/xKBv+qCaC6ck04a0mdQ6duFOfw+FmW2IRoU+0YQskIADLcU3d8tPfnPXiNQ2Pzp/uzoaLtrVVCg1joZO0irzXJFuONMDazxDwNK6Hm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050637; c=relaxed/simple;
	bh=iqWJ70y9buvA8nkZlc67QtTGQA3nl96+0Hhd7pFajYs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Owyr0Md3s0XYzQTWjfReBO+sRNoPfhfbWtud5mXkywttnukIMThL9VTjop4buGiJqbYRqKHXvURayn1sfJDgRVjAUTs0pah6+s0bA3MSRs7LNJJyZWHsk/VJGO1iI0j9FMNLsB827mCqsjM33aydsWbuKtC6sXsT+aH/uVAmSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jm6lQfiz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050633;
	bh=iqWJ70y9buvA8nkZlc67QtTGQA3nl96+0Hhd7pFajYs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jm6lQfizSsqJcUBefLSOsUCpwkP4p4z7b52sE+/dPAVQ1hkpBEC16xy7KV5DWiqld
	 91WqMEiPfOi70qjgsNEYG6hIGMJx+8gamdhu+wgTwND8hTTUtRWzatTaeIz9LYW9nY
	 MvOoAAIDNP8c9kmnqWIWqSHQ+t5e+dQrwsN+tNZ9rBBMKWkaTndoSOsFIlkJZAVRet
	 03yilDAdCIAO8EwEyk09foPNuHQbNlmz8i8yJXROUFKQkVNZkEh1x07oTEBSD4Tr7o
	 XOiTxKoeUA3zSBNHV9FHKRHmTTiTt6umyTO/9AvlWm+POtimM/XEMm6bL7SKS7BxaV
	 Qe7+4T+ujMs2A==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85cF092D4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C88117E0DD7;
	Fri,  1 Aug 2025 14:17:12 +0200 (CEST)
Message-ID: <b8d48519e607698ada70ec1f87ee6e222e14940e.camel@collabora.com>
Subject: Re: [PATCH v6 02/24] dt-bindings: media: i2c: max96717: add myself
 as maintainer
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:17:11 +0200
In-Reply-To: <20250716193111.942217-3-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-3-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Cosmin,

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 1=
 +
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> =C2=A02 files changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..15ab37702a927 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -9,6 +9,7 @@ title: MAX96717 CSI-2 to GMSL2 Serializer
> =C2=A0
> =C2=A0maintainers:
> =C2=A0=C2=A0 - Julien Massot <julien.massot@collabora.com>
> +=C2=A0 - Cosmin Tanislav <cosmin.tanislav@analog.com>
> =C2=A0
> =C2=A0description:
> =C2=A0=C2=A0 The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted =
input
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 24c557ee091d7..e973b0a985815 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14761,6 +14761,7 @@ F:	drivers/media/i2c/max96714.c
> =C2=A0
> =C2=A0MAX96717 GMSL2 SERIALIZER DRIVER
> =C2=A0M:	Julien Massot <julien.massot@collabora.com>
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml

Reviewed-by: Julien Massot <julien.massot@collabora.com>

