Return-Path: <linux-gpio+bounces-28021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C258C316B5
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 15:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28E63188290A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 14:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FE232BF5B;
	Tue,  4 Nov 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCqQMJ7K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11732B9B4;
	Tue,  4 Nov 2025 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762265192; cv=none; b=L0DxAKRR43xUNt3xICKmLyrkrebPYWBt2YLUhurscucVADI1uDpZ+OmmTy1wEzywVaLMGKSIddreNDCZ0PaU0JTHJg3CE0kp9iTd+El7jboSQgF1Srphuhe96aKP+gcrUzQVSToIguQ9k5XO0HepUCeoApxCSQOB52s4n9/mNAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762265192; c=relaxed/simple;
	bh=t+bos1qh5fT48v/WeQY3yu0tKhQYMh0Nl1CYYmz793o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nu1ZQwnLu7qDMxKxw5avxPVXBODRddN3wQY0vK7EhhNHLnrwqswiuyOqXo6mva87YUCEzwFBTY7vh9b/Z/LhXPNmtXAIaRa001rqiaXRi70g1e8NrYaZzuYs7+/tbD92LviqxEtq5r/WxFMvb4NIovVfC+kT3oSQgaTCo6MsSPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCqQMJ7K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAFDC116C6;
	Tue,  4 Nov 2025 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762265192;
	bh=t+bos1qh5fT48v/WeQY3yu0tKhQYMh0Nl1CYYmz793o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCqQMJ7KT+vPcII2clkArOHKGWTj0q+SaX8/jpqMaOGsxmF3WLmxjPuGGpqfPkjfs
	 4ZLmzNq5clpZzIFr34q0NbqYFpyLvdMnGcnNnz+j5N600K7nVKzynEhhPnax2rtAn/
	 ASlzAAet5hqaede0cwmTPUwH1Dk0OhRs0TNp8apsfrZehoBjUnLWi84RECvi9eO+0d
	 zYGK7qnVx9ZiAaQRxLWq7GYYL9/zRIRoliWQAj36f8AQ49eTTq8QYWagbryWyj2IRV
	 TgZ4YQdjPSyZe/J8LadiQnqMYF/XWKBuuXljjhODUA8k5e8PilfLpLsOqgN4Vmf3j0
	 QE2SthRbdaGHQ==
Date: Tue, 4 Nov 2025 15:06:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, tao.huang@rock-chips.com
Subject: Re: [PATCH v1 1/3] dt-bindings: pinctrl: Add rk3506 pinctrl support
Message-ID: <20251104-successful-smilodon-of-symmetry-3ecddf@kuoka>
References: <20251104021223.2375116-1-ye.zhang@rock-chips.com>
 <20251104021223.2375116-2-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104021223.2375116-2-ye.zhang@rock-chips.com>

On Tue, Nov 04, 2025 at 10:12:21AM +0800, Ye Zhang wrote:
> Add the compatible string for the rk3506 SoC.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


