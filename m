Return-Path: <linux-gpio+bounces-35045-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4METGIo72mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35045-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:16:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35F3DFCCA
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC90930E1B25
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D61235B63C;
	Sat, 11 Apr 2026 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIUHKzOt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fm+n8nkl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08F835F18F
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909485; cv=none; b=TbmIygE8CNabSlmxbdiHKRxMHzU/ViaculVCh10nL69c8DKQ9j7QdJ/P4NpVnOJGfXAXGMbocICG2nHIu4LzVabT+5Pg9UjQqv979s2RaDFxNNnZcFFAvqB8rNTqcAqI4eX4goGfEs6VoUtL/I6QedtuuvonOwwd+VEAEPMgiTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909485; c=relaxed/simple;
	bh=oZQttRir8g2Qn2BsHRu+eldjwkU+kNkClFsUr2gUpy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkEnjhv1okGzxBjl9mt8jnb60Roojnep4O+wC7zQWv2PUJ/yzEqPzMG5zICM3t530v5Gh6SBDY+KN/VTXNtFAbNQyxZM5GgM9397yuW9tW0W3CBZSECba0FsOAfzW6hAuIvl9SBUipIU/QQIRFXUAl0Nn6Oi3KYAlntRPEcJuo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIUHKzOt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fm+n8nkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B40IDO516832
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iC1LEVCpd7b7b4Tm2fOEMBKJoKDzPqtfU1gViVgeeyQ=; b=IIUHKzOtS9xy8wHk
	ProIhs03/1pJhZY0UpOXJyqzpPea0DgbEgqmrg4ik55XhTUWP8uMemdjTVenPAiR
	sEPNkmz8HlAaqoS5j38svEn83k3VI4/D0HY0XDMXiGNB8QnquKl1AdufXN8plLIN
	vrvrrEMI8o3caclQwqbqYugdFoXCnA71PHkDeaYYkRMbTVT3uflv/IBZUEnbDYWc
	pKNUYPytPzV+N51k22PAw773G1vNVJ1DMvhkiDJxDBp9tGqDXd3IT3QlYnOJ8kNF
	n4e/UNk7V7lYnG8MOF0wHzygr70kmoHSKBqU57FKMuroIH/pU1d6TfG3SHsjNU8p
	RNOrUw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtgnj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4031b86dso77811431cf.0
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909482; x=1776514282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC1LEVCpd7b7b4Tm2fOEMBKJoKDzPqtfU1gViVgeeyQ=;
        b=Fm+n8nkl0Y3P4wzDuKAZGEsoBojAtMKfuRW9tDBQI5PeuuVxBkf7AhaHtO1eLJIQHM
         C9T/fqs0rYQ367w7gh6AfQWHtZU3LVhQjOfsK/5BQU2cSt7vjNuSUniZVS1OI9iYDERf
         y6hkIx1lFsd7EwNiiEGHR+SCM6R4Y+ulhQsBS+hyU+ZoB0JKnNyT04aKXZTF8bMW3M3S
         moK7LjpS3ls2kiks2gChttChc4zALUycl9jfTYJwvP1xEQ42UWTBU5EZiVF4lUeVMMjl
         dQuQCefQLMd7bwKFtRvFF/hKsuObA7SaKk6aa/KGI0ObFiu2vyTEsE1+tlx3aHZLtEt3
         NE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909482; x=1776514282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iC1LEVCpd7b7b4Tm2fOEMBKJoKDzPqtfU1gViVgeeyQ=;
        b=gLZOSmOqyHgi5M4XTZaAmyo0JL/CwjrZs6xVBA1iTvYjoeTZ452xcmyFNhiTrjeLtc
         Y4o+cMui6IYIE88d2G4tvAWc6NOuXNKC7kW1lQ1fPMIMzfxifjQNBwb83xvypZsn6k1R
         72CHqtUeBOvwIi2rbtJlzO3CWoFLiz/eKEQTLYf5aN8JZc5KBEYuSJKv+dQ7WLXRZgiE
         WRjf1/8JhCJOpF/Jvf3IeO0N6v9nYyOsZCD78G+JFidNh5U8Fnm69elgsQQNOft6Sm1l
         LCJEWtHCGfO9nkPITxRJM/xXTU90rYmwXUjJ3pB6MnZu4zrzl6FDOAKK0lEU8GbfQG3/
         eyPg==
X-Forwarded-Encrypted: i=1; AJvYcCVR5grRWvqgMkOfcl3o6XpxKtZ5UhEkXTy5V+YW4BlpbsBWYT50IzMTLyf+ngY17uAzfHXkZiZA4jmK@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOvWcatC0uxuiR3zsAH/sZLbyTsG30dOcB3kHydRw79ZnpriN
	JZvvZSPetYak+s/phoVSwfJOrG1n1odBuCzo6Cw2iniLL7kL6YvugR3zaf776rHUCNt5ezjU8Sp
	Jp85q20Kjuy7z5WIHKObexAfxN/5VOgaHAuHCwLYOa5IdNVRLc5Dyb8CRvqIlDYca
