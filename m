Return-Path: <linux-gpio+bounces-36185-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePlBBvzL+Wn3EAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36185-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:52:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE67D4CBE49
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F344A302FF70
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE528381B02;
	Tue,  5 May 2026 10:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJ6dLItu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVJmwyyu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E937C901
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978258; cv=none; b=nLBINHqn7QdtTrzc9uJCCdx3AOB5F8WGuc9Hmu5qNmCrLtpe06CNSANB6oLX/F6bjsEXjhjvXHunWAG2Job39w/IAGOGgK41zs5Y8PeXZVrOWgGZA00ty3ty7RuhH5LmRxYF59S4WGt4KfwLSW7yK5gMm5KlsRTEDlhk67pfNEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978258; c=relaxed/simple;
	bh=96PXq4HX/rd+eOrwcXaHdpybP6s8gmuwweLDo8zjtpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FsstUb8v2TOE5lR+do9uEriNx0rBmit423t0strhfn8YNE2DZXn91d3+79aJ2fpyLLVwQv0sNo/qNWZKBzwLbaQwoVHAMRvgM20utEePtnLwrtssUFp73/IMWpZktDBJrO2fkpd7s5txqAk1xrbUhPUoTmfIVe1fCqbcrH0D3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJ6dLItu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVJmwyyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457CUWh1960770
	for <linux-gpio@vger.kernel.org>; Tue, 5 May 2026 10:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iwFjf0fsRmADKZKLetHI0wdEzmwmJD33pg5ThMTLJto=; b=GJ6dLItu8u6DJz3W
	7BLZyE1GQ4Nw6N/TOylujC9I3rAJEDngWhaJjZE3x/cZAVEyzmKq7Bu9nCB2mZec
	Qy/LgR6WPKHkssYnlVu7MixzqCGCDnAusmVx+57kcnUB2EX10xwptaJI8nnU7ybC
	xqlhwQsCvi5GVpGsv/0LO1vUBGxJus65RCmjn7C5dKSerLygjjH+lpA1FpqXbWHC
	wuO4GZGewbbCfD/Ywq+szGGG2srnqN4HDG3nKA/iNjsfvTDRyRxtuyLQKHUyDSwl
	S+phumyoOONduI2VutNlHnIEu9F1hX0AlIG25/XcXo2lBFgS9rMh5XqZ+h9Dsgrw
	UOqSEg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5dv014-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 10:50:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf0245b0so112795041cf.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 03:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777978256; x=1778583056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwFjf0fsRmADKZKLetHI0wdEzmwmJD33pg5ThMTLJto=;
        b=hVJmwyyu6/wXEJTT6aM1G7DuD5b1FbogueKyMSzJDk0i+sSxrngPo9cJEKuzQNAemL
         BKMqUmKOfgUxlgAFanEnVlFfEU762FBby5zN+oxzWrJDDGQvEYjMbpFgVzzSf8fmr+8m
         l4ljnpNkFWZ9HlHsklSDKvmh4yZfap0AW//b8aHMIMTaUHCSLLhRqIJoC5r1MW3wOMtC
         NKO6kcSdA9n2zXQ/K6CK7cEyLF8KvbC5xQ8RZDgS/2x8+JeO7uH2rNfNn+pmrAVSDHhs
         VP2YoApcLZKgZAudAgLkNCZkef1QJ9hQbiL62Jag3/kCi6P1xywenr0TvqVXesnuy+uE
         qPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978256; x=1778583056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iwFjf0fsRmADKZKLetHI0wdEzmwmJD33pg5ThMTLJto=;
        b=K9PK2FfGDGYE6ytsbOPNn0aJFZcrw+DLn1AlAijRcCVh+A14BXr7MMWPDUseWzM+oS
         SrDCea+iR9Q38VSPa1i3lpjD7tb6rbRfyCtE+BhIw4Elb28fZEC7gLtxbrfIKEh6fqvx
         /l6aYk9f2jJ8gZMneQfLPdU5oPabTsYoI5nU5RO3CsP5h1zx5Ll72vsjCqlkQQroLOKm
         Bd9wNsc7zrxv2MqNQP9Hv9gGuWLq2N01N9L/Y1KnOi0kpDPXfwevweUVgdf1t5J8HSYN
         fDABjmYciOpqZf1ZPooiHINwRREq3q/k2nUNfhBd4dzuP9kHue6TYQtJWfStXWmIZHLh
         Kw9w==
