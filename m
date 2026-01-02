Return-Path: <linux-gpio+bounces-30047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44452CEE121
	for <lists+linux-gpio@lfdr.de>; Fri, 02 Jan 2026 10:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C96E3007973
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jan 2026 09:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2572C08C5;
	Fri,  2 Jan 2026 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rbpd4Rxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gElH+kAO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944092C0278
	for <linux-gpio@vger.kernel.org>; Fri,  2 Jan 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767346685; cv=none; b=YX/9DjBAJul0lFIj3nuc8o/hAnTZxu1TBCg+SKxpXy5i/EkgTs6YnZvBT8/LEswrzciEnlsk80u9Ggxji7dHdWlDdAVjZ5iNPn3f2R7zC4JHkC5MnDakBzMkCuOkuX6bQA5kZykVfEKKh7IfuTSWPym4c8hgPciFT3aDNJ6ru4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767346685; c=relaxed/simple;
	bh=LmTb8kqPU3ziU9NB+3Lq328FW6+JIWjt/CbJWf3H7iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IkH4c6u/BL+rI2BTJk4SmpS4fU+lZuj+86JIA4xr206c6b31avDcjUgK926BURhy0cN68HwE8wYaQmaraC0wQBs24MuYSGqmB+CfeemgX/7GuH7OvliOIEZTKgoYxu49fXsWZ2RT8cptwU29lmnml3WIwg97Ii2SHJamt/CV5Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rbpd4Rxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gElH+kAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W1s3504639
	for <linux-gpio@vger.kernel.org>; Fri, 2 Jan 2026 09:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w2M7G3fKmySFxyYyG2fuCGlckK5Pa6EbmBuHzfuouAw=; b=Rbpd4Rxv0x5uu4Ve
	LLiFqIkrqvopnWVsARh6G9tYWTDTwUi3I9iP9Z1XMAn6g8HONnE1Mmq+CMPbTTMT
	+7lZxf1hfXqkvQyPsy/gXIV/HyG3As9mu6OJeKPrWZ2NuONvVd2P2vO1Sykv1tpK
	7xbxlZebVAbLvHN8S8Px65PkRRfC3MMAjmbF55l5wcgp7T0r67HjJhLIPXfRsRlc
	nic2GJOtn+7ONrKE9WtpQuEyBMcB2c9aEU+YC9Md984o6GaptE5jxKVPWM3OIxUs
	l7BHXnbE8OpZT6XDweIahLpEAx6Ytcu/cnwzPi7i3jEeHNYOlDuX7NfnBah1pRX7
	VpKJYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8cmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 09:38:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso369151521cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jan 2026 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767346680; x=1767951480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2M7G3fKmySFxyYyG2fuCGlckK5Pa6EbmBuHzfuouAw=;
        b=gElH+kAO0Gt5ar0m4m/XOYLeJTiN6q3YUSKoLkyiMdT8F4VcArl4dN7QsSZX3RijEG
         pjULwrwdWREwBDjW/ETTjUAa9q1dGMnhRzWqsvkvQ8DMqmXSsZaHAUMt+sNs17Ve90p0
         Y2BUGbYOE2MGB87wF+BRdyyUxqCJBTZ/NLgYu/Ps2cs7QzXgJJ7x8nFLZgTbvizAsH4I
         kikCLhKqqc+47pw2OFlrOqvS5yuWB1JDQkP6+TvtN8tpW3PFAPut3rVv+vnupV88Tyfi
         1jyAb0dwvPAFteQ7Bt9ofkrOlq4VPEqv2QPJD5zwP5zlCJMgD1YoGa6hyhROYf/4l+Lx
         bAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767346680; x=1767951480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w2M7G3fKmySFxyYyG2fuCGlckK5Pa6EbmBuHzfuouAw=;
        b=sx1b99AD0TJivcbOlWmtHggAw0nCPw/Vnt2VydJRWTEh3W4UMRPquaLJHBaWhB6lBE
         8erZ42T7jzXGK9FDU5Iz2oBjE5KTblufB34l9yb15qKWTRijYjWpIc7FqKLHcpXb3RK1
         ANKciIcx7byjrW9bzjz8pEi0Q24Tc4JCdPIXRMQEfCwA122hVC+Xj0s2n/9FwB+sO9aV
         vbYJQAMRxfrG3qFdD+1WXOKOuBEENH/fyIunlBO78JKk0FtsWeo5Yk37zxGdGVWRJjI/
         cHq/6sBiJA4H/BdE9pWZWRHUBejZ+zgkAvUY+X1ubi3YoTQDTTls1yTAj/psuiWfxOHy
         9wZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOpB/82UayCNAW5oOlPIbQUcplP+aL+oVfTg9BvSecpEzgSdtfmBNT/JGQDVvRCHyfvUBZzoAehi6R@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0YAAS0ZloFHxRuGOL6CY0JEnF9PEhQg82Yns9+V1LzYWlJhi
	MOlqyh4qU3nl9fp9KKsente6oFHwIuB2M9ILKSs/99wheTRUO/Jn67QO1xSNLC9v+GUSsUIe1bk
	gbBHig8yrYDZ+2wWueq566rzAzCjEi8pkTcT3YEzTWLZSDwSkK3zf4/nMkF9se+lB
