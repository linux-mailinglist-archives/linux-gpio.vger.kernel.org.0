Return-Path: <linux-gpio+bounces-1458-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 103CE81307B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 13:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A468AB20AF7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Dec 2023 12:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA424D132;
	Thu, 14 Dec 2023 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ZVA1sBdq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LvgBuNts"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33569115;
	Thu, 14 Dec 2023 04:44:46 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8AF3B5C01D7;
	Thu, 14 Dec 2023 07:44:45 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 14 Dec 2023 07:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702557885; x=1702644285; bh=za/OAT69wn
	c7BLz2bnsJg1QyrBYVJ8cVLLHhz6zgSpU=; b=ZVA1sBdqV1eibDLWiWeugcQgoA
	qlJ79ZZaPI+VlNN3T+oNl08cLfM8Y7tV9w3o3E32JoTVuwforRf3u0KBGt9GjZWu
	ph+s95cK9Ye4F9cYcdkNT5SG318/6cXbIWscnsxmvEJVwdjr2Uv4f4OgtnFfiwl8
	pil2OpE02p6qJzQj1WZ9FAedGSddtUoEL1QsY2v0Aah0N3X9pM0b3BaHC81OMvOv
	XtUzgO6Eb1r222+JjyZzOa1h5ZsUtAERo7hIM8OgarCLPU24rR1bmON/cfp/rB+T
	RIn7XpjJiuTR71QR/rwLEjV+di6X9hZ1nnnnvOvI7nvzxC/l9wP+P5CleXyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702557885; x=1702644285; bh=za/OAT69wnc7BLz2bnsJg1QyrBYV
	J8cVLLHhz6zgSpU=; b=LvgBuNtsSv4JTWPvLOveZJ0pVOjDwtgdXDFvgjV30iuA
	mpBdOiD33FQGMZkGi5Fj9TDDDE9mwc99c9WP0b85TaS5nL2Zng3xDYip8UGcMJer
	STHQhxoPAzuFlAQx2Un63j5aOIOOsEWUkRe0UTZWspTedRdBvzw+J6LtHXcgj93M
	DDizkS4ayBT76HGBvlCS2ax390CLj0+7lsPa4q3/tvTvHfhBx/rhHAtmXgbDt7/U
	DyqQBlIfpQdiTNllPfzeF7fEo/aHCfdGFA9WIX4sgh83TyFgHoczqkRJF8JPTv8P
	uCwWl7D9DzMsMs4oiI7PDQdCtkYoB8LBkcFAZafivw==
X-ME-Sender: <xms:vPh6ZaXh20vV4GYCo-V_F_r4_XpaNqbc_CjJEEYXdPO2fTRZw1Xxog>
    <xme:vPh6ZWltaztuyZOAN1qUKmXJ3RtoHGK2Bur5SF7W6PsNQP-cqjg72oz_I_7ydkIXj
    _x6ZVOTO0-qaRpd5uI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:vPh6ZeZDNrMq7wSaRR4gtTLU-tMY4_yquxgg1y_n_AITHdMGMgjEBg>
    <xmx:vPh6ZRX5BmBt_RE_Wi0TUuMA0O_q_8bfpB41BiROv59YqJ95XNn2tw>
    <xmx:vPh6ZUmwYDhuxTghGVJOPUbFzhjmBUwwNC0rhCKubG8JfHKPX5iqmQ>
    <xmx:vfh6ZSm4Lmlh2HSSLfaRIuSAqKUl2JB4-DRvaHjEuDDxiHx0S5NPcg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CACBCB6008D; Thu, 14 Dec 2023 07:44:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <cf3ce945-2f1c-4dae-86b8-349dae3d962b@app.fastmail.com>
In-Reply-To: <20231213190528.3751583-4-tmaimon77@gmail.com>
References: <20231213190528.3751583-1-tmaimon77@gmail.com>
 <20231213190528.3751583-4-tmaimon77@gmail.com>
Date: Thu, 14 Dec 2023 13:44:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tomer Maimon" <tmaimon77@gmail.com>, pmenzel@molgen.mpg.de,
 "Rob Herring" <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 "Conor Dooley" <conor+dt@kernel.org>, avifishman70@gmail.com,
 tali.perry1@gmail.com, "Joel Stanley" <joel@jms.id.au>, venture@google.com,
 yuenn@google.com, benjaminfair@google.com,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: openbmc@lists.ozlabs.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc: nuvoton: add NPCM BPC driver
Content-Type: text/plain

On Wed, Dec 13, 2023, at 20:05, Tomer Maimon wrote:
> Add Nuvoton BMC NPCM BIOS post code (BPC) driver.
>
> The NPCM BPC monitoring two configurable I/O address written by the host
> on the bus.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/soc/nuvoton/Kconfig    |   9 +
>  drivers/soc/nuvoton/Makefile   |   1 +
>  drivers/soc/nuvoton/npcm-bpc.c | 387 +++++++++++++++++++++++++++++++++
>  3 files changed, 397 insertions(+)
>  create mode 100644 drivers/soc/nuvoton/npcm-bpc.c

I try hard to avoid having user interfaces in drivers/soc/, that
subsystem should primarily be used for things that don't have an
existing subsystem in the kernel and are used by other in-kernel
drivers but don't export hteir own misc device.

> diff --git a/drivers/soc/nuvoton/Kconfig b/drivers/soc/nuvoton/Kconfig
> index d5102f5f0c28..ebd162633942 100644
> --- a/drivers/soc/nuvoton/Kconfig
> +++ b/drivers/soc/nuvoton/Kconfig
> @@ -2,6 +2,15 @@
> 
>  menu "NUVOTON SoC drivers"
> 
> +config NPCM_BPC
> +	tristate "NPCM BIOS Post Code support"
> +	depends on (ARCH_NPCM || COMPILE_TEST)
> +	help
> +	  Provides NPCM driver to control the BIOS Post Code
> +	  interface which allows the BMC to monitor and save
> +	  the data written by the host to an arbitrary I/O port,
> +	  the BPC is connected to the host thourgh LPC or eSPI bus.
> +

This one in particular looks like this might be implemented
by more than one BMC type, it's a fairly generic functionality.

Have you talked to the other maintainers of SoCs used in
OpenBMC about coming up with a common interface?

> +#define DEVICE_NAME	"npcm-bpc"

[nitpicking] No need for macros like this one, open-coding the
string is usually more readable.

    Arnd

