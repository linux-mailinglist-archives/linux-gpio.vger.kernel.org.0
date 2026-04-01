Return-Path: <linux-gpio+bounces-34544-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id j7pBGB7LzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34544-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:37:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7137608D
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEB93306B823
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CFE3859EF;
	Wed,  1 Apr 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2li+jAH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLv2UcA4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576B3859EB
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028437; cv=none; b=bmTl19er4n5Gu7QeGbvX/GbJD20rueuTBiyHEd9OG95QU41uiVX2pkT0XpGSeHcSFNt+Bf+TxIATWzMqBPYAOJmm+iUAWOzH4J/+9Vd8YLUAjHBf0Ish36+7O4PsJiMaHSrXyedQjPVbHHBOSMC3uzwZL0ytPepvm0NUKB9IN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028437; c=relaxed/simple;
	bh=tTStsGPIZ4Vo3e7FecCp/521JDNDhqffDXsaoFNdND0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r3cy3rZBC7t8vPuyESzl0mseK4v91snwjRbJcmyI1L84OkVDfObUb+XnZw9gQywbvd381fuJpRcnL9Z84KX7+kKkrbG+wb7eHPFq32+nRnMNImgf46s9iCSrD3bhxODKplf/eUmByOuA+4aoEo7JK29Byu4tfFm9PwsKF9GeQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2li+jAH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLv2UcA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312dx2j3081986
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bPrfgsfeuNJhJ855zn+ScNK46UMDoVhM7/Kor+f5/4M=; b=G2li+jAHcaFLnwmq
	E9+TrhgS4K8v3TYJUp8w1xbZZE8IEq6qkMcK6Y6LbStL7lyScK46GrRCXVBIGnAW
	R5RZ+nJBh5V2vFuhjoo36fYCltLkWiNN6WfSr5J43eaYrWW46SqbaEXxKAoEQJoO
	ynOCsn55EfCa3x49ryrfQkeBA/Bq56aapK1PJo5SlTayT5zjY6ZckMkfcJWbhgnU
	Z1uC87wKaPT8qPSzs3KgWM24todiq9IpEfwiEBlowWeckJpHTnH0UvpFjuWjzHvq
	jMR57eSnPP8CdtK+H3/HqEQQn8j/W8TL0EDEbZ6GXArObEriVuy+mFXtxsxrGPnW
	3qd2NA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkttt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso58324361cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028431; x=1775633231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPrfgsfeuNJhJ855zn+ScNK46UMDoVhM7/Kor+f5/4M=;
        b=KLv2UcA4KVSEX3LWfBmpVAexysW3k/1NwfYRmcXmJceQPkVFuWKtYfO3L57SXDIjjw
         Wl4EBojTb3ES9VMMNThCW2hVU57sUTP4sItVID1IZvFYncNTQHEVbfubD/yCgnV/izPY
         XGHnbcD6CeDo7zoQwMA3C8/FB3FrwsJ2Cvw8OJL1NqdTto4FMQO31eyfltjYN3FH0n2p
         rYph7yTw/FRDbllNjl6ZZ9QvoVLMDVqB3xBc/PHknXnM+RoghJDsix0vdevkOGnJnC00
         xAqtepR+gW9+T2Txvp61vbyyQdWT+G0lgLD7THu8dZh0jYTmyndCnzV8VjxSK21qu43J
         oibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028431; x=1775633231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPrfgsfeuNJhJ855zn+ScNK46UMDoVhM7/Kor+f5/4M=;
        b=aGcDK3Ped/4IBfo4CK6qiQhHn7m1SXud+DahetUeO/Wbr0nA9A8CP6kuiA3ASRDOs5
         6SPi6jQqM3iUYblzfrumMPeWlXJOlc72RUTP6BbrIamHpWFeQv+aTt7coYyKRiWO86Zb
         9RHa7/qTX+Gjceo8iF40rnkXlc9SdUXEck2MGjdM+uUIKYkBxseR0N1hyrEvaaJBYloO
         jxYwrOHMfYtgYjz7GmQnNMkhtd1fB7p/HXAqhPbhbPQGwUqaH4TaXWJUVosIGqd/uoUS
         paOWEIYLL/6czPyF3jRkwAlUvnCJL1Qy5QRqDVuvmeHHo5SKu9iPE+vGUkqske/J/SD6
         R+xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1mG9SoIH1u+M3k8CCt233lutZvUja0Tfwy3To6Bn7VxXlAAA5iArfUvn9qJH03diCqIs1rL3tppm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyec3gU7+qtnP5kGFYYePehbNWNWaNGakZbWjSeX1fc4tn4GWxP
	M03ECdH6vVq9en/Ls7jUngGDXPll4jvwOvpKbXMIMWdkS75UZHFGBIWxa7BQnwZwrK8t+5ZfMqm
	IeuUhIdGmuaA6HIZrCM83PHqI0twV1JUh65hVL8i/OB3fDEMa438jpU8Knw7GxpkV
