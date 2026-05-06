Return-Path: <linux-gpio+bounces-36313-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM4YJpZn+2llawMAu9opvQ
	(envelope-from <linux-gpio+bounces-36313-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:08:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C6D4DDE0D
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 18:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C42E3065255
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 16:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898E54968F5;
	Wed,  6 May 2026 16:01:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754B144D682;
	Wed,  6 May 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083295; cv=none; b=iyd4xx3gXYcY2s7ep8qYJfwnaEVpkAKWdJxCYHuTeeOuX6rIXj22hb0OD96aW+Y/Fe4jxLAd9Z/kog8t17/yOHFlpMpLjB/YxhNWzdpU6P+Loew3yT8wHxv2lebBEGOjv6w5zwzX44sizJ4OAC/usMLd4mvkLYq8RIFKsul+Sbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083295; c=relaxed/simple;
	bh=Pdxjh+MVY+S12i6fbEKZTJUUsYrxu+Bd2Br0RkMq47U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0Msx8eXSDrBN4AJmq8L71P/Wl0Jxk+NOas0yt+5+4dJsCKFuMNEHgL9gql0wwHdUkAbnVY/baUJtJCCNkW6oGTOQF12jEfMw+4QNby9k3C8SPeg6cZcTNp6pT4T/5AVQ21bbU1tDNTO1ti5sFRVB4IyibzACc/NRORdk2dJEUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz16t1778083257t46dc08ae
X-QQ-Originating-IP: G9YZKnrl1p0wXA0Vy0+oySRdc1VRx/a+D0I73RMqFHw=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 00:00:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8386846045021828038
Message-ID: <EE8A30342A260FB4+57795644-675f-45b1-995d-48de28b14a34@radxa.com>
Date: Thu, 7 May 2026 00:00:50 +0800
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
Cc: Daniel Thompson <daniel@riscstar.com>, Alex Elder <elder@riscstar.com>,
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
 <549BE66F62F1470F+a489d4fd-10ab-484c-9b55-6aecfd05d383@radxa.com>
 <a8b5d96b-3c8f-4ec5-b205-bbacafbf47aa@lunn.ch>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <a8b5d96b-3c8f-4ec5-b205-bbacafbf47aa@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NYlggeZuI0UG5ceJbvnRxJWvN8cJfwrOSkmij5dH1qZMj0vYN4/mkdbk
	Iqo46RtHaNQup3gfYG3N/fW/GEqEdBaJmBUv9f28xfLpysM4DWtxo2wV53MmIqhnJzgXnU7
	PGk55JDkJ9LxlDwX60+kcTO+iv7TOZmstjBKNdHnsdhc4R6jXEREuX1eeGdUMMGGe4rYWmx
	fO5TDyTaxdYIbcbpERvOCA3xuy0x43jM3inNC0C7ppGhILRI7dZP72q2fcj6Gr+rO7psQwx
	/O5XIXQwHB0LG7VYHvCj8KSMiHXtzJY0eyR7qritmMcnuvSxhO0ERIznKVJ0g+m3tGrLf3A
	EFdq5tVI/AIkjE3m6xSZUu3GoCzZZlrl1HYG8mrcvJy2OzlBkN/GeAkyJeR1R5D293NvVSz
	mHb27v3iEEYS4MAnV3gy2xxCdV7ynPPUFiP+54/TVqAlJHDI8FK1c93Al4WBPNpdIl2dQ+o
	2OPAYrIrSs9Jhmv65nhGHajAO85nccy+kdmBMjkw3Wh6v5U1mg1gnFvnX1Bo99kcT9WPHia
	rylWDq4At4A0+xRk/uK/4QKlnipmo0151IlTv0ZSLEeTZRsvC2cgxinq6DdzjzfKrYaSLJb
	0OtRlbAtYA0EkypuOkC+b3FquIdJwLGZ3hH2fC8+2T9vW/LZBNndwXZ4zB5oTmbTiuoKhNK
	2QxDSOg8J0K9tOI0PDA2PDcO3UB3hqhSQVMzLvnh5qKSQ0yhi4L/bm0rAZYOzC5PR8WzQy9
	HWWtccenfAiNTcfQOBpZ16w5unSa8zPNjhAYs5RCtouHfMuvFmpXh8yJ2kD5X13uJv3wOQx
	jBjCdH2B7qfV7NfJtdYfdSXsO6KUqu+szmAS7OvRrjRPitzWxm7jh48Vo4zlkFwbMMW22lm
	hVQXVrJ/TkOOaZ9KvkJ5SpFWhjwGXE21Uu//pEtQSIid0FwwOldiWmcL98vmeekB5HvoNYE
	VaGcdYzrpnkPIMoezsM9GQVHz67Fj8MQsqJlRnD5vChR41Re1ZHmX2j2CYj49yfefvqD5XL
	TGy7podOffB2BONmomlVKIcDSkYbw=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 50C6D4DDE0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36313-lists,linux-gpio=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:mid,radxa.com:email]

On 5/6/2026 11:56 PM, Andrew Lunn wrote:
>>> Does that mean you don't get phy interrupts reported in /proc/interrupts
>>> before any suspend happens?
>>>
>>
>> No. The phy works in polling mode AFAIK.
> 
> You should be able to tell from dmesg:
> 
> Generic FE-GE Realtek PHY r8169-0-600:00: attached PHY driver (mii_bus:phy_addr=r8169-0-600:00, irq=MAC)
> 
> irq= can be MAC, POLL, or the interrupt number if interrupts are used.
> 
> If PHY WoL is used, i would expect interrupts to be used, otherwise
> how is the PHY waking the system?
> 
>       Andrew
> 

Yeah I know, it's indeed POLL. The phy is now waking the system using 
the INTN_WOL pin directly connected to the SoC GPIO, instead of the INTN 
pin connected to the QPS615.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

