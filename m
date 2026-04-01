Return-Path: <linux-gpio+bounces-34548-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL3AA+fLzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34548-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:40:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B4C3761D7
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED0A8309AB8A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C143803C3;
	Wed,  1 Apr 2026 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvCrlkrc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehf5B0jN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690A12F60CC
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028455; cv=none; b=YqhvIZoKw/9jGDoqjD69DBhGW7+W9E4FSeIW9A7DjhQUkTVmuJYU5AnNffRHUSrRT4B5sh+LZGbnJJPKDjr+9Rfcd08pc9X1dPQeGtCLeuW7MhJ7bn40Bx++T7C+hG4Mor1bqdpiHOgBvt3UjtaA6AdTKzXYvVhAE7+8Cr/92WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028455; c=relaxed/simple;
	bh=6Pv5TDECwfzFeKPInl1W6rcgS2uPfThpvtka1MoOwas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Os+HhkxVpPGRT2zxxD5bKsO59SWA/kD786YCtyXx+cDCZ2UnYzJOBYfAivxw4ylus6drmAm/J1N8/4xKG+pZkGqZnyF/RkyDjFG9L0upy6iBe+OJEcqblbEQSSb/QcQvXcKd656alFCZ3aVmX+LxM5WcT7HEk94RGmiAkS7OHSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KvCrlkrc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehf5B0jN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VSBe1459604
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nT0xhiRxixrMOQFGawtvOLvgX7LjDibto0r1qGl+gQ=; b=KvCrlkrcVDw2aaD8
	QDx3zd2DCd2OPvj3bnas+YL5zEmKqHN9gt+XaONOmPANW6xgvFG6R0ocLIjzo2/D
	iA6caAcplbhaV1OKjSoZblNv3bZlQJLjrLnXhAnjxqdiKNEMu474wFYTlydiEXL0
	fWp3SZ/6rKmacovo91KvYPn+JTuVmmwr6wwpj358QX1rYa8egqMv/Ho4bnr3wRQq
	CgieBM3k8eTmBU344S47z53OOtgByFbxmuicpLpv6Sb31VqUn9UhM130r2Slqex4
	fpIWOvILKhoBLN9KN7uLwTVrvyI/DF5b3zIB9Veqhl3gxVFpsXPyLpFdEjw+TCEz
	1KSrlg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0uxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5090cc6a7d2so214978151cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028448; x=1775633248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nT0xhiRxixrMOQFGawtvOLvgX7LjDibto0r1qGl+gQ=;
        b=ehf5B0jNA+868slP3QsU92QfQNjGYghSJ91HXD7KHACpm10iIFKucByNauFyouoxzm
         qWvnuA6MIBfCercptgqfcnOtCtrQ8c4duahAacwRPeWukg+gAE8A1y4ygni8PRqyAVk8
         fKupo1fhmgGM6MldUEYRaaSvBLZr1QACtu96005h9rjoSykgOfjAiVePCOIqmwdfykXg
         GuS/Ydb/6ax6voykiLWXLa2afRdrLunDzADsRMM2FuFuyUJ8yEUY5bw+hDDHBLQ5USLS
         UZoNtT/am2+HViUMvMgwRJxB2ZnjPTKW6f7HKphkcb5SxtMtqcMlo6Z/DzjQyhGPKsj5
         jV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028448; x=1775633248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0nT0xhiRxixrMOQFGawtvOLvgX7LjDibto0r1qGl+gQ=;
        b=myCNn1ikB3INssfauNH3sQuEnIiwyI5tTiijNHD5OREi2pEIdYjwViOGfwShhymWFQ
         m219dWIQyuMHVkAeB4qajkPvTkmgCvbyK9vyKFlLkD2JMsG9xAw2cR65tGE1c2+yKwPt
         zqm7AZSyMDc6KQNVtntrN5gh/yOfWut98PPvxlhyLXliHTIN7nXkNlMpIjyEpSnWtw07
         zDIF8U/ey/8UmGn5mPkY84TkN5luIVN5h2qugVBQy0fL6WimgO43QO2WaVFQ7Im7FADA
         Uo4FL/BBIPX0xQZ6T9cafojrFE83w+5Ar+5Mp2dFUa1GM0Cgje5WPXlYH/jaFfQc3Eq3
         NjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmRvkCEu6ueFPRUGb1NfgHFQkbS23hfVgLEo+Hj64Iuvq10p1f81EPzgNEUfNnhzhOb1wIT0OWdKv9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8zvStgOFaKMgVZpC7v3Gb8IYMWL6sWgh33H8YAZbF70V7Xg0o
	uASuTHCg6msaQjhEq+o/k6lVoctFVa90BmybnlpQ/i9TKpq7FtQQOwr07dOWQTC/PyzVQm+sbqT
	s+DEis8N7WPc93PT5wJVOFOxQTn8QHIf+moWMrslbTdredNTaZzIXI/+g2/RAPAsl
