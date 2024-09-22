Return-Path: <linux-gpio+bounces-10346-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE5E97E373
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D6AB1C20F99
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E2C6F2F6;
	Sun, 22 Sep 2024 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSWUV1Gi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF2B664;
	Sun, 22 Sep 2024 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038047; cv=none; b=Q+fnj911gItONL3QoouXSfGCyVGl34fLxHGeHYeq1WBzFYAqMFI7fS8MBBnBSo0CwdQKnCYs0EMzK5eJXXiGdV8OvPtMPB56vraQozFyk5M3w8aHCwNdhN8YkMnA7DgERBTn1uTeDK2qQhJ9bznQu/pMNLKeGSEolb4MpFNLWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038047; c=relaxed/simple;
	bh=p6n4LnRx83y59Q5FS4ZMlUfj1sSNn2wWz0+E3nDJODQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5WtRNK5kih33Rhy1feqHWJtLnHlW9ReIEYLo+3B75S/SBK7EirNkX/IadoLpt00HbNTemrZLWD7rp4UEy5oghbEVxSoukpfxlO7rwf4dUkMGcru0ersQJSqLj3fSrHLBvY8F/tZONBO9aWQXNAjrVyS5Ldl0bA9Slk0cir+XLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSWUV1Gi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0432AC4CEC3;
	Sun, 22 Sep 2024 20:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727038045;
	bh=p6n4LnRx83y59Q5FS4ZMlUfj1sSNn2wWz0+E3nDJODQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSWUV1GiKlQdyyrdFo1DrkxajurketpJFZC7ek+jx0omIDbwmbWo8efSSOi13UJED
	 JE1BaZlUBcDMhLIZ1ZpUpGfnBRWG3q2tvRA4/0lG47Sh3HY/hYPFh4sp6vT/xqtkO4
	 n8HqXC5VmT2XAoqeoO4VZngXLFfXDIslwuIlyzqV+/od5Fs4L66i28E75aRDHfPlBQ
	 1hQBbIfmSNU6f7oZtVk3uKCDK+i7SV0M51vAWuShZv3qiGWd2s75lLGlD2VBrVORiL
	 gPENTfLgH0WQbUR+pc76Dk27m+qcNAdj6ttF+cop1qleH2QZqa+1YX3fXNN5XhDSj2
	 VgKZ8/GW+wsGA==
Date: Sun, 22 Sep 2024 22:47:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 06/20] dt-bindings: arm: apple: Add A8X devices
Message-ID: <k3s7htb3m2bhfa27ufa5f7yubjoqdbanm7dssdxgpzzz6njm64@ac3bllkkvvw4>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-7-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-7-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:55AM +0800, Nick Chan wrote:
> Add the only platform based on apple,t7001, the iPad Air 2.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


