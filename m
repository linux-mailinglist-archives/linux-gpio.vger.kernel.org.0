Return-Path: <linux-gpio+bounces-36359-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK3GBypV/GlOOAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36359-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:02:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19A4E5726
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 11:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A8F333020ED7
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 09:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFA73BAD96;
	Thu,  7 May 2026 09:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hcXndHCE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ai8jbZoC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668E3B9DBA
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144520; cv=none; b=RQSGfcwKc79sRy+i2YbvbdtMJ79mrFi9biPCqfIulRHsdXEYh6LyorHznqcn2SdWg3rf7AApw7auN0WGZWX3e1zD/gOBj6Nr7VGRNPPHUmdZ0vWB/hZEFIIUyzE80YyuKznl6RL6162oyWSpjFGv1odEtLYsmwSRZJGYLQYB/Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144520; c=relaxed/simple;
	bh=KKME6iYlsGtIRkbeCWgSysWc/SsTcPMTPytNfArf9VU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cJdtYAZv1NDz1HxC3/zelq3BP6FlqjmDZZM88oD0MXfvJd1WvSymBD4rMwznblohsATwJ6MRyQDU6N/Zro+ftB7qfaut/WkUrBLOa+hBRF8B2YXV1f0ZMjO6R+1a1ib59ObqO1lsFcpZHJWdX3NmGXc0G8evGUSKXzUplM82oBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hcXndHCE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ai8jbZoC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475wbBA1926382
	for <linux-gpio@vger.kernel.org>; Thu, 7 May 2026 09:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BdeZ22yc5lNb0lR3mUu0n4xdAdKcxqKN4LRfXkSTI9o=; b=hcXndHCEpLoUoI9D
	uAhPq4aMJmU9tlVeOs9WdGK74K6/slb7Vvqzxok9GVtrZSJfAO9GLDk1Y9tUWZYP
	1d9BCKweQutn3busPS3OcJjZ2JeC0mxP6NMeVyK5SJWqJmNHP/+7+4rnrBt2rRTz
	2Fvj9HSvfGqGqpnyWydgzLoB02ovQym6CI2fcCZHMZkOQY3V0me40mzzOaMJu6mq
	1Ie3muRCUQ9UL/OWKZDic7JqkIo2wTtZpaY6lufp2iJHzJv6A7YipvZY3Gx4cnUA
	S09McgGb55SId9eT/8gA6GASa0CYIxHXgZkDS+UNWPAShw+24ulBaPD4ZV+or98O
	+rsCAw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0n2g8pp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 09:01:47 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dce437f1a1so1326294a34.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 02:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144506; x=1778749306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdeZ22yc5lNb0lR3mUu0n4xdAdKcxqKN4LRfXkSTI9o=;
        b=ai8jbZoC2sj1o4l5RuhEPafP0PnvM6bG4cFSH54v3i4I4K+pasxtHYY6dJ2s0Zr7NV
         AaCD9MzPMJW2rcDLaAjKaQH4MYhhqBrIXq0UA9hI0LarD3pkoRjEhsNk5qLV11CL88UP
         0psfmjtv8Ofb6MtfsWBe+rk8veXpVoYXeIi/SbsoPruBimJackZGpfKgEsQxwoXqqysT
         vc7jHSwKspAKT+ZSh63GMompcA12mD7eonkHL8B8KC1y3qkO9/iwqRZJZrlAuG7E3nmS
         rXfxGtDZpHdMeu3OUDU9ozdshe25q4YGvFmcfzAEeT0uX+dEFKd/4Kc39yMKtVuzJmZB
         GP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144506; x=1778749306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BdeZ22yc5lNb0lR3mUu0n4xdAdKcxqKN4LRfXkSTI9o=;
        b=P6o5TRIlAc2HMepYFbbziNCNW7zlv0ES5kWwRKWxl+TXPh/w3EADX+LIvO1eHYQD0S
         46B0MPEt56inHmhTAc6fQvf5WTld5pMsOXgVjqymdwyzZZzsU2AmrY9zr4MR0fY+Yze7
         zEbyLnVJZ7f1a4tiyCkVk2VSX/dj4I8HHqxi7kklg6MK/DBSf08FAbQdA5vrF1nHlAEi
         WLVUR/SM2ZVyR/MIYgKhfVtBr4jBJg53/iRw3gIwhVDuo0J2g/VQB1Am3NGiSePwlaLY
         3kaapG2QtD+nRuN4bKMV8H1Re4a6E1s5HtHHichN5NKgqX1dNQiL1UFY3Scskm2jctUs
         56QQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Bwl2owwxpvOIIgZZpFyZtOU74P+vFVV0TqOd/6e9nQVMggw/V8Bs8FacorKh+aU2nyWjrozzOdDyx@vger.kernel.org
X-Gm-Message-State: AOJu0YyoM8UVEL8MBh0z9Un++kgABPLNxV0Z7NqFcKILAFfWuKyzgUhg
	qiVW7apucODAbREFHyhI/l9UaFhVsY3khd/WJXLXVGyf7CYcHtgke5xN0htT+zxJKaRixIPbP+U
	yd1BuyEculqQWbJouZFNQxBVRUBu9W3/xSIfTIvntHuUsn+A2eMkvu7Th7c7zxOPT
