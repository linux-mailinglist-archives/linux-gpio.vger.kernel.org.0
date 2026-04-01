Return-Path: <linux-gpio+bounces-34540-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOUEL/bKzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34540-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:36:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D51376059
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8960313D9A6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BEB738422D;
	Wed,  1 Apr 2026 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqV4iPUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YfLK15Ng"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FED383C68
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028427; cv=none; b=qAQ23GHxJTtqDNAVOvDyRgb7XWWwyGVXF0kqMWpgLpO+x54sMlx8mJ7ToiMD4LR32mdDpt0+K19cqFiCe7ynoqhje49JOYBmZbmRGANhL6IBXndMbWwap/22ZEsP11D+iF8AQreMwxEPSV0Go3u2S8D6VHgNuImEa6ezyt6Cxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028427; c=relaxed/simple;
	bh=8tZscVF4LDTph0agFYVE6JixtCC92BuTMt6rtWJ2nVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hwls7yjwoS3M5GCQl2OPzLMAT8jAj5CH3S2Z/pgSYks1hoQK7Wv2+onRLRzJE6nt3kyH4tyimHR/148XhoCcEagAMfiSB8aTi2X2JRa7Jvj7kxuEQKGWgP8ED3Jx3kQPLj27lN+1ZPWbfvsXXRFp7JY0b+qGkIgf72GyHZd6dNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqV4iPUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YfLK15Ng; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312Iudd1004515
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XYgkyJPQYnM/gelnCPu4vbxoPThepd6pRjAGrQkZhJE=; b=XqV4iPUSpsD+anTu
	IYck91RTks0ZooYyW1QSXoXMWdi4fbUD10dwLwIu54kAMFbZ0u+qlPv9tKBEAW2a
	7y9Zb7FPiKBbjCFHIPt5tDILTR5s3EuVx58iKSyy1EmEzXxFa6g8z+XTvymBcJhZ
	tlX8YSbquq2AjoWwUNSVxWYY+FAGgY/qcGOSmKWMfzuZRxYV7WPRMzdyBz2EBDdA
	2cfeR6Cej4JD6VQZ8+1x1A6nSGpGsRFunB8hAA7lJAET1mtZjgb67ZqH56Av9Syh
	ng7D7iOPglhgWNSurV5w6/FcBgkTszQa0pe9ITZ02xflLahnS/RLfDni+1bM+Njw
	87Xn/w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjh34q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c40acso64097411cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028424; x=1775633224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYgkyJPQYnM/gelnCPu4vbxoPThepd6pRjAGrQkZhJE=;
        b=YfLK15NgdhcoIfG7bwnzULsY1YHyomz0HQo/yM7bmu1g0Z3+T6qPr8sdX6nxZv54Ts
         dUBDuvBezP9WH8iikGqFEM4T+uwVgpSHdIDhSP29n55W+QZUI5GAdwXLhmh1e6t+KIif
         e+Y9DNcTgp0f6H0RXodsXgAh7kTD4VCirIxhDjMuTmlDCOJ+Sy8yHA8udLNL/b+gZ+EH
         dhTUne1g0lhVhuhqHjLLk2vV7mnwBL4vQIx9vgZriKv/Qk1NBTI1J+NdLh7yqHIq4Hz0
         pq49IvZiwIzEFFmJMYZ0yR8RMcc2F2ESjodcfgIqXVv2uw7xyFWTCeZ5L/BivzcOjRUt
         BXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028424; x=1775633224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XYgkyJPQYnM/gelnCPu4vbxoPThepd6pRjAGrQkZhJE=;
        b=C3ZF9RKY7XOPPSS+yn2k932xR2zadf/BUH/ptqz2cY1Hzdft6CAvC1MDkFj6ggQYl+
         wFdw6wPS1fKXR7E8XRQyMBwGAqhmwJNP2TUbGc2x0iCCIYFFgOeBeNOBjUOKXbv4rhGY
         hR6Z2vmbCGiKHNnScjFsx8lnysB5aUBiE/znoFVwL0KzyiwacO1WAk4yUxzXdIsXj5V4
         Kq+stSMj13y9kaQYnogdx3gYJNutKFuxnz2bPrCHiF2EDtV4hU8JzdOosXmXU9nj98nb
         I5Y1xoYeoiRmFXA9sbnmGpYjiJkrSLsZKTntUeR7x6pkEmby54TU5DUut+59s2v+dhv0
         IHsA==
X-Forwarded-Encrypted: i=1; AJvYcCV57XPvKRaUFNt9HaAH/XJOPEzRM03MoCk/+YmwX7EBnAQ7u+uApI5d3tb27CWqlAi/kNosZg9TWQCj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy6lcWXMZ0e0VK+7JlmBYblcraaMYz/9uYosco0QLbzw5ktFz8
	L9t7v0sUThi5uaQnK93PVgKWJ6J95hks5g8j8P0HJlMzeoA6SsHY53eDwhdOkZXWnX6III756dH
	9rwJX+4hwIrsT/XrUnm95OtOdBw2lL8PZkAwZfxMesfg22q+rYH8p2KYoyDHjPKx6
