Return-Path: <linux-gpio+bounces-17043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C5A4DFCB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 14:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4C83A56DD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 13:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DC5E2046A7;
	Tue,  4 Mar 2025 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZe9sn5I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE622202998;
	Tue,  4 Mar 2025 13:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096414; cv=none; b=ComZTb0BIHiRSS/COzYKfGO6TyXN4psS0FNLAoEFTNqGFmNXggzsjKmBJOFmVxrr1diFGQtfGuguyiillhoFD3ufz5C+f+IHPEeIBKLV5AdbYd/IXrb659LgvnMPTywywN/tqNz7jlDF/yPqJuq/zIL5pFyZJkwamxpQXHsa+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096414; c=relaxed/simple;
	bh=x1jVIrAUQTOOaajlBpoHHNUKLIfFIjMXL5ZgLjvoHKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrrrAOqA0Hup/idxflDQWI5gCmJYFABBZ23gYRu6fnzt8+Rt7wokTqJn16mGJOpSkkzH1KFzNLG6PoOpJEqJEt9tcXJiehGTe1G6RkSaIxRvuEoNHcEr/dsbF3MYZz8LGGFxmymhO7gKWesb02FAxEm4wNqjgAmmVd6o6GMZNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZe9sn5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCFBC4CEE5;
	Tue,  4 Mar 2025 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741096413;
	bh=x1jVIrAUQTOOaajlBpoHHNUKLIfFIjMXL5ZgLjvoHKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZe9sn5IkFte3b/LplHDeUNtsyOCli6TVUne3h9Xft5WRKyucmqybw5wti/O/EpS5
	 f4iRf6jLDzM2y/RMIfVJ0M1q2j8w9vJmZRm5Ul8fj9ZjGM2EyUigrGaLHEyAKFXX/Q
	 dXGiXiyisfD4dfdLHc4YIZJW8Cur6/GCbGPFWq5JHY7+ul8yVvfei8ir4ZCU1RSGaB
	 K/KKzsX1XsD/aw1hz1g7RsoWi4tDHJFptO69plwYwLmJzTEtQgiiG7zf8I9BBhEKK8
	 gA/OZ4/6DVeGcEQPxdUho2Bd97v/Wd/IJJGgJpJocLLRPRikL0DjgiMTQwlKgq2SMn
	 KyXc1oXlOfO6g==
Date: Tue, 4 Mar 2025 07:53:31 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Xuerui Wang <kernel@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	loongarch@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio
 chip compatible
Message-ID: <174109641128.2503161.2252321282895332586.robh@kernel.org>
References: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303074552.3335186-1-zhoubinbin@loongson.cn>


On Mon, 03 Mar 2025 15:45:51 +0800, Binbin Zhou wrote:
> Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
> gpio chip.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


