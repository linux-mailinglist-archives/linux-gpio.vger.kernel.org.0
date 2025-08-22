Return-Path: <linux-gpio+bounces-24837-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74875B32310
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 21:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE776280B6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 19:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1682D4B5E;
	Fri, 22 Aug 2025 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYJUlVdB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7869B2D3A93;
	Fri, 22 Aug 2025 19:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755891688; cv=none; b=a6Cnt5Bo0OxT/vmlB1thySbkrrGauTNpJ4k+F2ycTcibG/Ea7q09+3RUv/O063VFdT+eM1hWmT8OqQgSqQ6P9v3n5Vu/Ap2/Jv2KaUeCVobP75yq1kLz7pXR4T3xmlFMMitk6f3HJwENhpjB8ZHubaRqhqmwXJVNWnzCdhtVxII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755891688; c=relaxed/simple;
	bh=eVhTL55Cm/6jgWL3xyRWgpeQ5O3aDDaXksPPEMZoazg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2tYxcBMVqMPzYl6aTYt5vfPl1muI9NpmvtBAmDIakOrC6d6T3+D3RzESw3vFx+u7iajS49XpkT0u8feBnTVScWL6S8cG34xJZDTpVrpj1tGTlowxDGgL3GEZJRmDSbNnitQ4KjTo9AVAh/aloeh3NAdCby9FzkliZEjCv3shjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYJUlVdB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3053C4CEED;
	Fri, 22 Aug 2025 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891688;
	bh=eVhTL55Cm/6jgWL3xyRWgpeQ5O3aDDaXksPPEMZoazg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYJUlVdBFQggbK3gCHZQDTQ8fxT/62u5/b0gxUqtbAQPqmsBxzbR6pok+E9S6CEq5
	 j9e/wZ3BNvumE1jzvZp/903YJMNqvdRUvunfyEiKM8rE92d6RJuRwdGHFAu0zSog0f
	 uq6ZMyWU1CgNbCjd75iA4gO6JW3XIbyAMSMVcwlw859GwPHsbDKY9E/qh8Gv9kkK7G
	 vEs2SRklIfM9kyITlDd5jAqMHxhRjd6uRoqh3JOdDVBzDnjvxV54KjwE0Mpr/qlv6H
	 rIy1e0plUs1zMEs1d844I/eGZYTlHEDaWU/QQaL3LE1MFV/9jxPrQ9/ocw9SLSN7yR
	 yjGz2ty31vNiQ==
Date: Fri, 22 Aug 2025 14:41:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: linus.walleij@linaro.org, mturquette@baylibre.com,
	cw00.choi@samsung.com, gwk1013@coasia.com, krzk@kernel.org,
	linux-arm-kernel@axis.com, kenkim@coasia.com, inbaraj.e@samsung.com,
	ksk4725@coasia.com, tomasz.figa@gmail.com, shradha.t@samsung.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, pankaj.dubey@samsung.com, arnd@arndb.de,
	dj76.yang@samsung.com, linux-samsung-soc@vger.kernel.org,
	conor+dt@kernel.org, jesper.nilsson@axis.com,
	mingyoungbo@coasia.com, hgkim05@coasia.com, smn1196@coasia.com,
	will@kernel.org, swathi.ks@samsung.com, krzk+dt@kernel.org,
	soc@lists.linux.dev, catalin.marinas@arm.com, pjsin865@coasia.com,
	s.nawrocki@samsung.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, hrishikesh.d@samsung.com,
	alim.akhtar@samsung.com, sboyd@kernel.org, hypmean.kim@samsung.com
Subject: Re: [PATCH v2 07/10] dt-bindings: arm: axis: Add ARTPEC-8 grizzly
 board
Message-ID: <175589168671.193824.7456670123807424853.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4@epcas5p2.samsung.com>
 <20250821123310.94089-8-ravi.patel@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-8-ravi.patel@samsung.com>


On Thu, 21 Aug 2025 18:02:51 +0530, Ravi Patel wrote:
> From: SungMin Park <smn1196@coasia.com>
> 
> Document the Axis ARTPEC-8 SoC binding and the grizzly board
> which uses ARTPEC-8 SoC.
> 
> Signed-off-by: SungMin Park <smn1196@coasia.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/axis.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