X-Gm-Gg: ATEYQzwOFoDpNDavm5Zbkn6z2MlgN48eY5MaZxZO73wkCu4uKJmIFEMYM3+lXR9nFdt
	1THYArVayoIr4ev4UdWtcKMmV8e00DKwFUddlUrmIPXX8Sa2TMhnM5kds66ezdn/sxxgpD/HJr3
	dHtL2/gF3i/bDbjFldtrGnSigAzb+lOgj1+f5iJb6vPDsOrmESLOpOiWTEYoevqmXv0tugnMIeP
	jbfSkrqEGnoZPujy7gkIi41BUCxEwonJ0eiF9JNiav2PdDZk4/wTpkD0Mgh+d1okMnvDhai1NPo
	V1FIGH6EVkZANvijlEc9a9EIBBU1Dv/paMcNSeM08b0wY64vyPVrVBYKV4JjV8OuKKWOCrWIMZV
	FAejHXwm9NZqLH4m/7BqjbWwVFAvcHLMe2Hk1R2vRN4axNf6b04Lfxun1UUn30due1ElgUNJ9mr
	S3JyKbfh296Ea6cKjvRlEdLCznYqdwOz1zdh0=
X-Received: by 2002:a05:622a:1f92:b0:50b:4226:9250 with SMTP id d75a77b69052e-50d3bca3ef9mr33564681cf.44.1775028424013;
        Wed, 01 Apr 2026 00:27:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1f92:b0:50b:4226:9250 with SMTP id d75a77b69052e-50d3bca3ef9mr33564381cf.44.1775028423522;
        Wed, 01 Apr 2026 00:27:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:30 +0300
Subject: [PATCH 11/19] drm/panel: jadard-jd9365da-h3: use
 drm_connector_helper_get_modes_fixed
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-11-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2222;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8tZscVF4LDTph0agFYVE6JixtCC92BuTMt6rtWJ2nVU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+aZE2ueBWfYLpmo2dTDwR3qESfD9bzvyo/9cS8Wf3qu7
 viqqntXJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmYr6H/X85Z73Aa2WN3/zG
 V2VUbntaLtG5fLpR7MXSo7+eej3Js2SPDVRhnG8Uyy0kuqD99EoLpqYmkZUFnHUnVjio2XTaXWZ
 bFl6xwjGhZOutTuYbIemNTvtvFnosF+364WugcLS6bYfoxqyE1rbzHHkp8ydVsnxUVg7dtvSKVE
 9LseqhY+HiDfFB9oFP87O6I4M/XDQ+/XNb8+w717/pXvMo5DHOeD/vfdAlW7cVgUsLQtMKbbwL/
 tndm7jHzfq6W2rfqptbP2VM7ZK/pTkzvtUurUxb1yAx7OlrVqezmREBZe8nZR5/NPvgg8nbDTok
 dmzLqndyPMf3k13KNeXlP7lpd48vWlJrIBHAWWv4TDUWAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: XZSC4vbMZmZxh30w5kXHNdnLSb1rp35t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX03tc5JQjnoVQ
 EItuqWmzcIXuioNOwuRJUaVPVGC/dD/ra+CyTDWYS1Cp4O8bvuQinigHel0iOxnyZJC+zxBka+n
 kNyO+mxuyV71GBc4PuIzZFgC3vaPV/JZ20pKGVZKwUCg6mNZfBIKQW9T03YlHqcSFsRP4M5Wqut
 KbqXFP1GswYzfF9H8CYKmdKv5DtCyZKiOCf1GJPIGydi28oWSN+3TAal5JAnb/rqflFavyRKBat
 3v+2NpHrissmv8XcFt5TJyUKcw80KfHTQdmohAQl2EbNTYL7FV2/Zd9zdqGYyyt6BMpQqtzrVFq
 XoSXUKcSsOZf+8/fUvz02Q8O8jiPGXDddh7lZ7Ap/hwoBnqXT6WAq//s2PlAWVFYYrMElNp7N8a
 JOXlg/vOYhTI7ihEf87ayJwiydpZHZenYgoirjqJwaL7F0Pp3iw+88jfbsadLxBInT+t6tA2JJy
 SqfC1vD+cpKyZ3gBqYA==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccc8c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=51Y2UJ0wBrkUc3uRPtwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: XZSC4vbMZmZxh30w5kXHNdnLSb1rp35t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34540-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 40D51376059
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use existing helper instead of manually coding it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/Kconfig                    |  1 +
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 19 ++-----------------
 2 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index d6863b28ddc5..ba527b4d7737 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -337,6 +337,7 @@ config DRM_PANEL_JADARD_JD9365DA_H3
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_KMS_HELPER
 	help
 	  Say Y here if you want to enable support for Jadard JD9365DA-H3
 	  WXGA MIPI DSI panel. The panel support TFT dot matrix LCD with
diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index c33c611e03c0..1884ad2404cd 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -12,6 +12,7 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
@@ -149,24 +150,8 @@ static int jadard_get_modes(struct drm_panel *panel,
 			    struct drm_connector *connector)
 {
 	struct jadard *jadard = panel_to_jadard(panel);
-	const struct drm_display_mode *desc_mode = &jadard->desc->mode;
-	struct drm_display_mode *mode;
-
-	mode = drm_mode_duplicate(connector->dev, desc_mode);
-	if (!mode) {
-		DRM_DEV_ERROR(&jadard->dsi->dev, "failed to add mode %ux%ux@%u\n",
-			      desc_mode->hdisplay, desc_mode->vdisplay,
-			      drm_mode_vrefresh(desc_mode));
-		return -ENOMEM;
-	}
-
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
 
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, &jadard->desc->mode);
 }
 
 static enum drm_panel_orientation jadard_panel_get_orientation(struct drm_panel *panel)

-- 
2.47.3


