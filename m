Return-Path: <linux-gpio+bounces-27631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 541DAC0CA53
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 10:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CD114F2FA2
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 09:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C972ED871;
	Mon, 27 Oct 2025 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bpHDlK+e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="z5kx0sue"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4892C2F068F;
	Mon, 27 Oct 2025 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557113; cv=none; b=fcIQhbzUyfAbE45BMqIBJx34aXZTTJGvW1hcfRt7eYAocVLcJW+LpjbCvUEF2fRjMA9TEv8/2yRhKw/Lr3goo9KGoEQbsrkeKRNipHFb8xEmr9jYT2diotI1Kwam7bFmcJmqH+nRHpchXKviPCsmUiJzB+mtQ8rFAW+mceMDdjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557113; c=relaxed/simple;
	bh=2kNSuTrjCgbC9sjJyzFtLI/aV32xV70+Q2oAydZo2tU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KdAuatOw0Tnp+daZsEcs/UX9+JIOph2BT1snxMJHnFCA4KK2L6A+EkNoxwUHLWPlRn6AUjrxlIxhbFIlGjndDRvmBFuE9AxAkWFdqc5w77PaeRncWV7oTaPKFPPKx5DNdcWgIgd7TPUXGDDuSuG9Q37qdulpWwe8qWw0iCDyQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=bpHDlK+e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=z5kx0sue; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 3F80B1D0019D;
	Mon, 27 Oct 2025 05:25:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 27 Oct 2025 05:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761557109;
	 x=1761643509; bh=ZYSCNPujoeIiPWnOTZjTYJpArRoI/1XTQNC5cifNrY8=; b=
	bpHDlK+e2BQpLKdubW02HncVR8ATSomqcnFO5m8zqXyhyzDX+V//nziPsVsdKugs
	UEFPnjzGiFq/wUnVjOoj88jCACHeD13Y4bzQs1OaRHujmeVvXLk3i8WM8GUAp9BS
	+pcQ1G5denRN/zapsqmHaqZIkjk5+fNjTPoSEULCai0GyhB8Q7rtM5c5cbc2CXHw
	YLQJB9B3/Dyg3BU/PYo2SnsIbWQib2wXBMsPlsBzFjEt7FLWsWju/WWiW7OJBR+t
	dlNFl/h7tZYhJij4nHn/3HPdGKJsc/KSQqAErLEbwMDo06vbTPianmx1/H+gGJyM
	uXZySzwLiCuvPumZ8ZjsRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761557109; x=
	1761643509; bh=ZYSCNPujoeIiPWnOTZjTYJpArRoI/1XTQNC5cifNrY8=; b=z
	5kx0sueU92/8ZB4Y1+So2NtvVpd0RzT2/XFY+8G/TKAC+r2oPNuM82UaE5Ozdd1Q
	qgGAw1zsBzn3xhBDEKi4Mi6NkHEzL5YyWx6qUqXGSL3PhhBhgRyyRPHDmBZtciFh
	wvKkmS++NeqHyABuyOqUVInsT023Z/y72Q8U8MKs9eQWBsw54NA7FszK/idpVSB0
	Or3JjQK7l8Eth8wIck/tLfoeINdS+FepoDUW6Vevjg5CjtSTk9QeAzs3KmdTkFLm
	KQZ6w1/u9rRtx98HYNY6y9oDOEXrjju+9nELa1yd4G0EpoxQUKVRUt/RsTEW3/w9
	CZEeKiy+7BpSPbwz8X8aQ==
X-ME-Sender: <xms:dDr_aAAspsxFdYagS9g1uY1_gt0AqI7hkzJ0edM5kLjVNtoz9Qs7zA>
    <xme:dDr_aNWP19nnB0b_J1ShTguNywZN876J9nNYijDVy4et8vff34CsVHzIGFHqwVyAO
    GE2IkMZDcxXfXiTLcdAEsERlbS7lIkLrcV-XHJXyA4D7zuMOb6Webg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheejiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehhvhgvrhhkuh
    hilhdotghishgtoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrshhhrghlsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgt
    phhtthhopehprghttghhvghssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:dDr_aLhPGMKNkWUV57WN_ZtZ6siWhauizoBDd04LyzGN40gVDc00hQ>
    <xmx:dDr_aLFCDro3aQH8HctY4QY7R0N-cS02TwnM2aIpZE-aayb3Yq_D4w>
    <xmx:dDr_aFtDR13vGNTG08ovVXCQnjvUzeRLvpcGthbD3Umkxk2GVHZ8vQ>
    <xmx:dDr_aEfnwZiTSSB8NYUfZGnZpSl5_V0vKg4-2YsSxqNU5uogejvZFw>
    <xmx:dTr_aMbpvIiTl54Oox5j49mvDHVSx9YSoTLNP_RaZipaHXJwD-7k63X4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BE7C1700054; Mon, 27 Oct 2025 05:25:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcW5hAlZpVq3
Date: Mon, 27 Oct 2025 10:24:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sasha Levin" <sashal@kernel.org>, patches@lists.linux.dev,
 stable@vger.kernel.org
Cc: "Hans Verkuil" <hverkuil+cisco@kernel.org>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, linux-media@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <d08ad8bb-d94a-41c7-8bfd-9c4e8c054785@app.fastmail.com>
In-Reply-To: <20251025160905.3857885-118-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
 <20251025160905.3857885-118-sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.15] media: em28xx: add special case for legacy
 gpiolib interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 25, 2025, at 17:55, Sasha Levin wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> [ Upstream commit d5d299e7e7f6b4ead31383d4abffca34e4296df0 ]
>
> The em28xx driver uses the old-style gpio_request_one() interface to
> switch the lna on the PCTV 290E card.
>
> This interface is becoming optional and should no longer be called by
> portable drivers. As I could not figure out an obvious replacement,
> select the new GPIOLIB_LEGACY symbol as a workaround.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>
> LLM Generated explanations, may be completely bogus:
>
> YES
>
> - What it fixes: Prevents build breakage when `GPIOLIB=y` but the legacy
>   GPIO consumer API is disabled. `gpio_request_one()` is only declared
>   when `CONFIG_GPIOLIB_LEGACY` is enabled (see
>   `include/linux/gpio.h:88`), so compiling code guarded only by
>   `CONFIG_GPIOLIB` fails if legacy support is off.

It's not needed for stable and has no effect in 6.17. This is
only a preparation for a later change.

         Arnd