X-Gm-Gg: ATEYQzza0bkazfmx8Yd2tTBRpHuCi+paDgq0i0Es8WHn+P0hpOTXDe5itxSXdx9UQnq
	7kaZjxDhblR0LTtrtobRSbHgeAW7nC9DPe2+9o7OCJREbpcFY0FQ2QRJAR6++Ibp8D5Oj4SGiJt
	hyDvW5kvtycMYV0Y3XJJ6FuSHZKqdNqY45W6iDQdZHwQwPVcD1Sc4HVHLCy8WKviiC2CAw/fayA
	6jfIJ2RWtSb1Iz+csd1LdVMutreFNdnNeKAvRaUc3ozOcndAtjGhoVOWPr44wCN9c6drZJnm8J6
	YIBlumfPEugbbRLnLvdr40HVrm8yYp/2y8rFdukHABc910otGMuuHs8yYyC5yyXGEzdMdWasHnp
	FADODYaPtWWTJN+j9sOknb7KXjZbnYGmJF/Y+wBpo1sKQKkn9e7saTkyqpSUiQf6uf8EXmr/sjE
	LwskcvbCepcjxX/a3/CFyEM9ED3mRA9t3JTF0=
X-Received: by 2002:a05:622a:a987:20b0:50b:8b03:e9d0 with SMTP id d75a77b69052e-50d3bbbb4ebmr27864181cf.22.1775028430126;
        Wed, 01 Apr 2026 00:27:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a987:20b0:50b:8b03:e9d0 with SMTP id d75a77b69052e-50d3bbbb4ebmr27863871cf.22.1775028429343;
        Wed, 01 Apr 2026 00:27:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:33 +0300
Subject: [PATCH 14/19] drm/panel: jadard-jd9365da-h3: support Waveshare DSI
 panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-14-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=70595;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tTStsGPIZ4Vo3e7FecCp/521JDNDhqffDXsaoFNdND0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMit4g/5xA/vVEEPU4CTWRvzk2BcSEep/Wsfg
 cDUdZsY32+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrQAKCRCLPIo+Aiko
 1ZvmB/wLdbf7n96T466Ekd7X3RIWBS6iKWAKiDwvlePz6KUxE7G0fVpZFhwOq6/YvItQg8q6wLL
 HTpMXrZ7gh4qCYeZPHvShCBKFLhlhu9lu/klJdDmBuKdHvRFjhASIMRBit4AJhWHPOzYgWaGe/0
 1W2ZTPxD73tJY+ooKUcptjR4jJYj9VEEOEvimYrfiPpKkK/KihNMDGMoLxz4Yop7q3Ks2cvACl8
 LMLK/IpCtSRLsVSFvNvdLrtDtqoMy5y356crTfoK9/8/fewu0BC5E+8/pznd0MYszvO+eUIYn/c
 31Iqij5XSB7GPIT9DL0Bx6lt/NEbLCCuJ3U8rmZEu0ewS+EF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX/bG4lznQ5Uk2
 ZhqsQkXPsJ6iudEKm5TKlu6yuwj6q07yMZGTmuH6HcCjavC2nJ4nKoYdOBTUSdcymTx77UrM51Y
 L5GGSGyZG+zjPRBj94eywYrO7xCkARVorT+ta0QEmKyNuX/inpDjbEPitkXJDUoAhHNINYv7QkG
 ExR6s5bUYC7qEl5qLYmDdIMarkUmeLIdnC78LIg5vjPdl1oXap/9ijXBlfJC+SGELjIUOYnK3l0
 iWT7dgkvoMlOjZrfOD4XGlKZPZdnN7OCz/Kb/98BZPMFfNTuVbP08JrSxoufs6bIoqMiwiknJQ/
 POR/2zi9AeXrf8Y+JPaxSDzsPDvxAN+y2VkZNlCrLuvTy6JqT61XbKjfYCgZpxUJcCxZgYqZeiX
 d5nc/brsQ9CduMMn3h9CHFI9ZfJOnLD+ZGzrfBDp01g7hH9pAnPDmuPCN3+R2N3GQ3HymYoBtns
 MbtTPrj4HwhJrRifY4w==
