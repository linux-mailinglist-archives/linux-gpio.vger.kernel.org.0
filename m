Return-Path: <linux-gpio+bounces-35991-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJnMMPut9mlDXgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35991-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 04:07:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 694594B414E
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 04:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD89D3021B19
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 02:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AD1267B05;
	Sun,  3 May 2026 02:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="btbRK1G5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172EA23C8AE
	for <linux-gpio@vger.kernel.org>; Sun,  3 May 2026 02:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777773999; cv=none; b=GtEojbE0O4vXaSt0ir9xnvIuq7D3B/IkwwN3MumrI/daUtlnBaRJKu6yY5Ql/pVCiGvqlTCrU/BC6dV1C6U/ZYgZUo3JEVCtEJ2ZTRCkMWegvhBaZCxF+9FO5e6D3BOGyFmml8f48gEqkiIgYlLBx84AMZJiXcv16c2uprvw7jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777773999; c=relaxed/simple;
	bh=qSG0sZNcjOSchIbQqXWGt3+PH22qMGXJjEvLkAzwfr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojpU99stiw5Icjd4FKQ8BCNZt/gEFvgL1H7OctKr3F6JlTQuOVK2JtVCeRx1zlZmmzKO2wfUgbXsbP7BMJxUMHp9pbpj6jLC0VPhFQy5vvJ7g4n7oZ0qZRTE1HftGQwXtXb2Z0ss4mCCXtFbmtX4DiUGubf18ETqiJzwC2QmwqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=btbRK1G5; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8acb856a674so41141646d6.0
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2026 19:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777773997; x=1778378797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
        b=btbRK1G5RFZ+SyUUfNLzRaZPSzJ9/mretRVTMuZqtyEjAHFRiP+elmVpqzKdwFaqZS
         K1JQ7VMuUx2eE/ACxjiOd+YQB4fYAaK9PnDYGMlwiGUrDK6iKy16aM7glSDXlcsYCWOZ
         pdbtAygj+OTRinuD4hOOpFFclJKItdPC3RSTp00eokz7QCw22sM+tDNGcxoBaZLAOhtK
         eqj3Xts+60lWyE4slvV5QZpOBupe5XgNG+mc8HgCjbk6Yr2dQSKb2kIxW1cJXnOmA5Ju
         KhhQFLAWheKe2R6mmsZjG0MV4EgsW40uo6+MK7clHHb50WVAqb6OEut8vo3Se8+IXAUi
         540w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777773997; x=1778378797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnVCaxNshzzHjwMMq5W7gN5QUApxgL+R58MdQlfO6d0=;
        b=VtB3djaI2iPpdshcoOigDu3go2h+2xZxtPFpDwjxAKCoy7rUKH2z64SC84z2nzkGQE
         pIZb7gJlsb0HLsNe34U+x2tTlN3oZGw9iLfSnrEIu3Wg3/TcM+GonIzlinAm+c4ZAnEi
         4EngJgLDjFgdeZekHsuFDwAwvSNlek7Bk5pb7QLYr7hKJe/Jp0PXhnhkAxEuzxBoQTC/
         VKsJkhTy9Rb/wJTp3+F50lNweAKe7lHQfPjY/NzGhr1r18GG0+aFRwYNf/32zeTg0RKp
         15QGVmXPMRbHUZnXQySKb0a/Tn2LpLCvx1g5ZJy1sENRt3bylu/yxvy2/i9HQZobTwL1
         M8gA==
X-Forwarded-Encrypted: i=1; AFNElJ83oPAZ5J4JJhAQZJ1HiQttRspnCFA9+Zon4SGHympuwA9gGxT+CzhiNqx6vnew/n+cUZIwzIb617Di@vger.kernel.org
X-Gm-Message-State: AOJu0YyAJGycUasxjYZDzEGx7ALs/bkXJNoeKBjCF2gWizdRQmIcf/nJ
	OGAW6nv104zJs879jqXwbKcUmUpZhL8aQJkCWYR0faSQGAH/xGYHOw12nlzu1mDlgoc=
X-Gm-Gg: AeBDiesvsIOMgg3FeFELrX773U0g3JnioOuXKOld4jaUhMhrE0ye/E41h8BTRocBsIi
	KjODa2wWOOPPaTSrHofz54dHDtLGIr7MSS+dTy9izwjD9DjBC5QGCLsAFLXmC5leMaQsJYv5Cpa
	DH33B6I5qfuJj9XSAi0b2XPUltk8WwynvwR77aHHEokZeKPi/k9n0YkA4VyU5F1OhZhXd7buH5z
	RkYTdq4WuyF1FDHfUkCrTeIlHomZo9lapLskRvdWH2UcyUM2g6Bk7XbzkTie7hlcRbtCpFKcpsc
	NWvoTrHPtm52gpRAfctcEDWZuu3wgRP4KVNfqjQ6D7bOV4L/VBHzEcbrYxPJOFrIbxDKBVvIly7
	CMdkTbUtzZ1Y8vTSij3aALlBHogbklkrcXDgFMo8WlKfYl/z/mcl6sCP4a/dWUX+V4TSsgyVSOw
	oJ5lfhk6JGGiEGOxd6acc47ujmXPWROqp6qGiRuSNJ+0DmTOSoWtPiuK1crPaKEKOjx/aA3bUn3
	A==
X-Received: by 2002:a05:6214:610d:b0:89c:8a3c:e34f with SMTP id 6a1803df08f44-8b667b79753mr56665696d6.12.1777773997147;
        Sat, 02 May 2026 19:06:37 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d831ac7sm72634806d6.49.2026.05.02.19.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 19:06:36 -0700 (PDT)
Message-ID: <649428a4-9505-4a1a-bbbe-bd90be9b8155@riscstar.com>
Date: Sat, 2 May 2026 21:06:33 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
To: Jakub Kicinski <kuba@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
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
 <20260501155421.3329862-12-elder@riscstar.com>
 <20260502094559.15c3f479@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260502094559.15c3f479@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 694594B414E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35991-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,redhat.com,bootlin.com,armlinux.org.uk,kernel.org,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim]

On 5/2/26 11:45 AM, Jakub Kicinski wrote:
> On Fri,  1 May 2026 10:54:19 -0500 Alex Elder wrote:
>> The Toshiba TC956x is an Ethernet AVB/TSN bridge,  and is
>> essentially a small and highly-specialized SoC.  It implements
>> a number of internal functions, including a GPIO controller,
>> control registers managing internal reset and clock control
>> signals, a PCIe switch and internal endpoint, and mapping
>> hardware that translates between PCIe and internal addressing.
> 
> drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>    541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
>        |                        ^

Yeah I think I noticed an error like that shows up with 32-bit builds?
In any case we didn't see it during development, and we'll make sure
<linux/bitfield.h> gets included.

Thanks.

					-Alex

