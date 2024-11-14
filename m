Return-Path: <linux-gpio+bounces-13036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C99C9535
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 23:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63435B24F00
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 22:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E521B0F2D;
	Thu, 14 Nov 2024 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1d0xC8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950961B0F2E;
	Thu, 14 Nov 2024 22:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623829; cv=none; b=ZL4ln0oWZXB9jhtzuWHLcxjo5clQYtvsk3csSB39L2LzNiN6qtunOoxI+HboDge+CG4i+gI/K2FId7Wj5VWQqVZdhWBpMikBDmMfazZjkdBaUp+XUowozBm2SJi569wymkIGAfal42WhaoN/Dc8Y57HwrEyTM++3+tNW0CSYU4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623829; c=relaxed/simple;
	bh=2DDE90TFUQidus4+uXN8t4eq4f+vB4yKXP8N40Q9rDE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=SjaQde7yoa0PPxqaAD4UC/EeUcN5GF3sVknzmv+lFbEdBolS3K4mNkPSayO4m80kE+nIHlGxtJHhPobuuOYaKxNXH2hOKmKwkWKrDAuz70cmg9iDuMZHLdxcGyWPar9smdy9ih9CSy8PCcYfvhetz9QoKgQ/bQRyExX67txoXD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1d0xC8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F769C4CECD;
	Thu, 14 Nov 2024 22:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623829;
	bh=2DDE90TFUQidus4+uXN8t4eq4f+vB4yKXP8N40Q9rDE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n1d0xC8eYss7liYDfNWOqdcx8/q2b8uLBUXXbncBy4Q2gJWW5A0CE71ouZS2MTDNP
	 SS1T3pMINoCCIVjB2XNGMbaX6QIl+qAXoCiQjjQrxtcGfQZyh4QFFTeIGaewMbcxcD
	 6IG2UiO5Bsfk1azzdjUmlcZ67Sgnd7uIQc+Cr0CqYpXDzgU1ZCB03L7wAJx1t+8tml
	 osWEzPSZW9hot5sQOm4pGhQLEfwQNO1Fb1kCyCLcRI9LPwUqma/v6MJvl53HQbuutA
	 y3wrDbUJp8bQ2rLFy5/qWYaqmECbaBWUjyDmkOJc/or7WCYTImpHRUM1dKpXON9yVi
	 rGLTRn45ItsFw==
Message-ID: <a69fc43dfe76861e293a936de3e0443e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-5-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-5-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 05/12] clk: mmp: Add Marvell PXA1908 APBC driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:07 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:07)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the APBC controller block found on Marvell's PXA1908 SoC.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

