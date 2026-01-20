Return-Path: <linux-gpio+bounces-30770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C4D3C495
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 11:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1B595CA652
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 09:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8B63BF2E9;
	Tue, 20 Jan 2026 09:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S3ZTfcnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iv+n/Nnh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521DA3446B9
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902708; cv=none; b=bDVFYN0DZe7WK8ESNbS13rBkoYahxufDFpjRRQlyCGZRuWBXdB99FUw+vmNE01ZLCUnCEiIGDm+5qUfWYRyrs531T7a8WXpMelITtMcJ0gxv1dtUDp1NLAAcwGBskF3wsG6GIlF0phHGgVjX4UacRWjzt7RjVKpz3ewg6LMy0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902708; c=relaxed/simple;
	bh=NieccrGv8Y3yAk5L6CmqT7DDABCkciWgrOarVxizrrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fh1S56UTqb/y8US8f+a2lus9Z41d3Na7Flkm6QIRHteHKHqjngfOHAmDUGg1/cX4i/DleOXKxfdGB/U7Xn/mgV4UUCrH5bCPB7qbzIXdbVrpcgDAzXZZS0Z6Nq+ulwIpLg1qp0Mr/GxNStTVq4fz1cfAstKEXQmRarqKyy6mXLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S3ZTfcnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iv+n/Nnh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K8tMQu3366273
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxGvupNp5SjlmR1VpxDaocdnNqxV2zg24D9F7/DU4W4=; b=S3ZTfcnLcbyRor2Z
	rv5b/6uZKanjLL62IfALhbFP04ScBn0OLZKR+dm23KAcaThIqrY71u8jV9HLpEeb
	orZBaUahNv9gOgyZ1zDOoI+TNYbQXfmcGoxTZjkFLgOfyWkhxAWAY9/WzRgu5G5r
	i4mRs5u+kLzvV0Q0fATFaqX9KvdAweIWgNz0QYdamuHXm6G3FnEuvmCchiOip1DL
	vclm8omj5XzWeDrKIptm1ANU63N7QAEEhGLEP0ATB89fYOiuWKslcVySNxsveImq
	QaX9QMrztMSgZq6G7Zr6QpHhYv8ACH7ZnooO/O/hjeRq2eepfSjFt52PB5C36HLW
	8yBXFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb1d58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:51:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb9f029f31so1522409185a.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 01:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768902704; x=1769507504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxGvupNp5SjlmR1VpxDaocdnNqxV2zg24D9F7/DU4W4=;
        b=iv+n/NnhlmxycQjkj5DJCmC1O79eD/GQrGfTeJZyjmWCkONaWYkmMUa5szk0BVM+BH
         1yxr2g19qKrBTLmDN+K6hoxL8rl3yyTMycQ+4qBRIQY76csI5w8I4UFxeFqZWscBEPru
         jeTEkDksoyi7LRR5WDQQQNQ4RGJuttN0PZSB/IUbnEH5kEDLI+4hrWkkAcCwmcky9qeX
         7Ka77AAr+knlglQmocbO45ZtK4r37wUnXmcS1tX22hnHkxvzlqlUMHtVzAjxD5tymv6q
         VTa19wWQDcIDl+/Io+XJm7J26VEW1dbtl9XRo4mfwZNuPEGn5L0UUp5v2oqjiV50hUrp
         5qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902704; x=1769507504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxGvupNp5SjlmR1VpxDaocdnNqxV2zg24D9F7/DU4W4=;
        b=UIcqEOrq66/GQwYNAFHfEsIy0JdEMIP1aD7Vk+j+qXo22l8RMvlzT/9S54cnzBn7vU
         V4rGtvsTu2yfYrRul4nGJ+4zq4LwCfBXrZUNSH7YYEsza9I+9FCtIdhQSo162vThiT24
         a25QGdlPVPcegZZ9S5k65mpl/T5wsgB4cAtKqEtneSqwM4xJJ/kJznDDiNFv/e0VncoF
         oEkRIexGAsqf8XgBafFXh7wiRlT28RAo7x2vruCoOdRRazo+ii6bWax3LchsYaqXASHs
         C58IoKC8WyMZ7Ju1+LA0XA+Y9O+RG+EtPOtYqvgPzza/NE7cRgxNlzQ1mYrme6e6D+Bv
         VD5A==
