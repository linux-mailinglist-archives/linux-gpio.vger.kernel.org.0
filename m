Return-Path: <linux-gpio+bounces-29358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B502CAC28F
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 07:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14511304A7D2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 06:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803FA315D46;
	Mon,  8 Dec 2025 06:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="km20+9PI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383B6315D33;
	Mon,  8 Dec 2025 06:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175106; cv=none; b=Yo4Wo3vi/s8EwNMwD6Fc7mJiIK1UYvL/JjUmOK2zux0q8+5x0dZNL+8b8pw6J0vgcpBldI8F9J+FDLEtKmAadPeq4YVXNfy2yLxNpqPsUCfsAygMLrt8iz2jzkr6LllNVKsl2HuJZZ/AybQqgwA4cev4/ZQWWXaHiS0Rh8/1ZnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175106; c=relaxed/simple;
	bh=hPTzVBaqEy6TULFAz5dE1caK6KjuW23EPXH/+kI6e3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFaZ1q0ZtlXtWK6EJ/y3gkvTy0NB1s0qaNPCL+YSx5+qpMk3wRjpPXyCrgl7p6NT4KWEFuwkclbteuCjA8MIdXJTY+XRCzbzIOtdKbKM9wAX4xDrnAF7pdFdsI+eltydrwymxuoActh8UH79egGq8VUPADhyDyta08kzClYYFOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=km20+9PI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D39EC4CEF1;
	Mon,  8 Dec 2025 06:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765175105;
	bh=hPTzVBaqEy6TULFAz5dE1caK6KjuW23EPXH/+kI6e3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=km20+9PIg/iViZ0NYE8uaRiyLaTbKSmgch3obiYfXVs+ozkiZJZ8arJC9IiSsgUYQ
	 neZTOdq7bafg4OT0DtMcMQBK7ztBDzbIa/0ByW/WS6A4BwJLxETD15VmYJIPjLPpjq
	 Qpvb2cOkraeDtYJEMJTSlzq1H5FTOKcLM5PCjLchseIJSbwcoYlJFVyLfnheKoKlDC
	 vnqDOyoYkXh1T2Tl0iRBoUw/Tfd04RgMNQ8UiH39UXVt3C4U65uagIDNjNalWUj2ou
	 Vwt7db1NHtAZ8mOieOY17dMqF7uqV0YpB8EkOX/iaEJRjv68xP1kRNv7Rm1U3vqHyV
	 RCsM+/6YfqevA==
Date: Mon, 8 Dec 2025 07:25:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: Add rv1126b pinctrl support
Message-ID: <20251208-snobbish-curvy-mouse-67fafe@quoll>
References: <20251206050844.402958-1-ye.zhang@rock-chips.com>
 <20251206050844.402958-4-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251206050844.402958-4-ye.zhang@rock-chips.com>

On Sat, Dec 06, 2025 at 01:08:39PM +0800, Ye Zhang wrote:
> Add the compatible string for the rv1126b SoC.

Why? What is the difference against existing one? Please write useful
commit msgs, not something obvious being copy of the diff and subject.

Best regards,
Krzysztof


