Return-Path: <linux-gpio+bounces-30259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E3D0294A
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 13:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67F6D35C85F4
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 11:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5C33EDABB;
	Thu,  8 Jan 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRk99dkS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGSLAuu7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A963B3D4102
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865854; cv=none; b=fx7WkovstKezu2RwfyTVukNZmOfoaNq+g3/uvpkPvfOyZtu4dx5dQkPibpis5Pnb34Lqsm6oxbKD7pioLQiMHv4SfwJQtw/T0Sr/714XafjoUuTOMqqVEWepJBS29hGQw+OCm+fqCHvgPvUtJ6AwwJ0tYIAdcrWFtvPQBB5R9bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865854; c=relaxed/simple;
	bh=qXV6DUNbL+f+Th6TWepsqauColNIWnAgX/5uLK/gw4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=otv8TMvZvF4SzcjjBaY21saGFj99sh0Jo+/EAgqr+k3PCFjzDqMc5pSQl9oL3QxkJSi3z5e/XUALx2SPdffo3zStF3isQ2EgBEe+OCGWDlIO+H5gGlgZgYS75wGE6l7b/r/ropjpGs74kF11IszsLLVJ9KtoWiueLXCeufb4esM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRk99dkS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGSLAuu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6089a299126164
	for <linux-gpio@vger.kernel.org>; Thu, 8 Jan 2026 09:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aNULNEG+nkj8J9wiTGy8bu7sRj2DD27akkwqGJSkd+4=; b=GRk99dkSQ5gWm1Jw
	gtg5AMwZZXU64BmKoZ98mDnPWRfpCMX5MXBDvsLRET1g6onYWjD/Uf1VPcnVBhzR
	04gss8ZZOuTKaSiLkk7iG1zQlbftTtiBoxrVzTYal4+Bfnit0aOAcM0GoTHPrMwW
	o21zNdv2p3O+n148JqKP05S8dm1tP5c3XccPR8Yx6idqJnd7EiE96i31bLqfN5AM
	7KgadEntgR8Ki/s2lStHaNBtKAXTftF4GvXnSupOFhUmvfdO8tInMOqTy9JNbX0/
	iR0K6ZYDaHTvAOKNuN2TiXQm13b87QUFdUOgxjKA+nkY1DT04YH1ngNTPVA5rOMO
	Ovhp5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d69b2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:50:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb3388703dso1133755885a.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 01:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767865844; x=1768470644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNULNEG+nkj8J9wiTGy8bu7sRj2DD27akkwqGJSkd+4=;
        b=cGSLAuu7uAA0pwZsRBcaoyMy68IdkgiV2qE/iTd3MsTG7KTaqlxS2/GMTdRSI/HgGq
         rCxl4II8PA1tRxrYVkB1mjFk/5aXC1bYUKgstBqXO8SJBjPnGzhI+i0HNN6XucCLqKj0
         ann4JyDyrBUFTMRPHc2rs9sJQSMRYlFdeL+ny8bA3wrfM5aTk6uAvilqAv09lgbi8hye
         nUTc8hG4GhzXSx76eMJsW5tOVd1tn2p9rCC5yLDb10X24gVwsyEmPsd6SnwG4kSl4ejq
         HIhZpZFU/II9QCRrOz8AIBiGasSz6eGgbQhNyGKJV+WB6UEs/eBITwXeVHSxawkZXsV0
         awgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767865844; x=1768470644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNULNEG+nkj8J9wiTGy8bu7sRj2DD27akkwqGJSkd+4=;
        b=VuuXWya94yPjbBeY7CtPceneC6agdNvoLlGbYAtmbzg5WewlOF7IlGeNMj4KL0uaDS
         hh5abD61cmisQFKqtzk2FGmiOk2oeU+2AZWB+Ez4G2+fJsKrLI1wps07NPT9i4gi0h43
         kH89al+dCWvyiAlnpLE+kOT7P69FQrjdCTJliIa+8pIIpvspWv0z7J/LN8cThjbjYGnr
         T1SaG86NzME1M3u9paVV48LnD3S6JP4uxNKLyBL6vIFD5soSEvHDxovoxaZW0yKanjYf
         Y8vUM9fDWPri2+WjbKtY4DAniF/Bb7b2lM1aYif/JKm7qGrKqBjZZQRtc0KiA8WxSOAw
         IRog==