X-Forwarded-Encrypted: i=1; AJvYcCXW4JsklkqSR9x1BgTOWJSermdUIZxmFqfRbCnXLwp8ddnVwJ3tNDl3aXI/BaYkRsZm3grIIp38Xcz7@vger.kernel.org
X-Gm-Message-State: AOJu0YwlUoZ6yWP5qWinE5s4S7BFB7kIPgnCyTphKCbkUiT2fr1jikLd
	OjBoqRtzDSkYiuPdyr4g/FdA2QDOD4e/yi1pFq6WHqQqdvoYVDZI7GlChYwN+u7Z5xmYI754tUG
	c6mUlk0HeAGl51cEJQxQ6GuYR4MgRfFCtbYSRsbWbMDvqwiotZiMuUtXJAnfFiXdS
X-Gm-Gg: AY/fxX5s1m2MGzyZo8KSazx74yfHPtevjdSyzuE7f/LgOybzSX1j/q0tlFD6Te6VoBz
	A2Lwczz6txj+eUmlFn6XQWjsl2dxIwHnmIc/+M4wP8n7BI4drxTW+pMhzRJtz/BorBHL6X7jkFr
	yLCHIjZy6mRs1zBvCbDfDQS+c5F1Qxy06T6NM0akAnAJtZ0+tMsQ2+n0oWKuAcogEiqOqeHTOdR
	SIqFBUIAhOQoVPH+GwVNUFQ4L+u2f+unCvWlQu0vVv5XsnhUvwInnbhnt36R2H1XNq4jTNQMJQz
	aj/a4RULzrmoI/StEr04Ej0ZrmCyOq6bLPFFyg0qVMieQVZtdnDBrbGUqdOCZn9HnQCOxV8J5MF
	w6jtntFSej+8SaxVGRz6SF6YAYoOel0o2x4FOH/k=
X-Received: by 2002:a05:620a:1907:b0:8c5:2ce6:dc8 with SMTP id af79cd13be357-8c6ccdab4fcmr127357485a.3.1768902704316;
        Tue, 20 Jan 2026 01:51:44 -0800 (PST)
X-Received: by 2002:a05:620a:1907:b0:8c5:2ce6:dc8 with SMTP id af79cd13be357-8c6ccdab4fcmr127356385a.3.1768902703919;
        Tue, 20 Jan 2026 01:51:43 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dbd5:da08:1e47:d813])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6dasm28937033f8f.32.2026.01.20.01.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 01:51:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
Date: Tue, 20 Jan 2026 10:51:42 +0100
Message-ID: <176890269589.42551.4073379727829793738.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120092650.2305319-1-tzungbi@kernel.org>
References: <20260120092650.2305319-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lmB_vKxNEvTbU0gVQQiLAiptZArJCMkd
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f5031 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qk74ZuyOwNiI-SMmqgUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lmB_vKxNEvTbU0gVQQiLAiptZArJCMkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4MSBTYWx0ZWRfX5Uzuo93/rAFf
 7QzRz79lfVgDfHcFL2EA6MoXtpe41MuElK4cwQP+ikhQ6ylyc/O2MIWsWP9hnHayMG8maPOrXaU
 EXFuJDZOxISyiwTk1jGYkyMZz4SgFpFfFagFSqE/DPqDJjpQwEsaNyqUtH6kWZ1j3szAnpaMCEB
 /8k3MhngXhigXzRza3zaw02ASHf6M06hSIseEEO7SVpkTZ3L73+EeQwVo97M/HJ+Pv+R5SwnmKa
 /SivXbaM/VaK9+8apgZni0ePIswskVYzLdz++Yf+c9zKo93MF2+9/ifULd32EpcQyHFG5qL3M9p
 s3NxavoDnmhrfdPUicI3WDMWdlLaCUf+mFNqe4EMoUjeejxdzSiwTpJ+hb5G18tMK7YqJnu5v1L
 yyG8XbVAHO91QrVTt5kfk6SbyTEFVoVGCvDIn5bSJHEBcsWpNwM7qZ/Fd3RkGRGrtIpzx01Gwcu
 /h0uLw/sl9KiUOzvBmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200081


On Tue, 20 Jan 2026 09:26:50 +0000, Tzung-Bi Shih wrote:
> On error handling paths, gpiolib_cdev_register() doesn't free the
> allocated resources which results leaks.  Fix it.
> 
> 

Applied, thanks!

[1/1] gpio: cdev: Fix resource leaks on errors in gpiolib_cdev_register()
      commit: 8a8c942cad4cd12f739a8bb60cac77fd173c4e07

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