X-Gm-Gg: AeBDiethh/Hd/qmA5j59lhr4Zy74JDV8cAKfolGwUCXqMUgK0GTPY8uD+fSutYj0G3o
	J/BTx4S69GaR/i7k6Xch96Rr0HoLTOEquN5squEk4nJDaKnC7bLbasJbFE93+Ov/cmkS0gdVvPq
	COcwBLo3eIY86Ka33DnkEefgCCORM5Qs7rP2vUhbsMx8Xuw7CXzLV72qoKyCDs7V4ohU58RtgEU
	AWj0sTqzEIibFIZsNEv2fK3RNA0o27om94aykp3Q1YvU6CO3jvmALMD3rnkzfak8zneg7kkgxcp
	o09GKCoBZu96nxWgrtCHe5A9nNB/WNCc8deBjQLa4JD07ufdpIwIcEVOiUzAmzAahyLF1cUAFWn
	NgfnwNJdh6lZEjCkWg+pvBm+o9+gDQAAXDjQnTVZ6Ya1eUciXMUC4xzcMaNP5mc40oqz1nYs/o1
	gp6GQngZMRY4nPhAKDF1IHngffX0iifHF5vv0=
X-Received: by 2002:ac8:5790:0:b0:50d:9dd1:f25e with SMTP id d75a77b69052e-50dd5c2f3d6mr99291741cf.62.1775909481825;
        Sat, 11 Apr 2026 05:11:21 -0700 (PDT)
X-Received: by 2002:ac8:5790:0:b0:50d:9dd1:f25e with SMTP id d75a77b69052e-50dd5c2f3d6mr99291061cf.62.1775909481206;
        Sat, 11 Apr 2026 05:11:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:35 +0300
Subject: [PATCH v2 15/21] drm/panel: jadard-jd9365da-h3: support Waveshare
 WXGA DSI panels
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-15-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=27749;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oZQttRir8g2Qn2BsHRu+eldjwkU+kNkClFsUr2gUpy8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+YtK3cNjckrrTgE6zTvcgpPWO/PPN2mY3K4y9aa1eskA
 yyMNO92MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiibPY/8pLq8zLFuL1UNFd
 9q41ZFck1woNWfEPRbdO67oXq05Je1OV2C+0YoXT8XYH542/6hYvKbC54j1/kccMzQzJHPX10t/
 zGqtKA/7wFXDt/blV9rxZ2KMPSlm/1iTVyW3cKOK+zOBKffTPOTdWy4i9XtdxpWP/5dgv53Su73
 qswMXE0qBz0Xf3gTlVS5xizhwtrqss8sn27H3snpeRdbglWqE978X5Zf/jY6b84XrKw2quY9Xu4
 ea29pJhRPmakP718Sfbp91J5+oVzzRbFjRzT6+j8gelG+I53AZedz9s6XrAnVs3aaIdW3HEymL3
 dxzmuyY1vtx5iVfBUXVGZr/wC0f1J4lzf0jeX/hMJ/UaAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69da3a6a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=apVvwWDxUfMmm3v5wtwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: inKYv8bvnceWymh7rB5tSB-PmkOQT36i
X-Proofpoint-ORIG-GUID: inKYv8bvnceWymh7rB5tSB-PmkOQT36i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX7/cNhT/YjrAo
 bKKhsYztY1g5pquzRwAxPcwZ2EFcqN0KzX0AJokSXgEnhGnQaT8RC3Hb/bcxIkQco+JWpCMh1Jn
 RH6nUgCpcYXqCRAtK5yNWKf/Z/ocksHvCJPd5eInonrPEk4hFRf5FEjUJSIMnrimYCxMVDruIYg
 ZOoLyBio+DdjENvIu4gQgAOHVRGQSSZoizNvJfOh1BHhReollFQX0r3QMvwiwzLiQzazAOtdI2F
 2gtH+4Dtjb7Cubrb+g4dV02Y6A+SSdvaTcjwlSSFiwAGOWZNNQEoCaVPAebGMZmLe9AASNgsKdV
 jOU7UAGMpwyoRYaSvuRV+9PVmsHhiVAX7b/SnfV2s9QlxV2O73L9LM4hU4FriyYHEn+rNPDcNH6
 rIaHjMizvQOPM0+BKRy0/NzH+MKJWkkAtqvjg0rJKnN3AZLDarnRrZGJ8FS9nnekd7RgYZplTZK
 z7OtgfJfjVCzol7nx3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35045-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,arduino.cc:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
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
X-Rspamd-Queue-Id: ED35F3DFCCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add configuration for several Waveshare 8.0" and 10.1" WXGA DSI panels
using JD9365 controller

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 568 +++++++++++++++++++++++
 1 file changed, 568 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index aacb8968cd01..49c47f2bfbb9 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -2067,6 +2067,566 @@ static const struct jadard_panel_desc waveshare_4_0_inch_c_desc = {
 		      MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS,
 };
 
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
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -2184,6 +2744,14 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "waveshare,4.0-dsi-touch-c",
 		.data = &waveshare_4_0_inch_c_desc
 	},
+	{
+		.compatible = "waveshare,8.0-dsi-touch-a",
+		.data = &waveshare_8_0_inch_a_desc
+	},
+	{
+		.compatible = "waveshare,10.1-dsi-touch-a",
+		.data = &waveshare_10_1_inch_a_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);

-- 
2.47.3


