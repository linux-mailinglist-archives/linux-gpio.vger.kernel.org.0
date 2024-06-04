Return-Path: <linux-gpio+bounces-7135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC728FBC80
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 21:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C3241C21364
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 19:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FC2414B093;
	Tue,  4 Jun 2024 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYJ8h9+r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A414B07E;
	Tue,  4 Jun 2024 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717529278; cv=none; b=U6V/Tni+NAiRpEKNtq6ln+SdO2cMMcomjc3c4jINLFjkF2+T3LmC2T8j/ln5fEj/Q9mdxPetuVPMkF4Ly+HbkUDMoAPRyxBG/65C7+xgpo27LpUlv2qpKNtHICz8/r/2QjtyHU/IHvDQfAVVkVX0SRso9p4OG1QG4knGR+rLgM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717529278; c=relaxed/simple;
	bh=d9Fe7tsdBxmabskw4jQSMgO/96nul7G9e2ipoJZ2Z14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTK23UM7FHI4HvhH1L4hmcb115PmhT5Jmpd4KL7TKBk6pJ0nQMNyKyVggYl2rvIaJu0SqZcrRFKU/POHMvpTw6p/0f/hrFLfE4qkRjQVHpkM6ShLeFiTt6hDIxF7z0JSsPwd2Sje/a2lCwW5zAXDUHTuFgjytk4ikMhrNM88gMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYJ8h9+r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569CC4AF08;
	Tue,  4 Jun 2024 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717529277;
	bh=d9Fe7tsdBxmabskw4jQSMgO/96nul7G9e2ipoJZ2Z14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYJ8h9+r7dRuZzMFMmZpu4AU+p1FyntdgM90/jCxP0PokkSTI9DkTdIokvmc+7S0U
	 YteB3uCDBc3JbeZfi0SZVZeoapQlFXKk5TXoWKgiTu3pQBpRbMZndp+bw/HITpow3n
	 ePfhCYnfOeu//6dy38b/K12uGRuACssydB6DhHxzkYUV6v32SZL4gzBAtaYGyzZ7qQ
	 nbBs7InR1Y8WTz/PG9I6kthenMC5gDgX847nkNdtsg4ZsvXxvmQaFdt//04aLYcItI
	 OxJS0cFdV+GYcdxgQnyjTtAUUbdBJeWj5ytmFSLZdToaBOFaBgCu4YuvoheCsv11Kz
	 nmbMjkuR7/1Dg==
Date: Tue, 4 Jun 2024 14:27:55 -0500
From: Rob Herring <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: aspeed: Use block syntax for
 function and groups
Message-ID: <20240604192755.GA1065421-robh@kernel.org>
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-1-a6fe2281a1b8@codeconstruct.com.au>

On Fri, May 31, 2024 at 12:32:47PM +0930, Andrew Jeffery wrote:
> The expansion makes the documents a lot longer, but it's easier to
> review changes to functions and groups when we're not having to deal
> with line wrapping.

Do you really expect to be updating this frequently? I would leave it 
as-is, but whatever you decide.

> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---

Acked-by: Rob Herring (Arm) <robh@kernel.org>

