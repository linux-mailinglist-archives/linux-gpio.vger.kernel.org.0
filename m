Return-Path: <linux-gpio+bounces-35116-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI9bJ9r63GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35116-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:16:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1431B3ED32F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 101B930877B0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA93A3DE444;
	Mon, 13 Apr 2026 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/MVJl5d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgPvSxY3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7933DDDAA
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089191; cv=none; b=pF9nTJ9QI0PXELMCKe58bvPDH34/eJA5Om7u1zmXzPCGaHAiIV1af/9I8rLX8CLVDkMh8nwjkptoQYiz+DvT8bXsHS0OHIjNIIKnFuBbO9KJoT1bvS6SmwSwrvq72QTKktb+hyxVSFYFTPIbzOhGZvLh86/b2vM8MywuoYDUm2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089191; c=relaxed/simple;
	bh=LLB5S+fq0OkGtz5fZjjGOedSRUpC3QiVTV63iuC2ud8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTfZ56YwvHWTq/kjSc9X1G8OghfAT7eQK+tBRHdo0DIpFXiaanVM+7Vat1j5ciSR4youxKZhDsOmg1S1t0i84IyU+BPIBek+svgx6Q9ZjU+4ihT3WtEnLe66lqfCE4/OvuhpdfCqnm5RQH9iUZ4Sgx9GumJ784e1p0l39Htqx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/MVJl5d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgPvSxY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7Z1er602445
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4NBXSH4Is2yC5xbwXreHyoFBggJh0nMi8dZy/+Iqn0=; b=S/MVJl5dJ9AHE8Fd
	lHnkXrSW2Xr0GuEP+LDKsA5sd+uRPLFkcPvbZ1X/KuPf12TjcHzv3Sr8SqOmWGpA
	S3ZMJsAFtHyORpat/e7E7V37Sl6kCmvOs4MVXaivAb5TPD4xQ9+bSxs0/jGNGBBO
	+I2QxFjF9H5x/WB301k18xgYsLI6t1U/44+3MAHEHWFF2lP6DvDkalsE3fyz6f1S
	q8SDBb68UeqUFqbyZAKhuVtYzEwacBrN5efgphxl1mjnINNEN8jZKgIas/zeKcqV
	zAUZO4wVOYswj/au8jhMd0t0FScuomeViEkWdwEnsofp3JjETCinHUAkgpg8Tu+5
	jUyZnw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfffhwjvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:28 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46f083f82c7so6447125b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089187; x=1776693987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4NBXSH4Is2yC5xbwXreHyoFBggJh0nMi8dZy/+Iqn0=;
        b=XgPvSxY3hrP4OIRzt3r5iIhO45yc2BVWZmYVk2o3afBmaBWjEdTPL4exdFuFXqg0eH
         6j2M+qYUmFUz5C6d2w5wz8Pvb2AExvASF15mKwlOPRPy5Lraforpq/M2DVE6//MQRwst
         XGbq6SlEw7VeKo9UwmpQMXPaX8/9/Yqtv7bIpg2u0MpdzCI0AaD/NyGJ6yWCtrGmFZtc
         iwfF5Ssvo2/ZYcOzRvycNS1q2e+nQFfOKORw4tzNf0z+3VsKXCbGej6OCechRnr5L4yi
         DmuGpEEMFWvwIDowHVHNqrju71g5Bf3gv8zIFzotsQRmSqgpOJwrW7Q8Y0NEivbHdaDZ
         gZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089187; x=1776693987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4NBXSH4Is2yC5xbwXreHyoFBggJh0nMi8dZy/+Iqn0=;
        b=j2keJEfieMT9kEMYnaIs03fIjNgsD/J07VsoHVLogIjZkCtiooWQlTOvnr+zZ1oeaP
         vXo6qnmAu5jTUTNm16UtSXCNS2LYJ8y0qZwRj/9z5F+o7Lhas4nlTdssNqbmm9cQPuxx
         eUHlPLU9szDMWPjXdVNy7r9YRe6cx/wC8tAJjFO9RLqDikLIe66KvKuNG7MTX9Ou/zAD
         xtHymTsIa2+L1o7KeOhkq5btdd9T9OG7rV9RX6fdRPMiN7axKWnYUz2cH76xx8wz/yG6
         NwGZGBNsAMvGp9rjybDpMFDvgGaUHN9wGWx9UQaq2hMlclQ2Jk/HmESpydvbkMprY+Yv
         QNmA==
