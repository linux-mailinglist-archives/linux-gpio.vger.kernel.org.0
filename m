Return-Path: <linux-gpio+bounces-25388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F21F4B405C6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 15:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F2E11B6573F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Sep 2025 13:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A6F307AF3;
	Tue,  2 Sep 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dvb2a6Gs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DPfRSff5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D0D3594B;
	Tue,  2 Sep 2025 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756820906; cv=none; b=kOVW8VVvYpoEQGzt/l5vaEn7Vzt5c0HwpoXNoY5wcqX1mDIudV0QnSY5imvn2DFSdTdZ4aUuv/TwsNKlUo+RpYoIzAfahwGLcIyi0ftT3TgFM0L9y3RPYI6K3TxJPniaqAutFfyHYcNivFw0uNhGVCwrCLo5s/ijZQbB4iyvies=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756820906; c=relaxed/simple;
	bh=/D2r33JE1LIC+FYd2ZZNq67/A91Py0gQNdiS4EFi/1A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pg5GEzWfXNwn2EeXdw3Y9qNTywGNcHuR3tBCx2DfIdBDRZAQHzt1HjxHFXop52bWfcyrP45xgld5Oq1BD22x9Kg6xLbI+iwL6Ck+Wlui5tDZjdW+hJRXszBuEUuYV1W0+bmycEIfCAoyCpD4Ovf0ZjwcHT9OBBfpdznu5RtOpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dvb2a6Gs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DPfRSff5; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 39DA97A0057;
	Tue,  2 Sep 2025 09:48:22 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 02 Sep 2025 09:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756820902;
	 x=1756907302; bh=a3peBuNurSCl2n3gjFJuUB606CmSXDXS/bs6oWUyli4=; b=
	dvb2a6GstEr+wrtkaq+dDScDF1vFdamaFBSZSziS1b6TwQmaTQYyutaDdeofrOG4
	BgR+QuRytpPat79k1CJqPA94CTHCwalpEIiLSzns+75Ke8sVasnQMbxEjFRxTHLa
	zl+L7DhFQ+A4FRmDV+uM3MBs8sVMyg2S6ds7n751nZMnrv3QwZV46Z0Ojc9fIPEE
	scRaqPFUlKvfq7mrZX3RdPMGGUtfJCusqLCzCQgo/YqwvAuFdbN1gJtuSmpQcWCx
	JMwz1vAUvgFbP74CFqkvtqqgrNhY8JECbh1Jkbwz873SQ6Df/DDrlp1291HlEFna
	pHXie66L0mk2MIuDCJcLmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756820902; x=
	1756907302; bh=a3peBuNurSCl2n3gjFJuUB606CmSXDXS/bs6oWUyli4=; b=D
	PfRSff5S6MsKheI/aD/1Dm8XCVKmtskoE3g3fUBF50JVpgTmxzM7L1bWady0dn2R
	YygIMmdFyfM4ye4FBE6z1tpJ3nX+B2691KZykn0IzWFUPFnK2rJXzoKTca7vsR5L
	9AuUVHYZVSVFoDGhSLVVuJWJO5tTHOlwVjfp1ctlBrreWit8KRlRIF5VlF/+C4zG
	tD4nfXxMQQ7FVu24s1aZKTbf3LHEMgUAnqlpGbiSFUksxE8c/5s1EVfsOv60ojI3
	rNJ42PgrTTuNz5u4DKJv35YxeislFY+wL6498H2cvC8wz/E/8yECQfe2aHjb1RrL
	CIXarfb7Wy/aX7p2uwI9A==
X-ME-Sender: <xms:pfW2aGt1kUvP65eAaIuj2hk4ha4awKtsL-ajApkobFQ5mO7EIdsdxQ>
    <xme:pfW2aLc8By3Y2IpAjlMjQeC-4cHP857puXyV3b3ffRm_s7I5dO8cYZ2gQ-gBcSdZo
    VDRhBMwL6uaXA3d7X8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegv
    rhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpe
    fhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrg
    hrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlghhirhgufihooh
    gusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjih
    hrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdroh
    hrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdr
    tghomhdprhgtphhtthhopegtkhgvvghprgigsehophgvnhhsohhurhgtvgdrtghirhhruh
    hsrdgtohhm
X-ME-Proxy: <xmx:pfW2aKVPx_pFGO2TjVTw1WwG8Cjr6ugS4Au-JjHJJs2U4GeaZBlhAA>
    <xmx:pfW2aBdDg9C9qxlXsM_bS0EkHGZJHgrQplGCvaQWFMJbNK08tQPQvQ>
    <xmx:pfW2aImGxFKFifal2ZMr2Ajf2qBgwWoLHAMZzsN1pbSlU35vJ30O2w>
    <xmx:pfW2aDCc13JurBulAwqjzNpwMb0MCHIfQt1D4sWrL4IhV_p-eO7-AQ>
    <xmx:pvW2aBGpioN-i6COnraPf3BJCRaGThYyz8qFm3h8AYL9C5BMO51HbWM3>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A678700069; Tue,  2 Sep 2025 09:48:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXipOkXRca9w
Date: Tue, 02 Sep 2025 15:47:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Message-Id: <5a683d99-b323-4ab7-bf0a-e91436ffd301@app.fastmail.com>
In-Reply-To: <20250902124427.GM2163762@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-13-arnd@kernel.org>
 <20250902124427.GM2163762@google.com>
Subject: Re: [PATCH 12/21] mfd: arizona: make legacy gpiolib interface optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 2, 2025, at 14:44, Lee Jones wrote:
> On Fri, 08 Aug 2025, Arnd Bergmann wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The only machine that still uses the old gpio number based interface
>> is the wlf_cragg_6410 board file. In order to remove the dependency
>> on the interfaces, add #ifdef blocks here.
>> 
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  drivers/mfd/arizona-irq.c         |  5 ++++-
>>  include/linux/mfd/arizona/pdata.h |  6 ++++++
>>  sound/soc/codecs/arizona-jack.c   | 17 ++++++++++++++++-
>>  3 files changed, 26 insertions(+), 2 deletions(-)
>
> Just FTR, I hate this!   =:-D

Any alternative suggestions?

Would you be happier with a hard "depends on GPIOLIB_LEGACY"?

I see only two in-tree users other than the old 6410 board
that use the modern path: exynos5433-tm2-common.dtsi
and drivers/platform/x86/x86-android-tablets/lenovo.c.

Making those platforms 'select GPIOLIB_LEGACY' is technically
incorrect since they don't need the legayc interfaces, but it
would be a temporary workaround until wlf_cragg_6410 is
gone.

     Arnd

