Return-Path: <linux-gpio+bounces-24320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B9B233CF
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 20:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57EB517928B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 18:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE70A2FD1A2;
	Tue, 12 Aug 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b="KNiCd7r1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from serval.cherry.relay.mailchannels.net (serval.cherry.relay.mailchannels.net [23.83.223.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653B27FB12;
	Tue, 12 Aug 2025 18:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755023313; cv=pass; b=qTFHg+kXQ7Dg4aZSbc5Ulue0k5y9Rve+QJu6e2lCaq8eCPhhIo0bzcqp+gaU9gbeusGFWoAYo0JWG4IWz4ZXVBCnWxsLg8SIfU+Ym8Sq0MzDqlQdb9nlbJxSBE63VRl2eSdEvTS/5hlbLfVGb/TIChIfJgMbWzxQuJaW/FJOMnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755023313; c=relaxed/simple;
	bh=cJDx5bPkVpePShsYNiKWRMAX4Gx9qowmppDY1TwXCqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dq66WgeCR8o6WeMwdXCbSLr39s/4Oe/I7i0cXpA4R0Xok6kUND9IXQQRtphZnyuByebLcpQJoTa6Li5JHaAPVLC1krtAhfG6OvbHwx4UD+exfe5rgEJbHhRQzrFQSdDK/pxymIMMp/MUCOoXXLOVvb4EVx52Vl7/CZ/yeIOatQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net; spf=pass smtp.mailfrom=landley.net; dkim=pass (2048-bit key) header.d=landley.net header.i=@landley.net header.b=KNiCd7r1; arc=pass smtp.client-ip=23.83.223.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=landley.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 29C268A5AA5;
	Tue, 12 Aug 2025 18:28:25 +0000 (UTC)
Received: from pdx1-sub0-mail-a237.dreamhost.com (trex-blue-4.trex.outbound.svc.cluster.local [100.96.11.113])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A1A628A3D30;
	Tue, 12 Aug 2025 18:28:24 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1755023304; a=rsa-sha256;
	cv=none;
	b=of4d9MxsIGx5XYLE3k0JJmJMkChgT7yf3tY8yC6dPZ6qLP1W/UiY22FyzPW1YKDAsdTmHb
	KjWxRHwd3z7eG3l34e9HHTxAnWvTfA9IIbd+RB5+Fem3SZuBqAx+QEYLqgPDJCifPv2ilG
	5qyvjZ5dBjCOYhcVyYpbzRSP9qpc4twng/85PbhO98LrW/O3TyYO87DIW0VIJjGR7vbtsL
	T1JvlR+d2MIBPxTeIvbqJmxbYz61UvnWAO6uzJeDpLvc9m0h+s2tvpIqr1ort6XVn52ZY8
	+yHPKW+X0AMCVdNEEH/jBwDJSET0Oze9w0t2X2JmHPCurLsFP+wVihNgnTgfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1755023304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=G0BwvjxLWObEoHX6a+jb+xo//aMCs9IIwTkQd1DlCwU=;
	b=Os0r0Z0C1HfXUkphrSHL1WEWqeVrsnJRLOqbASZnOvzNoU2hEAnac1n8gXUvykxBf1W/5a
	NWT3n3xrVz3vogEPjFe9P7vCVweQhHhYf6VrvW0lsRVUffFFHr4dRyalMzPDOahiTJv037
	PoTfus1EJok/+2ebGrPmmFEQpDsteLY8M6Ct9vTasJrbAq9xEGP0y7Uk7vg12kzsaLStbh
	HtCwMp4PcIR2dwT8Jw+nPCPvXLxmxKQvxoOlz/GQzV6GCSIOOUUUieJ7qrLPoSphYgpJsb
	UAEhJmtTKB2zC3o0bhBdxxekCoDGBLLHqQbpcUMWEXr7nTLGgAT90WP2v9gg6A==
ARC-Authentication-Results: i=1;
	rspamd-865b9ccc6c-pzxc5;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=rob@landley.net
X-Sender-Id: dreamhost|x-authsender|rob@landley.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|rob@landley.net
X-MailChannels-Auth-Id: dreamhost
X-Decisive-Imminent: 294d0cf22e727b5b_1755023305034_86580021
X-MC-Loop-Signature: 1755023305034:2514471681
X-MC-Ingress-Time: 1755023305034
Received: from pdx1-sub0-mail-a237.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.11.113 (trex/7.1.3);
	Tue, 12 Aug 2025 18:28:25 +0000
Received: from [192.168.88.7] (unknown [209.81.127.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: rob@landley.net)
	by pdx1-sub0-mail-a237.dreamhost.com (Postfix) with ESMTPSA id 4c1g473B6Sz1P;
	Tue, 12 Aug 2025 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=landley.net;
	s=dreamhost; t=1755023304;
	bh=G0BwvjxLWObEoHX6a+jb+xo//aMCs9IIwTkQd1DlCwU=;
	h=Date:Subject:To:Cc:From:Content-Type:Content-Transfer-Encoding;
	b=KNiCd7r1xZYcSPNdgst6z2cUqYJHvWLVJWHu8iAdXQ1ywxSoNr8tKip9TYr4jqL/j
	 kC2/2TPz7eiNcf/JT9gSAeS7rJwnANrvFuTlwGfx3vAvw3DMY/5JVE11pOljPi/aK1
	 AnVChT5QEfbtlC5Ksk8E1wDjIM3g92wp27IOY0Ku/ZtQbs0R8a1xyv3iEXlnU/aHfp
	 VYaN3UpdnF6rSYJgZjuMuBIf6bs/2aXGq9RrAzjcItsZFVAZsEfE75t8/xdc1mU2o9
	 JHNUhwAGqiC3qPNEBNnrVLo0EtIYju2ocbS4ZChsakO6t7ZY2A3ZFXxKBbt7Uu0BLY
	 5TsdwOHsMzPhQ==
Message-ID: <543b5d42-a007-4f13-824e-1f8a27dfbd33@landley.net>
Date: Tue, 12 Aug 2025 13:28:22 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/21] sh: select legacy gpiolib interface
To: Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Rostedt <rostedt@goodmis.org>, "Paul E. McKenney"
 <paulmck@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Dave Vasilevsky <dave@vasilevsky.ca>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-5-arnd@kernel.org>
Content-Language: en-US
From: Rob Landley <rob@landley.net>
In-Reply-To: <20250808151822.536879-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/25 10:17, Arnd Bergmann wrote:
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index d5795067befa..d60f1d5a94c0 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -462,6 +462,7 @@ config CPU_SUBTYPE_SHX3
>   	select CPU_SHX3
>   	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>   	select GPIOLIB
> +	select GPIOLIB_LEGACY
>   	select PINCTRL

Is there a reason to have both rather than having GPIOLIB_LEGACY select 
GPIOLIB? (Does the legacy one ever NOT use the new one?)

Rob

