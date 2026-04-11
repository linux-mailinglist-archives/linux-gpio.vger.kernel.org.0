Return-Path: <linux-gpio+bounces-35049-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD9GK/A72mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35049-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:17:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6A53DFD3C
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C68931114C7
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737BE362139;
	Sat, 11 Apr 2026 12:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GuYeWTzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2HRxJtd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B29358369
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909494; cv=none; b=FSIUm48lsmVledsEDX3atdU4FkK95ETvKUmGcHNe731gSlAKOW1Ny6qWXcNdDfK34yZWwAiS94WRNS/zqM7O6lUGke+pAWCJvcoE00s9uI1RxJFGeHAtfqH58tL29dVdbqLcwk8/+j2hIDLw5SpetPnudrhXSUzQRHay9hQx4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909494; c=relaxed/simple;
	bh=WCASkZHVOOg0Vh8+TWnnu2ShRAKBsiD2NCC/yOWwdHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHrMXOJwGsI1p4Eu1c7mjb/Fxn9qaMoXjQL8EXxlCyZ8/acKWZDydvjVl25Sd729FKyZVK4xlfPvDahgLiEOSuPyt+iSp2k66BcCZHx84wwSZUNIyuT1NLj9P7efiy1dk7obCjLIvctG5/gkxqTYYf2VgiTkgRNJKNwI7dz3xiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GuYeWTzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2HRxJtd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4BrpU653687
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VAtbVrs64v1P6uPBhtxx46qRyt71MB1P/3sk9FRUixo=; b=GuYeWTznLIsCyc7L
	wrdMbkL9cbpWmMVrvOgwOyxSwP0HgtAfDaQiYl1Cu2jG6ma8sPtL/5RQDGyoG+NB
	p5IhXrV53GyONcjW0B4/LoLq2ieU0bwR24R9UmHHvwWHRbQ6znOqM7o+Pqne5n7x
	tEXxypoYzeRPHBit27BV2yciSWZiNZsMrSbBb17m9ZqNZl9cZij3HUkxOq2YZz9T
	DCDPJqBblCmOPC18pnfBLFX4vIV2FMhuUgqWZYdUs7Taw4W9RUWg9DyXZz8usqAn
	vMho9ojyAm7vXHSjSNmy6S1b7uXaQeSOMZ10PyqSWUVmJgjUmx1QXzU8w5bVBKX8
	mEJJYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff2b8mpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so10735791cf.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909491; x=1776514291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAtbVrs64v1P6uPBhtxx46qRyt71MB1P/3sk9FRUixo=;
        b=Y2HRxJtdTuQJxLoCkxjZKWo4JJm7f7WIVU3jBOcqLlownwY3K6ZHHnS0vt0cEY893a
         4fPksdCbJzQUrDvOj7qeq/fbBcIWDA0aCT9NbK247/YeOxMYWhaTBvmaHc8iKZCM6XyN
         lqz0E33XXbQOD0dEoffxm0kQ8oNaIPh2uZQ00qGnjak7COY5oo/VNr72bzTmrIVdXo4A
         YKBlSBWKGxyy32/i+zeJsjFdIGvAjAAhDYGo1vsFv21rEfBHpFwLB8W0JwplbUeK24fU
         oFcrPuDa6OsMKMW8J+v71809gRW4Be6Oo7PTKPJd9tmzsDCaTl5xqr4nHG0hnEm/cBbi
         vGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909491; x=1776514291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VAtbVrs64v1P6uPBhtxx46qRyt71MB1P/3sk9FRUixo=;
        b=EKYz5fGECCrvmuFNNf/Cp8vG4STOBGEZohN3XF5sH6Q3xRZ79rfzG06I3Yj+xhZGnD
         IfrqpIxwe81sN4hJhiWkqK5cOy8m9MK1EdusiSrmuS/DqtVXhc6YQ9GFVbyMKnEaO4pG
         rHf0cstAVY0tRYbmtnXjDyos6Jvno7A40/W/q0Bo7cR+JRZPX+R1ZiqNlPtwdColj7/1
         Adhy2ZUBdgDOkdTPvKRTCWiq2Gg6ZXiIpVSY1T8sRERR6GiBZ8D6cob3bhGi74Y89Oit
         zujOQcGrSPcUjZcQ6FEb8UHCaEWNpwHdZZYBYQJEnKkRy6xSN15VVxRW+wqQY2UgRQnn
         masw==
