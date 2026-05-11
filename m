Return-Path: <linux-gpio+bounces-36579-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC7RIfLYAWpMlQEAu9opvQ
	(envelope-from <linux-gpio+bounces-36579-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:26:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9E250ED8D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 15:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE6C9301DC1C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 13:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152F53E8C4F;
	Mon, 11 May 2026 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+IXFc0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqEoJdKk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6862D5922
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505965; cv=none; b=csDC1BZr0v767dyYCJaLIxYHNDF2YkFymMyo/yPqVdazsWfCZkR9A67XZRPFyQdvs4zijIbhWmzjDB+XSIXqkmXWQ1Oe8UJYyzjqt9BqB2TmTX/3KPJB28trz7yPsQkYCzaRt5AwgNKk6zYbDyjGp4y2u9vc4lPNJu1Z8f7ehrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505965; c=relaxed/simple;
	bh=sJaRE3AL8RtuZtJoW5qYmZw3ZOZPLVHvdZrRnrgxEbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lc5R4XlLctzfXgJdJW8cZqStxebNZJupUibd6Shszo54gL3wiEgm/PyG+Oc+o1qCvpzsf6mc/L+jd4g/pOns193s3HhntO4c7gVLLWRlfDBR3QMFXOlAiNUb5j2kiK4RCCpNiQ09MaWVgiV5KxoR3Lpsiwl8ZsPvfxua4y3ut5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+IXFc0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqEoJdKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BD3YmU3332715
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SdjJ0SujFBUbgHmkcjt/ezJwOJGZ0NRM+8zlb3SltUg=; b=j+IXFc0pM6LodZbU
	603+coGQWmOtGxk66AtuwviiNpDiLhMFd9yZE3IJuSZkl2XBM0yKu3UIzfhrxujy
	zZ9WPFbQVDqj1ERYuMXpWeoUUlY7D3Dso8QkZVfprPNGSzGaz8L9CUQ24Q3XtE65
	ug7ALw+BBHYcX6jSbzjJjg+VYihiyCzF6isek40s2ARZdVkuu/Dp2J1Kn3Xm3rbQ
	5FIwo5UfNSgHmCyS7QnLXkMCABuruS0tmdw9N/z6g9ZRZXo7fZ/aj7pLWf8EH1ZO
	X6hGokuGjkuZpUVxD1+Jopq4raZZ48ObPqyv2A/T663DBMnvceKRjhtNmU3d6OXJ
	WiXsKQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgsa07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:26:02 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-631b097bbd6so2748504137.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778505962; x=1779110762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdjJ0SujFBUbgHmkcjt/ezJwOJGZ0NRM+8zlb3SltUg=;
        b=PqEoJdKkYjgodFTjAPwH2zQx3Ra7qIxm25NDKsuhFXVnnzvduKV7juJuOrLmWaEWlO
         j5CBEub6f2wfewB+O+e/wmSh99HK9QOsjG5DmHr9ZPPKXTSZdTZRE7LrAZRdoFfg7WJh
         UKIiDp95nubiYcIf9fyDJCXL+aRa1zZv/I+WhbXbUe2UaqCIctBD5HUK1fHRZVfJbbaA
         wP+sERFotMx0tuGSnxIsTOOTv4gYrQDZmNh440TPhVMZYQszqj7PFxOAZVo23SxUk9ly
         GlbAxIzkSZeFNy93xo/rKFc6xasd3xaEwG4rV7svOKjrRmhlRNrgQ0KgRsq41nU05h58
         7MhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505962; x=1779110762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SdjJ0SujFBUbgHmkcjt/ezJwOJGZ0NRM+8zlb3SltUg=;
        b=NKYs7ix9jntjoGkj8/XhThJUdTZPYPrZpynJB8jeWwdGTg/E6RfS7JDKL7g1dmV7PI
         Ik9sZUV5cs0MhDiRAec1yP491khbPoY9mgPCuK1J0xjG8iZWCqTNz4G4tIejPkace8vD
         cSXzY0112KhQ+VPG/mDjkQH7Kgikc0xgCr3XB5Iq2vkAYqR13nBP19B3QJVqbSutW8bh
         i2GaSc2PBOqipIO4FpZYFLY6mGPHFu0E0bXwDO3vs/9YVQS84r1M+07vh3gecQhGj9yG
         Wk8xgsPtJMGO5iOy1Nw9Fm93RsMfd5CzN5k79pp2quLvL9fFk1C/ISIy6jljRQcyGmVw
         UDPQ==
X-Gm-Message-State: AOJu0YxyKRf9LivNMUmvDUrH5/HSD7Fi4Kg6ZaS+2JPJLsL3rWEDdc5e
	uKPG3jEpF/iSrwTGd2//SzK7xD2Duxxl7IJaS0XCwc/7NiQdXrYLuBasNtSVRp/lSiXirfjVt93
	E5DF3Ogs+42d8jgmMm/m2oCVz5L1EIQWmc6QCiIARLMvntbaF/oBZTaJwqLHzsCpoG9EzS5z+
X-Gm-Gg: Acq92OEWfH9kj4HcEOHWqjNI91cShPXrFoe2dqBKioVSuHwUVdhDWpSIFlBiAYumcaI
	hHXVML7O4CIER1/xE3Ts1MZ9z+An+0YccCnML9Bc5F5qFSj2+zbtYGVhirqX0Tnh3wL6Ja/Iakb
	u+Ih2UVJpg9vGrufqaqli8aLM0ivOPLaTwKmk4CZfU8e5DTDmEOJI/63MF7u6nz8GgiPSiAmYPk
	QvEiY373sH3yZZuJDL1cxKErJehCgd7T7ECBmB3w6appzUQFgaGjHj5ilO0s3Pv5Mr8aJqzpMdh
	xrdeXN0FsN0eFRbpJLquzcWigxjVJESPOc7uU/tpgvgfeIi+Ewnp66/aFYAXVbHYh/w2PT2ZiFF
	u/cxkwSpuyPbb4Chr7XbkjrXOIYyEM6YFRp7yMAx+E6wUVCvDBD1aMuBrTqJM
X-Received: by 2002:a05:6102:d94:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-631d91daa0fmr3501551137.2.1778505961632;
        Mon, 11 May 2026 06:26:01 -0700 (PDT)
X-Received: by 2002:a05:6102:d94:b0:62f:2d6f:cc11 with SMTP id ada2fe7eead31-631d91daa0fmr3501517137.2.1778505961186;
        Mon, 11 May 2026 06:26:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e70410310sm197272145e9.12.2026.05.11.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:26:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spear-spics: Add COMPILE_TEST support
Date: Mon, 11 May 2026 15:25:58 +0200
Message-ID: <177850595433.82073.12887763712750441955.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260510195531.10561-1-rosenp@gmail.com>
References: <20260510195531.10561-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01d8ea cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uHOwXXCfR8qhJK1EQH4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: RR8movv---tttLlqaK0qmbqwCyLRle8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NiBTYWx0ZWRfX51/nBnJjuQiw
 oohg9ymdU2O1hFrT15HWh9oJwmZXCx4iHZS8TE80YfAI1R6jExdSy0ln3Xq9zTqdQAMFnCSRzqR
 rdpWPM3r4ilkgJwwLqsqUMDFpH7uBMt5hpPzuQUNosRYnsi26W8zgxRNxZvX7eyfNAGsI4ylAXm
 VCXRSGv2w7ywprfuXhe5OcE9LjU00RuA1LLrW0oROJKoxaFJnNSjIRl+pwRcLVRFbW33Fe8nN1S
 YLY+qRmcxgFLFftQUocfaOqvcVTjOf1YrDXvijyoNwurp0estbNBiWMZ/I8supogsL/K3AzBInB
 bankVvgHO2vNKUECLiFmGFvHdQH+0+/mht01/ViUZkRPezc50GpilZNLmgFK68H4yvmH+Qci+UD
 MNcV3hRgfOwL4BzzwT2h9PRwR5a6dMbnfRs+cwmuJmoE+AUdqBhfxVDJGHO3+x4sKbnY9qxSIj8
 ZkCNjMoI5mJgHNsZc7g==
X-Proofpoint-ORIG-GUID: RR8movv---tttLlqaK0qmbqwCyLRle8e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110146
X-Rspamd-Queue-Id: ED9E250ED8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36579-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Sun, 10 May 2026 12:55:31 -0700, Rosen Penev wrote:
> The SPEAr SPI chip-select GPIO driver only depends on generic platform,
> OF, and MMIO interfaces, so it can be built outside SPEAr platform
> configurations.
> 
> Enable compile-test coverage to catch build regressions on other
> architectures.
> 
> [...]

Applied, thanks!

[1/1] gpio: spear-spics: Add COMPILE_TEST support
      https://git.kernel.org/brgl/c/63677aa485245cfc0e107f9d625d4f846223415a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

