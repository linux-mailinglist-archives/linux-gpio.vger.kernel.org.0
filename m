Return-Path: <linux-gpio+bounces-6183-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 801568BDC98
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 09:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91EC7B221B0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 07:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F2413C83A;
	Tue,  7 May 2024 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ddo8WbCU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XPN1d7bg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0413C69B;
	Tue,  7 May 2024 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715067838; cv=none; b=JL7TVvrr0vznOS3i6BAZwgN8urdwCP0yWnSXlb+buAt9HqfoJ4i8fhbtaJLpkZ1i5IM8R8yuTd8lRYWthmx65HuyD1+mR0a5UEutuvqwHsKzFSxJRn+oFR1yTuLTzxrorV3dcWX7/TbhE+4KNFz1wP7RQwV34i1WZpA6dKm/xAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715067838; c=relaxed/simple;
	bh=g6fhHHq292p9kLriuFL1SHKTwn+Nzn2QhEszy1OcCBI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=e5QEABWzhaYsy2ziA+/O3xWlPaRnRDCKXcVKHoViN+6VS6F+ycF8SK0wQyQqYUHnbC5nHCxYICnF+qRuP0fUCVuJbCzuMzuTkl43JKfjFP53H0v1ilsUJSXy5lCAU37/QCP5ucNvPX9hloLuEVmMpz/M3CC5rF3O3xCsi1mNElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ddo8WbCU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XPN1d7bg; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 37088180008F;
	Tue,  7 May 2024 03:43:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 07 May 2024 03:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1715067834; x=1715154234; bh=vXPfMRB/3T
	UDYWRS7PTwpTJ3S3jPVhG0XFAxiG18T9o=; b=ddo8WbCU43F2hE/einqY2JG9B5
	U6fys2bSof7xfPpvB0rWSydXLRgkWBY6HqOaDG2Oy1MI+r+imPkLEntBqnEvaeRo
	qNtXtLNlVtrAjAA+3cwhxUOIh+xzNgtH2OtHYsN4p+4/1jjaX/hOWIBf3eRjn4Ms
	dYtu2nbeHOK/VIAD+Z6k11ozW/cM8orTBufFUAztZgcGG0RifHKhlq889epy7TFI
	ZkRuzTRepEB5var1xqBWDQXX0UqD1OWkLXCShijBo/jScEbEM7bK2G1dHK0WsGc6
	b88iwAx/yQOR9JNHon6Pk191kX4KOeTGCGnz14hYa4FIC1hKr2BXrRgcDYXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715067834; x=1715154234; bh=vXPfMRB/3TUDYWRS7PTwpTJ3S3jP
	VhG0XFAxiG18T9o=; b=XPN1d7bgvQ1kPuWnZrXVYj8XUMWeEs0q6HAfq9QCmNq1
	MfPwWFrvqnFL4CnzfaR+DPkHgrYz2DP9W6QPNMwGKqXwq5Jg5EmXUl9Z4Nn7dOHB
	9Un5pturWPAsHZ8A/s3mWV6FTXZIjLUpZa6Eh+giIYaHyJPbby24Cnu8wyHugIUw
	wuFGEI0omqmXl7oQXNITr6UPisdDOzkYdzfVTvAXrLUdrwCQCE9UT9CTeyjCxkcN
	ZTiWrppkqIJBvywyvcrUGSTF/EHpgi+nfuHXyBxUKo14jeOFOU6U2GWY1RneZ44R
	5Zs9ccOXBMmZ16EEYnO3ykSk/qGli4zdQfuG9CJ3XA==
X-ME-Sender: <xms:uts5Zvl7-nEq-CbF7QGNhobayzAeohw3tv0Ejxu14PR1zvsSnFgIyQ>
    <xme:uts5Zi2bihLmybG1yqeKLHGOC9DeZey6QdEo8U0ZYv7VUMamAoTZtHu41vMMZmypO
    scYH8hF0o_zLd__vTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddvjedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:uts5ZlrYSndBEJjDurgNdyAnizkGaL550-rFSG8IbQoYzXvJs4QT4Q>
    <xmx:uts5ZnlmGs0rWEkFtYSXKopQH_s1142cx8ljGNwJcUo9UDwmJnsSdw>
    <xmx:uts5Zt0bHq7RqMby2NcDs7M2qulNICqFyD-5_kjxoFOp9XX9kkbM3g>
    <xmx:uts5ZmsHfQZki9eDHmArUCMXLkeQQP83Qn-95pb26amDgq2PN6O85A>
    <xmx:uts5Zs1I6GVHr8XkXk_9IE4HJUWtOLyGmFk5D44BVVzsmlziBVnbXsTX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4D40AB6008F; Tue,  7 May 2024 03:43:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-443-g0dc955c2a-fm-20240507.001-g0dc955c2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <cfd19433-c8de-4157-bdde-dcb6aa490792@app.fastmail.com>
In-Reply-To: <87r0eef4xz.fsf@geanix.com>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-2-bdff75085156@geanix.com>
 <8accb26e-c7a8-43aa-90d5-d83d5a1575de@app.fastmail.com>
 <87r0eef4xz.fsf@geanix.com>
Date: Tue, 07 May 2024 09:43:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Esben Haabendal" <esben@geanix.com>
Cc: "Russell King" <linux@armlinux.org.uk>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Dong Aisheng" <aisheng.dong@nxp.com>,
 "Jacky Bai" <ping.bai@nxp.com>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] pinctrl: freescale: Use CONFIG_SOC_IMXRT to guard i.MX
 RT1xxx drivers
Content-Type: text/plain

On Tue, May 7, 2024, at 09:37, Esben Haabendal wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>
>> On Mon, May 6, 2024, at 12:23, Esben Haabendal wrote:
>>>
>>>  config PINCTRL_IMXRT1050
>>>  	bool "IMXRT1050 pinctrl driver"
>>> -	depends on ARCH_MXC
>>> +	depends on SOC_IMXRT
>>> +	default SOC_IMXRT
>>>  	select PINCTRL_IMX
>>>  	help
>>>  	  Say Y here to enable the imxrt1050 pinctrl driver
>>
>> Maybe make this
>>
>>        depends on SOC_IMXRT || COMPILE_TEST
>
> That is done in patch 3/3.
>
>> I see that all the i.MX pinctrl drivers are currently missing
>> this, but a lot of other platforms have the ||COMPILE_TEST
>> bit so it gets included in x86 allmodconfig tests that
>> often gets run before sending or merging changes.
>
> Take a look at patch 3/3 in this series. It does a wholesale addition of
> ||COMPILE_TEST to these drivers.

Ok, great! Sorry I missed that bit. Whole series

Acked-by: Arnd Bergmann <arnd@arndb.de>

