Return-Path: <linux-gpio+bounces-10345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2D97E36F
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB8341F2119F
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0150B664;
	Sun, 22 Sep 2024 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1TGwJ3f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91570679E5;
	Sun, 22 Sep 2024 20:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038011; cv=none; b=pLW4TZ1piFDWlP6KbigggBkq7gcF0CEZKu/T6GAS6XJMcTa4zltHh11mQc7AHFwzoGCJbf0lpsd3VRmCPk+L2fxDyMYtcx82kkJloOWV8Js5G30Zxq/CGkE0UulWFymttKSWlnUFrplea/qLdWMTDGeQ8eRj9LuxVZSlJVdR1CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038011; c=relaxed/simple;
	bh=HFyzvkhnjJQ+KdY4myeZTfWi+qigodYSXUouN1SRR9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3G7vrEjYalHQBS9AIRyxoVjaEDjkIhaFJYV5mRF/c38rzpLPL9psZryE/RcYiOpWdidSiOsBll3Nyve8B3TjEw0gMDdJOaGak/3cIIyTHuAqwH+/PJaJz0s+ciiSOP3ahKNB0EPoNEsxYdb5sAPyfPkuZPDoQ1rdjCTTDOHZ+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1TGwJ3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F96C4CEC3;
	Sun, 22 Sep 2024 20:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727038011;
	bh=HFyzvkhnjJQ+KdY4myeZTfWi+qigodYSXUouN1SRR9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1TGwJ3f4TFdt3TkAkc53qj1DS3iY4OX2yuIQsn4O40nyAWDm1ptFdR800UGCmc2r
	 BsVM7XDmV5WbbYpQ5GS2cbsYHltBsEqWjMHYj57HNx6FxAjBi7urU2OPx/yktPazJg
	 p4e7f4Y7vjVaQnTxahrWmwA8QYCWkltMFypWs8ju53i2MkTZuZMvLJxGEdE4ykCy/t
	 aKZn4TWqtvn093HyEcYx7+LvuKiDFzLEHleysxtyo3EtGloReEBbDjRSHdHZ/2Kt1C
	 Sn0sqkTtKSd5cN665spEA6hRvKpZ/0nx2c1hlumNitpbXu8PjtKhZg/ZcfeWx8jm/J
	 KUo+pPVEFBKnA==
Date: Sun, 22 Sep 2024 22:46:47 +0200
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
Subject: Re: [PATCH v4 09/20] dt-bindings: arm: apple: Add A10 devices
Message-ID: <w7y3u5cxcmag7bjinqqxegqim7e6tidkcmfp37uouq47iemwyn@gr5xeu2qhazv>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-10-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-10-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:58AM +0800, Nick Chan wrote:
> Adds the following apple,t8010 based platforms:
> 
>  - iPhone 7
>  - iPhone 7 Plus
>  - iPod touch 7
>  - iPad 6
>  - iPad 7
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../devicetree/bindings/arm/apple.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


