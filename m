Return-Path: <linux-gpio+bounces-30000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CDCE9A97
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 13:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E36BE301BEA5
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 12:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E99D2D23AD;
	Tue, 30 Dec 2025 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8UEsfR6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866129405;
	Tue, 30 Dec 2025 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097991; cv=none; b=DIQ64rsHc76E0ZQ7jajEdatxx/64+7k6nqTvu3mfCuZzSC1oHSnEAEWO0zUZRdQF2Cb+GTdPg9bLHz35Gqj2+ndiBaSzc6iakeWXx3dy5swDZZuVngWhtUZAi4XnmmIW7pC1uGSOaOCc2LXz9hAf62b+VPcSMd1G0hV/5R6p/vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097991; c=relaxed/simple;
	bh=7SyWJ6TfKHldAp3wvnbKABxB1tOmnBRHMTO1kry0O0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzn6Gmmuoa+oiOUQuIA2X1tuaJNsMHVwPPKNlJoZijMyP2Ffxjo1kB7UJyYjRqEWu0X/uD9jXChjccQDNLBwlbxPHxGb0FsAo/e4kiH7HYXlQNLThv1joHeVnSBKbbdtJbpKZzZ3h/LwyNynD+uTlYH0r4mAXiTQEF3sfhNHEVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8UEsfR6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2646C4CEFB;
	Tue, 30 Dec 2025 12:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097990;
	bh=7SyWJ6TfKHldAp3wvnbKABxB1tOmnBRHMTO1kry0O0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8UEsfR6aB26uL+qakfmjqQWOWai7AqqIou56DMm0UmyQhYxwbcf9k+GdqbiQ9eU6
	 5Sd/G16D3L/aMZVh3wbnUdf685Gq3uJAPFbLbbsrz6ydq+ftiXGlH45scafH6QDvk/
	 WTcCU+lUqmpdgwARdFKVJiBoaG0b0hyksPundst3s7zUMnxfgb9WITCU+vbqQf9xtM
	 67v3FSOY5/90V7WMiYAuvXCS6RqtnOdmszFmfyxpSBzZvwEUmSHYQiD6lkA57LXkQM
	 x6QW1WsqwxnszWJ0PVS8ggApvUM273IGMoM79LO+DHrWW5v1RYJ0SJlcimprb38EWc
	 nBQwlfyQujKQQ==
Date: Tue, 30 Dec 2025 13:33:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: spacemit: add compatible name for
 K3 SoC
Message-ID: <20251230-mature-fanatic-angelfish-5d6ede@quoll>
References: <20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org>
 <20251229-02-k3-gpio-v1-1-269e76785abb@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229-02-k3-gpio-v1-1-269e76785abb@gentoo.org>

On Mon, Dec 29, 2025 at 08:46:38PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC's GPIO controller.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


