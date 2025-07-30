Return-Path: <linux-gpio+bounces-23892-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DA0B15B57
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 11:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F95A3ABAF0
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2D226CE08;
	Wed, 30 Jul 2025 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YiiO+s0d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F53E255F4C;
	Wed, 30 Jul 2025 09:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867082; cv=none; b=OqBPoAa1E75ou+JHCHJ+Li8h+tWia3eWOntovsQIxhoF9TweQ0+9oLezdlf8UUMwJUFThqty2aSkvDC3KCT04ytX/T/9rDum2HDD6v6Q49Jb5NXyjeyUQwiyDaTDSw+uHzCp7BtJ1B/8acdGmF9VAJKR/8bfRAxVnotlYke8too=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867082; c=relaxed/simple;
	bh=h6yGFTzSbbPIM+l71zfwBjl9gFp/4RDVYaLZu+XyfXY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GX8I3wTs2i+0nH32Q/KXiO3VjPbWW15Hk7iR6s2Ym7Y9YVJvsf54K/gUj5k+UW/j4KlPfy2Pe293Gg0Jxn493MoVz/KiuhT3XlsjnXlBc1oZhXb4U4y+iRL2GSmCJ5/nxpe2+np4Sw9kqaJ3TaBFyA1geGJZDfLgdYQLF4QQdzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YiiO+s0d; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC5C21F6BE;
	Wed, 30 Jul 2025 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753867078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yjpl5P036SzcXdZApIpw3yupiX65ZpgCi/JEAYydfII=;
	b=YiiO+s0d37LZ9m5y4kzMD1QTAn+DwVlPjGwKIHBc4N2yry3xKv7QSlfFBbzDpMQWJ0/KaI
	9I74izbx3XPoxTdKtc+mKlEAMlJkoVrLiwgnCCPFBM4c37qmjOPwEJt3z+ENTvZ8yk+U+e
	01DMMY2JTqGlpI3eqBVSuf8MDG4671+9+FWDqCsG8W+jLyh1mRiGBWH2vWoo4JPCfYnaLf
	gSB2Hywk5IAtJl82BvQw2ctOjjGVETk4+cr5an67pKSjMctAv6N6b0oniLcSJ+TWlf7zGI
	1bIqzVvWCk3NuKd8sHYTip5+CXeNopQy7ODoKPEqBI+ARcJxpZR+SEFiLMXwCA==
Date: Wed, 30 Jul 2025 11:17:55 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Hoan Tran <hoan@os.amperecomputing.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Saravana Kannan <saravanak@google.com>, Serge
 Semin <fancer.lancer@gmail.com>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Miquel
 Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/6] dt-bindings: gpio: snps,dw-apb: Add support for
 Renesas RZ/N1
Message-ID: <20250730111755.24aa16b2@bootlin.com>
In-Reply-To: <20250729181151.GA530390-robh@kernel.org>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
	<20250725152618.32886-2-herve.codina@bootlin.com>
	<20250729181151.GA530390-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeljeehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhohgrnhesohhsrdgrmhhpvghrvggtohhmphhuthhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgut
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com

Hi Rob,

On Tue, 29 Jul 2025 13:11:51 -0500
Rob Herring <robh@kernel.org> wrote:

> On Fri, Jul 25, 2025 at 05:26:10PM +0200, Herve Codina wrote:
> > The RZ/N1 SoCs uses the Synopsys DesignWare IP to handle GPIO blocks.
> > 
> > Add RZ/N1 SoC and family compatible strings.  
> 
> Why? Yes, that's policy, but so far we avoided it on this IP. Perhaps 
> because it is simple enough. So what's different here?

I've just followed Renesas policy.

Nothing other than this policy justifies the change and so, I can remove
the Renesas compatible strings. In other words, I can simply remove this
patch.

Best regards,
Hervé

