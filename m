Return-Path: <linux-gpio+bounces-34545-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFklJqfLzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34545-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:39:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95889376147
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8691A3091695
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C293806AC;
	Wed,  1 Apr 2026 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0QwnNKC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeWd8fBJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372A03803E4
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028446; cv=none; b=pz8PnQEnNudRZblH3T9fhjWHCpecMJ2hr45wyanRikm3E8f2ZSYXZU0SKuAaAmPCyMxkKOmPVNylGniyX+MZj/vT2FKiZEhwYZIQkndD56DboQqo5NeKuP9X6qd2OPygbMDYZM8ZR9ywPj9qjN0sdmt4d9UnfQFWCiMZkZjNOpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028446; c=relaxed/simple;
	bh=r6Up/NY1fdRwk7oQTpx7zUWlF65EBySH6t0rkQuUn0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vonjcx2UryaQoFiF3kmfWI0cJ15A3nvEe/cY0jRgidow9iAh9vIY/hQ7BkkSMM1TscUsTP/LjPqeV0mANlQAwWt5RlMzNzdtNCjZ9mjch64oQSzrs3EDiWI/iwqcvbiGdSU3uuRFh4U2jUl4BStBzyuY6lQokoBV6vUhRVjCHwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0QwnNKC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeWd8fBJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VGv51459303
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1jG6fWLqrKrr2bIljqRcF9lJXBS1ljQA7abmmA6bs3U=; b=d0QwnNKC3tygGyZT
	Ny4G1ErORX4BFvbJPAlWX9OHCYvN8gJeXyeDaNQuyLV8Wpy7tRXCef28V3XZhy+q
	lBoHlaw0BrERHq6255lD6JUCU67adAwsMzaXkATK5fEelzHsoEaoR2ADMSMYTN1d
	ikEIIjN0y3vu+JTcLGTV3UQLCjfDVSq45s5SwyihlAf4zbs8tCjcibwnXpqZqmYV
	JhpUyYX4j62avROzBQl9/U9HnBmMYHETNbazesX0U64B+HFXxU/j4PnhbHnl+syF
	5erMMrNH+cOO0Wpmjd9GRStCi6qciGblhXcss8YtYaHe53t8howI7SkcDzt+kVps
	G528bQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0uwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b878a8c07so138101891cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028439; x=1775633239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jG6fWLqrKrr2bIljqRcF9lJXBS1ljQA7abmmA6bs3U=;
        b=FeWd8fBJaEISeXDq/iST9JyY2iOqV1wBrh/sbqjmJfqy2xxBnbDnuhi6Cp3Tl7/7oc
         BhDSTC87/qF2wyXVXPYnZCMhtUDVxmaefsRqukGf+8tujrcjuh6ITpi7v1RlII7bJCFX
         GRHNnBIbhjA65SuLAP5t3zccSqjFOQ1Qfd68wnOu32+lyF5adNxIwYln9jXbXPeLjLu4
         OPf9YWA/1B1JTIKcttYhpNjUAfpuGVSrbIo/sCv3ccOqyuRRWnG4a0KFeOn1z+4T9MM3
         lKI1OVRdfMvqEstBOt8mApwy4muysoAIeISDAxW4e4UgWPDT3ICry7K0OnZmjBpw4db0
         Gu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028439; x=1775633239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1jG6fWLqrKrr2bIljqRcF9lJXBS1ljQA7abmmA6bs3U=;
        b=aZYae+kel4U+2miD8fys8lOPTE6yQegwJR9sTehESNRYEHVSm60VITG03dz939ptSD
         OJ35Fa6OGju12eJeWnkoS+J7tP1X6eBvRytg9jo/fQ4FK7zprnX9jvgvhMZ5L95igWs0
         DPfaBzxMbfp2P4y7dZSlhw/8dOI32fG3+/nYV4G1Tzgt1V+/N/UOJSiDivkAH2NX7qS4
         FzqU17nSrezVlJtYqEY9fG3uBBRKrGiA7+e5HQB9T2pANoHJgubem6/hAEQGGuNQh565
         IcDSlMs0t3XEAO1CRg3OiiDI605huVGEnHi8TaBs5YIkLzWn72oyEat41SNks+Pw98wf
         8Rog==
X-Forwarded-Encrypted: i=1; AJvYcCVITOPV4fVCp9tymnyGWOQS3qSm/WPLx4rbBtFwp6lUT9BtNliZ+5Vh/nRSpf89yHFNlcnEWJH0Cer2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8mSC0ay7SX4zJlXf7WiZyifPG+CkmBBNdNZMkZp6Gn/KsxMEi
	x/Ac/eqYSbFOGx9GXS0kCj4UoMRenEmh1cEx4P4d0VivmSLRBi/GVkw7/PjLDCJ4wLK33YVEKO8
	QAbTkDQg99jNpOfzP4poqDUvCyGH3UxpzJoeY7iHF2cuxvDJW90489rulywyWuojk
X-Gm-Gg: ATEYQzyI6Y30UQgAVIkWvFnC7CAxyt/ZKPhvLBu3W0Kq2lrFyw6knlGgpBlAW9te4/Y
	NYRfcKFRy+RlyERuNDmywDkXmU/yAFhCPOSC0Sp9+4QZSDytK/9ld/Cy110WV6Q3MdwFKu0YIto
	M7eniLMpkNKNIuR8b3rw0ZYEEcWvvGEqRpYWA1eNX5WDluSO2y4Yv60QjTZUVNydQgEJzpQPe22
	h2Sq68bPwRgiLadcuqdAX60Dqc2XZv4f8TB7LNad3IioIKHlWGWFHEjCh41t1ADBQrQXX2DOjkm
	BdTqM/9Sd5+sIzREyaxKlSCENb711evvd9gi/UZv2Jxi5enT+/ou33SaNNpre9jQzO70R3as7my
	316p3QDnKjW0E5sJIWki8qa540ZTpcumF17mkyLzNzmUZsUsqLgID9LuvgcHqS5D95BHjDmCPsn
	h4PbVdY4hBVwtPhb1kSIKh0xGYKW4zgt45wNY=