X-Forwarded-Encrypted: i=1; AJvYcCW9xHKsOugSeabnf3ZJvCRk+kgGWeN8cCLRkopK/VrSYQLtEd1U4RCwCQtGOOCWBGlSnrV/ObCfWRFR@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/axz8M2OBacj/sTV0MEyyL8K1fOjenP35k+wz9yb7nAS/MkB
	ED2dbV0yaqruRTBLR6CRS/ojXifnxpR1ONmW/7XyMq/o06YX2FdLvTrGR7oPMWRmtPFGB8iQdqq
	7xKjf+c8+yXO1yYLP27isDjv1oHJ2686aGWkFWSwxMrfM4OrpUVdOCfRe+mg6F/Wb
X-Gm-Gg: AeBDietr0EsN4iJB7y8yuER6xnsQYNn+x1RHONtiI41aQ9vPtJZkLS+0jcL9wZHco6B
	ZXSL/X3v5+64UvBL3feo+MIWKkXKVSaNObV3L2Jfexe4DREeNSQqzHLBSpm8JPANGtjI+8pN8+o
	I0pXBqqypvAxm2ln60eQbYKVCf6LTzmddxXdHBpbZHgze5pF4RCgaKBPfgGpSUvv/Dccz6YSiCe
	PeQxPoRd/1GVxBE90unuFxk8oCKealbyPFpXZAA3T78aaX4wzRynLAwhJx8SrMrY72WB+i7U3iq
	v7lyqamE/O0KJ1Hs1eqyDxkk3ZwQE3fXZeYlaWMSMttarhfuexG3W8iZ+OAyNS+3nNgTg4HBvOo
	fg3DP5dCcmVGkLzNC9cQ+QPe6yrTWE2u8yizuuKz4zQotl+prws50M3RRvptb8q48WoXaBB8F0S
	hHllKW5iQfl25pXzf/6o9YT+IhIQ+dc3bkXRw=
X-Received: by 2002:a05:622a:4106:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50dd5bf0c2dmr94703091cf.50.1775909490616;
        Sat, 11 Apr 2026 05:11:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4106:b0:50d:72e4:6df9 with SMTP id d75a77b69052e-50dd5bf0c2dmr94702521cf.50.1775909490143;
        Sat, 11 Apr 2026 05:11:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:39 +0300
Subject: [PATCH v2 19/21] drm/panel: add driver for Waveshare 8.8" DSI
 TOUCH-A panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-19-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7924;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WCASkZHVOOg0Vh8+TWnnu2ShRAKBsiD2NCC/yOWwdHo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpHiHxJwTago9a/vkDGGAdiGCxbg/AmCLxSW
 hRa4wETJvmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RwAKCRCLPIo+Aiko
 1VkXB/9saVR0cyiSvjOH+jzWachvys2In9GaaDXaijQD6Sbn1gn5iTnp6s2Ee8kjMJ3AZJx9Ih1
 j2d8eaJy6h200zspFKjuJ4l+qDBg+/CpipO9FsvsSeaRTc70BqiZkFgS8WlTY9UhezqX0QhXAOE
 lWU7G4fkDdcnhuzRV4Rgkwib+O094W/ok48ZWW02QfByCa6ITDnPe7wLm4jQyriTJGh/DbdJKl4
 VkZ4uZBDM/FY2nZH1kiPAsOLV7wxSu7Yvu5FIu/RyzYAFFzidM0nbN81KqcFczPwEpcIlxQiaIk
 8oTCWUpTYZNavbFYnlKakp1SpEAJBiiVkPSkmPZvxnLqyRxE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX4RFwzczs4/q1
 hmgI/atqtwZoCQJSXcTHnagGrS7yrv7qUX8xYpDBlhK4IXk4qu5u90vS3SVdYP3GSmZRu/5sGyr
 Iz/ttdk4/+uxIqS4EjqWmcjk4E1b9ZUGDS4tFf2HvDI8zMC2KK0Z8pP67gHO/5+nJqUNnx1g87L
 Wod2TNOby5c3yCZCbZshXrcQ4I7+0YcG3jpwzLrPjNqmrwjyn0vLAsP5p6tHMpIsKe2jY/iIc6L
 5mPpaB3RTpdgLI33qdkBPi33yX5JCfK1Pz45z+E5DD16VQ+iIkorAgm3cavrmiHxXFmbmtS0MkP
 kEA6xLPPmZl/n9FMbpy1WvVFzx0irsTEUXU77OBukOeLzrW4knWCZOmV1aHkCSQV3lw8UYLnQNd
 E37KvNSb9NPfsc8LtzvoCLZXEzhl1ePrVytnsVD4xUICO/a16PP8hMKRJyPwFzyTd1hp+l1cXkh
 6lBjfd6kGtkFO5Ju6cA==