X-Gm-Gg: AY/fxX4jV8aTTWRgsO2LUGHgedz5hRaRrj2JtUX3fHKdxKS40tIWv9GOkvVmLC0u6bO
	EREABj7S0iw64MTOr7bBnEBQtqXYfzkVJcEwMPXumWUN0vR5QaJGbeu0d0l8/E1sTAKg33rYlYx
	7gKNUCEVPy5oGqCUZQXYNEYUxvA8JOdNJQUVUoV3r78X+7Mt995kzPUUQ9XS+iCWhjtCZPz8b7J
	Gt/5ZixtQOmwWxzdFX5UjJ0vzA/LDQn679ILwUEAKMuR8AFU+U9aMfyPhh5H/aYtRnemExhVIZm
	3WRxRLIsunstUAFLgCwQtrkTNMN56zmP59jSVKbxHqaZe1lFYWqs818+Gf/MZYHsYCDhjZhQx6N
	hgxRnWevb8w6xfMLV0gqiaMZpqCMAEvrqDKx/bA==
X-Received: by 2002:ac8:5914:0:b0:4f1:b9ec:f6a4 with SMTP id d75a77b69052e-4f4abceebf3mr745777721cf.33.1767346680606;
        Fri, 02 Jan 2026 01:38:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkqBC6tcq9Z2xccCyVLYOjFkeI9/DB/J8+OmLH27/pCi/Kd0o9m8q18+wSxiQza3O3U0rQ8A==
X-Received: by 2002:ac8:5914:0:b0:4f1:b9ec:f6a4 with SMTP id d75a77b69052e-4f4abceebf3mr745777501cf.33.1767346680248;
        Fri, 02 Jan 2026 01:38:00 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8630:1161:9594:98e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432613f7e6esm74303867f8f.21.2026.01.02.01.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 01:37:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        lakabd <lakabd.work@gmail.com>, Yong Li <yong.b.li@intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] gpio: pca953x: handle short interrupt pulses on PCAL devices
Date: Fri,  2 Jan 2026 10:37:58 +0100
Message-ID: <176734667476.18460.9284868116497170222.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217153050.142057-1-ernestvanhoecke@gmail.com>
References: <20251217153050.142057-1-ernestvanhoecke@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA4NiBTYWx0ZWRfX6j1mqXg3kqel
 awpouJPoepALIWeDXssBHhI9ywNt0ykuNu48mWyIMnAmIgADSh+cHkivn3VK2Y95PQqg3/D4ffS
 G7yjiQdxIeRl6TEKtRRi8uX6X5rjtK+OSLe8J+zQhUHLTDZqxGvF0DlxFdhdXGxpu4LRFThKBhu
 TpqJMSeBCN05He1JHwQD/yGisa5Tn1RqchDZH1jMfRt19iaZysQzQkmmabnLMNVOnzf0joL5/C7
 F9+FneLLzwuBmDJPloucqiTOvWnSdlEGfLylvZdFIhDMPYbg206Q54vlKPq6fNVZ3QKFleEDjVH
 z3xVNdjYFrl/gn7qEQ+T4bXMxiGyUc7SPOH+SCRY8G08T7nCyAAxWorl/ZbPZ/qzQXEPqsL3MM1
 FsU+xBs9sfc4kiOf39ZxS5PaPrbgSCZyPWB5ThOYebZJbl5k+lY6qx/pbcz+5/jG/aB/xYAkTrB
 lAWymCSjvIQaG1qhmcA==
X-Proofpoint-ORIG-GUID: YL6OleBMhS4d4oIlDiPn6WSn4Jy5A890
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=695791f9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=p0qxG79Sqe8R0xYHOMIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: YL6OleBMhS4d4oIlDiPn6WSn4Jy5A890
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020086


On Wed, 17 Dec 2025 16:30:25 +0100, Ernest Van Hoecke wrote:
> GPIO drivers with latch input support may miss short pulses on input
> pins even when input latching is enabled. The generic interrupt logic in
> the pca953x driver reports interrupts by comparing the current input
> value against the previously sampled one and only signals an event when
> a level change is observed between two reads.
> 
> For short pulses, the first edge is captured when the input register is
> read, but if the signal returns to its previous level before the read,
> the second edge is not observed. As a result, successive pulses can
> produce identical input values at read time and no level change is
> detected, causing interrupts to be missed. Below timing diagram shows
> this situation where the top signal is the input pin level and the
> bottom signal indicates the latched value.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: handle short interrupt pulses on PCAL devices
      commit: 014a17deb41201449f76df2b20c857a9c3294a7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

