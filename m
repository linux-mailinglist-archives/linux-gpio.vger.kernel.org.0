Return-Path: <linux-gpio+bounces-25463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2CDB41A05
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:29:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B0C1BA3BA5
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 09:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F922F0C60;
	Wed,  3 Sep 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ApFFuVFa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FThJAawm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA502E552;
	Wed,  3 Sep 2025 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756891644; cv=none; b=GgP0jB/UKE2pYSN8Uu4oC23t4IKXJJ++RrrGoj0qIUPVSJbUtxdJFj97KMRgbU6JN4cNOydE7BHW1B3AIY1e0oul2U8xCNvRxZ6xaYDVOc5Wa3HQb3uItLmGgcoGbRnCOnnwVStcqBkAPXhKiR+bxCSvXCEI49JTU/kzk1uGhE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756891644; c=relaxed/simple;
	bh=QhEhXimFtFfBngVFm910ugOUVk1s9S7/j+4YGhy4XpI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sbSmcH3RjFRZZcQHt4iAVL68H1fc/dKlP5weAjD65Jimg7OY5+cCABqdmVTSPL8IsHkBREF3sw47OFROr6mAU9H+ODrFsEPKd8qtrzL+hT+Ve64nTeVBaIXxoq50xuE3pa2Fn4PY6tAHg4ugB7L7UTbBEyNTICAyxtQHY2I7Rg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ApFFuVFa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FThJAawm; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 96F131400384;
	Wed,  3 Sep 2025 05:27:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 03 Sep 2025 05:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756891640;
	 x=1756978040; bh=lyiEjpYfQmC6T9sK1MM5ZWu/jRhXLNqX0wlj6OYgL/Y=; b=
	ApFFuVFaDmKE2unCWpPSKFoz/3ftN87RwmlMCIHg35X9Zay201nU35beNVkzmL1S
	Rpf96vBFPrvI/ALLObVA38V3oM2VtNKJHi9nHyc+S8qW33k6E0GKOJX+BawG9ZFy
	xK1rhsWH6zU7M6nPwy6iCSjBZQ9fpeLb7kNvXPoguGc8+DPPbxkGbSoCZYDIASik
	j7e2I/Xtf7YfWTSP7iFJYL1QUbO/d8hXi1SpU36k22Dr+FRLyb+MwXXXmX0KlDKd
	5IaAFv+7JoTVru3PnmrOQqsVHBSU6xO3HZ7Gs+tzheo9+hG3wh65emFannsOiVD6
	/4zpCXnVzLdcWYps/YuKIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756891640; x=
	1756978040; bh=lyiEjpYfQmC6T9sK1MM5ZWu/jRhXLNqX0wlj6OYgL/Y=; b=F
	ThJAawm1zxT7beyvO7o6OJlv00V2KF2tVgjBeL77+ymv7o21Apzi6YmNQO7hbsDB
	1qTznuHRgYhjy+1Nu87KAnFR07MGuz+3P058+znfgH53NxqXNbaM8CzF0QaI835V
	HNwjWZW+xFBVigp+yBD4YtBM2CAwoHw9btDbgGfDVQ8x1Bmy3yd04iAgyUSswBjl
	lLtkvU0KbeABMGSHzykrhjFD0EpDLxptf8GvbvbGv+rJRD0EUw5EQ0akeFsiM8cA
	c6bEtSOTWdVRsBBYwxL6XHzs/ao9rmiRBt6B+gxQ/6/y9Squi3J5TnbicAQ3SiQt
	SFC9Byp6gOnQV2oy4w7pA==
X-ME-Sender: <xms:9wm4aM0X7yVVL2DN_3bOtvd1CdIAJ19UrnNlYfbtzzQb1Dnk_np6pg>
    <xme:9wm4aHFsIfUO_ZPUagqhs4wz4tUUJf2hHlpyRXI5jdO8c4rqMFbQ9G_YoGvFSPCM5
    2iRNHwaVKkfdvaZZbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheplhhgihhrugifoh
    hougesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjh
    hirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhord
    horhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtoheptghkvggvphgrgiesohhpvghnshhouhhrtggvrdgtihhrrh
    hushdrtghomh
X-ME-Proxy: <xmx:9wm4aEeHBhKf_WDMTuJwu4E9oDIBPSNkHvFbznRkQKtN_unUFZaDQw>
    <xmx:9wm4aBF_wUcRz-KNlaq-ebFMGtUrKuSDGe8QEaXmO1NEGXuisoxzHg>
    <xmx:9wm4aPurnhj74Msi-V9zeKJjUUEeDtujynbZeOyznefAMQYfduOURg>
    <xmx:9wm4aLr5dQ9GvURRobTeEWpWqR5nlwI92RGS95gLKY5s_nyi1PoK2w>
    <xmx:-Am4aNCDOtCfl0s0Kwkzqg_g4G4iwXzeDoAsM4lK1pvJmVrLYnuf_hUm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D106F700065; Wed,  3 Sep 2025 05:27:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXipOkXRca9w
Date: Wed, 03 Sep 2025 11:26:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Charles Keepax" <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Message-Id: <6ba87b48-4fa5-4a32-9b73-dac6a5e8128f@app.fastmail.com>
In-Reply-To: <20250903080558.GC2163762@google.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-13-arnd@kernel.org>
 <20250902124427.GM2163762@google.com>
 <5a683d99-b323-4ab7-bf0a-e91436ffd301@app.fastmail.com>
 <20250903080558.GC2163762@google.com>
Subject: Re: [PATCH 12/21] mfd: arizona: make legacy gpiolib interface optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Sep 3, 2025, at 10:05, Lee Jones wrote:
> On Tue, 02 Sep 2025, Arnd Bergmann wrote:

>> Making those platforms 'select GPIOLIB_LEGACY' is technically
>> incorrect since they don't need the legayc interfaces, but it
>> would be a temporary workaround until wlf_cragg_6410 is
>> gone.
>
> I've applied the patches for now in the hope that these can get cleaned
> away at one point.

Thanks a lot!

Cleaning these up eventually is definition the idea here, hiding
the interfaces in an #ifdef block should both help catch any
remaining accidental users, and make it trivial to remove the
remnants when they are no longer needed.

     Arnd

