Return-Path: <linux-gpio+bounces-10341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABAA97E35F
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D35EB20B7E
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B934679E5;
	Sun, 22 Sep 2024 20:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdKxnj1u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0843B2AE75;
	Sun, 22 Sep 2024 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037936; cv=none; b=RDaUPyoe9pZFJ552KjpexrInnSpTR1UDCkIpNgH7Jx46KFUIv2gwHGKIMyVNxfQN0JizyqFRVmI0ASquUjHzyVtRAiBiAY7byAOS8XoN9Oo2o+dgDywv9F/fdKhucqTZGgcGVv3rsCQO0CXLRmGA6uJj8nw8r03rHYda8DraPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037936; c=relaxed/simple;
	bh=O8sdLgchAV5dYU/0p2qibq1IGBLZEqjCfE5f3AhGn6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRKD0eMn1WzjdB5llaRLk4ilLExi8NKmoDZuwPSmdThHqHIHCTHm0rpVlnQIsoPPDD/D1mwCPU1ZpAvQvSbzA+kmEsSeqLj+VB6PGqlnZsyMgyuyFY9Kq8rSSXilMjv96VwC5qFruM7Gw5stKZMjlgKWfVLYU+2NrgwKrwOqZSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdKxnj1u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCB40C4CEC3;
	Sun, 22 Sep 2024 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037935;
	bh=O8sdLgchAV5dYU/0p2qibq1IGBLZEqjCfE5f3AhGn6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdKxnj1uh1n3ItoCsw8gUaD44SDkamhKYVEBP9AmF3+6zCqYmAbn7SIEEMiBgMxiv
	 yQzaEp+3GeUdDdpPBJvwS58HwowHKj7th8tYrLsnZg23/j1WiCZJC94+LrKBSiHlca
	 bk3RttPuXu587TFLfMWXBrsryKTKnVfnuMORPrVMnA/aWxo5ZV4lfQ5QQHFYxnd85i
	 287oEK+H7LbOcfnaflDA0rJ4G3AU/mSL8EaCiDKvLMtPV6VEb//rJgcT7c0QNnmtyO
	 Ap2+Eh4rRbM/GfJPHUH/dkU3KE3/x0BivA2eQZEBSQLvebLXZ+ErEkIcddEnuws4aR
	 vT2P9xAsld+Tw==
Date: Sun, 22 Sep 2024 22:45:32 +0200
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
Subject: Re: [PATCH v4 08/20] dt-bindings: arm: apple: Add A9X devices
Message-ID: <nbyo4t2ychwkcdbxe2jtx4dc3apl42ldgnftni56hr5pmmm2d5@dimlk6obefy7>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-9-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-9-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:57AM +0800, Nick Chan wrote:
> Adds the following apple,s8001 based platforms:
> 
> - iPad Pro (9.7 Inch)
> - iPad Pro (12.9 Inch) (1st generation)
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


