Return-Path: <linux-gpio+bounces-35654-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ja8GuNt8GmgTQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35654-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:20:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA2247FE41
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 10:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84C093018758
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 08:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FCB2DF701;
	Tue, 28 Apr 2026 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwwfcYgQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8+zYm6N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B52D47E9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777364096; cv=none; b=Rn7C065HbX8EOlxtvsIpsWtw0NnSxSLs31ZOAGm/FQu1XvNRxKRcEoDLbQpbJk+Cr7vb/5wHAww2lrQFKI3Ws47Ev7Q0HPkrGbboV/K8hTP001WxY89V9mGFRuli4qB9o5/ldHiNme7RFpwZuLJQpGHIMdoKR6mSx5FtEoGmjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777364096; c=relaxed/simple;
	bh=5u6kJbNcr/24wL3bmvD60L8ZVkEa3JSA2ryOiTTngXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=flwOJeh81aO8IGortIoH4MdPqMWkeKSv4gYae2A+nConY+ETYWVPC0RIAeR2j/YrJKj2rkexQ0R8GrTDIXnnFxMFC5wmfXQWzsQRt8/Y+DO1TcFa1XvSGAed2yT0Ce1Yjda3uWYhzJ9O1iv1iLQg/UjCg5du1LRBZUvs3BjqA1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwwfcYgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8+zYm6N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S3k8L72006196
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l6aMwJMu8CDfvVv9PZpLjP1osk8nY+/traiatwRBLa4=; b=GwwfcYgQhvChhfYG
	SdsXS7ZIgZVW5Mbkk/cqSCOZ9391xbsqdu2XKoi3cum5ZDQyHvxGPAl0Z9i10sje
	hBcOpTURQ3Qp8rs1i6//Jx0F7vJZdUjMbUixf81Hdj6xvQvQxOHj3LQm7Qad6WYT
	KISF8nVNV9w+VPpb8FEnkuryLUPP81QPlCVadnvmtF7UPzsAmorYVyfKfBligzm2
	/Sf+BK2clFMLuwf3l4kk3UHb2rG+z+7/XY5NmcGZVUqJKDgttsHnAKxyXMncVAKN
	5o+QGgesbzaNTdeaGQhzvHwjGwt19lxTh3fpJ5qNsTAG7m5a/XhnHy+CzWtgA4UC
	tR0FwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkm3v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 08:14:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8ed08aa4so94634621cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777364093; x=1777968893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6aMwJMu8CDfvVv9PZpLjP1osk8nY+/traiatwRBLa4=;
        b=Q8+zYm6N0ThIIg9xBGLfI50rbwgGB38gNHNUn/jbvch3e38WS5dQiK6Xq0IxW+emNS
         W5Kh0i4S9CMvntfKdx5rBvfvng1fPjnKdQhKSJYA5tbruwWUTCAiUXHWSQYUVFsPnj+b
         AHS1sycf9Gb3wacCYnTDfclq5krdtosJsT2lzLwJqUNzHMBf3EAeFOCLY30mUQb/TOZB
         w3pDKIEw1wqgBelvFGBL0xpOs5gTP4lvaBobyuW/N7141HP2PZ73uSruwI4xUdipDR2g
         +Cf5X20wWYwDDkkEoGveUGj5Oek0qQQBTsUSlpJTyVJTCeh+h4U9z/tYbBo1xkUlsx9X
         RdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777364093; x=1777968893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6aMwJMu8CDfvVv9PZpLjP1osk8nY+/traiatwRBLa4=;
        b=CMnYmB+Wm6CrIPd4FmDMOkCNvpnq9wdiPGzdQijybeRzo25O7Rwx+CFxN71upp/dr/
         ujqsyGj8dvXJaOUSynlXqOiAHfMXz1M7dvZw+EbFCarRgzRSMGqYnCBAsIKOVCcEiY1k
         iMOVLG8nUYfd+3qstFcLQArdXd9VgswPcvbC9fv7MRi2mk4lqT6g/zWdLW40LOg7YO+u
         zcwKj5aTUUve9k3fRuaWNeyAnWmYT6Ci4CHaqeT0MLRtrCAvBUokz/B5Q14cDpv5wYe6
         cRZAvWDfOVnpoP+MQr5/wWf9/jGbwkSVklSoy0kzTqT+oJdrx3NvIVt57Ar1JQwNgFBM
         4RpQ==
