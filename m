Return-Path: <linux-gpio+bounces-29323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ACBCAA465
	for <lists+linux-gpio@lfdr.de>; Sat, 06 Dec 2025 11:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B97A30A42D8
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Dec 2025 10:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0B7286D4B;
	Sat,  6 Dec 2025 10:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CThOMIG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e3HVLA2v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35068218AD4
	for <linux-gpio@vger.kernel.org>; Sat,  6 Dec 2025 10:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765018074; cv=none; b=Z+48MrYWv7hwHv/tWwZW3qiP9PRbCCF7N8IavR+Ff1FPH4uWt5HJsCEOC5EJIFAmWdlJCKOuXA4R+WxyXKs9nOJW0ddIdCAoe0N5XJe4OLIkDaeER6r30bqWmhyy//Voet4HNmYs8N2tsc8kzE2tyc/Ao89D74QyWB4U/cF8Cmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765018074; c=relaxed/simple;
	bh=hDBIoPWVbOM0qqz8j/L/2iT2ZcaMQ6qjqytN/maI8Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrSQj7twiMAZ4GWpM1d9G5emyassYNn5PMmRjGnpyl7g97ntkAEc05ptv6ARQcSqvbIeBuvjkyTCSk/47ZKFNcKyVL5m9sCAEoV5XYTx0JJM87jjzKvJ9YeEf3IRBXwovfPMZEFWSezqZiqPBuV6ofg73puGInDcbgs2/r458V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CThOMIG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e3HVLA2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B64Bk5B2271738
	for <linux-gpio@vger.kernel.org>; Sat, 6 Dec 2025 10:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EtyWlNwJx1z2RE03/vT0tdgWFhP+oyN2GeyFYQVo1Nc=; b=CThOMIG5CqriQieO
	4FXV9T8557R4wAMukJIDbw553dVbdp7+kEyZJD5ffhKrSa0bu5HUt9cWrMv3p1Ai
	ySSBXD7mdlNsjZf6lAHWqew20tM1YjSJDiQT5VOVxZGKIKe1Uh1nC74s4ANVgshp
	PNkf7a167jGDOR6onvZTHUiXTQIS/qZWnCX8DIq7NjS7vOcCt3t2EM0P/GfZXeU+
	OTs4SveZyHkRThOnbtpiKgCZDUvoAhehmIyvTu3rG4xJDysM2WQWmpSNGADvK1YJ
	k88/oe+A3i6r2Ghn/26+j5WMBNsyZvk/cHCs02SMmQ6Dk2wXnMuGS88GxaY7fS8j
	6On86w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avd8e0h52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 10:47:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b286006ffaso608932185a.2
        for <linux-gpio@vger.kernel.org>; Sat, 06 Dec 2025 02:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765018071; x=1765622871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtyWlNwJx1z2RE03/vT0tdgWFhP+oyN2GeyFYQVo1Nc=;
        b=e3HVLA2v2dn5m6tjMkWQgT5IGFM9IGxucbtP5cRfBL+N9wH7ja6P9S2KGpypcQUXuV
         StIlwEJns5vCOAK5fp+mWf4KvXDGDJdoSzEWwyjYQRkMm6nl9dD9WfGu8JbDof7luDkU
         NK/QfHxHS3InPdTQl2fHK+ii5hqjJZikEcnxeQDLdiwKVTVUK9UCNwTLC7nrRKlLlgYk
         kW75ONmia4/aEdyweYyo7bq2jH0hsEfCc9IrlmDafgmLv5ILdFB6idmZnmORvg5zt0br
         8ovcqYKeTiflYCVZ1bY+xbYwjG7Oinc+Ysur2v4cITILZbdA25Jz20xm2O9vgKtuDRBs
         gIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765018071; x=1765622871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EtyWlNwJx1z2RE03/vT0tdgWFhP+oyN2GeyFYQVo1Nc=;
        b=Lo81WigDtWUcDg1RITzxYUobR42YlJm9PzCHpmj6nJXDhtoj52iKtFNqI/BJCwB3Bx
         XzaJGgJBqyPm0E8oyYFig6mkhbCm6MgsayOqkNblNbbfz0VIUxtnnfNWEgZXxnDHkuck
         Zt2mW1f7BYc3sWjoKjC5LFaA09r2lx5C4iPJhBbG86ZCgmCTZ7lH+yxkzQxyZIqA9me6
         htv8fQyxtXxZHLoZWGNEItqA0us8fgNFy9zEf/sQStug5iaVV9zRQDQ7DNU7UbUDexeX
         wW/NdtvgpTsDnl0qTgtD09R5jWeuoCYrHgk1y79bqzFISibyAw8ohZnT+KYzYNhFkm8G
         Kvkw==
