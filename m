Return-Path: <linux-gpio+bounces-35113-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJPhMXb63GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35113-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:15:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 746AA3ED2CF
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 425C1302A7E3
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A793DCDB9;
	Mon, 13 Apr 2026 14:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjweD+Mv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxwAeoG0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D92B3DCD8B
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089184; cv=none; b=MYQfRMFzJ69fqAz99hk74ovKh5reJ0qbnrEDQxMToc+ut/ffIFfVjPUpBbd9g+qys0PfDj06jkaco6UGsSLhLeE1en38doawgspmF8OrpqDBFzwDkdJ3+o8xjPGC3IHlNBKGmtvt98VmPedQUk8GdhNFjq1lBuaFZcO7jn6Faro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089184; c=relaxed/simple;
	bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6+WRqNFIKnhjRH00cfTXbqDtaMT4Xb2yvvEcLPOikkG3l4/WCf/ciR7ppEP9GkHbMViLlINqmcf8bUurflt0LBGJNaWXlkkjrbs6nXHgKWbVy3WIUTY9k9P6Elsmyjy4t2zjQbIHEsHyZix6McRpDPabn6fMjjEySyiE+54po8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjweD+Mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxwAeoG0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DC7mJL2186916
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=; b=gjweD+MvZb4xDCac
	gVLHxNRsljPEDeeOlOG7Tu5Hv448YRH19hYYrdNm3/mQ9Lo6LvzDz9y8i6CmrdTO
	UeaF79i+hIA6WpZxen+QcE7xtA51GLZ7/6GlXb75CKbWKpyM1WkBXAJl2qbJC0iK
	TBbyEfS9RNTpsfC/84I6KXO5mWtHaZr7GCxkETrtRn3RJ/TgQHMPQ9NNEtYv6aYQ
	4BMZU25EOM8Br3NZ20CLlyn4grizBEnCJZ2H4vxeWDiyUrD5Lpb9jQ4eptbE8gIU
	XDJcO7a0GsS2ai4jUpV6e/j2vNSLbf3zFthttWRtk/sjIMENguj2CI4EQCQTg1t2
	SDL1cw==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh07hgdb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:22 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-688c232dd72so6263444eaf.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089181; x=1776693981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=fxwAeoG07JmubUmH+alxtm3a5vr1BdoFytAN2/P1t33YWbM2G5hXxFFf4zh78k7tS9
         +tYef4uWfMrmU5Spq1QtGsPlBJghKM4Lh/Mt/N7Zn9RCb/d2Nt8cknpiy3x5MYbwIoL0
         dwe/aSaL/mMOnnN/I7M3AAlZpE01COFsQ3AH/qyH4S3u/UApgTav+mkf8xfW1aVekuDV
         hrltIMC008o/R7iTw2z68qXoIDvfpiSgmnh6kixdnElv+5GUThNWQNKDZqXo38jHKnMC
         reZU6NW0kPDstxjXrKrFJ42mGyhOdTwVmHd+oKL+zT0QJnlEzPufw644WXOdqt88NiJf
         QtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089181; x=1776693981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u/JqaEb+NMid83GHj5mNNQA+ojq3d6qm/84/uWVT8xw=;
        b=A61wZoYelsNrbQuUaQjRw/cWSgUnbDMSrWT5xLLAQpZ3M+za3yEzJPPuwOlRluPcDf
         PIUHHPltgb8mNzaWQuvo44e29EFXb0LaAB0qKxSNzjGyFnVF5OE6LHj2wGzFAruEnkhZ
         gijfdvfEI9tJRVKDTxWt/uzjLmlQkm5f2ePecQatRRHhw7s67pOCSa31JRifl8r2bm38
         8fiS5G5hTaPSEKyD2RGFjxxJ2AIDni+xuR/Or1V4s7Zzno8G5i8GCVrHXmcrUI84yl7a
         W7VAJOQjHZ1xaYAUL8LspqsFyhzz4qf+0hOGbyTaSEOcPVqH1PVmb5VT7+88V3e6WD4s
         HEiw==
X-Forwarded-Encrypted: i=1; AFNElJ9jQ/7SiKpPOPE2ADZzF6BpTZod9+1IfI9oAA4/A387xPnrXqShYz/m4q+NNs1NJZkYMACCmmOAb3rw@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrfvRFI+5SBK2IeqH97HlJFl/haK4gyQeHzkENTKf6nWcreQl
	mlVlJwStPz4/D1QP7kSnHFZN1KU3usyw0pRE1B8pYYVU8lOY4Pj79sNtL/AE/ECy/dI7MaQgTA7
	t9OAap9GDZBfHQdYaznqIss/Pq/LxyZMvshNy4O0xCL0iVPMCX4bclWs5xotOirpD
