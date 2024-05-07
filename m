Return-Path: <linux-gpio+bounces-6180-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE548BDC84
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 09:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 115E1B2172C
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 07:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6770C13B28D;
	Tue,  7 May 2024 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="w3z8PGs/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE61A59;
	Tue,  7 May 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715067459; cv=none; b=AHvT5I/ofNV/rkuBVn2kymj7cJvxaPBJ7qFrrZyV91D7ma3TwpkgjuQVes9YfbJxjIIbkV8k/CGHQP6WnqAQf428wUbZtysju9Pj5HhdOcb0HGy5GVjbkVVKzTZFJwmlBJ7E1gxz4fEe/Su0ubhKG6eMtTUHbtPZXzb8S9EVFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715067459; c=relaxed/simple;
	bh=+qOvWpCPeGXeR+th07JcopTU+AMMcDLmUqMDEaLPrbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k+tvBCVfeKhLX7WiqMnJ254s76M/+lieQDSaJsQ57Xae3GWVjYfC5Mf6Dg7kohACvztD1e5vY5INLUYSuAYd10NMjUPcGnJBg9IBoAgeej0N54vJRVfyrF8Fhza0nz+UT/VFgacmQoJ9hvYHt8dkCxogPTT8FgG5y9AjW8vnGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=w3z8PGs/; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Jl1NeGniwVxQ4c/mZS2EMNJQFZCarzGd7D0TSvYG1NE=; b=w3z8PGs/vTTI6QvG1ZKTAdLe7V
	riiCxlu+m887K0HETKDn2d9KviI5AMoCwh6yYlux6tvAsbeM4DDfK0/EVPOkkFZruPFiT+37Ig+o+
	w1omOc4YItZvWWMVF08gVo6tjFjxcmImd47aKN2vWLAdJeaGLZn5uWj5PkFJsn5j+4i9LA8eSY+mX
	yKTgp/zsipkW4yf1Sa0QmAEnbDLn4tOEMsa+3yccqc/bsZnaKzZXuDQLKVJwI1J0WJlFrtA5M8w/a
	mCaLrjLEd5gtymI/IVA8eJSchKPC7/1xCKUXyTDvJ49KErmJLbFa+H/vJJzKcjnCLBEokuj7fErE3
	Hmaj0gzg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1s4FOE-000GoJ-32; Tue, 07 May 2024 09:37:30 +0200
Received: from [87.49.147.101] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1s4FOC-000D6a-38;
	Tue, 07 May 2024 09:37:29 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Russell King" <linux@armlinux.org.uk>,  "Shawn Guo"
 <shawnguo@kernel.org>,  "Sascha Hauer" <s.hauer@pengutronix.de>,
  "Pengutronix Kernel Team" <kernel@pengutronix.de>,  "Fabio Estevam"
 <festevam@gmail.com>,  "Dong Aisheng" <aisheng.dong@nxp.com>,  "Jacky Bai"
 <ping.bai@nxp.com>,  "Linus Walleij" <linus.walleij@linaro.org>,  "Rasmus
 Villemoes" <rasmus.villemoes@prevas.dk>,
  linux-arm-kernel@lists.infradead.org,  imx@lists.linux.dev,
  linux-kernel@vger.kernel.org,  "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] pinctrl: freescale: Use CONFIG_SOC_IMXRT to
 guard i.MX RT1xxx drivers
In-Reply-To: <8accb26e-c7a8-43aa-90d5-d83d5a1575de@app.fastmail.com> (Arnd
	Bergmann's message of "Mon, 06 May 2024 13:29:43 +0200")
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
	<20240506-imx-pinctrl-optional-v2-2-bdff75085156@geanix.com>
	<8accb26e-c7a8-43aa-90d5-d83d5a1575de@app.fastmail.com>
Date: Tue, 07 May 2024 09:37:28 +0200
Message-ID: <87r0eef4xz.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27267/Mon May  6 10:24:34 2024)

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Mon, May 6, 2024, at 12:23, Esben Haabendal wrote:
>>
>>  config PINCTRL_IMXRT1050
>>  	bool "IMXRT1050 pinctrl driver"
>> -	depends on ARCH_MXC
>> +	depends on SOC_IMXRT
>> +	default SOC_IMXRT
>>  	select PINCTRL_IMX
>>  	help
>>  	  Say Y here to enable the imxrt1050 pinctrl driver
>
> Maybe make this
>
>        depends on SOC_IMXRT || COMPILE_TEST

That is done in patch 3/3.

> I see that all the i.MX pinctrl drivers are currently missing
> this, but a lot of other platforms have the ||COMPILE_TEST
> bit so it gets included in x86 allmodconfig tests that
> often gets run before sending or merging changes.

Take a look at patch 3/3 in this series. It does a wholesale addition of
||COMPILE_TEST to these drivers.

/Esben

