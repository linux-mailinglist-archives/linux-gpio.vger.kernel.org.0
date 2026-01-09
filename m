Return-Path: <linux-gpio+bounces-30309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 61438D08083
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 09:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4B32300FE22
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 08:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF74A3559CA;
	Fri,  9 Jan 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbHbSKxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3cF4jH/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED163559E0
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767949040; cv=none; b=uKpbhTyDHgnfoPx1dYL7gaHZ9l9uYKaGmd3odPEJRg2NEpHwlP5lL6sEdR7u4vzK39Rz2pDEAU9QUNGNaKwONKsY1e/1zIWbizPTR1/z0vi4S7kWZZEEeCJMRk07Ugxffb8hLR0WbH98DMgEf/SEJipP14WeLFgpSgcAUSBoyYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767949040; c=relaxed/simple;
	bh=my0GhZELsaAqPXWID8LxcRvh5T1AbDdYfgEKTSqDmAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srZpuN5AEL660bPct+tD4Ms2X8HG0GIZYXojWJNMtZuNVgrghQHHYwxzr3vV2Aoxx+xaqWEpg3XmM4FbK3z7wQMK+x0VsSdny3fpnkLSiqAAlC2hJfZjdX2dsnCtQhmC0t2y+EgvqfF3ARuI5BgEI+zZMsGxFFJpl9XQLzPnys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbHbSKxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3cF4jH/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XQrA822858
	for <linux-gpio@vger.kernel.org>; Fri, 9 Jan 2026 08:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/WlKRyBYNmiExVrb1Y3GzFD/tS7vfBX7MKLSMhxNBo=; b=EbHbSKxbAPCNtVOu
	Ye2cyzwDbsiFIr8AT1ODzctzqaT6vmITjqw57xyzQtIyTOaGtqp07LBY059M1QDA
	RcysdFJyl63lQmg+F/AHxPcs8TDH6Df/LKvpIHYzL4oC7uV6MUbRiJVvplWTjulC
	hpZSNBL1u7pLkA4388eksEV/74mj4eFAzc2CqtwrNkDkNjaSmrxWMLPRvKgPwf0U
	DoWnKX8KVJjYAdCsq9yEXxEWnSnt/CMM0r2yJzAEjmGKoAlunl5/ALvwfT747/J9
	dsAypzsE5jqBk7hFOjmFKZRyQWm7gsFEsXvS18y97Sb9uVvY8zH5Qprw9284kAg7
	SlVD/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94g2q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 08:57:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2e235d4d2so1471833785a.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Jan 2026 00:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949027; x=1768553827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/WlKRyBYNmiExVrb1Y3GzFD/tS7vfBX7MKLSMhxNBo=;
        b=b3cF4jH/31A6MkJy8j63YEjDxlj0TF4PjQPL+7qjQ40v+vOZWYMbmviEMdNYXprD07
         qts0sgFIZMB0PePcp+K9LslyMRaKamcpTiE9W17YI1wfp88gh6wiJ5dHg9JMYz4SqcL0
         f+v0R4X2BhbWk14j251NjJz9iAGf19FtsXmKuv/L4Aw0MVIKlL/scuSh0SuFAjl7e7ta
         yr15FU/C9iiInN5WpyAGI4ugzvg9SOzPKpvYvGJUKTvwtSdzCNy7RkM4aFyKO5Yn+uLU
         hZYnP3xN7H2qRZFnT+sJb5A6PXg061tZ0NVkyW2nY0cP8nlfcFSffEoiFzVE6JhdiSUi
         P7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949027; x=1768553827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x/WlKRyBYNmiExVrb1Y3GzFD/tS7vfBX7MKLSMhxNBo=;
        b=jzotUgZFElX+kU58OPH6klQZW4Eni8GQIEsIXEtypmAdsvAjxKYSJddoP2GvQ98O8c
         v4OEUO88JHrY+VD3vPK767ReFeQlybWiSOBhHrVapaH+b5C8V/Y9rD8TqyCmm9uDmI31
         PwSdsNPSwuS1fyulZMXGXKJap17HBdnKZtr2RcuZvFEfOovfcr+dkprWK6bIc15JiODS
         nZHB97a3WKYOoKoAy5xM6uMTBKRA2l5COSs1qqRUHZR1ZMapuaE6nBE3B5GR+KvnicOA
         8UptLul1IzZ0sJHIL4iKVt+Rz2Ux0giwJuqRQvzdjcDZ9Ar9d2gnoEt7veI6wUeJraLZ
         bUEg==
