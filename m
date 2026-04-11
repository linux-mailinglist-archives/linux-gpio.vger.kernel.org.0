Return-Path: <linux-gpio+bounces-35051-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPgXBT482mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35051-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:19:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 996FB3DFD78
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D58130470D1
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042BA3630A0;
	Sat, 11 Apr 2026 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdqYeQdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/VNeznB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0136215F
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909497; cv=none; b=nqY2t6GtIqlIiBuah2N9OaHPP6oqtt4GYpvhq5hB1Ir1mFabCpC2SsLSdJu7CcJP8Lf2Bg+8YWdj16DUhqNS0kLAGgJfyyPjlWayb3zeK5mD8bWMFiTdHTy17M/krJ6ws7+oukBD0qT6e7ifDCmrqGfryPSyt0Wxy9kvneqng7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909497; c=relaxed/simple;
	bh=hmXTmyPe2+8CQYPgL4u755xNdxBVwLTJmFYBmxJpfok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLDCZowF9w4xDD5DWj3CBCqymGBVmHL6PjeXSeIamQsOHBCAbPbxo+q/5BWIBXZdMH7srWK1RJrNADUW/lMqlqmopCB6kq+kwK0xt3uu/VLT95V25fgjDOBsyGrufhorYiOYV/4SGPNmwHjoi41mOWrFTyjVek2FjBhevkBtU/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdqYeQdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/VNeznB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B47ido1200641
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6xJZ5euRUkJ01/MhbgNuHprFSRyTM9G9jNcE79fdD8=; b=RdqYeQdxVqul5YUP
	YJv9ALIZxbDX7x/Z5cCkXTFbSom/0+K1yIi8RGidsUR06hvamy4/ccrH2PgOACd/
	Ms5rbdZha2/cyIDevs7ITLt55xwfxXvOefbbt43G48D9JAdIyz8292D4JOFQnVu7
	+lflPqk2ufEwDiSqoGzisdCqJWJFRuv4SlPQUM2n37B0EUF1IAI3IN5iWgjcVohO
	BEJv1EJkBgFvbwOm2qDsZ1ae7WvvBa59vb6X0rqp2XE1W9rAcXyqPg8/LsHKnLfL
	+UI4YRErrOPqWpRpeNV8vRcG1buDkM5vh9oFidyHW5FzE/mGoklDuXQfq6htmd3y
	jbFnrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jrnap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d5010ea730so686904185a.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909494; x=1776514294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6xJZ5euRUkJ01/MhbgNuHprFSRyTM9G9jNcE79fdD8=;
        b=D/VNeznBJAkkziHuHPeDwnvqBDLIeB7ttPeMiGpdbO8i4dV18k5UTf/e4deAIn5Rap
         NCQ309QaLyDuEbcgMyZ8gnRgQeY6nV58TcU52Nviu/pRi8RR1Q2hdfxOWffojggXNrId
         JaAyFDNB5uVupZZIR/TElddq1lazcMfJPF0ZmVpJyMR6FxjEoUnMGGqQTt8p6N5vvAEZ
         VqJvD0QNDrwlFz7bQYQnubFom22Y7YR4It8mPRACz79Hw2jyKWkaXozy+X4HA4dP54lc
         n9tsjiSBB1oOQ2g8ZKpLDtQMp18CskGuvtNvvWRUM0FamfzOhuIj2+A7QTSh+B6bP6kD
         l0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909494; x=1776514294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a6xJZ5euRUkJ01/MhbgNuHprFSRyTM9G9jNcE79fdD8=;
        b=ncfleE7ZCJNyNfjBA3UU4bUdjncVbG5sv1RTesNBu8YTm29aG9cGt4Ncd1slf6Eb2Q
         ipfsExrDVZ55Bc3QHy67djyzMB4v9jQ7xDfvJEqC8CaAHTFNSagrYT2yRuN7OWEW2C6r
         014nFLoyXKlvG+YSxAGIKcajH4Jz+u4Cjnbcf9MzDkZTp8nO9bszdOlh0eyrSgDQFmAH
         bGsmQ1bIVW8L1YQelHIzwMq87RlNuLzYp6MqJ/atpgnf6Ih+FombRZMrUAa3C0gm795n
         meX7GkAPf6l3unmYaMTVHm+HLGno6pPJnFbxnEDad4fDoykTNPCX17gNMNjJI26/bvct
         Wn3w==
X-Forwarded-Encrypted: i=1; AJvYcCWMfiJdKwKsxCWFqBovxZZUR0mroqaMUi/ZGgFww3Cl8OMUmylgKEznd1DY5P/0f9/3UHUX75RIJ/wm@vger.kernel.org
X-Gm-Message-State: AOJu0YzP3PIM/q0Ry1bqmUj2rPt5T7/ozIPSeNQR4tmaKz2Zxi+Ho4Vj
	cQOySHxtflQlgI3EM8AGanTcx/xHokl3asimHhw01T4O9XaiMnQGcuGCaNC9SR2Di8Ih3D2PBcM
	BXID9u4o2tfkSUNhaBryM0BoXs5s2cBqUpdJOJ1wdW2FPJT9BOXDdtckyDTeR4D8h
