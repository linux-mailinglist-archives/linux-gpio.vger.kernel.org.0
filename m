Return-Path: <linux-gpio+bounces-8351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B37DF939841
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 04:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4FF1C218B4
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 02:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3726813A261;
	Tue, 23 Jul 2024 02:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wh/bDAUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD18F14287;
	Tue, 23 Jul 2024 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721701582; cv=none; b=WICZzgHxLJFey1oakVdGcB6Q8GAMTCCUTTDe0DEF93qob53g/Sr+Am+7czyapSyuKnkEAsuU1NIbx1zalXr58Q19JnMurylUw0tHuCRIJ1fICR97KOyuUxgWjZfXIZEcJuPOpGSpJt1UhGuHyrGYvdvoscX8rks8OFIb9VXEkXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721701582; c=relaxed/simple;
	bh=CvBnaUn52mQsjo7putJFlBA0OHXKCUh77DIwGSeIFDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmojukqEsuEdZT7l4Zs4uAzEiYzSIV1g/3pininreIVO1diSAzRGAOOiTWjnAoIsnC6/gEF/8h98BpndvtAyBecwzwwlSZPTXRTL+Nzy4XRtt2huD/1hb15oacnh+B0K467CQb//jqINR2hY2dXj+xFXA8c4r+R20hFkYHMROHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wh/bDAUR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AD84C116B1;
	Tue, 23 Jul 2024 02:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721701581;
	bh=CvBnaUn52mQsjo7putJFlBA0OHXKCUh77DIwGSeIFDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wh/bDAURixcRQrQfIZOFV3X51sOAGG2pvqnFa+mFpzftqL7H/ayRXkAo1Lyq0mJJm
	 rw6YVjtgIVMqxlmRF1/FfpZIB/NlBuMC5RnQNnJQ37yyRLZYym3Ut+Kc/HgI9oZ28F
	 NSJciyiq3YGap+rRLnsxAQFVAU9+UxoqlV1gdOJz3LYXulTyblad0CmhB7lW8VHaXr
	 QppfnlqJURWCkMleaOFJzqRrC0Ed5k2FYQ2U03qv57EGD2uRiYmyCqSurHaeSVSU8x
	 cKYl7K2O0Aa10H/7rGBlbCqzy6zPIVpPQ+BJnfaKtovQdir5RTqOLzoxsRYOM+QS9x
	 aSfGAid1vxRhg==
Date: Mon, 22 Jul 2024 20:26:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: yuenn@google.com, benjaminfair@google.com, venture@google.com,
	avifishman70@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	tali.perry1@gmail.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: pinctrl: npcm8xx: remove
 non-existent groups and functions
Message-ID: <172170157801.126503.9265506561761708567.robh@kernel.org>
References: <20240716194008.3502068-1-tmaimon77@gmail.com>
 <20240716194008.3502068-2-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716194008.3502068-2-tmaimon77@gmail.com>


On Tue, 16 Jul 2024 22:40:02 +0300, Tomer Maimon wrote:
> Remove non-existent smb4den and lpcclk groups and functions from Nuvoton
> NPCM8XX Pin controller binding documentation.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../pinctrl/nuvoton,npcm845-pinctrl.yaml      | 70 +++++++++----------
>  1 file changed, 34 insertions(+), 36 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