X-Forwarded-Encrypted: i=1; AFNElJ8Co6GFHvaaFBHG2XGvGeqU+2RxEvwatBB1KnpolBgNVvBt5Fd7Zrt2YFxLrzzJZNTqsu4cKlrcbR8u@vger.kernel.org
X-Gm-Message-State: AOJu0YxAKrtTmLgRCv+o2tm3r6Tg8hZal/3XLUnhtYLUfO/N9ZVpshmi
	k4aboAxQ9NLJumXVlRPZHLc2yKJIUJ/SeiuwUYrpL0JQVhD5Y78G/BUlaXnS4YAUeJFQmukGiCI
	tAg8VpgsRrOPjVYVsas2tMA2tgx4TgsCdrZ+nyWeHa2uxrqEkPEhMcOF6tRd7Rp2X
X-Gm-Gg: AeBDietTw1kA5YTo2PWIF8UIlCFGYmz3KVlFZOTK7pYf36T5gFlZ8vQH7jkyu3tERun
	iXUoDGmCYYaovpEf97VJMYy86e0wk2RhKEMRf4WekTumZ0HDM/NCHclnXuR8WOr7VycBL7PF6vF
	OsxfgR2QUK3gSR/4uAeQ0wUYF+ONouTXFxJ/ZLgGa4Aqh1uLqkqI/lPfycLwLzwqtgmE6PLvmCP
	HDdKFTjgu3+PRED9bG5Aey/E6iGQVeNscMFqkYDXXNIeZ+N49Qx/41Oq6g/KEFtaCpf65Hrem7f
	8eV/qPqcd29i7dmGvpcJerEDZk/DNYUcN94ur4WDZb/6NRKgdkiuCGN4aGnS8V/K1HYnX38Fywu
	audfpE1muerCTbfKvuiOUpUmcQQeUUpmE9hALQZ3b44wB/a78+JYYnCHoARjMl53bOjqjgzCFG9
	kiL0H3dItjVl2vhbVOVStbHEn/o/PMDHWHVaA=
X-Received: by 2002:a05:6820:628d:b0:683:a6e:970a with SMTP id 006d021491bc7-68a6b54c90cmr5991206eaf.40.1776089187141;
        Mon, 13 Apr 2026 07:06:27 -0700 (PDT)
X-Received: by 2002:a05:6820:628d:b0:683:a6e:970a with SMTP id 006d021491bc7-68a6b54c90cmr5991191eaf.40.1776089186646;
        Mon, 13 Apr 2026 07:06:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:44 +0300
