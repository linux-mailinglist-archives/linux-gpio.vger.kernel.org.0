Return-Path: <linux-gpio+bounces-13037-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AABA9C9538
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 23:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BC22836AF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 22:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C431B219C;
	Thu, 14 Nov 2024 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFzfQq3m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC181AC8A6;
	Thu, 14 Nov 2024 22:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623837; cv=none; b=KPlY3cExmzofVZeRz9dITJsRPpI8I4XqVZ/9CxNu1/Pe3FEk3D+89V/CpMwdvUnGqbhs0AepklofWERk2PfX6+XaAH657mrbF7FRhB0/t8h7O+2uNM1D0ssmWGcr1PK43LTzhYJGDhcMl9MpYS1yOjq+8FGskAP7PW5uFLW6+TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623837; c=relaxed/simple;
	bh=vXxdqGMJNbAakgZf80bd6MEsav7ou3gW/Zmc9xNKV5Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ZbgU+YRnkas+3gBdpN0jk3k0GB94LgMAxgF9HooekjGde1/wyQkrnVbQwzZ6jHJmt+eRIy/snJWULhrSZwYZMLQEIZEbT48qpRsQRpwdMs5W+gz53L0oZ+gIly1os8JQ/NmExvKB+5/DLLphduCVpNql/Hvjvv2IXQvWv2k3S4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFzfQq3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BA3C4CECD;
	Thu, 14 Nov 2024 22:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623836;
	bh=vXxdqGMJNbAakgZf80bd6MEsav7ou3gW/Zmc9xNKV5Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XFzfQq3mW5HTwzeyeudVkRVC0SpKnQv+MkAxYCkQ7znVfbb6+V52xA4kjYm8OrJPN
	 DnnYqbUDcP9MuVrgK+Yabs3rCbfGoTGX1qIYTSnKhBq2ixhiE0pX4ZArngIH/+J2MG
	 XqMc1H0YaX1rlJYB4qQmYcyhlZteDjxtCjuvhcoGxM7lBtoAjftf4AeFOAN1jGQS0Z
	 V+c0aSJuN+jBblHAUuLRwX53hoVN71c0G2XevGsBw6wQgFlR1/0TnCSlZtYqrKSPJ3
	 rybDI2QCTjSKfhEojutAsJ53JR8w6gDdn6kFuXj42+NGbeR1nNy5B+lGx1MIWxIhU3
	 sTCFn5Wi9l8MQ==
Message-ID: <d3768c0f91a324330051ae8f7f265e04.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-6-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-6-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 06/12] clk: mmp: Add Marvell PXA1908 APBCP driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:14 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:08)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the APBCP controller block found on Marvell's PXA1908
> SoC.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

