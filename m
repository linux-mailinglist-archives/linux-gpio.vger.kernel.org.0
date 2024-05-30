Return-Path: <linux-gpio+bounces-6893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA668D4282
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 02:51:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 069E1B2501D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 00:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9956DDDA0;
	Thu, 30 May 2024 00:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="PhjK3SC4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B366A23B1;
	Thu, 30 May 2024 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717030280; cv=none; b=D45wu91Sgw6f5NFub7oIazr8jFLTiR1tjorBCvsQ7WsyPoIYqhZ86k50Fn5Prj+R8bQEPry2J7Ye/vwE3KRiVVslFfgmYv3gmjvN76oFozbCb9NYOBCp7ybNeQa2stF+4FtXss+q2lHlvw781ugPdbS5crwSsyHb5rupucQ6ahE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717030280; c=relaxed/simple;
	bh=I+Jt+udxkxLDKi4W/Bzi1caUOt8FQXDEn4VOX4aEVRU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rD9o8sfwJLkc6H8Aepdpw9jZHmV1G//ijtZEQXGIk75sIzDzTtq0LnPSmMLk4vjDF9O4ladS3fJgq80LvON5FTupP2/zJd8efg0GD/LsOM6jLF2DiIuffFw6RSmtyIVBUJOY9Pop8itdEgXR7QAqvMgVUlMzQ6u3D+bLFAcmavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=PhjK3SC4; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 060912012A;
	Thu, 30 May 2024 08:51:15 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717030276;
	bh=I+Jt+udxkxLDKi4W/Bzi1caUOt8FQXDEn4VOX4aEVRU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PhjK3SC4A8NA+0dUQW7/PxHfqhTqOmLfS0LUmZtAmYgU9g84HS9NDxLylx2ooEOhq
	 9QXi0rQiw15L5gh/Uar85HJBRPF/vZCmY95lDQuUETo1KgHf28DI09FXfvFgRa7+Jt
	 Z4N1eicE90MIkEbJmDGHSkrcasv2rXYahN1+r5ioVz8fFP9nZxUt+aWkcsU9OoGJ7D
	 sidaVkD8ipqgYheETX7tN0wCwFoczSwdmOUyxjqUwbwSihM5HPc5aHOSyO8qNTStcR
	 v7HNVtquzssw/CYm6VTWKJamrs7VXmWDoGto4zGnoQ/2zv4XNsAXaJJVjYBZcFpBfQ
	 33XqJkEXLtEng==
Message-ID: <91f9d528649b967e7499f1e85b83da03b8a0f5d0.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/4] dt-bindings: gpio: aspeed,sgpio: Specify
 gpio-line-names
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 30 May 2024 10:21:15 +0930
In-Reply-To: <5d0016f1-ccdc-4645-9840-6f8c2870ef6c@kernel.org>
References: 
	<20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au>
	 <20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-2-91c42976833b@codeconstruct.com.au>
	 <5d0016f1-ccdc-4645-9840-6f8c2870ef6c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 09:27 +0200, Krzysztof Kozlowski wrote:
> On 29/05/2024 07:13, Andrew Jeffery wrote:
> > Some devicetrees specify gpio-line-names in the sgpio node despite it
> > not being defined by the binding. It's a reasonable thing to do, so
> > define the property to squash warnings such as:
> >=20
> > ```
>=20
> No need for ```
>=20
> This is just commit log. Not markdown.

I'm going to do a v2 anyway, so I'll drop the markup.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,

Andrew

