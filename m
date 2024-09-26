Return-Path: <linux-gpio+bounces-10452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02292986FB0
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 11:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A45B41F236A9
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 09:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA4A01AB50F;
	Thu, 26 Sep 2024 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="qQrcpIGx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2368208CA;
	Thu, 26 Sep 2024 09:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727341988; cv=none; b=rcrv0H3CyIo1OhBalwrqxgDo6QBdcJTRIO7+Y+3P9qPQKuXF55XMWYq4j4c7+F61bzpr+bdsaWGfGBvEM7c/DWy+btcqKB0iMPgFnUFcArg6h24gwEbTlm8ozDHaWSUEHppkjuOqYDEXEoi5je3/QFdIb7f9Lost/lNwdkZKNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727341988; c=relaxed/simple;
	bh=1DXKU4XVx7IHEGgM38c09bSSv1/QCOHdnFhdWz0h454=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8QwHqWgsyhaGnPIvqfBlZHs7MlGqkkuqCs+AO4bVqf4ZcxIkoNKENkDiQhthSZGHYc7OFsaJQQqIjREzob9dzgRmrS8iVcFn3JZawodSBh9CeCl6XzOj/li9T7nEhmjPajHNTskeEph6ujpi4lMbwI4Srvfo8Tf1RYrJjdDAbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=qQrcpIGx; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=3yjqlUTIEAtxbRrw6H5T/QaTD7R7yHaK6W6FA1/EZ6M=;
	b=qQrcpIGxCVy7R5JFeMwIiA4/WGUJY6PuCGaPFk/nKhdictzIn9es9mhm267iFk
	5JyA2YAvJcXEN5UNBDDDd9w8rgrD4DcgbP2zecxcABbX1T9NJGaATUmmur/ipUa6
	LAIRhJUlbjBrj/VzLLHjAj4+n0z3SV2EpO9DZIYJ3dk0E=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBHx53tHfVm9kctAQ--.42439S3;
	Thu, 26 Sep 2024 16:40:15 +0800 (CST)
Date: Thu, 26 Sep 2024 16:40:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Message-ID: <ZvUd7PekQ4pVXQGU@dragon>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <CACRpkdaW14PgLXTRPHUjaLNKfCMRs+hpHrYyMiNaqSs+m0rhqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaW14PgLXTRPHUjaLNKfCMRs+hpHrYyMiNaqSs+m0rhqw@mail.gmail.com>
X-CM-TRANSID:Ms8vCgBHx53tHfVm9kctAQ--.42439S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4DCFW7AFyrXr4DXF4fKrg_yoWDurXE9F
	4kta97C348CrW7X3Wqyr4avr9YvFW8Kr95Kr90qryrAa4DZFs3JFn5Jr45uw15Ja1kWr9r
	Ar9Yqr93tFyjqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn9iSPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRlmZWb00uLnAgAAsU

On Tue, Sep 24, 2024 at 09:45:32AM +0200, Linus Walleij wrote:
> On Mon, May 6, 2024 at 12:24 PM Esben Haabendal <esben@geanix.com> wrote:
> 
> > Making pinctrl drivers and subsequently the pinctrl framework
> > user-controllable, allows building a kernel without this.
> > While in many (most) cases, this could make the system unbootable, it
> > does allow building smaller kernels for those situations where picntrl
> > is not needed.
> >
> > One such situation is when building a kernel for NXP LS1021A systems,
> > which does not have run-time controllable pinctrl, so pinctrl framework
> > and drivers are 100% dead-weight.
> >
> >
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I guess this needs to be merged through the SoC tree.

Hi Linus,

Reading your comment[1], I was thinking that you will merge the series
through pinctrl tree, no?

Shawn

[1] https://lore.kernel.org/linux-arm-kernel/CACRpkdYbOTXmap-vJy4JNZSaZnE=yzC35EPD2F=bD8gWdD8-GQ@mail.gmail.com/


