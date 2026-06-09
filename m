Return-Path: <linux-gpio+bounces-38168-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LzEJF4D8J2qW6gIAu9opvQ
	(envelope-from <linux-gpio+bounces-38168-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:44:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99465F957
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 13:44:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZWJuqzIl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LYVR1Bqc;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38168-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38168-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B389D313AD07
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9593A3FFAA8;
	Tue,  9 Jun 2026 11:37:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FCD33F5A0
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 11:37:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005041; cv=none; b=U7dD3bLS0veUjYJt3eH8i3voI8MubOAKKMU1Q0TcgeD0ylJCGodRz7IzqhpCPf9P1SbcuGHJgk8YhhNIq2BvnEwRMQ0B7nAeU/PAg6bsrpB2UmewIYRc5MsCfNyQuaej0i85OU+pfC9o63A6JwuRCf+Byuje7DKUcbi5UgF6kFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005041; c=relaxed/simple;
	bh=KihNTFqobB6tjddGynH/j89vXy0LVqmDBpcUedYW6LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uGp8MpbgknG6Jsm3W0fKHizWEFumde4PgUrtMgmLmfXGiNgPIyyzptxy4vC8WqZVo+bBo5lWV3cQrGrx2VlJu8CVbgOnev6g6Bwx+SAxNfxyZ/mzI8fskaTfsq2I9O7gV/Kau1YJnkdPG2FLlR8NRDTxI3xOTDCmBGX60AE+YAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWJuqzIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYVR1Bqc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xFlQ2327351
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 11:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8gOGfvft9yaszaGq4oSErxAazsiWI8LorymX6ScT7OY=; b=ZWJuqzIlil8SguCG
	Cdv1Im/IAR3TikT5PnfP+nTUpQfWy2zbodDT3p/LehiPEkmu2I8w4xx4uEZC35ib
	mrVnSDF/TEO4XuB/JIXJepzZfqwo3MEozRLtTmvHt8EVKGZIEdrVfRYIWLXNZkwW
	wccFyS7/+6DXwiRHFo2ArHO3QzmPHXYuQyWJFv45VJ72hT9WvJ+yZRQEP1d0orru
	2fnq42kUaqLbWEWU95bPdMhnABCZ+vOFHGrtysKU56NNcTNWD3LzjYO8HjvLVjta
	RModZ2d3B/mqU1nLEMhw5TjNXjscwDbgToEGFrg6KGlsNz8OzF8BDL7WT3v3nXVl
	zBFGVg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt0q4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 11:37:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eb3f8969aso3496145e0c.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781005037; x=1781609837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gOGfvft9yaszaGq4oSErxAazsiWI8LorymX6ScT7OY=;
        b=LYVR1BqchRemjFRxMnAN2Ba59U/uwehXidmnjWEzj3PWM5qN7CD1P7vFodGteubucc
         Oh1N2NeW/Dm0AcC/lRWD5gxzYGBhlZX+MPvU6S3Wa6amGgd+wFDVhvmoYkKMeBeoGrMB
         1eFbXd+Wmfl9+jiZj4klCj/14s4JoxDsqC4de7Yv/52H07HAQk/RIf8RX4/Wj7w0Kw4M
         JsbZhNNcdqhrwqi8mXhTfiONyX/kTLQzHYLsRlWdEgwxviKMjCo/y5CcpuGsV4mP/iZn
         g+0m1T7+GLA3vNqOBuQW9JJxfcNHxUjnIJqTa+70Bh8h0S5AgNKRFRfdPVPmJX3L+MH7
         ovHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005037; x=1781609837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8gOGfvft9yaszaGq4oSErxAazsiWI8LorymX6ScT7OY=;
        b=Tx66qbKsCMFLOeC1czgV7R1yFU9IwDDAyhRvQE/jCiO2XKw5IJVp94NC5j3z5mY61c
         9rnac/7UXeMArdZrilzB02ut7U01xhtpe9Swqr/HUp3CcO/Uax6TnaSvaJIAL99slMlu
         Ddkkey2sisi35t4V+vWuaK6I3n6VQJP8L+jiSYgSaXJ/2N+41RRjEpPZdLB3PlHArTPR
         boMrWjeit9R6bfraN9L//LRnfFHxyqCHzLLPS/UB2ou2aEusFdvsDxWj4UH4lusNoYw6
         cMO/a+s4o+hfED6hB7FV+UxjFuHXmXrxqYQ2upzNue83bITUqcZbj6sIbrsOx3SRjK1Q
         5RbA==
X-Gm-Message-State: AOJu0YwXGpyQ7P+K+C9bnRDySJBvdaIw/5ryzO7AiTSBaQwiMeDZUAJI
	/saEISNnpFxVn0ch1TlGJDR2incjZaC2Le6vjdyQiFUFUs6rZ6iWNDMTpYyFSQPyL4szynYfi0E
	9IaaHXGMDTL65C+qV9tkGp9+VHmE/DdX5wItzY5AzeQbaGlRrkp5waMWy7Lgwfp2NeTUJ3PHKKa
	U=
X-Gm-Gg: Acq92OGTYYCsSBnZOqaythltCM40CR8k+e+OAxikrKU/LFnJ96Ndjk+SRmw044rJvgZ
	m8jPOP52fMaTjsuM77KBZ79SthYgSLWtfKH/cTwWr8k0zqed76wZeAVD1v4HDSdw8EQnBDri9go
	DspjdH9mvBGsqADyXjcRZgWqX+wLXwuKnh267YDHx260aV/PSgzZu5bQRx7u8Qfj4kT88l7dZjn
	yMKIkoPAIPBPzHA6svbKIbrWyPtdk097bCxDUBz8mnBrRUoCvIutX0w0w6W9giO47vMSowdX62p
	tzpeK9TUIhTq+lX08K/OpnFLEGC2LdtIgEPZl4NK1IAPL8AwVq/mBUiN2LVV347U3C4f1GEzLyJ
	m7oxU8BzGLSpflCIJG9PNWWn64mRrkp8u4uvsYluOsgUu/Fkr1sQArCLhsDrB
X-Received: by 2002:a05:6122:d87:b0:5a2:d144:6b9b with SMTP id 71dfb90a1353d-5ac5197bd7amr9888722e0c.9.1781005037347;
        Tue, 09 Jun 2026 04:37:17 -0700 (PDT)
X-Received: by 2002:a05:6122:d87:b0:5a2:d144:6b9b with SMTP id 71dfb90a1353d-5ac5197bd7amr9888700e0c.9.1781005036951;
        Tue, 09 Jun 2026 04:37:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c63:2aa1:b7ca:7546])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc4082c3sm456706535e9.13.2026.06.09.04.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:37:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linusw@kernel.org, brgl@kernel.org, tglx@kernel.org,
        grant.likely@secretlab.ca, anna-maria@linutronix.de, vicencb@gmail.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] gpio: mt7621: fix interrupt banks mapping on gpio chips