X-Gm-Gg: AeBDievSfHOtGZ079cTSUqXRTixKo1rdH8TzzCb5KVUP3H7xn/E6vHEwxfv8nC+KYaM
	ISiutckNnrMauNKFrQnz+vT4o4+PCFXZVjn6tuq51J59DJ4R93ahOHcAZOgtEzf/qKicmCXzJ/F
	AklSGb3wIbB2vWBB8zox1Yp41DP36WGMB219K6tPPJXlehaoH2n+4UNxnfZk4ToyA2PvlP5Scjr
	ITVrNntb2iVcYvmbwHHxOulJ0lZ7UAnTDOsQSIe/GiDvPQCFF3sOVsPF9HWgwm+CU1sllxnKzAd
	1kkqyQJsMEZynSJZQjrtvywELBMp6csvna9j2hvHg1IwuWMucHFYnDvKwifuOrrcCkBJ8GePRBe
	+E0lsd8oPQErXbflDFXtIczJYk8zV8fOHXxSqhVNX8t4uL79ED0VrhBqjcqKT2TwTkiyS0l3IkP
	IjsPAnhTbgy7Of954WvJEHfSlHXywAwlG89QA=
X-Received: by 2002:a05:622a:1c0c:b0:50d:8ed0:7f10 with SMTP id d75a77b69052e-50dd6abfc41mr80286641cf.13.1775909493618;
        Sat, 11 Apr 2026 05:11:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0c:b0:50d:8ed0:7f10 with SMTP id d75a77b69052e-50dd6abfc41mr80286161cf.13.1775909493152;
        Sat, 11 Apr 2026 05:11:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:41 +0300
Subject: [PATCH v2 21/21] gpio: add GPIO controller found on Waveshare DSI
 TOUCH panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-21-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Riccardo Mereu <r.mereu@arduino.cc>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7737;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hmXTmyPe2+8CQYPgL4u755xNdxBVwLTJmFYBmxJpfok=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpIAhcDDnqAbT569t4Y6yYBcC7UU+uWhTpAV
 0kIUUmkVj2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6SAAKCRCLPIo+Aiko
 1Y4LB/49p6uXzAnYxBtCIJJINoYExIC34T8A+v+6+4Hp3IsBSs9yXVGxN30mvWRcA8HhqRSCM0K
 XoaS/4PG+5LPwJkqRIxD0ZiwFO+PJ15Oh6S3jGWE3poikGgO+SmnsPTsyI/QEv7EKqxSzPfVyNw
 rzfWqq3Zu0+wHuKFX2bAi4pN6gtg99qY2a/esrjqOOW60H5DNybgHK+a5DKTUmeys2G3ry5LGSR
 sp6OQc3NF3MDzjbJS9zT4YIvVie2Cun5eu5KGf2gDMHjWpaMQIwR24tgbn3J44yBhq8O6Mlm9Gj
 IF3ik1hbXueFlEI2vastpmeSH3FuFa4tzbpMmg8qPijfnKtj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX+ieH7DdQ5tBc
 vgRIVzNq8JtqS/I4N4JsU9XiecElNPPH3OSSeHH8PMwxuwtRegI5Dck7SOCZE3R6JFEF66svmQ1
 NJq5OrMGV7r9qy7abTkNzsZyKJLhvCf46+IYfPaVS6hWFzIyaVWWbbonyb9vA/RaksxDnggWXNp
 SYiL+bomzNbxXiZL7tzK1b4VuQhHHxtGeADf7T9n8M7VEdnwALeAC0rUFw43XYTDzmj2Q/XaPbD
 zXTXbTWq6a3N4VxPwiFD6+glfl4y+DjVtzNqyeS3IcOYtfw0nyVn9cHhCrarkCNFXtzYqcTXnrQ
 PQAlL6wnE7nBWpr1YHjlucXrdNjmwtnvvd35aaOrgfy9eR+rg4YFU/KeWciQ1yc9U0Q2D8tmKKB
 3R6434EoLWRewbEIeRC0bnSjB5/oDliMbKQgHlbpwXXifJpGyIkTEy5nmzxC88crXERme+82ZnF
 CyiJya4UfdISPRgXQ0Q==
X-Proofpoint-ORIG-GUID: 0qFzOt4z2iaqTlZHh_UQ8qjDH5kucEGJ
X-Proofpoint-GUID: 0qFzOt4z2iaqTlZHh_UQ8qjDH5kucEGJ
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69da3a76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=BBJQNc9AFPM2Ar9AcygA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35051-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,arduino.cc:email,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 996FB3DFD78
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
index dbe7c6e63eab..1b210c451151 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -805,6 +805,16 @@ config GPIO_VISCONTI
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
index 000000000000..f4a1d4d3b872
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
+	.max_register = REG_PWM,
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


