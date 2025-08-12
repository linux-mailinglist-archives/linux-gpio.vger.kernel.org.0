Return-Path: <linux-gpio+bounces-24327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB25B23AB9
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 23:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11C3B17B4DF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 21:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 366762D876C;
	Tue, 12 Aug 2025 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Bznh4Yn7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M2JsktkK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE972D6619;
	Tue, 12 Aug 2025 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755034164; cv=none; b=a7x2Z6ba1JE9eB0nFj+7Wa0LBMlQi73VWdWqxZylVyVPminrF7lY1qVIgzG22p1Ta4/p3U/cB5cxEO7SBUgxoYQcjZHjQlEq+8tpNR2qFRsED0DuiQpJl8sZp72nYAKdRX697ChuNvXfhGlkNalqGdnuBfWk5i31dW1ZxH1GSVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755034164; c=relaxed/simple;
	bh=m+K/AlYj6sFpDViOsi+7YVub9fm04RF467U2Bgdxm4s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gBxcu16xJaUgwXuQK2lIYBSlDb8394TiiWdlWpN+1Xy7crg7qHxQ628juw8wHhz5R/EppKu3/0WlTZ0up8LhgEnGRwqivjUNb0S66l9KSikP7TqvuST8NKw7Dhj+6tVMDBQq3/7JdiR2g6FahfBkbn4IJEMCSm9cPjgBs+ynzj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Bznh4Yn7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M2JsktkK; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id DCDCD1D0011D;
	Tue, 12 Aug 2025 17:29:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 12 Aug 2025 17:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755034160;
	 x=1755120560; bh=lbs7wklbxmzRpXaW4E8RAy4dqvO2ltqvef6oxyXevvA=; b=
	Bznh4Yn7V0ie0KyWMyoEvQJOHUzGPETC4xDdS5LF7U8Gz/yqR02DoUEYwpHi9xXO
	oD0ZF757xFqRVjWs+iRYj2bR5KSZB6zEhpThknnA9IMT4Ke417jWsil5YiPdfOSd
	Ye7fARZtAZ1T9SCZlttSpCiUe6U4NoI59G1CrRy72wm2IZ++nRpVTBI5ChDQBLIq
	/ANAQIhrNdXNfUQTUXblXDrS14c0nZ6BP2T65JkCZT5XNAaFPm/2M0somUYgwyO6
	TtQuP79u+X/kuU9IxsgfaS5Gmt6M1PJQ5MQHCHqxLV1E5rPyzib2owmPDPBo3Xo8
	ZOFmIwXF4HGr4g0FUYEA6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755034160; x=
	1755120560; bh=lbs7wklbxmzRpXaW4E8RAy4dqvO2ltqvef6oxyXevvA=; b=M
	2JsktkKAbWoNiQGi2MqZqVunuBW4m5QszIndv/w35s6JwiA7qVutZ23PBjn8lZRe
	lg+VVATG9a0U0ckFqA2w0/N8GMmlpcmMLqEul3bIrBYx/DLw2T5wf13f6Ibe8zlD
	+Dr/nAJoojfYoIo7VdE5sZc+TM16p66owEKX7ghoFNgBar465QIl0mxh2yEDFawJ
	+cIaAapu+cTFyO4XwA/VV9PwLuVA+9WwXqAiqxJJyds4Ba2SeBYzDkdB+HbnKjOw
	bU8I7oeC7dPk2RsvcExcqM8/a4axXesp73b3jTL++c29cKW8NjgTjOP5q0b5sRzI
	RnwYuUrNiZn20GV4Ko4ow==
X-ME-Sender: <xms:KrKbaAnSuJrr233c4CrYMALw3gG_oVU-yEdpQeBYRIOzPKIdhZANpw>
    <xme:KrKbaP2fp6PsjOsLr4s6ELlQa0fiumR2ywhDgSHmnJDftlkV9gD8bCqFfOZqM33vi
    o_ytWY3gJ0pvNgnUFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeeigeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepmhhpvgesvg
    hllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshes
    ghhlihguvghrrdgsvgdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdhorh
    hgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghs
    rghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhhmtghksehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehrohgssehlrghnughlvgihrdhnvghtpdhrtghp
    thhtohepuggrlhhirghssehlihgstgdrohhrgh
X-ME-Proxy: <xmx:KrKbaLGLANg2iu2E9nJSHOy59LLCLZBvZjrZDy4ZWbRDkVwxeamS6A>
    <xmx:KrKbaMci3nSHQPp-4KYqB3adv175iViWoJZpB3-ji7jOpbQqcdxOWg>
    <xmx:KrKbaKJXjEC95J7iwGgoxNgDY4whTIcl6PTOBbZeV7xMBfpCWhKS0Q>
    <xmx:KrKbaDp4tpq2VTJCKzfruaw1XKsOQGuSAimUeHnI6AhzR_5UcqQgbw>
    <xmx:MLKbaIswpiNVCYAkrxdlxctSUj48ckr5RFxcHZEgDzKdP_ek3rSXROgh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4915470006A; Tue, 12 Aug 2025 17:29:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 23:28:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Landley" <rob@landley.net>, "Arnd Bergmann" <arnd@kernel.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Cc: "Michael Ellerman" <mpe@ellerman.id.au>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Dave Vasilevsky" <dave@vasilevsky.ca>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <e7128300-31f7-409f-9158-c5af915ed598@app.fastmail.com>
In-Reply-To: <543b5d42-a007-4f13-824e-1f8a27dfbd33@landley.net>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-5-arnd@kernel.org>
 <543b5d42-a007-4f13-824e-1f8a27dfbd33@landley.net>
Subject: Re: [PATCH 04/21] sh: select legacy gpiolib interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Aug 12, 2025, at 20:28, Rob Landley wrote:
> On 8/8/25 10:17, Arnd Bergmann wrote:
>> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
>> index d5795067befa..d60f1d5a94c0 100644
>> --- a/arch/sh/Kconfig
>> +++ b/arch/sh/Kconfig
>> @@ -462,6 +462,7 @@ config CPU_SUBTYPE_SHX3
>>   	select CPU_SHX3
>>   	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>>   	select GPIOLIB
>> +	select GPIOLIB_LEGACY
>>   	select PINCTRL
>
> Is there a reason to have both rather than having GPIOLIB_LEGACY select 
> GPIOLIB? (Does the legacy one ever NOT use the new one?)

The way I've staged the series was

1. add GPIOLIB_LEGACY as an always-enabled symbol in 6.17
2. add the 'select' and 'depends on' for that symbol in 6.18
3. turn it off for all configs that don't select it already

Having GPIOLIB_LEGACY select GPIOLIB does sound like a nice
idea in stage 3, but that doesn't work with the first step
that's already merged now.

      Arnd

