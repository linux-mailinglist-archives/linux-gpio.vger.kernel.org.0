Return-Path: <linux-gpio+bounces-30046-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0B6CEE11B
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 10:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E54233003BF7
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF1D1E5718;
	Fri,  2 Jan 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gmLCGNs3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iz1K2bcE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E0262BD
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767346579; cv=none; b=LO/60GWONqp4e64y7h53lhyG2miB/LvNvP7B3f8IN42bbuQXIY+CyWIEk00axHu7cLC+IC/IaQAW5zTyhi3OyCZxpGNITefBayFrbH2KQYVi1fvxcUMndzUXx0cH99GtSjRJIcCJnQwAsKdsumgLxdVFhJkM9yq89HYa1xLxEaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767346579; c=relaxed/simple;
	bh=La5xKcVSjbO/6uX1k7Z497jysoN4ay6d6jHe3ctQpEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M+dWvVDZd84OjdbvGMcj0OVGI9X1TUo7C+eY9xP+dgdS/JqEhMVg03P4qFjdveI/fFghko8TcchTXGrkSyDpFAsJChKZREWUIOzenwmpgYxN4JGOPP9w+4zgw0YaOP6Uph2TjBxr8Tt7xW/t9SmzItyG00Om6glRrz+Fs+qQQ/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gmLCGNs3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iz1K2bcE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2IC824403
	for <linux-gpio@vger.kernel.org>; Fri, 2 Jan 2026 09:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s6pqYtBhG7r7uGtVfnpHAH9SeFeGUFFsWZUCCUCbGNo=; b=gmLCGNs3rk1VojIE
	JZMsm/j08CPlSmg7Aw4LaCNp0degOVyqHB1RoCPGbK/hoNscTCjOiq2MQByavdfm
	M8wvrqXNYgiJZPTzMEU9PvrcMmM6q3dByzbtK0l3/KlzMZEP8CwXu8FvhAVpJqHD
	UPKLrIFmUw6HdUk7RAKUX0sEKN6aujzkPcZGhljdSAsng/beG/tyGpqc0ml6esfX
	pxgLI5iPzl4EONJc5Maai22LiWpcmZr94CjJh5NcLEDQcuEd4yr4uYGts6UZKAMZ
	HJI4zKwyTGtfO9p4Hq8ajSWDUswK2BzupV1wNdMvSiRX2ug5WHWbCmT/TLRYH/4R
	ryveaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd85330y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 09:36:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so263622621cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 01:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767346576; x=1767951376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6pqYtBhG7r7uGtVfnpHAH9SeFeGUFFsWZUCCUCbGNo=;
        b=iz1K2bcEW7jY77q1d8ljmICz3g63rx8ogwmlm2Jag2qGrWfM+aHbJa93WBxy9wIZ0O
         hLjWRCgoUOyuHtHJvObRmbTdqW32jX8bXlp93TM2vfvSqVB8tu8s+WL+qubtl+ykQnaZ
         8t4ka6v5/YZ5V+W6qlJblhWjt49TynL6WBLSU/zC1Pam0PzcENjDzdAQEmGNLwyOvToS
         zBp+hykZHlG7mFBH1RY1lDeES2Rb5x0fTtLxo0MpPPiK3mcJnevrozkB9TK5iDTvN2fS
         ONvf50CHO9Zen+1WC6OIGEZOLvHzKW3MOXHDJxy2ero2XQ6R7UB4PPJS1a1FuFomf3Md
         w/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767346576; x=1767951376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s6pqYtBhG7r7uGtVfnpHAH9SeFeGUFFsWZUCCUCbGNo=;
        b=D8cNqDh3A4lg1P7ZptrvF0rLjQSldsS+FKQYV5zBjj9ldGAr60146VtGn+nskRT5ud
         nnj6MT8lvvd7Kb2zrHrmm08YsF+gesJrG1ek89OmSqX+GYyTAM2Mo7ppKw7ehOEn3qRG
         jWvd26eRz4ZzdunRx8cbOj3ptWvHJSJdeHmkBXk4gVXR+aowZGKah42vwRwkfdur4hoJ
         VwZTzLse1eu1/d0N+j4d07o8Z3ow52/D3jBLJKZ4DZDqE7DVgd+KogYs75yQ3xTBjF2a
         abX/k1+Ey8W5cH4ltQA65VbD7n/Moip6gbdHfwDwpLDwUAPqhcqPaxidxVD+/+/4RoSV
         UJyA==
