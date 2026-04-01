Return-Path: <linux-gpio+bounces-34538-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFkNKoTMzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34538-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:43:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1608E3762DE
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49A413138C7C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EDC382F06;
	Wed,  1 Apr 2026 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/dfkyvr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMm1flYz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F003382F19
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028422; cv=none; b=dauZ5J5mK4xsN6CbL9jesEMzHlnxUYWiwmoUbeov6cduSJE1HoYVHspO0yVnYY34PVe3yr4EUrqNyVuIBRFTq+OgjOcVlG1tfrQ94MKWN5fI+zvKNCoEEJORTMPGa+1CzvY9BvIDeC8ED4JbZ+tPX3TpznAUfQOzCOyKg4t8RrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028422; c=relaxed/simple;
	bh=pOgZnrXub3GS8AZAw2xe2Lzvx6vQOVPendpRdgsMBpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bbea28IyJ2lCcqCDMFgD0Une/dfv/FzeSObmQngOHd0Tv2ZW1OgxBZRYDo94hHrnDDWAzedehpPHl7egyUPeOtILdGFPwYmaiTD1Nmcb6Y2AwwcypyTccEJnBhipuqyk6cT6AQg7PChM8HQLtIJbpWrDwz9wrWr7OKDZCwHkWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/dfkyvr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMm1flYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312fEUg3081615
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wxCLjYTUywbIG6hdVNRWMq6YPfiD70vfjtzHlxjSzdU=; b=Z/dfkyvr8gTlqdEK
	LqaeBk1oZg34b7VUi2n0VRf97nZ+SMyUwJC8MBNnaIeUC7EsHDKnyB8x4xLi7xVU
	cRafd+mj0jA/OmRyMQTBOL6z6Xl+9awEfnXt01OT7CtQr1XECAtpdQ38zoPrmJbQ
	OYG7QPbfTJIx21vpN0J4twIkFZBNnm8aHMoQj/fUEXwBradjmIAyoU0BVwvGmRDd
	l62YOLB6HZYxAmdoVUKWlGM/bKpsIckE+jzKZVFE5AtpNMOrvi/zHbO/Ef+hciAH
	/ZlNiAWEoPIIpX3QJzinC6t7n1wq7vTAxFsuKBirfgsT3m+7Ew45mfkGJTuzr8Y2
	/hrQ/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkttrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509219f94b0so80212231cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028420; x=1775633220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxCLjYTUywbIG6hdVNRWMq6YPfiD70vfjtzHlxjSzdU=;
        b=ZMm1flYzFze19wfi5E4rYYA1PJofPrglX2nnxk2W0IT1kr0QY5ffCqy8g5LvVcqD33
         pvQxqulSf51gMLb5eaRBLd966VW9Sr0LsgdiYSo2Eu/iZuC1IcXH/ZS4ODgx7KWDkdAh
         EkwxZfPc0lKLMwcvnFEvO06RXl+eZS5/rKubOFYcjtGgsw388ShEXRU9jx5B+UbELz0Z
         wh2LgTxs1tyKl0ivYphUGAsjVFzRkREaJcmSws7S6xVdxVgvk5dVozAay/PgU3MArl8X
         555wHL0XgGofqewBIZz4HQ7GpWDHS8LK+E0KEmS55NajdPhTKshdBtLmtOVldXakbKWu
         XxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028420; x=1775633220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wxCLjYTUywbIG6hdVNRWMq6YPfiD70vfjtzHlxjSzdU=;
        b=elhroYaxLkQvSu8OXAUDf4XKRrjJeflt6ID2IYbHecwW2AmKqD70O6ZMJi0Th8Zsbt
         l7PVaJ+ohCtXx04SHgCAT7Bs4T73d/SLYEJqFs1axNEUUOKe1Ipg9rDzawac5891xnid
         6k95MFdvFDnF+U3CZUPhm/sS/h2thr7Ceye6Xh74uYm/DSF/I4bUx8fzDDfigRwMELVm
         63A7WUVeRbdhosDonbH8j3irLpPrE7iv2BpEU/GzGJQDSZdCN6iKEeuorV41e7l1Mox6
         UKDXe4tsahHxFnPY2xpAKiN2otsTz75iP7aYt/9ykXnZyhzBHt1AFE1HwfO7hfhGSCb5
         8nxg==
X-Forwarded-Encrypted: i=1; AJvYcCVgFItS2nWBYghXzOc9oVGE9rJ0Q1ckrRZ8TN6VqsDxik3KIh2I5lEwgTrhZwchIfWWdBqYh7avvMuD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk3yojKcAxFIZzVe8qpnA60HZ5AdUbtwQuuf+bCf27VO4iyKBv
	bDtQXlP9mQ1W9EIYIy2gN13npBQfHSNWEiqvycV+enxvd86gYuV6SEAnO5pOAbBzWqzGF3Pt/AG
	OVnfApggHbLldy8T6mBHrG1X80xGG0TVVN6b6UNTgTzbDr0zlcwKeMYWtBEEkHk/p
