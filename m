Return-Path: <linux-gpio+bounces-19592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94BAA8C8C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 08:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E8427A6773
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 06:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940BA1C84BB;
	Mon,  5 May 2025 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="bvSXHLOD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GIvU43Jf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848F35975;
	Mon,  5 May 2025 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428391; cv=none; b=N2pLsOaLp79u7nHDXAy7KpmpwrZrl2M7GqlWzoVms+G2pm6UlN0MUzQvVAZkoz8LtZxIdS1dXbUSl45FiaCqUlJ2xJthbaAKODW5D8AMbGHE4YM+8QSAZ5MyTPrmral+aNwDFDON8XFtcwoXY+IyHbkf9bduhPr9MiyZ3hfvY8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428391; c=relaxed/simple;
	bh=PvZkAC1p6miR8BdD0aPYFjwjjlyc2CYQGUOtkR9iW3Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IFxzzCLrpricNANQEPYEqUt17DPvbXW5nzGiE6di51FG9qN2BYXUVNMT/Cil2haU60/S+l4Opee7CPFtBgmbn3vTv6JsPo1pkbWITaI9GAxaik4qCF6ooxPQCrEGPQqgGX+bun3U+bZzwx0WvgnXP71l+grJmJVrdGLj8BVQRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=bvSXHLOD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GIvU43Jf; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8466B11401D1;
	Mon,  5 May 2025 02:59:48 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Mon, 05 May 2025 02:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746428388;
	 x=1746514788; bh=ph0/Qsasw+NuHbVZBR8UX1GYDm+iNCflYmykOxWp1rs=; b=
	bvSXHLODqcdp4TJa6esttUUUOhclNJPWvhTocOAVK37TjoowooTFpw0LmWn1OML0
	+JGtqUORYl7VO+5oucPamgYZtAWR947XwRu9QrFbTHSKzk92MsBqFeXz9uVvafM6
	1O756M4MJxZCAwY0bj33v76Hq6OhAob0I/Prgekexi1nLS8vGCawP6dm0oMPaxEy
	fnlkhS5FAzH1Vs8Pf1uTtddWL8c0mMUN0dk0G1ENi69Yg1//+CvM+B62nk3E3Bmq
	kcAqkN1VZT+quWs5Wt4Ji1OL+LvG45WGSGiYHKxG4dO1sdr0S0s2LgTgFQMFeZLF
	VxucufZX8mPVxpIUetsrzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746428388; x=
	1746514788; bh=ph0/Qsasw+NuHbVZBR8UX1GYDm+iNCflYmykOxWp1rs=; b=G
	IvU43Jf5DACJOOQ1rcFSF4tuu9qw3ei54NOAmp5Zs4keoIubPsxI1JuujDJVnza1
	k3ruvj+HoaPt3zuUuk6FIUBWii2hCHcXSIPMlS8BVSUzzfCR/Y/kgg0z5H4x9OkB
	dbq04GDD5Jh9eUmUBSjECKv2vyfFJSoWXrSIHvzTCpFW3ecX+2USGK3/nXASWhAE
	7k4XWT6OK7I/hFlhirK4qZmHwsqvW6Sr3HsgepMaCuSegFcIGASg9N8xI6Lbas/B
	hJh6ISlj7t19qqU8OXmuLHN8MClnLwcBDq7/DUOgaNNXFAueEHDk88b/YzDkSjDs
	nCILPokN0C8S8Kzud0Mxw==
X-ME-Sender: <xms:5GEYaD7KhmgZK4e0jRrdV7rmwiWsdlwU-qfsyUtfKB1jeVgFzogl8Q>
    <xme:5GEYaI7sNRgFKGR8FwlXxos5qaAABsfGyJh06K-sqh1JQIIJrMyTBLpYAFzPIbvWU
    rqb16il88Du7Jh-Nxs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedtgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepkedvuefhiedtueeijeevtdeiieejfeelveff
    feelkeeiteejffdvkefgteeuhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghrnhgusehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsiigvfihskhhise
    hlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhn
    rghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:5GEYaKekxe_t8PxnuPCVy2BX0vPRKatJfdc8QDDAcSAvUKaB2_i1lw>
    <xmx:5GEYaEKR7IlIWWePLpYndbs3KBebnodLo6MkZRQIMtOfLL-9O90EqQ>
    <xmx:5GEYaHLpVqXZ65KpxexBM0ShLnnS7GfVSxoZUfnJujx247Cumyet0A>
    <xmx:5GEYaNxtvA0qC_HgfOw7J2GIqYuFkhrfcvWHb8n3uAtLGnDs1ki-VA>
    <xmx:5GEYaGn461Vru8NSC52L7bwQjSf1r1uL5GrdcoPiUERL0GWLQW2R9xFh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 435BF1C20067; Mon,  5 May 2025 02:59:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tc52bc6a356ba0442
Date: Mon, 05 May 2025 08:59:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <e67f53bf-c6a0-451a-911a-b16da9651d06@app.fastmail.com>
In-Reply-To: 
 <CAMRc=McmsV-igk6MuvghJCuM5oThjYGqKV+dYn3=b1J0ar7fgw@mail.gmail.com>
References: <20250502203550.2053573-1-arnd@kernel.org>
 <CAMRc=McmsV-igk6MuvghJCuM5oThjYGqKV+dYn3=b1J0ar7fgw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: fix CONFIG_OF dependency
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025, at 08:50, Bartosz Golaszewski wrote:
> On Fri, May 2, 2025 at 10:36=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:

>
> I sent an alternative patch[1] which simply removes the OF_GPIO
> selection as this driver doesn't really need it at build-time.
>
> [1] https://lore.kernel.org/all/20250502100841.113091-1-brgl@bgdev.pl/

Ok, thanks. If there is no build dependency, then that is indeed
the better fix.

     Arnd