X-Gm-Message-State: AOJu0Yzo0b21qlR9syKXzPKlpvvn7Lia/ccgYFTU/y87J7Vw8CbZIjCx
	fmkfv1qSoa61mGHVjtRk3NJ/3sMRk8n5zr1/XN9rPFf+Yq/7rSOMZ/hbRSIYTTXO3MoDJVUYxvt
	RmanmND6X3D8+0fPRr2DCjpxfq8bbg6YrTeX+AWQWOis97y9WDt/4igLKybCyqVej
X-Gm-Gg: AeBDieuoIJB8XB5YYLE0wKSLQeJ/b+EOIVymtzT3DNmN+Vf7zD/lQQ8VyPkTCGwlyqV
	+rPpjnaLeMSzDNA9DyCdE3hvx36jyEMdAf34nzuQCp+HA5Ql74ckkdFfckBFlu5RDj9kO3+fkm4
	sv4FI08EAvsT7tTWMUpVHlWm+TLqeQhUsk+f0VY5ubjT9JmDsH+D5x7hC4G4hD45goD7X7F3zCS
	IbMF0XISbSYve1X1m23IrHCHrhUHXkdaRvnLjHES4lW63u8pao9djlJK1/Fc+XvUlYzFjPANlQI
	pLdpEG1UOODYx7MH8fb/jX6dmf+EzGlfdfUlDt0PFtybGI6pjJV/dsO7jFRba/ZEcn39D5nwuoj
	azdNveF1vbxOOkKTVoW6U/foEHVvaAdLx9JOT9uFuWgQ/O+yTYoxP5w+/apU=
X-Received: by 2002:a05:622a:5485:b0:50f:be4f:465e with SMTP id d75a77b69052e-5104c014372mr198952821cf.53.1777978255986;
        Tue, 05 May 2026 03:50:55 -0700 (PDT)
X-Received: by 2002:a05:622a:5485:b0:50f:be4f:465e with SMTP id d75a77b69052e-5104c014372mr198952631cf.53.1777978255669;
        Tue, 05 May 2026 03:50:55 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1b4b:3acc:bff2:6f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm424957975e9.7.2026.05.05.03.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:50:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sim: add a Kconfig dependency on SYSFS
Date: Tue,  5 May 2026 12:50:53 +0200
Message-ID: <177797824987.71072.7962489654259102722.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429080312.15561-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260429080312.15561-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEwMiBTYWx0ZWRfXwH/WF7gkkT/g
 fAIEcdUqokNf8iXqmuCAuOXdcM6t2Pxj2tmAqdLPhYboFdRI74jeTZYfU0Hbtnc4YTjXkwLf7rR
 VtdSlHumOoOXcGz7/UYrztu7WmehF0WWEQjGbQX321YtXqsA2oUXtqOOR7kX+92yYpb2KH76ooe
 iTDqVduUDhUJfH4yMIWlF7TnG+pYYeR6UXzvFPAU6SBrWyJURFt/8W/i2jnX9bKnMNAZl/Wm2RK
 Zf0e+4J+I9+jwr8mA46TKP5RrTkFWSdRiQISF4CizMpr9REPJrRKvPvNNfMfieG3GJNlyDk05F0
 3iF2JkAbWc3WAPIXkVnAXcHtCKeweou0j/dxcLLh+60G3FvkS5QNWm/hHafkEkTiDHPeHucigMr
 7ghItq0F13zHEIBaWUwh7ALe6m1+cM6ZSAEeABmo6hnoTaVtVgNee2tlWAOYUFDv90NrkNczAaR
 ENoPx7+j3z7cusJvoMQ==
X-Proofpoint-GUID: F2xt97ahKxjxhPfKhSCgknvAuNshkazC
X-Proofpoint-ORIG-GUID: F2xt97ahKxjxhPfKhSCgknvAuNshkazC
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9cb90 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=E3QizSrpEwxaaiPF3gcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050102
X-Rspamd-Queue-Id: AE67D4CBE49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-36185-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]


On Wed, 29 Apr 2026 10:03:12 +0200, Bartosz Golaszewski wrote:
> gpio-sim is unusable without sysfs. Add a Kconfig dependency to its
> entry.
> 
> 

Applied, thanks!

[1/1] gpio: sim: add a Kconfig dependency on SYSFS
      https://git.kernel.org/brgl/c/3a33394e8a5bc10ae4cbe9a35177fef714513e2e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