X-Gm-Gg: ATEYQzzxGhI2QAQnIBnsnuvGLapa0l5COAweXKw48bknTDphnJjdPJ51eMQu1+J7hs0
	RUiaQ9As2HcZBNDiGhiezUyd98yBX02cHQMPzxSa56NXRS6bTE3YzHL+TWT1/RIeIzF4CiNiHfY
	p5FKBrO3bCVzJ3kd6DIelv7qu5VubKCgu0VGzQP7aOxTYJoHwLku4eSl/bbKK9rNrPmK4g2cHKj
	lO5mtpsU47igUkN22hYlyDQVyGi0LlklWXPlBl4/tsxoXuAS9/ohyq/lGAOC8zaKavjLUBVZqdi
	hBbIcYgs2o7Y12PdWSPrvd71yNMEm4nrh6YJylfxIYIYZ+eZyJq/5eivxnnoYEEuutc5L5EKjIa
	OAqU44FH213Z5mb6uBPisjlg1V/HWIKC0Ql8aPcjpshh1/9LLeAu3KwlgUZTH0PMNCvoIn/k1zu
	x+cGoRLCJWbM71cPs4jpNflF9jrUR6ZZ7vSOw=
X-Received: by 2002:a05:622a:1f0d:b0:50b:48a6:6b96 with SMTP id d75a77b69052e-50d3bca54a5mr36269761cf.35.1775028419733;
        Wed, 01 Apr 2026 00:26:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0d:b0:50b:48a6:6b96 with SMTP id d75a77b69052e-50d3bca54a5mr36269471cf.35.1775028419278;
        Wed, 01 Apr 2026 00:26:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:28 +0300
Subject: [PATCH 09/19] drm/panel: himax-hx8394: simplify hx8394_enable()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-9-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2415;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pOgZnrXub3GS8AZAw2xe2Lzvx6vQOVPendpRdgsMBpU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMisQHL6qbOb5oDSQPV+YXvWKyipTd8B0Ocuk
 17HKBDfjRuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1VflCACGiFUAmeGHUxPcLUIE4mj8HiU/9RP/nPny3hspTKil+4vbxdnaL70iV5S02Kx4btVz9xj
 kSc2CXCuht6nRCvGonbIfT+msxpO3wWFuM7ddnlQKnBPDg4LEHIU7kCtiUIZwbQcHkFrz0x9A40
 cygjsanxfZAG/quPVwSweLsytvo2OTDuYIDzs//sFoLpLRg7Y8CI3I6Vyr2bAIPdprvp89Dm81A
 3h5oW/QNEPEFX4VWUUb7grbKtPzylGFf1AnLCH1WxJ64478Qq1CEAgNFpbP/KsZVvX9dLlORYYA
 RHBfXXP6q4cAygUm/lX2Qp8AqF+zoTslKi+fpcePPvQRb9U9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX/PqSi1XkytHQ
 qEbCoZapOc6G6LhbfY6jivXjqXlWz9/xOt3Za6gUUPuSKDzFKlC3qNBO24gSdGK6+iaaHF6cuFy
 MqATwuoOFZASo2DB7AImQBkEdFZLyddW4Ifo/QMCtsw+GRUqA5ZuyWEz1vgCKerCisHOiE38rRS
 x5FNjohqH3wVLi4XDS/keoSUjULfiEt+F8JlqHpSH1vLLFrbs6YoPSbueVh4b89bh4PWltbiqef
 VLUCcY3B+4i+L2UhY1hXV56KefiFYZTf/rkXkAyw9yG9qBvWjKBzUV9X2l4lFc9bSmEhIywo618
 46Gj5MX4G8ugNIjCo3tpnZk05HMyv+Q+uzsMm6DvgLi445lSjjiVKiL2NLgYQdX7gaZowGubXXg
 6zLM7oog1hgId3klDFmFmstU+90L/ZPmBLpDMJodxcSSVQ02DtyupG0nq3aE9btv9w7zXArbTAG
 Z/HE8fXxKHDJC/3byzw==
X-Proofpoint-GUID: NdQdTd4GBxXK5xK4s2pb9DaHkh99TgME
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69ccc8c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=IHUbhB35yQ0xTmbSNgsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NdQdTd4GBxXK5xK4s2pb9DaHkh99TgME
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34538-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 1608E3762DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify hx8394_enable() function by using hx8394_disable() instead of
open-coding it and mipi_dsi_msleep() instead of manual checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 41 ++++++++++--------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index d64f3521eb15..1f23c50b6661 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -618,47 +618,34 @@ static const struct hx8394_panel_desc hl055fhav028c_desc = {
 	.init_sequence = hl055fhav028c_init_sequence,
 };
 
-static int hx8394_enable(struct drm_panel *panel)
+static int hx8394_disable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
-	int ret;
-
-	ctx->desc->init_sequence(&dsi_ctx);
-
-	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
-
-	if (dsi_ctx.accum_err)
-		return dsi_ctx.accum_err;
-	/* Panel is operational 120 msec after reset */
-	msleep(120);
-
-	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
-	if (dsi_ctx.accum_err)
-		goto sleep_in;
-
-	return 0;
-
-sleep_in:
-	ret = dsi_ctx.accum_err;
-	dsi_ctx.accum_err = 0;
 
-	/* This will probably fail, but let's try orderly power off anyway. */
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50);
+	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
-static int hx8394_disable(struct drm_panel *panel)
+static int hx8394_enable(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
-	mipi_dsi_msleep(&dsi_ctx, 50); /* about 3 frames */
+	ctx->desc->init_sequence(&dsi_ctx);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	/* Panel is operational 120 msec after reset */
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
+		hx8394_disable(panel);
 
 	return dsi_ctx.accum_err;
 }

-- 
2.47.3


