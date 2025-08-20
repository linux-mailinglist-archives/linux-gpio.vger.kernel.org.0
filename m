Return-Path: <linux-gpio+bounces-24680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A8B2E568
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 21:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED0573B0C57
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D12280309;
	Wed, 20 Aug 2025 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqbgGRuL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9529F27FB01;
	Wed, 20 Aug 2025 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755716380; cv=none; b=AH84DDvQy/2Z8NHjY6El119z2spZPqSN8PITJPVHNd0nWnS2E0olgEQ/7c2Q8Zzn+9q1OZFdoEfttRXlmN0bseXHjtp3fVGHwZQM3DCgLvYl4RffBVTGpEgVB+xuptW4biPRY5LU74g0vVsb2vUDGy4s18EXYz9gKFlMOePcDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755716380; c=relaxed/simple;
	bh=x32gr/yLpJxMXpTDEsQjMhHxjK3OW4MpSMneDUDRnRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHXNY0xRkMXMv7TpaEeAkc1AugKLCmz7QyYT43p9XIKjuEgix4YEfSlQGNhuV0exmeNZU4+MeXj9qmdWPzpVx/2JGjyxtAngnMp/3+5a95/y8Ey9pRtkGSKnLN8JcJ7dhzalK3bPAUbK+YwsYYdbLDajnJqkShdY3nroePQoCEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqbgGRuL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D89C4CEE7;
	Wed, 20 Aug 2025 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755716380;
	bh=x32gr/yLpJxMXpTDEsQjMhHxjK3OW4MpSMneDUDRnRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqbgGRuL/dVpoL6ztiYF+OzwJc5i7UOATiLzExhy2eLDS/juGOBrkZrgdHQQgo0Jb
	 MQ0KAomsOhX2NtmpLF3iZkbg3YKNzXHTuvp1of9Lvs8T8QRZowHF0996flMFboDtIB
	 ntiO+ziZ/vF4dwqnasgMT5fF54zSnGUejfh9OQdiT/hguQUw3u7A6rpoeA5TN4OSVu
	 Rh+5xMsf8iwzVXMs4YzKIAosclDzk/1dre3lOTJpZ8ClCj3pUOZBg+87T9jbovGKKe
	 j1j/Hw7I1ERb/ZhmHv1GuAlNXYbdf61wnbqFBqk5opm37as664GrFp5py4xr3VO/UW
	 GJR75zDBDDs9g==
Date: Wed, 20 Aug 2025 13:59:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	mbrugger@suse.com, Phil Elwell <phil@raspberrypi.com>,
	svarbanov@suse.de, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iivanov@suse.de,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: rp1: Describe groups for RP1 pin
 controller
Message-ID: <175571637912.531450.11432552685148144601.robh@kernel.org>
References: <20250812084639.13442-1-andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812084639.13442-1-andrea.porta@suse.com>


On Tue, 12 Aug 2025 10:46:39 +0200, Andrea della Porta wrote:
> The DT binding for RP1 pin controller currently lacks the group
> definitions.
> 
> Add groups enumeration to the schema.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../pinctrl/raspberrypi,rp1-gpio.yaml         | 35 ++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


