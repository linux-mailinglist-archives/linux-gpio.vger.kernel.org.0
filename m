Return-Path: <linux-gpio+bounces-27132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E7BDAE4B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 20:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA1C44F6DC3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 18:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D53308F1B;
	Tue, 14 Oct 2025 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSz3Di7b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC0273811;
	Tue, 14 Oct 2025 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760465165; cv=none; b=eWS8EQi7jPa11rtHswUE4uSk+qXUR+V4scJILmTGt1PQ4sFb+IDrziw9IrIcUiOPtpEt99m9AAlC5IFTEbTgne3/ODoONRS/wyI7i14SqWXhvNn/iGyRTwm1592Hpv0OBTwN7ZeDDqlOWYDRIPmZNxjZRfipzmlUZ+QhGDMiolk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760465165; c=relaxed/simple;
	bh=JfNs7dFvmbLt53h9POVLQpvwOzXq+QveaKQx6rXQNw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4QnQogEm3tz9D29iJnrbIJn6BZ6qfEFQ7GLYbgIx3J+LHLny3hrmW+sjdcyiAyrfHndttV2WZdmWDTpFLIKQatWHpUJW6FAMy/dIjoaJWpyP1RGKKQb/9LkHR6SUgnBN64EI43sS2q3GqqeXSEMbQFGGicvVwg27fbEbKlG5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSz3Di7b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCFFC4CEE7;
	Tue, 14 Oct 2025 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760465163;
	bh=JfNs7dFvmbLt53h9POVLQpvwOzXq+QveaKQx6rXQNw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSz3Di7btbUQi85if9iBM+pXDgRpQCPe5IPR1EH1XLn9FLC4I/xBB8bZPvvlBU4BV
	 mZ8811SvF95JAtHe/62tJCBxFIVM+5oDa7aXK74sgg9+1SyqcjJTMezUuqnEIlfH6o
	 dNMM+nDzu/i9dF4oKj/YF+tJ6q3FRPDmMCTZ1qM5dhD0M2lNgwG4VbWA2xnng1+SDh
	 eU9Iz4jvrZCPaw1dcKQ6FmAJvytohB24hnLItwHnCASx2feiXgjpmYQglbUrSCjzc3
	 2/Zpb3i9MsczskqAk7ppoRMcJKP1g8YdNN9pR9OiBBZrRDV3azr5VgPk8MbVXgMNN7
	 vPx5mB2cYHvDQ==
Date: Tue, 14 Oct 2025 19:05:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 08/10] dt-bindings: pinctrl: stm32: Use properties
 from pincfg-node.yaml
Message-ID: <20251014-privatize-unnerving-bb26a0626276@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-9-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wigSmc8rrZJKQMu+"
Content-Disposition: inline
In-Reply-To: <20251014140451.1009969-9-antonio.borneo@foss.st.com>


--wigSmc8rrZJKQMu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--wigSmc8rrZJKQMu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6RBgAKCRB4tDGHoIJi
0hVaAQDs2t7Df4kI4kyx6xytw0ZMIEL3EaLx1elCU0OeibxfpwD/UIGUJYpE++Jz
HbbMxb2Nhx7TeJ4NiLJbGkxps5OpZAA=
=vh6W
-----END PGP SIGNATURE-----

--wigSmc8rrZJKQMu+--

