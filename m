Return-Path: <linux-gpio+bounces-33321-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIgRN0jMs2n2awAAu9opvQ
	(envelope-from <linux-gpio+bounces-33321-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 09:35:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 663BF27FC34
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 09:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E2923198C9A
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EA4383C9A;
	Fri, 13 Mar 2026 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ve4+KjZM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194D1375F90
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390742; cv=none; b=QbIdv5GknpMtpe2yDFtE1H1TtW9jtRxoZ70H2ygcSjmj8RP6M543ptC4XtD/S1hUiwZLFJqLWu7l406KbNSDwi2ZOAHe7RxMMypkKYOWMcSCVx3XyPtqin0o9MtZAnp3s1hZlT4kjU/QhxnJ1n+DhhTxi/ZYou9w5hJNfdyiWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390742; c=relaxed/simple;
	bh=gF7U4AhLl2B54UlbLoigUUUH6Jsm/F5mlTaV5RfBX1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+e89y19Yx4dlpl5mLNgij6QV0L5mLB8ngfciR7cbxKj+WPD7Lm0/C7HM+fVL6v1dQSaGjSp+rAttfDEV5/+LFp9OBwGjjZR4qJAesg6L/iiHEyHOGuyrO3Aj8SdGbGK9On0uixwasnpb0LJw+dG+2FSG3v7t8WvP5v9qNs6ncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ve4+KjZM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b93698bb57aso373969266b.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773390739; x=1773995539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbcDxBVVYzOw7c6OTfNiMQmEPeMGSouBlRwpnguHKAQ=;
        b=Ve4+KjZMZXY4pNNaIPy6oKForvFFVjldMaURWwmxmzsmi+eV3MBTRRAd1SMZIX345h
         CuM9UPCoPnm84rEkVOfCzztFXPmTAlGoJBaGYyyhDd+hIbw2oLs+ZICv/LMKPCSCoPau
         HvE2s0thCUwFl1Lp4ruYJ7XJgjfwEHOYBowlXC5BHuqsyW5NJv2OWwL5ShpyhPmnxoyI
         IaTH1CNYSzxrimyyURz3spByUlwxn+KkTXJBZTy4lWDfNEIzHdB7/laV0bVJSJPK2lrJ
         2ERci+y02pPLrqM5DXhh8IXd4bDpOuswI7THsBPfv/Ywl+B54JNSA58bAKWTK286/sJQ
         Jvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773390739; x=1773995539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbcDxBVVYzOw7c6OTfNiMQmEPeMGSouBlRwpnguHKAQ=;
        b=X7gbB7VJnhXX9hZ78isFHz2Xv8EvPyLBIshuncYJfWUQqwid/lAcyX2I0zR7c3G+Ye
         xs24WbjV533paAB43pJMPFl0yAU8qcE8O1Cif0Kr5Du92FskXNoqopYhAsdNP6ULVhZ0
         8xbLEtU3hv9R5CEWV1fX4lJJm0kUSmKQ3BOKdvIF3iDs1ymRoIyw+o/3KvVePnQ8UbUG
         4M39nalbmzKT4zU8l5VTfNRTHIDE86Cfl17LhGN0K5i3V9htEdJGrC/DyGwUB3rNDECw
         bpBRMB7T52fmlnIrw4ddfZSjdQgyGQrZUhJkWc/cw4vB8r97Q/D7lP2K4u+XTPeOIJz+
         hEUw==
X-Forwarded-Encrypted: i=1; AJvYcCWxUGoqCMk4w2pQ2dktQYNNs3FtSXBLIUhz4LIfLTj5Pva2lcMaULtZ65Wpsz+3/xGLi85yHB7r96K0@vger.kernel.org
X-Gm-Message-State: AOJu0YyQT6be5SxZRRgY9IKusiMW+PZzbABlzEfaxu1faXXiKTDZivFj
	JeTxQYYv8ojjx3qsCjHd8nik4JBCC/bwSC80mjjf57ov/MM9V0dBr6fP
X-Gm-Gg: ATEYQzzglmPW+QOoyfEp8NGIZtupa5LA+3sOoe/aV1idljPh1wY5j6oRlFBOgIgIxGu
	Io3S0Yuz26Qk6to5a4tGS8np6TT8fDLIhTGC57bjKcyWN4W0Cynnj3Kp/bFuWrQzHn+ACKwzz6X
	fKUjkT81ujE3dNC4Hi3rz0+uXiE0R/D/7o955bSYmXwAGCWhb5743sKRPjKRvpb230rXeJCH5gm
	IkMJdt3swKwE705+GR24fAHeiAE53k7h5jQZdm25fvjejZ0m+IeR21LepuVAalFjsv1QmqFYZ3K
	+/yrbPCllRYiGEH7zJxymuOXSF4KuSb/ZghElDbHSL8SchUoDCAPjY2GzqNG41uOwhlFTb6j/lf
	OSpReqBloaqmtDU2QNNbBLD5nliS581FL7zWZFLihCOvZEu62wtYWQZW3dMmJfkOT3LkMoXKMas
	SwhfYfA1uM4Kl9Q52TP4fF66QdC9PuyMUWVCLuLKFIHL0ggf4jwWGIYuq9xkoyyePwGg==
X-Received: by 2002:a17:907:9285:b0:b97:73ae:e2e with SMTP id a640c23a62f3a-b9773ae119bmr31732166b.18.1773390738986;
        Fri, 13 Mar 2026 01:32:18 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:5998:31f2:ed8:c4f? ([2a02:8109:8617:d700:5998:31f2:ed8:c4f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6ec4sm29152166b.5.2026.03.13.01.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:32:18 -0700 (PDT)
Message-ID: <2bcc0442-cdd7-4093-831c-0bd4652edf56@gmail.com>
Date: Fri, 13 Mar 2026 09:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/21] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, mitrutzceclan@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Cosmin Tanislav <demonsingur@gmail.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
 <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <abEgijQAqW27i5fU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33321-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,collabora.com,ragnatech.se,linuxfoundation.org,analog.com,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amazon.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhecht73@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 663BF27FC34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari, hi Dumitru,

I'm testing v8 already and will migrate next week to that version. Below 
some further comments.

On 3/11/26 08:58, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Wed, Mar 11, 2026 at 09:17:12AM +0200, Dumitru Ceclan via B4 Relay wrote:
>> The following deserializers are supported:
>> * MAX96712 (already exists in staging)
>> * MAX96714 (already exists)
>> * MAX96714F (already exists)
>> * MAX96714R (GMSL2)
>> * MAX96716 (GMSL2)
>> * MAX96724 (already exists as part of existing MAX96712 driver)
>> * MAX96724F (GMSL2)
>> * MAX96724R (GMSL2)
>> * MAX9296A (GMSL2)
>> * MAX96792A (GMSL3)
>>
>> The following serializers are supported:
>> * MAX96717 (already exists)
>> * MAX9295A (GMSL2)
>> * MAX96793 (GMSL3)
> 
> It'd be nice to have more reviews as well as comments from the users of the
> existing drivers especially on how this works for them.
> 
> Are there differences in functionality or UAPI compared to the drivers
> already in upstream?

Compared with the current mainline drivers from Julian (what offere a 
good basic functionality) there are a lot or more features enabled. One 
ov them is support for routing the channels as well as i2c-atr instead 
of i2c-gate only. Both helps to setup up more complex and reconfigurable 
routing of the video channels in complex systems with many 
sensors/cameras/streams.

Additionally a lot more and never devices are supported by that patchset 
including the new GMSL3 devices what are also backward compatible to GMSL2.

Both link types are supported now. Generation of test patterns in pixel 
mode has been added.

Also log-status returns a lot of very useful information about the link 
mode (tunnel mode versus pixel mode) and potential errors / packet 
losses over cable by presenting the counter registers. That helps to 
monitor the quality and reliability of the GMSL links as well as CSI links.

> 
> ...
> 
>> The following v4l2-compliance test still fails:
>>                  fail: v4l2-test-subdevs.cpp(371): fmt.code == 0 || fmt.code == ~0U
>>                  fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
>>          test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
> 
> Could you post the full report here, please?
> 

BR Martin

