Return-Path: <linux-gpio+bounces-26361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C628B87682
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Sep 2025 01:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8F401CC0973
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Sep 2025 23:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387482FB625;
	Thu, 18 Sep 2025 23:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJ01flzC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9492F5307
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758239250; cv=none; b=l7+fcv/rdXluUEV3fUtl/0MggfiFTs9tPSKh0yiKmK5sRKnpgQlJhproucaIcfXaDRIDgd5mBNEIBx2V9Wik+Uy458pdrk5bJCzyNt0IhxFPtd0SGWIQ2aEOLIn5ZGFRARzzgAPOdVVUbRUK5gZDpX1KldFNL8EfA6opr2fHpFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758239250; c=relaxed/simple;
	bh=ZtBQlEYE2IpLPBeAXjIankcZ9vAoUAI2Fx4glxQeQrg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pe9u7sOz1lhRUGzAbkjoUZ6p2B3eBE1W45wcuvVuTiccN8pUlDZJzfDkNR5seVF2aN/twwV3ybdAGwQ2igmWGOq1LfLwRW9r5vEOmaaYu7aIaiigIrZFIbeViJQZq0yQmwdoY1uZOuGe1GmmsRfw5KJSEkE9T325gWK29f58714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJ01flzC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58II4nW4026793
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 23:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DWQsi9VmAY5hiqVKebmic+3ASrWfi4KXkGubaITn6fM=; b=EJ01flzCwkFtMRZK
	T/RYwcGfQh7mf8XXddL0Ui0VcOZz2A6flttG5M7XQbCwjYNGmdBMK63qKLAvnowG
	AYDOSC4X8F+SnZBDp8eL1GBkozGVZqG1UzVQoe/U5YKYE0CMHYDxkSYP2mWPCife
	0lQv5Gjv7kVzbyV9gy2kxQywJd0GQu432WTzTPrMBWdTZS28FI0Y9EVbJgq3rFQL
	lL00fHz6EZuDpLilei9elg++fCHtsyykO2niHyB1kXtvkGe3oXahPU+wQiWOBHYP
	A8UC62HJEnJCthXzU5wRLl5cbKyET4MD8aE5PwbU+0T17BfzBSjWMq3OWM/19PTe
	KqdWZg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt8eaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 23:47:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-268149e1c28so17024945ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239247; x=1758844047;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWQsi9VmAY5hiqVKebmic+3ASrWfi4KXkGubaITn6fM=;
        b=evlb9etaFXDjr8sj4XrBqtA2W7lt9RLaKSKcdZH7qExNXnUBx7xbChswWz3ftjTUhP
         sWa+G9WpKd42GoG8mc8HzRof3MwgMgjwI0DuiENiiszaVkGdDo3NCYvQbXuYnqfbfznS
         +QrkJTLGW2Lo2TjlRP+TReKXgGM6nLEBiQpMtyxbwCyccsb98ztalRgzsNehanwjG0Wc
         V9cclD+jrMqFc75SZek1U3NM9VBfUU1ZCgF7PTEtgyAE4UgX8CQir/HSWfYJhtsBvT8R
         ogGh9Cfn7sCaZd2M2p9Sh3w/wO73HnKGbwybgPxICvnolqbfg4Hu/bt55kHH9qc47oTA
         LBKA==
X-Forwarded-Encrypted: i=1; AJvYcCUNtsakxvWvbjRhOZycExowZLwxkv5OXgikGUW95SIa0Gk5nHCfevqzRppdzcIZKRVMXJuDW5MQWSmJ@vger.kernel.org
X-Gm-Message-State: AOJu0YweyZeMlrTQij7HuMeOFkZv9KQThXGvOTYlpeuFAoJmXBnqj5Nb
	740l3cnR3G7j1f8lu068v0WWji3lrN4Bl3fsEdhPaNLlJpkxZfVTKd1Ihxgp9taK7LVm6gDawVr
	5nbCuf8c4NxjK6wqaKSd5nX8XSwd+ltPDRiiYA5aRskcrEco444krZHjKAzRypxqs
