Return-Path: <linux-gpio+bounces-36469-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDk4CwPq/WkPkgAAu9opvQ
	(envelope-from <linux-gpio+bounces-36469-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:49:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A44F7573
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 15:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F29EB30AE094
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AD13E5EF3;
	Fri,  8 May 2026 13:41:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60B37BE70;
	Fri,  8 May 2026 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247715; cv=none; b=NqPCch++bToJYbEhD1hKz6rvLV4vVfYIIrgIsR0621xFWV6z/sRBSnNwcawSgEw6nEV0jNRV9hcfTrND6bmSaOaP55IKDRz67Bv6CnwkXa0VATqa+0oMhBDDnrdXqu+fhW3OGlXejCfuTpvqoNFQ9NfKg10x4zb7Ka7jts2hHcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247715; c=relaxed/simple;
	bh=M01axkFi60PgsS5+yPl+h/GD+JWVJPr57X7IRcb625U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AP1MeOdIHRA2qmwql5WZjzPMQcEZCixtPn6sF1r/+gR5f/4yHrrbwUVCLr5DgPsyDQHXO8A1q7ylvsno2XJYc2srPNJjHF8ge3ynd1mv8J7gPYH0CLf3FbcmzEtLgYp38naP4sA58AXweXwZLoBChF2hLY68j+LQdjxzLSo5lnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz9t1778247685t1369d6ed
X-QQ-Originating-IP: Rwa7KskeJ2ohyMfXaBDQ3/23jeqhEAjyHFd1W0vcT44=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 May 2026 21:41:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14886756243137966030
Message-ID: <ED7EE77387FC4C2F+9b254eea-8598-4b34-876e-670fcef2d185@radxa.com>
Date: Fri, 8 May 2026 21:41:17 +0800
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
 <ae90a4c9-f027-4373-a378-d0d4b7796ff3@riscstar.com>
 <6744F8FEFD290FFD+4973b8ba-7d3b-45e4-8478-0b3334b81960@radxa.com>
 <fc5d14d5-c65d-445f-90c6-9659e284c0ca@lunn.ch>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <fc5d14d5-c65d-445f-90c6-9659e284c0ca@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Mom5ezI3X1cDdstxr0dvEIZV443NBEYAfToYd8iPkwSlMrpUFKrexK8P
	dTvWTgpqC6Skcw0ZRPuUSf3Wz7VpYWQwC9iH6yHq0bFCcJYPFPdk4miUDUngLuiFEe/oLMO
	XvESpVBjhvLLQjFeGc4/SEgKqu9OYOrHE1gMC0mjnqRSeqgJmnLUvcBcCm+smi5QKexLhr5
	CxwYvkoAzOjw4aMgudRQ8yGCJ/Gxsil4YNYEgNXjwqchA6H5ywfDG0StQmJvHaH0ac/3eO3
	Y4gAPULSyC4lTo7wNhiLmOPwJfvREVDd9gH5eapN703xRJQEPIMsXvAN4ADGNqho0RV+Ojx
	jGGwagzF4qK7kU5mZBOptSdYd8kFvS49tt1slIYJSbaPRJZuLhQrQgWk6nl0CGonh0vrQnQ
	BWjX/CQPP2P7pIHcLnUFCCP44rKBHEtW8k7aQ2OK3Sv4Vg1yvwjelZkn3w/Ty/870rJttFS
	OqBkH8/xYcYEqDnuHIJyt3mi3tc1wrHIvYehd5puuj0ieRZ2Cu2Y3BGxF6Hpqb3OmVQC5o7
	eKBrQ2rv3Zkx+I9oQYXH7xa53o5dt3iwq0spnNOtnD5LTHhDbuuLV8os0emQ1BbLfkQs8Eg
	P6/jWIVAL5jB7uiTF1o4qc72Q1N2noULu6hVAQ+rKU9cYYSdzflLHWFLiUFqExsOXFNtrT+
	9sogoxbxW6xeVhVUTYjOCubqmG6q85LsyZQzi7O8W1dn0RQHJz8kEEWuDHNYtc/qSECDti2
	wdKllmnodr3ZJ+AIu//SuRnitrcqNeE8ahOASgdSlX93R85FrVSvI6LHtnO5Ebcxwm7bIp2
	akzyqKkz4b4fEzjRZRuRnZAaIS0jXTdMck9sUMOxo3lFqzdJXZIhB7Ql4HAwL0SlU84tJ1K
	/XT6Z+n/gVx31J5bSD3iZELcqoseoLF8Z8HMPGgRhwanVvAnesUm76VLWLNDlWMfDutM2jD
	qcFITzeAXCPUCfujhBbwj8/EMAbdu9Ry22tR2BGIzwb9lDfzbi+l87t5LWvVAxA2LibQXdy
	I/YPPaVs/0XRwAimtGrqSt/RPEoWIgPWl/9cxxgXehFZCUdqqsnb3gKJWv6ySlAqnB7Mj0Z
	g==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 802A44F7573
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36469-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[51];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.968];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 5/8/2026 9:36 PM, Andrew Lunn wrote:
>> Hi Alex,
>>
>> Maybe I missed something, but I already have WoL working *without* changes
>> in the tc956x driver.
>>
>> https://lore.kernel.org/all/859776B5671B36B9+577c19e4-3e66-4036-b26f-fe20287a1d43@radxa.com/
> 
> Sorry, did i miss the patches for the PHY driver? Or was the code
> already there?
> 
> 	Andrew
> 

No, I'm using an out-of-tree patch currently.

https://github.com/strongtz/linux-radxa-qcom/commit/4a085eb54115844be62bfaa9d0b3e905c22ee479


-- 
Best regards,
Xilin Wu <sophon@radxa.com>


