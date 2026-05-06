Return-Path: <linux-gpio+bounces-36310-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJn1LIti+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36310-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:47:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E874DD8B7
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:47:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16DEC3022053
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE40494A1B;
	Wed,  6 May 2026 15:45:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368F547DD65;
	Wed,  6 May 2026 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082328; cv=none; b=r0qpRPjH9RflHXHbWRCGjgyuNETuPeQ7WDd7P35plWmU40oChKLRT1t6WUhsn1zaGooQSKBzFQI4HrYs1a0hEATZS+FHrhvp885ZQeVcHS5MXpOd9UGZA1PW7ypqfbJqgrxrE7j5f37FzU83UYymeRjVqjTG9JPgNh2XsTLmHSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082328; c=relaxed/simple;
	bh=cLst7TIrzB2EttSm/QmnT/2eZbnvabiG+RpImWplrts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjdwVBRfo7ay8xcRFijGb48ydeTsp0acLKOm++O0yltb9fX2MMJLAQaH+lJVnDtX1mLbwjlXCuvZwbxcBTkkqB1FCrjgERAxmcVziyx2E2ohnXOpUdHTgL9AHIUFnsIPPbtmX17jhrPqVvFfTnKCB6wsxgWXzVOobghUr1WU528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz7t1778082303tad718e7d
X-QQ-Originating-IP: IUbeVjFMUOeWOYng8sGFzDDtrsWNZj3aHK3Nzskz1o8=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 May 2026 23:44:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7158039803468193792
Message-ID: <549BE66F62F1470F+a489d4fd-10ab-484c-9b55-6aecfd05d383@radxa.com>
Date: Wed, 6 May 2026 23:44:55 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Daniel Thompson <daniel@riscstar.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Alex Elder <elder@riscstar.com>,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
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
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
 <aftgorkah-Hjrvq2@aspen.lan>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <aftgorkah-Hjrvq2@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MGxrRyrvqqSAJPtm9+Xn8xQ2xA1AHSxENunW+ehiuhpYbHNZNVX+5I77
	wfEoPZdY8rSSnBMxbOMBAUXrcxyTiHvHjYdLIruNFlVs5lr5HDLEQ1ApU0cFLR+6YfK0cxl
	xLQwQUO7Tb69bQylEOxrNQ6mWphQKFg/TiXsZ1gi+FVTHjgIg/Fr6j8Q457nWfpG48XAJzc
	5XvJ2E6Usyo8kQ57Bnnqm+krfqblXcs7i1vUPim1nujyUIPBIbi8cwlBm36UDmFh3srxEhE
	+Ryb56EQI1VkDQa2KKpshuWjq99XGYnWUOM/1rx4F2kFuyYWa2Z4COGGN9BC+ALkqj5ePLH
	gbFiAWQ8TibPnvNKMS36uWka8lMqh7bKXZxLD/k8uLcy/PVK3UWVekpSyAFTm1MafcK88MG
	VoAWmLFZ2mggMy2AuIU7+qsCwNCuVdY5sg3BJB51QtMSyOfS2mUsq0m/v0hpmk3xADo5kK9
	8FlW7z8nbMx8jvr66nXsWSoEdREevD5+5Xmy1nAdvuGWktXcGQhVnd2CZKJbVVfuaT1pf/4
	C3cwwkAyC54RvT6IWnn9HShasbW724+bTFuNBJfsSCilvctGMH6syQbfTBK5OXQKvmIw3x4
	qarzR6NdI1hR994C8uKTsqpkUrueoQnqMFptlxAEM7X3jvvwwKbXzDc48sHQUQXwZ7B7aMa
	Nal6lzE8DmjyGk461b4kkEEATnaV8ntovq9/27lotTr1/xibXNTV9+AqsNiPkHXhoiDZ9aS
	/5rpNyFTXrtTnE6OsWnPwjzI8uFcL7V3DeIY3PENtYZLgjn2hABGOpP/FpulKp01zIu/AgG
	ENVE8OEgHs0pcexza2gSGkY1zJzV2iyqswTeiiqJ8XKL1yVdsmIBIFWYLyEqYOWPqPJzIhi
	Tre2PFAPTXsrW8c0g33qtsnMjdlCxTQcbWps7nfZCdy4bU05lSAE96EcWRLkNu1O4Z27qV+
	h9nrlUOx7j5H/UqAO0ENqXCkAmY5Rkmwfe7kIlC8UklVOo4ZAc5o6kI8cPsw3yP2N8BQ1fh
	aBu0P+aQQ0sAvHSKc2povYS6tafFYhOZCJpENmhXfoKDGX96f5QE0Jx3VZ2z0/w7bZde9Wc
	Lu07ZB4YcFxuQPT4Rqx3Cjt7S1VQoSk0g==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 91E874DD8B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36310-lists,linux-gpio=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,riscstar.com,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,radxa.com:mid,radxa.com:email]

On 5/6/2026 11:39 PM, Daniel Thompson wrote:
> On Wed, May 06, 2026 at 10:35:18PM +0800, Xilin Wu wrote:
>> On 5/6/2026 10:19 PM, Andrew Lunn wrote:
>>> On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
>>>> On 5/1/2026 11:54 PM, Alex Elder wrote:
>>>>> +	/* AXI Configuration */
>>>>> +	axi = &td->axi;
>>>>> +	axi->axi_lpi_en = 1;
>>>>> +	axi->axi_wr_osr_lmt = 31;
>>>>> +	axi->axi_rd_osr_lmt = 31;
>>>>> +	/* All sizes (2^2..2^8) are supported */
>>>>> +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
>>>>> +	plat->axi = axi;
>>>>> +
>>>>> +	plat->mac_port_sel_speed = speed;
>>>>> +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
>>>>
>>>> I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
>>>> it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
>>>> hook?
>>>
>>> Nice to see somebody testing WoL.
>>>
>>> In your testing, is it the PHY doing the WoL, or the MAC? I assume
>>> PHY.
>>>
>>> If i remember the DT correctly, the PHY interrupt is connected to a
>>> SoC GPIO, not a GPIO of this chip. So for your board, it is the SoCs
>>> GPIO controllers ability to perform the wake which is
>>> important. However, where the PHY interrupt is connected is a board
>>> design issue. Could the PHY interrupt be connected to the chip? Would
>>> the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
>>> conditional?
>>
>> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
>> MAC to power down during suspend to save power.
>>
>> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
>> INTN_WOL pin is connected to a SoC GPIO.
> 
> Interesting. That is different to RB3gen2 where INTN is routed to both
> (although there is a do-not-fit 0ohm resistor option that could change
> that).
> 
> Does that mean you don't get phy interrupts reported in /proc/interrupts
> before any suspend happens?
> 

No. The phy works in polling mode AFAIK.

> 
>> Without this change, I can't get WoL to work. I have a working branch for
>> our board here:
>> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/
> 
> I took a quick look at the DT and I noticed you have an SGMII PHY
> attached to both eMAC0 and eMAC1 on your board. This is something we
> think should work but were unable to test. Are you able to use both
> eMACs concurrently? Would be great to see that confirmed!
> 
> 
> Daniel.
> 

Yes, both eMACs can be used concurrently. And they can reach 2.5Gbps 
under iperf3 testing.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

