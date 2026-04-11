Return-Path: <linux-gpio+bounces-35040-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HxhHPo62mn0zAgAu9opvQ
	(envelope-from <linux-gpio+bounces-35040-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E098C3DFC31
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AC1430A82E5
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A45D35A3A9;
	Sat, 11 Apr 2026 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2wHr1uz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FpPc/b92"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DD435AC05
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909475; cv=none; b=ezJimvTCTdu9If0W4JnnqDUDHKTzIBk05rtWscfedBHeeoFREEHH3XEBgAnMHB95awxZsWJGofZvmml6USVyAgYv+/VL09JuxyGZ857ixhcMRv9eGKClNjJKZ5kpVvzxu8bfgsioQnAra/PWCP+el7jDByHa0hraF7CYaniLLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909475; c=relaxed/simple;
	bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBgc3FN8J13NjGwRzgyikmYQNRfyTpug+akKhcT8fPjYTsu/7WqGuQ3bUcL4js7/kzpdWD3wkLPFnM/m1UHkaLSj2hHBjpSpUpLhTkZDyKTuLZTd5EYuEn83ouk78vWKlvdrt6MELNU1G7bwcxbkeJjW1q5RMsBCL34+zW3cfx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2wHr1uz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FpPc/b92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43QrD621302
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=; b=H2wHr1uzFarsnWbr
	RWuyKjINp0F9L7cR4wBFNkE2CKeoiid1RufURMa91EV+DmM/G+Ufoo8CPps1rINw
	T8TwWVgoU7YggNUY2pLR3L3IKyEDEnYH1SMtScZsHqlLBQ/vCjirfTwQSN2Ibr4Y
	/UjgZRvYr7XgcMcklqcvoKZ36ncDkQcFbW2y06i4nMRVhncRKjYX7+PdH+Y8xr6g
	CEplf0vl8zMr0r0gifkSZPpr7bhYNvC4eJxg9tSNKQDHA5QhlFsk7lGlom5P6YFV
	yUjAEorKZSBNx94fkNWkTyevo5DysNIJrW5rdQ4fVVxFfiblonT55kJKrAWXvBEJ
	58Hpqg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrnbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so83666071cf.3
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909472; x=1776514272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=FpPc/b92bGr17+qZYnC9ujqtTCdlmOyyDyElo9ly7D1BLPzXw9O5+kK/OLBIGpGcU6
         22NVd7PoH2nh+asv8FHW0+HAZdhIrvsxJw+7E+GfMQPT0udjyW15gZOnCkXMEvZtisNO
         Po+KOE94JB6Z73eWboMltL/O8Sd2iqOKDi7/QmA33b5A4CbCyBX583YdDp8UiJjIMK7t
         P7TVf7mxeEyM3y3iNomyKdw39POKzUPJ2QO46ijblyyVx7UvNToaCZ++tBkSQRKapMOu
         ldVa/BSfAF6y+UuMjpfc+7Tghe+XL0784WTFj73FIayFSS81EhLlDm3tGZcIolFONbxs
         qttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909472; x=1776514272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YpKBdNEr1u1AKChljvnO5kynR6OA2izQM/2xPpjPVvg=;
        b=a+j57L8XFDcuACgHq89rxbdshZpWAL0dkKtjX0vq54YT7QeDD7sRccvnswXwb8zIbJ
         yiRczvODrUqgifpf7tyugHpDYQgYoXzOJJizEdQWjrjiv5XBVKjoNwjdzQMww1luUGWA
         IStXURc3MdgQ8pjWtYkyLgN7TikU1/le3bZ18j/xWn+JAF2fbHzzRJIylLfyHVrokkcl
         MURuK0oC3jXRXlOkayLFuqeTVCOEarzuctjSdIWoiY/C323NL1DIS10+PuP3KHy7HhlQ
         OjjRIFyvWAvohMDUrp0FasnD8CyAtIuJi2mxuHEhVULv7xWwdPdoIP9eNroB5MWfbtAx
         GyMg==
X-Forwarded-Encrypted: i=1; AJvYcCWkVi/BUjmBGF0e93nqeqUvMtTiTucqReBbJMzaCtNp6xaPpOyiJInGCynLa9LN/RJMl45fd4GLdvAn@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxCGHuuGxZyb9wYyMXY7yPUOU88fidaFPZfdBDgnFP7MkqWYG
	5sDFz6CTsjWc0Ye/QNsItWSJg23d2DABzm1/7Om2SexJJKFDjA1o6zvXYk4E5M9y8SyRHtSs/3n
	Ps7M8gi2ffb3MHWeglcDAiaUyvQZhhv76Lg8D48u/y71K2c6Ihc5h/bFzDvm5A3Tm
X-Gm-Gg: AeBDievywYd2yRD4XPgCJlghN2hJIZn3oawP2QmgBXIxvRxTQgfcLfa8yQu21ELYqPY
	iznDihdaYelMp/icoyk8/5Snm8NliRAV5J6pJpnS2nEcIooUqcVE6jTpDdcqTpNvN1ngO4cfJPQ
	pUMhdhtWhpFDwR1bK6aS/UdinpQsUjlmlIBt9dwz37rwXxOQ176lO/bnsZHtBLv+yvMr069Fsws
	OzffblvdOf++NF+yIoxpYs89EoOrd6PaiavATDZpnmk5/rnwTHKXgo5z8MFnWMu/dVppxjHzboc
	1FqwU8ZAHZxELxdtBs8YceueI5eaMVBTACmySMfxpzVULTSvZlNhxbq6jlP4tJ7ZciICrt/S0xo
	t4bO4MpJKmSXbSAVHEE7gA+Jjz+4l2hrG/q4QcrDAJVQ/hESQwbalujfrfJVDw020CRomdakXXs
	Udzy0OQSQP2pSLHWnYboGVBWPDgSc1RDqV8U0=
X-Received: by 2002:a05:622a:2b0b:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-50dd5b52faemr113980021cf.17.1775909471665;
        Sat, 11 Apr 2026 05:11:11 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0b:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-50dd5b52faemr113979611cf.17.1775909471243;
        Sat, 11 Apr 2026 05:11:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:31 +0300
Subject: [PATCH v2 11/21] drm/panel: jadard-jd9365da-h3: use
 drm_connector_helper_get_modes_fixed
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-11-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UaFNTqBtKso6xJSLFl/W79hsAPZIEJVjWT3TUsEBupk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpGp8PsS/O2FCpVORjQ8wZCgOK7n8tnCfIT4
 9ECz74fMDGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RgAKCRCLPIo+Aiko
 1ROWCACOd00exKXMQSTte66G3uQdSbvQqD8KnyZbu+F1PqhFoHjoN/Y2KtbqtQogzyAlM1PZIfr
 sfGgRrt7l/KndKUUm37DqFEJlv9tt0v8WmdwSyxYSLq3FTb6BKGf2UGNiBvHUZQZE7yjZ8lQOLw
 IDUxvTpTPdFgORnWeqkP6LxGuzx7s62h1uxLtDdy60v5MQjR8SbTN5p1Mt6K+26KtHgoTKzsm8k
 w2PaC8gb+AN2kYeNkk3GFLky24wfNQT9WhZtU/Kx7zRIEIqL1KJwXvT/mXOwCqWSly8pxO3Cu/g
 CudT6YRygiFI24casp4MrxAZqYHa6AKL+0Fs7M9qDoyMHmeV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UVTcTPRfxiwcAiz7Hsgpo6PkLQ9dE7Na
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da3a60 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xve7C_kOZ5OF2CZn6hQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UVTcTPRfxiwcAiz7Hsgpo6PkLQ9dE7Na
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfXwGdQsy3p2A9H
 urR0lmomqkH9ja4VNWstH9ubbm32M1V68N+P5e6wlpiUVitRpGSfQZrqDS5Vj7QiocARRYWyz0J
 McrhIxA5UlEcJQwmIlx6h31ow/vJC1/wxNsA+cjRssDUa3LN0XM++1m1vfCXI/pbqkKcrRcSIaA
 nDsJsLW//YnIUTkh46FRUl1JKHAbUWstuBnNEQY99OJZ27ZFlaHkF6Ab0Fh9NWZZgSyEz9v4Nbc
 ZJrm5E2hIyfhPuJ0H5KruvueZuKHe3/WgoTnd2+arEUXClhClQhyjiDyLap/oRYxLIbSFkqqezD
 VYvmxSM/wQ7AROx4H9iPTueBAaskNExIkNF32GnqbVoeO53GuQmb3lkuJJJgtUHBcOSqN4mPBzc
 3mRlrZQ8VBxpofmhUkKuT9VUDC/DIpQMvJWX7ARfCREa74Xu8DRnUqFfsnv04j2M91ZSU/JtG1K
 QArwGIyf4yofclq32nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35040-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: E098C3DFC31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use existing helper instead of manually coding it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
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


