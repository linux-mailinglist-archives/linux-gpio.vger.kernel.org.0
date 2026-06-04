Return-Path: <linux-gpio+bounces-37927-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sOGtKkUuIWrSAAEAu9opvQ
	(envelope-from <linux-gpio+bounces-37927-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059963DBE1
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Jun 2026 09:50:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h9icYVNC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FjA5BYy6;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37927-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37927-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EAED307D984
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jun 2026 07:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496D83C277C;
	Thu,  4 Jun 2026 07:48:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F437D137
	for <linux-gpio@vger.kernel.org>; Thu,  4 Jun 2026 07:48:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559317; cv=none; b=WWAurNTo1SQW8QYtTV+yYktPIZyVGRhAQrGGzITQrT+Ly+Kfrg1m0lZWFV+XsvySC9O5D8fuGEsfoGoQ8zuK4hJLNC2Frp/NY0y7NvYfjK4RQdi9MsyAukItKzb3DPZUYd8ESSNNHn4Bv/NNy2lIWYTXJdkTWAd4jTEtxShboA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559317; c=relaxed/simple;
	bh=Zgeh+KFtvYxY0cpdR/ONm87WDlhF2+gfMe2BTraJDvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHLwCx3e9BKs493T7STV54C0DQS5w1Qgj4CaQOQrVpEi6/HgvU15m5edYsEA4jJnh+IQtQwNgnXWHNADeYtYE79F+mwXn9bB6NnYA3A7Cm1wBBfgVTmGdMKEdBKWv+djQRC5OWVC0k3oexUPtDYo5s/7IBQM8TGXyb43RXGMUA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h9icYVNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FjA5BYy6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6546usiq2477907
	for <linux-gpio@vger.kernel.org>; Thu, 4 Jun 2026 07:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TeneoMcYv2r7fGn/SYnjfOdp3bQaHKDVn8lHVAB6UYc=; b=h9icYVNCrQFYzrBW
	CvyZkCinxzQWdDbQnFfUGT7qme8T9m3Tyb/2YpVtKJCZufLo12aoDA4AmB5hKj0L
	j1J1fJC/bXgE15A3Z4EPw1fwSVVGAZIMpCj6oSVtjAr+ft+iHT/DduhlWW5QM9ig
	tITHRmpVNGNJig813I7zLjI9q3zF1dRXR9APhcsKlpehVkRq92zoILo777bmI9r9
	kOl22W8me/7rnTQ7zLWAiqPwkpHaQT2VTqq/JsGoNgOYGRp26pGx/3Gean2hfoDj
	QMJDReVyEcwwTtTvAe7r5Mp1wpxGEExFfTf6qIwEoRNOWK/8C/yzMVdM9KRBV1hv
	w+NrZw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek4hvg679-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 07:48:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51758177935so10753361cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 00:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780559314; x=1781164114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeneoMcYv2r7fGn/SYnjfOdp3bQaHKDVn8lHVAB6UYc=;
        b=FjA5BYy6xWj88raUsa1+/fvjM3r4/ToJWcgP+uGhr7pL8FNjM+vRT79X/36KjDlSbp
         9WOW8GmL0dbehHxMStliltGyWSkzoDuFncddu8KMWk7b3lvt8nBNTTxPKaeVD60r0JFy
         1SrO40z+O1iWKMlyo7eyuSG8MMZbXRSwJBWMM0y5iI8M0XNVBhgLX+McNIGDSyxhsAxQ
         LVwpAnFbLvrQZdpupaFaF3pAB2H6fNvFGoQtimeWFvyu5DOyCfgEFewdugS0RWfhRu7r
         qSYaF9m+VEigm5kdiTK3ufqnMtOhoyj+BrOemKrIvKZ8LMCZnaTDiCC9solvisEqaEM4
         tSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559314; x=1781164114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TeneoMcYv2r7fGn/SYnjfOdp3bQaHKDVn8lHVAB6UYc=;
        b=jD6DdZrT6bjhhG0cI5hH/W+oy34i9BlVAq0rSPgPoxSC4W6nZqCRpl6guz1Uo+yo5P
         b1vNRFdM0IGxDv4mzu96qa4deumwP2BjxLNs+bPd7rk4XN+/vzV5+KHe/+3t+I84Z7c6
         tHyZafm/u63CqCTbFk53btiaKxq3hvEhfMoRkFxIh4JxdvKpAHccDK6eF/QsXM3XGL2y
         gxAw+d2i+GUTM32iTbcODgO2gRHvSYbyg1bzL7+huYPT2RP8tmuxDdh9eYA9FZFieyMP
         dBYp70C3/soxRctPLPM5BVVuGDi8SaRVmesk4nYsRo7YfLb0mv4YHFmkfylPiTISkJCu
         xsMA==
X-Forwarded-Encrypted: i=1; AFNElJ8M0xTawyOrXP2TtS7pHdOkInO+N9aiwmviT7q0xLmb2t1rwW8tKqN7OoP9fHhTDZe2tIYyGXsS6c+y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ujIS9i+jQWRDlZGzvJjzM0HwBIOHr21H2wJO3SZP7IcM5J+F
	Slme71xl8lmb2PNxq/LFnoIi5oP8hN3g8jk2ti1TRpo5HZxa3WHfR5TJCI4L/r1EGHfY7w24X2N
	VVfR2ZiYGU0YCQ827bCpvdp91R34Bgew9zaleXlYB9m8PBAwBj2P0XvpVnpg8/gYf
X-Gm-Gg: Acq92OFKbyU9+Bk8pFm8Q9e20dg1nXLY9Dx+/EUM4G5nCcuiCoIPHf6oIq6kjWBNe6G
	+2tTKILdXXOuFTOB2aAUB7kv+DVAzmM+9lUJjbDE6qXDsg2kEykoVKKwj9awdxGoFzafA+/BlLZ
	yWHgJc4ER0ajS0Ny5/OHYwa8Py8y1YhXG+4D9+dQsj+2tcan/1nBsVDN0DDmNv7t7wvimJKjfkz
	VA8o0qjBzNbIN2EkT6dIH97XOpkZ6LT7PTMoUHiT4clTy1CDEQZmrv0IM/CrUvvCs25Xz6YXMcd
	8Eaf0vOq+w7S8F8+dxBR3IDsWKvf6OimT5WhlKaXuKDkDtP0iS8OrFaYpD3hqqv8oReseqqi0rC
	qdnKif/I+h8+/Ae3iRvwa+CyVsUFPF8jsytQIES+XkWkav/5R9ti6WNG+WWG+rwqpKwzYeUKf9l
	nwvkB63Mg=
X-Received: by 2002:a05:622a:178e:b0:517:57f5:e21a with SMTP id d75a77b69052e-5177878462fmr104184211cf.41.1780559314169;
        Thu, 04 Jun 2026 00:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:178e:b0:517:57f5:e21a with SMTP id d75a77b69052e-5177878462fmr104183861cf.41.1780559313692;
        Thu, 04 Jun 2026 00:48:33 -0700 (PDT)
Received: from brgl-qcom.local (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7d6b990sm71092725e9.2.2026.06.04.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:48:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 09:47:52 +0200
Subject: [PATCH libgpiod v2 09/15] bindings: rust: avoid potential panic in
 gpiochip_devices()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-pre-2-3-fixes-v2-9-781bcaf47475@oss.qualcomm.com>
References: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
In-Reply-To: <20260604-pre-2-3-fixes-v2-0-781bcaf47475@oss.qualcomm.com>
To: Kent Gibson <warthog618@gmail.com>, Erik Wierich <erik@riscstar.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Fazio <vfazio@xes-inc.com>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zgeh+KFtvYxY0cpdR/ONm87WDlhF2+gfMe2BTraJDvc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqIS2zRcAr1BBYcdOtwwKddjBpBazaekKfNrcas
 mwUNA+3JHeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaiEtswAKCRAFnS7L/zaE
 wz1FD/4zawKU90x10fEz1QSQ+BYykj1WsaLnOveX/zNg6oxJdFEOvFkEtfs9GG1cVoG5+6XU6P7
 KgFsEteOJM6BeEqHunoKLOfYITdx2SArXUiug+KzdCMEjb4N8x9/yvi08boMOGyeyIGMCk07HWC
 TCeFaSZsT/MNv41uxCh5sqEMKOBZ0o0oAjOpcZuOPfzqArPepxuMqxIgqKBzvqOumIHE9g4d7ah
 LVDQKq1pJa2eL2znBFOQ+PUJfJe2tW/I47Mt7A004h7+rSIC6Y8blWruLUwupHoTlkeT61yEcpz
 kE5K8q59LNpuA6f2nDWNAAgo2Hoq7pc3mE6XonG3qrmkyVKux1AEqK91Hy39lYR6DFZPDyA3Ytl
 0/QbBTDA0eIy+vCasRTzC59wxWVhX12WbALOKqlGTUR2q8dFaCx1QWZFvqnb3SyuLCtMMty3UFY
 tw3auGD47zjv5QBf3tja03AbQ5gPceng0ZB4I3joJm6pPdczHMCmO6z6f1A5dT2yi4UfuiGX5Jl
 eNyFL0R2Y7FFALttpTdJ1Fy5itkIuNM/aAIln1KZFfb4fCaA6z83lgdYXiZA5FahS+n/GcbObAd
 V6TXSD2nrQLz4XtgZ/Bn5AdXX4WmtoRR6A+vbnERwJ1MlAFpZ3ytZE7u9YJK+szRCAxwEfGGWzr
 0iF5lRH49YC+iOA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: wb9EiZLDIUj-vPCg0t8bf6j9SEwRe6OT
X-Proofpoint-ORIG-GUID: wb9EiZLDIUj-vPCg0t8bf6j9SEwRe6OT
X-Authority-Analysis: v=2.4 cv=Zp/d7d7G c=1 sm=1 tr=0 ts=6a212dd3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aBIYUfOEhgoR9egqXYNcqA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=3W9sBVhNAAAA:8 a=EUspDBNiAAAA:8 a=Mtn3F3aGPLR69FP4vvEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=38sOm0jhF1M2KuwyeTFR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA3NSBTYWx0ZWRfX/wrsWy+jqvbv
 lV9YMwlIJDycc+Hsmg7namfodiP/gknWQazBwMsQdcfMLTvtbUQIMPD8gKRXLCqMHJwSF9S0tjH
 3HbBcRJ6gma96uYTmI/y5cKc6DooRtC78DK0cJI66QGd6XU/6iOr3Cn/fFDNEfOvlrIIgV0W59t
 0a3CIVV5yX8QGN3ctX7DNVf4czIV4JHm3DNf5Kq3dnpvu/fdM7ymSmIapv3EaupLFxHktCOLk+C
 PACaQqgh3PN790UouHKzywzJF5BwIrFtOLFOlkhxmgGfXQSofzyNK83JiS2UJGvhPKcIFEpasVK
 51ml8p0W43IJqUrfUQZBHVS2DbADKDr6btJDnzaRCdh/smY/U5wQT1vx5LFxjJUAPwuHMBf+XDC
 hK/JC0Cs4hoa+RVyIuR6wGRx9qSqq/xsXNAWNZze1GSB/fnR3Gc/jLNxCk/A07s5VhhilGKUqdN
 TIXs6QEZHxET/HN+UZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37927-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:warthog618@gmail.com,m:erik@riscstar.com,m:viresh.kumar@linaro.org,m:vfazio@xes-inc.com,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,xes-inc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,riscstar.com,linaro.org,xes-inc.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9059963DBE1

chip::Info::partial_cmp() returns None when either chip name cannot be
decoded as UTF-8. Passing that None straight to unwrap() in
gpiochip_devices() would panic at runtime. Use unwrap_or(Ordering::Equal)
so that chips with undecodable names are treated as equal rather than
causing a panic.

Fixes: 91f9373c6558 ("bindings: rust: Add libgpiod crate")
Assisted-by: Claude Sonnet 4.6
Acked-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 bindings/rust/libgpiod/src/lib.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index aacc82e79dc77f9563d90adaf5fcffeb86ce690b..22a3b87975318713d0fffd5a3e4fed214e984044 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -12,6 +12,7 @@
 //! The API is logically split into several parts such as: GPIO chip & line
 //! operators, GPIO events handling etc.
 
+use std::cmp::Ordering;
 use std::ffi::CStr;
 use std::fs;
 use std::os::raw::c_char;
@@ -491,7 +492,7 @@ pub fn gpiochip_devices<P: AsRef<Path>>(path: &P) -> Result<Vec<chip::Chip>> {
         }
     }
 
-    devices.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap());
+    devices.sort_by(|a, b| a.1.partial_cmp(&b.1).unwrap_or(Ordering::Equal));
     devices.dedup_by(|a, b| a.1.eq(&b.1));
 
     Ok(devices.into_iter().map(|a| a.0).collect())

-- 
2.47.3


