Return-Path: <linux-gpio+bounces-29672-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53558CC6C24
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 10:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF48F300AC40
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 09:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA79335571;
	Wed, 17 Dec 2025 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUrLQb+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kch0Eu5R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70793331232
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963034; cv=none; b=YJyTud0qepX/ZzXfT3/PiUSWQpU/VWppO4Xe/QW86ERCTeLGgh/cpFaWhMXN8pom12TC+RhbscLEQ+Y20LXFkhDLC/FFOLAeBRcp4N8ZYHYfBCef4HQnvBfUFuDMCVZ2awbWgLt78LjPyq4RIZ9yOh7Bj8xLKWS7RIOzP4kLsKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963034; c=relaxed/simple;
	bh=IYSNBQ+I98kA5nZ7z+3AinDVFjfdalkBmAaO6ENmHYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DHMUJlFvrTiIshjKLdbeoLXqDsanfXGYFU8qaND81Y6JlWb4RD4Q0JHrQs1eLGtZ6pLwV38WCL7NjkZOE7R4uw1gVHX+q8bQtQT/loubWZ0v/Xcst0UAriwDf7PjjHaJv8H0Z5VRen/8ien2bQDBFXyKbaSQqyiw0+L3usR/7uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUrLQb+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kch0Eu5R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F1nt1500919
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bTsvtYExKuX/aa2/hto0dFXQutczH+BdNd+9KAqPMCw=; b=NUrLQb+IjDexB1th
	8u2UDO1wLPsUzsIjK/x37pI0OK5v9xry3gEuIpsO6DcihgZmOExxVZZ8vXmGCbxw
	35XjR6KWq3xM0UAODJB5H+ClfladMwhEf2NQnxhNXmRbuwWQ9qIehTeI6ov8Hzwk
	GJsCRLlbk/ehx48wkEf8i1tTmYmPXuKvwFfMVYmbm3tb49xSjBqtPalNaw3f0MU7
	1IvNx3p5Y/4dR2AjkPoOMNBtD+u0mbE877Mp2C5eWYLJiKqhsvdFJZeiTPQdDqah
	EmiuG/gAlzcdZZEeDqeF3xyFFSUjzlJgRpwhkioH0B2tMTVgHTVxr1fWmMY7rkGy
	NiHtMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkes6eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 09:17:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0193a239so57045691cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 01:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963030; x=1766567830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTsvtYExKuX/aa2/hto0dFXQutczH+BdNd+9KAqPMCw=;
        b=kch0Eu5ROeqSJnYF7qjRqNdxhvk8W9SuWi25H1HmVse5TpymkC/w5VubVJ1UfF5X3i
         RfP6AbRVNomlXFz1Arkak0ALnb06u6kT1Dp4v3Wbahw/dXUhzlG3Ah9v1JewqeYBbj02
         AEYQTkAyvUFMDs96rbfCUVY0Z2oaw+0IlvPfEdeVovKNJ+MXRVgS7zSlLLiKPyCusRrf
         y5k/F5LRIKSt5DCaP9lK7pczJaGSzsbJtYCz7RR8cOSRYTZpPsg9Mo6sTlLNJXUnMyjI
         Lqht/Cbfp3ukbrJeuWoXLgrsIPVqmvc6pyJ+hGkS/KG8qkjuqXWDkUCM9q2vk5wGSUEc
         G6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963030; x=1766567830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bTsvtYExKuX/aa2/hto0dFXQutczH+BdNd+9KAqPMCw=;
        b=ULjB4qsq5D6jKxfj5KqPXIcB4tG18iOn2O+nmfHsGmjOw2WyeMdEwL0uQev0LiASDJ
         0UOTF4WpkN77iyx/8/vQPi2JFOiFYrBt43OT50lqRlM+K3dHr0CbRFLglfimQeW/n/8W
         ZiiNdPZrT9udTmPVBJZow+Zcd1bQi1eprVRfoOlAQvl8vDWsHXe+roXCXN/RGL610h2H
         hrsVP9DCqUijib3hUxdaBxNQcbnNbfegr8uJ6qCkNwtE6sRs/m4nBt6oE1K91T5oo/c1
         qeIGYLpT1SaHvjsdYylG0WRIdXPbsrBiwg7CWk9mKno3Rm5gNqYqrT/S2FnY0o8ScSO2
         LAlA==
