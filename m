Return-Path: <linux-gpio+bounces-30391-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB41D0E8FF
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 11:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EBB3300762A
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Jan 2026 10:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181CD323406;
	Sun, 11 Jan 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kqg5xM5k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC551A5B84;
	Sun, 11 Jan 2026 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768126841; cv=none; b=KPYMRnVIWyyT1Bu3YMril2JNWJZ3UOKAytkGcopY41SobezNu7xGXu5M1FIhJt+FIHGWZp2CP9N6J+vKJkkvAQJcOavE/bm3SEVCNKJdd+ii21WUiBLWZKINvKZ8T8F6yKYPpNEu+LUXa+/Upav0W+vJ8G0/S6gqB6JIt2oao7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768126841; c=relaxed/simple;
	bh=A14iIqfhAPwsb5yPYhuoHINHVqxscKHdBc8tdTtnxao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6II5pA5eAEV8vqfECXbMMQJZaLVLCkowcinE2PG70ea+iMQq5Lz8PmBcubf2gSRHs0xD+hBHUNGBwzJmo0cFWuhc9EkEzxatr2GYIlL57UjZ2S5VeIo4aR9BI04cAQtpxj7suL/sJ/siz0EAOOpATerc9FeTUefrOw0viqpfWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kqg5xM5k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22ECC4CEF7;
	Sun, 11 Jan 2026 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768126841;
	bh=A14iIqfhAPwsb5yPYhuoHINHVqxscKHdBc8tdTtnxao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kqg5xM5klUgdlPoFV5BmxbeL2QfkfIw6e4dbYlM0wY7ZEL3Rinc2/wKtjpBpplaHL
	 Bf6TvPs5JDKkSnoQC5X8fw2Z4FsKskV5aCjFQcpYryUWBQw6baD8566lt3evIBEGTm
	 lUJjGx2VCJmeUv7q8fyWRoXlhkbDeYhS6aV+QHSluiCloW2A8On6r00GPnOWUKs8eM
	 h8eUTtURZSdRS3E95FnCSPhk8tZFjrL+C7TZD38vN7o8HppCmC3Z5WLcfSg7YGoTYR
	 Xp4LUKH66qGt/ds62Mpk+SN+QgSKaWWEUQHNWsOR0DgC+qjCzrERvxyN+oMrsELxvv
	 xwqBCL68LRUkA==
Date: Sun, 11 Jan 2026 11:20:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: gpio-mmio: Add opencores GPIO
Message-ID: <20260111-amorphous-cow-of-stamina-6f2720@quoll>
References: <20260109134409.2153333-1-shorne@gmail.com>
 <20260109134409.2153333-3-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109134409.2153333-3-shorne@gmail.com>

On Fri, Jan 09, 2026 at 01:43:53PM +0000, Stafford Horne wrote:
> Add a device tree binding for the opencores GPIO controller.
> 
> On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
> 
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>  - Fixup patch to simply add opencores,gpio and add an example.
> Since v1:
>  - Fix schema to actually match the example.
> 
>  Documentation/devicetree/bindings/gpio/gpio-mmio.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

This does not even apply now. Your previous version was applied almost
one month before and you WERE notified about it.

Why did you ignore Bartosz's reply?

Best regards,
Krzysztof


