Return-Path: <linux-gpio+bounces-29794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F66CD6BAE
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 17:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 599CA3043560
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Dec 2025 16:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9E49330B18;
	Mon, 22 Dec 2025 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RflW7gzB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2GlJsNK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317902F49E3
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422670; cv=none; b=NewtQ2UtBafpGD9dwJ7Djn4wGM8o4dD0Pvkc65OHU+HemgF1ZOiAMnfikC/U9Uu4Ba1A7bzNEONsC5i0FmaUsLWC+WbqwzWR+FIr9u7C7gxvaS0ja9o73of3ZK0n5j8VXdOaRhq+1WZQcViO5UeI7pUyhQEXZ1SJewiQosc2D/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422670; c=relaxed/simple;
	bh=hTZaruOqaUcwNVYLG4XN/ehY+3Sd4OjRcmrM2z34xVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeeFTioIBC6T3wyzA+eNHNGJAcLrZ/hLAAZnyxfUMOn2vtt7TAXxuEgRbRCjPvVsdG9lzIjWmvc/6M9C3914WqkrXNr1pEdOZOjVbAHcWnaV2ahQoE1U+cgoDtFtlfHzz3nDhEMxUOZFP117tKCfTHL+RblxwzE0L27ZgkOD/8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RflW7gzB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2GlJsNK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEC3Hu2041070
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 16:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJ0a5V29viz7LLXs2uuLzoheftdEXYHQbwbfYUs9794=; b=RflW7gzBBE8Aopcg
	DvCZI7IbiXVCNW7maGoHbDhOPdXXItEJS9JKBKx7VvZHYApwi8PyGEHIrOfw/U40
	WTFTIgxbc8I5gTkf1znhAyzipdBmzkm7BLCZU7Ia17gpDq1fNX6w4hi1sYq5oZ9v
	KAUY4EIkc50QyzENxOJHqGuS6l2TtX1xyT3cV78jFcQDmfwZp3xLeKdfCahJ66bS
	7H5J1I0SB56FwdK3be11GexQ0N09AhnbXOQzzMKxYEXg/gYIiK1UHUkHJsZJKAfR
	fXSWl11t9AWcz+AFXpXbPwjhmLe9PMk4oZfwdOoUzxyh7R0T32up9wAZl2sKDd39
	2mgbVg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pgpc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 16:57:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88883a2cabbso146950366d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 22 Dec 2025 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766422668; x=1767027468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ0a5V29viz7LLXs2uuLzoheftdEXYHQbwbfYUs9794=;
        b=D2GlJsNKYSJF+cod5Tv1GIH1IG0NGD31SmPQ01Q1axPdEx/e/tT4qG1XDfcWHn8frO
         2meUCc7XyxLzVjqeAlTn/uDvkfLFIHB3FYfXi01xDuQARWWNFKK8FG+AqQhoI/kTmdz5
         cwAHf3GlBprrepxdOTn7ePiQIiONwCohTZKrv73AmlfnYyNjKbO5UyccYiF6MB0Vv31y
         KK8IHdyZrEzeIMhnlTd0kHV/GV+VW0i+fJvv3Imf98ONSMamH8bGqCVGy9nWyOczH8SP
         hKIAtVGOJ4fEoCeP1zehLMTyHXGdHbnZ7u08PE/iO8xJK1P1tO4l/qCy0vhqAZIvNmHP
         gM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422668; x=1767027468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UJ0a5V29viz7LLXs2uuLzoheftdEXYHQbwbfYUs9794=;
        b=w3t9h1p/BH4u8UyPRvxUYs5it/Nn0Fzu9DgXNJB3hqaWC3apx5OyPyX5QQeLW/R0ck
         oA+7oQVnjVhIt4IU6MOu4dS6+z3NbA9MFwdNiS4TmVCp97W1slmYVXTfY7iOI1hbMGq8
         75Pi5nLGMRjx5n4czZi2JtcOngiqDTeo3+WXSrCRvyNRV/f/sc6jA3ZX4np6e5SmZJK1
         OAZXvzcss9lsHL8o7N9b5OE9xmKBNLBfh9fhm5KxPqkPykiOhKJ+sunsTD6MGs8xQ0be
         q3UisEh5T7xk/ud3MJy7p6SisrQU0KPkpGkU32xCpnFBuAu+O4m7totVySECH7JEglhE
         4jVg==
X-Forwarded-Encrypted: i=1; AJvYcCUW2cgcnWowIc4qpfa5C1UJiXRfCZIlzIF9lv8XORgzKty/CuQ6DRD7AKQqks1agQoLlARe9k2xCRWz@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTY6ge4+cBbsLZne/rLKaDgqo/Xk1TMw+pI8dm/VCje9uoCSv
	Mnrubh8i8V4mOD/bKH7iT6cOQSAD8Vcli3NLX/vWujv53QV+pB9DS8/M2zCJc02R4OZCul+xuve
	3Nt1m/NJ7zMZQFy+f826ZcA9zeKzsjwtf1IcaBOJqM1KAUoPO2Fugj4IvWac4aasY
