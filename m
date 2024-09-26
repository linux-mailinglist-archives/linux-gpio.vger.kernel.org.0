Return-Path: <linux-gpio+bounces-10451-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A233F986D95
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 09:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD9711F24E19
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 07:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550F918C930;
	Thu, 26 Sep 2024 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="NAB317+i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C34118BC10;
	Thu, 26 Sep 2024 07:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335721; cv=none; b=S9xRWr8Rp+Dd7uXu8mTTXpVinggmeEIKqFVHwCvQ+uLMr4yIkn8iVoH/CkEZEKB6EuP4Bz5FDD22U/2uBsBWcUVMegey4vk8X/DLZKN2ysvFINl+LJf6euBD5sswivgPT33gHYLmlnyO3llWapAub+QKPmRMvvfK3P/P4/idupY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335721; c=relaxed/simple;
	bh=2OkTH4fsV2rTs1m0HWohkt30W6ZEY1V5jyKOIYvJMqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qwqktmpSVooP9D/TXV6+DXncujEEEJSkkuHlRI5cDfi+oz3+YDsgIrThcitmFMByHBd/IC+4/Rd3Mq6rU/XL4rDVVn7kyiO3DMsD5BP3zwBo637DFSL7GnbH0KenqS7QLYam81pbtxggwK6UpPRBa/lUjoSq7JC7j5KOfZUougw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=NAB317+i; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2OkTH4fsV2rTs1m0HWohkt30W6ZEY1V5jyKOIYvJMqQ=; b=NAB317+idsVnW7m7M6MzOlHgoU
	bor239d88UHIKNc1HsQQEvgq7ZFWQVzSJQREiJoEo1AFDj/IAOVk0FOMZzputKQOgIn5ngdk7y8F3
	IUYFESziRpwWdYNuzeQzFDgKUODx3WRur+TGOfDE7SCRtyIuzuRGKMJMHkeBZ6V+t7vfHNJ0ps54Q
	FKLj8GSFzxfdg5DbGkYGSP6jValm2sH5mGcsJ5SvutssEMTomzHfG3YggjIIuqsrbXtH2EuOp7pWJ
	iTnvWJVA8SiiyDGrwZl3o4iNEboXcf6YzoRUd7NVA6P3mg8h0BgFyhwNjBRqzMl+esVcTa9p/Oz4m
	JgsgXk0Q==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1stivS-000HaV-Gk; Thu, 26 Sep 2024 09:28:34 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1stivR-000KXD-3C;
	Thu, 26 Sep 2024 09:28:33 +0200
From: Esben Haabendal <esben@geanix.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>,  Shawn Guo <shawnguo@kernel.org>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Dong
 Aisheng <aisheng.dong@nxp.com>,  Jacky Bai <ping.bai@nxp.com>,  Arnd
 Bergmann <arnd@arndb.de>,  Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
  linux-arm-kernel@lists.infradead.org,  imx@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
In-Reply-To: <CACRpkdaW14PgLXTRPHUjaLNKfCMRs+hpHrYyMiNaqSs+m0rhqw@mail.gmail.com>
	(Linus Walleij's message of "Tue, 24 Sep 2024 09:45:32 +0200")
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
	<20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
	<CACRpkdaW14PgLXTRPHUjaLNKfCMRs+hpHrYyMiNaqSs+m0rhqw@mail.gmail.com>
Date: Thu, 26 Sep 2024 09:28:33 +0200
Message-ID: <8734lmj2la.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27409/Wed Sep 25 11:17:07 2024)

Linus Walleij <linus.walleij@linaro.org> writes:

> On Mon, May 6, 2024 at 12:24=E2=80=AFPM Esben Haabendal <esben@geanix.com=
> wrote:
>
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
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> I guess this needs to be merged through the SoC tree.

Anything more I need to make that happen?

/Esben

