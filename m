Return-Path: <linux-gpio+bounces-7415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1249067C7
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 10:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E15801C22D3D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 08:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BB31411E1;
	Thu, 13 Jun 2024 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="rPfp7S3H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IbOIkppC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73837140367;
	Thu, 13 Jun 2024 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718268650; cv=none; b=OWoUXV4fTHR77VQ9cAi0ij594HscfmlU0uyWbSHZuWqTGhnW+lLAuZowRZoBof/K2MQJoRNRt5qlLncRdwX+d+cdJOk2/PTeCch8Xs9cFzeDV2qxRQcd+iOellwRVLlnd1/I7SRcFtm2rYmnAWNswTtqPWnHBohStORO4FqaFp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718268650; c=relaxed/simple;
	bh=KXCXAgQ/8mCSDJW0lQx7h8JuO6D20M17zUa7fCUzY1Q=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=K5vQ+8MWzJo9YzP4V6RVnPpVAL/bhblix6Si2v67J7ND0fdUxR5UkMJRDamrk/qS8kQuZabWSNQtQQ37AOShBfHOF5v+27yCDMQpEN9iq97rAzNitG3f/WRbQVWi0ig1KnvVYNqjIpSxQSeMFySWMcuHbtnMUweZRJTj+CZpXGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=rPfp7S3H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IbOIkppC; arc=none smtp.client-ip=64.147.123.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id ECD9C1C000E9;
	Thu, 13 Jun 2024 04:50:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 13 Jun 2024 04:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718268646;
	 x=1718355046; bh=yc30Sq5q8flxrIVa1InN0nKiCPVTeJsKHwqnezpTGqQ=; b=
	rPfp7S3HfSzQZ3r9TA5s2ZHDPOXTrwNkWIw5662zm0dly4h+MMKk2bsy7zs33tjL
	bWX9QCO87ghraapH352S8zblY7ooBWRPTwfcyjdKNIFdEZOS5f16tqk66sleuFHZ
	QxdkIrHw7QTXU1kiV2/dGVwF6IcMsWUttgipLBC8IhuqsVeBEnUUmOXjTDQ1G8wO
	iIqCdpak2egq6zGMQhaF2pqoAKJsaDMY9ftD9QeZTg5KXRCk5tWxKxU3OEmTj4oH
	/BaPRRzeV71ozwmo7NTwKRzczUzBnQj5bEbiXSVCdAc1ZPpteq+5XUgjBMUx4XO/
	qYUmjCkBaYfj0zepKGC/3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718268646; x=
	1718355046; bh=yc30Sq5q8flxrIVa1InN0nKiCPVTeJsKHwqnezpTGqQ=; b=I
	bOIkppC2M7GaC485imy4rYPjPZ3gxBuxuO9jDkBZb/kbAmXd2+T/iKMyDppNWEhy
	UJeN0q8a27xrmttFWZ2+fc+Hfm7v60JU0uKMDaK3x1byQKnJYo4M+A8BaLqQ22Rb
	Z6jA2JbPIs+Cv+9Lf09qU0bdHB6bNDLXTrFEdXXPY5m+WXGxofi1jmN05Z0ih5JX
	8I4nBX4MvvlVvoRxHyUBNPC0U5Ms4UswvVo5hcvZCUyQaWE75YIsDN+18Gk1/5e8
	AN6qpKmcsH3GrNS+R7JRCjL1V5zHlSLpjIK+lRx+UFHw9YepPy9ALWkbocwXWWpZ
	RsuPvF4VTiCrxml5SEA3Q==
X-ME-Sender: <xms:5rJqZv9QStW1xBXwLbQACvwvX6dVXZNuXAyd9v4RhoUgrL6agZjbnA>
    <xme:5rJqZruyc6qU6MA9ETY0XGI-c54iBogU3YY5PdJIsnzg6lGQy8w8KMJGtDUtfSfKJ
    rma9ipymbI3jOJIKuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:5rJqZtBzm2ta7z9cL3xc37h6j17bCicn9rXW11hgpiLO0kXzN_apGw>
    <xmx:5rJqZreb4OOQtZt0vVBULo35Vop01MMWvM9eoV3gbUYd8p0HhXDjkA>
    <xmx:5rJqZkN7gE0xX5jAOUNcqjmGlhgDnQhsZUdlbNaqWf2xGBRuXHM7HA>
    <xmx:5rJqZtlJHasC_25sg0dr3K9MiHU9Gp8I5KLj2dhGCOC0Bf73n7OqTg>
    <xmx:5rJqZljwTjvLRrpLJaJJEMUT6Axi4qUX281BI0dUeo2cFAyYIj7sLokL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2AFE7B6008D; Thu, 13 Jun 2024 04:50:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
In-Reply-To: 
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
Date: Thu, 13 Jun 2024 10:50:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Kent Gibson" <warthog618@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024, at 10:27, Linus Walleij wrote:
> On Thu, Jun 13, 2024 at 10:17=E2=80=AFAM Bartosz Golaszewski <brgl@bgd=
ev.pl> wrote:
>
>> On second thought
>> though: are you sure drivers/gpio/ is the right place for it?
>
> Actually that is something I requested.
>
> I think it fits in drivers/gpio as it is such a clear cut usage of GPIO
> lines, and it doesn't really fit into any other subsystem.
>
>> May I suggest moving it over to drivers/misc/?
>
> Misc is a bit...
> messy. I remember Arnd being very sceptical about putting stuff there
> rather than creating new subsystems, so since I've tried to avoid it,
> albeit recently more and more stuff gets merged there again :/

Right, and that is mostly to avoid having code in there because
there is no other place for it. Some parts of drivers/misc should
have been a separate subsystem, some should have use an existing
subsystem, and other parts should have never been merged.

The parts of drivers/misc that make the most sense to me are
those that expose a one-of-a-kind piece of hardware as a
single character device.

This one would probably fit into drivers/misc/ better than
some other drivers we have in there, but leaving it in
drivers/gpio/ also seems fine.

I could also imagine the functionality being exposed
through drivers/iio/ in a way that is similar to an
adc, but I don't know if that would work in practice or
how much of a rewrite that would be.

      Arnd