X-Gm-Gg: AeBDietHuQc0JqiQOY5ioAAikGfcmk/JnjLMFqpJLG/IImBmcxfk6Ge7k2uiIC7h21G
	tEl5yifxe1iNvl1/mgXd4jJjzJ/BYvkRHXj2ampWbU1aktceIGtR16KYuMtVS5OVQ2+gsPMYoAs
	9EezCd1oQe6VcvPEpnihrfi8NmGA9pTusRZktN7zeHYInHy1vmI+1vFSiiUoky0RP8QK74eW3Ks
	xgbY7ueeinX6AOSTPLkJvcmR47v2tEBPsnL2UqRuwVFWNlMf03jrjVoMGb2Lw8yNEyx5ypAlQx1
	z6ZpwgqRH5OWw9OwUCpGfb9hQ3QZn6YRQZGbadSknq5GDaDurC582PGmTaaf6gFZspaaBis1zHf
	6j1bjE02cf2KBqBbZsOP9oaB/aA74e50s0ZIRUV072TPsN7j80OTfj+WlyqQelDDSpecX7VN9si
	41Atxwuw4qL3U35I+F/46qO9tAOaDBS05bSO8=
X-Received: by 2002:a05:6808:6713:b0:467:4939:9666 with SMTP id 5614622812f47-4789f9ff5f1mr6710733b6e.47.1776089181449;
        Mon, 13 Apr 2026 07:06:21 -0700 (PDT)
X-Received: by 2002:a05:6808:6713:b0:467:4939:9666 with SMTP id 5614622812f47-4789f9ff5f1mr6710663b6e.47.1776089180901;
        Mon, 13 Apr 2026 07:06:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:41 +0300
Subject: [PATCH v3 18/21] drm/panel: add devm_drm_panel_add() helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-18-3aeb53022c32@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rf4el4++6e9jBpjjECUwGqmrfgQoRtn7snVn69MvoWU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgp36dO9d8sfKpSoa2iQ31yyNO8Ctp8WrrhH
 LXL4NK7WQyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KQAKCRCLPIo+Aiko
 1V0QCACnAkb/uJNfOqLJvZOMdoZDHqS3A+CKkd7WrYSl+1DpW8RrS7lFtt+GehaxZYzcW56jM5u
 BvUELCsVb4Q/AI4RdseuaZRFDN7hhZ1ZVNKsU3J4xEPBKdazX3fFFnhMjzxVfpCHYTIDFBCNoIQ
 NhFP52aq9E74NdJTipo6BVBjUGlir4QDFO6emDGGO5Kvq7ObR99dqNLfbjVApJYGhXQeDVyjhkg
 VvuYhVzBihGipeqVaknv8TNMagcu8VOCGp77OGd54TYCr3X1Pan8faJzNbk7jbNA6jvaDsQRmeE
 b0hFftgYc5yx5LWiG6lWS3gf3iQtgc8QcFSPUxb35yrLyVzJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 1kx5x4waR9h9zJlKCebe5f1eEe4NWJmZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX+uS6RDv8nMbm
 0ZDZcUkF3DcRW4Lm9DHxRtewwA+lmril7tSpm0tzhyZsmUhNtM0VUB0lUMnsZBDv6290KkasrlT
 gp+j+EgI600e1r2vs3zHDVOicztPoo0Jh9BFMMU4OA3Uhy9R/yq07mPWilJo279OyA3gI35ltih
 97c2GfLNXsvMEX/GrWtLIF2XbWvXpouDxRCFVMMg/IEUzQEm8u9ZWpBL4AFpGO3FtHZNIWy3LyZ
 1RprJJr/A5qXMKT6f14Qi56vmge/Mjdiy4kedQujd/zYyeSYFZ93Av7QT7khwZhXESd5gvaE3B9
 lwBFEuxtsTHj1BiM2pH5jMoVS8lvqXVSG79JFK6mHJIllreLwfpTpzwu55j4Ut++jnVEayX2KlP
 RAaa0bTxe1NdMVojqDVXxhd/ntvqCB/FDvun+VGZGAbdAvMmo0V/OWKu8785Nz+BzXoDvbEZSqT
 i+/FBbMKiPaIEQEpE0w==
X-Proofpoint-GUID: 1kx5x4waR9h9zJlKCebe5f1eEe4NWJmZ
X-Authority-Analysis: v=2.4 cv=QtNuG1yd c=1 sm=1 tr=0 ts=69dcf85e cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VYOP6asi5FRKG1UsDooA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35113-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
X-Rspamd-Queue-Id: 746AA3ED2CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devm_drm_panel_add(), devres-managed version of drm_panel_add().
It's not uncommon for the panel drivers to use devres functions for most
of the resources. Provide corresponding replacement for drm_panel_add().

Reviewed-by: Linus Walleij <linusw@kernel.org>
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


