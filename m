Return-Path: <linux-gpio+bounces-12474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAE69B985F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 20:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF0211F22BDE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 19:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE30A1CF7B4;
	Fri,  1 Nov 2024 19:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qrbdQDEX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED01A0B16;
	Fri,  1 Nov 2024 19:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730488989; cv=none; b=HmsNEQ09we86SwA0jR4pBKhbvVHFx5ZkulXocnHmIESyKdL6lxlHkG3usBbehmYiCupkhh5KV4X+86YZBltMd6uA1Jop7hzaOZO+RiV31vCEK1a1GJzR1KfczoDb+BCwodGcUObq5g9ghc1PVrdAHg06Xss2OiHdv5fq2YqZPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730488989; c=relaxed/simple;
	bh=IoVjrTz/gindmuxJ0QMs4DJ8o1qRWvbiA1FET2LLBkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdEkOjgete5AUxjN4xNjis9kA4dSQ3bMiTQ1cyaSBy97pzO7HOwFT1cV4iaokzk31zRScW2PTXTyF0vaqofF6/jZbOZUHwW5C5v+3qYZKwdNYRbE6Cysban2IZyMvRxmNsStSyA+Qg7va+fWgGUGoIW7fY/Fsr6HeRZRduNlzfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qrbdQDEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1F6C4CECD;
	Fri,  1 Nov 2024 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730488989;
	bh=IoVjrTz/gindmuxJ0QMs4DJ8o1qRWvbiA1FET2LLBkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrbdQDEX0OezccbcP7PeNYpAbB6P/SZVG7QBZZwDgeOkhjnC8oPjnF1ZxKOB/bIkB
	 LlBXi+kmCfNz7i3u3jE0VZGsy8SQJvYjFLdWDpOaYSMquMkiPCXh93J+c0AD9wbaei
	 W1ySLqXm7dWe3T8T0b1EWxsFhPzwcx80/zw756Tf2Bnqf37Dv0B8IAZoe61eVIr7vi
	 YiBGTeYv+N6ZZ6zgQyE1Snux8kYlZaXsTWxpLVb8Ep/dcWQtWLh1JbL2RmJ29K6ry6
	 CI+zbX9hAO1ttKqSXXeTczGw7U/Ixbi2RtjxxeFscreybr3KYUkPpb5KkYguDJa2wh
	 K60EcMgkUtE5A==
Date: Fri, 1 Nov 2024 14:23:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Chen Wang <unicorn_wang@outlook.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	inochiama@outlook.com, linus.walleij@linaro.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pinctrl: correct typo of description for
 cv1800
Message-ID: <173048898705.4061273.16401199278517673218.robh@kernel.org>
References: <20241029012312.3448287-1-unicornxw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029012312.3448287-1-unicornxw@gmail.com>


On Tue, 29 Oct 2024 09:23:12 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> It should be PINMUX/PINMUX2, not GPIOMUX/GPIOMUX2, see
> <dt-bindings/pinctrl/pinctrl-cv1800b.h>.
> 
> Fixes: 64aa494de6fa ("dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.")
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


