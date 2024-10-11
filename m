Return-Path: <linux-gpio+bounces-11202-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE999A947
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 18:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 286A4B20DBC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 16:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE2819F131;
	Fri, 11 Oct 2024 16:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SOdfOBNi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A87F9;
	Fri, 11 Oct 2024 16:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728665931; cv=none; b=OXLASjxkSfeFXNgZziVgKuQYA44MTylUf6IwCvmR2eWVO8SSndwBoTHENnCbN4m/4Zrgx3IpRnDD5J9QWOgRHUjTy13U89wrV3VVtXMmRJwnjNX4KZF8t1Z0DjkSxMzbGzR+3OfnSt6MC91v72FigwmIvzYTfoh+H+bTwI6EtZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728665931; c=relaxed/simple;
	bh=dSQjTuZXf1uPIZQ8jo3aU+cm2flCYlgWE5l9zsTBhvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fvpQOCL8Jl+j5+/6JMrRSaGxM2TlH+rrSluT+8KFZpK3ym7ZHrUtPsi8yxDwYW51z+pigIdAXwWuLxUR8cBdbxY6YGSKHeOBXGF9xiTxd4Zvq56K5v/AUOm+bhzVy6Gh9pGkPXAcgb4POKOLLHIEf6Pd9JgoaWH72hJrrjo7vAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SOdfOBNi; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BGwcgH035579;
	Fri, 11 Oct 2024 11:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728665918;
	bh=PbWpUFIcmEiXCy8fMANRvoUL5Rm3Gkzurz1H462VjcY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SOdfOBNiMquTZHQVU+4m+2MUMXueT2OPTClj+6V/oFMgn8yYhqRYLUl65UY9T7R8Y
	 51dk5s169DeFOpzy0R2jMJyn00zFkG6OT9+j3wMRHF4gxZ84N1572paEBcQh6XimfZ
	 cz2IracM1fEc6R9Ch/NqcHfKLl+JuhYuCfHDcKUM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BGwcYc117757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 11:58:38 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 11:58:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 11:58:38 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BGwcHX113190;
	Fri, 11 Oct 2024 11:58:38 -0500
Message-ID: <5b08e618-1365-4228-960c-3d38d5c2232e@ti.com>
Date: Fri, 11 Oct 2024 11:58:38 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Misc omap GPIO/UART fixes
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman
	<khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>
CC: <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>
References: <20241010184802.203441-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20241010184802.203441-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi all,

On 10/10/24 1:48 PM, Judith Mendez wrote:
> This patch series carries some miscellaneous
> omap driver fixes for GPIO and UART drivers.
> 
> For GPIO, add gpio_enable and gpio_disable calls
> to gpio-omap which fixes an issue where if there
> is an irq storm, serial console is unresponsive.
> 
> For UART, move pm_runtime_get_sync since the
> current order of omap_8250_rx_dma_flush and
> pm_runtime_get_sync calls are set in a way that
> when omap_8250_shutdown returns, dma->rx_running
> is set and this causes issues next time the UART
> is re-opened.

Please ignore this patch series, I will be re-sending
this patch series with some CC list cleanups.

~ Judith