Date: Tue,  9 Jun 2026 13:37:14 +0200
Message-ID: <178100499390.131269.14973066421328053459.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609031118.2275735-1-sergio.paracuellos@gmail.com>
References: <20260609031118.2275735-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4ikbLGsYG6tN24FFCGxv2YqBs9P0e3bF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwOSBTYWx0ZWRfX9Vv4/cF9+rlM
 T5OorVjNewZSIaeTV3pGxqUbP6B6jaRzDjkrNXSq8Hhoal55R0gdl3MeKohEgsjTTL8I5fsVHZr
 e8OodE+nQER/KUQKJyP3GxNy8RXTCEeuk5QaF83TlfETbLB/NJ2u5ABetjqGzjMs+4z0nHIwz6B
 mNMdWerXjV/BhVgaU/7ZoieUBCdPY+2X9qePSxMf89dpetBAA2yJxoYAxz9aO7igAN3RGfp7UzB
 PNJAFPv3Zj0Jy5F7SfMcoJxG3jd84uucOH1FuDkWbab8GKqKvZK0TLn5an6osx33RvKgnAT0R6s
 nVSGVFRZaW7bNT/sAKDOPrbiDo4tggm+BD7U9/50tidoVsIzHU7oocnk+rMSsznKMi8rIM+WIZP
 Fw3RzslMADixwi5mpH8tcKPJyQzRhq9q69Q75alK+2miAbZACavAPZ+bAmrTlg2juya7TXYDmCf
 yCmY9/ch1L1tBQHL4SQ==
X-Proofpoint-GUID: 4ikbLGsYG6tN24FFCGxv2YqBs9P0e3bF
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a27faee cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m57Y8EH6INdfd6v3GBUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38168-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:sergio.paracuellos@gmail.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:brgl@kernel.org,m:tglx@kernel.org,m:grant.likely@secretlab.ca,m:anna-maria@linutronix.de,m:vicencb@gmail.com,m:linux-kernel@vger.kernel.org,m:sergioparacuellos@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A99465F957


On Tue, 09 Jun 2026 05:11:18 +0200, Sergio Paracuellos wrote:
> The GPIO controller's registers are organized as sets of eight 32-bit
> registers with each set controlling a bank of up to 32 pins. A single
> interrupt is shared for all of the banks handled by the controller.
> The driver implements this using three gpio chip instances every one
> with its own irq chip. Every single pin can generate interrupts having
> a total of 96 possible interrupts here. It looks like there is a problem
> with interrupts being properly mapped to the gpio bank using this solution.
> This problem report is in the following lore's link [0].
> 
> [...]

Applied, thanks!

[1/1] gpio: mt7621: fix interrupt banks mapping on gpio chips
      https://git.kernel.org/brgl/c/a46f2e5720f5670feda145709d1f0d20be5c7263

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

