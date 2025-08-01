Return-Path: <linux-gpio+bounces-23954-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58668B181D9
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 14:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D3DA566E88
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Aug 2025 12:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0BF24679E;
	Fri,  1 Aug 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ntAzYNM/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE07239E69;
	Fri,  1 Aug 2025 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051673; cv=none; b=EJTyxqKkILIw+hY+smN2N2lUF88zJ4rqU77x3S4QP7UAjJyytzK9MM2rLduQmFuW01/50E11sMzvXqWCcg2wdXxYXBjxOR02zjx41Ay+bN5gP1vG1/TAhXnv9f+O/83IBxiW3G2IqBc9EU4P+2X9RWVERd9Odd6h1bfS26i+p4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051673; c=relaxed/simple;
	bh=gFI2pTssP7nGhWUGJLnw+yPgpk5f3RrGH63eLLAPMrQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SG/8GitZsjQVvBXxY3zNc60zUs+UH3z+ov1+jBwm42KXE7Pu/iQOe7RFTgrXgECR9qR37OsREk3AR1LASw5HfA7yJoE5Cv6JDJL18+sCk7khL3tx9gCFkG7rKQZlF0CoLA+IcvaLAfVoF9548Sn3p09wut7c9KDu6nog6dy//wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ntAzYNM/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754051668;
	bh=gFI2pTssP7nGhWUGJLnw+yPgpk5f3RrGH63eLLAPMrQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ntAzYNM/xoPxg7tl/ecqiifizscOEUvCqWHrGHx2xpq39nBPiyDD6fPoZXq7PEjtx
	 1rDJE08GD7psMW9/F45FXfSVl3/IaL9r/WD48Hhbx82eWT0xUrLXQJjoNZJTnldaym
	 PFV8i6rPg2GuC6AMkqFlnOjKyyJfrlBwcYK/4CtXOWFyRPLk9MpLc14DwU0SUc8+r2
	 Gy/xjTX8sdd8Cfb8orMGmSyVm5EHQ240PCCZqV8H/lRmvT49XDj2AKFBCvN4LKAXrr
	 IhB9rcrOJFXEbBt5pyjBLuWxdjHQz3Yjs8wI3sz6Sg1eA0UAUczuF0jEt3rBBp/CLi
	 qHRNxYJVfat+g==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8F85cF092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A5D0217E0202;
	Fri,  1 Aug 2025 14:34:27 +0200 (CEST)
Message-ID: <ab6fdc6a603bb1d09c4c28b73ac91e67f27bb833.camel@collabora.com>
Subject: Re: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
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
Date: Fri, 01 Aug 2025 14:34:26 +0200
In-Reply-To: <20250716193111.942217-6-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-6-demonsingur@gmail.com>
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
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
>=20
> Document the compatibility.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../devicetree/bindings/media/i2c/maxim,max96717.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 7 ++++++-
> =C2=A01 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index 9afaa8a7a3f52..78ecbab8205a5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -25,12 +25,17 @@ description:
> =C2=A0
> =C2=A0=C2=A0 The GMSL2 serial link operates at a fixed rate of 3Gbps or 6=
Gbps in the
> =C2=A0=C2=A0 forward direction and 187.5Mbps in the reverse direction.
> +
> =C2=A0=C2=A0 MAX96717F only supports a fixed rate of 3Gbps in the forward=
 direction.
> =C2=A0
> +=C2=A0 MAX9295A only supports pixel mode.
> +
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0 oneOf:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: maxim,max96717f
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - maxim,max9295a
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - maxim,max96717f
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - maxim,max96717

Reviewed-by: Julien Massot <julien.massot@collabora.com>

