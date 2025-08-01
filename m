Return-Path: <linux-gpio+bounces-23955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DAAB181E2
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CEF25A0282
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2816248166;
	Fri,  1 Aug 2025 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h2OM8FoK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B23231832;
	Fri,  1 Aug 2025 12:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051733; cv=none; b=MCGfhcebboKi5M4x94FWGQ4gB0ejjxo5uzFKPk0yJPES7gyO21IuRel/YbPszoJ8+5UIiF1NRSW/YMy2TcgcdwNh6Hf2i/NKFt4pWpp8CNsMr88c44zpqHYut6Q7wQAWOzwGw9QnMxt40MLZvbQRChRr7Z25XwkEkt3ZUiPPObc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051733; c=relaxed/simple;
	bh=C8FmHEvnmbzUP4vtQLOTlZM8bMrMzhs7Se6Hmqknmxg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FyCfiPM3s1hpt5qtV0MotwKudeT7ZtyiOwPYZF71y/2bpwhwJGovbrba5rezJsBdZBZVpwwPvxT4mu7P3MHLybrR4IlKvRkQmdYAdXuLWRmp41WaFqDP/N3UrsII2Cqu317bHGVZ4yPZCawhAxSoCiQvj9yUY+c2XQVxVBzsFbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=h2OM8FoK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754051729;
	bh=C8FmHEvnmbzUP4vtQLOTlZM8bMrMzhs7Se6Hmqknmxg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=h2OM8FoKBU/uigF8dHwvR14102JwdYaEyHsLlmXalyFOExzw3bpBEIAuSFEqf8MhJ
	 vlOPl3sUFrPh+a0wv8VALo7NmRalG6TbVpJxZ9Hc2cWDP9EKHGCUpBsHwG0SYpSOMp
	 /mCa0hJ2Lg8iSAZSEhgcGogoohvqKcUfAbLyBVJuN++hM0673cCkhclGkpvmKQZO4i
	 rauQBq2pVMO6KLT9bU8bJSlvWmi2g7mizAbHruUUX1v05KZg0aKRQ3K0V5UWDGX8OC
	 0oEm5yz5RVRijShKZPiMwZQ5devf13niFalwG9kyJK7AxYm3xje5VwT3rW5x8osYFD
	 bZvaHnzLi7Hdg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48D9117E0DD7;
	Fri,  1 Aug 2025 14:35:28 +0200 (CEST)
Message-ID: <5a12d6adc1ffcdfca7ad2d77dc7a080839f5a375.camel@collabora.com>
Subject: Re: [PATCH v6 06/24] dt-bindings: media: i2c: max96717: add support
 for MAX96793
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
Date: Fri, 01 Aug 2025 14:35:27 +0200
In-Reply-To: <20250716193111.942217-7-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-7-demonsingur@gmail.com>
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

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
>=20
> Document this compatibility.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../devicetree/bindings/media/i2c/maxim,max96717.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 78ecbab8205a5..02a44db982852 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -30,6 +30,8 @@ description:
> =C2=A0
> =C2=A0=C2=A0 MAX9295A only supports pixel mode.
> =C2=A0
> +=C2=A0 MAX96793 also supports GMSL3 mode.
> +
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> @@ -39,6 +41,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - maxim,max96717
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - maxim,max96793
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: max=
im,max96717f
> =C2=A0
> =C2=A0=C2=A0 '#gpio-cells':

Reviewed-by: Julien Massot <julien.massot@collabora.com>

