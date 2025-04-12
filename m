Return-Path: <linux-gpio+bounces-18739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1CFA86D5F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 15:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE87744659F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Apr 2025 13:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CED1DFDAB;
	Sat, 12 Apr 2025 13:55:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773961DFED;
	Sat, 12 Apr 2025 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744466159; cv=none; b=MDZY5IJRuXNVti1P+wnDTt1euRUzjosjlmuYvWz9lJPrJNuNitomZwz6YHJT6ILMVLm46VEgh4tvy0088NufuPlD/ETRf2XSQmQXReClRXhEyE3rNmedCN6bP/MhOgThYAZJRmVIVYZSlG9k8k8/WoHwocRFeWlxRF709T/EPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744466159; c=relaxed/simple;
	bh=+6wEJrVQgRWapbNpAFHkDEtn6wDDNb/Tzgc9b0oM3Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTmubBatxtCmbzvquyfmBLMaABugWbSxRAzYEx0Pe4v6w+mLYy6XuPzv99Fmr9i/JCMNT0gDyt6Hsz8/GjYw4164xdH/qFfrVxzzctBtXdlsbwc1iOOwivdzxM8O7gYcd/h7JEVidlZpNY/VTHCjEairCJtFwltznRrmV0C0atw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 443283439C7;
	Sat, 12 Apr 2025 13:55:56 +0000 (UTC)
Date: Sat, 12 Apr 2025 13:55:51 +0000
From: Yixun Lan <dlan@gentoo.org>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: spacemit: add clock and reset
 property
Message-ID: <20250412135551-GYA24603@gentoo>
References: <20250412-02-k1-pinctrl-clk-v1-0-e39734419a2d@gentoo.org>
 <20250412-02-k1-pinctrl-clk-v1-1-e39734419a2d@gentoo.org>
 <194dfb6c-d290-49f7-b060-3654307c4887@oracle.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <194dfb6c-d290-49f7-b060-3654307c4887@oracle.com>

Hi ALOK,

On 17:01 Sat 12 Apr     , ALOK TIWARI wrote:
> 
> 
> On 12-04-2025 12:28, Yixun Lan wrote:
> > SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> > to work propertly, also has one reset line from hardware persepective.
> 
> typo in commit message
> propertly -> properly
> persepective -> perspective
> 
thanks for catching this..
will wait for more comments, and fix in next version

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

