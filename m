Return-Path: <linux-gpio+bounces-36290-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBMTJKo7+2kQYQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36290-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 15:01:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB964DAA85
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 15:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED2763020D74
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673B93FA5CD;
	Wed,  6 May 2026 12:59:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635443EF65F;
	Wed,  6 May 2026 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072378; cv=none; b=qJJ8oNHI+Qxa90J7qdIlU293SxVODVhX57PuAtxlfytncsRe1NCjJp7ytnmed0kPO8eyTvl6Ssh77eNalxdN4bQp/zJKUACh8ziKUXTyW9cyk4UuDdWnJMcNqBI4eWHl1EokrIQvdkn2CJiy67+piyYnCGgwCXOcVHpqgs1wifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072378; c=relaxed/simple;
	bh=/EbnYU/iZY2yOz8yBdD9aB5PCxtNb9eUGqjoYehaTIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ot73//eM8F5nWb7RP/d92xZVuD+Fjg3QyGA7WRFg8CtmKmaRYQh5bXrMW+p5K5qZUN8mVd7qXq1F1pYCrGGS/88IDyjWK7+GN3tVcoPvAc/cJIgbKBkwhV8l93nYm55Wl8d5ZiUx4kbIvLSfu0e48x+ur3RfbsCo5fz0N+zFFDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz13t1778072348t4051910c
X-QQ-Originating-IP: f3bsUKV8Yv9fAvdHOTDcH8/P4Nuy4zA3F7S2G3vmc0A=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 May 2026 20:59:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 152799247874170222
Message-ID: <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
Date: Wed, 6 May 2026 20:59:01 +0800
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
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <20260501155421.3329862-11-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MgRO26CFjEybBwd/wb6YOxM+siCGdgtDrW15n+VzbyblX64iDdSDShIb
	deAJrTuoFkcNcvF9gQYpiGl1YaAUpdVNpS14TK62mLxdwgs7fwiOlT9CWK75edlL7XFmiaI
	1d+ksVxlupHpLm9WTvFrJNIwSboF53JgMdbxAnRXD1NmB1DrQmf9ce8kniC31Y0ncey3oru
	Ci+MZSceC76IC5au0yXYDS257/Xys4YOlsmd6VWDJ1UkEVNd+ypd4tXM6r/EUmQ2R+vGcoT
	C89pDgGV4qJfmU7Azmu7nJyFyg8iuhIrtvW6ocrQpQ/dAnH/WYTcUW0lMA2iR4rfDwAVPvq
	0y6/VY36c2M1i3wZcUIn9IR7UOKUld1QIufjtwnl0C9JOOB1VPQrGbKc0TqgNYogccvTH3s
	qfQXd3jb20QxARZJYCXUlc3w8qwBhk99EErGXOQBYRgBcm/EhKGHxa0mHcuZVK/WCRMWEx+
	elGnATbx/LKqMk5HPeCsuiOXq7KdWNbHBI2FNHIVRqzDv/tkrUqTN1BJTng2PDUPueLiLrc
	Z13b9wAvB4gRQ4Yed80aoiWMVEf3Erz5sFHCw+cHtmjhF57HCzk4rZCIIzwzizHp2pNmGJW
	HgnC2vAN4o9evo6M+YTXEmPP16mxYyR/YYqXUFj+urhJm9arJJ8sOHCl3lyifRK6GGsLQQc
	wanDO41FJ1/IDq/4MaFbCsg/XcA466ApLfIAtA2Z/ZxYxtkHitfPc5vH/cFLlgZC/NQxnMr
	8WHqQz7BVF8eteyx/YHsmQQD4tBPm4NvwrmrPug43BpVtiGRi10ktQKtpAjZY0A1ewyiDUC
	n4DPe3vJirX98tNnwVBARx8B1EgNunDUt/zx0vkUwbmgxKi0vhgJtffn90CbN8BGHP0uNYO
	ejeEBkkrBoi23VN9eb5HGZPE86FWDY3tFTEQUlqt1d7tZ1GjVRcw47rlUpbBh472a7wtZxB
	wzwqvsyFV6hzGBwsV5ANmiQxkSV7XE+uKD2be9do5MmnnWwfacL6W5mLxSK1a8Ou63T1yo2
	saQGZtFA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 9EB964DAA85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36290-lists,linux-gpio=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,radxa.com:mid,radxa.com:email]

On 5/1/2026 11:54 PM, Alex Elder wrote:
> +	/* AXI Configuration */
> +	axi = &td->axi;
> +	axi->axi_lpi_en = 1;
> +	axi->axi_wr_osr_lmt = 31;
> +	axi->axi_rd_osr_lmt = 31;
> +	/* All sizes (2^2..2^8) are supported */
> +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
> +	plat->axi = axi;
> +
> +	plat->mac_port_sel_speed = speed;
> +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;

I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I 
guess it's required, since the driver clocks down the MAC/PMA/XPCS in 
its suspend hook?

-- 
Best regards,
Xilin Wu <sophon@radxa.com>


