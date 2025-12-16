Return-Path: <linux-gpio+bounces-29605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E003CC1212
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 07:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60CA73058E7C
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Dec 2025 06:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3890336EDD;
	Tue, 16 Dec 2025 06:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXsSIbZE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D1B261B9F;
	Tue, 16 Dec 2025 06:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765866797; cv=none; b=WB4uzEAcYYVIh2hoZx4hPFyAHJxVGUuFti5dAgAwWDi3ZFZnd/+BuOTMHQ4II4GOsQa3vkfF3cfUqqVcbn/eFpjrs2dTHnOGdA0tilmkLXCwW8ED5/jsvSsapstKeeRXkTmGO/IetGBVI3o8lys/+LlpjYro+wXc8sEyn6nH2Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765866797; c=relaxed/simple;
	bh=NJGJ02Pkjh2ueUVuyCYqUUbn8lG4/n/q4AZCncqhQus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8QxzcyTAZKPczZZASsUK1/pU6Mi8wH6Pg5W6HwZcRW0eoIFFEjF29tGYy+gdOFSlFD12v3vzVSWUgV+13z2O6wU7qQLs6utDKCk0Stsz9KECaKa8+160b2bmfAHkAnKSsp2Aj95ORJe6Myww6BJB5LyG3PzmemTb31pbAFlxfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXsSIbZE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE96C4CEF1;
	Tue, 16 Dec 2025 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765866795;
	bh=NJGJ02Pkjh2ueUVuyCYqUUbn8lG4/n/q4AZCncqhQus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PXsSIbZEGhUQsFoqxoBWJouME+WHkIjIG4g2AsojOEzYhElYYLSNNgnKu3e8icryq
	 lrJJJs/RO/beOWHzEyJTtQO9e84Hl0UNwsrJd1vs35u2GeOps18cSTj/AmiZ3gem59
	 Xr2LuMH7iE3wwkWkDkCoHiLlgBzI9WGQNvsoVnvGmYh+T1j7aX3NFQ3cxDS7Ao66Sx
	 csFLX3vp5ognoua743exkfgpRRzkgeKMiBBIrDvCYDXAGYBRN/dLIkNS6zMtpzpOp6
	 LxhFWsL/TXCuBN0w6qJqa2LsriN315uzmahEehuak7T0kMos5OfGfOe3PO7SzWDywr
	 hI+muzJ0fGMJQ==
Date: Tue, 16 Dec 2025 07:33:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Levente =?utf-8?B?UsOpdsOpc3o=?= <levente.revesz@eilabs.com>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 3/3] dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and
 tcal6416
Message-ID: <20251216-happy-beige-bug-a8fad0@quoll>
References: <20251212-wip-jremmet-tcal6416rtw-v1-0-e5db1b66d4cc@phytec.de>
 <20251212-wip-jremmet-tcal6416rtw-v1-3-e5db1b66d4cc@phytec.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251212-wip-jremmet-tcal6416rtw-v1-3-e5db1b66d4cc@phytec.de>

On Fri, Dec 12, 2025 at 02:03:18PM +0100, Jan Remmet wrote:
> TCAL6408 and TCAL6416 supports latchable inputs and maskable interrupt.
> add compatibles ti,tcal6408 and ti,tcal6416

And are not compatible with other variants? Explain here why.

> 
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Please organize the patch documenting the compatible (DT bindings) before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


