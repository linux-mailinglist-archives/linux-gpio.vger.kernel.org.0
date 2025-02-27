Return-Path: <linux-gpio+bounces-16712-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DFA47E81
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 14:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54DED188D8B4
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2025 13:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1332122E3EC;
	Thu, 27 Feb 2025 13:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWEc7/j8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2541662EF;
	Thu, 27 Feb 2025 13:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740661515; cv=none; b=nXfRjl/r7bIZ3Jz9Smc68FTDinOk9nxIU2w86kvmc3jRmcXgTZdIwKJU8Xroy8K1hZ+T+LG3jhVUVGUBfpcHbEyOL0O0EF+XKUGiNG0edt1AslfcMbE+efkKfSEvXk3gfOCwNVyGXO9FUvyiZU67shwlNfKwxL+8wbxFjqpYKTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740661515; c=relaxed/simple;
	bh=sY36R3VwjWTFFatStJrDFPiJflwv1Qz3+ewgmvKvf4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1UaRK9mWMq5qxYO2DV9sp+orLKa2ZA5VZLch3uUVuRTyNrTQHNFYWot4TRAF7eeycNLsWtVpw9MT7Ukh41R6kl6+xnVdj4dLgKaKalgNZ3gGC86CeKf0zH5NtOduAZfU77F3KSBXOj2Ffy/60MonifPkiEkLVTDmn9YSkyEGT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWEc7/j8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4F9C4CEDD;
	Thu, 27 Feb 2025 13:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740661515;
	bh=sY36R3VwjWTFFatStJrDFPiJflwv1Qz3+ewgmvKvf4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KWEc7/j8Qgr6QkbqHgLYWYqdnK8NA1gCvSz7Hh5Oy2oGy4DTtULOZq/IPMXJlY9CU
	 fCf8Z7NhsqC2BXkLkyIhBf8jOVBu7o/g8KutkDLGbedT/S+yRbCYmvF6HTaeBBpbN0
	 0Ee21Afxb+qYguMgUGLelsI7CKqus3318lpZME3MEU1uJ+Xc7t/jrsvfgtQxizkzxh
	 PLx8zRkuzBrB8ZFryttkVTmzuqZZR2sm6jsRcsdMJrlHyLJbiHEhKuz4uJND8zk+6B
	 B6I4MaNI2rDl4vnfqXsPApk6omuoDpJOOoklrILM6sQbieRzblzgXBs+qOaBsEWTJr
	 8Mi72Y/ykTBFw==
Date: Thu, 27 Feb 2025 07:05:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	devicetree@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, kernel-team@android.com,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kees Cook <kees@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/6] dt-bindings: nvmem: add max77759 binding
Message-ID: <174066151161.1829485.16000199455497636028.robh@kernel.org>
References: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
 <20250226-max77759-mfd-v2-2-a65ebe2bc0a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250226-max77759-mfd-v2-2-a65ebe2bc0a9@linaro.org>


On Wed, 26 Feb 2025 17:51:21 +0000, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This describes its storage module (NVMEM).
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> 
> ---
> v2:
> * drop example as the MFD binding has a complete one (Rob)
> 
> Note: MAINTAINERS doesn't need updating, the binding update for the
> first leaf device (gpio) adds a wildcard matching all max77759 bindings
> ---
>  .../bindings/nvmem/maxim,max77759-nvmem.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


