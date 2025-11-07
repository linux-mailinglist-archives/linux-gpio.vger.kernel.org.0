Return-Path: <linux-gpio+bounces-28250-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7C9C41083
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 18:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C1AFF4EF648
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 17:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF178335085;
	Fri,  7 Nov 2025 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5JY+NCA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754D8335064;
	Fri,  7 Nov 2025 17:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762536267; cv=none; b=FiEfchROY902CiEXrtswZJ2Qa++NoO+p9Etyhweo5gdnfC23/eKwtuWl/CryDeqfw8sP/zfFmrIs5iZM+jCxK3tkZplu1ovTO82WnLrIZiwEWGxM5MlOTyHDYH7R6Pwun0HgzPwe3WcIdxqaMk8+3MBPS2YzvNKrwwZIrlUIZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762536267; c=relaxed/simple;
	bh=iKWILkhz+c2dRe8cWkaxtQ3t5wgfEL4WzsX8PLBPxO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+oHOhPEJmgUjESiHrsvv7RotVmd2dmrQORKymuqM/SriXAIArOX6H38P06WhzBtfgB40L26cuVdnwU8XQuNAXtV59YHTxPU3CbgbNJfM8EXWFBgcscUefxQfsfoTxoFBQI67iHAera4yt+yAbWrp+9HzadILHWhaUGjjl+QS7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5JY+NCA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5846AC4CEF5;
	Fri,  7 Nov 2025 17:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762536267;
	bh=iKWILkhz+c2dRe8cWkaxtQ3t5wgfEL4WzsX8PLBPxO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5JY+NCAkOPWxby286M3HkgsYu4G15KonQq63w23Atx6Nw78U9GUMYD2eNoJqd7pu
	 nQbCevLnAE0tJQA1si0J9mUvJ/xVu+FO+XxUDGLcAbFI72ttFugwr44zVrF0WLYUni
	 PEdps4THg6M0PbBcvuRNVo38UFaF0msM6fcA7lCG01TrsEiBZJS/PxUPNWqfXzkSEu
	 UFo7M5gw6+4Rj1gR83bWFSzejpfnNYBQKKJdsN+8ajDFz/6Qo9Pnk/oTw7LfhTKKHY
	 rnlopPPCGRVlE+L20J5X/B82jECdS177dLuMUH+vhOSA8rSq5O2chyC+B2KyNhHbWh
	 XFTTAXnzHCPXw==
Date: Fri, 7 Nov 2025 17:24:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20251107-washstand-motivator-c5e5e5d30dae@spud>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cXGsyKspLHvZR8fa"
Content-Disposition: inline
In-Reply-To: <20251106235713.1794668-5-ansuelsmth@gmail.com>


--cXGsyKspLHvZR8fa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> minor difference on some function group (PCM and LED gpio).
>=20
> To not bloat the EN7581 schema with massive if condition, use a
> dedicated YAML schema for Airoha AN7583.

You went to more effort than I would have here with that conditional!

> +patternProperties:
> +  '-pins$':
> +    type: object
> +
> +    patternProperties:
> +      '^mux(-|$)':
> +        type: object

What's up with this regex? Why does it allow either - or $?

--cXGsyKspLHvZR8fa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4rRQAKCRB4tDGHoIJi
0m+6AP944+gmALtZGR1CkfB4zaT3eHH3sYRIpgbLLZY+u6lbaQD/ZB/xRj4VWjq4
esQCRuxRKBz7tiNcleNfRyxChdSjJA8=
=YhQN
-----END PGP SIGNATURE-----

--cXGsyKspLHvZR8fa--

