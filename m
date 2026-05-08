Return-Path: <linux-gpio+bounces-36465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMa1OJ3g/Wn0jwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:09:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C744F6CE7
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01B3A3031AF4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 13:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180933E121F;
	Fri,  8 May 2026 13:09:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936C41F8691;
	Fri,  8 May 2026 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245781; cv=none; b=cRID1vfVWmeytbb6zeY9cfEztyJbVK1ejFaS1jH57wpO+538JgrQAtKPefzfoqfP44NpZYTybX9Cr3OC+KHX2EB+Z7jHOd4k3qFa9cnIJUyz3EjpcQeFGVHJPDV1piDEppJGSzzeiNNe+WD66QiYg3PSlBkq0E6qozAl40MlodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245781; c=relaxed/simple;
	bh=6S4huXMF9Eta3Yguft6rRPtDlnuPmLRdDWOyNOIjQWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zly17A7dUA3i8SjBCZCD42yJB0qiqzBM/lcDacpaeSUAVI7MeywJg6v4DGWzAKt7RP+JmtPSQ1oC2nvxz/6+EsDm0iVmzUOFz9L0RFst8EgoE42cQHDQNfMwSBs+n1kK8X3cwSBrhy8l41RLDU/2kDoEQ6Smtxmo1kTmSu09q9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz21t1778245760te8ff9860
X-QQ-Originating-IP: oDfTC3UmzXvWtX1d3MtBp/Xfjq9qMy3Zm4+IG/bmLQ4=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 May 2026 21:09:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10512550886452153488
Message-ID: <6744F8FEFD290FFD+4973b8ba-7d3b-45e4-8478-0b3334b81960@radxa.com>
Date: Fri, 8 May 2026 21:09:12 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
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
 <ae90a4c9-f027-4373-a378-d0d4b7796ff3@riscstar.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <ae90a4c9-f027-4373-a378-d0d4b7796ff3@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nt+z/y60tPnUntNr0h37IREVots3RaLwrPULh0GA79jGtOpfwKEdcvBB
	vGDhDCFVCVDGkxyRE2OTvoJ3BAC5PxlqIDN/JJD4AXSK/ikl0jyX/GSVQGKFFkz4ENdEUSS
	jVXeX8iIz18DyrTydrM2dT8KiFby0YfBminxUOL4J5AlH5kCMgkXuyKePKNiHWGlFK+yBQv
	SRVy4V6iARJyXlvbI1rbJ1Dngayn4XErNHsXR0Kg6smHfZQdkinU29+j+A6LtvM6yZUbS4t
	QVQptLZzaaJ4WQvRP74OndQJsbw1vv1nmsXyg0PvpJnR4E3kbenRf7lh2UQrWCAfnYWhxcG
	hTAd64lSERlfpmuk9ijl7MHnkLFb+kT+JhDfn0EbwWHpNLpnzJlzMszqlfuaXd1hwc4nDs4
	Ptr2Y85lsLV/akVhLZ1+rrmVHL5PiC3YijY+AWaatV34T0VxlBj6F8/QWgEBQSR7nOH8bXQ
	XHo4x+A7+OOLAYUoEpxHHu2jQBnq4W40kBbHQZFQcx2uX3k9qxLStign4ItRLp83ezdKGG3
	rXIy7z63D4JRXnth+L/LMCgCOPIZX6UbSeKhC9UhQunoQKllBcQEkKDh5ygpTooEHPICCWN
	v0NJ3AVXTCKg6RKp5kRQji0h3ubCOuk69Ca/CWOhkExCsuc7W4Gt18DmMOI73hWUNVt/ZpJ
	Xegb8FAgVlmlXrGb9znklqo0dwEPFirhVlvSBYtwqFD0A+8ja53Su/2ws9tOkRBaTVgwQ8y
	9A52Vd9IzSmDXvRutmZ56mbDo0QML6AmH+JXOF1+N98BQ6kl+Oroy003IPxqdeoroKdzWoW
	7ajNQ78e3UhIMmJwN0Vzj9r/TIEN0VSKF89diPqkVlE0OitsvnUNFQHnnw96hl+q0o7uSQx
	qPUMp9N0FI5EOZQjZweOFJ9azZ8DPpS884uDoNmmdcnERsJD7LQeKa9uc/wF/706zGwfDfE
	NvYT+qtbE9RcFiJA28y7jSs17ND2F9A/LO72INNmSpnullpo/DF8C5pCvK/V+oUxNUDaK1L
	Pplxx2FKqdHoQ5JbP002M+X2JYw0kTRtD1WNuV8r1C1HA66FuZ
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 90C744F6CE7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36465-lists,linux-gpio=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/8/2026 2:44 AM, Alex Elder wrote:
> On 5/6/26 7:59 AM, Xilin Wu wrote:
>> On 5/1/2026 11:54 PM, Alex Elder wrote:
>>> +    /* AXI Configuration */
>>> +    axi = &td->axi;
>>> +    axi->axi_lpi_en = 1;
>>> +    axi->axi_wr_osr_lmt = 31;
>>> +    axi->axi_rd_osr_lmt = 31;
>>> +    /* All sizes (2^2..2^8) are supported */
>>> +    axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
>>> +    plat->axi = axi;
>>> +
>>> +    plat->mac_port_sel_speed = speed;
>>> +    plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
>>
>> I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I 
>> guess it's required, since the driver clocks down the MAC/PMA/XPCS in 
>> its suspend hook?
> 
> I just want to respond to this with a summary of our plans.
> 
> We will *not* be implementing wake-on-LAN (WoL) initially.  We
> will work to get support for the eMACs upstream for TC956x, and
> then as a separate step, we will enable WoL.
> 
> It's great to know you have it working, and our plan is to
> implement it via the PHYs and not involve the MAC.  It seems
> it will be relatively easy, but we have no plans to add it to
> the current series.
> 
>                      -Alex
> 

Hi Alex,

Maybe I missed something, but I already have WoL working *without* 
changes in the tc956x driver.

https://lore.kernel.org/all/859776B5671B36B9+577c19e4-3e66-4036-b26f-fe20287a1d43@radxa.com/


-- 
Best regards,
Xilin Wu <sophon@radxa.com>

