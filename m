Return-Path: <linux-gpio+bounces-8466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 176F7941789
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 18:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96B90B25A04
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 16:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5AB2183CD5;
	Tue, 30 Jul 2024 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ot/qMUX5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8134A184535;
	Tue, 30 Jul 2024 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355787; cv=none; b=fLWujrqRI4C/PFurlBbPnZCse5lU9UhZuIdlJxl2pH6wL3jHMuvZO/Fs2O+gQh4aHVb4zRMNWboaGmcPZh6IExeIWbWTi0nqNqs1bAbImwflyfiq4Wf5k/iHTgBg4sSXdMk5f/UiRjM2O4vPO5IreFYzeWtBnH9Y/pN95Y4LDwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355787; c=relaxed/simple;
	bh=/COP5d4lcWWm1MPCW33JkqIwJpoFVmcdzXmXsC3yKgM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qbRic7BryOSkaf6uBhfwpJwrJ9H0GgC8L5pAM+zXNEfBV67d0/w2msqyFHHfm0TgEgTKUE3X7b91Rei6ZD4mN2yGYgsMbub9RJKglq9xKa52FCva/rqp+MaJnhUiPBo9vCed09l6U+FNEu5Jt5GusLbmIHI2RaRM7UFuTbLdfhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ot/qMUX5; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 991B41C0003;
	Tue, 30 Jul 2024 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722355778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/COP5d4lcWWm1MPCW33JkqIwJpoFVmcdzXmXsC3yKgM=;
	b=Ot/qMUX5Wl8TuolPF3Q3e34haHtoENDlSlggWsFdsxVnMh4YQB2DcGgFdH3+dHHImE77XE
	KwDRgayvZdzn2SiFn8z82Yn9Ni2czG0tfoYbU7fkpobX+eR8zBRKhjg/b5kQ3Ay94xgB+Q
	NQ9XDSAYeONEHkxvz9K7Jr5vgizwz6us4TR6b6Bo1eoplW+Cp/NK4K6QTyEgQ3fhIYAx5t
	8eYNeLfXro7Dmxqkm1OOMkcNJyA8eibyWjRRyRkCxXsCDqMqBNiPUje2wZo1mGrjqxNANA
	23eWAaeuHxaPPBiVEDK0QCNT10iLJqUUaZX1tqTIADzuch9Jfoy3l4HRya9PqQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jul 2024 18:09:37 +0200
Message-Id: <D33060WY0OJ5.1UQYALBQ8A6QG@bootlin.com>
Subject: Re: [PATCH RESEND v2 0/2] Add Mobileye EyeQ5 pinctrl support
Cc: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240730-mbly-pinctrl-v2-0-d470f64e0395@bootlin.com>
In-Reply-To: <20240730-mbly-pinctrl-v2-0-d470f64e0395@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello all,

On Tue Jul 30, 2024 at 6:08 PM CEST, Th=C3=A9o Lebrun wrote:
> This series adds a driver handling EyeQ5 (and only EyeQ5, not EyeQ6L nor
> EyeQ6H) SoC pin config and muxing. It is an auxiliary driver being
> instantiated by the platform clk driver.

This is a friendly RESEND of the Mobileye system-controller pinctrl
series. It can rebase on v6.11-rc1 without issues, and it works as
expected on real hardware.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


