Return-Path: <linux-gpio+bounces-13035-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393F9C9532
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 23:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0172BB24B48
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 22:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE281B0F0C;
	Thu, 14 Nov 2024 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nq9Uz+mu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1671AF0A9;
	Thu, 14 Nov 2024 22:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623820; cv=none; b=O1TEiPQcK2YsYOl2mZYUB2InSGknFJzC6nbcKiG6l8AnrrLZrIgMwsswX2CjnpYuf7bpPHjVSYgtkM3DrY+AiwWvlis0NTOJMYigdjreN5uqhlqKM9XRxN/oEcl6kgsLi3W2WPZcum3o/+FS6ZMfkJ1a0e6pw62Cm3cZ/GaMOMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623820; c=relaxed/simple;
	bh=VTJTy1SVJgcODsQdD/PKeY87lX5ByR2rSsdTzLOIK30=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mjpdrQcYRokWrE7JDDZ4Dc23GZ4fMS5JO33V7V1b50EE9YV2wkV6/Wsq0Hk4YyHhVUjwx1No+jm4tvwrLA0qJV6S6NwR/iOml/YBJfDJRGPQm0gYkoGuK88fdLj3be4CTisg71lQeBZl4I3JUOfyu6+MTnyg1Chtn6ukFQQRlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nq9Uz+mu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDD0C4CECD;
	Thu, 14 Nov 2024 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623820;
	bh=VTJTy1SVJgcODsQdD/PKeY87lX5ByR2rSsdTzLOIK30=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nq9Uz+muqdSCjDBuI8FNwr/KYlKc2NxlES+UX0++X83CjH1uUCPRejvDuKbexNklW
	 SuleOVZY5YZvcbFKlAOzYvnSrZgUpw9RF5zTLNJ76mL5HK3eZXCeDTsK9Z29t4orlY
	 zoH8oyKjc3dUG4sn8cVfbmmZ1tvdkTe4yH9FnNBHE0s8G90WNlMvrv8TGmkfGFyFDi
	 4Ku28jmOncHaYEIGoeChuoqSvBeKmbq6iMH+WPMCtZqp9EEk90KT3g6p1WMWiO512u
	 C97DpdB3b+lzouGILrlAyUIIXJAvXjBJH36StHILNeu2kpy23ylHIqZ3IdRcMpW84c
	 b6Y8YXGrfhX7w==
Message-ID: <f908ceb40d8e77b864794c8b75dfe414.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-4-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-4-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 04/12] dt-bindings: clock: Add Marvell PXA1908 clock bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:36:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:06)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add dt bindings and documentation for the Marvell PXA1908 clock
> controller.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

