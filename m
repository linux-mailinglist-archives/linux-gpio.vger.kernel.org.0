Return-Path: <linux-gpio+bounces-37271-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N5pKBj9DmoSDwYAu9opvQ
	(envelope-from <linux-gpio+bounces-37271-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:39:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 611755A4F3E
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 14:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20E2D30022D9
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 12:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1253D75A5;
	Thu, 21 May 2026 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRVuT2QS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gznLnxO1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732A3D5C3E
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367139; cv=none; b=VLqwYbGz5aKhSVmgSagHBEfZ6TPI1bKpWO0uu80JrCp3Rt8chJgxTtgp00AtZt+cZelUuHxrmYDtjE0fLxSHQBio7dohJC4ieWFl8qXlZnHdOVMxecIPVy8vYLFX+KOLeezBJwYoOWpBHd8nTXr30EakNbdYDEUAY23LzT1aoRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367139; c=relaxed/simple;
	bh=LYtGyXioe4Et2Q5kzDG+8yf5/C9Q4MdorMBPuD3iYkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PR0jhiRUa6XoJkUMAFYpS+7jK6ypviBJAeDSaQOQskMsEZbMWsYEA2aqFSfU0dbPQz+msOYVmFvw6zMjMcEyxQIAgB10KZi7G/kDmts13ixGFrylm+Gn4nTfDRkuUGpvHkyOTplAKwP8ttEVI3fe7YSgBrVIAKchB7rqTou93ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRVuT2QS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gznLnxO1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99vVT3772921
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq6KZHsE7bVxEdYAFrVTlqBQmKziP3AMaK6aB2d7/Z4=; b=CRVuT2QSFRQFign5
	njmvaLH8d7JNbs5AwDtugp23/B8RJVEbt3sbhz0DAajw5KHtE2MoPgnIm0JCsWGM
	pn5BQ6sWHDY737lIw820r2QDUZFE3/0Zgy+xzsSDWfSBTEneotYND9W6Hpzla8P8
	o4cBe9Vdcjh7EbswGTjjF+iKakZ8OnTpu3+Z3V7/6wFhG1RPkbxOuyyGTj8t1NMd
	okVJxSHluhKBzkPCuNL9Fbv3lsoSISfdTbnUPtl8WreJ1V23ZwBgpgwxwJgU4Azt
	q/Sz9ZxfIEyDsZ+GSASoMhobOk8gFLyd59tJNxQqhugHEra6+DjiFr0hQOIzICoi
	abtbJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43751-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 12:38:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso168956911cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779367134; x=1779971934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fq6KZHsE7bVxEdYAFrVTlqBQmKziP3AMaK6aB2d7/Z4=;
        b=gznLnxO1/WN722DfekTQKc1ddpIEz2XmXm9xfWm+/WX9yznUtLfVdSoR11DNQ2GoH3
         lqfJmRHjlKaoFdyh1aPydhB+NshJvxQacVZMlsSAUFfxmK4XYoq9AaQA/Lw3bgeuNXzB
         9fG740x5RabgnVh/dc3HZ5GR1e2ke4OyPHak2jo5DDvfJ1Qdsrst2bdismVEhD5mg3aj
         0TNTBLoOnH63rpOJ/fPoLc3cjgI/BTTxf0tdoUWp6YN4pA3WRuYgswC0YuKDCBjgcunU
         p78SPzy51COJo3ZfQ1tZAZ1EOapnjVc1uvL6xnFdZZXswYnDhyFZ+KyHKW70fXrp+IEF
         ZfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367134; x=1779971934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fq6KZHsE7bVxEdYAFrVTlqBQmKziP3AMaK6aB2d7/Z4=;
        b=aXQAROHuGy6lKn2ZsblX6Y5WBjSZvCsxDH/GQnVxC3nvIssRP/f+EBgaOMrCMrqIsN
         N8aqDRcZilHSC0r3rJCmSVb+K8M6QllIt19vMULr7rgShawbfPS9uZ3QnWZoJie+STVe
         qQAJVGbsXWG2f4P108x2JE6cZ/3dfKWif9mS566NgasDdEipE4yAsa8DwoJkPXCztgYb
         dIq45Hedwu5nmbhQ274kJ62mNh7a2PgppIBpBHvxkOxcM6VM126XvJfiYpZKtUQtICJU
         4Xv9l/znfVyOs2n1tAEZoDyHQYfX0CqWs2Ili+TrE0hHzrEZ9k1mqkNBXKUGdq6tU2Hd
         azrw==
X-Gm-Message-State: AOJu0Yw3/fsjsXMiDqZ0tNUXPsFiYl5qYJmmIQoVwPsZfOHQep7uQKQO
	S0LqOAWSkQZHoOsljp5loGHryO9bfBcRmJ74+G98nEAgve2cLGaBTG2K3dqs3GqxvGX+RzYNQS4
	3VC2Sx0f97wmEghqvwkGiEdIgvwk5gIhffVDo/0wuRdiIWaP7ZjfSUn719FIaA7dk
X-Gm-Gg: Acq92OG7nPYMwrsx3JlZpDZd4hQUalNw8Mah2JZkn3lW3JmglL+l+LAvOuS56M1jl0n
	Yct3INt1E06qDlBYV6PThXaLMmcFXfuc8cZOtAEfc+9FOTKmgCY8qMHZpHsG+95lRxf6pw31mhc
	V62HdJPbuKHIUu1Q1XDwQ8hzNieXNYaQXFts++5PoBzgwTfzs8DirYoabeea80OwN2lDwb1xLDI
	Il4uKsuHM4tvPpC1bmdtE+NYvI9jADU9RSl11HU5qYJqgevXUoS3R5ZuwSA2aXkulWtf2Goh6DK
	XYVZNw7cuf1Crmc6Lu8PD/4CtzF6LBX6LmWAsYwjqDrTLq0xN6E5l/maZo3io+JPaXGx1wtZt9B
	mu4s9QzTxcls8wO6gdgY6AoUAJidJpAhELqWblkx3axHACksj3A==
X-Received: by 2002:ac8:7f4f:0:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-516c55a02e9mr37935831cf.29.1779367133740;
        Thu, 21 May 2026 05:38:53 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:50f:b9e6:e056 with SMTP id d75a77b69052e-516c55a02e9mr37935411cf.29.1779367133334;
        Thu, 21 May 2026 05:38:53 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c4f9e0sm20508815e9.2.2026.05.21.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:38:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Koichiro Den <koichiro.den@canonical.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aggregator: fix a potential use-after-free
Date: Thu, 21 May 2026 14:38:44 +0200
Message-ID: <177936712378.27233.7484232218927121121.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520084911.27938-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260520084911.27938-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0efcde cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Gu97sjoEUXFB3lGXmWIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: uqxPFk0EuVzIHwetZSPfQdNOIoxYKBKS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyNiBTYWx0ZWRfX5yVbRthnTHYN
 da8UpB78NKsybT/NQkDjQ8zWDeaqlcQOwbOcDAgZH7YTSGr9ilf4QQqmvupVf47koxcnbTQ5lbU
 DSfTkn5YGmNAwmV0m+KLYKgutNyi/wNCPYIZE7vG7k1tn78bZOvWt4C6Lny4j5cjbjxboeKR14T
 7KmhbqXNFyprgqyhC0DETkriAcS2og6AmTEca2/bAh2i674k9We5dxEYvNwRc0C82sg3KQC0PYJ
 2VIcoOeHWnMech6orzUe/B8SIt56WTZBCausAWtlvvAYElrSdfgFl7H0/0Y/ejL8xXisyIzTwyN
 iUgKGaHeQpECnvQ32A2FeVWUeLGWH2eZY6lzx3Dpqeaz7ZUtlJvyAnFob/OCVeedReE5xqHkjIu
 LgG9MekLYae82FdmRBvbc38r5A59S62OBmdBILhLFbsF60TYtCMH0YMq3weYzo1RjYlAZHdu9SE
 k/hftgNsT9AVo/HP00Q==
X-Proofpoint-ORIG-GUID: uqxPFk0EuVzIHwetZSPfQdNOIoxYKBKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37271-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 611755A4F3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 20 May 2026 10:49:11 +0200, Bartosz Golaszewski wrote:
> On error we free aggr->lookups->dev_id before removing the entry from
> the lookup table. If a concurrent thread calls gpiod_find() before we
> remove the entry, it could iterate over the list and call
> gpiod_match_lookup_table() which unconditionally dereferences dev_id
> when calling strcmp(). Reverse the order of cleanup.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: aggregator: fix a potential use-after-free
      https://git.kernel.org/brgl/c/30c073cab97afb31901f94de9605177b6b84367e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