X-Gm-Message-State: AOJu0YyGPGbDkG3TA30/4Rp7kx9dDGksr3ebne3UXbhhZNuug4eUjexg
	1TkXI9DoOptIGgl+y7wK6fRbh4UlDfiaraZvvu5oeIHLaCOREDHir3r9Xv64I7EaZUWv9aK3htx
	/wAk1LguEC+xb3Rg0t4vJWih7F6KWZTPwdQGx77m99Ym7rarIn7owpiBkYUS0JxyT
X-Gm-Gg: AY/fxX6xBnPCPxLIe6j6OlAdRyTYdA7BPRgiUPGclmqp9GSuuU//YPdRN53fBckaP6R
	LzSW9zXtjavTqIXF9myMC9y1Fu7zHHefU3PHwoGhx4FsdISnSMIlG4I1mDu4EIotcKMeoL61q3n
	Dc7LiIA48np1RA2taS8GKmb2mnmQRvbHSNreevXpkZKirfcoc1+bZMXF0DXU2SZvCxk35/3QXQ+
	yrErkffqSfpAG0o7l3Hm/z5E7DJiRjZ9BMEnknRETi1t1RYUkJh1ifaVq4FSAwxUtbwhm9ox9lV
	S9mEL0jI8proVY1vKen+CJPKkAJiw+ZaEly+pF9N3KSm8kXqFxwdL13h5YY8ZWnTf/TI6YeCtEm
	Rzc95xQcM/nqz02KXE1BgRHn9CCn/AZ6HG8ErNAg=
X-Received: by 2002:a05:620a:46a4:b0:8b2:f1f3:9021 with SMTP id af79cd13be357-8c3893793e2mr1385288085a.5.1767949027290;
        Fri, 09 Jan 2026 00:57:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZWiMkL+y1c0AwtdBbqX8SuHMOVzBMQvQsipCwoU6CDPs/u8+IDJrCptWMyEI5aWtklqIYjg==
X-Received: by 2002:a05:620a:46a4:b0:8b2:f1f3:9021 with SMTP id af79cd13be357-8c3893793e2mr1385285885a.5.1767949026827;
        Fri, 09 Jan 2026 00:57:06 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:968f:1fff:f626:2f33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e6784sm21278941f8f.19.2026.01.09.00.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:57:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: shared: fix a false-positive sharing detection with reset-gpios
Date: Fri,  9 Jan 2026 09:57:04 +0100
Message-ID: <176794902183.12956.14711201006968865905.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-gpio-shared-false-positive-v1-1-5dbf8d1b2f7d@oss.qualcomm.com>
References: <20260108-gpio-shared-false-positive-v1-1-5dbf8d1b2f7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=6960c2e4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FzXvmhRTYuG-1RLTcD0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: rBjkKjHJgjd6HX4m-B5pVJq6civYuSSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2MyBTYWx0ZWRfXxFs8pBMrB9lb
 +odhkRIw2dv/DCiinB+cD6fkwotCyFsmSaBkvFQ4+YXwgjiGlIYnrbjEErt034NFfusrn3IqV2g
 rRezuYrstCqYDJM21HkZTMxbyJz9oa/PV8e5NqVjkpXau4R3f8M2q9rG36HyYLARhTO2fTMUgKL
 uSuv2k9ZYY7TQyMxzzk/Tb4wlvxfuflNnDnfSeZ0xkf0WYG2WHovA6MAFLYbqXb48kc7aRVzHV1
 YEXmcw4F9hfc+wR6LndFPiPvxdaupIskOxwS6OfZCZflRQghu4hIfYblHtZFVR1Cj8dY27RoYAv
 9qVxt03TSX1Mn+CbjjqsmCBBzKOJg29TQIuWCDPGjDDXx3tgPlF0x2WwAlDHFA6aHVWJ4WTLn60
 yOWr7hnUgNWaBFDVVKYdn+7lPlHVIjtHboFo90pKgk3qVG2q6g+EO/YQCDYY89+UarPp9V9uVYr
 JG6kGzUPNdSj8kFzY6Q==
X-Proofpoint-ORIG-GUID: rBjkKjHJgjd6HX4m-B5pVJq6civYuSSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090063


On Thu, 08 Jan 2026 14:39:19 +0100, Bartosz Golaszewski wrote:
> After scanning the devicetree, we remove all entries that have only one
> reference, while creating GPIO shared proxies for the remaining, shared
> entries. However: for the reset-gpio corner-case, we will have two
> references for a "reset-gpios" pin that's not really shared. In this
> case one will come from the actual consumer fwnode and the other from
> the potential auxiliary reset-gpio device. This causes the GPIO core to
> create unnecessary GPIO shared proxy devices for pins that are not
> really shared.
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: fix a false-positive sharing detection with reset-gpios
      commit: d578b31856cec31315f27b3ba97b212e4c6989b3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

