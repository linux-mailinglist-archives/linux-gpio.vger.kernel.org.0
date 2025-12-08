Return-Path: <linux-gpio+bounces-29356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06197CAC086
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Dec 2025 05:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E79D8301791B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Dec 2025 04:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16A1216DC28;
	Mon,  8 Dec 2025 04:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PodwijK6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jC5AhOmJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F2018C2C
	for <linux-gpio@vger.kernel.org>; Mon,  8 Dec 2025 04:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765169192; cv=none; b=n3cTa192kRn6WAe6jlnI+SE73pR+aKhnWGke2ZpSznjNhrz5WkFp9FTlAK4gisCC6zNFXyU8H8nZKqQ0dzQbMaVweC8z9LIWt7b61esmKiYlX3l+/Br7LfB8VgBW+RzJovkWHuVPeuwkM3oJdcJOlFTRbN8U4p+GvLJA0PQr6VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765169192; c=relaxed/simple;
	bh=JzqyOmm9VLmUUGX3VI8ZodBAS9jZGkwsN+pnXgKJ77g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oQY6qzB1VMYf4J6ntgYS8S+NoM1zcSlgPPKI8xdc6a3bxqrKYr87dClgcj27OpzszoA/tdTAoRuzse/h+pQL/jw0CbVl6YKcngyUe9yT/85NV5hallbPIPcfK+rKvGk2uTtyY/mcj+o6Dl96LFHvXtzqyfRXY6MB0b2F1v/M6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PodwijK6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jC5AhOmJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7MiYZ03453547
	for <linux-gpio@vger.kernel.org>; Mon, 8 Dec 2025 04:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p4KkJpMgIhYUsI7fBn0bWqJ3IS1cOfKstxEaPVskBgg=; b=PodwijK6PbXkrjMl
	xhkWm8YmygrdCXau39R5eVFeC3AR+1icMv+TvHeJ9tZzlaxjEVGOQhyxIZa4CGJc
	/EhhEyyE0dyDOQYPiBg4XdwEmRT12CyHTOFOjb0tF0/7aqrG3AEwtqTt0nrf4s4Z
	oVKgoZlnxJ3WKmT7PFMpAxmeBPaLIH1ocRkuf1OW1jh7SET+MWZEKvgDGzzRMQZe
	fR2r8kI7Y3GogNwPlAVIWcdLBavTweP1omzgnm9Nb7/LrO/wiVPcV069SYODNteC
	4KUcfr41UW/JdmboOvRI/Vk9m4+Qk5zJFz6vO0XaxZE+3PuxtHSRmyX5v/pt4MXw
	6amhpQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av9upuvsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 08 Dec 2025 04:46:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9208e1976so7499432b3a.1
        for <linux-gpio@vger.kernel.org>; Sun, 07 Dec 2025 20:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765169189; x=1765773989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4KkJpMgIhYUsI7fBn0bWqJ3IS1cOfKstxEaPVskBgg=;
        b=jC5AhOmJkF70Zufvz28nxZq2v7bRHpwoeKlFqGdmSk6VMWLMGpv3gKUXvhIAhclTT7
         nwNMaoHz9OpG5IZtX3HxZpM2m4oEi0h6/PNKOJrv213H4ToG0e6ZgT+OMuB3ZlwrfRHP
         cWFQz8KemRNz2X9FzNXOFOHAgErdoAgD3+rqdfljDdUwIoGhVUPyxT0H4BfQvAWlj5MB
         69bfYAeLIrz90zapsR28wcTI+ZZkGYgnxtSqFUpfOc8em7uQN1agJ6DR8qqnP9KLk7+g
         he79OTqytQYDGbGM2waeYEDBYuJCLTbAEPCnfJm+ZvdAwggScTl7uwAWKmFs6Hz48fOA
         sE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765169189; x=1765773989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4KkJpMgIhYUsI7fBn0bWqJ3IS1cOfKstxEaPVskBgg=;
        b=k5zZvtG2Ir8NF3D7bzr2LbwFF1JgvLUKTcAyKU12OTzk0dCm1tWyxBbqWw0831akx3
         OshbpJvQWUUstJAGMzAl3F5RGAH5J/oMM+6zlvxsmFdG1B0eW94PP7N8pstfJ7NYFbgd
         ruZUTgBkkslUftPr6r79m2bKxsIr+tmAbSBVXn6GiFZx2R2Y5B1B6254hejNj0TIP93q
         jDstjP7JROZfVOjodB13CclYy/1535vfkyUXbFW6bIEB/oymBCzNYL8Aeai5QoFII9bI
         ygopzQ8J5mV0SrHqaRIMdx0Mmq35UIpZuImvrpW3AkpAqP+/FLMIl8t5/CuxgaTXDHVH
         Lp4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWj4PhmHnOzW/oKNPTvFrcaRSjmoRew1d1raaA6zIVLSvbCp9aEvkBTuLieOQWf3pb0NSEW0zFJS8a2@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmELxKn4QTSzj40MoOR+g+jBITdXRFCUnlYPhElX8Mk79BPew
	oZuFO3flqqgkYSnUmK46SglDkmS5c5OWj34eg44r8UrQA4nOrMiyFgNN5JDOGjclj+elIqC9F4x
	uhPT8r4NssJnASwXW28YB76D/W6/v6SegQvK4/b4tPSOPK+8A59GuaNnYRgZrjLmjlOhdzYlC