X-Proofpoint-GUID: s1_JArpUfDgrg_sqf9gFNO8lubpt-JB0
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccc8d0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zhGZgHc4fHUupUgVLZYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: s1_JArpUfDgrg_sqf9gFNO8lubpt-JB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34544-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 86F7137608D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add configuration for Waveshare DSI panels using JD9365 controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 1524 ++++++++++++++++++++--
 1 file changed, 1440 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 11b7e07c1af8..e9a461239301 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -21,6 +21,8 @@
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 
+#include <video/mipi_display.h>
+
 struct jadard;
 
 struct jadard_panel_desc {
@@ -1599,115 +1601,1469 @@ static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
 
-static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
+static int waveshare_3_4_c_init(struct jadard *jadard)
 {
-	struct device *dev = &dsi->dev;
-	const struct jadard_panel_desc *desc;
-	struct jadard *jadard;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
-	jadard = devm_drm_panel_alloc(dev, struct jadard, panel, &jadard_funcs,
-				      DRM_MODE_CONNECTOR_DSI);
-	if (IS_ERR(jadard))
-		return PTR_ERR(jadard);
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
 
-	desc = of_device_get_match_data(dev);
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
 
-	if (desc->mode_flags)
-		dsi->mode_flags = desc->mode_flags;
-	else
-		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
-				  MIPI_DSI_MODE_VIDEO_BURST |
-				  MIPI_DSI_MODE_NO_EOT_PACKET;
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
 
-	dsi->format = desc->format;
-	dsi->lanes = desc->lanes;
-	if (!dsi->lanes) {
-		dsi->lanes = drm_of_get_data_lanes_count_remote(dsi->dev.of_node, 0, -1, 2, 4);
-		if (dsi->lanes < 0)
-			return dsi->lanes;
-	}
-	dev_dbg(&dsi->dev, "lanes: %d\n", dsi->lanes);
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
 
-	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(jadard->reset))
-		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->reset),
-				"failed to get our reset GPIO\n");
+	jd9365da_switch_page(&dsi_ctx, 0x00);
 
-	jadard->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(jadard->vdd))
-		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vdd),
-				"failed to get vdd regulator\n");
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(5);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
-	jadard->vccio = devm_regulator_get(dev, "vccio");
-	if (IS_ERR(jadard->vccio))
-		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
-				"failed to get vccio regulator\n");
+	return dsi_ctx.accum_err;
+}
 
-	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "failed to get orientation\n");
+static const struct jadard_panel_desc waveshare_3_4_inch_c_desc = {
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (800 + 40 + 20 + 20) * (800 + 24 + 4 + 12) * 60 / 1000,
 
-	ret = drm_panel_of_backlight(&jadard->panel);
-	if (ret)
-		return ret;
+		.hdisplay	= 800,
+		.hsync_start	= 800 + 40,
+		.hsync_end	= 800 + 40 + 20,
+		.htotal		= 800 + 40 + 20 + 20,
 
-	jadard->panel.prepare_prev_first = true;
+		.vdisplay	= 800,
+		.vsync_start	= 800 + 24,
+		.vsync_end	= 800 + 24 + 4,
+		.vtotal		= 800 + 24 + 4 + 12,
 
-	drm_panel_add(&jadard->panel);
+		.width_mm	= 88,
+		.height_mm	= 88,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_3_4_c_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
 
-	mipi_dsi_set_drvdata(dsi, jadard);
-	jadard->dsi = dsi;
-	jadard->desc = desc;
+static int waveshare_4_0_c_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
 
-	ret = mipi_dsi_attach(dsi);
-	if (ret < 0)
-		drm_panel_remove(&jadard->panel);
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
 
-	return ret;
-}
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x64);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0xc7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x1b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x0f);
 
-static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
-{
-	struct jadard *jadard = mipi_dsi_get_drvdata(dsi);
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x5e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
 
-	mipi_dsi_detach(dsi);
-	drm_panel_remove(&jadard->panel);
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0xa6);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(5);
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	return dsi_ctx.accum_err;
 }
 
