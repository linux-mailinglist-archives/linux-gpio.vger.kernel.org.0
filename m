Return-Path: <linux-gpio+bounces-26303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AADCAB81A1A
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 21:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 665303AADA6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Sep 2025 19:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2024A3002DB;
	Wed, 17 Sep 2025 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aG7uCXPN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C880D72614;
	Wed, 17 Sep 2025 19:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758137380; cv=none; b=Iz3K0s/DDjDDyZH31Lm8UN95RNAIJZOlQKFBmdJhvQ+COgSBSKPLDeGq2sSom5WCrjpO80r6Tl1Wg+bfhMHiWopKErRdx8nU9tz5ua5H86uf3PTit+/NAvqxJQ2YztDXTiw7neTZKuU6NpsCAky7x+By3f49nt3TAPEWtMObjPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758137380; c=relaxed/simple;
	bh=v12o5iwyw41C8ihek+ckWbnVdlFN2k5R+5rFNQJK590=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvyhuEq8SKqDguUZH7UbZ2FNouJvg9jGvtYEWU5ss2vyPAL8+KQessmgFahM+k4QsJgi8bYL85awwJpaZQfVugHoFhS3K4RdYqBNpILDzNvneIXb4N/oQ7t3egce/JP0zDCl8PzvnY5X757+PYAsk1oc8IOtbW/RwU6A6aCUv5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aG7uCXPN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFA2C4CEF7;
	Wed, 17 Sep 2025 19:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758137380;
	bh=v12o5iwyw41C8ihek+ckWbnVdlFN2k5R+5rFNQJK590=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aG7uCXPN6cuxbuyjgnbi4iOfnjVxeRb015U5DHqy+klOPlPT77WuL0G5T0CemjsI8
	 4/zk7UKc6bRVkrUfmd88q5fKo0Ol1hPBYdEIkzghhZXH1pMaZO1jvtpG7T/dG0tC3j
	 VMDC3grM9mnvL3Ovw7gStTetMOj3Iewq2T3QTFq6N0/NBszyuM0R+ACXpKM83YCzG4
	 ExAfGwPELxOd8OQIRo33XvK0fCK0Cy/6Co0XvU0BiaLT+R50boLjurLAEE1cVHU644
	 chcK2+hUTmklopfOYLUuFk4q0GFupnY4SczRV6ctW/nLSRYQyFQepfShVLQjVZgMfe
	 4Lzz0fHhROObQ==
Date: Wed, 17 Sep 2025 20:29:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, robh@kernel.org, conor+dt@kernel.org,
	tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ksk4725@coasia.com, pjsin865@coasia.com, gwk1013@coasia.com,
	bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com,
	lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com,
	smn1196@coasia.com, shradha.t@samsung.com, swathi.ks@samsung.com,
	kenkim@coasia.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: samsung: Add compatible for
 ARTPEC-9 SoC
Message-ID: <20250917-putdown-unbent-5f606733ab13@spud>
References: <20250917070004.87872-1-ravi.patel@samsung.com>
 <CGME20250917070041epcas5p4729ea496eee0c1ec2f4c234a63f71f7d@epcas5p4.samsung.com>
 <20250917070004.87872-2-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rU/3WvnOMBYZh5rC"
Content-Disposition: inline
In-Reply-To: <20250917070004.87872-2-ravi.patel@samsung.com>


--rU/3WvnOMBYZh5rC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--rU/3WvnOMBYZh5rC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsMHQAKCRB4tDGHoIJi
0ofPAP0Vk4Yt1eXjrrWtDfuzaIZWx4hwMFwWg1joQyhYukSJzQEA6x2UXKkHQ1bq
Gs0eZdMZWs1ZFN8FyjqQjoqMWzRgugk=
=T4JH
-----END PGP SIGNATURE-----

--rU/3WvnOMBYZh5rC--