X-Gm-Gg: ASbGncvbRB3S1t49Twzanuu7zL9TX2LSy6YixGHQotCDxr5F2VSXeJnl90uH7/dlyB7
	19+zAMaSGIVBDNaRWoVFLqX9z9iDgOn7A5qBl6si6VQ1g2WvSfLXsVTl8A3E4LF+vKmRT2GVYTu
	E1UY93fGRuovHxOkUQxStdjBjErjPVJzz+UBvsylkUUg1d1xqM8P66TYOLnrSAdqyxO86l9wega
	0RLnJupgM0qhAx5Cl8R+W/nwudkWIw425hP1E8jWrANF/B/u4GzcrcTp/OPFb5yh2Pb6BGg/3jO
	RMgp8yCFQa2okacJ0lTaxWYPR5h85bIQVEBSvUHs/05xC2ormLQF34w/vh1YoBzI7DJ8u6u9I2I
	3
X-Received: by 2002:a17:902:ccc9:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-269ba46f141mr18837375ad.23.1758239246986;
        Thu, 18 Sep 2025 16:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGUIIqhflA5H84k2bWq7ZhzyXkWqR8j08pCl2uE7f7Dhq9Ex2ocDiHIw+vHMRY0ZZmX+EKrQ==
X-Received: by 2002:a17:902:ccc9:b0:267:b2fc:8a2 with SMTP id d9443c01a7336-269ba46f141mr18837115ad.23.1758239246537;
        Thu, 18 Sep 2025 16:47:26 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
        Jeff Johnson <jjohnson@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250808151822.536879-17-arnd@kernel.org>
References: <20250808151822.536879-1-arnd@kernel.org>
 <20250808151822.536879-17-arnd@kernel.org>
Subject: Re: [PATCH 16/21] ath10k: remove gpio number assignment
Message-Id: <175823924545.3217488.14660135878915431565.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:25 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: yODbUxIPi4N7pcKVPMN4X074XcS35xVH
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cc9a0f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0JjSHZ6I5lEitlysoQ8A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3LVfxYcJ/ggi
 7JZsWWSIFvd2J9g++BkIGKuJqMy7Ozg+ygSzf23dt+jlQAIGumnQbFFTW7LQoemyt3LpR1sxW+0
 FZHIG2SbnFNFOpBTJjJ5F9V8zs1sudzUhf6Gvnqc4Qu0xxn1AR2uffZB7VC7+sQP26ztH1SBWkm
 uWWsdKcBTprW4LXEBRA1pm0bJlcRnFK+YCn/s+XLW1w8R0VAQsv+ajIAHY5aycEdpi3yzXPyak7
 c4HljsjH0pJdCkTOVcMCYOHVsVe0msKKGlEAgXwHsVlMnX2vCYgtrZ+xD9m+RlH4t6VwVwiHuKn
 3eMl8lq5AICC+4lsVR1AA1zzZ/lHyp6eRwLJpxN9bSbs42GWBqklJ2dV/M5A9WGuUMaBMYsoN7q
 IaB18/u5
X-Proofpoint-ORIG-GUID: yODbUxIPi4N7pcKVPMN4X074XcS35xVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202


On Fri, 08 Aug 2025 17:18:00 +0200, Arnd Bergmann wrote:
> The leds-gpio traditionally takes a global gpio number in its platform
> data, but the number assigned here is not actually such a number but
> only meant to be used internally to this driver.
> 
> As part of the kernel-wide cleanup of the old gpiolib interfaces, the
> 'gpio' number field is going away, so to keep ath10k building, move
> the assignment into a private structure instead.
> 
> [...]

Applied, thanks!

[16/21] ath10k: remove gpio number assignment
        commit: 5b345471752701ccfcfa6e86e15d2cebc6e17343

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


