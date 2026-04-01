Return-Path: <linux-gpio+bounces-34546-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GDAmFPzJzGktWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34546-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:32:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE94375F0E
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C7CD306E2C4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E7038734A;
	Wed,  1 Apr 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpANGx+K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kc6Qb6mU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3DE38644D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028450; cv=none; b=hTv6ONS6uiaJTY55yWPr8ibwlyWywQJYB2qNcdoBaLJ/TQtjzoxzXoZ9BXwltZga/mO8uwDj2ji3iwbMVdLb7viu9YwzNSkFvw+VZwcj8UrLoGd9Bm+/AxspR96rlpbbYEqMGzcUCTnKRSQL735jDIGLJI6vqi56qp/XH8MaoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028450; c=relaxed/simple;
	bh=th1gZiG+uiTFjdqPeLSNpZDrwBrXUjsQq3S47bfFVWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AjXGa/17zi8f4d1sYNbYC+UiPaZOWHFLqWvBvDMSxm4d3O0hMKNNTGdD3twca+6lWg2X8pjnJSCeDMyAA/XWDivxevkdhJqPL8D7UfMKFzI5v0X98kUFC1HNm7bVkHrNm6vcja5NlqBSw4HPBe5SOApyCX5N6NkQDZwoHRH3in4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpANGx+K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kc6Qb6mU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317Gqea3103831
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7GMiCfMQvlQASFFq+WsdvEPLNPcgoyaFOU1CUCJmjxI=; b=JpANGx+KUhIhHaqX
	GpACUN6dhcqb0nYfRapQdeHm6Kqlg6Teti2BdvmBi5mOhAZfIX7ajAjalkCfu0xa
	gO1YX/TjdgCn0wJ7YwtQLusOkSX3RNZ1BSxKCtyNYpTfGtZZ51qiny08V6CzmjcY
	4eNEEoPrHPDlM0qM3YRRlvQ2/41yJBGh47ukUn7Bq9n4EnjacrDR1sXwNStLdRlF
	aEhd3wdMX2+puiiQlJ1EiFWw43wH6dvsi8vkvJd2ioVVzqZ34t6DZqA1FdzOfdc2
	viw6bTE+SkOaJ4dCUtiMdUdS+LsiIi9NSwz/cv4jpv5CrJe6unJGMX5E+AcRAw+z
	Jao0rQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js233ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b34223670so95448141cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028443; x=1775633243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GMiCfMQvlQASFFq+WsdvEPLNPcgoyaFOU1CUCJmjxI=;
        b=Kc6Qb6mUfvb1qzNBwXL67e0wE0wiEsmG6CbXKqO0XXp65Q/GKyaWfsSUfkRGV6INKT
         rufuFqmP+d1bfeNEg9smhivaL0EIZFc0RfTM3i8sG4BpetqMsc1tQZKGywTT4/h58zT7
         InpaUh6qYMtE2NSGne3e1efmlZ/bFyLfv8y0XP/TQI6KND3bblJRZSQwFyAYGQTUDzsg
         fsD+/Z+cVv5HFtwAcSYqyuLeNy91E0z4XVym7Kvdnx/2O4D3Np50R6IpKnILHMwmMz8d
         6wSfOT1F++Mb8+yv9JRszzlEJsvEJzJYJJ/C4vnXLh3neIqnDJswT8gdo9P2MLs2LIX/
         BLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028443; x=1775633243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GMiCfMQvlQASFFq+WsdvEPLNPcgoyaFOU1CUCJmjxI=;
        b=TEgdliaE2uOlx0MRDfG9quPcMHkpt2XtEjElXpj9crKFs+F2rSMF3iPBEHyMenZO3s
         uH4x0OGbrfcnYIviZ1F3aeoV4J6TiF8ZZequ+I8e4+4tNBXPvvPdcImYv7cWm4RyyS+i
         dPLcMlJDxJNz+B0/mwnFZyCNCeNv2+rOzJTFlJV0GDUIsq85EjH0q56K0K9f16vJOGZm
         xMQGGSLlhTdQ3Q52e4JmKTH7jfCoBlSTk7OPNt5oR9kL2v3NLNkuzRsZfpGjeJv58J5p
         A7tWj2ePQ7P4kFaJUuZ5Muoqsekv3zETt0yXzG/NYIUJOkG6RBrWzfOKvzBQUsaHYFkH
         fn1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyNtheGTzHM2nVdEbezySHr4K+Af8rZcgt1gaJeCbiplEwvnAcShLzzKkqkG3pnUjcQVn03F6MFobs@vger.kernel.org
