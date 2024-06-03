Return-Path: <linux-gpio+bounces-7040-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3770B8D7A2F
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 04:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67F781C20D84
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 02:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743AB8C1E;
	Mon,  3 Jun 2024 02:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="hNL/uz0l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA1297E8;
	Mon,  3 Jun 2024 02:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717383114; cv=none; b=ELqNT3ZJ+Xo+s70t+Qd28Bxnt5FYBtF9IYZ0UiekQ2hIyjpAsbDxvtitdm4mMtdB5R7V01yXLECTaKDR3X4RnsKYICK55ko8bGgrA3weWKB5EPScemda73fUkJ8wHKvmVVSK/+0zMpnzXz9SKnwfDdGxdyHUD/EqnWzlEc9P46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717383114; c=relaxed/simple;
	bh=NiytJ2AMYvegxaHKEXtaqWHe+4LqIoAAvBf48/InMtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pp40kpbi4Fb2LIg2Caa8ZqQF11/q6MBG02uMGMP65vKWUca2IVUSXOrawinB7cB334i8H5LUGgJGBi7EqaPv4SsNgvvs9hzgJ4wK1Hp+dblvW2TCwB6M7zmN8LuGmSLWIKVD75TGwg5+AtcTh3XkNG8hs0KSMBHRI9tfiIbNkLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=hNL/uz0l; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DYwujD+kR84TKzaju2fXFZQwbc6+rq3fIhZZ+IH4RxQ=;
	b=hNL/uz0lTLcW0fj3f3834Wn/lAEWEiXics/TiypTkmOf0aAZcSgaAUknSiatXt
	mtgRdnXaDTnjUJ9919cQoMnd9ie9pwEJ+za5BFsedm10HneqEkZ3El1TsTws1TID
	oHSwc9VoAKeg8PFQOF1cYgWcktZEbJScgrGLqLbUoVmxU=
Received: from dragon (unknown [114.216.76.201])
	by smtp1 (Coremail) with SMTP id ClUQrACHZu9rL11mpM4xBw--.38460S3;
	Mon, 03 Jun 2024 10:50:20 +0800 (CST)
Date: Mon, 3 Jun 2024 10:50:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Esben Haabendal <esben@geanix.com>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
Message-ID: <Zl0va6yv2VY4ky0l@dragon>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
X-CM-TRANSID:ClUQrACHZu9rL11mpM4xBw--.38460S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrCFWxur43GF45Wrykur1fCrg_yoWxWFcE9F
	Wkta1kAryDCw42qr1kKF43Xryvka17WF9Y9ryqqry5Ka95Zwn7AFn5Jw45Cwn8tw4rW3sr
	Z3ZYqrn8tryavjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0QdbUUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQzyZVsVCm9ZPwAAsT

On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:
> Making pinctrl drivers and subsequently the pinctrl framework
> user-controllable, allows building a kernel without this.
> While in many (most) cases, this could make the system unbootable, it
> does allow building smaller kernels for those situations where picntrl
> is not needed.
> 
> One such situation is when building a kernel for NXP LS1021A systems,
> which does not have run-time controllable pinctrl, so pinctrl framework
> and drivers are 100% dead-weight.
> 
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Acked-by: Shawn Guo <shawnguo@kernel.org>


