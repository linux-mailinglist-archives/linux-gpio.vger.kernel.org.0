Return-Path: <linux-gpio+bounces-25564-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A44B43391
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 09:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B22551BC847F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 07:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A956729A32D;
	Thu,  4 Sep 2025 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiR9HoJX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E1929ACDB;
	Thu,  4 Sep 2025 07:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970297; cv=none; b=OyZL7EEOyQeLUKr1NIXRIZEqOHXcD/4Vakbm0/25EzimAofZsGsb6oDB4Wn9siT6JjbVtXIQ63JuBzrRbfjzdHZW3V7GDQZ1q2HctXNWldPO1/pVNZ2hSdxVA1aeZpVRYNsAlpfHB2i8OUBuEqM8ZVpWLU0eAFELg2rgJUJEG6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970297; c=relaxed/simple;
	bh=C+Qu2udb4820W+KVG6rDMY6wlAdNCAarHtoXWsJRqpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXG7QBXtmBPFNp9MQ21ywsHBgCANaZHeWrr7GDJeWB2WZbSPzdHrZKTPXK8q1HW4YEb4w3sJ5gmZ/YZB1dF9zKRcCqwEKq/hRWogKT5uNbt9f7WB5SfDGzGlDTcKUvTFUrQ2+u620a5mPTYk2GkvYfJhZFmnEj0NnXWB/CmUJ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiR9HoJX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859D4C4CEF0;
	Thu,  4 Sep 2025 07:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756970296;
	bh=C+Qu2udb4820W+KVG6rDMY6wlAdNCAarHtoXWsJRqpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DiR9HoJXKXkRr1st3luOxzv9rjFHD8ctDQge4d0JC+BEsbCenr/eKDRVtAJsIgPph
	 qxsPCG8/+3U/VPznbzDsGFbCXWfZHoJSMhOBfX0yfgZJjqT8KBPwfqiSnuPXSFZTVQ
	 ZsRVIallmVeuz2v9mDL+pHSeborSY5CMObzv64XJ+tFxbaCuppIt5AR4/ypzuQopNd
	 1zKsj7RFxIlgnDjP9fh4cjOtxOVpCYwN4Nzt/IS6xscAtowLqzuSj+ZCLvy0ReDX7x
	 4rSgyjNtnuKFNZKaWpMISFBARN9yKcJOnYZR8GcK0Nt3floXrk+q+brsDuAKXmfV5J
	 Il4Bg4xMBcKvg==
Date: Thu, 4 Sep 2025 09:18:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Subject: Re: [PATCH v6 1/2] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <20250904-arboreal-upbeat-iguana-aebba6@kuoka>
References: <20250903-clk-cdce6214-v6-0-b2cc0a6f282b@pengutronix.de>
 <20250903-clk-cdce6214-v6-1-b2cc0a6f282b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903-clk-cdce6214-v6-1-b2cc0a6f282b@pengutronix.de>

On Wed, Sep 03, 2025 at 03:55:45PM +0200, Sascha Hauer wrote:
> Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
> Generator With One PLL, Four Differential Outputs, Two Inputs, and
> Internal EEPROM.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 198 +++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h            |  24 +++
>  2 files changed, 222 insertions(+)
> 

I don't understand what is happening here.

Patch changed in weird and unexplained way - nothing in the changelog
explains dropping SPDX - and does not pass even checkpatch.

Best regards,
Krzysztof


