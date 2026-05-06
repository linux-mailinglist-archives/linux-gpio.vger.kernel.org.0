Return-Path: <linux-gpio+bounces-36318-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEb2IVx++2mEbwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36318-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 19:46:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8774DEF88
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 19:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790CE3012C64
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 17:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4454BCAC8;
	Wed,  6 May 2026 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="A/tWM9I+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD1C4BC03A
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 17:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778089477; cv=none; b=muEqwgS04FfxeDsBqswdD2Qjh+0N+cIdPFYJBlHBMqYPOoS9C9Jkb6b3OiBksrMHJ06jBhg+W/aTUKWqYU4Wa7nN7AXAL8Tzix+tB3hJpE+F90Ps7q7u39zmkT/wuB4RFV/lCc6I48d9aVh0ZwYNeZUL7EbJuiuCXj6cAwUP+Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778089477; c=relaxed/simple;
	bh=/YjFQWxNpMQZ2f2KytppViSRzU0yZJvUee9ryGQwSOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlvSliiQCGcHrS7F/FAvTclWCTmfX+1VFr6FflzBKQ+DNG0CN6PgF3JSb60OtCdm+53/wwhDh5lJQkq8en00rAOcDYR7NMn7tIF70qpzzA5cxwRJXqcnCnNPFkhQ2mYFmoSMe7QIIu6dboUx2ezEq7GJt3xmuw/0LNBaC49ruCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=A/tWM9I+; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d65f4073bfso900892685a.3
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 10:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778089473; x=1778694273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6wXO6STmxH+YsbEuPXhWzzsM6OvvesRxD9MxXwGEOY=;
        b=A/tWM9I+MidkfGgsZV3URMJGGeCgr+x0pwX/vDmp9qjFxG3qTM0C7yaPymIneMJsak
         00eo6ukEIws+rAbKxilEt8PE3bBQl/bdeIR843LD5oyHIoQlulo6XQ2P7r5eu8hR4feO
         KEVy7WEU2p/Ey/PiAiRMaz+tmrsQkdVuICkapNuYK1QpbWLQoF14Yl0qTNN55VLq3nHj
         tbr9KV5I1Xt75WkkNjVUdlujZzYhGTnfDX4KghuHirRo+pcUytReOCCL8DveJ7DESIQB
         UXqEHuL//GRfLjdNZXXg54F1QEu0gFapghqGj2IZcfZ9iImftmoCfFv33sIOaKewB+a6
         47XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778089473; x=1778694273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6wXO6STmxH+YsbEuPXhWzzsM6OvvesRxD9MxXwGEOY=;
        b=nuXnWxz1KUeF0zcwOZfyfKOHPGscJPHXBTaq6mp1VvhWeiBenrDer/hMWIg5bg469D
         W3Is0JrHVx5MjYynItAV+9o7/MQstbJRRDeJ7LVK0iMC79Xxi9UXS5Uf1uSrvYqpZoqu
         aeWN+cqw6L9/u73Q0rrcn66yAfKcH4vbINEip8sp2dY30LAdZwvrQUYlQ0lgqhctmHFE
         9dV2qIOSL/E7T/hH5frvLpYwmm4Ev1NHTrXY626g1as3/JOos3Oc/c8GSI0vJpQezFHP
         wosPD3H5DTq3oYMVFtRvc7o99w7I+GQZGR7Vnuu4nMgjHZ6exJcTLU0LN+rJLz9drRM3
         swuA==
X-Forwarded-Encrypted: i=1; AFNElJ/EmK7yKzCbCCqpdpgMmALpxSNnnTDCtFW447s7YzPm1G33hvlI6KruLvYVLaKe3sPXGrI+q63LsA4W@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6jzclSbkrZpL9mR4WxyV0WNKhwHXp0cqgZPvRC9FLA+/vwrxD
	obTkOO/EGc80kMQHLkLG94+yIRN9CQpUM/NjtDrh/ONINKuWAOXTlHb7yIDxMuHVMkA=
X-Gm-Gg: AeBDievTks8vkI/zvFzjO+J0VG+TzV2wSevb2H+pJli29UnYJHdpan5/biUz5ET/ATZ
	qNTurww50FTw/YV+PXUBD4q+ZOTGjjVK4LKQoVuszeM7Q7nGRcNTucSmVdDng/WvDAG1atOc6Y4
	uCSZd6k1EspAUfJv084MveGYfR8jS39+KDXLLvRdURsKsxwtDx2oJmfQZmUDaSOT0okGXFAlUc9
	FN6v2ighUxWyFrCVH75D9PKIjxmlgkFsG2KfxafI5ZNQH1rWNabHlsjjvZ5t7L0EI3bqc8PVGS5
	DryoMiu+42V3ZfGqPWGdBKe2gB5a8V74BMKVf46H5cCPfj+KcedFfoVYxh9Mep0B/W4CKLrQZ7v
	YMPkn0IvMvMlpoEDanwJ9alJRonmwCRRRGTGuL9EtO8yEcEnYppsdAVA6HtPupYavX31lDVAx2I
	Bm9Qx4Jj2RymBF95knCCtLuUYkzDstOjf9ZwaYI2uJM7R6ADffP0ukn/9SYldZr8tfoeWpbB/5r
	Q==
X-Received: by 2002:a05:620a:f0c:b0:8f1:9e59:220e with SMTP id af79cd13be357-904d63e7a90mr642596485a.39.1778089473124;
        Wed, 06 May 2026 10:44:33 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91cdfbsm1736572285a.34.2026.05.06.10.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 10:44:32 -0700 (PDT)
Message-ID: <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
Date: Wed, 6 May 2026 12:44:28 -0500
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
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DB8774DEF88
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-36318-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim]

On 5/5/26 9:30 PM, Xilin Wu wrote:
> On 5/1/2026 11:54 PM, Alex Elder wrote:
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
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
>>   include/soc/toshiba/tc956x-dwmac.h            |  84 ++
>>   4 files changed, 890 insertions(+)
>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/ 
>> net/ethernet/stmicro/stmmac/Kconfig
>> index e3dd5adda5aca..66bcfaccbe21f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>> @@ -404,6 +404,19 @@ config DWMAC_MOTORCOMM
>>         This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>>         controllers. Currently only YT6801 is supported.
>> +config DWMAC_TC956X
>> +    tristate "Toshiba TC956X DWMAC support"
>> +    depends on PCI
>> +    depends on COMMON_CLK
>> +    depends on TOSHIBA_TC956X_PCI
>> +    default m if TOSHIBA_TC956X_PCI
> 
> Hi Alex,
> 
> I think GENERIC_IRQ_CHIP should be selected here.

Yes there are a number of things missing in the Kconfig definitions
and I'm working through them this week.  And yes, since we use
irq_generic_chip_ops we must ensure CONFIG_GENERIC_IRQ_CHIP is
enabled here.

> Thank you for the driver.

Thank you for your feedback (this and others I see).

					-Alex



