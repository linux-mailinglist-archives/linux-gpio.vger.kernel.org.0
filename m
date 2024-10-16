Return-Path: <linux-gpio+bounces-11402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543A9A0219
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 09:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23D65B21B3F
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 07:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7941AF0C0;
	Wed, 16 Oct 2024 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HG5rruuL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895FE199948;
	Wed, 16 Oct 2024 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729062378; cv=none; b=duZUeWUhoOMgH21Gsq+K7olKEqILLnCq3oWBzg99QRW3XZ9kjv8OjhVkO30514+C0qeXl2Jk/1g5xnQ1WEYMC+ckVVBNB8QG4l50kPvhOIck+GZcjZkcERz9SCkLmWKdle2tFu4s2BiImTCidmvYmgEIrPnXnU/EYga4ju0FzRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729062378; c=relaxed/simple;
	bh=pFYyMR0cUwZ+mSaMwvjsVPt56hdiCf0dos38ijLxKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omnBi4Dks0b+DnaE8+xV8yrBjUy7OUnk6EQkZFvcGXeoUQUqDKfqLCyDbc+6mLfJBX4R6BMmK5d88Pt3u1w/kTm2/Fs6Oq+vQmwuykIDJgx6SiAnrcJkh9CeohTg+7pEEcLqMm6hmPz5MbYK8jP6Bl25MdqXCKyj52Gosxd15xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HG5rruuL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1FEC4CECF;
	Wed, 16 Oct 2024 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729062378;
	bh=pFYyMR0cUwZ+mSaMwvjsVPt56hdiCf0dos38ijLxKzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HG5rruuLbh4OcOYJ50OK/4FfN2itmwt944JyTqL1VrxUp78p5Q5fiW2CyfP5pxF3n
	 tmZp6ivxGuohkAjYozZNihd0BsYSaLXUZi5lZd4XU4mu7oWq4E68TFLFnywjEx2zt2
	 kEFdGWY2O3wXWp8JRkb674err4uNN1mUYA8vqgm0jEpKLDkF6JF2R86o8mpQSVESVH
	 IfI9JmwA9Tmf6da/GrfX6XcNbciGSQk/DPMMu5URG1AJH4edUCBjqFk6fa5qGDkkEm
	 DRqQRr3ZtIK1MyoxEbBDQoFWsr8BAmNmjKHIzBTUxIFNqLzhVxbgjvQosLfB9O1kT+
	 F3gTdqdxkmB9w==
Date: Wed, 16 Oct 2024 09:06:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Add Exynos990 pinctrl and chipid drivers
Message-ID: <m7sxqsmaczjufn2jqjmo5xribsihwy4s4w7nsybub2ji62klrm@ecwv57qogd73>
References: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015210450.964093-1-igor.belwon@mentallysanemainliners.org>

On Tue, Oct 15, 2024 at 11:04:45PM +0200, Igor Belwon wrote:
> Hi folks,
> 
> This series adds support for the drivers for the Exynos 990 SoC. It
> consists of the pinctrl driver and the chipid driver. The product ID
> of this chip for chipid is 0xe9830000. The pinctrl bank types are the
> same as in the Exynos 850 chip.
> 
> Changes in v2:
>  - Moved bindings from SoC bringup commit
>  - Moved device tree changes from SoC bringup commit
>  - Ordered pinctrl nodes by unit address in SoC DT
>  - Moved the exynos990-wakeup-eint binding to the correct if.

Moved? That's not what I asked for. Are you sure you have this warning
free? That's a requirement for Samsung (see maintainer profile).

Best regards,
Krzysztof


