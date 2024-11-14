Return-Path: <linux-gpio+bounces-13038-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56239C953C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 23:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9738C283336
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 22:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3925C1B3724;
	Thu, 14 Nov 2024 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpKq2wYx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E40170A1B;
	Thu, 14 Nov 2024 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731623845; cv=none; b=t1IesaMVSHpPzg6l4nMI6CEaROeOKXQi184miL/PjkUcyQ7q+J4o8p8b574q7qelR2roae/6+7swoky9rt1NDXUl5U2tf/bwH9nuEnmjbgdQuQ/7NZhB54zMbj7vV4udN6COMuRlsSYA5eUlQd2IGBiKveFC+yna84rlOaKWgmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731623845; c=relaxed/simple;
	bh=S5TwThJkD0kdeyGwJsp2uFGfaqoGf9VNif44eGvx3B4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=M6t5Fy3/HMTnOKMui7VBXYYNVBzP+TIy1LStYEKB1DzTsqxiZu8s9/PG8FzIiUY4H1nMC+ZgXa26ULPOEMpbs0ijdajLkdiDB/L184lyM8Owtwbtz/lOqXIxj1G6cyBPDyEFVgS30+DnbDf92Aa9HyDUEqjYaK6yE5GYfiFe3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpKq2wYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B04EC4CECD;
	Thu, 14 Nov 2024 22:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731623844;
	bh=S5TwThJkD0kdeyGwJsp2uFGfaqoGf9VNif44eGvx3B4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kpKq2wYxLqL+0pK+eDgbWuFm3rQlF3oYQ6zTbIN8CdkpnKshvYrjoVIkCOgxDIWOd
	 sd3yTsMbpGxp2qMJZ/Ph+o7ZRM8sPioUEOF5b3VK+8dRrU5MPbXNX6mINv7V7Fo2st
	 qlFMkDY0XhZ9W2kEB01HtH5cWRiySCzK9jsIU+tTqKVE1aVBMSfqJkEMLhxqmtSoRz
	 Rg+oT+JvDMvm3jTl8I6aXxn/zlmkwKmoK4NriF7n2BNy/KDcDHDUIZph/lBLVxGk1R
	 gpBUmCfTo2gWN4qB/U41Nvu16UxeGSjb0HyBW8quONDMIK3aruXg7jbQ89pf4eVEEz
	 ZthYB/9DUbwNw==
Message-ID: <9bfc25cc0d99ad124aa22c98f9611689.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241104-pxa1908-lkml-v13-7-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-0-e050609b8d6c@skole.hr> <20241104-pxa1908-lkml-v13-7-e050609b8d6c@skole.hr>
Subject: Re: [PATCH RESEND v13 07/12] clk: mmp: Add Marvell PXA1908 APMU driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Duje =?utf-8?q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, Duje =?utf-8?q?Mihanovi=C4=87?= via B4 Relay <devnull+duje.mihanovic.skole.hr@kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Lubomir Rintel <lkundrak@v3.sk>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, Will Deacon <will@kernel.org>
Date: Thu, 14 Nov 2024 14:37:22 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Duje Mihanovi=C4=87 via B4 Relay (2024-11-04 08:37:09)
> From: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
>=20
> Add driver for the APMU controller block found on Marvell's PXA1908 SoC.
> This driver is incomplete, lacking support for (at least) GPU, VPU, DSI
> and CCIC (camera related) clocks.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
> ---

Applied to clk-next

