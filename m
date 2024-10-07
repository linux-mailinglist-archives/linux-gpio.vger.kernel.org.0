Return-Path: <linux-gpio+bounces-11004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A89939B0
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 00:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85A96B22AED
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 22:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0421D18C92F;
	Mon,  7 Oct 2024 22:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="YdfS+yTh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d8M4BW7p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CBF18A6DC;
	Mon,  7 Oct 2024 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728338440; cv=none; b=LkMLHKOdO+bV2cOHUsH4ylKmAsm5kgmEher/Lr3XUQvK81JL/7KR9zQATKgkGmK6+0Niw51E3QZ92wuNAPaf3IakHT1p0J0wXKsZciccHQarzGd+Engzz8wm4MexIRUGnn6iLL1zfAio7XZ/l+4uwhMSXkomQzFY0xko5OvH6Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728338440; c=relaxed/simple;
	bh=8MGjHLcPfor176C2qaxI3PZiid5KTtSQyJIx4hyCaMo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JGe8sbRfzbv0lh9ARq1tm1KXI1hIEdcu8mcRAQmrEUmpS11n/rZiETpPH3d7CeJXm1N5Y9AB8nm//B818SHB5pcZmbNeWb6trdNH6FhDG6Rjl5uj8t5HDer+ZNT6aP6gZhiuh6O135bvymH9uWZUrab1nrXBgKhn8tcwyfW5ze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=YdfS+yTh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d8M4BW7p; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id EFB46138052E;
	Mon,  7 Oct 2024 18:00:36 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 07 Oct 2024 18:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728338436;
	 x=1728424836; bh=5JiQuyLUw9iJEfVpGdt3EWnmKoGuElqHHiF7L+srvec=; b=
	YdfS+yThGQF9ZwoeO0+VWKzTb0vmZEMDlqGYKmxE9743bMHSdbJTq1+CUU17aDM9
	F+0H82OG/g9Ul8Kn71hG7tBGDw021W2EmGSKk6qdVpZ93PjlGd/oFxXKvUpJgRyA
	EtIooQLVs1ShVR+0l2yT5qqBZeWJA9HpJ9EvN52xsxL6rdV3uKET9XcbaKcFy1jl
	ms2rjQn70QVYUCV/HknLFZMiDgTKcghLlZ+Y/k4ozxekG9weB7lYdf979P1u9Gpb
	Q/Keb5WnUbEgnuhfK/CF47QQUBKLu2mkho1X/WBynh86z4NylSrITv+HqkaXpqrb
	vUTHCGN7NeLsd3ZxXmDDcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728338436; x=
	1728424836; bh=5JiQuyLUw9iJEfVpGdt3EWnmKoGuElqHHiF7L+srvec=; b=d
	8M4BW7pmiBqRO4sgKn+dq0cmGZ0enhqFjezrsBs6r2Zed1ugRUTwjjHEzwInuDiW
	2lrvgz66Ry6oNPyztvbB0dJ05WgnNBwaNzNklnYCmdSLUxnBB0fAy8cuxithS7g0
	gYgV/i3XDYI5zcyaLhn1NB/Ng5MEoTw8UaMTYojSJvPww9TXfNy7x4Fz1eV/Yjth
	RUvMUDJwrl082R/buVH6GLcG+Y53E7TAnZO1/Qyn2RjbtTkzEbZUAsDUt7vi/a99
	MbNr/2vWJJJtiZKsvIltY3nlU3Avk0YxlQ4brTVv4lrk7P+q0fT6u8pLmEtW/cSo
	aW1oTFCIS7AnnOJT/UKYg==
X-ME-Sender: <xms:BFoEZ-7J1UWDhwcpFWt4alfHUkvnLO9kBdZ_twyRJeNcy6AEpdD8gQ>
    <xme:BFoEZ37q0KK8uPwrvhygmlWOpOspFYlDcmO-Lx03EAWFXDB5awqzZ9HXzYtLvYRkF
    of8rqhIkuSWDwe4I5U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeftddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepveejheeujefgfeeugfefvdffhffhfeeutdelgffg
    keethfeggfetjeekvddukeetnecuffhomhgrihhnpehoiihlrggsshdrohhrghdplhhinh
    hkshihshdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghr
    mhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthhtvgessggrhihlihgsrhgvrdgtoh
    hmpdhrtghpthhtohepvgiggiiggihktgesghgvthhgohhoghhlvghofhhfrdhmvgdprhgt
    phhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhonhhrrgguhigstghi
    oheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehs
    sghohigusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:BFoEZ9djKW1LU7NDfnVc9CW7Nmy5oF5V1gVK4hQKZpMG-KxYEfE_DQ>
    <xmx:BFoEZ7IYamvRQN1NxDGy_LoDsz99BK1eqKa0NDaAd7NiRTS3nxiDXg>
    <xmx:BFoEZyI0uGqG7jWdx5l_DIQMATIw7dg83ek2Jh3X042BmvSxWyF_Ow>
    <xmx:BFoEZ8xag_taR9KB569b6Rsqpu3u-x6Oaw9UmKaYODPxCcoRtRTFeg>
    <xmx:BFoEZ34p-EbYbSsp2X7KuEPhpLsR_5fTwHczPH5yPo_MDUOtKIPqqofC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6CFEB222006F; Mon,  7 Oct 2024 18:00:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 07 Oct 2024 22:00:04 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Karl Chan" <exxxxkc@getgoogleoff.me>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <ad82005d-729d-4165-afa5-61ca82382bc5@app.fastmail.com>
In-Reply-To: 
 <CACRpkdbj8fkQf38n0t-==cFZj55TPgoTGM-dzESWgeRGfPHofQ@mail.gmail.com>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <CACRpkdbj8fkQf38n0t-==cFZj55TPgoTGM-dzESWgeRGfPHofQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024, at 20:23, Linus Walleij wrote:
> On Mon, Oct 7, 2024 at 6:35=E2=80=AFPM Karl Chan <exxxxkc@getgoogleoff=
.me> wrote:
>
> Starting kernel ...
>
> undefined instruction
> pc : [<41208004>]          lr : [<4a921f8f>]
> reloc pc : [<41208004>]    lr : [<4a921f8f>]
> sp : 4a822838  ip : 00000001     fp : 00000000
> r10: 4a83b914  r9 : 4a822ea0     r8 : 00000000
> r7 : 00000000  r6 : 41208000     r5 : 4a97d848  r4 : 00000000
> r3 : 644d5241  r2 : 4a0ae000     r1 : 08040001  r0 : 00000000
> Flags: nzCV  IRQs off  FIQs off  Mode SVC_32
> Resetting CPU ...
>
> resetting ...
>
> So perhaps someone knows how we can get around this.
>
> It seems to me the U-Boot is in 32bit mode and tries to just
> execute an Aarch64 binary and that doesn't work.
>
> What we need is a 32bit mode preamble that can switch
> the machine to Aarch64 and continue.

I found this older patch for u-boot about a similar problem
on sunxi machines:

https://patchwork.ozlabs.org/project/uboot/patch/1480902750-839-12-git-s=
end-email-andre.przywara@arm.com/#1528602

Karl, do you have the u-boot sources for this board? I found
a source tarball for kernel (both in 32-bit and 64-bit
mode) and userland on this machines at

https://support.linksys.com/kb/article/316-en/

but the u-boot sources in there don't seem to match the binary
(they are only used to build the u-boot tools, but not the
actual loader). Is this the same base you are working from,
or do you have something else beyond that?

      Arnd