X-Gm-Message-State: AOJu0YxweY71187FCCP8KI/g3IS9PjC8rolZWOXAdXC1ioV9RBhJYw94
	fyT9wwQhRgYB9txQx8LqRx+guZokhnP/v58c12kbAvxIy3+y4/0Z2UMXRLz+szM1gGUezvOew2r
	8uGolepm30stPCvf3dOuFwROLVtAGiJgA0uwqiVMykI2G9EnW2VzsswsW3vxzBN6h
X-Gm-Gg: ATEYQzyGxnBF7Dtvd82BPBER+g7641yQHuDJjm9+IMoWx9ACqnewffpZ26GdgyzDEug
	gkUQ8wB+PJDd9Cq7YWJ/pBz1tXsxGUUZ1ewXhOpr5NwvufgDA3GP7C9ivCsvP/CyytpH8YxyamV
	/LfmeH+MWfQNtqL4NylMnb7yRX2+R1CSE2uwFvKmUqVFUOC2wmBXSY2oOq43Y12Gw6R2u/8WUfv
	f3TWRP4mAXy+PGuahztvYKQKWAt0oSzuLLQ4eB7gJE9Lf1IqVb/yy0ygeG34hNgqWIAWEEg/UcL
	7X8z6r6Odb47FW3ViyuzZgsig/VfaYbTfYIR43dtmO0W84bkQKB5UcYzYvlGInu0yQ/jFeBCVla
	BQyj+zEK+CnvutTChIbSuuqzGmR9nTy8dMrIixZh6XvpA2RcdhP/FpDRwQ4yB1eopdP9ancje+u
	FWoZwiDtHFUNOWqH426TmSnVLri9+1L4+3/7U=
X-Received: by 2002:a05:622a:5a9a:b0:50b:2875:fe26 with SMTP id d75a77b69052e-50d3bd9484fmr33488091cf.60.1775028442762;
        Wed, 01 Apr 2026 00:27:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5a9a:b0:50b:2875:fe26 with SMTP id d75a77b69052e-50d3bd9484fmr33487901cf.60.1775028442363;
        Wed, 01 Apr 2026 00:27:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:36 +0300
Subject: [PATCH 17/19] drm/panel: add driver for Waveshare 8.8" DSI TOUCH-A
 panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-17-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7876;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=th1gZiG+uiTFjdqPeLSNpZDrwBrXUjsQq3S47bfFVWg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMit1KFTklyVChksefN2NxG+SAGMFBbH3NSTk
 0JbMpWKXf+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrQAKCRCLPIo+Aiko
 1VDsB/0YT9nMHpMgUBSQt0GOsp/uBKd/ZKTfj/+pk3Wq+jculDzyCppGpEsqS9PgLPKNtWmlABy
 RyvxMvUFdrJ5xAlqKsDSLxiXozWpU3Aw6IMT4i39tjdR1KzmLEhulLM+jMyVCeTHLtVIEUzsSmk
 64OCWCSAE8qDJk3iO9LROJvmee3VTviURbXI5puWlptLHn6Nsg9lYdAysZ73Qmk1LwsqTtwcZ96
 9Sw/PIr8m3CuUanzyT2Ywj4uBnRsGzdpt3+mKdLmMOR2NWHK4dPdu5yPs5jt70fu9xwu/DqamqM
 tx+1P4CE2rZpv7/l1nbwWzINIeRFXimKHHflgOILaBEVXXtX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UwoSs0vQ2q1fC8HbD9TCyq6KOAW1ZBG-
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccc8db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=EevSAkNhRZFgIoKfYqQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXxMpfvRfKpxIi
 bcU2T6Co3azqYmrETT9RxFNPH8QNE0TjbpjXZA+xXK+OVSa7IAfwax5Yz0jBidCoWjW6R89hw7Z
 JF6AD2QgAP/U2DD7HGw6Il+mICYPmH5r3moz7qPCVO+VctZkZ0L82XW2fjXsn1CM0ThcABC53h5
 3U07RpgxLnLF1Odm3jB/2V1L5Izr9OARISzjInuJl5O1B/8y5g7OTTTMsVUjggpxiuGhINwzKkE
 lntnYS1dgCMgBEI0U+TL6+PcQYN8kQp8VmFqZ834h9bJUJlygA9bcZOlMZkCQ5aWlsvzVsMAgxt
 to5j9FCrvJ3/pnovDJw6SWO9BUShUNePAkVtKw/kIUaszCGiB7Duz2zpbE3o79dpTgrtQUA3y2g
 he779hTzJNs/McmNN3IOUowTuNrrlppLga4X6zwqoTRCZ6LA38IicJ0wk4fw5QNDW+GHfDuJ0NP
 RZY1U2W2s9vwHXiO2sg==
X-Proofpoint-GUID: UwoSs0vQ2q1fC8HbD9TCyq6KOAW1ZBG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34546-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: EEE94375F0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add driver for the panel found on Waveshare 8.8" DSI TOUCH-A kit. It
uses ota7290b IC as a controller.

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


