Return-Path: <linux-gpio+bounces-9050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4995CC21
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 14:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594DF1F21B19
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 12:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABA7185933;
	Fri, 23 Aug 2024 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="OMnh+gH1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973174.qiye.163.com (mail-m1973174.qiye.163.com [220.197.31.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD118455E;
	Fri, 23 Aug 2024 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414978; cv=none; b=WcV0dg76l/EEbnNVYdylJFo92HZ/ONRLvQMXRKew3yr2/MGUlDXShgutlxKLDxOadH6p8Ilo9v5gofO6cKdl1SzPSpttbUmpotY1roDfjqEaN2NyvDYtOq3udXDmczOE/hDWcpO0zwnAxTgBm/2EpZHB8Q+HQgqGzA4DqbVPTlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414978; c=relaxed/simple;
	bh=xN7vBULNm4yY0wa/SFWXx9HnBOb3vi/+iOKzOauEgJg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PGZ+F3TIo1dGc2/jVyOtK59zbaTRd0Nu38V1CuHd2aFSgGyAeC9USabCLj3mQt8KXQObWrpI5JS5c1qV+gG5iTiWqgBR0qMBLzRsLihsBOoU8S276O/ijqKGjyQgz3r+FDIA9AToJvtT5hReqMO893Rc0HDLAjpktj66ZqFlw7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=OMnh+gH1; arc=none smtp.client-ip=220.197.31.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=OMnh+gH1pqoLDJG1/RyMtivsZe7uz4d40xO9C7VjyTQFMkdaTXKx98SHxhxJRrmcAYUDYfUcMtgCL5fvKhQak/yH3iYsHdnnfVaUnc6HSxwO+rn4lrJG7D8KhJRR9PJDUr7IRPe8VC6TaWsWKmYgtbNJJPaPQp41+wSHtj2ZgBA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=+FlFQ9W3aFSvGgRgzhH/suTQ4ZoLYUscTAd93Wv0Jtk=;
	h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.45] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id B1647460200;
	Fri, 23 Aug 2024 18:52:28 +0800 (CST)
Message-ID: <70b6e321-0b8d-4dd1-b098-4cb6a0f83f93@rock-chips.com>
Date: Fri, 23 Aug 2024 18:52:29 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com,
 andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com,
 finley.xiao@rock-chips.com, tim.chen@rock-chips.com,
 elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: release reference to device node
To: Ye Zhang <ye.zhang@rock-chips.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
 <20240823034314.62305-3-ye.zhang@rock-chips.com>
Content-Language: en-GB
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20240823034314.62305-3-ye.zhang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhoZT1ZJGUJLT0MeGkgYHR1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917eddc7ec03aekunmb1647460200
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PzI6MRw4MjI2LCIfTig6Ax0I
	LS9PCUlVSlVKTElPT0pLSE9CQk1JVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlMTkI3Bg++

在 2024/8/23 11:43, Ye Zhang 写道:
> Added a call to of_node_put(pctlnp) in rockchip_gpio_probe to properly
> release the reference to the device node, improving memory management
> and preventing potential leaks.
> 
> Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> ---
>   drivers/gpio/gpio-rockchip.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
> index 712258224eb3..5f60162baaeb 100644
> --- a/drivers/gpio/gpio-rockchip.c
> +++ b/drivers/gpio/gpio-rockchip.c
> @@ -715,6 +715,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   
>   	pctldev = of_pinctrl_get(pctlnp);
> +	of_node_put(pctlnp);
>   	if (!pctldev)
>   		return -EPROBE_DEFER;
>   

