Return-Path: <linux-gpio+bounces-38203-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HW4fAyuHKGo0FwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38203-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 23:35:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63402664476
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 23:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=uoS8Wc2e;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38203-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38203-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=riscstar.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3850B3078361
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 21:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322DB48A2AA;
	Tue,  9 Jun 2026 21:32:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB132D7DC6
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 21:31:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781040722; cv=none; b=m2kjeIGeLze8PsT36Cxdrsf56xWxrPKhmnKRcY1eX7YQ432CV1GnP0rnXrjuQvh5fForliLZWpjsuX4X6QQS6Wyni+dBzUI4mRfNtCcTmvFNhtL5a2ZamiElAPM4ph5R+zOlYNj1yaz2sGUlK6+srD2vnOZgbq63cY8H5xChuIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781040722; c=relaxed/simple;
	bh=WAiXRaxAM4Z1bZ828ygiu2QGKA8btwndyvH6LWkBmvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnRKuHM3bQt8RYYiZBsaZf4ji8yOAOVVUR7FDs5ig5/cyH1/tWBs+CSSSSZl2JG2G3/l9j2ykzrUWSISObDB9CLaBdluHlwmRNd0tbjpPz0fxFgzHDKT0SbK8jf1cNaNe3d8qqAuPxM18yuVfwyz7zPm8xAUNvLZY/XIZWxA6jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=uoS8Wc2e; arc=none smtp.client-ip=209.85.167.179
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-486503ae8f0so4496832b6e.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 14:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781040718; x=1781645518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQKbERiB0ntPOS/R2wMXRwGJAn2HHwIq3s8Tu7uVMO4=;
        b=uoS8Wc2e1VeGoY7G1XUBEHm43nmS5gaWrdYwUmiNUbR6nAUt8w6us5wXqa8zvD0j8H
         pElFvyvcXDwQRbA7XsXg25ZJRHvM8K6goHxTNObZ69eH7g4DY9o3ebLH0iTTxx0j3y5M
         VKauDGWMkjgBFheiP8YjscG+JfsiNeZJp9RizPBwnWb2BY01EYdCMVKjHh58PXuq6py0
         aKLhGhGkk7vUvFMeaqQ3OwEj7d8vo+rsKGKph1+Ix/B9kDz3fL8ZlaUpliFLu5oek+3b
         oYjsUvyheB3NSko8ugKmu0mQq0yhwZCWmxtPvlx7+eF5c3u1n/XFljjOak4mPeOyK6q4
         D2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781040718; x=1781645518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQKbERiB0ntPOS/R2wMXRwGJAn2HHwIq3s8Tu7uVMO4=;
        b=Q6OYCdCV5cLxKfXwr86I11FXz41sGWZjoUb4gsTQE57eeMzMFUlkN/uT6im5skjd0l
         xDSBMvxqwdJ3OSxY8oaOev8r/GsUhVdBjE+MZk09pBeZE+VNQSsh7mVIjxPDX8pDqHee
         Wp0WQWUw9SfXyZYNT5+j/z6GKeHBNQQttYoB0oPK3QEkO6WqRUXwbg6QZqyR2n3hOO3K
         2Oqa0T8vjS0Zw80cn0J+S8GWWbVfgQQICHn0Khv3CZQXeuREvsKm4aZi3H76Crgsh66r
         xhGsIxlKuz3sf1kudu/PrhKRh+Y8xrFp0m4y2k2uhOFJ5JFoaBW84bHIEj8zZeIsAy1J
         Q+1g==
X-Forwarded-Encrypted: i=1; AFNElJ/KmZDYwdLEj1CFLBiUF5+j/hz+JiGntqwV8ulMyC4kpTE6AkuIHz31SY5ljDfmfDDi5Wmvxk8fUe03@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9+WCjqxv834un9wOumJNW9HWnz3TXSqsPdyHxMMkB6Lxfhh+
	fRUzvBeQxWAzaG1akYsnJnnjz4PZuETaKIeDUoqqlZdvalFYAit6HoASAu291PJYyBc=
X-Gm-Gg: Acq92OHL1/FEdDC/hV2SgJdnE0Un17iMTXnnsi1EXZ4MsENXEVRw2pt8A+Kb0HaW6kC
	fnACFiVIfmiK+vbfi98JXKefixiInV+m2coZfKQGDtX89A0G1lZk6JT31fESu3fQot1uEGTIVHj
	DhBsL91E2PnCzZ//UG3dwUzNcyNsQT25pKk3Vy1CbEtWWN/6m1HBBnkOSZnRtQE8+RxBUebZde8
	xrGM5pPSmTKZ0gMfEesAEiovG5umVyWSp6pFo5V0bso3WZL5NNqb2cyZoPiw8nIsxYBPBwRN4Yn
	pqHcxQEMvQofncblpeIYtVAPFuskqI3oZlhcM35+eAPA5VUVZz5pzJB6F5YAi2ukNKIfUzFEfAX
	b+2tYFTmQJjemioWur0lvEhinQ63BzGBwZqXygTySFpp5m9FLy5BZWjbRbJTMjAyCIQViRlpjSt
	AF6s9MUjfWMbVod5s7V8l2nPNNuyr5HWf6K+aJIxxSMWrJ