Subject: [PATCH v3 21/21] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-21-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7752;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LLB5S+fq0OkGtz5fZjjGOedSRUpC3QiVTV63iuC2ud8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgp0CRuEJwBZE0M+s4m5iHBHk23SvG/pqay2
 5QqzBFjhz6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KQAKCRCLPIo+Aiko
 1WLhB/0cpboMrZy9Q/a48/y4YERdx8SOPJoAKVOFjUn0HrVr5HZHrZ8Rrpg0CsYmnGo0jESQzYg
 H2+46/0JcudTvznVDqZ3TStiWBLo8H82ZGCG4qVj+OvVlmS68e/GMWRCf2eU4EdfdnVYrj8+UUP
 jmkLp5Z3l1mc5v/gcNN40tzi/sb4O/fLRxHFXKNmIHBGylaOg1Km4jYMs67D2E610WAHvuhMzGP
 0GfRy4CXzQ1cecaphhja5AV/hQzAlrstnUzLLgfvmegRby9y0//oJXBcr7IfoyFCpQ2fpaSwja2
 BXBa4dG1a/tM/B6F9nE3RF+t92n5t1JgqpMpvsYDFy9DZKnD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX/HqDhy4HH7jF
 pKCSgHkioTqhTvWJiqtVC31PkJqQcR8tQM8xEv3B64dbGvmFu7jH8vi8HkXRJKmtnJBnjlQzwto
 ouYXuOms2XKsdDPfphJm5i/7VsjDppeHsL+B53CinRs/7DbFLno2LHm0FOw1yW6qgOpZXr9k3qm
 QROfvyCUP60tkVKlnY/kPvHjx/Dkd4WM0AN72ehp4zOgblEaFw2wNM/mDRpvcRPrLoa0eImWvBU
 I61cyVnWjmSzMAdfsNFtZDRynmPKXaSRD4+SaBzOztMcEbnRZ2WJgsQCrMFJwdgJK6jhVKM66zF
 6KMV3+TE/A4XSUFLhYISRYb3JL2gu5IrH8ZGcLRPo3vL0MAhVhfndrjXN9fLjwex2ZpxOSfMLz9
 AnotCZZhQkqRW6gwf7ZsqJPn3N/+qB1jovkHwysSlWAVk6wVfX9QPyyi4Xi5Motf141dxwxDbDZ
 M8RJzIaNeo0SpUuDzgA==
X-Proofpoint-ORIG-GUID: MOOG0d9EFLHHaHnKEz6_BWEQSA1gJHaS
X-Authority-Analysis: v=2.4 cv=FOkrAeos c=1 sm=1 tr=0 ts=69dcf864 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BBJQNc9AFPM2Ar9AcygA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: MOOG0d9EFLHHaHnKEz6_BWEQSA1gJHaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35116-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arduino.cc:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1431B3ED32F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight. Add
support for this GPIO controller.

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpio/Kconfig              |  10 ++
 drivers/gpio/Makefile             |   1 +
 drivers/gpio/gpio-waveshare-dsi.c | 208 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..e24ad7e32034 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -804,6 +804,16 @@ config GPIO_VISCONTI
 	help
 	  Say yes here to support GPIO on Tohisba Visconti.
 
+config GPIO_WAVESHARE_DSI_TOUCH
+	tristate "Waveshare GPIO controller for DSI panels"
+	depends on BACKLIGHT_CLASS_DEVICE
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Enable support for the GPIO and PWM controller found on Waveshare DSI
+	  TOUCH panel kits. It provides GPIOs (used for regulator control and
+          resets) and backlight support.
+
 config GPIO_WCD934X
 	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
 	depends on MFD_WCD934X && OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..94f16f0f28d9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -206,6 +206,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
 obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
+obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
 obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
