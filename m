Return-Path: <linux-gpio+bounces-37966-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0NtXNd+XIWo5JgEAu9opvQ
	(envelope-from <linux-gpio+bounces-37966-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 17:21:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0766415DC
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 17:21:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="RfHL8/6p";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BWl28bwL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37966-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37966-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD11230A98D3
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 14:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BD930B525;
	Thu,  4 Jun 2026 14:57:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBA230C610
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 14:57:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780585078; cv=none; b=rMEnsscikLgftkc5jCzWWDX1/X79ssgfwji7jEqzh7JOzlvsiej7ml5dhAdkZ7Z4p2mARFPEcQmojOC+EY59kx95O1wXRhQxsufs5y910IvXBXLz02EvEar8olETxBTFps3bPldTDH1Z7KoPDVfwXMFOpsOY+rGSDgAibasJ4GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780585078; c=relaxed/simple;
	bh=gSXiSTZoEY3Lzy1lJp2zbSnXS1wilIQZZ1I/UN/VClA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SksXOVEMmrqlvckzcbq0mtNmzI8rtCbcACm9gtF7Q4XfCeXcN3Oekuz0N67hMXQ3sztTp7v7SX0ECIr/0TjQjYUh+VyteeoDIli8ekXq/ZBzLvT8oLHFx0hHvhdmN2n3A8AW2Vmk6Fz73JKbiq4qXP/2znn0S9pqRl7Tf+c0O1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RfHL8/6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWl28bwL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EkSu5140358
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 14:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0qHDXKGno5xDqSISjONfodnvIlqKVUfyGUcnQBWhrw=; b=RfHL8/6pui2Gwc5G
	DFD5Xh6WzA2bj12rseOzXhlDbI4i1d7St0nTHJyQlvbJrJ6qLJ3JTvK4aZMB4pb9
	vuoXp2pNfmINrxhImUzfMk+73YmXdXrUeelQfrTNtBlLzbHHTM41zN3fcN666+5b
	3/qQnpw3X0OnbZSOgN2o6jBKMLFLqI7x+4YzvQm1X1EENF0HWejT0OklQsXvVFzk
	sO37yHSRZ2fzzIZYpWxD/OVKzn0m3QDNkt5kyyMJOQhqUV/4utQYqv9o8QZAFE2M
	Sh1/HSBt2Txy0kqARS2qcbfvTdBxQRwhUJJwL2C4P7seuCC8eAEH/ZK9aAcanYMP
	XGIKKA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyenaybm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 14:57:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517878a92c5so20555351cf.3
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780585075; x=1781189875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0qHDXKGno5xDqSISjONfodnvIlqKVUfyGUcnQBWhrw=;
        b=BWl28bwLVoHHqJ7YGZkC+hta5lnPKdZ6EtSckLjsYSigd5iExBFzwViCipjUGw/laA
         YQioayXMhRQPjq+AKYwHLVFzR3BRUwnmWMB4xoyxFoJTXaZE+pz9xI9oGgxUO7kVT/u1
         xWbqaRMJ1N6Hi+Ki+5YMbEJPIew50f6/mWeqBBwaBP9ARBrXj/E9kVnaWc/FdpJUuojm
         ZdJiWMaj+UQ7V1JA4FBdVPFN0W9PLNS/oj8tqOplwlSzqdKvarWJHut9/UzFHV//riKl
         jQV0Sf5DMWO7Z5EgATfE6IvX/PWhcRAmo0sMv3iw6QbRzM3zXw/SnvDrPu+DO/uep+Tq
         Xyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585075; x=1781189875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0qHDXKGno5xDqSISjONfodnvIlqKVUfyGUcnQBWhrw=;
        b=nsVuLRCrSx9rlLOtdSp5RRPhDeqoj1ae1i3CU9ujLmxzzY9AUCx32MWIVJJs449Vab
         eEDqt1mcX138jdVWLBJgwO83tOW5nbIdrXw6nVnXO+0a6nEECBE5vgg/Yh4n7y/IHsd9
         ZAfzanOJfjf+8oX3tAytZq8LhmnpKweSVmHe1/l85czZlNyuBhdyM3eZJ2kDo4XAHxAJ
         0H5ej34/H+2LXHTZl543G/PqBXCGtAuMU0EFTApPpQHnj1EDIdUZWieNogKJ2yqSwZiJ
         S3aoJMNC1QZzvqlNHyvBIOAbo2UR4FHUyGf4lOCCgDY3WAMFOLEd8NRnTIKQv3c8IKeh
         6B7A==
X-Forwarded-Encrypted: i=1; AFNElJ9jmOyezU8J83F8wZp6UbpioePO+Owe+6zfIy/PVqDgEGFEmBEU1OYH06dlXmN3Qb0zmG/2FGYkERrk@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfi6Gqt43qRVJ2vx2xiV7Y3S2zv24fhjDk4J8noGP6fGQ0q4a
	Y7/1exR59sQxXUUamOoOdZN/TBSI5xdWSx0oCCQk6sIeo/nTudZ6Q/nwVFeN0/8Zlb9E+lmgG/j
	e/tmoE8xtaPiczAciXMbNKl4nIEoRc4t72ual1XMdwaYWYSTYLbuW8PX1ogpxCxZd
X-Gm-Gg: Acq92OF96RGI4oYgwUBDLYRzlEJW6XF8h7RarHsKmawcu5T+SAxuVMzrwg+ZzdJY7+i
	JTGsNO1D6LE4bl5R0N8eAFHEjA1VSPTUHUevLuotYxpnH2rWReg6w3m6zSjnu9LQ3aJMaZauD3j
	Gfyo7YrQ9nKjsz0+yO/awacVuesBTTL0ofxQeBuCPXf1YDuu4TJXbGdkAxlGsEEEh9azJS/FnqO
	5EDKIEXOcPGp54lF8I+F1TUgC/sJoKeDJETYoR6ZiOUQ72fqiDfmgtdvnI47iRP0aR1n7ftraaZ
	BTncw29CKkRPVvBzhaHNADsYQmPBH7KhMTFNLiO5eeGl17l2jCCumHIgroN/eDub9fz+oZxI4Ga
	H9vXLYTtjbqNAz7bxQ6XWa4paYAbGpH88w6SIVoyTnTOGWZjHI7MEvdnbLm7kUTtw4kldUJGJ7c
	1HVF1eS96h2BDk2A==
X-Received: by 2002:a05:622a:848b:b0:517:75d8:b956 with SMTP id d75a77b69052e-5177871f8ebmr96526921cf.40.1780585074717;
        Thu, 04 Jun 2026 07:57:54 -0700 (PDT)
X-Received: by 2002:a05:622a:848b:b0:517:75d8:b956 with SMTP id d75a77b69052e-5177871f8ebmr96526581cf.40.1780585074266;
        Thu, 04 Jun 2026 07:57:54 -0700 (PDT)
Received: from brgl-qcom.local (2-228-54-83.ip190.fastwebnet.it. [2.228.54.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm75037855e9.11.2026.06.04.07.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:57:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        "Marco Scardovi (scardracs)" <scardracs@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpio: core: fix const-correctness and remove UAF FIXMEs
Date: Thu,  4 Jun 2026 16:57:50 +0200
Message-ID: <178058506651.3858.6240644872632687153.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524162708.62949-1-scardracs@disroot.org>
References: <20260524162708.62949-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a219273 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=F4J0OHcPalsv3C1teIDEwQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OnkKZ1vEyO2iae7U7wMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2IUGGW9Jd79ckz3jPIwW-IoGH7l1IPRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE0NiBTYWx0ZWRfX6O4xLNOVMAnt
 DOZPUIO+LQCulI1X+T/BNG3K9lIAkgjHtdBLctj0qNgGd4ngXQI4y29f1P7HUZyIHWJiNpgdU/6
 yucLeFiOf/faATeOvc2kXL1QSk3XMOZz4Oekje4wQbTeeGPhpu1ZKVa163vmM+IRIcFNVie9ZgN
 +c9oYiLaa9kH79ZX/mQC3C/cpWesywl8Xya0uBIVC9eThx3E9228V3oFu6z381dhaOcDiXW8nn2
 Za9yNjK9ohfYUBdeHIHlfN3EIhHTJtirLm7gE22NKz6mXD0EDCAJlYxK/LZYu1ch7IKwFrC3xDI
 jWpHl/HXipd+D6OlKYz9poxw/hpa/wb/rpT3wOWpZOSZiwalvjxv3E+S785+usiHjcd1vZV+2UG
 CUp6eqJkNaEWKlkAepXmBkaLZj/SL8kBYL52JbiukQ4XRHZnsJJ9LhbQj+0AkgodNgiH8/d8wg5
 rQsJmwy8wUvlcQCevNA==
X-Proofpoint-GUID: 2IUGGW9Jd79ckz3jPIwW-IoGH7l1IPRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040146
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37966-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:scardracs@disroot.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tzungbi@kernel.org,m:westeri@kernel.org,m:andriy.shevchenko@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E0766415DC


On Sun, 24 May 2026 18:27:06 +0200, Marco Scardovi (scardracs) wrote:
> This series addresses legacy "FIXME Cannot use gpio_chip_guard due to
> const desc" comments and open-coded SRCU locks scattered throughout the
> gpiolib core and backend lookup paths.
> 
> I am aware of the ongoing work to replace the gpio_chip_guard architecture
> entirely (see the "revocable objects" patchset discussion at
> https://lore.kernel.org/linux-gpio/20260513091043.6766-1-tzungbi@kernel.org/).
> While that broader refactoring is being iterated upon, this patch series
> provides a simple, completely type-safe fix utilizing the existing SRCU
> guard infrastructure. It can be merged today to eliminate the FIXMEs
> without conflicting conceptually with future revocable objects.
> 
> [...]

Applied, thanks!

[1/2] gpio: core: fix const-correctness of gpio_chip_guard
      https://git.kernel.org/brgl/c/aa7e8b7ef03151305a387654280306684687ade9
[2/2] gpio: remove obsolete UAF FIXMEs from lookup paths
      https://git.kernel.org/brgl/c/07c44ee9fdf196dcec14675c793e3139ec8a15b5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

