Return-Path: <linux-gpio+bounces-13605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 257179E8004
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 14:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC95D1882E2F
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Dec 2024 13:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB9D145B0F;
	Sat,  7 Dec 2024 13:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="YrZoYS3E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AA41EEE0;
	Sat,  7 Dec 2024 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576691; cv=none; b=Gxgj1b/aGxCcfMyAl6qC+QSgJFq87X9hBECEhiM4vPxDzfOvguHV7CikTOH5JSWMREbJRXK8ksEiW3Y4eLTxg5tF0MHN960e0uQSefVDYKm1jxXzYDEZuaKd1XuAZ0Xu3xjDOhfRV533vBhil7ea7bq8Sd6RtCvGNYc/1CP8LnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576691; c=relaxed/simple;
	bh=maSAjktKkXI49/Byz2RR3Fxqyl9YiUGdhE1IyVgSjZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZq+aeWzcwnDKLCyq3Wl/VfQ5uOcF63+l0Wp0wAnqmUu90FS0E0L7kkbr/H3wQB3r7JoQI8AlNTFWL+u21JGhy9h18yg0CAsBPU7tANrBgddhV523k8W00CVmPD+p7nygw/AmVZYFPDXPJEieVEalL7txnLQaBJcOt5Q1wIvqSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=YrZoYS3E; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1C90F89182;
	Sat,  7 Dec 2024 13:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1733576340;
	bh=ecF4TE66khefvBf5h2UrJt6LgwhU3O5F2VlOQKZYwRE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YrZoYS3EpSJcl+nxxUQImZJ3aUI06M2S+KIz6rT5LfZuCxXtlPe4HmZOOjfGRs5/F
	 eaBMNZkkBL9QI8MaCaJt3ofy6f+tvf37U/1eYOttO9HeCTkqixeeJz6IvndCuEo70c
	 p/YN7l+KA3thWROzL+kbRgMeAiWZO8koqmKKH1YW7TDp2mntcGxyvz8VNCMooV3fCp
	 5VBSJW0LNxGqdp/jJ85e6p387N5+fhFy4bzEW9rZmH0ymaxWE49y48WYqoTvyTVS+1
	 GDCuF7TemhSdDeOu+FoLsfXRVn3VlL1xEAlxUmHy6Qh0QOZ32bP6TywNBbi8lSwjnc
	 OeFwsC12+NQGw==
Message-ID: <9830993d-943b-4079-b31d-7c77ee83d306@denx.de>
Date: Sat, 7 Dec 2024 12:42:44 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: linus.walleij@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, make24@iscas.ac.cn, peng.fan@nxp.com,
 fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241206214315.3385033-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241206214315.3385033-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 12/6/24 10:43 PM, Mingwei Zheng wrote:

[...]

> @@ -1646,8 +1645,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
>   		if (ret) {
>   			fwnode_handle_put(child);
>   
> -			for (i = 0; i < pctl->nbanks; i++)
> -				clk_disable_unprepare(pctl->banks[i].clk);
> +			clk_bulk_disable(pctl->nbanks, pctl->clks);
> +			clk_bulk_unprepare(pctl->nbanks, pctl->clks);

Use clk_bulk_disable_unprepare()

include/linux/clk.h:static inline void clk_bulk_disable_unprepare(int 
num_clks,

It looks pretty good otherwise, thanks !