X-Forwarded-Encrypted: i=1; AJvYcCVC71t0e8CwuDmeBjGf4UlI07N/aU8CmfJn+mQwmnG500f3WPKk+3oabbMzEuIz38nt63qc12U3JBBw@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhg05uL0uOxlDOHOHjzifkacwc9hIyajeAoTIK4eecTXvRgRu
	iGiey25phj6Mur858LLcNsjYRdPs2V/sEpWJx8nyJy0ZRzx19XTknN0XMozEkNX30GHDI75AI94
	h83humj/hiY9qM5I0hY1NS/rXFfqoh7Jh6Tp876dsv9VB4/bd6/abCGGCMIN1vF0Zmq+Bx9VP
X-Gm-Gg: ASbGncu5trvKFKF+GLXt3rITaKkWCj++k5l5mshNVvJjBLGYrziIqlvv4mY0hZ7Qqok
	a/MOkuFYz7Q0YhBgbNn/JkeGlxGA4dLAxoqbcQo464Nyojhs4XBHQY6qFwRxpg04nEVg2TH24d6
	TC2FWxd4PV+32FDR8dQPzJndRDIxg6ZhOIlCcRWkDyCmqnsa49B97GGV/+Gipx3wE6u5HxOliTz
	07AgeKq/vthrLPtwA7zK4tAMoCA4WF3qs/Y3ScXvRdNHy5oGY9vz4p1d9cfaq9hVzo3oQasiArx
	BHP9VHAmB91ETNQlB3+BVoMZPNpM21EC8oE4XwA5Thf8q2wKXegmJxh/BvGynpOogt14xbwQkRc
	Dx5t4s1cjIYLlqOmFacB6D0++PlICsdJuHXCAj9IzMwzGKmvOot+cActTw7fA2KiVA03O5LK8MA
	4ajFU+Ev0=
X-Received: by 2002:a05:620a:4544:b0:891:d993:1bdb with SMTP id af79cd13be357-8b6a25e74e1mr237029785a.86.1765018071137;
        Sat, 06 Dec 2025 02:47:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpuemVRJSvV3AeDBQzaRyuU7uojlrnAUveJ5ZBdcKGrLPEcD/p3jeoLFo9MK8S3K4H9MayaA==
X-Received: by 2002:a05:620a:4544:b0:891:d993:1bdb with SMTP id af79cd13be357-8b6a25e74e1mr237027285a.86.1765018070651;
        Sat, 06 Dec 2025 02:47:50 -0800 (PST)
Received: from brgl-uxlite.monzoon.net (46-253-189-48.dynamic.monzoon.net. [46.253.189.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49772c6sm595755566b.44.2025.12.06.02.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 02:47:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Akhilesh Patil <akhilesh@ee.iitb.ac.in>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] gpio: tb10x: fix OF_GPIO dependency
Date: Sat,  6 Dec 2025 11:47:48 +0100
Message-ID: <176501806627.7497.16359196278086397225.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251205095429.1291866-1-arnd@kernel.org>
References: <20251205095429.1291866-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDA4NyBTYWx0ZWRfX+bXz6XLjOOuJ
 m/i/fyS8fds3bZk7MBwrU48CRdwPmc8I6yFz3FdJlucFU/qL3hE6dlk2fUSenrfiL+MdbunpWje
 BPaBEWFVROY8gv4koNX+tuSehfVwLsYuFj52ys2PT8yCxoO4vM7Y0zdQlN8e3Uv6tO6dIvrrA6a
 EZXvlPzCoAsQMArwwkj/o639POPbFshJRqGO9V3VPK76SF9Bzsfl1PnhJNho7OCYf8Uty1I9CQ2
 JA+369SlHC9Bd0WVabHqrdtj5mqycvb3J6jm9n1DpEfw+1CIMDRz3QYrOKQIozLGxBOl9QapE6v
 EpgHr8WYGW5E3ai9VSn9lqPmMxHpHzsXMrl4XqyOuRTzikyN7lc6c1UTO9yPeykskfwexVDysc0
 ndHhi9AKuji1D6p0Xl4m8zXQVkPy6Q==
X-Authority-Analysis: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=693409d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8iwL8RSDSKZXmejE4JQMKg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=EzmSNKR0-fyjyPbUMxIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MyLAJPGqadICc1Obr_HPiHKWeGBhzp90
X-Proofpoint-ORIG-GUID: MyLAJPGqadICc1Obr_HPiHKWeGBhzp90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512060087


On Fri, 05 Dec 2025 10:54:09 +0100, Arnd Bergmann wrote:
> Selecting OF_GPIO is generally not allowed, it always gets enabled
> when both GPIOLIB and OF are turned on.
> 
> The tb10x driver now warns about this after it was enabled for
> compile-testing:
> 
> WARNING: unmet direct dependencies detected for OF_GPIO
>   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
> 
> [...]

Applied, thanks!

[1/1] gpio: tb10x: fix OF_GPIO dependency
      https://git.kernel.org/brgl/linux/c/a0cf7d69016e1917c2ac284840254b5f1dd75e23

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

