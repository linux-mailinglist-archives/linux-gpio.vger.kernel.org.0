Return-Path: <linux-gpio+bounces-36294-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG2zLzZT+2k5ZgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36294-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:41:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 519994DC6D0
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 16:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFCF930A6DFC
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 14:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F333EC2F8;
	Wed,  6 May 2026 14:36:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF71143D518;
	Wed,  6 May 2026 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078159; cv=none; b=JH7mkSU85AN33ixMiBK6KNkMq/I9QsYDZpDbas8VlQZd3fFo2UGuGKgsRjB1G/4e4yyAk/hA4PWz77nhSqlge3H6SrJAkn8fyPKB5yb6zMEWyGJuTYD+aEjQha9lUbFNGm2bC4EVnHounTxcNADHI7Apixy8MBS76vktd1uh3+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078159; c=relaxed/simple;
	bh=Zur84kG6Cnp4wreiG5CN4FgwbW1EIdYLvjwk+4rMp9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWh+kVXWcOL6nEfYH8GlMmyqT6g3PusCZecvtgvYgDkf+O4HoyEPXhyFfqKQAowJoijKvO/vEj1yRx3xkksoZj49nFqi/yy+yLpY05y+97ug9HsRThpcwBpl8GEb4OWIjgeaAiOHdItNX3PD2GbWFP6FX4jwxCUG+8uU7xEaT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz9t1778078124tfdb3498a
X-QQ-Originating-IP: HLf/KqKvl4iUx55Y9dX5tREX5GHA3CKBaEkxPVPPjPc=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 May 2026 22:35:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7518115279056366694
Message-ID: <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
Date: Wed, 6 May 2026 22:35:18 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
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
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OfvHCbuEslM3Ck5szwuuQAkL7b1wZdWKW5s8yTwsBXMt0g7JWSmtLq5z
	GeqGX+SvAzYkXuUOHu0oZS1KcuPOB7YBUdOFze6JBifAKzTWQiSYoOFU8mP12whoplFDt5R
	0vrN3lnq1jUm9vvtu78UuasMewHcoRlx/XVkUfpbM6Rpuwc9p0ZEb1S9o1wIoD4coV4wm4X
	qoWyyx9iFZ4L6VwVQTOmk6aF1py0JsFAiDCJRkvby+pvEWLB+cHnAbcNK87AKUcvmMfO5XR
	8wqVOOG57Oc3EboSM6cIjXGlKeaEGVGrzL9nKILgRvvp+HFkIsgmYHftsqrWbua3ZfharTU
	sFHYbNPuzEYd/YPYwQgP6lLL5Fv4jJOgbp69v7lqp/QOhFgBHF1O0t4+CgIVMlmVPXH3rP7
	HSf4PL5Vu6oASDITs91M1rTnDrlf/iBvE1t73lBwR78h6gfKV2WIemvvb8ag5KgX2o7S3cH
	Rn4jFLVJImGVSv2o8ry0grQlS2JLeIV+qZRMOl8FrxFIyP+kPuxz69UvJDBKZJyni1piSaQ
	Up21qbkJjGqxW/ShWB3OOl7ezSX/y4ca10qw0vr3DB8zHhJkcXoGERyAzKp8tUaN7dShEuQ
	LyX1BOwyIcAj9VwTf/XQ8WYEsWg+/INTigOOVsmmIldH92kr4ZUlKmZF3A++16LWX8LkCmF
	1fVf+m+CXvR/Hj2Q7fuaVJgjnxBPYqrXd1Vk04rFe4oPvNIGut7/P7ksDs7dQRL55rUdjg3
	WHtsSvHSBA/RmyseO2kpPgkisxGcYTklXDM4hP7R2XvapIdgRqA4ujjZ1T2HFWHnXwg/LtG
	lm3TtAsAHV14yezknyUT8nl+KBhjiJZ92JRUyUyXhZMiY9d7rudY2wr3RZx9SiKh9CYstFF
	8MvJTinKwRpw4NdmF16h1kgvc+FJxeN1j9TA7pF2MhvpaUlEWZc54M5OE6iIg/F9GNsYQze
	N5CzIBeWkys2UFo8YOUDNHCn0S62D1uw9Vq23fce78sGFIB0huepiu4RCUO0XObQa3vt6Y7
	IpRES9DP2aXTxbEYqqTLAxnVWZo/KZEV4QWT7ikpMl/HoOpdIs7xjrUg41rUsvkJmAUkouP
	Y0klfgQdeZ5hs3vrHwsWLw=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 519994DC6D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36294-lists,linux-gpio=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:mid,radxa.com:email]

On 5/6/2026 10:19 PM, Andrew Lunn wrote:
> On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
>> On 5/1/2026 11:54 PM, Alex Elder wrote:
>>> +	/* AXI Configuration */
>>> +	axi = &td->axi;
>>> +	axi->axi_lpi_en = 1;
>>> +	axi->axi_wr_osr_lmt = 31;
>>> +	axi->axi_rd_osr_lmt = 31;
>>> +	/* All sizes (2^2..2^8) are supported */
>>> +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
>>> +	plat->axi = axi;
>>> +
>>> +	plat->mac_port_sel_speed = speed;
>>> +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
>>
>> I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
>> it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
>> hook?
> 
> Nice to see somebody testing WoL.
> 
> In your testing, is it the PHY doing the WoL, or the MAC? I assume
> PHY.
> 
> If i remember the DT correctly, the PHY interrupt is connected to a
> SoC GPIO, not a GPIO of this chip. So for your board, it is the SoCs
> GPIO controllers ability to perform the wake which is
> important. However, where the PHY interrupt is connected is a board
> design issue. Could the PHY interrupt be connected to the chip? Would
> the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
> conditional?
> 
> 	Andrew
> 

Hi Andrew,

Yes, the PHY is doing the WoL. And I guess this makes sense as it allows 
the MAC to power down during suspend to save power.

The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And 
the INTN_WOL pin is connected to a SoC GPIO.

Without this change, I can't get WoL to work. I have a working branch 
for our board here:
https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

