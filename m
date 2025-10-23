Return-Path: <linux-gpio+bounces-27497-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0DBFF6E5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 08:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7D4B4ED933
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 06:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650B829C33F;
	Thu, 23 Oct 2025 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GHf+lrBm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57F25A2C2;
	Thu, 23 Oct 2025 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202654; cv=none; b=Tqr4APS+62/VL3H7L/hh4Lz8ncItubSMvOZwq6/KUfs/dVHbTUFQd6m3vEiuIabY9LsCyhhk//F5JRyVhxyPOQRPBbbFz/nKSespAVTNs4YVFZB7Vfjhg4wkkX6A7oYj4ohzkIr7GATFaH6VWr5mj6xeg0vIfCqprq1xDeBct6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202654; c=relaxed/simple;
	bh=KIrjlZ+uFHcYR/eeD7n/cY3o2g6NRumxDpyB7s4yf8U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DlwNbxccyrcpD6e+i1eEIRj4Xrb3Qm0xxTq03d0zDyPU2kX3+HELgnUWMBxinDX9S2ojoPxU5loGGhGNl8k3STdgiWzFe15V8rpjlACB2vCMu7BqUqa5eyExAo0Pzi8mbz6pQCnMMQXXjR50zCIJrSwyRUVYnBst9tbewuZDBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GHf+lrBm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F168C0C407;
	Thu, 23 Oct 2025 06:57:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD1096062C;
	Thu, 23 Oct 2025 06:57:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D715E102F2408;
	Thu, 23 Oct 2025 08:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761202649; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dLoS84sI3WPajohaQC0KpHU4wyA5Vb0hbn/MruTGk+s=;
	b=GHf+lrBmpBmgVdtkZP91sFj0DpTN9geFzGA8ihLfWcHmArhd6VWJst+JG8qh1FxhuQHEfq
	/FqHEo7Fy+mAH5T1VBkCdCLtyXBbu+FE0Ou5cvPTdGwIW7tRjKG6AusfdfwAzCRjMm6aVa
	q2lmsxG3Ofyg6wfl+uQFbV/VAE6G9fswgMhd35cGSUWwwkemjHH0VzhJzaMG0WAHC/wCxD
	ZtJviPDLQyk0ZO4/QxwkXgjpalb7AyfA6mLfuVK/0kuy+tX5KoSpixXiYG70OMsRXiPT0n
	91zS7OrSUgqFJsSkBq7XvGK/ZDBg8VEU/R2dZdwlNphzin27YN9luDeR0LVD8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Linus Walleij <linus.walleij@linaro.org>,  Richard Cochran
 <richardcochran@gmail.com>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  linux-gpio@vger.kernel.org,
  netdev@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: Convert Marvell CP110 System
 Controller to DT schema
In-Reply-To: <20251022165509.3917655-2-robh@kernel.org> (Rob Herring's message
	of "Wed, 22 Oct 2025 11:55:08 -0500")
References: <20251022165509.3917655-2-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 23 Oct 2025 08:57:20 +0200
Message-ID: <87ms5iqf5b.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Rob,

> Convert the Marvell CP110 System Controller binding to DT schema
> format.
>
> There's not any specific compatible for the whole block which is a
> separate problem, so just the child nodes are documented. Only the
> pinctrl and clock child nodes need to be converted as the GPIO node
> already has a schema.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

[...]

> +  "#clock-cells":
> +    const: 2
> +    description: >

I am surprised you prefer a description to a constraint expressed with
yaml. Yet, I am totally fine with it.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

