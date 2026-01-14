Return-Path: <linux-gpio+bounces-30553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E626D1F4A4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC2B2306E2C4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 14:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CD62BCF7F;
	Wed, 14 Jan 2026 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8CNGpz9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA7129A32D;
	Wed, 14 Jan 2026 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399264; cv=none; b=gYwvcJ/4pwBt6yV28OBGFdU0Hk1tBwRY6GLSMPAFweYDcJF7h1MKZU7Jmbc6+2++CqF+QGiTVUof6dflFTFxxBnR7ikzmCTRAEg5uFRxXHcI/1fjmOM+kQNMuf9IErrTmiqX9Uu7LP6Je7FqhcRc6xYNKeqyxlvKkkpT8tcJWS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399264; c=relaxed/simple;
	bh=R1Wi6lmAo+W4QXzp9p43ECu4QfFcNjWMslxY69GOc1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LUu0WzVQ2dbU3jzWZ5iCS+Ct7xEGQs2bzlQkKYJRJhlJcmvzOHfofSYW4YL3g03PJc4CyIg2j50U8vG8NrD/GEUnPoMxn3rU6jn/vipdCPYedMZz6Tcan4rcf+n7TrpuX/IbhVjmTSBoYjilArLlTFqgYvUKY+y9qX2RAccehoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8CNGpz9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4A9C4CEF7;
	Wed, 14 Jan 2026 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399263;
	bh=R1Wi6lmAo+W4QXzp9p43ECu4QfFcNjWMslxY69GOc1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8CNGpz9WFD2hg12NkCb1gpLqvFpyCc/sPFHIgJAAy/3oHL9+GwoXCCv/cZVa7cFO
	 F1omMSXXy94gfJMKAnV6J+9LvkB0cEZ7EazSYLWc5DHalTukXEktmF0nO4HYfB+Wl8
	 fi9Pq0H4ehpIfDBnUchdGQtG+V+6b6fbkelnX8Gi5qe2yKrNTpv7VSxK/fxaiU1jYN
	 npts30lzMkfuqXE7i7I8N0tQ4OIk6YB88RPlMvykXY3+d+ksQ0DCXaADtg0nz6oU8u
	 NPz5U7jUyGZoKswBU0vPVlG+Lm4pMgh52kVwryiZpIXfLFbsoLjqizcjqzTzW3kuPF
	 3luEUaXw2enZA==
From: Thomas Gleixner <tglx@kernel.org>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Saravana
 Kannan <saravanak@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 4/8] irqchip/renesas-rza1: Use for_each_of_imap_item
 iterator
In-Reply-To: <20260114093938.1089936-5-herve.codina@bootlin.com>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
 <20260114093938.1089936-5-herve.codina@bootlin.com>
Date: Wed, 14 Jan 2026 15:00:59 +0100
Message-ID: <87a4ygi99g.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 14 2026 at 10:39, Herve Codina wrote:
> The renesas-rza1 driver parses the interrupt-map property. It does it
> using open code.
>
> Recently for_each_of_imap_item iterator has been introduce to help
> drivers in this parsing.
>
> Convert the renesas-rza1 driver to use the for_each_of_imap_item
> iterator instead of open code.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Thomas Gleixner <tglx@kernel.org>