X-Forwarded-Encrypted: i=1; AJvYcCXfNjGv8xsmcYV6KXzUMxO6QYoXNGK3jIal1Di4RTbH3N5GcGuqc5lvyuS5MQn+ISy95ZqcNRdDbW+B@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWEc88ZPYIMmDoVW76pU3Fr1GXDXfavkox/9+RNJGQ7VOHJYE
	b13wLvoL1f1QkEJSQSIaeThf6zqGG1KEEkIAGicIfEHd81iVNaok0lkfP1gpXObxmdY3ljiefrW
	m0mARo+V4ZtVfsxRRdyDI4iThYtTDDQcUjQA6sXtSZywd6/2aEtZwIO965xW29MWA
X-Gm-Gg: AY/fxX5sE8gcMjvATz6TyyXd2069++YY9pShPieCdbiYqEYNV5iURWvu+Ai/5PdlHaG
	TLT1Ce3J7arKfuiUvP+/+IdI1wRFjRTqFSg4Y9EGi38ieomznGhVDRSVuNaiRt1qqz3JJ8PYVym
	5Ik4Z10i5/gJM22D8ddsuma3wHEmWi1JnrGvr4kMqDXuL1jK3npKqH2ey1vUSDnyEzgqCYP0M93
	XjZ59g2TTb3o9AViM4k/XkA8oN1/srp+JwdPHB3OjFGO+fDPkueeekYz0iJ4k0M+RNDCjCH6m5Q
	+q1lqLkEVaCJs+qanCR18wEbI2qL85lHejTBvZpCbj7X1EGbYUOH9ZlnwZR9UybB7xjooYdmArz
	nBtFax1+dV7qW+2CWG2s0sLinNKRcxLP+jzE=
X-Received: by 2002:a05:622a:1983:b0:4f1:ba01:910c with SMTP id d75a77b69052e-4f1d04ac62bmr234074931cf.7.1765963029876;
        Wed, 17 Dec 2025 01:17:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEmb9hA1AspVDA9vYhNFAdjaOaoZeyT/O2PJh9nIJmvzIgKk1fAjG1kIBGZn3cWv2htHJRkQ==
X-Received: by 2002:a05:622a:1983:b0:4f1:ba01:910c with SMTP id d75a77b69052e-4f1d04ac62bmr234074731cf.7.1765963029340;
        Wed, 17 Dec 2025 01:17:09 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:594b:272:c2fd:21e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ade81absm3672811f8f.21.2025.12.17.01.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:17:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: stub: Drop empty probe function
Date: Wed, 17 Dec 2025 10:17:02 +0100
Message-ID: <176596291542.6396.2884392914865706033.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210070255.484169-2-u.kleine-koenig@baylibre.com>
References: <20251210070255.484169-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3MyBTYWx0ZWRfXzLLoEHrVpIHz
 pk6m7fjbG06/Sd9Nj9QwFvWgGWy02QGyHORQh42LcyBULGrHBnltneuFqNcX97oooltx9UIizHs
 Uk4xBvZXBr1TTcdqlr+VKEWMeyILhQcZj78mPuwsmlqs+yCaY7JwQLBHHjySkrN4jS0NfDZ1Zr5
 hzGYnbdJry3xeHkHaPut771Sbpj0IrPl25SNn1LdgHYUO0ptcJbcrZTlB8p3c3cxBC82p8LmM4t
 IBnVuxw9Dpv1S0nQvDT6Zp5vWuXzYspanq2oQdC0ffuz7wS8GysSCX+GpCdKlIiTees2oeholPW
 6W1cWY4/yu1c9EFIQd7vF5cKtXfQYAartK1Zr+blE2U+AeG7fGRWomboGyE4vz6LRzzySwh0l+O
 EnBChYUz5VrTD+HAfjtJ3tAlT3DbQg==
X-Proofpoint-GUID: PcF0cxR8cAi2n4h7O_G4ZgS4XykmJ9FF
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=69427516 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fmPoOF3Xrf64i7r0W1MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: PcF0cxR8cAi2n4h7O_G4ZgS4XykmJ9FF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170073


On Wed, 10 Dec 2025 08:02:53 +0100, Uwe Kleine-König wrote:
> A probe callback that just returns 0 does the same as not having a probe
> callback at all. So gpio_stub_drv_probe() can be dropped without side
> effects.
> 
> 

Saravana is still MIA but the patch looks good and works fine so picking it up.

[1/1] gpio: stub: Drop empty probe function
      commit: 30eb99dfd3439f25d0f79815f7f859da03fc8fff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

