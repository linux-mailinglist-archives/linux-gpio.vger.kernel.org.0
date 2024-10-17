Return-Path: <linux-gpio+bounces-11568-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCD09A2C7B
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 20:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C97AAB26BDA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2024 18:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CB4219CA3;
	Thu, 17 Oct 2024 18:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EveOSQRh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA23A218D97;
	Thu, 17 Oct 2024 18:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729190893; cv=none; b=AJCmLVtD1gUNIixaZRSVMBzrXoY+PuHPvCKGQllaXvxh/pGODsIC/Ujn4/MmX5XGasfM0QyThai+RyF6c12ayDbzsrz9AoXkPsrL6afG8slbQHy8AEfAwaLAHYh2zAkYc9skpdqTTkPBlpXwTC6bDH0li/P9CPZgAdClkaVinY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729190893; c=relaxed/simple;
	bh=KrNvW2xPuZ3Vzy4j7ZihZA5fPqTzWZC+JAIhX358z08=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L0Ej/AX9v3TgMFudrqo+N+ZQCpqK3dsIgclIEGIrGwRTH6pNyvoxBTgdWiw980kD7xeC22mjXsiO3KxuJOTG5An+tmCyBZA7tbbuTsAers+h9EJUy5UToKg40f+I5NSaML//aGQNlfIu7vlQHkW06kF51erVGNgzTyfOHhtgAd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EveOSQRh; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49HIlsvY019099;
	Thu, 17 Oct 2024 13:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729190874;
	bh=Uyxhf/wT/ziG6U5bQclxVG7deSecT/6OEca8reXhby0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=EveOSQRhSrKjpYz1RmldYH9T8UjgbeOksAJtDAn4lxoVPf9k91IrOxI3XQkO0oS1s
	 21k28Q361xyarWkfHFhme2ivixwoR12bHNjuft8RHPlvzLb/2zxfX+8S/Hp7ex5U0h
	 7siCUP7f5pw8to9roIBKIEVnzf2RD1p3ALWMawcc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49HIls1l015092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Oct 2024 13:47:54 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Oct 2024 13:47:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Oct 2024 13:47:54 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49HIls8k079046;
	Thu, 17 Oct 2024 13:47:54 -0500
Message-ID: <4d8ac8c5-7f4a-4e58-a968-ffd1fc3df03a@ti.com>
Date: Thu, 17 Oct 2024 13:47:54 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/2] serial: 8250: omap: Move pm_runtime_get_sync
To: Greg KH <gregkh@linuxfoundation.org>
CC: Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman
	<khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>, <linux-omap@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bin Liu
	<b-liu@ti.com>, <linux-serial@vger.kernel.org>
References: <20241011173356.870883-1-jm@ti.com>
 <20241011173356.870883-3-jm@ti.com> <2024101218-overpay-yoga-7423@gregkh>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <2024101218-overpay-yoga-7423@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Greg,

On 10/12/24 3:03 AM, Greg KH wrote:
> On Fri, Oct 11, 2024 at 12:33:56PM -0500, Judith Mendez wrote:
>> Currently in omap_8250_shutdown, the dma->rx_running
>> flag is set to zero in omap_8250_rx_dma_flush. Next
>> pm_runtime_get_sync is called, which is a runtime
>> resume call stack which can re-set the flag. When the
>> call omap_8250_shutdown returns, the flag is expected
>> to be UN-SET, but this is not the case. This is causing
>> issues the next time UART is re-opened and omap_8250_rx_dma
>> is called. Fix by moving pm_runtime_get_sync before the
>> omap_8250_rx_dma_flush.
> 
> You can go to 72 columns :)

ok, will fix, thanks!

> 
>> Signed-off-by: Bin Liu <b-liu@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
> 
> Wait, who wrote this, Bin?  If so, there needs to be a "From:" line
> saying so.

I did not realize I could create a patch for someone, apologies, I
will be sending v3 with correct "From:".

> 
> What commit id does this fix?  Do you want it backported to older
> kernels?  Why mix two different subsystems in the same patch series, who
> is supposed to take it?


I suppose it should be backported to older kernels so I will add back
the fixes tag.

Apologies for sending two different subsystems in one series, I thought
describing as "misc" would be good enough to mix the two, but I can
separate the patches and respin. Thanks.

~ Judith


> 
> thanks,
> 
> greg k-h


