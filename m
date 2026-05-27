Return-Path: <linux-gpio+bounces-37552-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJSTBtmYFmrmngcAu9opvQ
	(envelope-from <linux-gpio+bounces-37552-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:10:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A78715E03E2
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 09:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E23D2304C8BD
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 07:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE123B83FC;
	Wed, 27 May 2026 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="f6y0p/it"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119ED305675;
	Wed, 27 May 2026 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865688; cv=none; b=QAJ43dBcKzagLSPAKutKbOtEldexwldS899A29o1DF+FsJkcme/n7XEv9Ui8DxfSmZinkZ2h9jWjDvTOK+9/qr+hGiTIJutai3KLfMwNyhUxfzGlAeSJyLaNJqQtoKz2s8hwSGchLQO92R3sEn12XPZdqyaKGIDFCMtyePKHqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865688; c=relaxed/simple;
	bh=Gs8J/HTrooh7vlCoNCD99YT0nkQfL16PdFAdpCjFrF4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=QVQBsg3iAVGnxsYB7WdqyRkVVE69sgkAwwXDx6fcnwBp2gh/bYn2XUjf20NS+DJZgj2myWKRUHeuK85o1iNicSRn2YFk6L9I/6Hw7qthAHe9efOEHlch0wv9daPH4tV0FzDBRBYDFCspU9jE76UJC4Hqhybr9t8l0XgdzuqoNLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=f6y0p/it; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=GrkdnLxxHv8YIvPubjc6p6My4VJbmJABi
	hnyu1kLnF4=; b=f6y0p/itMSBnWyOeyv0+MbYR+y9LGfe+kROBtiSD3kcVZuYJx
	A0tdOps83EJ7su1HcwX2nnphw22UtHjcmel82j10czaBFhep7ZsCLgEkyaO69tpE
	QsvVLr6l01xFjrIZNSb+A1b+D7YTQf9arye15iZgkOFTX4xPhh+oi66PrA=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUJtmBZq3lUGAA--.7992S2;
	Wed, 27 May 2026 15:08:29 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <e3e5768d-f1b4-4fe6-a182-0210c9b7f784@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <e3e5768d-f1b4-4fe6-a182-0210c9b7f784@kernel.org>
Date: Wed, 27 May 2026 15:07:49 +0800
Message-Id: <177986566963.2389245.12578653384241891971.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779865669; l=3472;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=Gs8J/HTrooh7vlCoNCD99YT0nkQfL16PdFAdpCjFrF4=;
 b=EHl/iBcvMVss/1speuDjpJmuTe8+T95MLa0mG+LEqxIo7mG21AivhtwS+kRLVbhsyuVPVT5J0
 dR1jbaFWbbqBMwPpfJGhigxC+xKOYHCnXJvDOvoEHa7j/+DBwZ9oemc
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwA3cUJtmBZq3lUGAA--.7992S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFyfuFWrKry5uF1kCr48Zwb_yoW5uryxpF
	WfGFW3AFy3JF47K3yfta45uFy3J3WIyryY93WUt34qqFW5ZFyDAr98K3yrXF4qkr4UCrW5
	tFn8Ca47Ca15Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRRBT5DUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoVGMYADgAJs2
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37552-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ultrarisc.com:email,ultrarisc.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A78715E03E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-21 23:09 +0200, Krzysztof Kozlowski wrote:
> On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Add pinctrl driver for UltraRISC DP1000 pinctrl controller.
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  MAINTAINERS                                   |   1 +
> >  drivers/pinctrl/Kconfig                       |   1 +
> >  drivers/pinctrl/Makefile                      |   1 +
> >  drivers/pinctrl/ultrarisc/Kconfig             |  23 +
> >  drivers/pinctrl/ultrarisc/Makefile            |   4 +
> >  drivers/pinctrl/ultrarisc/pinctrl-dp1000.c    | 112 ++++
> >  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c | 746 ++++++++++++++++++++++++++
> >  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h |  71 +++
> >  8 files changed, 959 insertions(+)
> 
> Organize your patchset correctly. Such style:
> DTS
> pinctrl
> DTS
> 
> is very confusing and discouraged. See submitting patches in DT directory.
> 
>

Got it. I will reorganize the patchset in v2.

> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 832e01898ae5..ecd87d58f28c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27364,6 +27364,7 @@ M:	Jia Wang <wangjia@ultrarisc.com>
> >  L:	linux-gpio@vger.kernel.org
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > +F:	drivers/pinctrl/ultrarisc/*
> >  F:	include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> >  
> >  ULTRATRONIK BOARD SUPPORT
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 03f2e3ee065f..76105be8b395 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -711,5 +711,6 @@ source "drivers/pinctrl/ti/Kconfig"
> >  source "drivers/pinctrl/uniphier/Kconfig"
> >  source "drivers/pinctrl/visconti/Kconfig"
> >  source "drivers/pinctrl/vt8500/Kconfig"
> > +source "drivers/pinctrl/ultrarisc/Kconfig"
> 
> u < v
> 
> Do not add to the end of files. You are messing how this file is sorted.
>

Thanks, will fix the ordering.

> >  
> >  endif
> > diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> > index f7d5d5f76d0c..4df3e52518ea 100644
> > --- a/drivers/pinctrl/Makefile
> > +++ b/drivers/pinctrl/Makefile
> > @@ -98,3 +98,4 @@ obj-y				+= ti/
> >  obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
> >  obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
> >  obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
> > +obj-$(CONFIG_ARCH_ULTRARISC)	+= ultrarisc/
> 
> Missing compile test. Don't use that style. See other decent SoC vendors
> how they solved that problem.
> 
> Also, do not add to the end of the files. Keep things sorted, more or less.
> 
>

Will fix the ordering and follow the recommended SoC build style in v2.
 
> > diff --git a/drivers/pinctrl/ultrarisc/Kconfig b/drivers/pinctrl/ultrarisc/Kconfig
> > new file mode 100644
> > index 000000000000..ba8747b90127
> > --- /dev/null
> > +++ b/drivers/pinctrl/ultrarisc/Kconfig
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config PINCTRL_ULTRARISC
> > +	tristate
> > +	depends on OF
> > +	select PINMUX
> > +	select GENERIC_PINCTRL_GROUPS
> > +	select GENERIC_PINCONF
> > +	select GENERIC_PINMUX_FUNCTIONS
> > +	select GPIOLIB
> > +	select IRQ_DOMAIN_HIERARCHY
> > +	select MFD_SYSCON
> > +
> 
> 
> Best regards,
> Krzysztof
> 

Best regards,
Jia Wang