X-Gm-Gg: AY/fxX5QePrQWrIG1P2+9TfSk34PyYk604YnjgzhjUhEpofNis6X75wdF1EXHC+mskD
	Jaw/sJ+1raDKlmm38UgZoKBxMsqsw0UCkV5HU7mOPUA/rqLpMXvCH5etUW8XALcvEhbnCymJzYw
	ud8Jc449ztDxjFQ2BXqqP3srFsKV7FbyrOe1kmLgJiF9sFmV6I5e3Ux8ysUxRsoaSdj6KimZ9aZ
	Wqun5QnC7knTOTyqixjBEQVNuJG/eQLDEhG7CW+ChlWmG28XqHrcIEcZcDiesHZ7XIrhVgbloUS
	15K65oRp0KocOCpiBNCifc3qShXV9B4ZushUM/bvwDLWfQqcrtgHk5h5mXXjh4UL4yQWOVUCYxV
	YKkGu1zlnwKJIaAxRXN589Jh4VXOwOl4+pRzYek8=
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f4abcb5a4dmr178429361cf.4.1766422667661;
        Mon, 22 Dec 2025 08:57:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWZF599NsIynd91SWFwhgXiDj4KAvOYt3rbwctNuUe4W1B3LixKxYkgSgS3/cdAjsy77Bt2g==
X-Received: by 2002:ac8:5812:0:b0:4ee:19d6:fadd with SMTP id d75a77b69052e-4f4abcb5a4dmr178429141cf.4.1766422667183;
        Mon, 22 Dec 2025 08:57:47 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:3452:ec03:2e24:c9a9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193621c8sm197464795e9.7.2025.12.22.08.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:57:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 0/3] gpio: Simplify with device_get_match_data()
Date: Mon, 22 Dec 2025 17:57:44 +0100
Message-ID: <176642266266.42223.9755579914845515277.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
References: <20251219-gpio-of-match-v3-0-6b84194a02a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1NSBTYWx0ZWRfX0mcihQpOdTwr
 tSbSCDRPOF8xFajG0gWhFKT1SEATfdsWishMTxVtW5IoLjGdsEaPRkqado7koUl5Q+BbOStl8Od
 IWHL4rT36VOoPTKi7aHwp1Fx3rmOlCEgaViujg/8jJe/HXcZHUqp+08dX0nKOsbIDsZcZqxtN/O
 9GscyDV8xsIWCUX6pJCfkTeDyG4OdxkKNBMFPogX9RvYEYf2GxADSxzoUVrLlxG9QeNPytoapkT
 DOor/c+911VN2ENORVNULAxjkyZ0VqSImoKeorHw41rPnUKEWFdcjcq6sMqZJ0bsc24k8bIMz5F
 tFCw+vFMzZa8Xcie9am2M+vzCfXEaTPK5+iAo6pNOW759FeR8InNue5YkcllUNQDOE2Q6jZGE/8
 ycXDizhvGI0fcOfEJAkj8S3Vs2LdwheDDBxQJe23zAgBYkA+9ZKsZLVbB0UWJdsZwn2Mfv+aYj5
 8BdwTIvVayKRzGnOFGg==
X-Proofpoint-ORIG-GUID: 5o6v9PSWyV4bJKCUDoXg_uPxFT5dufdV
X-Proofpoint-GUID: 5o6v9PSWyV4bJKCUDoXg_uPxFT5dufdV
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=6949788c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=BSbm5AsyGp5ZQscXBokA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220155


On Fri, 19 Dec 2025 13:13:11 +0100, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Fix subjects and commit msg -> device_get_match_data
> - Patch #3: Use dev_err_probe
> - Link to v2: https://patch.msgid.link/20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com
> 
> Changes in v2:
> - Drop applied patch
> - Use device_get_match_data() as suggested by Bartosz
> - Link to v1: https://patch.msgid.link/20251106-gpio-of-match-v1-0-50c7115a045e@linaro.org
> 
> [...]

Applied, thanks!

[1/3] gpio: aspeed: Simplify with device_get_match_data()
      commit: cecf10b700e06a2f2e2b638b1f680e1ae7f343ac
[2/3] gpio: creg-snps: Simplify with device_get_match_data()
      commit: da7c18a457c7a32c4ed1e1e326837d9d7cb4483c
[3/3] gpio: zynq: Simplify with device_get_match_data()
      commit: 48befae0d6eee275c3e30d1cd45f39d6ba011e19

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

