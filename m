Return-Path: <linux-gpio+bounces-37627-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOq0EBoCGGp+ZQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37627-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:51:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6875EEF59
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C382300B5B4
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF55638946A;
	Thu, 28 May 2026 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kz8vtlQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvjVC77R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51427F01E
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958218; cv=none; b=k0DUB4TZUcUashK5p/fFNwUb5Bzj0LSEw2Tc6YbFTyhMfiLRD+fJht5KqXxbbMCG6ZnBCRM4xzxvc5hC8aX6PtOha69p8q+G7L04oGrBrYolG7bePFk/p45zyRRd0D+wkRVdwoffXiHYP6W+1NSF8q/tdz0Qje9w4q6UB6phGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958218; c=relaxed/simple;
	bh=+a/Nz3J5qiVwaEOOAwu8aUztaAS2BWbH+ppjpk7kawg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=apUoQGdsCi3GxeucrSGM9GCpFh0m0KOyMbF93KH1u09Xa/DyhrMZmRi1eeIot5wlawoBFhRU2oVJEe411t6dSnzIT4A9unMDcNmpja6wF/Rdy/V2axfUo75BEllZcUr2rUfuwFv5bLaoJz5vaELP2b0NTcQKYEPmhTxd2V6STUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kz8vtlQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvjVC77R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S6bZJD1225513
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 08:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y1GoSw/1M/sgKMrU3PhNI4NyrK90gB2DxEbZYDt+VgA=; b=Kz8vtlQNdmKscM2W
	0qfaU5MypljVClvFuRxflipdK57wD7/obxm4RKm9Aqgw6HUpiLD6LrYao1lo5flQ
	qTK/A/3rYmm26ppaU9LZpmSYgHXdk6yFD2AsoP/wRucn/GryV1N7dofBgB7BXAvh
	z0KUPMcyGvOCRqrEu2Pukclm6PIYAkVXr3kJ3dZgEKgtho5z5ccsDXtyHdYee2Do
	GsGeCq/EzVAd6FVtJzOJRNs6lPrnnL6QI5yzp6XLzTyaSOou1dQ0RAqur4+yFU0Y
	PrEnaRMIW9C9Ml8qC7zerBst1qF6LELhqBG7aP7ZY4yvbs54hSxdoeowlrjVzDwW
	p8wy1g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1t34x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 08:50:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d53eeb8aso132238001cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779958215; x=1780563015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1GoSw/1M/sgKMrU3PhNI4NyrK90gB2DxEbZYDt+VgA=;
        b=cvjVC77Rsknw/dTKs1wbxLtWM+ziIEUi3hFdeLx9gmjN4yCplUN1lKSnT3U6Aqb+gk
         ndcgGVX1DlTVucYK6NEiEa4AQiMuNfk9iypwv1JM53dLZ/EzAhRE9xjy0ZDidQcx3Xu+
         Mypxjpz61br7zh0dYMTq7mPA16xx/eQEvxTjsUluYUkjq1hGAs/LRbeBGtoVihrYL09j
         qGHHHZU6rGgk8paSpTjvaU6o54Jr7ZjJffOTwNJHJQyJBIBDr4518jKJGyLAW8syirub
         y2r/szaTxLCpgD04ZCde9ZdDEpuvPE0xXHtbHikgU7HGkhQqZVpaY9dFPFbqUAkf+NI6
         AD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779958215; x=1780563015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1GoSw/1M/sgKMrU3PhNI4NyrK90gB2DxEbZYDt+VgA=;
        b=r1e6r10kYvSb60+fzpZyQWJGhA9oPn+Da2nnh60u7LVWk6qUv6A7DilMpvdJdmYVBH
         Ng6rh+ftTCl6rRYUcrn3hpyhURpOfyF6GkDenPlm3nxlUMOBKYopPE9dH3cVEoSJDRg6
         nNqAHGaiR0Wf8Gk9BTvsSGh6PNTakfOmFLwbcE+bnSAQlcs2k9m6oMFpN4FHVX0itn9y
         LBtwutkyZn5MjlDgbs1iK9d1IiD5KT9RJ4KT6MCHBkINPV0dt220ybqdPxeJPRMg2qpb
         QHcjUbboOLHbwZcQRIM8Tke4bdAX6ZnT0er5XXMCtRWGGCvT0SScE2xeaXguQXcKSPtT
         L3Aw==
