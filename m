Return-Path: <linux-gpio+bounces-29736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 164D2CCB684
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 11:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7404330CA0AB
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 10:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B06033DEDD;
	Thu, 18 Dec 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YrQfYA14";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="joobypOh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7EF33DEE3
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053799; cv=none; b=E+MXnnFCgNfR92T0rN3a8xL1BbqFXyIuo7CORFpxDkBEQCmBqEptvyXmh/p2swhpLaY3Sx1qaMTnUud28vTgniSxU8PJSn0zh1WA5z60Pj6zR41ln12V4MRjDAp144sh6v0GwW89OBdoLzkmpyulQLXSLywUl45/0YhZt17wpIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053799; c=relaxed/simple;
	bh=iYdfC9CAkfXkJkV2h7RmKHf/s3154g2d54zaobngEV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cC5QnhZtJo4F9tUVG39GEGrDWjjnm1ZUK6a+sfIf5n/+OWouRyUJQe1nUF0coppt1Lh9sINleZ5dRAWFNzj3pQnvWs9JjIYRVp+3O6BkYSnUADKDE3j9Bd4wErW2I/fIa3pZlR0GURx4jr5rmQ96f+Ps3SCU5t6uuoG/SVq+kwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YrQfYA14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=joobypOh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI946Pe237698
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUy1KLOdLXCbZRjp9oLI7ObwJyzRZXx6rAcW2KvuasE=; b=YrQfYA149nEMiWNT
	zjo70azYyd14Z5TXgcZZjI9M5sxGa1ZOVrfPRDwEC2BqMBE36/aJrm+prhm9zYWq
	Rhimf3MpI5dEI7ESuJWR+33pHITLS5PhJzd9CyxtISI8XNUViaAQbXu00F9MYvpc
	a6XIpj4CGw1/+MCwiuvJ5fQCZ0s3hMS0Xpiv2udqLdJHbNePKF8vkdqEViUE/E70
	r0TEqT254Q3EIW+v7KSdihCX5cexAqxMiKTnYW9Lpv4UQkbN+u8+4/VMEcAp7scr
	09+XiaTjJLsUCrGj63Bo0wTz8Dg2ziO3s0osdsF8IgOcMErDEC7t5vym8YS0Vdls
	r8wsuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3j1f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 10:29:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee25cd2da3so7909241cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Dec 2025 02:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766053796; x=1766658596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUy1KLOdLXCbZRjp9oLI7ObwJyzRZXx6rAcW2KvuasE=;
        b=joobypOhyRBITi/O5x08JYQzRQwE+FFegcdBdiewC+t3p08nCBCTjHQCmUttrhQozQ
         +acs/hpfp0kQJdblRHlrmkGma+ko8p2ILjqWvWobfDAzAyIw4vYKL00lE2tJsyT9JrtB
         eoFTeR9IctBpFm1Sl7kOtOgonPZzqh/Pa2jpth0rZD+lBN7KaOmi83P0Qj+LHu9hz9jI
         JJF6tnQlUoUTtBkleIBnNqDNJptILXgXEOe/ltFDpmJUMFEYC24UEcQUBKbV/vwx8gxX
         R85ev6IPQqtQYclVxl7YEgdgJAuFn8QyRrggP0/bs9zC6e+hTZshqq3VwWdmOOxqlQIH
         0Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766053796; x=1766658596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUy1KLOdLXCbZRjp9oLI7ObwJyzRZXx6rAcW2KvuasE=;
        b=GySdnwwdeEdB6RZpYzEbSrdwrMiU/CubDRXDsE2dNryydBjlhi0fspMFhuDs+V2mqZ
         iLI9rdU7YiI3UAXqjcNliNX/PTfXmOFf/SXFZKGksy0t0OLJkIPruasI1NHPy1xbiapQ
         aCwvrLWyCUSP0QozTEEsu4HDF5Ytf4UD1h1udkiFWTMX12r8wmsYOZB1pAXdQF1NHVTy
         1BS2uQ5Djhjw2ACGwkztJl8yzHOWuYU7Jx/W/SevDf1h6lnITkXTlWj0tyHy7u0wzhtR
         YGLfreEu7Kp6O4Ae1qM4CW7WqC9dbkiSAT/yEy3JmVHiwVhQ5Yd++EaSjTLjG+7fn/bw
         iwCg==
