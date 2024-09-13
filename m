Return-Path: <linux-gpio+bounces-10029-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D917977972
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 09:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D997B20E3B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 07:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F64E1B9822;
	Fri, 13 Sep 2024 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="u0JTp8SJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AABD77107;
	Fri, 13 Sep 2024 07:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726212115; cv=none; b=jBJO6G6ni1vx+EN2DS6BRv+Nqj9qYC3x7pUhaQ4+7IS/9IGHebihB5f+sl7ZPowcv2ju2b8qDb9yfB2vh1lSRIa+13Wc58+JuLZDk47uQtWNsmheDk5s/KcTzk3gXCCUsD91CV7ZmKdgtj1/TeAnFJYJjblszkjqa0b+dvnre38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726212115; c=relaxed/simple;
	bh=S9+rvaWsLBoeqWyOI5I3m6RXP20A5zSQGSI5Xfu259g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OwTOr5ufaTd9xogt8SOeAlKkXoRfpRIXURfcy5oxw76CwzQ/04m6w5m/3+QXMzRsOFKKu0qP5UAQ2MGhBs1FZqF5fT57r7drPoLbDOhD0Fx3k8Q/vHGG46TzA/suPsycXlHN3gDfHGLhYseP83f5RQ5KnXlqaZOYVjnzWnYlP+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=u0JTp8SJ; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XHwuadB5pyRhY38FxNpe/xSjJ5xenfmm91n6rUsiysE=; b=u0JTp8SJLGSlKJdkhvgtl2QmbG
	D8Gk7shKHa5sIRPj8ecih/dARtfuQ19y+XB+Yc4BsbT7T0EP+dnn9xV3iW5kVlf1vhWLXDnTjHf4D
	WLUHQbXi3qEcd6TWrs1gc/kUztHzktqy0kpKPS6ob7EJpKdP+0JEKgR8/JNbeC8t1YvskUb33wmT8
	t5LMOJ30aRldSPRh+kBzQRFDCiJMn84Q7Dm2myzDZBibqMfL9HIP+1pmJjHJ/qLd8scr4WOtb/fJo
	Vy7s3A+fuxdGrhj2oXiOOCDmFOsgSvPAaC7AScpjj83aD9mFfeQtyx1sLZPWzRLTMCdqDZCB1x/6v
	tZ+jDPiQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sp0ck-0000jN-Mq; Fri, 13 Sep 2024 09:21:46 +0200
Received: from [80.62.117.18] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sp0cj-000BI6-1e;
	Fri, 13 Sep 2024 09:21:46 +0200
From: Esben Haabendal <esben@geanix.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Russell King <linux@armlinux.org.uk>,  Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Dong
 Aisheng <aisheng.dong@nxp.com>,  Jacky Bai <ping.bai@nxp.com>,  Linus
 Walleij <linus.walleij@linaro.org>,  Arnd Bergmann <arnd@arndb.de>,
  Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
  linux-arm-kernel@lists.infradead.org,  imx@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
In-Reply-To: <Zl0va6yv2VY4ky0l@dragon> (Shawn Guo's message of "Mon, 3 Jun
	2024 10:50:19 +0800")
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
	<20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
	<Zl0va6yv2VY4ky0l@dragon>
Date: Fri, 13 Sep 2024 09:21:45 +0200
Message-ID: <87bk0s588m.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27396/Thu Sep 12 10:46:40 2024)

Shawn Guo <shawnguo2@yeah.net> writes:

> On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:
>> Making pinctrl drivers and subsequently the pinctrl framework
>> user-controllable, allows building a kernel without this.
>> While in many (most) cases, this could make the system unbootable, it
>> does allow building smaller kernels for those situations where picntrl
>> is not needed.
>> 
>> One such situation is when building a kernel for NXP LS1021A systems,
>> which does not have run-time controllable pinctrl, so pinctrl framework
>> and drivers are 100% dead-weight.
>> 
>> 
>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>
> Acked-by: Shawn Guo <shawnguo@kernel.org>

Was this only for this patch 1/3, or the whole series?

/Esben

