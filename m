Return-Path: <linux-gpio+bounces-26948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7DBBCA11C
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 18:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA4683BA330
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 16:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D13225A39;
	Thu,  9 Oct 2025 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nnVAQ6/V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wJDQytP4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62C1E9B3F;
	Thu,  9 Oct 2025 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025859; cv=none; b=U6IF2/ILNfngHzdVCiWxJaEEUBtWS+1STYJHrKjmL7iNmiZsuj60neUYGwTQw2iXV6WqZz2pck2KzaVKF4FJdSOrzZBYqT2sWyafvkYTAKNi+AG3Z8h7axSvxp4cHctdx94s60VS02e3OyCVre2E6o7g7drZT46R6+ebHMQowPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025859; c=relaxed/simple;
	bh=FYNKv7D1EC7aqQm5HIMVPuT97MqB/MQ3D5IcfcDyDlw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VjJStvDWL/h9vFb31WZrlkNKfz8iEu6RMV9076ycySoaxyObYiT4q0l0sEpK7UrOAhd6aViQi0c6q5u07AIrl7XRQyaDJpYVdIrROz8083b80Kq1tt4Oszc48kU+8UnX101KPU1ICpHDhlp3+3SF64lYXJQqtOa34wh1FwWHqsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nnVAQ6/V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wJDQytP4; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 57C4C1D00050;
	Thu,  9 Oct 2025 12:04:16 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 09 Oct 2025 12:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1760025856;
	 x=1760112256; bh=23ngyS3KYICVewy8CTI9rVQ3gKpUoMh4bJgB04owOQg=; b=
	nnVAQ6/VYlAvdZHD02qZ6agaxONrnoF2WJQoVmnE1NtY4x9wkP0E230ybLzaLkyl
	XuL7Lj6Xp7CsezaIDqxEl775Xnx2gcRgC72aR4lgaUAOcI6ak0Rsa7PEPv79Q9GK
	qReEIJvrBaJWj/wGbj1cnHdnu/i48mG6BZU85UcLF80C0Aiu6nq9WwSLpGRQBs6k
	OMbiYn5bNpzDDjXwI+10cnWUozKjhF3OZirUtVqJ0ONQmBNKieZ+dyZ/+Ow8ePFO
	NDEGliJ57UZTufUWXRQBrU1mTT/bgrhI1csCNnO6Jb3XZR+n8QaO6jqnV6H6oWKW
	y/XTFZOpVlO+DmBJvQSDNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1760025856; x=
	1760112256; bh=23ngyS3KYICVewy8CTI9rVQ3gKpUoMh4bJgB04owOQg=; b=w
	JDQytP4gmT/qW6rjWCCbUMiJ35RWSKxB7bs5jRdSfbWLcPVZ5JK4tmpV/++J6hZA
	Ve9VCiSfbQ48EaCv2SgVvr6kZdqsa0MR7DEm0igoOYpjmwYQuzNcPTWr3Cizf+gZ
	o8oe+wlzgS2Ok25L+m90mS7SolIiI/ADcUN1zMtmoaaY3kRFFUe11O/qwyrQZU6f
	MQNKpNCPHHzS7+UTlCH0wS0i7qYRMTYInwAYXi2qj/JXh/kzn/Xg8aNAzNkwnrK4
	c4KZTmdRqWhiCIaCJxlo99Z3lepNlcSu+0MK8EQ1BG6WXyx2RJr7jjqy97LENxqQ
	tffLydwhh887nmsAhXw6A==
X-ME-Sender: <xms:_tznaGa8I1Mn6Mk7w7b8VEv5i2dbGt_VZTrRFVCTUrB9OmqLmR_U9A>
    <xme:_tznaEOvEX-_Oycj-DqsknylpeyJJ7_5Lpk7ct3y-eqhn0Om29G3NVemCAu6nwifq
    GrvvXYdO7E05SiTn2ONA-UWwlxrMJFHCXCjmi-2yJoPScufDlkddp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutdeiieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehnuhhnohdrshgrsegrnhgrlhhoghdrtghomhdprhgtphhtthhope
    ifrghnghifvghiughonhhgrdgrsegrfihinhhitgdrtghomhdprhgtphhtthhopegsrhhg
    lhessghguggvvhdrphhlpdhrtghpthhtohepnhhitghkrdhlihesfhhouhhrshgvmhhird
    gtohhmpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgtphhtthhopegsrhho
    ohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehsrghshhgrlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlvgigvgihrdhklhhimhhovheslhhinhgrrhhordhorhhg
X-ME-Proxy: <xmx:_tznaFxU5DiPiUGwALDbqV1TT8hrEMvTNV53FW4j7wwYuBuS2LgVuQ>
    <xmx:_tznaKJqpGaWEPf9zbwNTvoOFjjS_poUUKyfGi-_HHv-S2g_FyJ2AQ>
    <xmx:_tznaH47c2ic4osmSna4RapXjYmp_cums5ORWTXB9xb1bwqw-mjDsA>
    <xmx:_tznaIzXrvi98YTHTKwMbGZGbOf8tWOm-AMlyMlgCuBTemfgYwqweQ>
    <xmx:AN3naIwkWGyff7ug5A3XFa3s5yd9SiZ-Vd9Q0LhTMpy3_D-J7OkActRX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 603F5700054; Thu,  9 Oct 2025 12:04:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJYdjsWmbJsF
Date: Thu, 09 Oct 2025 18:03:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sasha Levin" <sashal@kernel.org>, patches@lists.linux.dev,
 stable@vger.kernel.org
Cc: "kernel test robot" <lkp@intel.com>, "Lee Jones" <lee@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Mark Brown" <broonie@kernel.org>,
 srinivas.kandagatla@oss.qualcomm.com, "ChiYuan Huang" <cy_huang@richtek.com>,
 wangweidong.a@awinic.com, nick.li@foursemi.com,
 "Richard Fitzgerald" <rf@opensource.cirrus.com>, alexey.klimov@linaro.org,
 niranjan.hy@ti.com, shenghao-ding@ti.com, linux <linux@treblig.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <a137ca66-710a-4b0c-91e4-c69c68a21089@app.fastmail.com>
In-Reply-To: <20251009155752.773732-102-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-102-sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.4] mfd: si476x: Add GPIOLIB_LEGACY dependency
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025, at 17:56, Sasha Levin wrote:
> - Why it=E2=80=99s needed in stable
>   - The GPIO subsystem recently made legacy interfaces optional/fenced
>     off, which exposed drivers still using global GPIO numbers. This
>     patch is part of that follow-up hardening: it gates the si476x core
>     on `GPIOLIB_LEGACY`, avoiding invalid build combinations. It is a
>     pure Kconfig fix with no runtime behavior change, directly
>     addressing a regression introduced by the gpiolib changes and thus=
 a
>     textbook stable backport candidate for trees that have those gpiol=
ib
>     changes.

This is incorrect, the patch does not need to be backported because
at the moment CONFIG_GPIOLIB_LEGACY is enabled unconditionally, and
the coming patch to make it optional will not get backported.

     Arnd

