Return-Path: <linux-gpio+bounces-36404-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCscMvPd/GlFUwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36404-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 20:46:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5984ED944
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 20:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B219304483B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 18:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D343D33A6F1;
	Thu,  7 May 2026 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="XxFN21KK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB940DFC9
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 18:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179455; cv=none; b=nwNWdn5N2rw9SVbF8VT9fhPMqP0U5gjIvSutceFihZ7Nys2ljK4aNnC9frNKQBSsAVck0Dqrtp6Arf/jAW45NNwDBogo0HJ/vRzkLY6YL/BVHQSSlSR4qMaXEiq4BM3sM8TBLI18F6iiTDXIBEbDHrvdP6w8UcpdkANkXA50WFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179455; c=relaxed/simple;
	bh=OSzlYQw2h6gcRQVmUKR53Ckl2/E4R/U/cGa1oPYYTlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hw++V2YIa3FrBy46ixke1djHhGZFtJ+TjYcCefcEc/GKHvJ5EJJtDYwXN5oZTvjbkYSTnU2r0joiSlEr7kc1wq4+vEPbxzOvoC21/w94oRX7M73DCIEm+Wf5xqbn/dZtJ/kIQRX4PPNRkYlSGE/BUVaRY9av8BFhJweDSnX2Rqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=XxFN21KK; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50e5bea4045so8499781cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 11:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778179453; x=1778784253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1OHugVXwVYl4EIQGFzGx4AQVN+wMQGiAhztZolIIb7Q=;
        b=XxFN21KKeIEUXbAGo/6Ib+7hUGTlZX/8XuZzfJbo4yl6PSap3BZOrtaZqZvc1Woa0x
         0TvN9aEcZ4+js8z68j+MUt90r3LhtiXIbw6GBdwg9q24mniraMXZ0Vvge1WjQqtz8mQc
         wnb4NwKJ2So0FhLQ4UU9Ej5D+YrrYrDhweEMM4rfVO5sA+1tuVk7/V+5x72FaCnYpwSY
         xkoc5EHJoWePAMfv2RAHc4k2vsCVzgkDN8jl02GAzFudANcX7iezGiutl4yi5yWunYrI
         9pNxEHt5AqTVXWNcfG7GvuP8sOJHtqUQbxIWRmTus46EYlpu0w9nrzY9OcsAahURAauT
         CcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179453; x=1778784253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OHugVXwVYl4EIQGFzGx4AQVN+wMQGiAhztZolIIb7Q=;
        b=CZBUQ49Yn4UGqmsUpuCgRt+ZIkYcUHuttrEFig0MU/CsGRxOKS3nh0++P/DHmk4Nj0
         hUunISYJxX8/Jv5KB2rFNIlSnX6J8/UpNEwdGCuvNE+owGsvNXBLSMppO+yFjD7OI6wu
         VWNzPJ2zFXTvVHVVGO48wJDZzspDja9LYmwXoQOXXmFS0UtleVm1M/k4rQQ1cTEvLrkC
         GicDBoIYB/42trrAIozIy3m1ueItusillsnsmC4f7K7cirLkkbAMkYR3EfVk1I3R2XLY
         I2FnJtDOwVNNPmMWPJHTn2TqjpqUo4YC73IoAzsF7yiJqBl9KuFyecSXdb3IkyHetSSL
         xH+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9FfxdsPzEJLm9YkFYWhi08k5PZj1hTYeRrDlKHam9osKKcmGM6YFCAiUgi6VgveHGol67OkHsDOYlc@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1sbw7SZL+i8RNxKRz2JasIl7r5/mqGAbei++ZoM9b5XSaRlpP
	A/S552EFNXPH+shmr3vaoVfSMcsYEddjhK9vivOYVImRrwuLH96vt36FT0KR0ADCq0k=
X-Gm-Gg: AeBDiev6kQxuwKZikFc/yBQLawt9UfT//S0QHR2GBTch2jmsbma32THEH1Vh925pWGS
	CyAWKCDe14iTKLJZ2XGRxfcldy89+Mwpraj9trUmbwtpv4cLmW6hg0blEugqAbza7te3LXiZDJA
	8HzCoUasx5pWz4VKWlxYqiMm0YqLg0zSG/s40ZuNKTcrFH802qwzuf0hHEuxzqSGizQmsql0ah0
	W8WEJ62zdA0y2gK7eYcNBiSqoq0iJfMypYif76BpAZPn/kA5CyjuMgywQe1BPPWb/QWfS28Y4if
	D2KzoULmcjyzpqfaa1K9MZupsQSYE5tY2ivMIVZ2HX2esLezwtw/UamsIXGiDP5UANCJ6wWa2sd
	ZbwSMWlbjtslXiv5r032hsU4qzk8ajphkflpwnQYkARPAStFBA/rvnQ2qwbFmDOgFswxpFhgQbU
	Yl1FRpCs0t6pbGfGVpWvcY3sGjFy9te03MKRP9Yrb9OUOMf5EUHkKVvBE8lMxslB+m3Yu9LmAWW
	78=
X-Received: by 2002:a05:622a:8c7:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-51461bf0515mr133144421cf.5.1778179453134;
        Thu, 07 May 2026 11:44:13 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-514850d0d82sm5022531cf.5.2026.05.07.11.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 11:44:12 -0700 (PDT)
Message-ID: <ae90a4c9-f027-4373-a378-d0d4b7796ff3@riscstar.com>
Date: Thu, 7 May 2026 13:44:09 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Xilin Wu <sophon@radxa.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2F5984ED944
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36404-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:mid]
X-Rspamd-Action: no action

On 5/6/26 7:59 AM, Xilin Wu wrote:
> On 5/1/2026 11:54 PM, Alex Elder wrote:
>> +    /* AXI Configuration */
>> +    axi = &td->axi;
>> +    axi->axi_lpi_en = 1;
>> +    axi->axi_wr_osr_lmt = 31;
>> +    axi->axi_rd_osr_lmt = 31;
>> +    /* All sizes (2^2..2^8) are supported */
>> +    axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
>> +    plat->axi = axi;
>> +
>> +    plat->mac_port_sel_speed = speed;
>> +    plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
> 
> I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I 
> guess it's required, since the driver clocks down the MAC/PMA/XPCS in 
> its suspend hook?

I just want to respond to this with a summary of our plans.

We will *not* be implementing wake-on-LAN (WoL) initially.  We
will work to get support for the eMACs upstream for TC956x, and
then as a separate step, we will enable WoL.

It's great to know you have it working, and our plan is to
implement it via the PHYs and not involve the MAC.  It seems
it will be relatively easy, but we have no plans to add it to
the current series.

					-Alex

