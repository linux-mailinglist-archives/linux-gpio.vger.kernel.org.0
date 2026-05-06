Return-Path: <linux-gpio+bounces-36302-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGEiII1h+2kuaQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36302-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:43:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADE54DD7B4
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 17:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A9033099D9E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 15:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF04848C8A6;
	Wed,  6 May 2026 15:38:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F93EE1FD;
	Wed,  6 May 2026 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081931; cv=none; b=gBfzbcVSrw0gszrcW9xrlL8kser/M8khauOIghtcoTReynXhJTIUyIuKW0btyaOchCP7hlVcHSdL0aPo1FVDAujR887KUZJmmm41mjBq2e3bT5iI3ifJy0wRLDri+kHowSggO1nOtb0akOxYqycaIj9GYUtFtArf7VyWNw2iEaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081931; c=relaxed/simple;
	bh=6sQcvJ02EAB9Lz/kHFbKX/FUadBZAXtEZqWiVpfYz4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZ7chOJdLt5ErZt3+Y65KZpxiWWjKUwgaGmk1RypLw8Qgz/zTT/sCwq0vq/0kSAaaI4ZddUmYmG/IuONs4vwwmAxb0ZIsB/h7Z1W8oZW6VP5N+fCB7vh6d2Rcdtm0FfFOWF7TxL25LeRS5AGHEM4ae7gTdSvIWxM0ShTfGzzj2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz20t1778081905t5dc8af55
X-QQ-Originating-IP: 66bIYIjIjPtDUf7ZMQLWTQPiTh7x0N6Cl1Fw8/bZasU=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 May 2026 23:38:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4295684557063516514
Message-ID: <859776B5671B36B9+577c19e4-3e66-4036-b26f-fe20287a1d43@radxa.com>
Date: Wed, 6 May 2026 23:38:17 +0800
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
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
 <2af0fee3-d3d6-4434-847f-3fd2fbb841d3@lunn.ch>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <2af0fee3-d3d6-4434-847f-3fd2fbb841d3@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NMth3b25qZ/y3GsZOZbTcTtn7ivxtNnfDwhten1J2cIhmuHszCIWDEp5
	62vFagLVkDtj/ihAfFxqCDAkwPknNTQ8rt2JdPO3DntsuJvxTDZwhwn6v9Q2Zr3fexxrdav
	Z8tOqhADpYyVy9j/gfNlM6y7qT+IPNVQIh9ISw9xH2humwR+0QuQgfl/S6YVNPcViexfzng
	Tu0rFdlhN+wyFpLgg5vpKp26j9ufuc6yKDetrb4Ryuw7818jy3rdUpAnCorwW/EAkH7GC45
	9sHsQ0R5GNdl9foXYGG8tVWqi46VBH2HlSGhx+89L9ZEqbHo1NLEErlzEuRkNG3xqWER7V5
	xHAS00ExpjcrZcs2qHWpfE/7l1GfoyFa/+5zYjXotwBHkWlBP0uJxiOf01OCq9uFnyyXzpb
	OeRyO4nGN5aYqgEjRrsxivJFb6rJNwBktM1YIPpoCA2CwJtV6zvB9XDvhjuDv5ZYgiwB29H
	gGz3Qd1kYxiEFMNOgAJK2zvON05qEvjOLsSde0Vo+LL6YZHv4M+VlHospu6p2a+wEMuEmHF
	Jc2st9+8GhXzqMowizoLQAL9VnQzdAOXMjWoyRvsXqT7B4Vc0LM4XecnPl0Ziru2BKirpPA
	qHkI1zSenEcKZXkvc23ex+ZqmzUztSiU4e/RZIrZsvktRyV/SbBD38JEeWOcNI+nTpBNslx
	iSwfov58UuPq6538i53SLFp+W5xh7QCd1qKPQXAOljWV5AvuAyaKKulKBGYDttswirvo6r0
	0oNQl9z2qpNBc/OtuZcFmGLL4vpn7ILM/Y7dCPvMO85opK0XJce6YlVCCUTeh04dthfKACl
	k+pLhAPReZWtmYTjow9htBMh3OFHZxmVd7cppGF6kZYVWO2OeK+mNL2+FOSTHHcxXshpWZb
	vErub9eGThX/A8VngZnkNdzGFFh+kutCnJM/uiHn4Af2yNS/MOKLin5rNs1vHhv3TxdC4hu
	PJzWLeXYsrFARDQrb66jMt7nTlS2mT9f+K/V7dpZw3LpyIDgi3kTgwqwerOn2yClL/iZKrv
	DZbuWNVc60wjyJ2QSJx9V51Y+lE9LALFS636snRufTrAe5eLiCLWBoPPg2wB9ETWOt9C2EA
	ghCObbyLYQElz+mAyIcubIu/ppF34Od5oZzNMZsR0f9
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 3ADE54DD7B4
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
	TAGGED_FROM(0.00)[bounces-36302-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.980];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,radxa.com:mid,radxa.com:email]

On 5/6/2026 10:45 PM, Andrew Lunn wrote:
>> Hi Andrew,
>>
>> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
>> MAC to power down during suspend to save power.
>>
>> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
>> INTN_WOL pin is connected to a SoC GPIO.
>>
>> Without this change, I can't get WoL to work. I have a working branch for
>> our board here:
>> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/
> 
> Please take a look at commit
> 
> commit 6911308d7d111a9c367293b52f2dc265819f2b60
> Author: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Date:   Thu Oct 23 10:16:50 2025 +0100
> 
>      net: stmmac: convert to phylink-managed Wake-on-Lan
> 
> In particular:
> 
>      When STMMAC_FLAG_USE_PHY_WOL is not set, we provide the MAC's WoL
>      capabilities to phylink, which then allows phylink to choose between
>      the PHY and MAC for WoL depending on their individual capabilities
>      as described in the phylink commit. This only augments the WoL
>      functionality with PHYs that declare to the driver model that they are
>      wake-up capable. Currently, very few PHY drivers support this.
>      
> Could you actually patch the PHY driver to make it list its
> capabilities. That is the direction we want to go in the long term,
> and not use STMMAC_FLAG_USE_PHY_WOL.
> 
>      Andrew
> 

Thanks for pointing this out! You are right that I should patch the PHY 
driver. I have made WoL work without the change in the tc956x driver.

-- 
Best regards,
Xilin Wu <sophon@radxa.com>