X-Forwarded-Encrypted: i=1; AFNElJ942vcSY1udakdpYzLAjyewU72+IkPORpyHx/3jg0L7bYFEFBqlUyEV6LKOxE8zGKQPg/vPCt6pRyHU@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBi6ZI7tDUrpkY677UOaRiSNu7hYY/Muop7Yd0IKG70nWWu9E
	e5B2H6X7mkeP4CVE7Y7YlxYF+ihbJXmjXZrXCW/G5GE/daLOtqu3lSOPxsmigaJ3Yp52ZiGd8UG
	a0aImpVJ8E2WnsrgdbHp07yeKfPSz4ivysIBfH22IGT2AJFKsm8aFZAozIL6dX41gbgYAvWMr
X-Gm-Gg: AeBDieuJT7rtG/Z2obw3tpAoCjd+khX8Bw938G7JLJXvd1l7UA/E1h+nrHobRg2BpJr
	F3exm7MYrZHbpiTFGZxP1H1aDQLnBpmxrpZiBUB4gkcPCWJAAqvxfw64AwauU+TM7DN6UjKe7i2
	JhxyE3K0o9qdmGQvhCEdEtnLd9QYslzA2quhkzptPeO7ySBeJx1umifUrCUo+09Fm1W0QrkesOs
	q67rL4Rw8kZVa9Br4f6Aq+SNnSiyz4kIzX5GIsT0vWmYL/a1eyvi98K9Rxn/6Piq0CPoIuGwWio
	DJPOI6cdu6kyX/D3mJkmDgNucJ6y6Gzb7bd/T0dqkqzZgcRU7osWsCfQ9/1+HueS8VFJ6W11Ri7
	S31fu/XkfBDYZ0XxtuSxA+9Qmg5sm7EGkg7yXnZYtLOEZH2i9UKzjlz7nmhU=
X-Received: by 2002:a05:622a:199d:b0:50f:b4c0:630f with SMTP id d75a77b69052e-5100e20ff4dmr25807901cf.54.1777364093378;
        Tue, 28 Apr 2026 01:14:53 -0700 (PDT)
X-Received: by 2002:a05:622a:199d:b0:50f:b4c0:630f with SMTP id d75a77b69052e-5100e20ff4dmr25807721cf.54.1777364092918;
        Tue, 28 Apr 2026 01:14:52 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463f4c07a2sm4605002f8f.20.2026.04.28.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:14:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] gpio: ixp4xx: switch to dynamic GPIO base
Date: Tue, 28 Apr 2026 10:14:50 +0200
Message-ID: <177736404661.5976.17646360119700458695.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
References: <20260427214311.331996-1-mohamedaymanworkspace@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZFoKY9pLqWRe8s6bBsBC3ykSYS9vigCB
X-Proofpoint-ORIG-GUID: ZFoKY9pLqWRe8s6bBsBC3ykSYS9vigCB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA3NSBTYWx0ZWRfX+MW7yZcG05QE
 NkFWH3vpz4eFq1Cp4HytAt6r9450mD8v27X4vCedJjijS4Nv8KrJPE5sGwzVePbSJyN+gaulsI6
 LnGn12BkbJ0K7y3sWdHN+xqrYU3VF5SZJRnvKY1O+5VBdNYFStGuR7IUayK7gqwDL/ExRT2UW3I
 vm5hhI94wIyBlZPXcBAsUZ81W3WVrireqDuUZHj+rqeTVX85BPStVVYOWEbXqYHQECdjJxEDeUp
 1WSGXRbyF+cM4/YJ1kuP53IkkLCX6rRJaIaJ9Me7oycDITYWIzWtYT78jxmlF7pqc8PeRqvrlP5
 /op3w15ImJDW7uhEEnmJfBxL8YpGrbg5zNLh/FydzFdXVZJr/kedd8iOAto16Mi3fbInRSVrU97
 Of3jjVMK+8WBhIrCRjCtf2NoaurKZV5XEAbaatFoP0N4TLHcnIRSJCLN7QWfWmPCkEpFI9WsPDR
 p09iEn5U1ey/CouT1yg==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f06c7e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mBJcc0Zejn4iAAP7EgYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280075
X-Rspamd-Queue-Id: BCA2247FE41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-35654-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,openwrt.org,lists.infradead.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]


On Tue, 28 Apr 2026 00:43:10 +0300, Mohamed Ayman wrote:
> Most IXP4xx platforms are Device Tree-based, and GPIO consumers
> use phandle-based descriptors rather than legacy integer GPIO numbers.
> 
> Audit of the IXP4xx platform shows:
> - No gpio_request(), gpio_get_value(), or gpio_set_value() users
>   in arch/arm/mach-ixp4xx/
> - No platform data using fixed GPIO numbers
> 
> [...]

Applied, thanks!

[1/1] gpio: ixp4xx: switch to dynamic GPIO base
      https://git.kernel.org/brgl/c/1005d6e0257a5623ef79bfbd8f588b498c1cab0d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