X-Proofpoint-GUID: hPUwVHf5sDg0Xwx4uKh45qoTh71kxSL1
X-Proofpoint-ORIG-GUID: hPUwVHf5sDg0Xwx4uKh45qoTh71kxSL1
X-Authority-Analysis: v=2.4 cv=W4gIkxWk c=1 sm=1 tr=0 ts=69da3a73 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=s8VT41bj3HggknaiP0YA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35049-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
X-Rspamd-Queue-Id: 3C6A53DFD3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for the panel found on Waveshare 8.8" DSI TOUCH-A kit. It
uses ota7290b IC as a controller.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                    |  12 ++
 drivers/gpu/drm/panel/Makefile                   |   1 +
 drivers/gpu/drm/panel/panel-focaltech-ota7290b.c | 208 +++++++++++++++++++++++
 3 files changed, 221 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ba527b4d7737..979109c27b9b 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -144,6 +144,18 @@ config DRM_PANEL_FEIYANG_FY07024DI26A30D
 	  Say Y if you want to enable support for panels based on the
 	  Feiyang FY07024DI26A30-D MIPI-DSI interface.
 
+config DRM_PANEL_FOCALTECH_OTA7290B
+	tristate "Focaltech OTA7290B"
+	depends on DRM_MIPI_DSI
+	depends on I2C
+	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
+	help
+	  Enable support for panels using OTA7290B as a controller (for
+	  example, Waveshare 12.3" DSI TOUCH-A panel). Say Y here if you want
+	  to enable support for this panel. To compile this driver as a module,
+	  choose M here.
+
 config DRM_PANEL_DSI_CM
 	tristate "Generic DSI command mode panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index a4291dc3905b..0d694acbfbb6 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_DRM_PANEL_EBBG_FT8719) += panel-ebbg-ft8719.o
 obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
+obj-$(CONFIG_DRM_PANEL_FOCALTECH_OTA7290B) += panel-focaltech-ota7290b.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8279) += panel-himax-hx8279.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83102) += panel-himax-hx83102.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
diff --git a/drivers/gpu/drm/panel/panel-focaltech-ota7290b.c b/drivers/gpu/drm/panel/panel-focaltech-ota7290b.c
new file mode 100644
index 000000000000..991d6a4caf17
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-focaltech-ota7290b.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Waveshare International Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
+
+struct ota7290b {
+	struct drm_panel panel;
+	struct mipi_dsi_device *dsi;
+
+	struct regulator *power;
+	struct gpio_desc *reset;
+	struct regulator *avdd;
+	struct regulator *iovcc;
+
+	enum drm_panel_orientation orientation;
+};
+
+static inline struct ota7290b *panel_to_ota(struct drm_panel *panel)
+{
+	return container_of(panel, struct ota7290b, panel);
+}
+
+static int ota7290b_prepare(struct drm_panel *panel)
+{
+	struct ota7290b *ctx = panel_to_ota(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+	int ret;
+
+	if (ctx->iovcc) {
+		ret = regulator_enable(ctx->iovcc);
+		if (ret)
+			dev_err(panel->dev, "failed to enable IO regulator: %d\n", ret);
+	}
+
+	if (ctx->avdd) {
+		ret = regulator_enable(ctx->avdd);
+		if (ret)
+			dev_err(panel->dev, "failed to enable AVDD regulator: %d\n", ret);
+	}
+
+	if (ctx->reset) {
+		gpiod_set_value_cansleep(ctx->reset, 0);
+		msleep(60);
+		gpiod_set_value_cansleep(ctx->reset, 1);
+		msleep(60);
+		gpiod_set_value_cansleep(ctx->reset, 0);
+		msleep(60);
+	}
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	mipi_dsi_msleep(&dsi_ctx, 50);
+
+	if (dsi_ctx.accum_err < 0)
+		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+
+	return dsi_ctx.accum_err;
+}
+
+static int ota7290b_unprepare(struct drm_panel *panel)
+{
+	struct ota7290b *ctx = panel_to_ota(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+
+	if (ctx->reset) {
+		gpiod_set_value_cansleep(ctx->reset, 1);
+		msleep(5);
+	}
+
+	if (ctx->avdd)
+		regulator_disable(ctx->avdd);
+
+	if (ctx->iovcc)
+		regulator_disable(ctx->iovcc);
+
+	return 0;
+}
+
+static const struct drm_display_mode waveshare_dsi_touch_8_8_a_mode = {
+	.clock = 75000,
+
+	.hdisplay = 480,
+	.hsync_start = 480 + 50,
+	.hsync_end = 480 + 50 + 50,
+	.htotal = 480 + 50 + 50 + 50,
+
+	.vdisplay = 1920,
+	.vsync_start = 1920 + 20,
+	.vsync_end = 1920 + 20 + 20,
+	.vtotal = 1920 + 20 + 20 + 20,
+
+	.width_mm = 68,
+	.height_mm = 219,
+	.type = DRM_MODE_TYPE_DRIVER,
+};
+
+static int ota7290b_get_modes(struct drm_panel *panel,
+			      struct drm_connector *connector)
+{
+	return drm_connector_helper_get_modes_fixed(connector, &waveshare_dsi_touch_8_8_a_mode);
+}
+
+static enum drm_panel_orientation ota7290b_get_orientation(struct drm_panel *panel)
+{
+	struct ota7290b *ctx = panel_to_ota(panel);
+
+	return ctx->orientation;
+}
+
+static const struct drm_panel_funcs ota7290b_funcs = {
+	.prepare = ota7290b_prepare,
+	.unprepare = ota7290b_unprepare,
+	.get_modes = ota7290b_get_modes,
+	.get_orientation = ota7290b_get_orientation,
+};
+
+static int ota7290b_probe(struct mipi_dsi_device *dsi)
+{
+	struct ota7290b *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct ota7290b, panel,
+				   &ota7290b_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (!ctx)
+		return -ENOMEM;
+	mipi_dsi_set_drvdata(dsi, ctx);
+	ctx->dsi = dsi;
+
+	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ctx->reset))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
+				     "Couldn't get our reset GPIO\n");
+
+	ctx->iovcc = devm_regulator_get_optional(&dsi->dev, "iovcc");
+	if (IS_ERR(ctx->iovcc))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->iovcc),
+					"Couldn't get our iovcc supply\n");
+
+	ctx->avdd = devm_regulator_get_optional(&dsi->dev, "avdd");
+	if (IS_ERR(ctx->avdd))
+		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->avdd),
+					"Couldn't get our avdd supply\n");
+
+	ret = of_drm_get_panel_orientation(
+			dsi->dev.of_node, &ctx->orientation);
+	if (ret) {
+		dev_err(&dsi->dev, "%pOF: failed to get orientation: %d\n",
+			dsi->dev.of_node, ret);
+		return ret;
+	}
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	ctx->panel.prepare_prev_first = true;
+
+	ret = devm_drm_panel_add(&dsi->dev, &ctx->panel);
+	if (ret)
+		return ret;
+
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_HSE |
+		MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+	dsi->format = MIPI_DSI_FMT_RGB888,
+	dsi->lanes = 2;
+
+	return devm_mipi_dsi_attach(&dsi->dev, dsi);
+}
+
+static const struct of_device_id ota7290b_of_match[] = {
+	{ .compatible = "waveshare,8.8-dsi-touch-a", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ota7290b_of_match);
+
+static struct mipi_dsi_driver ota7290b_driver = {
+	.probe		= ota7290b_probe,
+	.driver = {
+		.name		= "focaltech-ota7290b",
+		.of_match_table	= ota7290b_of_match,
+	},
+};
+module_mipi_dsi_driver(ota7290b_driver);
+
+MODULE_DESCRIPTION("Panel driver for Focaltech OTA7290B panels");
+MODULE_LICENSE("GPL");

-- 
2.47.3