new file mode 100644
index 000000000000..38f52351bb58
--- /dev/null
+++ b/drivers/gpio/gpio-waveshare-dsi.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Waveshare International Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <linux/fb.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+/* I2C registers of the microcontroller. */
+#define REG_TP		0x94
+#define REG_LCD		0x95
+#define REG_PWM		0x96
+#define REG_SIZE	0x97
+#define REG_ID		0x98
+#define REG_VERSION	0x99
+
+enum {
+	GPIO_AVDD = 0,
+	GPIO_PANEL_RESET = 1,
+	GPIO_BL_ENABLE = 2,
+	GPIO_IOVCC = 4,
+	GPIO_VCC = 8,
+	GPIO_TS_RESET = 9,
+};
+
+#define NUM_GPIO 16
+
+struct waveshare_gpio {
+	struct mutex dir_lock;
+	struct mutex pwr_lock;
+	struct regmap *regmap;
+	u16 poweron_state;
+
+	struct gpio_chip gc;
+};
+
+static const struct regmap_config waveshare_gpio_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = REG_VERSION,
+};
+
+static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int offset)
+{
+	u16 pwr_state;
+
+	guard(mutex)(&state->pwr_lock);
+	pwr_state = state->poweron_state & BIT(offset);
+
+	return !!pwr_state;
+}
+
+static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
+{
+	u16 last_val;
+	int err;
+
+	guard(mutex)(&state->pwr_lock);
+
+	last_val = state->poweron_state;
+	if (value)
+		last_val |= BIT(offset);
+	else
+		last_val &= ~BIT(offset);
+
+	state->poweron_state = last_val;
+
+	err = regmap_write(state->regmap, REG_TP, last_val >> 8);
+	if (!err)
+		err = regmap_write(state->regmap, REG_LCD, last_val & 0xff);
+
+	return err;
+}
+
+static int waveshare_gpio_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int waveshare_gpio_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct waveshare_gpio *state = gpiochip_get_data(gc);
+
+	return waveshare_gpio_get(state, offset);
+}
+
+static int waveshare_gpio_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct waveshare_gpio *state = gpiochip_get_data(gc);
+
+	return waveshare_gpio_set(state, offset, value);
+}
+
+static int waveshare_gpio_update_status(struct backlight_device *bl)
+{
+	struct waveshare_gpio *state = bl_get_data(bl);
+	int brightness = backlight_get_brightness(bl);
+
+	waveshare_gpio_set(state, GPIO_BL_ENABLE, brightness);
+
+	return regmap_write(state->regmap, REG_PWM, brightness);
+}
+
+static const struct backlight_ops waveshare_gpio_bl = {
+	.update_status = waveshare_gpio_update_status,
+};
+
+static int waveshare_gpio_probe(struct i2c_client *i2c)
+{
+	struct backlight_properties props = {};
+	struct waveshare_gpio *state;
+	struct device *dev = &i2c->dev;
+	struct backlight_device *bl;
+	struct regmap *regmap;
+	unsigned int data;
+	int ret;
+
+	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &state->dir_lock);
+	if (ret)
+		return ret;
+
+	ret = devm_mutex_init(dev, &state->pwr_lock);
+	if (ret)
+		return ret;
+
+	regmap = devm_regmap_init_i2c(i2c, &waveshare_gpio_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to allocate register map\n");
+
+	state->regmap = regmap;
+	i2c_set_clientdata(i2c, state);
+
+	ret = regmap_read(regmap, REG_ID, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel hw id = 0x%x\n", data);
+
+	ret = regmap_read(regmap, REG_SIZE, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel size = %d\n", data);
+
+	ret = regmap_read(regmap, REG_VERSION, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel mcu version = 0x%x\n", data);
+
+	ret = waveshare_gpio_set(state, GPIO_TS_RESET, 1);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to program GPIOs\n");
+
+	msleep(20);
+
+	state->gc.parent = dev;
+	state->gc.label = i2c->name;
+	state->gc.owner = THIS_MODULE;
+	state->gc.base = -1;
+	state->gc.ngpio = NUM_GPIO;
+
+	/* it is output only */
+	state->gc.get = waveshare_gpio_gpio_get;
+	state->gc.set = waveshare_gpio_gpio_set;
+	state->gc.get_direction = waveshare_gpio_gpio_get_direction;
+	state->gc.can_sleep = true;
+
+	ret = devm_gpiochip_add_data(dev, &state->gc, state);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to create gpiochip\n");
+
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = 255;
+	props.brightness = 255;
+	bl = devm_backlight_device_register(dev, dev_name(dev), dev, state,
+					    &waveshare_gpio_bl, &props);
+	return PTR_ERR_OR_ZERO(bl);
+}
+
+static const struct of_device_id waveshare_gpio_dt_ids[] = {
+	{ .compatible = "waveshare,dsi-touch-gpio" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, waveshare_gpio_dt_ids);
+
+static struct i2c_driver waveshare_gpio_regulator_driver = {
+	.driver = {
+		.name = "waveshare-regulator",
+		.of_match_table = of_match_ptr(waveshare_gpio_dt_ids),
+	},
+	.probe = waveshare_gpio_probe,
+};
+
+module_i2c_driver(waveshare_gpio_regulator_driver);
+
+MODULE_DESCRIPTION("GPIO controller driver for Waveshare DSI touch panels");
+MODULE_LICENSE("GPL");

-- 
2.47.3


