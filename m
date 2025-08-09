Return-Path: <linux-gpio+bounces-24119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE41B1F63C
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 22:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0B7C189D800
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 20:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CEF275B1C;
	Sat,  9 Aug 2025 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Jg9iK4zs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ntVW/R5D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318E9282FA;
	Sat,  9 Aug 2025 20:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754772951; cv=none; b=HKULOEg+lzRUtcuSrgMgX/+Q33R7Q2JTTnKJGTsopJD0pDb6WiyiOZPqoSw7oHjcSpYmYPOXEYbJhUbRxFKMrXOzFLQQ/0alBbY67PD6hJc7JJQi8NcgC/VN4PUwweHkfAryos/Q//LNyElaIHrvxotr9Tuio3xEIaJTol8Kc18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754772951; c=relaxed/simple;
	bh=XsAY+I0V7t/bRiWxTGrMkkPV2nHwxaPbF8aYmtcLFvk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lKduQFtfALkZQGl5LG30heQN9vQi+QSSzBzripOiPw0aojfgabq0IEMw6dpBHMEAdvPxNzfeOdn9cJImUrEY4IcONHzZb4d44bouDFrdidziB9BCRbEYm/kVw+tGxQmz4ul6qeg3KfZx82o4B5cIwmDOPennUjWX2U+plXODm2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Jg9iK4zs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ntVW/R5D; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 23975EC1B60;
	Sat,  9 Aug 2025 16:55:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 09 Aug 2025 16:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1754772948;
	 x=1754859348; bh=00YVrUoOFUKa6IxONMxJUOwOGEtIYHYtjitPZW1x3IE=; b=
	Jg9iK4zsVrcSNzL7z+rrq84jWqLk1zRD1iqIsk+Mu9dCH9RTmeB1aQKDQr1o8uTF
	y/23h/KPABlNR4yM/1pxj081Jdxr+vxVe806APntun8g5l/dwW6aESTn6kghyyjl
	cdciLqQzn2OCbH4PJENs1D9+mfSeS6gKgvEtpQ7loNtxd+zMdlsrv9vjU8KRmk0h
	KLj+I0ROjcT5Y1oeh8mtDVPKc5gqm9RyYOJh80Q44UQD+ph0k4yiRAb/I1zoH26a
	jf4kOQVrSfS+dBTsVlCDL1K+KVq2mxVkGV3G8y+53/MvineuC/eoAtWZvgCdxZfb
	kz4xAPxMmPUaDxD53rzxhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754772948; x=
	1754859348; bh=00YVrUoOFUKa6IxONMxJUOwOGEtIYHYtjitPZW1x3IE=; b=n
	tVW/R5DgLVbkRloe9XDClBFnyi4JDvhoBL20PPTR9S1Hj21jpDl1k0GrDz49tugI
	O7xaWP6ZoCMin5uXJcmgtfsxOIRPoNkBVTQzP50Ya9IcD07Hw2Inaw8uSxWaVnwy
	RsweeH/DJje84I5FlAZim04Vo427aUdcmzYSw5LggV79rQG6Tw1c+78Z1XnQB1PO
	M7xCqGfyXXbHwGk4XlwPGfetDaz73s8jGCeGo+Z0bFM4kfH/3yEMvtTFBxdLiLlw
	lYkMdDe8YCXqVDsvnGadkoh/3X64ULktwWaxJDqcHOSpntLJyHNn9dXIq74cZB+5
	N+Mk2WyKckEzK3XREk3/A==
X-ME-Sender: <xms:07WXaHgYftGCsEsXKay4RpEZnBmoFOYUoD3AhSOOXeJ2pYBfNI2Bqw>
    <xme:07WXaEBXQmNuveUsEAH3XJS8yslcvkNxyERzgsoOgqmCDRXjzjhqsImc3ChtMmDID
    CrClTIqgHhrIxQEL-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdejjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrmhhkodhkvghrnhgvlhesrghrmhhlihhnuhigrdhorhhgrdhukh
    dprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepfhhlohhrihgr
    nhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopegurghvvg
    hmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepjhhonhgrshdrghhorhhskhhi
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhihlhgvhhgvnhgurhihuggvvhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehnohhlthgrrhhisehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepohhlthgvrghnvhesghhmrghilhdrtghomhdprhgtphhtthhopegvughumhgrii
    gvthesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:07WXaL1-ogyBNb0r8R7_iZpGWcknUJAj5KtzXICrWGLyDeWOQiaIcQ>
    <xmx:07WXaEyd7z1-FDOlp4f73uKovhiLJ6fQIxVU-_dA5vebEo5lTNfAXw>
    <xmx:07WXaCj0J53nf21ROP5Ne1zI1JoTUrXKGGbEfJ9r8A1jHZdmEpsf3A>
    <xmx:07WXaLyAZzGALNGV7e71uIfNxQERLUOMvBuBHo9cxoB5UtpHMXFsBw>
    <xmx:1LWXaKUe3IoRcX5CNiy-Nrf3lbh75lvGrvd8afyoO2aEdDjxH9kkL2_s>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 22BAD700068; Sat,  9 Aug 2025 16:55:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfbba8c937fccaf1f
Date: Sat, 09 Aug 2025 22:55:26 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jonas Gorski" <jonas.gorski@gmail.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Vladimir Oltean" <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 "Kyle Hendry" <kylehendrydev@gmail.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>, Netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <ba75ec03-f790-41e9-916d-a14eb52aadd2@app.fastmail.com>
In-Reply-To: 
 <CAOiHx=mW8B2vQ7UhauPJpJ9KmtxTZ2-1MC3Vf2uNF9RaJ4WQ5A@mail.gmail.com>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-16-arnd@kernel.org>
 <CAOiHx=mW8B2vQ7UhauPJpJ9KmtxTZ2-1MC3Vf2uNF9RaJ4WQ5A@mail.gmail.com>
Subject: Re: [PATCH 15/21] dsa: b53: hide legacy gpiolib usage on non-mips
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 9, 2025, at 12:01, Jonas Gorski wrote:
> On Fri, Aug 8, 2025 at 5:23=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>
> Can't really test this (no matching hardware), but with the code issue=
s fixed
>
> Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>

Thanks! I've added the fixes you suggested and made sure it
actually builds on mips. I had done lots of randconfig tested
on arm and x86, but since that code block is only built on
mips, I missed my mistakes.

     Arnd

