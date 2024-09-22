Return-Path: <linux-gpio+bounces-10340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809A97E358
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C813F280DBE
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D4F64CEC;
	Sun, 22 Sep 2024 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKcOU4KZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5982AE75;
	Sun, 22 Sep 2024 20:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037922; cv=none; b=kE1bY1jb4Iqi9RMsXBzNVG7qg+6QV8+x0oIg3E9SKc3eMT4dvW7MEdq6cfxzb3bJjPRnZw7F0t9bsh4Nh1H0ir7IMIbIiHywEf16/UcwA4VTW26NEq5mxD4oFW4qLGPIjuQm85Di0CScQ8gzneNP6pp34Njlr7Cum+0WKlg8XfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037922; c=relaxed/simple;
	bh=73OPsFeRbPEYLxdvwyn7/UZcy6J2C7pY76P357u7Jvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2lHYD4pMG2i4bxWi0rt/+RBuBhND2OuvUUWaa9lWiKHZUH0NqOaGuPA7saJtPISXQJ7Al0NaiRpGi4pZ3EvF/2uFkupcWhilRkNbn5TuN7H5GVin9XqMXlCqYM93kCVRNDmPAGmf+6MR8eG0l8rqsno9RH7E1ynohCdwWL358s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKcOU4KZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2729C4CEC3;
	Sun, 22 Sep 2024 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037921;
	bh=73OPsFeRbPEYLxdvwyn7/UZcy6J2C7pY76P357u7Jvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKcOU4KZyVuaOSStoDJVEQaaAI4eHs/ZxSSYHdXyfqxVV+rD44A3fd/45P+8yxrtC
	 PIuSab6HxZH80iptbUPzXyGFyRpLLDqMuKNmAQ2p/EqIMVL7hr/JoEaJShMJ6cEYk5
	 hFsefhIVWrcU92GRqIm2rzjMJea58NlD0EARAHF/BBHm+386CdGlXuWG8sVRCD6llY
	 PWnIyr/6vpo0IDuyiJFVLjxYVsqWgt2971xNv2cZa52hnCQauuN1IttEZuvxDMjkSM
	 IhJ0sFk8Pt4/oUGtOyVGL73hJyJQakNME0UVbVdlR4PrV5NpeJpkDA4840AJI0PTjq
	 tCB9yaQjvqSjA==
Date: Sun, 22 Sep 2024 22:45:17 +0200
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
Subject: Re: [PATCH v4 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11
 compatibles
Message-ID: <nixmhq5c7jrww6symjdbw3facvockmbio3cilnfmuzzf4eqt5t@itcs4qz7cne3>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-4-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-4-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:52AM +0800, Nick Chan wrote:
> The blocks found on Apple's A7-A11 SoCs are compatible with the existing
> driver so add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