X-Gm-Gg: AeBDies2zb63msXG2iHKWfSPh16Vkpwrblloc9SUqm0mz9yjm783y1g5zY1Fe+DCHRZ
	/Nq+eJCO12N1knUlbw+l0TKXYYn4F029UFz6pJNB6DwXcBI/eOqBlbybZDGoi7YZA64YHiHPWVy
	O20EA7axe3aJttpBrEhR5A8IYRSb6SAhn3MLdHFrVjYe3/ayJXLnrfUK2KAKflsYlky+dqE8T/a
	VjkkI+q/z+OEtLC7d/Z9r98h1XoohuJ8KxXalCXV3UaL7DnjyMs084oTbq4F/LX7NXjBE78oRWe
	bSrPBJtVcDUpS7S0vj+Ukr7Db8CmpRjJTVJg7RiOJ57sEPJlSowqYfXU2eJetTGPdE1rWMBtxyM
	KV/RNonkxOLLuodswpvOoJaiQLuCi40W7z6EFtq/wlIP9qKfVQRdnY4FaE0jPuONzUojmsWN+D9
	C/Kt6u42BIs2t7j/EjuxlxvHNzKoo1WvQ8dmS85cu03Irv/Q==
X-Received: by 2002:a05:6820:160c:b0:696:924d:2fe5 with SMTP id 006d021491bc7-69998d30716mr3943906eaf.51.1778144506485;
        Thu, 07 May 2026 02:01:46 -0700 (PDT)
X-Received: by 2002:a05:6820:160c:b0:696:924d:2fe5 with SMTP id 006d021491bc7-69998d30716mr3943878eaf.51.1778144505963;
        Thu, 07 May 2026 02:01:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a870f96cb1sm3480516e87.22.2026.05.07.02.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:01:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 12:01:33 +0300
Subject: [PATCH v5 2/2] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-waveshare-dsi-touch-v5-2-d2ac7ccc22d4@oss.qualcomm.com>
References: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
In-Reply-To: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7772;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKME6iYlsGtIRkbeCWgSysWc/SsTcPMTPytNfArf9VU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/FTv507N2zMjhKuukBTJZaa24cJ52RhkWf8FC
 R3Xr3WCMUqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafxU7wAKCRCLPIo+Aiko
 1TMICACcfSSppOas5sNdyuHnJaTnorQ4H4K6p9AZctZ3mtr9uNvuMqNmQoNMQRwx5CZ6HyuJAI5
 T7pZpxp+e0HT8uhMMb6kWtDcwX96R/x86fZcoEI9OKfwKdcO5Blq1W0wglbBzus8AgSKiymzxGX
 mg+Js05+m5YJ6RoDGSZrf6E1aD/G3F+LWT7s1Nvp3hAoqJmwG0qAr7D3MX9iiHvVdk45VZxlxXf
 GWr/o5mphMoKl20Zw2j79LgOkaSDIa3+n9r9Z8VwjDQqACCubq1OmhA7CY6vrGvdDnrkYKBvcQw
 Qb0rEi5p1zkofCg6tWMlYI/r5SJXVJhoZRk/dvhW4NSto+A3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wv4b99fv c=1 sm=1 tr=0 ts=69fc54fb cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BBJQNc9AFPM2Ar9AcygA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: 84eMhH8HXAbAjJez8grYguEv_5edl_IC
X-Proofpoint-GUID: 84eMhH8HXAbAjJez8grYguEv_5edl_IC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfX7mN3WUhfYH19
 FxVWzVDI0NE8rADFD2Af83MReKvaGVDHn4ctXnIJ7e1SAoFYDIUMxohJ/4wjMJIMretBqoBDbO+
 AoDed4CL0q2g/PNlR+/EgsRE6VjK+WXXU1F7MdI20MPR4U+JGuoGU/4IQXjxMcL+dfovZ+wm284
 ZUIrtBcg5Asoso+N620+qKoquF73EK3kRVkM5C/zLL1Hu53K1XwzJo/hbcAhMzTFRdJFnxSyT9p
 1VfvDE1R4bhRH0fgSgx+91fsIUJ+r7ICRq9Q9IaOneMfuvPIhoPz8QjBqsUXMMFpZVXu8dv59nv
 Hu+bJvokUvl7KZv5x4NopRmqqF8SI0C4iQjRRxH3hHa9eMZf0UMqkdbFnVNHRp2FICXyoo6FUYV
 4Ln5wDXU/VVHYtGq0zvseB/n9Fv+RDpYkI1YNeiSOKYgbNco5XQwn3MyCcxXj45jFiRV0u4LK9f
 WgWHJvQuE7EfyOFvurw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070089
X-Rspamd-Queue-Id: AE19A4E5726
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36359-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,arduino.cc:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight. Add
support for this GPIO controller.

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpio/Kconfig              |  10 ++
 drivers/gpio/Makefile             |   1 +
 drivers/gpio/gpio-waveshare-dsi.c | 208 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ce95a25298a8..8ae6a423da6d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -806,6 +806,16 @@ config GPIO_VISCONTI
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
 	tristate "Qualcomm WCD9340/WCD9341 GPIO controller driver"
 	depends on MFD_WCD934X
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b267598b517d..2ea47d9d3dca 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -205,6 +205,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
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


