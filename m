Return-Path: <linux-gpio+bounces-35998-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHPnAz7E9mnBYQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35998-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 05:42:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D76C4B4508
	for <lists+linux-gpio@lfdr.de>; Sun, 03 May 2026 05:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD951300C581
	for <lists+linux-gpio@lfdr.de>; Sun,  3 May 2026 03:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C17739659A;
	Sun,  3 May 2026 03:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bogIRTBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90FF245012
	for <linux-gpio@vger.kernel.org>; Sun,  3 May 2026 03:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777779765; cv=none; b=t2TTx3kF3eTLRXLgqJwBaKFAtVNejvZjcQ7/GgrByujDAwsaA+UtU2ATR1V/3wwTkjcGuwnzX8d5nOAmONJAJ85RUMZHAmdboIR3Zcu48NbmjkWFpPt5Qodhc+MadKTQk2jfVScD/LcDyjq7pHSV/yW6WiG5q14mKZ1WmlCSwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777779765; c=relaxed/simple;
	bh=tjG1kTWygatN70wVlmDcJrkF7ZiwlCkEtZ14WpNp9YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b8/RWmD2SZFW6TY0XwYxIraNOfpzBPrRQD0TwfR3NEZdy9A9iCHADgqHhH4hboQzIcqmY/qT2rQRvUe6q/lNpKAVYb+yUA9Idp3/HfqhsMkRHo1gwQdGAUp1dlM33emzcuVunbjxBS9VC7HOdKmbQYp7Bf2ZRVrza0q4LXE0czg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bogIRTBj; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9568159ee07so2015606241.1
        for <linux-gpio@vger.kernel.org>; Sat, 02 May 2026 20:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777779763; x=1778384563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
        b=bogIRTBj2NYB1Wx+NISe61rixqiMmilhr6CMCY7MKJG9isjO5Seco0qVA/yOZsaVcG
         5pOsfzym9wWCYc+pUCe6ybYbOqDaw5zC0prMnbavrZN7dY+N7ngFWBC2pIh3QZYnKi1A
         MXRpArxUJogCawuyP3oz0W1TlDavMuTk+pzBS71GlcJV/OQ/DfIqTQmnc+REdEkj0Z23
         ypD37ohPkyq6mpAQIl6Oci4+/yiHktxJXiKQTsRzk7G4WARSfY3POLfuEX+YzMzRsQVn
         YCRXv2utqrytLSwHwSQ5lGMMCAVityzCZ7CO7b2wBaQGFvkVWyXqQ0wCLDnkKySuwXAh
         +ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777779763; x=1778384563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiiXKGJux6g44aioDbCLD/YNgU+NyVlVqd4RaEM0CyY=;
        b=nBaniPtctRr6kK5lqlQ3GZveAgJGLiePcEWZr8CtWL6Hp3xX5Y3yKJQ1+e3L2JKJl9
         7DN+TvYmTDkeKdL6vw37jOm8+4g3LrAvHbqf4JqWryiCzZ2ujpO59y6wixp/0a1ZtB73
         pYN+83rl+vSy8vKZtwOkNz1i0+zd2klvHU+KMcCZkSl82wMmUDZd2zts1pSiIyEqrYEP
         da4BnEfpACEQh3kyW2N9w15C2ZL1o2T5Bu6jo3Y/jWec+0wnSqCbYIJfiwqwlB6wB/a3
         G5TdlOdP+7ysExlocIAPnMs/ogVo5OHtyy9+HzjyR0cIVQUB5wULG5SGWwOPcifAAP7p
         YXfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dIN7JM4gh7qpMWNb8nG/NIxs8Xb7trJu4gS9s/d71phWS857YZZiXnYr3Ri/yP2I7CnqjX5tyAgd0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4NGL2gelkSnEvOaOEI0pREYOADLcNuFkMONnCsaYsSGyEfi1
	or50wkXkLrCiUwJ9IJ2mSAEguiCrNrL66Pqiw07VR2p7GXjetIZlyqzV
X-Gm-Gg: AeBDieuX5DWO0ryGh0Mjj4llC9w00Se0LH2/wA5PKi1m2bD996ZOLzpZjZCJR0pH+lA
	9XLsbYsyR341TKdj2Spgkda6XMrvexRd4EQBBTiyxuux6ps1beY2PA6Lv1//ep5Y/kzKHxUuBCo
	uvjiAZE84mZUGfnBc9KW9FOlF9EjuoCpTSl2ny0oLwNt3AjvlbTh/2WswaT8x4FfiX07TKVLHhe
	K1uFLtZpcyWvU/saiV9GypGYtshlGSD3wKmEMboKyQrDPciZo4sZZsxSuvFjPcSq+9M2zDrCwhF
	KlwU3YL627NDJONAQPf9K5v1mFNXAzpATFefArv8THpFLvxr+1YMJSE+cU9etl6IIgFfiTiMjp8
	xCIgxb3HCeHt5QLAbdajv+6zWjdCtf9/1V1H+5BKviss8dQYtn5YfP/mJH71N8w9FuiqJUCckV9
	uLRPIwUTMMQITJ8QeKCve+PA4ByCF4IendCSmpGxkQem0=
X-Received: by 2002:a05:6102:4b0c:b0:604:f29d:84be with SMTP id ada2fe7eead31-62d84a67460mr2488161137.3.1777779762631;
        Sat, 02 May 2026 20:42:42 -0700 (PDT)
Received: from [172.27.209.232] ([129.222.53.215])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0af57f6sm3669350241.8.2026.05.02.20.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 20:42:41 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Date: Sun, 3 May 2026 04:42:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260501155421.3329862-10-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 6D76C4B4508
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35998-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julianbraha@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 5/1/26 16:54, Alex Elder wrote:
> +config GPIO_TC956X
> +	tristate "Toshiba TC956X GPIO support"
> +	depends on TOSHIBA_TC956X_PCI
> +	default m if TOSHIBA_TC956X_PCI

Hi Alex,

In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
make the 'default m' unconditional - assuming this is what you intended.

Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
'm' or 'y', respectively.

- Julian Braha

