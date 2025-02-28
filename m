Return-Path: <linux-gpio+bounces-16841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D7DA4A1CB
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 19:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66660175E62
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 18:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292DC27CCD7;
	Fri, 28 Feb 2025 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvpNiSRO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC7127CCD1;
	Fri, 28 Feb 2025 18:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740767971; cv=none; b=ol0qIG2TbYR3vilXigMRsbJmme0ORotEZVh02rdL8pvOwTiDD2ewXwKfBabo7PpPsbrc40Px9EfzdVs3tld3ItgBkCZPDn/aKm6eAABZKp5/vCgBr0JHjeP96Pb1+bE7J+lPJt0FWmPydYpj1IyP+B5IjnzoCF9i8VKHDE+WQ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740767971; c=relaxed/simple;
	bh=zZI9rjd7uFt389AwkuF5r2/izRTAFMFoplFVfmfKAC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcj8b11d2AjEV3nDM4GqZEAIDZ81I2OGZxlpWp/vF8Ki8F7aKRzO9gc2Pbcw4Wa9XldGn/1JluAGQ+suYV7jaigx73Z5+KzCYKi2t0Osa/JhKngbChEAdX7cceR73yfylFNEaLYXqG1skSDweKP/68MVLuTz2W76UOQme3DfsZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvpNiSRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00130C4CED6;
	Fri, 28 Feb 2025 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740767971;
	bh=zZI9rjd7uFt389AwkuF5r2/izRTAFMFoplFVfmfKAC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvpNiSROll1L4yzr7VWtKDBpdU7IF01alBfp/v31DyoYWBZ69PbUkgIbvF9XuuHAi
	 R+ubejEHutBJILnjI+PewG8FaNFZybdFXMQCcGH3QFHkBkAtLtcFsNL2ko9CZWSYTY
	 o64HDFIiyBUHWNPC5sS358ZNYGvHkUr6PL5+conUt2fUXAHE9tuUc/Lv7c77axstu/
	 loVQJ5wxspxtfX8Ije4MpYaA9HfajEynEMeebg+6j6qXHkSCKM70g6W9NXePWgiv2i
	 5Lpvloh1c7r6M+dI0JxiUEeG0UOKLYKrI9vDqoXAy7wSKuojG5GRKkft5mAYmmgqDX
	 hYnGBERcDu2JA==
Date: Fri, 28 Feb 2025 18:39:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: Add pinctrl support for RK3528
Message-ID: <20250228-emote-phonics-4337256dcd01@spud>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <20250228064024.3200000-3-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+XM8zBTCiCN/RDO6"
Content-Disposition: inline
In-Reply-To: <20250228064024.3200000-3-jonas@kwiboo.se>


--+XM8zBTCiCN/RDO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--+XM8zBTCiCN/RDO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8IC3gAKCRB4tDGHoIJi
0oF6AQD04gkxbT5D/tutvF48f6Ph5soAOs7BZjA42GTVsU5hEwD+PXfXiY8H6ff1
M+6/WjcD4+qAvoHAVXSblGC4qoCm5AM=
=Id+X
-----END PGP SIGNATURE-----

--+XM8zBTCiCN/RDO6--

