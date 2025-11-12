Return-Path: <linux-gpio+bounces-28383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D31AC518FC
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 11:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 724484227DB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BC73019C5;
	Wed, 12 Nov 2025 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBMVowPt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770E3280025;
	Wed, 12 Nov 2025 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762941064; cv=none; b=JdrLcYZf5uy/cIoYoFWVeUQOdhYmK2Qfq92z8FpPPRifVmK6bJv0twzczG0xk0CURTu60KDLo3P09b8uPZ97ZGsb46ezXccECTmyLUsqrUj982z12E2tdsNnW/N1zMP/OZG2DoduTT3pz8igLr3vrdut1K/Y7W4r/w8kSrFg9IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762941064; c=relaxed/simple;
	bh=qI1ZCOjECs89IEuODLO9Awg0CVwjT8XOpU9kA8tvTyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIjmOaOYkaJRVOwaLnOWN/V9H0jwx5uWX1mvVcZvyn0NOFXwc3BOeBeJj3XpyFOJpeivx/8wJiXrJvH6I8EU+bJFMiRj0vbCmJoYPnidFuy3IXNhpHCNL4sDLCseSXxdzG5T9+L2nVUkme2sN2C9xBnmZwMzfIEyjG4lVJ4iBsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBMVowPt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED75C4CEF8;
	Wed, 12 Nov 2025 09:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762941064;
	bh=qI1ZCOjECs89IEuODLO9Awg0CVwjT8XOpU9kA8tvTyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBMVowPtBB19uVe53JssvPV+3K6JElRFgrm76O1qFGyi4PBlJ/jWYRHdQ8RrOJRoF
	 v79bgkmIHXMaUdApjR+vTJZ+Oe2DW4OMmCZc/T+7XQ0e88oV/VeSerX9u1rbgcOMUJ
	 zxtTu+LiWR+SVrR5/UMDE34csitd7m+iYceJVKCD6sW5gLt1JaEtOTekFKbSsy0zMQ
	 RSGzgRqOrMXAvhUghyJG+x/YLQ10YsSr2z8MUEyTpqqCR9m9Hm5D7if1M9D1geia5e
	 LUPcBlEll5NBq0e3QlsrhVPRisutOhiZgSl4S2EkPH0mGb2lfhsppKs/VBattKm4Pk
	 fhOiuNTqtkjHQ==
Date: Wed, 12 Nov 2025 10:51:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 02/20] regulator: dt-bindings: add s2mpg10-pmic
 regulators
Message-ID: <20251112-gainful-flashy-seal-f2c5dc@kuoka>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
 <20251110-s2mpg1x-regulators-v4-2-94c9e726d4ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110-s2mpg1x-regulators-v4-2-94c9e726d4ba@linaro.org>

On Mon, Nov 10, 2025 at 07:28:45PM +0000, Andr=C3=A9 Draszik wrote:
> The S2MPG10 PMIC is a Power Management IC for mobile applications with
> buck converters, various LDOs, power meters, RTC, clock outputs, and
> additional GPIO interfaces.
>=20
> It has 10 buck and 31 LDO rails. Several of these can either be
> controlled via software (register writes) or via external signals, in
> particular by:
>     * one out of several input pins connected to a main processor's:
>         *  GPIO pins
>         * other pins that are e.g. firmware- or power-domain-controlled
>           without explicit driver intervention
>     * a combination of input pins and register writes.
>=20
> Control via input pins allows PMIC rails to be controlled by firmware,
> e.g. during standby/suspend, or as part of power domain handling where
> otherwise that would not be possible. Additionally toggling a pin is
> faster than register writes, and it also allows the PMIC to ensure that
> any necessary timing requirements between rails are respected
> automatically if multiple rails are to be enabled or disabled quasi
> simultaneously.
>=20
> While external control via input pins appears to exist on other
> versions of this PMIC, there is more flexibility in this version, in
> particular there is a selection of input pins to choose from for each
> rail (which must therefore be configured accordingly if in use),
> whereas other versions don't have this flexibility.
>=20
> Add documentation related to the regulator (buck & ldo) parts like
> devicetree definitions, regulator naming patterns, and additional
> properties.
>=20
> S2MPG10 is typically used as the main-PMIC together with an S2MPG11
> PMIC in a main/sub configuration, hence the datasheet and the binding
> both suffix the rails with an 'm'.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---

What is the base of this? base-commit from cover letter:
fatal: bad object ab40c92c74c6b0c611c89516794502b3a3173966

I am asking because `b4 diff` fails:

b4 diff '20251110-s2mpg1x-regulators-v4-2-94c9e726d4ba@linaro.org'
Grabbing thread from lore.kernel.org/all/20251110-s2mpg1x-regulators-v4-2-9=
4c9e726d4ba@linaro.org/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v3: 21 patches
---
Analyzing 83 messages in the thread
Preparing fake-am for v3: dt-bindings: firmware: google,gs101-acpm-ipc: con=
vert regulators to lowercase
ERROR: Could not write fake-am tree
---
Could not create fake-am range for lower series v3


Best regards,
Krzysztof