X-Gm-Message-State: AOJu0Yysv9BlKgHPHo8BrX8NjwsGcPqqWWoKAZzFQ/zWRLgVHRWM3cGH
	2Q2yvOSaon6H/pytut6K/6LRwWy3aoqgR4aQZ5J9Pz0ENVR+gIcT96Es9S2/DmZEdaCSmx69tzg
	lGqh5IluFfY2reQP6Tqf0cMPZBVAtrQVa16UZnykq52+mJ0vGH/sQzHKaWLYRJZPsfkqHh4hh
X-Gm-Gg: Acq92OELTX94Zoc+6SVtLtwPi35eN7Qn0NNCogg3+U3nrH3SGwallJF8fiAbG6V8MU7
	QYNjnLiuCkSktyysgK5JX/XenYfZtVYRQDdaXvqZOwnq11UfuFJY4KsR6bBqEeMqPRuCD8Yh+a3
	QjKMVZK6BW3Bh79lwkEGDOA06y5V+Vk31jWVGJdGXDESazxYDmVidvEDMf8ovrFohVUL0Dm5iy+
	E9ElwTTISEwdk6c2+5iepUm+bD5G4+8uiMyUbpjcm52BIYLJu3Fl/wSzxRs32IyLnSrioCcLEpV
	h8Y+v6p+rL4dEbA7x66ecvmBhnYKH0J37f3xq0xiVQZQ+Vyvv+Tfbrm7q4hB2JIUdiO+J6qrF10
	r3NOuazPznmigKrZ4rkmaJF244MgDe1pCLK/ucTvClzSCuDNRDfKUVTDPTjIg65p3GF80rV9vqb
	EQMrFANIceGCsCjXL7ao3v6Yt1Qw==
X-Received: by 2002:a05:622a:4a09:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-516d463dee9mr368350491cf.49.1779958215519;
        Thu, 28 May 2026 01:50:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4a09:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-516d463dee9mr368350191cf.49.1779958214965;
        Thu, 28 May 2026 01:50:14 -0700 (PDT)
Received: from brgl-qcom.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b5a618dsm12684525e9.8.2026.05.28.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 01:50:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: realtek-otto: fix kernel-doc warnings
Date: Thu, 28 May 2026 10:50:12 +0200
Message-ID: <177995821029.5219.6534525126554499380.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528041031.728557-1-rosenp@gmail.com>
References: <20260528041031.728557-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a1801c8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d3RMMg0bW2NP_tNR-s0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: YSY136QJJG2P6k8I2RuhRdPDM6I2mzYP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDA4OCBTYWx0ZWRfX2Eh1tFvhlzhR
 GeY2ijWyWwUQWq1tzg9ddIRTma4qU31Q6xpswekO3FSPU8mC9htu8dSuQ6BTOrPBq6alfXRp2Zd
 cAxKo9KEFCrxnd6M76dGn+3dTSun9757PEDPJ277AhRlwWXcUGh+abrukbZYYLsAka8w4X3NXsN
 WoJg0TCgkJM9/FgWGDrpZFosx+Y6s26kE6Iy7gFH95bNwGDCjE1Ey3oXddfCcIZElqDSvUPHN7Q
 RXPcDkdZivyTi+yOOqH6EoREh8vp/j70L15NCWiLh/XLzvHu0JAAA7hvxDSlkDvrTs6BMAiVFua
 nKJ+vTng+wLcI/iz7sk4fcR7O/GcnHT4gfoC5kxl/csay3DLDHxQSC+RJmUyWr54FGpXYpy1prP
 czeEOzGCTtfo0swSpXFft0cVvH2kj0Fx+rFQSHhpBiW2BtqdlUEqlleMaK+918p2RP7cMSXDsdc
 OvzPJrnjW1RYbm5V1bQ==
X-Proofpoint-GUID: YSY136QJJG2P6k8I2RuhRdPDM6I2mzYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37627-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB6875EEF59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 27 May 2026 21:10:31 -0700, Rosen Penev wrote:
> Add the missing 'struct' keyword in the kernel-doc comment for
> realtek_gpio_ctrl, and document the @cpumask_base and @cpu_irq_maskable
> members that were added later but never described. Also fix the
> mismatch between documented @imr_line_pos and the actual member name
> line_imr_pos.
> 
> Fixes W=1 warning:
> 
> [...]

Applied, thanks!

[1/1] gpio: realtek-otto: fix kernel-doc warnings
      https://git.kernel.org/brgl/c/5974454ab26a5351abe4897f7110a68120d170fa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