X-Forwarded-Encrypted: i=1; AJvYcCUBw9c6eul9EysGgw/3hVM1gYiZRNf3d0X3pT92dG2VSJMU8HA3Wj0xzapWrxi5Q+T4OGRKm5ip4BQK@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZKVoyhvRsXGXQUfQLCwVDsvKTvM6zSclBuua1sMVOh6bm04c
	7Wb/k67Mmd6QrAKb8rmXFai0MUTMypukYxI9QbaNgSV7OF3DBj5rXbEdim4Xw//7x+2J2iUmM6M
	0xSFCQA8CkRqhNsnwkqIoSaQ4Xm7h7QP9if81CXJrMZ2dTI3nWRSqd370YvzzdMRJCjfbYllm
X-Gm-Gg: AY/fxX5lqU8sv2EuDar456aQ21sb93uCzRbLWOIYfHZSyCT2H0Emmq6lkHdBEuM3xU1
	ACv6RjRepJieLv4PpJXPxFlzyxpX3CvCodd/id/rHXOHG6pVwhlq8XNgU4UwrfpnUaexalwDx64
	xNh97hxSJp17bEjb7Km+tmYhhw3TM5+TtPGEYSFZ1xpNFJi2fJhGya6D27DIssSLxJq16PU4k81
	HbXkbEzKbNyaXwsqDp1gRCtZaODbGiiYrOkINP35paKkb5AeAw03Np0L9AG942MNE6SibfxW8Ms
	jgDU2lbIN9tYDLgDAb/i/jrFg1cbNBHT+hNB5IBmCZE2/M/EBsKZVRq5IWbk63dvGXIRSdpE2mW
	sfzthL266SaHEoxZLtZm8JgKooOVIVVOJSHlOHjQ=
X-Received: by 2002:a05:620a:3703:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c389433d04mr713957385a.90.1767865844315;
        Thu, 08 Jan 2026 01:50:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5PF1XE9kRdd9WKzyEqKwPSZ6OfIZCL3efK7ZQ06VKG2/p2eNsnDfGHq7rotJOePmBdekGzQ==
X-Received: by 2002:a05:620a:3703:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c389433d04mr713954785a.90.1767865843822;
        Thu, 08 Jan 2026 01:50:43 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2dfa:dbd0:9cb3:22b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm15308360f8f.29.2026.01.08.01.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:50:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Documentation: gpio: pca953x: clarify interrupt source detection
Date: Thu,  8 Jan 2026 10:50:41 +0100
Message-ID: <176786583791.10451.8759479946329178276.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
References: <20260107093125.4053468-1-ernestvanhoecke@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uqYu23rM5FobKBJjOrjgb3LVcqUQXioA
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695f7df4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RKIkRNZpZs9Xr75-G_0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2NCBTYWx0ZWRfX+9dzOOUoGOBW
 2gj8EBazce+0zkXB6SOyC4AwFOldXU401JTE9E2kUtPv6axfMtjkUiKmU2Xze6T1xaxbBfNImNZ
 9UCXiW3bQZLnVf6YA3vC7PpQif5ovSk70LbvSnrvLnn5AzwoXw9iX/qIGlh3f5HCoMWuqr9baEx
 pHXV9z/MRJYCaHtkRcTT+ao653R7mexnoBT6OMSpNXakcIl32myIl7N57BRl0qPYOGMFimcquSx
 J8VaGNGaX5spAEvqrJs9RG2YGle2xkV1IOMMrA9oD1g+GP75KXoFtdWb2LLBpJK2yAced6kD+01
 ZE9iA98dMIukDqF+CsquJH6ku5vVPxeRutK6fq42qz84dhop1YXAxTsquh4SJArh+J/rVCDmG6/
 TIO5ssARvJ6igO8u+XXU6aUa72Ox+rlIjCmsP/BNVEvzwjx6XIjnMdjtQ1iV2JKQLe3/Fzf/hce
 W+XMUwPKPrdHCGkjQjA==
X-Proofpoint-ORIG-GUID: uqYu23rM5FobKBJjOrjgb3LVcqUQXioA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080064


On Wed, 07 Jan 2026 10:31:22 +0100, Ernest Van Hoecke wrote:
> There are multiple design tradeoffs and considerations in how the
> PCA953x driver detects the source(s) of an interrupt. This driver
> supports PCAL variants with input latching, a feature that is
> constrained by the fact that the interrupt status and input port
> registers cannot be read atomically. These limits and the design
> decisions deserve an in-depth explanation.
> 
> [...]

Applied, thanks!

[1/1] Documentation: gpio: pca953x: clarify interrupt source detection
      commit: 8ba379879aa3e8cef871fed4a509d4f0a6370e6c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

