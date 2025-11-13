Return-Path: <linux-gpio+bounces-28423-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B96FC5664D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 09:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC35B3BAB35
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 08:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B004A33469F;
	Thu, 13 Nov 2025 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="UbX4QYFO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hLD5WtIA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500CC3321B8;
	Thu, 13 Nov 2025 08:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023938; cv=none; b=J7ObqUYub/GgXl+Kk6iepd1HkYLag+J4JF5urRYrHIssjv8hTVCbSR83qsfSF4tk+JQ9oqEg0K6rT/93x7NglMvaTo5Jq2e9jcXnegaETaz1HhZz5QKxSAIKO2Xp67h1fkrx69K9KCNBzUmT8PSM1II1ioG9bYhcHXAo7lMuNq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023938; c=relaxed/simple;
	bh=jYMUekvRtMYJKAY6x3e543kfQ1fKTe+PgZU/W9oNQzk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ls3yNSLJDroOQa1r34iH90fq2ReJnzyVoGJXxo2phY2DHyHOsSVX507VL9/PhbNeKpkB1m7B1vElEpCsmqSt2PgrysCQwM3F3GzXnPkhj4D3ZIar4kNSA4OhiZqlqCO4lCtxivUHYUb2NzzLUZx+/akss/VHkpi/+/6WiEbDYkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=UbX4QYFO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hLD5WtIA; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 259BEEC0197;
	Thu, 13 Nov 2025 03:52:14 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 13 Nov 2025 03:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1763023934;
	 x=1763110334; bh=jYMUekvRtMYJKAY6x3e543kfQ1fKTe+PgZU/W9oNQzk=; b=
	UbX4QYFOHS7kBbZS2klHc11vV1MJMf5lbQVdafBWQWU2pgA+NC+fizZmjkIrCSwh
	wqdJk5AsI2DXuYps4ryvp3Dzhf0fGJSgTU0WgjDG0MgxPryNQabHxRNzkg0HomdK
	W4SYLV0n7IfnrryUMT2UuV5M65dPRyN52tqbcYG6ofaCaIVF6KkVTMqbiYNXJHjH
	6c2esTorgdgrLj0A1dVnRbdXAH0TKej8dS3wHcbG3uBNetqocpex9jC4I4fX7nZ5
	bokmnQ7kU99Haav5uZNLDKCrv1zteDZ1wTz10xbla6R1q0yhpy0z3EHTQ5tB9ILj
	3SV0mnOud9k5bldu+5/7zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763023934; x=
	1763110334; bh=jYMUekvRtMYJKAY6x3e543kfQ1fKTe+PgZU/W9oNQzk=; b=h
	LD5WtIAtxI6L/j83lw5/ymPmaVx9Tm4CvHRo0fZPueushTVf7/j6zKpOVX9B5o9M
	oFWQ+MoggvqmotadRqh286mTw8cfI4ckR0IOOTH/xTX9DVVyGZ1rVb+n4Aiku4Fe
	kT/bJ9R+8EnAfN2aLOYFsbhV7drBsRGWC1BVC50CPHTZOAP1YezEmb0aJlnZ77n+
	dNSwcOldg5s1I9KIb97xasxHCo1XXybw6RrwowmL3yHL9XlMoU17gafUGTATfWiM
	guzZunISesGzK7hNqwcft16r7a+5MPbqEOUxcNo4DJdxihKCFYNnVu20e0L1XVQA
	+j3XhI4GjgkUphxdluhgQ==
X-ME-Sender: <xms:PZwVabJh48yaDBPI1bi__mlNjPtlpGae6bubQDE-xcYKfV4gEaqqeg>
    <xme:PZwVaZ9YPc6-Yuww52iuSMIVyQCkSa85HAWyp-WnCnz8TpfeJoi9VNgW04pPhSpRI
    JSbRRSLCAdBDLVT8po1glFCn6KAEbwnmyC69V4CvkdBLsffmlKXoHc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegumhhithhrhidrthho
    rhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesgh
    hmrghilhdrtghomhdprhgtphhtthhopehsrghrrghvrghnrghksehgohhoghhlvgdrtgho
    mhdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsghrohhonhhivgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PZwVaWR2j3NHIh-HnpFZRzycEiSbyzOLYaMdGFGYZlqw57s1gjDgSQ>
    <xmx:PZwVacPWQToEZFGpspzQ3hBahW0MV4HIWcMBiM03k-oNFg8JfSmXvA>
    <xmx:PZwVaavlkeWD_mmw9tjdXSgH3y081ty-xIBFei22wZd3-XSNZAyFxw>
    <xmx:PZwVaYTbLS79eXhLy0E95xLJuKpP95NCLqJstCZ1sG9VIldoxwViVA>
    <xmx:PpwVaaHpABdLi6z7_2kjSTe68Uj_yDTY3ILn6PPpGu0XsNZBCcaTQDvH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 152DA700054; Thu, 13 Nov 2025 03:52:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbaJD8fJSN-F
Date: Thu, 13 Nov 2025 09:51:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Kees Cook" <kees@kernel.org>,
 "Mika Westerberg" <westeri@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Alexey Klimov" <alexey.klimov@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <c9be32d5-a2a0-420b-9308-5f0a19a07eea@app.fastmail.com>
In-Reply-To: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 12, 2025, at 14:55, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some qualcomm platforms use shared GPIOs. Enable support for them by
> selecting the Kconfig switch provided by GPIOLIB.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Please take this through the gpio and asoc trees for simplicity.

