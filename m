Return-Path: <linux-gpio+bounces-23796-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE086B10D51
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 16:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DA477B665B
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 14:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E612E2E11B9;
	Thu, 24 Jul 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="W/zn3Tky";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cHAVPLWP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470FD2DCF41;
	Thu, 24 Jul 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366970; cv=none; b=Ipo6/peS7oLzw1SUiORRdXLjP/aG1Cn7rFob6d4fLlTaloq3U/5r2j6u1S+j26YGO/h4/M1rDosANdSXQYe72+LsiiM80KvWF2H+jMB7ZbzQYB52q+W66hI1mpDJhj3Jg38XnTLtsVKA8yy6hB+xWtf9ECdKt3m+vMpSBynXjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366970; c=relaxed/simple;
	bh=JiiQvSvtnleJ4YeOzsjR4ouMs3tIuQR5gjtGv7cY2Yk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XCQ88UhzzjxNq8nqJDeU1WvGbmCZ7p6XXOfBkBDisCJfSpBmj/uACSC+guf/BUmRna6Ju8Fy9GNbPr+LNpeRk7HOX1DOYZm0SUY7zzr1ywLcIK7VJrt6FGy73kbzEz6iw9gmqIncdmsRONNxIK3jPEdkHK7MwTdASabfmAhGGdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=W/zn3Tky; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cHAVPLWP; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D81F57A0082;
	Thu, 24 Jul 2025 10:22:45 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 24 Jul 2025 10:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753366965;
	 x=1753453365; bh=D1BFtYvNytY7n6WA2cF9mKqHK8zr2PNpe+w80ssdmk4=; b=
	W/zn3Tky0wYkKJc6EFVvfXB05VAS0SzySBJBOHD0svrx6morGL4Ah56gIiM9sBTd
	m0EOBPU6Rblj9GNBZXE0In9/3Gglz7B5MgCKunXobe0Pl9Yy7FJ8YOwbI4Ju8zU1
	2VvwhHKalFmjjyQqPLwGtS7WnE8G78a/w6k+mTOpsNQnzfYQUzajTQIwU5Xjvnld
	/2bR3Tjd+QeVYeqYuHW+KHy+CZ12eXLO0kkpP5EYBxI5PFyTsqB97zxrqs7yPbfY
	6cUljWZ1nOvd1I70NEyraDPaBgH6Cn6pEh5Wp8pxNXFLZx5aBR7VLb89lQaVfBVu
	sgafvN1qt3uaCx+OpTnuGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753366965; x=
	1753453365; bh=D1BFtYvNytY7n6WA2cF9mKqHK8zr2PNpe+w80ssdmk4=; b=c
	HAVPLWPoiKouhcd5ZrBVFwPcZADMa9TUESiG9uQt5h8FwWm+zwko2PgyH9jp7Dq+
	wo1et97lfShtkYtox7C4C7w9ZQdr0o3Dg/wTvaL1I81FicRyUPLbemNyd8+4aRcY
	lcr3ZbwWrHkhH6890cTY6Pech1sC4y7zwTVOp8TpjE2W6IOdNDwdzrUH9F/1GeAP
	zNmVegHIvvLFBWua33Y49nFQRTxcQ4ZECCv1KgSQM1fT4HLDJy2dxCVYz6J7o6oi
	qvdTdeuh4KqbefMIX6S1VqiuJMA3foCfaxSxh32i/wZyNx2Uth4P+XcUeekrQI6x
	TriyBjDFb1o3dJPQ2bCQw==
X-ME-Sender: <xms:tEGCaDr-UD_PZgUmqnBYeiKAANphdE_TggqnOeyX2R26NR6q3xj2oQ>
    <xme:tEGCaNp2Uqv-EdT0en0Pwuf_hfyg4HcB4KYDC_Pc06I8C4bviIbfT5nHDwegSNots
    6C-p0jhjE7retCU3Zc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektdekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehkohhitghhih
    hrohdruggvnhestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehgvggvrhhtodhr
    vghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghnuggvrhdrsh
    hvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hukhhlvghinhgvkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigr
    lhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvh
    gthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:tUGCaAYLgycm_fBe69RDVR4YXpPbNUbnrX7_JWIEO4mrxefTjT_2Pw>
    <xmx:tUGCaBU3K2nwCyShZBRqMbNxl-8AA6AlMPs-bYAEqj5OHVY8ijHgVg>
    <xmx:tUGCaIHxrP2GNDMWiitJV_8H7_46YRVStA9lRvt3shYeKB7_1d74rQ>
    <xmx:tUGCaLbEcn0tlSxiyOVdxyd5njAT1_meZGIojtOyvl8SgN4A575OfA>
    <xmx:tUGCaHf7F1qj4IURQe2H0H04eSRciyksdi3oZLVMWTnXEKtfU_T-2pMc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DC4B1700065; Thu, 24 Jul 2025 10:22:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T94b7864e561602ed
Date: Thu, 24 Jul 2025 16:22:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Peng Fan" <peng.fan@nxp.com>,
 "Lee Jones" <lee@kernel.org>, "Koichiro Den" <koichiro.den@canonical.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <c9d9eeca-b62a-4105-b65c-bf78158c42df@app.fastmail.com>
In-Reply-To: 
 <CAMRc=Mejnr8UzN93X=CWcV5jDTt9-U+Nxcm3qb=6uVV0PMiZVQ@mail.gmail.com>
References: <20250722153634.3683927-1-arnd@kernel.org>
 <CAMRc=Mejnr8UzN93X=CWcV5jDTt9-U+Nxcm3qb=6uVV0PMiZVQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: make legacy interfaces optional
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025, at 10:39, Bartosz Golaszewski wrote:
> On Tue, Jul 22, 2025 at 5:36=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:

>>  #include <linux/types.h>
>> +#ifdef CONFIG_GPIOLIB
>> +#include <linux/gpio/consumer.h>
>
> I want to queue this ASAP but do we really need this guard here?
> consumer.h already guards against !CONFIG_GPIOLIB internally, right?

I was trying to not change the behavior here. linux/gpio/consumer.h has
an #ifdef check but has the #else portion with empty stubs that can
be used by any driver that includes it, while drivers that include
linux/gpio.h never saw the stub version.

     Arnd

