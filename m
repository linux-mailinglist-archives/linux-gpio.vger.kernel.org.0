Return-Path: <linux-gpio+bounces-27630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 682ACC0CA69
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 10:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406063A4AE3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 09:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739DE2ED871;
	Mon, 27 Oct 2025 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="sTKppKSK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xsoWpGpJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552862E7631;
	Mon, 27 Oct 2025 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557039; cv=none; b=t9YNkE/kLXlaEpAX3tGd41tAPrJm9RbQvYWBS31LhMM7TUzAPKsOcOdXqyJER8/9vcNCtFVG/EVqXnOlIeNsKPwaQvzp35CtXIU030pjvgg/dRq2+MXcvPGyokY/WKAr1rtxSZ7bzcc0BNfr1imJmjzV6nGdjUECzwbwleQtCfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557039; c=relaxed/simple;
	bh=ild+6kjhBiOIxvMM6KYGSeustSa2a73dmzZXVJgn+wI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nRXL1qqlS5AABwgN3g7Nq4N100mFD2UJ21QwzE2mjI/uRsEKh80TLjqRE4ZkY8iRwiNikZ3TQ5X3OCLEt8eJyysPz1pj31zHvlDE7eBSp3lvqBxhXtakIeRYTnDOzSD6bVqd58wxZp37QeXUosqg/swvWNzgjFVRFecUapYeWpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=sTKppKSK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xsoWpGpJ; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 36B9B7A0254;
	Mon, 27 Oct 2025 05:23:56 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 27 Oct 2025 05:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1761557036;
	 x=1761643436; bh=FsQSIKQ8ko6FOAPs4f5QODq86FBvj6wCYn0uamacVKA=; b=
	sTKppKSKLn0IO5+CaKn4IGNnsADWQIa28VkBFIYIzzxkdIZeXaU8jrKQfWprMidd
	H/Y3o+CzPDAupFsyCiktcU3fIU4MVjRHQrpTmL0WAB9qtx44VYhQsP95nwW182uN
	znRQ+MY72wceEfQ/9XELTJms9F4JOY17LP/JpUrjWS9bJ2uoNsq4fDOX7fVA+wXa
	xkN1NjlAXIy4xi8Trg7X+LAQ7+ly1ali9ajdo7UgBVCAlKN6K5NbN7ASP0Dld2yw
	GEHQK0/k3928zegV7qlEgXZYTvYRVhuN9pWh2zrbwmoj+RHeGkMwyzRwY760PF0W
	8K9lBlkZUv1C1IrWDFczUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1761557036; x=
	1761643436; bh=FsQSIKQ8ko6FOAPs4f5QODq86FBvj6wCYn0uamacVKA=; b=x
	soWpGpJTRLVsrkv21AmNkh37hc3Gkt+SFj/OGCyqYT2meN4r9BB1JhL2Nu1wPaWp
	96PZ4tDDu/hMAyy4Zk/cqk/dyKy/BwCGVZdpiPhMqgxyppxxCatJ2Zcg7s5V3y2l
	2N76VhGKw932dkosezxsM+G9BBlDoYVhudgk1YIaU3F2h8yhSgAKdvH3cuaf4xIB
	aVltC0LBIWLfF59D0Vso6jxlJy/jz9g43M+ydmb7QVMFPmcg3OjpD1Kjop7FSroI
	tlAfTGj/Q9lK96e/xx44UNA9mL0TlPLAC3aq4AGoLWwtOQN+JA7ImfmL+Lh/1wHs
	Bl8XJv6YrOUkzP3wuIijg==
X-ME-Sender: <xms:Kzr_aEPt9FilXlyftrVNXxNR6FxtsCWQaNCh8y9EQ56flfMLKVWJOA>
    <xme:Kzr_aFwLxpzAvxBYb6WKjxd2fqRQNwSeMKXhP6MyNGsf2K1Td2jTA3Zp0MtJzQxDM
    bBWR6bTZPR9I3JbHZvKMNhKbZ7efey3NrD6PEG99S1X2V_HGyICRBDt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduheejiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprhhosggvrh
    htrdhjrghriihmihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihh
    uhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepshgrshhhrghlsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhope
    hlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopehprghttghhvghssehlihhsthhsrdhlihhnuhigrdguvghvpdhrtg
    hpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Kzr_aO2_DwtZf0NbBypm1eXjMtWMXNRtkKwEtaemqID6nIP32m5I_A>
    <xmx:Kzr_aGk8KpcopPSGBBSZfoXvcCPoS3rwsJ4CiiM0jYE1fsLT0IHk3A>
    <xmx:Kzr_aF_gDDk5UoVIoB95HTHQuKaJmoz84nAbeFEPc1orxhUBxWiplg>
    <xmx:Kzr_aELwPd8QwMcMwSfnutWaBW_QPuwBm9qRSLLhxLC2Dw_Fc9PhZA>
    <xmx:LDr_aOImeAidaajgoohjaFRY1UEvXhG8uhDUT_EsV14luDd_je7w6pBs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4C01E700065; Mon, 27 Oct 2025 05:23:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARRIUa0zdPoF
Date: Mon, 27 Oct 2025 10:23:35 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sasha Levin" <sashal@kernel.org>, patches@lists.linux.dev,
 stable@vger.kernel.org
Cc: "Mark Brown" <broonie@kernel.org>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <eeb6d1ab-e8ec-48dd-b8f0-0de3eaf545a6@app.fastmail.com>
In-Reply-To: <20251025160905.3857885-71-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
 <20251025160905.3857885-71-sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.4] ASoC: pxa: add GPIOLIB_LEGACY dependency
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 25, 2025, at 17:55, Sasha Levin wrote:
>
> LLM Generated explanations, may be completely bogus:
>
> YES

It is indeed bogus.

> Rationale
> - Fixes a real build failure during COMPILE_TEST when legacy GPIO APIs
>   are disabled. The failure stems from `gpio_request_one()` in the PXA
>   AC97 support code: `sound/arm/pxa2xx-ac97-lib.c:374` uses legacy GPIO
>   (gpio_request_one/`GPIOF_OUT_INIT_HIGH`). When `GPIOLIB_LEGACY` is n=
ot
>   enabled, these legacy interfaces are not available, leading to the
>   implicit declaration error cited in the commit message.

The build error would only happen after we make GPIOLIB_LEGACY optional,
but in 6.17 it is still always-enabled.

>
> Notes on applicability
> - This backport is most relevant to stable series that already have the
>   `GPIOLIB_LEGACY` split. Older stable trees that predate
>   `GPIOLIB_LEGACY` either won=E2=80=99t need this change (no build bre=
ak) or may
>   require adjusting the dependency accordingly.

On older kernels, this would actively break configurations that need
the symbols.

        Arnd

