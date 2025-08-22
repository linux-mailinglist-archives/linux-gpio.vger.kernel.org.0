Return-Path: <linux-gpio+bounces-24833-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 053F4B322D9
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 21:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE737640B00
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 19:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AEA2D29A9;
	Fri, 22 Aug 2025 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyF7ODKb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88692D238D;
	Fri, 22 Aug 2025 19:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755891010; cv=none; b=es0TXN2k8FROQjJfrtyjgPNwjOYobTqXOEoZD1tl/6P/jgRPf6Oax0x6dq+Elvb/L1JjibzL47VCTGF3+TnTLETu6L4xY3FsnarfAF+cpxQ60ClFpn7onKH9D/Uo3PAl6KX0DdG0leeVOyOlnPa4GVXCTPgi5jHxrEHpM3puFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755891010; c=relaxed/simple;
	bh=GRXNtbctyZGGC0PN83OJd5nWpOvsyv8RPeV6LIKdcos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWTYi/r0I9LIxmBw+4t0E6m5s+/Q6UceDrMpZIN2YCxVkfZCz7W/N38sttA/kmiHW+oWbMdcodw3/k9ADFnbjntrK068wgkrn5DhqeGCnfowYYCbrpDTIrgYRU4VjgiGlWFwOtmwnLBv2b6+YcjQvvtwAhaDE2cIoghQsJWI6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyF7ODKb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BCEC4CEED;
	Fri, 22 Aug 2025 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891010;
	bh=GRXNtbctyZGGC0PN83OJd5nWpOvsyv8RPeV6LIKdcos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OyF7ODKbXMAtG6mxXqBkzisVY2DOSL1mzdmdQtKgc1ir1jsHgjrNsyi+DVUcM1DzG
	 ZrVHcuhgj+hkBR0x4jZi4SPbDh2jgm1pri2kS9nYC91bkqZKiOTOIg2PzzKIPt3h2P
	 hazwMvvhJ6uXg1F2gGvo10tF/lMipHrR58s1Z5gKHdEYf5Gut3HFD871y3WGMQlI9Z
	 hQ+R6eWbKSLJ3Vvi1q0VJ0YKSLNXsXU9wGvzSQnqONsqrX54zRAHuhz/y79EeS9IwZ
	 eA+00Jc2JLJVgaTXjGszpyh6/CGfmfMalUZd6mKNozruHc2516Gqj9D9vREZXFyOL8
	 aWiPZenxpgbjQ==
Date: Fri, 22 Aug 2025 14:30:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Message-ID: <175589100873.180019.11142761697135180294.robh@kernel.org>
References: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>


On Thu, 21 Aug 2025 10:32:14 +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '='
> character.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


