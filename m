Return-Path: <linux-gpio+bounces-28009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CEEC3055F
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 10:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 86C8F4E942E
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 09:46:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC4631327F;
	Tue,  4 Nov 2025 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJE/Lf2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8B2286D4E;
	Tue,  4 Nov 2025 09:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249601; cv=none; b=ZCzcJ9Azovmnz928nIZ9WP/BgBVK1tAGyn4ukmYC1KqdJJMdrx+DM0K0lL3/CBgnr3H/fUVxLbLrXubmZkMzDnPmMAK4i3aWE4AS2Y4fb5d+2DYYiCpGzmX17OB/vZ+mQ4vXpL8dpAsbnWK9qn9DsEypEzAVGVArkuJoouAnveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249601; c=relaxed/simple;
	bh=B4ED1wtbwLhjzL1U0d7PpG/habL9q4jA4agx5VuZN+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdSq8VKavBG3SVv456RwcVWc2dBOHBX669H+1Z/ateUSoLtJQ6HoNaGlxZY7iQeziju2BsPmZAZG2bedJd8sWyvJJpE+YImOoFzpXok6O6PTH3rIglVWaqjEHZNENs3mMZN7kD42mvPkHvymUsqDJ9lfMmOutE3wreSTYs2cDD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJE/Lf2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CC4C4CEF7;
	Tue,  4 Nov 2025 09:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762249601;
	bh=B4ED1wtbwLhjzL1U0d7PpG/habL9q4jA4agx5VuZN+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJE/Lf2fHgGyU8+d3u4OcGQrrBQ7eQpEZ2BpyR36PJ16PrqhzDdM6qyfL0mECrBOM
	 8PzF2+9aeRN5DcD2DBmsEtbj2Orrh8xFyAS3nFn9eSLyXaONII/H4a2pxsQT8Z9v7Y
	 HevREWHrubiN1aiVLPGcM7HYljCG2PzHQO9zNf8BQQ6GUDqPgLW1yoZmFLdJtNEfGU
	 ekp6gKX+e3CBsCLII4ISimfTDlFlqu3FdGoBs6fUcJtIxLAAlduomuBh+eO1DOrjeT
	 lIfet0CFg7H5Ornu9G3JNG1mZqq9HM8GEJEMhoARKSqjXGwf3UAP9KxQwreULUmTWO
	 l+/KpEvn6Z/4Q==
Date: Tue, 4 Nov 2025 10:46:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 07/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
Message-ID: <20251104-impetuous-nuthatch-of-chivalry-abffbd@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>

On Mon, Nov 03, 2025 at 07:14:46PM +0000, Andr=C3=A9 Draszik wrote:
> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> as a sub-PMIC.

Subject: add S2MPG11 secondary PMIC

>=20
> The interface for both is the ACPM firmware protocol, so update the
> example here to describe the connection for both.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++=
++++--
>  1 file changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..c25e155926e5f44bd74f195cd=
bff3672c7499f8e 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -45,6 +45,15 @@ properties:
>        compatible:
>          const: samsung,s2mpg10-pmic
> =20
> +  pmic2:

pmic-2

> +    description: Child node describing the sub PMIC.
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: samsung,s2mpg11-pmic

Best regards,
Krzysztof


