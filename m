Return-Path: <linux-gpio+bounces-35970-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LnzCqvr9GkhFwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35970-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 20:06:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9EE4AEB48
	for <lists+linux-gpio@lfdr.de>; Fri, 01 May 2026 20:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29C2830160C0
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2026 18:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B356E33F38A;
	Fri,  1 May 2026 18:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="psJ3Fjh4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE2633260F
	for <linux-gpio@vger.kernel.org>; Fri,  1 May 2026 18:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777658789; cv=none; b=oTseX0Bntm6MDvGWsOiBaiUg79If85HBhfmgYYzylKceNX0Po6DwK5QOQs4Xg1hGbFn22JcLNM3l0qNRyRTGabjEQH1FPddJ73hmAhT90h6ZGfXJ0KfIxC8PNTMSwu5GiNmi5W6R7ab+n7rx7AEwzqo6TCKHKiLyGuBxMs50u7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777658789; c=relaxed/simple;
	bh=oKkQnY5vlFNovbcjfh6JBo8TVogGXpyGhtvkDtTNy3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3nT0ea8eUkeJG+ZuPjpKfWLnk0Sj5SG5cdflEfEfGZd+BeRX23ECdEEqfW8EExICbjXrd2c0YPnpOzfFFlV3GCgMU1hyTrF8wuqpgyjxggC8/RQ/X/9vRZ9Oa7ulQaiGgqfULRf8zmV0+yjVJ3PrZKcKfXcjiNq7na14azN48A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=psJ3Fjh4; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-799001d73bdso21094487b3.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 May 2026 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777658787; x=1778263587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1DjW845zhModhDu44NYwmrHvDI4OE4s13MqVWiObLc=;
        b=psJ3Fjh4F/IvT+GnFPrExEwYlGYre21c/sJ635RZrszNYBXaXf5wN64XMn6ym7/psU
         Q2p+xXX2OyIDv3LMm6MTze4TlZkVqEoa5LBRKzq8SHUMpzTAWhKGajoUlT/6qaLDwchY
         5BnJcxhDXuQgHakxWjVfWWVVLyFWoIHmsKPMrAtEoUGU4SP3U/bJWLSo/wF43VT4VLU3
         JVzTAhYmNHQMjGVKGbxeLIpjZKHAtTc12qpZWpK/Atj7nRqy6PwkvuqCStFJ1iK3aWrp
         kNUE6XQc2lSrMSKr6TAQQe2G4Uo/xq82lf8T/LX65G1UDU74tl4CipLKYY0ErDW5fkzF
         Md4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777658787; x=1778263587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h1DjW845zhModhDu44NYwmrHvDI4OE4s13MqVWiObLc=;
        b=o9jFK7vTCuNNdCaanYeUE0QcfvRPTT1vMQdFTaOa7R9r1Vjv0i18h9bzYoK9GqzJVG
         oehVElFrFmY2HFcPkqz36mZ8jtQgV2bR2lwrNE0CkmiUOXP50unwXT9jHmPAFCT1PSkT
         olr9jhEMVWQ3EEHgtwyUheiBIdBxe9JAlb46QOZ5SpcbCEkTEyu4BcFN9KQAjO1UfJS7
         ZVxOSyyQWSm3KIGmHBId7TdNOpY3EiwvfSYw1REiOX2nhY0AMgNg+2FXt5lVnExBCPc6
         ZMDqM/+L5pBLWGrUAy+Z8jlUTLbRk9ONoz4cb/3FZcXR4eosewFNyaAv5IJ+OBAHJT2l
         4tpw==
X-Forwarded-Encrypted: i=1; AFNElJ98uI25iZccoKh2jKlcxbiYg25P41diy1LucahKuvuA9in6xpZ6xkLziNtinZidm2fFPMLqVZlBYhD7@vger.kernel.org
X-Gm-Message-State: AOJu0YxWCBzHJ2eepRjwnbNHsk4oxLBXeIKdR5d2cnBUXJhelYBGnxXf
	HgjNmTWCwYn0idU9kcLVQ/LTD83mTVzS589VudcW75h/sS4cvNvJINXreKGknSrhp0I=
X-Gm-Gg: AeBDieuMHcmM6wlo30nLC+GS3fzwvO9fd9QrZa27Xmlby3QAMZOnQTJ1AVvaiU3N374
	SEdjm8uR1AmXbURIMy4fQSGMxAUNmAWnBjfsrsXEPuQ+Fb45cf/s3POKl21O65OyDYdoE2nNuR+
	SRCpeD/mOI5pqWxdavYzP5fjnDvFf65GLF7BGfQNGeAGK0ngR4yuW7HKaIQeMwjLG9Lqfi2sWCu
	jED7IelYW+7U0w/6vyTtkYhY37KQ87uEAwz4hAA4ppyGlRNERmpiuzCoMCilINByJoZ+HJu9XSS
	BpJecuG97rteCdoT3s45Z/oTdsRF+pQWKlU9PgOWIuyEgNA1sy1KqAVli/e8xIdUNL+D0iXMzVD
	GBXIsKdGQT+CChRW+zVC1wWB1/aortROTCZWPQu5BUkZvWuclM/MUVeYS6BcOrALzHUN6kEaHcX
	2jo0rTkd9Yoler+yeFZ7ZHP34aGdcZL++Jpa3xCkLr2dWX0RePUP+GNYac+8XHBgbuKQGHV55ep
	w==
X-Received: by 2002:a05:690c:dd3:b0:7af:6904:3f3f with SMTP id 00721157ae682-7bd77170409mr4261187b3.45.1777658787005;
        Fri, 01 May 2026 11:06:27 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66019105sm14575347b3.0.2026.05.01.11.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 11:06:26 -0700 (PDT)
Message-ID: <539b9de3-4a78-44cf-9085-06cd0cab2d17@riscstar.com>
Date: Fri, 1 May 2026 13:06:23 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 04/12] net: stmmac: dma: create a separate
 dma_device pointer
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
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
 <20260501155421.3329862-5-elder@riscstar.com>
 <9203d8dd-8ec0-415e-9c2e-5b06b1b8dc11@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <9203d8dd-8ec0-415e-9c2e-5b06b1b8dc11@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DF9EE4AEB48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35970-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,checkpatch.pl:url]

On 5/1/26 12:13 PM, Andrew Lunn wrote:
>>   	if (priv->dma_cap.host_dma_width) {
>> -		ret = dma_set_mask_and_coherent(device,
>> -				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
>> +		u64 mask = DMA_BIT_MASK(priv->dma_cap.host_dma_width);
>> +
>> +		ret = dma_set_mask_and_coherent(priv->dma_device, mask);
> 
> I'm nitpicking, but i don't think you need to introduce mask.
> DMA_BIT_MASK... is already on a line of its own, and is within the 80
> limit. Nothing changes here with s/device/priv->dma_device/
> 
> 	Andrew

I did this.  It was simply to silence a checkpatch.pl warning
about a long line.

I don't care either way, I'll gladly put it back the way it was.

					-Alex

