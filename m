Return-Path: <linux-gpio+bounces-8736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEB950BB6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 19:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37355282B6B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 17:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788D01A38D2;
	Tue, 13 Aug 2024 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyRGIFj4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E51222F11;
	Tue, 13 Aug 2024 17:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571553; cv=none; b=hJNhqkbspyQ9o214xAhcQE7cveW1RC3dqnc+u6wKLEv9huwhpcS6c731dB9YEj2EbyzBBk8/RVNluVMMUAl/++OIsI7CGf94v8nFe5lt6FDP9PJ+OoCNnOCKAMcgK34K2co21kYMG0hXmwkxGtKBdcYyCDtBjR02zWi/l0LQ07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571553; c=relaxed/simple;
	bh=TS1ttIJoKDFA1TekRHea8ay71upSI1/ZEO0fd9+DuSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJ97JkfMV6P+py4pmYId/Z52kCJZO+gX6Og6GRA7FBdxkZ6rvceVGecFmMdzCD27c0cG5vXLUAbM030cSMUiyjk3mqG1xlYW7dAgLclMqDJI3L+L7GPQVw8xVHcW5ppVwlM0T1u02PaXsmPYQbTYZIUwhnr8yfDByel2Teh243k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyRGIFj4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63018C32782;
	Tue, 13 Aug 2024 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723571552;
	bh=TS1ttIJoKDFA1TekRHea8ay71upSI1/ZEO0fd9+DuSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyRGIFj43aFqEsT+8E2AErA49YwPwgrFTrZnnYheFygdCa/8UvTk57LbhDCLbZfkk
	 Ys/p47X9JgLNDkI2dj+kigRVkZ7L197Xts2Qa4gy4ZThhtPYVSzUeVG4SZ+0Zab9eO
	 OJRE/Wqk3RraoRrbbj42EkCVw5kucJHPQIAKXRcqhhikykfYGbmgtuzI8V0rPS333A
	 Kq8BAOxVT4arwAkUn6+WBdLCOnFKYNHMKBhUOSgHa07F4QWNMDijbUau60/8Vn6ou0
	 rym/soy0KM1O14fjZUk9zWAClgh1ZmWw/C4sfdaUbQUZDzJf8lMXijRjt4dO2rOKOv
	 8Zra3CPWuiTKg==
Date: Tue, 13 Aug 2024 11:52:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 07/10] dt-bindings: soc: samsung: exynos-pmu: Add
 exynos8895 compatible
Message-ID: <172357155041.1415164.12960038600037008915.robh@kernel.org>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807090858.356366-8-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807090858.356366-8-ivo.ivanov.ivanov1@gmail.com>


On Wed, 07 Aug 2024 12:08:55 +0300, Ivaylo Ivanov wrote:
> Add exynos8895-pmu compatible to the bindings documentation.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


