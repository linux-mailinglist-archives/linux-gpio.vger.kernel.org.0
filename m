Return-Path: <linux-gpio+bounces-6136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F21C8BCCD5
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 13:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FC67B21D14
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 11:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA06142913;
	Mon,  6 May 2024 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="AHD0pizr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LmDhZqq7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DADC4EB2B;
	Mon,  6 May 2024 11:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714995009; cv=none; b=FSv5opTY7AAHwI8LnvBa4pC5PsIensYWc68qjlx0RdMPbVzL4GwOUfA681FEuB7pyAyxG0naBPfpG4onQVfRgfrcIqDDQN5KcxlK9FnwGI8pNd6Uavq1RND5FvEg0aqW3J/e1JM/jEneenkVL9hDBvsUZAVeo1k3MlwS80fhvNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714995009; c=relaxed/simple;
	bh=qvCGSoQawQTxwKwTMIcTAx8d5xEdDNJuiCoB8WMClEI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=HUN0uM7xbuEznalkK+X2EX9ePElcCOQBZC4pS2vJ5C9TruYM0Dozlbc/afo/CllnKYOviaLqBJF16wES7NV/gRdBZALFdlW62wcLOMJx9xDWsU+HoNYYV7An2Ij0I3navReXx89LQt6kvm/KwSMS0WpeXFHgzav5ODBUcO7odTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=AHD0pizr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LmDhZqq7; arc=none smtp.client-ip=64.147.123.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id EACC01800139;
	Mon,  6 May 2024 07:30:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 06 May 2024 07:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714995005; x=1715081405; bh=s6x+9FStSk
	mw7vHjv+iXvtpuGZLNrdWUBFo+scPQRuU=; b=AHD0pizrJgQdHxOS42Q/D4QKdi
	cukMgjIREaL18jW6eVNU3mtIyiMNJFV0dWbbZwqjz7A9JAI6Q8SRmHDpp3/EHYrN
	zzfedo+5gcPFmtepD7mWH6dJyBAkImSl28b0R2S529P4QD3gPNoPQXE0GkfJLbni
	bcHbtznhHXH751bObyWlZVllJcOdc6r6kv2juDiQUxR9GNM7quOoL8HTNYvtEb2x
	m0CfmibODx9F0D6N3VJ99qwikzWIkgHbRVWsvr2bp+M5Iv5H+bSfZxsDwjIBn++s
	whqy2Szt7gPoUwTa38Qfw8Sro9kx7f/cMhlq3aMZq3xr0zO+YPIEH+p9N8lQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714995005; x=1715081405; bh=s6x+9FStSkmw7vHjv+iXvtpuGZLN
	rdWUBFo+scPQRuU=; b=LmDhZqq7geQ9VNHRILOo3gI5RJvQJGxeL8VVaM5An/rh
	LtwkpztUwJ392kBYoAaNVWLTYaQw19J3sFYEdSme5Y5YDv7mNGNZl0q0imMTFBPO
	UIyVnzKx4ksC1fbPKw+JqdVOZCLt9AJMt5/zBbbdHXRQp4vIIuReZwVorC0nBcs1
	xrGuE8vBurc1hvWVxvDF8idaZsmBU4O7tHVPuQRK8FMmc8+U27/0rT+AL4uBo7y5
	f+WEhDi0jKB/yneA6LWkgYFCCxwA4lhayxK5aAIn0cxco2alT5yIyTp89h5AqEyG
	IletbRxaeMKUFqDzOZk3YEjXPJcxoV/sc7VO24xamg==
X-ME-Sender: <xms:PL84ZhG2CJ47LRvE8Z0f0oI7RS-IFtnFCC95EF-yqkNb8rHH5Q2zkQ>
    <xme:PL84ZmXn6vpMMB6daj34dsfRhVIzZRgz1AOoC2Lfni8UmPbiZqACo4ooefkh-X-zv
    gTM3KdvLsDFQqTN5o0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddviedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:PL84ZjKcZcBSYJOyDf-lKjpDwcJR5r_7cWSnzd2f_K9vhXgUq4LTnQ>
    <xmx:PL84ZnHZk9R4VkiVpThqxonxMYAhPtAuT361zbNj-r0vIUunaIoccQ>
    <xmx:PL84ZnXfvgYh9t5xO0bUHgrm4-NMynO8_nj9bNnUGmHbvb-e9uvL1Q>
    <xmx:PL84ZiPfylLJxKa4OeZsppFpdbsmqGHP_KpbYLTOvv1C-8k2ahMeZg>
    <xmx:Pb84ZkWBosuE-iq_ccMnFYDgkDpdoTT83l6NuSACPF_77-HLv-M_O3El>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A5F9DB6008F; Mon,  6 May 2024 07:30:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-437-gcad818a2a-fm-20240502.001-gcad818a2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8accb26e-c7a8-43aa-90d5-d83d5a1575de@app.fastmail.com>
In-Reply-To: <20240506-imx-pinctrl-optional-v2-2-bdff75085156@geanix.com>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-2-bdff75085156@geanix.com>
Date: Mon, 06 May 2024 13:29:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Esben Haabendal" <esben@geanix.com>,
 "Russell King" <linux@armlinux.org.uk>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Dong Aisheng" <aisheng.dong@nxp.com>,
 "Jacky Bai" <ping.bai@nxp.com>, "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] pinctrl: freescale: Use CONFIG_SOC_IMXRT to guard i.MX
 RT1xxx drivers
Content-Type: text/plain

On Mon, May 6, 2024, at 12:23, Esben Haabendal wrote:
> 
>  config PINCTRL_IMXRT1050
>  	bool "IMXRT1050 pinctrl driver"
> -	depends on ARCH_MXC
> +	depends on SOC_IMXRT
> +	default SOC_IMXRT
>  	select PINCTRL_IMX
>  	help
>  	  Say Y here to enable the imxrt1050 pinctrl driver

Maybe make this

       depends on SOC_IMXRT || COMPILE_TEST

I see that all the i.MX pinctrl drivers are currently missing
this, but a lot of other platforms have the ||COMPILE_TEST 
bit so it gets included in x86 allmodconfig tests that
often gets run before sending or merging changes.

    Arnd