-static const struct of_device_id jadard_of_match[] = {
-	{
-		.compatible = "anbernic,rg-ds-display-bottom",
-		.data = &anbernic_rgds_display_desc
-	},
-	{
-		.compatible = "anbernic,rg-ds-display-top",
-		.data = &anbernic_rgds_display_desc
-	},
-	{
-		.compatible = "chongzhou,cz101b4001",
-		.data = &cz101b4001_desc
-	},
-	{
-		.compatible = "kingdisplay,kd101ne3-40ti",
-		.data = &kingdisplay_kd101ne3_40ti_desc
-	},
-	{
-		.compatible = "melfas,lmfbx101117480",
-		.data = &melfas_lmfbx101117480_desc
-	},
-	{
-		.compatible = "radxa,display-10hd-ad001",
-		.data = &cz101b4001_desc
+static const struct jadard_panel_desc waveshare_4_0_inch_c_desc = {
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (720 + 40 + 20 + 20) * (720 + 24 + 4 + 12) * 60 / 1000,
+
+		.hdisplay	= 720,
+		.hsync_start	= 720 + 40,
+		.hsync_end	= 720 + 40 + 20,
+		.htotal		= 720 + 40 + 20 + 20,
+
+		.vdisplay	= 720,
+		.vsync_start	= 720 + 24,
+		.vsync_end	= 720 + 24 + 4,
+		.vtotal		= 720 + 24 + 4 + 12,
+
+		.width_mm	= 88,
+		.height_mm	= 88,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
 	},
-	{
-		.compatible = "radxa,display-8hd-ad002",
-		.data = &radxa_display_8hd_ad002_desc
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_4_0_c_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static int waveshare_8_0_a_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x7e);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x4e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xb7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xb7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x54);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x10);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x35);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x56);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xd5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x12);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x7b);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x59);
+	if (jadard->dsi->lanes != 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
+	}
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(60);
+
+	return 0;
+}
+
+static const struct drm_display_mode waveshare_8_0_a_mode = {
+	.clock		= (800 + 40 + 20 + 20) * (1280 + 30 + 12 + 4) * 60 / 1000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 40,
+	.hsync_end	= 800 + 40 + 20,
+	.htotal		= 800 + 40 + 20 + 20,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 30,
+	.vsync_end	= 1280 + 30 + 12,
+	.vtotal		= 1280 + 30 + 12 + 4,
+
+	.width_mm	= 107,
+	.height_mm	= 172,
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static const struct jadard_panel_desc waveshare_8_0_inch_a_desc = {
+	.mode_4ln = &waveshare_8_0_a_mode,
+	.mode_2ln = &waveshare_8_0_a_mode,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_8_0_a_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static int waveshare_10_1_b_init(struct jadard *jadard);
+
+static const struct jadard_panel_desc waveshare_9_0_inch_b_desc = {
+	.mode_4ln = &(const struct drm_display_mode) {
+		.clock		= (720 + 60 + 60 + 4) * (1280 + 16 + 12 + 4) * 60 / 1000,
+
+		.hdisplay	= 720,
+		.hsync_start	= 720 + 60,
+		.hsync_end	= 720 + 60 + 60,
+		.htotal		= 720 + 60 + 60 + 4,
+
+		.vdisplay	= 1280,
+		.vsync_start	= 1280 + 16,
+		.vsync_end	= 1280 + 16 + 12,
+		.vtotal		= 1280 + 16 + 12 + 4,
+
+		.width_mm	= 114,
+		.height_mm	= 196,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (720 + 50 + 50 + 50) * (1280 + 26 + 12 + 4) * 60 / 1000,
+
+		.hdisplay	= 720,
+		.hsync_start	= 720 + 50,
+		.hsync_end	= 720 + 50 + 50,
+		.htotal		= 720 + 50 + 50 + 50,
+
+		.vdisplay	= 1280,
+		.vsync_start	= 1280 + 26,
+		.vsync_end	= 1280 + 26 + 12,
+		.vtotal		= 1280 + 26 + 12 + 4,
+
+		.width_mm	= 114,
+		.height_mm	= 196,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_10_1_b_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static const struct drm_display_mode waveshare_10_1_a_mode = {
+	.clock		= (800 + 40 + 20 + 20) * (1280 + 20 + 20 + 4) * 60 / 1000,
+
+	.hdisplay	= 800,
+	.hsync_start	= 800 + 40,
+	.hsync_end	= 800 + 40 + 20,
+	.htotal		= 800 + 40 + 20 + 20,
+
+	.vdisplay	= 1280,
+	.vsync_start	= 1280 + 20,
+	.vsync_end	= 1280 + 20 + 20,
+	.vtotal		= 1280 + 20 + 20 + 4,
+
+	.width_mm	= 135,
+	.height_mm	= 216,
+	.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static int waveshare_10_1_a_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x3b);
+	else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x38);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x38);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xaf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xaf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x81);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x14);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x23);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0d);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x69);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x6b);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x5c);
+	} else  {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x6a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x5b);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x4f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x3f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x2b);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x4a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x3d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x2a);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x43);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x43);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x63);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x44);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x62);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x52);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x4e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x20);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x0f);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x59);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x4c);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x48);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x3a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x26);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x6b);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x5c);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x6a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x5b);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x4f);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x2b);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x4a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x3d);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x2a);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x43);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x43);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x63);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x44);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x62);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x52);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x5a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x4e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x20);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0f);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x59);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x4c);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x48);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x3a);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x26);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x02);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x02);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x37);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x37);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x42);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x77);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x77);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x49);
+	if (jadard->dsi->lanes == 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x01);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x01);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x00);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x1e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x1f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x17);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x37);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x37);
+	} else {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x41);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x40);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x5e);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x5f);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x57);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x77);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x77);
+	}
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x48);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x1f);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x1e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x30);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x16);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x1d);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x6a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xdd);
+	if (jadard->dsi->lanes == 4)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x3f);
+	else
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x82);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x61);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
+	if (jadard->dsi->lanes != 4) {
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
+	}
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe7, 0x0c);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(60);
+
+	return dsi_ctx.accum_err;
+}
+
+static const struct jadard_panel_desc waveshare_10_1_inch_a_desc = {
+	.mode_4ln = &waveshare_10_1_a_mode,
+	.mode_2ln = &waveshare_10_1_a_mode,
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_10_1_a_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static int waveshare_10_1_b_init(struct jadard *jadard)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	jadard_enable_standard_cmds(&dsi_ctx);
+
+	jd9365da_switch_page(&dsi_ctx, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0xbf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0xbf);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0xfe);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x74);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x7e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0xa9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x38);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x71, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x72, 0x52);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x73, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x74, 0x3d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7b, 0x3f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7c, 0x2d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x80, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x81, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x00);
+
+	jd9365da_switch_page(&dsi_ctx, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x57);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x45);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x4b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x4a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x49);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x26, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x41);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2c, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2d, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x30, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x31, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x36, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3a, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3c, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3d, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3e, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x40, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x41, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x42, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x45, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x46, 0x15);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x17);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x50, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x51, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x53, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x54, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x57, 0x1f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5e, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x69, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6b, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6e, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6f, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xe3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x76, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xd5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x79, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7d, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x66);
+
+	jd9365da_switch_page(&dsi_ctx, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x48);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x58);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x0f);
+
+	jd9365da_switch_page(&dsi_ctx, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x1d);
+
+	jd9365da_switch_page(&dsi_ctx, 0x00);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	msleep(120);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	msleep(5);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_TEAR_ON);
+
+	return 0;
+}
+
+static const struct jadard_panel_desc waveshare_10_1_inch_b_desc = {
+	.mode_4ln = &(const struct drm_display_mode) {
+		.clock		= (720 + 60 + 60 + 4) * (1280 + 16 + 12 + 4) * 60 / 1000,
+
+		.hdisplay	= 720,
+		.hsync_start	= 720 + 60,
+		.hsync_end	= 720 + 60 + 60,
+		.htotal		= 720 + 60 + 60 + 4,
+
+		.vdisplay	= 1280,
+		.vsync_start	= 1280 + 16,
+		.vsync_end	= 1280 + 16 + 12,
+		.vtotal		= 1280 + 16 + 12 + 4,
+
+		.width_mm	= 125,
+		.height_mm	= 222,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.mode_2ln = &(const struct drm_display_mode) {
+		.clock		= (720 + 50 + 50 + 50) * (1280 + 26 + 12 + 4) * 60 / 1000,
+
+		.hdisplay	= 720,
+		.hsync_start	= 720 + 50,
+		.hsync_end	= 720 + 50 + 50,
+		.htotal		= 720 + 50 + 50 + 50,
+
+		.vdisplay	= 1280,
+		.vsync_start	= 1280 + 26,
+		.vsync_end	= 1280 + 26 + 12,
+		.vtotal		= 1280 + 26 + 12 + 4,
+
+		.width_mm	= 125,
+		.height_mm	= 222,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.format = MIPI_DSI_FMT_RGB888,
+	.init = waveshare_10_1_b_init,
+	.mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
+		MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
+};
+
+static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
+{
+	struct device *dev = &dsi->dev;
+	const struct jadard_panel_desc *desc;
+	struct jadard *jadard;
+	int ret;
+
+	jadard = devm_drm_panel_alloc(dev, struct jadard, panel, &jadard_funcs,
+				      DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(jadard))
+		return PTR_ERR(jadard);
+
+	desc = of_device_get_match_data(dev);
+
+	if (desc->mode_flags)
+		dsi->mode_flags = desc->mode_flags;
+	else
+		dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
+				  MIPI_DSI_MODE_VIDEO_BURST |
+				  MIPI_DSI_MODE_NO_EOT_PACKET;
+
+	dsi->format = desc->format;
+	dsi->lanes = desc->lanes;
+	if (!dsi->lanes) {
+		dsi->lanes = drm_of_get_data_lanes_count_remote(dsi->dev.of_node, 0, -1, 2, 4);
+		if (dsi->lanes < 0)
+			return dsi->lanes;
+	}
+	dev_dbg(&dsi->dev, "lanes: %d\n", dsi->lanes);
+
+	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(jadard->reset))
+		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->reset),
+				"failed to get our reset GPIO\n");
+
+	jadard->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(jadard->vdd))
+		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vdd),
+				"failed to get vdd regulator\n");
+
+	jadard->vccio = devm_regulator_get(dev, "vccio");
+	if (IS_ERR(jadard->vccio))
+		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
+				"failed to get vccio regulator\n");
+
+	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get orientation\n");
+
+	ret = drm_panel_of_backlight(&jadard->panel);
+	if (ret)
+		return ret;
+
+	jadard->panel.prepare_prev_first = true;
+
+	drm_panel_add(&jadard->panel);
+
+	mipi_dsi_set_drvdata(dsi, jadard);
+	jadard->dsi = dsi;
+	jadard->desc = desc;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		drm_panel_remove(&jadard->panel);
+
+	return ret;
+}
+
+static void jadard_dsi_remove(struct mipi_dsi_device *dsi)
+{
+	struct jadard *jadard = mipi_dsi_get_drvdata(dsi);
+
+	mipi_dsi_detach(dsi);
+	drm_panel_remove(&jadard->panel);
+}
+
+static const struct of_device_id jadard_of_match[] = {
+	{
+		.compatible = "anbernic,rg-ds-display-bottom",
+		.data = &anbernic_rgds_display_desc
+	},
+	{
+		.compatible = "anbernic,rg-ds-display-top",
+		.data = &anbernic_rgds_display_desc
+	},
+	{
+		.compatible = "chongzhou,cz101b4001",
+		.data = &cz101b4001_desc
+	},
+	{
+		.compatible = "kingdisplay,kd101ne3-40ti",
+		.data = &kingdisplay_kd101ne3_40ti_desc
+	},
+	{
+		.compatible = "melfas,lmfbx101117480",
+		.data = &melfas_lmfbx101117480_desc
+	},
+	{
+		.compatible = "radxa,display-10hd-ad001",
+		.data = &cz101b4001_desc
+	},
+	{
+		.compatible = "radxa,display-8hd-ad002",
+		.data = &radxa_display_8hd_ad002_desc
 	},
 	{
 		.compatible = "taiguanck,xti05101-01a",
 		.data = &taiguan_xti05101_01a_desc
 	},
+	{
+		.compatible = "waveshare,3.4-dsi-touch-c",
+		.data = &waveshare_3_4_inch_c_desc
+	},
+	{
+		.compatible = "waveshare,4.0-dsi-touch-c",
+		.data = &waveshare_4_0_inch_c_desc
+	},
+	{
+		.compatible = "waveshare,8.0-dsi-touch-a",
+		.data = &waveshare_8_0_inch_a_desc
+	},
+	{
+		.compatible = "waveshare,9.0-dsi-touch-b",
+		.data = &waveshare_9_0_inch_b_desc
+	},
+	{
+		.compatible = "waveshare,10.1-dsi-touch-a",
+		.data = &waveshare_10_1_inch_a_desc
+	},
+	{
+		.compatible = "waveshare,10.1-dsi-touch-b",
+		.data = &waveshare_10_1_inch_b_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);

-- 
2.47.3