X-Gm-Message-State: AOJu0YxxC97g5IfJoci72eFYqFsxrlKjx62Zjc9JnZHUJivd5pvWMbDw
	uCFN8gWqek3fR+k/+qImDoAm/fvXG30KktkA7OQ8VuWAskD90+LkSQBn3GnsJpOAKY/BFxyITnn
	vnS7M3WNcL+5eHo+WChnsHe59HD7ryxz5GF/p5vxSY/syE7LBJRJv2lII7lQn37xq
X-Gm-Gg: AY/fxX7dkqBbk8SlbDOlnbNwsEj99T8ON0Rd8Y+CiDYfcxifXd1f+4NHc2N8knNlGsv
	hxCHgQ8sFWnS8urHDJOet8zVmM6ZBvnUrfUk0AVvxTASYsMgqUxvDLwhfcX/KIvA2Cv8kTLLlva
	uv2bI1N3V1NXzI5MsiaHPmdmmp350Zx/Wf028SAwpouRLDmm6JDyoCKhkxpwuaPRFHzYFYXvxP/
	Cgl+O7Xgr9Tv7Wbgj1hMa9QT9E86/vJGHLiMBpdumGcfBYkJNw8VCV7/pADCGVzbajKPbQXQwSg
	9i+lUkZsPYw+bk8Fg7sBxFqhKzqoutl6l63TqHBh56eMdtTQlXk9AycVJaYnO+HyIfSwjfGpqHk
	IkCrRWZ/hHB+Gl6pTYqpgJkqP76ojhFG14hdb6Q==
X-Received: by 2002:a05:622a:5e11:b0:4ed:df09:a6a6 with SMTP id d75a77b69052e-4f1d04b1dffmr282094291cf.25.1766053796140;
        Thu, 18 Dec 2025 02:29:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWBQPgK3ZgzoKyCX6LqM0fYutT2XJSOynhqEkV++CpKSw/dRVEbDl214z5abvn4EJu5yPgAA==
X-Received: by 2002:a05:622a:5e11:b0:4ed:df09:a6a6 with SMTP id d75a77b69052e-4f1d04b1dffmr282094111cf.25.1766053795713;
        Thu, 18 Dec 2025 02:29:55 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f231:224c:1d69:c0c1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244934b74sm4211894f8f.4.2025.12.18.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:29:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Gibson <daniel@gibson.sh>
Subject: Re: [PATCH v2] gpio: it87: balance superio enter/exit calls in error path
Date: Thu, 18 Dec 2025 11:29:52 +0100
Message-ID: <176605379017.37016.2197520310748254432.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210055026.23146-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20251210055026.23146-1-bartosz.golaszewski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4NSBTYWx0ZWRfX7zPj2sZylKRs
 zL0e2SBRaCuPS1XDoxnjFCwg8HSfyylWPqXEhDllHttx67mxYFFUzEYk0wD/egRXf6TmTzqQgm9
 asc+KXXXK7yCR/AEiT4Q4gZ+ozfGb4GXZboTFnLW/hm77MP7XviRg+ZDiOE/lNBsKx599CA0Qq5
 OesPgPKgshwi/dQkMtNz6kj0/fdgNsKq9eKx9Lhl9HC7LzgfMjnx8aRffTW6rt9L/F0UB7UR8s9
 qeBLBOB0MbxIdptFIGWGW82CXs9A7nw2/DwlEHZpegR9V0hmamoU0B52VLPqYb9u1IrYxxML9LC
 ORO7ts2SHTLJAYB/PB7I/fFem7KNwplJ7RPIEqkYGrbrAjUeJCMdqjvLMDeFI0ev1MXa0rpVjNO
 3/L8X/4rVrajO+2ai3RUiQVLZwL7oQ==
X-Proofpoint-GUID: 4D84LCT67i_Z9g58q_RerRulrka_9OqI
X-Proofpoint-ORIG-GUID: 4D84LCT67i_Z9g58q_RerRulrka_9OqI
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943d7a4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=MXvQDq4xZDojel53yV8A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180085


On Wed, 10 Dec 2025 06:50:26 +0100, Bartosz Golaszewski wrote:
> We always call superio_enter() in it87_gpio_direction_out() but only
> call superio_exit() if the call to it87_gpio_set() succeeds. Move the
> label to balance the calls in error path as well.
> 
> 

Applied, thanks!

[1/1] gpio: it87: balance superio enter/exit calls in error path
      commit: a05543d6b05ba998fdbb4b383319ae5121bb7407

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

