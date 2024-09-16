Return-Path: <linux-gpio+bounces-10188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF9297A3D0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 16:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 247D4B2A088
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 14:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B35D15A85B;
	Mon, 16 Sep 2024 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nS56jnmK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6330158DC0;
	Mon, 16 Sep 2024 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726495679; cv=none; b=kB6jCmECR54ibs6A7lD36KxRWJq3suZGU0k2j2GnL4+7chIewL1KdjVrl/QQmxBt3x+XfHUtUxDZT0oGLxshaeXTH34flj0cfdaqN4wEx8870Y+xJq7VGkmTNOp2QrcAGdEhOO49kYUjikZZctXoiv1Z5/tLY1SiGder5F6jcLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726495679; c=relaxed/simple;
	bh=t9rD44OwdQ5SgbvrR/jf7lHpawZN+tj6hIDAlt9+QvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha5H6LdoyWj8SIsE/mHVtbTmgkiDz0vKqRXliP7fEclBp61okdD2wnW09EZuy4372An1cNvBowFshuRlxDYw6gtJYbSGt1LL7YUxIpFeUgRFugBCgOt8rR49LErcFOCYY28xJTI0JRE6Bf6H1r/4bjOHLNQ6JexjMFL+ifhmGhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nS56jnmK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C677C4CEC5;
	Mon, 16 Sep 2024 14:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726495679;
	bh=t9rD44OwdQ5SgbvrR/jf7lHpawZN+tj6hIDAlt9+QvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nS56jnmKdDeZDTu46bPu2+D3SnM2tjoEPUAc8SgveUZ1A8L9UdCZy9Hh/XWhP9Ch+
	 Di9SMWC8VYit0gJ+k5sVdbuGbWBCeLKJs7eBedRYxoT3LzCgjSdqC39J8wYeSzubJO
	 UjzHGUvlLYRILJhOF4Tux4xJMdOoUlDp7ugHR7YZc2ch2BecJyC5D0ZTZ5D9tHaD5L
	 1aGK5AMs5ZCJ4e7JGkHoOnxuNgA7+6Qmh8EeCvSP3TiaX0wpBrbSEQsHLwhYNcOcIM
	 rKZS3xINc8RPLGezn5o+tzW0StZS44bssvzIn3Vh018hfh/Mbdf8D6KaFU14yi/KCJ
	 n5OuJlhu/+hUw==
Date: Mon, 16 Sep 2024 16:07:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for Exynos8895 SoC
Message-ID: <bayxokuehi4im3siq35r3jbbydpvder7oslmgfiqu52p2tzn5b@ajqur6eh3vfw>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
 <20240909110017.419960-5-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909110017.419960-5-ivo.ivanov.ivanov1@gmail.com>

On Mon, Sep 09, 2024 at 02:00:11PM +0300, Ivaylo Ivanov wrote:
> Add compatible for Exynos8895 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

(which in this case also means I will grab it after the merge window)

Best regards,
Krzysztof