X-Received: by 2002:a05:622a:820e:b0:50b:9024:53bd with SMTP id d75a77b69052e-50d3bb640c5mr30436271cf.6.1775028439273;
        Wed, 01 Apr 2026 00:27:19 -0700 (PDT)
X-Received: by 2002:a05:622a:820e:b0:50b:9024:53bd with SMTP id d75a77b69052e-50d3bb640c5mr30434601cf.6.1775028433711;
        Wed, 01 Apr 2026 00:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:35 +0300
Subject: [PATCH 16/19] drm/panel: add devm_drm_panel_add() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-16-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r6Up/NY1fdRwk7oQTpx7zUWlF65EBySH6t0rkQuUn0Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMitpf3+wRDDqUwdCq6sQ06Hs9RSUDNOWDd7c
 a6RInGWpsSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrQAKCRCLPIo+Aiko
 1RLPB/9SPmUJI4j3Vi8apJINepSPxkLJCUZaw8M/0qLcE1fosjoRv/KX5ipclM7dMkeAL8dmzbz
 Ft95y84cDkD4PkITNilAdMMUADeetqfXwVy+031S+n6HHFo9dJZLUtm23DQ+X5mp8AFQx0ATK5H
 pyEpkm4rDgF2gBtYsEQ41A12x4fE84g5EMLEtKwqwVvLPs+v1ym5aaL+WNrBKW/mCuY+IntCocD
 L23AervjUQeL3hkPenYtUSYg21EQ4QB5u5kGxRHzn2iYeI4/ecAlZcKbJLQZlCt2cCaHhicS+55
 BTrnI5eUqnPV5GdNCVxIL/OHrIPk+5MWvlzhGebH4QCFPiPR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX/tolYaBx8bCW
 SyZNRiGgsEdVlqn8WHy0zbkXjmJR3FmfsExFma7H+yHdcfFQdWCb2Uy1i/e4ETShXx/WbbplRj9
 zzg6ikslXBUU+ltyWiJGki2M4TvDSwi31EGcnlTv5jZ2rtCKQidB23k4vgdyt/9eDXeARhJXxlV
 F1gpC3sm3nRx33TehD/jyObZ1QDHLh6Peu8RRMx+I4IZUX+N8N0Y3W8/XK733b5SSGfFb1ejCAN
 T5f+Sf5sxR3IXFwB7EmSGJFQhnDohwRX5VOrD9t6w5Ts1E7Xt/IkBo5aTqA4waT4hd0pgYxYkoH
 oPB6O6Gy8oYwNzhA1tn5B2Bb+ndRXDJTxty9T1Q6DoWcWbUAzS3Hu3WpLOUGg25eKbomKfQv0uo
 6YKbMJIF/qxnHSa2QkiBmQehjE8nNK8HQSUEyn9uGJZ/kIw1IFIW8mRtcMbMRgXopPR5zrJRu6R
 /fHJ9+MgcOU/x5YaNrA==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccc8d8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=AWYnL6P3aIH6T79I5XMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ph3ZRT4T1s6QiVE8F4qG9zRTCQDWGJMq
X-Proofpoint-ORIG-GUID: ph3ZRT4T1s6QiVE8F4qG9zRTCQDWGJMq
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34545-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 95889376147
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devm_drm_panel_add(), devres-managed version of drm_panel_add().
It's not uncommon for the panel drivers to use devres functions for most
of the resources. Provide corresponding replacement for drm_panel_add().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 23 +++++++++++++++++++++++
 include/drm/drm_panel.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index d1e6598ea3bc..a6029b699b73 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -101,6 +101,29 @@ void drm_panel_remove(struct drm_panel *panel)
 }
 EXPORT_SYMBOL(drm_panel_remove);
 
+static void drm_panel_add_release(void *data)
+{
+	drm_panel_remove(data);
+}
+
+/**
+ * devm_drm_panel_add - add a panel to the global registry using devres
+ * @panel: panel to add
+ *
+ * Add a panel to the global registry so that it can be looked
+ * up by display drivers. The panel to be added must have been
+ * allocated by devm_drm_panel_alloc(). Unlike drm_panel_add() with this
+ * function there is no need to call drm_panel_remove(), it will be called
+ * automatically.
+ */
+int devm_drm_panel_add(struct device *dev, struct drm_panel *panel)
+{
+	drm_panel_add(panel);
+
+	return devm_add_action_or_reset(dev, drm_panel_add_release, panel);
+}
+EXPORT_SYMBOL(devm_drm_panel_add);
+
 /**
  * drm_panel_prepare - power on a panel
  * @panel: DRM panel
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 2407bfa60236..1fb9148dd095 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -329,6 +329,7 @@ void drm_panel_put(struct drm_panel *panel);
 
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
+int devm_drm_panel_add(struct device *dev, struct drm_panel *panel);
 
 void drm_panel_prepare(struct drm_panel *panel);
 void drm_panel_unprepare(struct drm_panel *panel);

-- 
2.47.3