X-Gm-Gg: ATEYQzwEuQo9vHlGMZ4+jmqKRB1Ha3av8IJW2qyBe66PtJOrjYqXaSed2trafEh23hA
	zd8vCuLlpy9VMCl4eZkxjP8UEcHvTlzs4sm6Tpgq8t1Eb8NKZwGK8JXHhBadhuFNre8Hha4ClOk
	WV2gKuR3azos4+dM44jxz2DlQ1koYGrf2Bkotqoj2sXuZ3M+ceaSW2KYj0W0wSqsWIuX0RMvT8l
	z0NUaqXqxM4tyNtnNSkRZlNrdv7u0ls4kletEqF2gcz54+iDFrd7TxaZiUyxeBNyI659JbVQwm/
	E7n7zZFvpDF4rbUcw1TRXpPDh1PLtSJeYEAqxyMcqYVq/hnpQ+TfVTM5vrPVQwKATDXavUm0GH5
	D/5SW2Aevq2yUh84G3Q5GO3W5irRLzcoMGe3G8XHExmvXsV50PJ9nneEGfTLhtVq8cx8dMt/CIX
	ZVeiqFDlBz2WfN/yeuMEhWYroaDc5A/fkKBT8=
X-Received: by 2002:a05:622a:1993:b0:50b:36e4:a614 with SMTP id d75a77b69052e-50d3bb63fd8mr34301041cf.6.1775028448187;
        Wed, 01 Apr 2026 00:27:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1993:b0:50b:36e4:a614 with SMTP id d75a77b69052e-50d3bb63fd8mr34300781cf.6.1775028447739;
        Wed, 01 Apr 2026 00:27:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:38 +0300
Subject: [PATCH 19/19] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-19-5e9119b5a014@oss.qualcomm.com>
References: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
In-Reply-To: <20260401-waveshare-dsi-touch-v1-0-5e9119b5a014@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8004;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6Pv5TDECwfzFeKPInl1W6rcgS2uPfThpvtka1MoOwas=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMiuUWpWPOeZGuuLLQ40KhL8JtSf4hH3mDIgE
 y/HN7rptMSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrgAKCRCLPIo+Aiko
 1cKpCACvZf2ujh7YMIYrGs/cEO+QwEsJheddWO6TLJ3bW42C8nSqwHx7I4QyizX8OzMR4rBnZ91
 /3+OT/K96HNADPq8UfYTJCBB0h0a4E2jzlIejdr5Rck+6CJL+YyvRWAlN7w3ey9g0D0ZM9qUo3N
 wYRlf1zJ96xd528nKbOVKqkPx6h39iyHLHaEGtc9LWUYSHQLnZLAxmgpEzouFhh5XCRiLCA34Q7
 yGtp20m3pWr7dG85li6LLz9HqRFDAqkGLxOM7YJ2aQVL7E/kGHTRsqBRPhIzg/TIDPn2lQTm/La
 sedQQFhHqenjviF59OiDVv5zRU+oTyCVG+0Hh7FGHQfe2Mb3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX1IzaixpJKGVu
 hcBhvO5LQl1qbZ+DTdoZDXg88DmR1mopVlTzrL3uU7dB50sq4CVdZSd5lNQnhhCuA+dXoDcVtb5
 A18Dl1csyBbFBQTMdGQH3RHdiULgY0oDty0pffuzhH6npkQbzTCNsavi25JJ+EIZauW0z5eCc92
 GzCyK1nDVKRu8I6qwHEeEuFtqyDMEC4jy4INamnkrX9kdjmHGHdl6Ecv2nqdnySz5iwHdBY8uOU
 v+cQPPBzwejYdZoPqK4cwq7b7qZa4uFrg/pGVa800dVIk7COgwPSYh5iNjobbJG842e//4KgeQp
 WYQCIsuc+MArHsQqkcXBDanKLB4oDiQZc0t42NTo432tSzi2U9vxDb8VqefG6hftsPSnhhdkYrf
 cIZWZgtepdLE3txbmrbpMcfnXm3r6kWA3hIudl7CuTzlyACQxUG4e8UH9R8Ob4n/f+oBgE6Qtpo
 DTjBoL36vEF1JEhDzBQ==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccc8e1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=BBJQNc9AFPM2Ar9AcygA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: sE9G4x3RrGLb6R6MwWB48qz11EvysPLj