X-Forwarded-Encrypted: i=1; AJvYcCWMMxDTWB7DCir+OImMzc92LhPQqNX3UEIrUy8sMOoUJrw2MXXqpeP+fF+YjCg0gnbfsfTn0FClr36f@vger.kernel.org
X-Gm-Message-State: AOJu0YywLLHfr7PhNzOWzfxp9JqHCQQSsQh9OdTcevisoZiEF1+2Zo7n
	a2Ks5xhZhPjGMvbngPJfs6HYHn+jCvoTaNn7Gw6uHnLtXdZvDXnb9feY7kzrsaDA8SesSKsAlWB
	L5LZLjL8a8k10wJKqfVfkByzysIf+9ND/mSzjAgMUSB8nAZ9CGukgATkUnGJoQAeN
X-Gm-Gg: AY/fxX6dnSoRUq7uVtCf6Fd0WCicMQ5vDwtKNLVQVg+DxqH+NZiz4RHNgXJ4mkYheTD
	RdGObArnjEKDVI27h+TdjXfkNp37jqmhSqXLTmgS7g8RX6NRH3JEFU+bBC+iFys+S2M214hQyCn
	cna0RtBabo4cdqzDryuZUw0WaJRIvNJx1A+etd5o8uOhOYPPhhKCLT1bnkhPPIyYs2Fs6hpOpVv
	FJhUxagkp7dcq6qBGQaLslXZA1MWaU3WyyI3EUCqOb3oT5wgm0c1DCuHHJ04KSOWHxuDTk2B9HK
	TAR4AhH3vQg8i2K0mJKuDx93NjVSsV9ReMuJqvAsxcs5qKpHDU/A2y5MI4Pur1e5yLvtYtUROKr
	jg1a9rmPbRQaxu2LAUod8DQF36Q8tsLnfe3JsDgI=
X-Received: by 2002:a05:622a:1445:b0:4f1:bda4:c52b with SMTP id d75a77b69052e-4f35f3a1042mr634889671cf.3.1767346576000;
        Fri, 02 Jan 2026 01:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFe5h9g7lUVx8znxBZFYCx3c27/LdnJiCb+0p6lpA2c2ZdaQepc3tVJ59B5dGHkqyAMeBnn8Q==
X-Received: by 2002:a05:622a:1445:b0:4f1:bda4:c52b with SMTP id d75a77b69052e-4f35f3a1042mr634889491cf.3.1767346575575;
        Fri, 02 Jan 2026 01:36:15 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8630:1161:9594:98e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa2bdfsm84721760f8f.32.2026.01.02.01.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:36:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        =?UTF-8?q?Pawe=C5=82=20Narewski?= <pawel.narewski@nokia.com>,
        Jakub Lewalski <jakub.lewalski@nokia.com>
Subject: Re: [PATCH v2] gpiolib: fix race condition for gdev->srcu
Date: Fri,  2 Jan 2026 10:36:13 +0100
Message-ID: <176734657056.18270.16280115441388515041.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251224082641.10769-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251224082641.10769-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wotmk8Rh2fS2xxJ5Vit-U8kG5WprNsGr
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=69579190 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NJ06sQju8JvYFfI4d3oA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wotmk8Rh2fS2xxJ5Vit-U8kG5WprNsGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX3u8+Bm4MgEXU
 hpHTmgFxUjwpM+eLxU/HaKJlh/YY2j0HNNwT+RI8uTQUcSWhFNCCTPtVBLxBexESRSLXhYsOzyx
 6pj3/nGnKNWvhYUEibvWP2DipY5S29xrX4rg4MrHXdxeZQH3mcPPUg59r5aUzhNr12GNK9osCNK
 wdmfDKuYOJuAN9LgHAUBKJ+t/4rim23q/y3X4yvjROnEbz3jXBSYfnMI58rexe0Zn+Sw8Lq9PgP
 VBrI/jb3Tcxzv7w7LE+H7uVRuF4Zsz7gEPj+AL8bgoZTRyMJmiJMAB6CF5CshSB7OmLkVMWLqiG
 7NV2N/Pz1yzqQOVKt5DegC0LabGvtArMgv0FhJ6qUtlTfm17En4sfWRVyz9Y+07vQNSIujw6DhM
 TmfuycuyVBVZF59Hg5B1Q0A1VTZLj8iMa9NG7p91NXHn0arFAxdJPOXW2iU0D2xk7CEHUD3TioN
 01+yb0CcelnhK/VzpGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020086


On Wed, 24 Dec 2025 09:26:40 +0100, Bartosz Golaszewski wrote:
> If two drivers were calling gpiochip_add_data_with_key(), one may be
> traversing the srcu-protected list in gpio_name_to_desc(), meanwhile
> other has just added its gdev in gpiodev_add_to_list_unlocked().
> This creates a non-mutexed and non-protected timeframe, when one
> instance is dereferencing and using &gdev->srcu, before the other
> has initialized it, resulting in crash:
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix race condition for gdev->srcu
      commit: a7ac22d53d0990152b108c3f4fe30df45fcb0181

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

