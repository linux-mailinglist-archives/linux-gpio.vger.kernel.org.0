Return-Path: <linux-gpio+bounces-13334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E54249DB331
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 08:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3BC4281D04
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2024 07:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1134E146D6E;
	Thu, 28 Nov 2024 07:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="NOkp6kTf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFB7146590;
	Thu, 28 Nov 2024 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732779182; cv=none; b=kLAilPxcOw5VjkETXhwZCpTcJ3cmx+SDMn7XIyXJdxbfB0r1P0YmD+ZX5Vkw8MGqO4v51Zc+ov8a+mQ1D3WrYxBgAR108vs+E4HwBiHLovJTMWM5BvjKz1kQkVFbncoORgjMkAefAgc+3Z7OzDjS/tm1sJchNdxVP1fUnYlaV7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732779182; c=relaxed/simple;
	bh=FqTn/yFLGq1rD4s4fw88JwfZrqhYIqIVLwn6/f+yeZM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UOH8FeAwsj9xpeSJNhnxuVPXi3POg9hX40otB23+IbjcYRlJiNXt2MtJLWJbpm86FueSMnyFqyzf6ZFnwO286ADlaVbQEijH0A/MF1LtZUHkuYOpW23+jaQMoOrUW4wo6OSI7ATz2NtCZz9nFVGP5NoMY24ppDQjGUp1VMfGxaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=NOkp6kTf; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FqTn/yFLGq1rD4s4fw88JwfZrqhYIqIVLwn6/f+yeZM=; b=NOkp6kTf3nGVLT1Rzeb23UPzuk
	O9cvD7sXhELJ/MmuVkMyOu8CW+k5CaF/uxbArDREGL9+BODC+8tASJi+0sWNG6tQh7QlQcaYscH7u
	lwJvUHcEBTIrDxziT1xUyJDZLxUNDbQFOLZVYYAuCOReF80+a8D7b5sgT/D/GpLnWWyhSuWUJ4UYp
	Uk424LCbonyJ9IFSnVzMxzxKsEOgkVA4e4HmuML/+/l1CWJJkULO1P8zMw39FHYfVY4r+Ts8ptwr8
	EvlUAGS9kvHnoGGlhBFn5ltDTVPh1cxwBKwB5+B34jjzL9PeEaY/pXHuXCLhkDxYeA4Asjv8c04Ij
	iZqgjfHg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1tGZ1G-0006Tq-7W; Thu, 28 Nov 2024 08:32:58 +0100
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1tGZ1F-000G6A-0F;
	Thu, 28 Nov 2024 08:32:57 +0100
From: Esben Haabendal <esben@geanix.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,  Rasmus Villemoes <ravi@prevas.dk>,
  Guenter Roeck <linux@roeck-us.net>,  Linus Walleij
 <linus.walleij@linaro.org>,  Russell King <linux@armlinux.org.uk>,  Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Dong Aisheng
 <aisheng.dong@nxp.com>,  Jacky Bai <ping.bai@nxp.com>,
  linux-arm-kernel@lists.infradead.org,  imx@lists.linux.dev,
  linux-kernel@vger.kernel.org,  "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>,  Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
In-Reply-To: <CAOMZO5BY56N9Sfm1_qprQm7jeM+5bLgR0CPeu3kXK9rgmJN87Q@mail.gmail.com>
	(Fabio Estevam's message of "Wed, 27 Nov 2024 11:36:46 -0300")
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
	<20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
	<49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
	<CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
	<1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
	<CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
	<87ttbthwdu.fsf@prevas.dk>
	<5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
	<87ldx5htm3.fsf@prevas.dk>
	<45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
	<CAOMZO5BY56N9Sfm1_qprQm7jeM+5bLgR0CPeu3kXK9rgmJN87Q@mail.gmail.com>
Date: Thu, 28 Nov 2024 08:32:56 +0100
Message-ID: <87plmf6cev.fsf@geanix.com>
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
X-Virus-Scanned: Clear (ClamAV 0.103.10/27470/Wed Nov 27 10:59:44 2024)

Fabio Estevam <festevam@gmail.com> writes:

> On Wed, Nov 27, 2024 at 8:30=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wro=
te:
>
>> Overall, my best advice here is still to not change the way
>> i.MX pinctrl works at all, but just fix Layerscape to not depend
>> on i.MX. The reason for the 'select' here is clearly that the
>> i.MX machines would fail to boot without pinctrl, and changing
>> that because of Layerscape seems backwards.
>
> The suggestion to make Layerscape independent of i.MX makes sense, but
> I don't know if it can be safely applied in 6.13-rc.
>
> This proposed change also has the risk of causing regressions.
>
> What if we revert the patch in Subject for now and then someone (maybe
> Esben) tries again for a proper fix targeting 6.14?

What about your fix to the in-tree imx defconfigs [1]? Was it dropped/rejec=
ted?

[1]
https://lore.kernel.org/imx/d718ddd2-d473-4455-b21a-15024e46787c@roeck-us.n=
et/T/#mc71dc21d99e0b013c5ce46c0d90940fd8806ae9a

/Esben