X-Gm-Gg: ASbGncvLnW+DYn50mDXpOJUEV7RXSDxCLCsWeCFYHUORyjx1r7r9g2EI07sXIi+1vpD
	FhYwmUtVhrcsWCgHNPhA3yGWhfMK1jvsaVbsW3X8tsjKTxMweHlJkZBc0SrqeBFL48pn1WIt9QD
	fN/D7/2DFp2cCkKHOVUhh6eoCIPGc0w79QZaC3LseTLsL3fNQkzMZAY9ZUXjABJdxMNO/EjMT6Y
	dl0uY/q28/L39GNIDb3P81tQ9gYZJJhVzbB5JRs2KOh2wudK8mBhjbO9xMY7U645qHI44ItUu8V
	DlcaQYF8W9KC7InQsHcvlNoR46Wl86EOxSpykSSSTQUnpntzgiXHrSNOU+q+EABfvHR3IPefnFq
	/l+ToyRKu5KWJ/TwdRE2S/uASnHmLrzXUtpdxjOsKU8iKqm59TBrUa0mIec5ZAa0e
X-Received: by 2002:a05:6a00:4fcf:b0:7e8:4398:b361 with SMTP id d2e1a72fcca58-7e8c58083fcmr6185153b3a.52.1765169189023;
        Sun, 07 Dec 2025 20:46:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWfbkpsiXtca8efRYKsZoQOahXUVnyACIWC1QXgJSv3ERx/JObvGwIdQQWJzPbodMInGvykA==
X-Received: by 2002:a05:6a00:4fcf:b0:7e8:4398:b361 with SMTP id d2e1a72fcca58-7e8c58083fcmr6185125b3a.52.1765169188547;
        Sun, 07 Dec 2025 20:46:28 -0800 (PST)
Received: from brgl-uxlite (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e7ecb848c8sm6946363b3a.9.2025.12.07.20.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 20:46:28 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Askar Safin <safinaskar@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        regressions@lists.linux.dev, Dell.Client.Kernel@dell.com,
        Mario Limonciello <superm1@kernel.org>, patches@lists.linux.dev
Subject: Re: [PATCH v2 0/1] gpiolib: acpi: Add quirk for Dell Precision 7780
Date: Mon,  8 Dec 2025 05:46:22 +0100
Message-ID: <176516917960.5997.17063555343335373771.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251206180414.3183334-1-safinaskar@gmail.com>
References: <20251206180414.3183334-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UhkejWTHQuLiYXxgcxCiO1EgxgMxRNi9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDAzOCBTYWx0ZWRfX6azmdqzPI7XN
 Y7jyNNC01rLlz8pD8JUh+yTStbtqsImgEwaj4twwwUDka3y1fkuizjhoVtBpeLJEfN9zdpACQoV
 G2DKDk8H1FoHMNakrhBGfkG5ZxxdlBjE+odZaNnPobgOW9+18tKV1Uw8tz46HcZs3XR4lez+nce
 1Sh+6MA3E4R7UP67PDyy+GGz42DxqT1ZfhiMNgnKtBZ/Jdgw1DbuW6FXewnWtYx72cwN5BZ4MHM
 zYow1jIYfU9zUNt/5MRKgUhks7M7use1pDgNa81zrC2CR367hXbtPEqsW065I4fzosUTbDslx9Z
 VudeQ7Sys0o1dKlJGYqIoGOMFUrkknduAGJT3i0Vqik6aIB34gRfYZTcNC3HIaYmvzc20kCDTCo
 yJxVdX2TNg3RTowd1TNpjPcOSl61dA==
X-Proofpoint-ORIG-GUID: UhkejWTHQuLiYXxgcxCiO1EgxgMxRNi9
X-Authority-Analysis: v=2.4 cv=NsHcssdJ c=1 sm=1 tr=0 ts=69365826 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Nf9rhHLrmwYAc+0rcD8p1Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=hdBtpZ1KiD_UCRkxjxQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080038


On Sat, 06 Dec 2025 18:04:12 +0000, Askar Safin wrote:
> v1: https://lore.kernel.org/linux-patches/20251205230724.2374682-1-safinaskar@gmail.com/
> 
> v1 -> v2 changes: changed tags
> 
> Askar Safin (1):
>   gpiolib: acpi: Add quirk for Dell Precision 7780
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Add quirk for Dell Precision 7780
      https://git.kernel.org/brgl/linux/c/2d967310c49ed93ac11cef408a55ddf15c3dd52e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

