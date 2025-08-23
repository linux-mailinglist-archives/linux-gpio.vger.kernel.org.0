Return-Path: <linux-gpio+bounces-24845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6BDB328EB
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 15:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 919975C21E6
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Aug 2025 13:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8067E1DE2D7;
	Sat, 23 Aug 2025 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg8R6HZk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D2D4A08;
	Sat, 23 Aug 2025 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755957177; cv=none; b=Wx3oToghrbs1be3wVD9gionAOe2OB0XGoZMadr0QK99MEGq8R8yHoe9HYBRRoqdIu/sh+1K66L5Hyt/kUMeDvTvXFcrGebUqL/pAcHxps04ogLRsUiORzRB33i+4i6gy+5zOFwyrKPLGrouVYOmoJKaTOP2fOiqyooV2zdSsXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755957177; c=relaxed/simple;
	bh=C06GEK1/uDyiXYMUX/h1S/ePv/CZMTMtNR0xXic6P3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4OZ6gRtfS4HKgKQs5qcQD96EBt6so8q/4h7Xlu9hkqWGPtHCXtmiFThcEx41Mxme0yqXI8G8DOq1GBMHdR7eJweTpIBDJgRgoFGFpfaCDhQLDZEcV0D4/wiPMBEFELJdydlKP8FJ9terL6YS1OkUo+Xh1mpo5MZYrAS4i2LYGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hg8R6HZk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E33C4CEE7;
	Sat, 23 Aug 2025 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755957176;
	bh=C06GEK1/uDyiXYMUX/h1S/ePv/CZMTMtNR0xXic6P3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hg8R6HZkoTzbxhVsagr77BzR0rPDzVCLboTFk/RbnZDRP2xWAjFsPJAA92DUGjCpR
	 6NHgELjHA7FxaIPnOqlH6FIPrcRbRZ8Hom1LuT4arqAmSaUs0zcWHDM0a+HfVskWnW
	 dmLQ8rzrSVzCdmphpmnd+L4FMUN87S/WG568vLOZn+Fts3zS5JQTiiHdc0bx/jBMoH
	 XK7HV83lJC9bZKGX1tE5S2s8DQgtNKPliKivLP2mzHV3jIo0XZNBv4dJKGlwLgTQt1
	 3K6hC77q9qis9+yJZPs/kSX1Faz7Wn6bsmzTyU373C9MnAVyjf6ExGdWQU9AzcS26B
	 Lyib/CSaRR/hA==
Date: Sat, 23 Aug 2025 14:52:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, thierry.reding@gmail.com,
	jonathanh@nvidia.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Tegra256 support
Message-ID: <20250823-expanse-arose-72b9e68ab055@spud>
References: <20250823055420.24664-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AbXw2YXLxqu/ZMoC"
Content-Disposition: inline
In-Reply-To: <20250823055420.24664-1-pshete@nvidia.com>


--AbXw2YXLxqu/ZMoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--AbXw2YXLxqu/ZMoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKnHswAKCRB4tDGHoIJi
0nLEAP9JNRdanQK6sZohZ25k3USSvLhI97azZzv6MzlzwG3jHgD8Cij0VkeOiRzS
OPypVDDNCEgOREuY6nf0rzh9+vRj5gg=
=LxdZ
-----END PGP SIGNATURE-----

--AbXw2YXLxqu/ZMoC--

