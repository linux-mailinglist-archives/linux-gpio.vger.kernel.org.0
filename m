Return-Path: <linux-gpio+bounces-15815-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864CA31F13
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 07:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C1F1687C8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53BA1FF7D9;
	Wed, 12 Feb 2025 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jt5ulpJU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8980D1FBCB4;
	Wed, 12 Feb 2025 06:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739342055; cv=none; b=BTkyIksCiL9bHcMFxpqJDLKFAtCEOStnEANhDc99CAIoDBDyLGxvhFn71Svx0BIsJnBn3CUONhjcRKSqoVEQgyfC9O6oSufuwxxOmJOwHeidWWFHzviF7X54OM/GtTEf3c4zl/9JVw8qyJRZYMh7QkrmzeCrANhFPVKdm8nxvcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739342055; c=relaxed/simple;
	bh=mqpBTZRZBclHq/4daUShfVh6RyFuAyq8yu2I/Tc1JVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fF4RznAo4VYq+y+dRmKsOZcruCsS4WeJdtg2fJIYEGjfJ+tSyELPBaBH8h8hY0D+FM0K4LPvMQdfU0B1RTQDMhbWjckSXTXXyzhYy/YGA2NTJkMmvlQMK456gP36RMZ1L2IMsi5nPeGSUB+uzftiTHmWxsArhl7uMSR3XnYpRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jt5ulpJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22285C4CEDF;
	Wed, 12 Feb 2025 06:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342055;
	bh=mqpBTZRZBclHq/4daUShfVh6RyFuAyq8yu2I/Tc1JVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jt5ulpJUHHa5n5o4SmEaip/l+hB25Ktvp2pdKF+mvBeChYObCZYD/dp0bUUppqnd8
	 iyWgo1ewT+acLL84entMCR3f911i5/7QaBpZsHc+VwOqYQOsuadr2bPbRdQmOZ/T/e
	 8Twgl6e9o4A6jcALSTdGOXnA+1ky9AKf895jEbFfEHQF2kihkWMxyD5p8dIniPkiTq
	 ReH0S4VAIX0BaDs+ZPCBm3OnDOXvUAkRBtp4GgXB+Iih462NMrFx2aFmmuO9X91Z8H
	 2+5Qu28fLBd8oU4LWY5ZjywZi93XNS40nNJ5m/x3j5U7D3IxChKElNi8TNKPRexskI
	 S0hPdGNUe1qwg==
Date: Wed, 12 Feb 2025 07:34:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: clock: gcc-msm8917: Split to separate
 schema
Message-ID: <20250212-uppish-stimulating-swine-4e605e@krzk-bin>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-1-7d27ed67f708@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250211-msm8937-v1-1-7d27ed67f708@mainlining.org>

On Tue, Feb 11, 2025 at 11:37:45PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> +maintainers:
> +  - Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> +
> +description: |
> +  Qualcomm global clock control module provides the clocks, resets and p=
ower
> +  domains on MSM8917 or QM215.
> +
> +  See also:: include/dt-bindings/clock/qcom,gcc-msm8917.h
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,gcc-msm8917
> +      - qcom,gcc-qm215
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Sleep clock source
> +      - description: DSI phy instance 0 dsi clock
> +      - description: DSI phy instance 0 byte clock


I do not understand. It is exactly the same as old (before split).

Best regards,
Krzysztof


