Return-Path: <linux-gpio+bounces-26494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E398BB91F08
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 716AA16E0C3
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8182E764D;
	Mon, 22 Sep 2025 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NPo173pW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8329D2E7197;
	Mon, 22 Sep 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555115; cv=none; b=a2VWivTonpOAJ8CmKxN2iEtt3AaSUxpUnw3JTqmNCqMbY4y8dpKc0mexZusf5LA36IiuZ1JBbvbXHi7GC4cf57twpsR1/n2HlDqh56qaM07k3b1dYb4+oBYFFl/e4JWp3SybB8DssgAX0opvwgelFz4NtkUY/6WxECLmpvWczV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555115; c=relaxed/simple;
	bh=qDAPKLAmBW+BbWlMqzRPUrZf2ejgZ/s+bak4MX7qR+k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9w0qnAHjAccAUNtACqm7fUXL1jKy/pXbfGQQOgpNZBsd46Gf/Zg5jiPNYCd3q3pZIxmpu0R68Uke77yrJ65S2kS5I0vQ/GaoogAD/2jhLkBWYbci5oFAW7YhIpfDrp+rlsf5hkG7KFvv2H+24D2nXHTqnKt1DtoN7cfnntNKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NPo173pW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED55F4E40D53;
	Mon, 22 Sep 2025 15:31:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBDB360635;
	Mon, 22 Sep 2025 15:31:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 471F6102F1942;
	Mon, 22 Sep 2025 17:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758555110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=++hT/gI4Y4VMUAzGdgLP1ng3+Xf93jWlboopap+4PG8=;
	b=NPo173pWeUqhoCioDsMe7BwxhI/GUauHlbILxe59u8f6SmQ1TlB8ZDyr8H0TZ/WHnocjpO
	8iLoaKDHRIe4ooQ+8ct5Ygr1oTc3zc5gaW9sjHHY4Gg86yfi8XlVq8JSsIF5GcJdEfKGfp
	PEZh51dNubkTOiKpRqXJ20HN22rZFYYTTzFKzshCXE1kRMVozUYd4Oc83xnX2/0W4g2nw7
	zUMRM2mvCcgwykO+wx0LxP9mPeq542fPhB1QVWn72KtLCq4uQ2/jyiVKsMmvJsYdKwxoum
	z+twfQL4JCM0damPmqA4qW1BbwFyDtv19ZJ3pTL0u4u2pt/HAQXUvJwEjY1jXg==
Date: Mon, 22 Sep 2025 17:31:45 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Saravana
 Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Phil
 Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Pascal Eberhard
 <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO controllers
Message-ID: <20250922173145.4d4dbb2f@bootlin.com>
In-Reply-To: <CAMRc=Mf9OB03FXEpSXG8XeJhtd7MkwJTH=rY11SBb9SazCMqJw@mail.gmail.com>
References: <20250918104009.94754-1-herve.codina@bootlin.com>
	<20250918104009.94754-6-herve.codina@bootlin.com>
	<CAMRc=Mf9OB03FXEpSXG8XeJhtd7MkwJTH=rY11SBb9SazCMqJw@mail.gmail.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Hi Bartosz,

On Mon, 22 Sep 2025 16:22:14 +0200
Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Thu, Sep 18, 2025 at 12:40 PM Herve Codina (Schneider Electric)
> <herve.codina@bootlin.com> wrote:
> >
> > Add GPIO controllers (Synosys DesignWare IPs) available in the
> > r9a06g032 (RZ/N1D) SoC.
> >
> > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---  
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I have just sent the v4 iteration.

This patch has not been modified in v4.

Can you add your 'Reviewed-by' in the v4 series?

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