X-Received: by 2002:a05:6808:4fe2:b0:485:a9b2:5457 with SMTP id 5614622812f47-4868df63ae3mr15052790b6e.35.1781040718541;
        Tue, 09 Jun 2026 14:31:58 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm17024127b6e.4.2026.06.09.14.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 14:31:58 -0700 (PDT)
Message-ID: <b89fe088-496f-4281-9d27-7f8b0b3f38cb@riscstar.com>
Date: Tue, 9 Jun 2026 16:31:55 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 13/14] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Rob Herring <robh@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-14-elder@riscstar.com>
 <20260605144758.GB3659201-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260605144758.GB3659201-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38203-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:daniel@riscstar.com,m:mohd.anwar@oss.qualcomm.com,m:a0987203069@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:boon.khai.ng@altera.com,m:chenchuangyu@xiaomi.com,m:chenhuacai@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:hkallweit1@gmail.com,m:inochiama@gmail.com,m:john.fastabend@gmail.com,m:julianbraha@gmail.com,m:livelycarpet87@gmail.com,m:mcoquelin.stm32@gmail.com,m:me@ziyao.cc,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:sdf@fomichev.me,m:siyanteng@cqsoftware.com.cn,m:weishangjuan@eswincomputing.com,m:wens@kernel.org,m:netdev@vg
 er.kernel.org,m:bpf@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,riscstar.com:email,riscstar.com:mid,riscstar.com:from_mime,riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 63402664476

On 6/5/26 9:47 AM, Rob Herring wrote:
> On Thu, Jun 04, 2026 at 08:00:20PM -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
>> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
>> that can be accessed, along with several other peripherals, via two
>> PCIe endpoint functions. There is a main driver for the endpoint that
>> decomposes things and creates auxiliary bus devices to model the SoC.
>>
>> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
>> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
>> MSIs.
>>
>> Add a driver for the eMAC/MSIGEN combination.
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> 
> The order is wrong here unless you worked on it and then Daniel took
> over. Tags should be chronological order.

I think this was a dumb reorder I did to address a complaint
from checkpatch, but in any case I'll fix this.  Yes, my
signoff should "wrap" the others.

>> ---
>>   MAINTAINERS                                   |   2 +
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  14 +
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 818 ++++++++++++++++++
>>   4 files changed, 836 insertions(+)
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0439607d1155f..418537cbefbbb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -27059,6 +27059,8 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
>>   F:	drivers/gpio/gpio-tc956x.c
>>   F:	drivers/misc/tc956x_pci.c
>> +F:	drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> +F:	include/soc/toshiba/tc956x-dwmac.h
>>   
>>   TOSHIBA WMI HOTKEYS DRIVER
>>   M:	Azael Avalos <coproscefalo@gmail.com>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> index e3dd5adda5aca..8d247e033e356 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> @@ -404,6 +404,20 @@ config DWMAC_MOTORCOMM
>>   	  This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>>   	  controllers. Currently only YT6801 is supported.
>>   
>> +config DWMAC_TC956X
>> +	tristate "Toshiba TC956X DWMAC support"
>> +	depends on PCI
>> +	depends on COMMON_CLK
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default TOSHIBA_TC956X_PCI
>> +	select GENERIC_IRQ_CHIP
>> +	help
>> +	  This selects the Toshiba TC956X (and Qualcomm QPS615) support in the
>> +	  stmmac driver.
>> +
>> +	  This provides support for the ethernet controllers found on these
>> +	  devices.
>> +
>>   config STMMAC_PCI
>>   	tristate "STMMAC PCI bus support"
>>   	depends on PCI
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> index a1cea2f57252e..e8e7f95dbe3e8 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
>> @@ -51,4 +51,6 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
>>   obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
>>   obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
>>   obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
>> +obj-$(CONFIG_TC956X_PCI)	+= tc956x-pci.o
>> +obj-$(CONFIG_DWMAC_TC956X)	+= dwmac-tc956x.o
>>   stmmac-pci-objs:= stmmac_pci.o
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> new file mode 100644
>> index 0000000000000..c77585e4a50e6
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>> @@ -0,0 +1,818 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/*
>> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
>> + *
>> + * Derived from code having the following copyrights:
>> + * Copyright (C) 2011-2012  Vayavya Labs Pvt Ltd
>> + * Copyright (C) 2025 Toshiba Electronic Devices & Storage Corporation
>> + */
>> +
>> +#include <linux/auxiliary_bus.h>
> 
> Based on the block diagram, these are PCI devices. Auxiliary bus is the
> wrong thing to use here.

As I said in the other message, I'm going to rearrange this
to use pci-ep-bus and platform drivers.  Most of the core
code should be stay the same but the overall structure will
change.

Thanks for your suggestions.

					-Alex

> 
> Rob


