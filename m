Return-Path: <linux-gpio+bounces-10189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF997A3D7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 16:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8CA01F29352
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 14:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C987C158DC0;
	Mon, 16 Sep 2024 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDjiX8c1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4D8BE6C;
	Mon, 16 Sep 2024 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726495729; cv=none; b=jgrTUcKkvlU0Pf5xgEgJmwLDK1GxaMc07gcVFXxMIXUlykQMsfjmDsFjgwB/n6NvKahSq50229beckBT242iSeZp9I8Pld4cr0rf2mIyQi+j199xnDn/t2QjSmV42VpYMPiZEZFLVAbu66+N9EQqyYDXO3qML6sWgRXImptocKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726495729; c=relaxed/simple;
	bh=Jb2NTLhstIDR0TImGhGWobDSUWbAUFcRbmBh5VTPyTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wmo2YUWzD91F0Ick43QvIOtYwnBvWOPXg9xkAL4IjvtXBMo7NIBLd+rTUnbIJdn/OXjO07rG35ixtIg3C99/sgGFkK4xL/ogKgcGMjEYhxxHdvg8rVJopulpQwtN1duGJF+RR84W3CiFYmS/GYiI+xmxgy6ant0jUaXz/5IISKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDjiX8c1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7579FC4CEC4;
	Mon, 16 Sep 2024 14:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726495729;
	bh=Jb2NTLhstIDR0TImGhGWobDSUWbAUFcRbmBh5VTPyTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eDjiX8c1WtGgctvx56n5/u9reOmmNm09Fme4I7qEL1pajF4oyON2jNXen+UnNV+NJ
	 zNgo4zmqBkOGWp35iwyENf7aW5eF8Lv+jFKGyYNQYL5et/7NcUwSalSDfcVwMA+SrZ
	 GvSZbGgKfeNlNHQl6E659Lq8DsxbM0CIWmH8nlKzbB6h9MFZmfQblMKSxe+abOu3Yb
	 u/hbCQwxRE12S1GCWfz57huWRaegeLcixFF1C8NO0m6bXrORqCfG3AssRgcH7ISiiY
	 OHoknS3N6pJTUcp0McyxVPr7vf1fOEhrLsyL0jN2EDCVpL//AtQ2Y2nALO0h6VK8Op
	 NLdlN4A3l4xcA==
Date: Mon, 16 Sep 2024 16:08:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M2
Message-ID: <rhto5dzrw3g3g6hah42qrjnrrqo5qwbk6mcuw4ykouxzmo2apt@zebs5aof7to2>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
 <20240909110017.419960-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909110017.419960-2-ivo.ivanov.ivanov1@gmail.com>

On Mon, Sep 09, 2024 at 02:00:08PM +0300, Ivaylo Ivanov wrote:
> Add a compatible for the Samsung Mongoose M2, found in exynos8895.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

I'll grab this one after the merge window.

Best regards,
Krzysztof