X-Proofpoint-ORIG-GUID: sE9G4x3RrGLb6R6MwWB48qz11EvysPLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34548-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09B4C3761D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight. Add
support for this GPIO controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpio/Kconfig              |  10 ++
 drivers/gpio/Makefile             |   1 +
 drivers/gpio/gpio-waveshare-dsi.c | 220 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 231 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4c3f6ec336c1..f0bb5cdebf9b 100644
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
 	depends on MFD_WCD934X
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 20d4a57afdaa..75ce89fc3b93 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -207,6 +207,7 @@ obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
 obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
+obj-$(CONFIG_GPIO_WAVESHARE_DSI_TOUCH)	+= gpio-waveshare-dsi.o
 obj-$(CONFIG_GPIO_WCD934X)		+= gpio-wcd934x.o
 obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
 obj-$(CONFIG_GPIO_WINBOND)		+= gpio-winbond.o
diff --git a/drivers/gpio/gpio-waveshare-dsi.c b/drivers/gpio/gpio-waveshare-dsi.c
new file mode 100644
index 000000000000..30fe7569c150
--- /dev/null
+++ b/drivers/gpio/gpio-waveshare-dsi.c
@@ -0,0 +1,220 @@
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
+	NUM_GPIO = 16,
+};
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
+	.max_register = REG_PWM,
+};
+
+static int waveshare_gpio_get(struct waveshare_gpio *state, unsigned int offset)
+{
+	u16 pwr_state;
+
+	mutex_lock(&state->pwr_lock);
+	pwr_state = state->poweron_state & BIT(offset);
+	mutex_unlock(&state->pwr_lock);
+
+	return !!pwr_state;
+}
+
+static int waveshare_gpio_set(struct waveshare_gpio *state, unsigned int offset, int value)
+{
+	u16 last_val;
+
+	mutex_lock(&state->pwr_lock);
+
+	last_val = state->poweron_state;
+	if (value)
+		last_val |= BIT(offset);
+	else
+		last_val &= ~BIT(offset);
+
+	state->poweron_state = last_val;
+
+	regmap_write(state->regmap, REG_TP, last_val >> 8);
+	regmap_write(state->regmap, REG_LCD, last_val & 0xff);
+
+	mutex_unlock(&state->pwr_lock);
+
+	return 0;
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
+static int waveshare_gpio_i2c_read(struct i2c_client *client, u8 reg, unsigned int *buf)
+{
+	int val;
+
+	val = i2c_smbus_read_byte_data(client, reg);
+	if (val < 0)
+		return val;
+
+	*buf = val;
+
+	return 0;
+}
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
+	i2c_set_clientdata(i2c, state);
+
+	regmap = devm_regmap_init_i2c(i2c, &waveshare_gpio_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "Failed to allocate register map\n");
+
+	ret = waveshare_gpio_i2c_read(i2c, REG_ID, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel hw id = 0x%x\n", data);
+
+	ret = waveshare_gpio_i2c_read(i2c, REG_SIZE, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel size = %d\n", data);
+
+	ret = waveshare_gpio_i2c_read(i2c, REG_VERSION, &data);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read register\n");
+
+	dev_dbg(dev, "waveshare panel mcu version = 0x%x\n", data);
+
+	state->poweron_state = BIT(GPIO_TS_RESET);
+	regmap_write(regmap, REG_TP, state->poweron_state >> 8);
+	regmap_write(regmap, REG_LCD, state->poweron_state & 0xff);
+	msleep(20);
+
+	state->regmap = regmap;
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


