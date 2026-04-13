Return-Path: <linux-gpio+bounces-35104-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4bWNN6P43GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35104-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:07:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FE3ED077
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1067A301E71B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A493D905C;
	Mon, 13 Apr 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGJNhAmc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hhCn8sCQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3FD3D810C
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089159; cv=none; b=PZdDNrmVuHHK+9VqQ2jbodWPyhGLlx1c1LVd4F51cKx1HmK/uwBK5KkwtJkb3dxJKAsHUr8WsHMcWvE6CcDgQtdBVpqREU3x6pu4S0pw7zea7pQfWwUYUpbpPk8FGP4j5NleuSbKdTo/5WLnFC/M9+oV2F3lEnxU+vmoQeBIQFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089159; c=relaxed/simple;
	bh=sQ69JX4wAjTsBAqHELNV+ZWRZ1CzDcUvy3hc2w/OnYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTTvmi1I6djq2WuCKFwREXK4TyhiG86p9Pq+izo2mKST3zhUQgfAESytw8IDhSCGiyRNwihwG20RT8L0gWjMA6cHtEucmShoxr93i/1rAKhKSYgGHPsaXPrHukhGyg/pIBoPX4oTE2+IjYTJrZFN+LlrUz3eH1PKs1JJ14X7Y6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oGJNhAmc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hhCn8sCQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCX8sI297551
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=; b=oGJNhAmcqUVZFoGz
	dukV8+oOCJGEHlwJWl9l3UqJgQXRa8iuPSg5HUUL5unko/EhOMc2x2YhHIrWO1XJ
	HQuXjlbeGGz8obla8hctdJwUTD9cOch8nNJiPthXo6ndecoepBrEg7uZ2BFFAnCT
	SRV3W977XmuyJUcWD3mYHtVFk4KmmqqUPeJUyZz0mMZSC5tqYZq2zJ4w04fdrQFp
	LTWyJRZ2XqKs8QxlgF8DCdUr3rSRnTONb5CWiVd3g6TBoG6IrZ5KYhHJlurUykpx
	ydVMVeDLAt4xK7/WzTF/2YfFQHsKaEgpIH2bDrwuUVJ+CgbuBDJorpUNacBnOT6H
	+mcW7g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0kd0bwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:54 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-471618e2082so2859753b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089153; x=1776693953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=;
        b=hhCn8sCQFaMVcc/zoPKzrPG696Ull7Zo4pOFEpB3Y4RV0Snqwo0rNWldLPoyyJ/SEU
         uM5DKRAcxluZ3mpr99JQeDhlrcv0Q0quxHzABFIv3GX9AOu5GZKbNtLpiTme7QzajE28
         cb3KqzVh92iOPlNONDeyH3JtnJDllRXH6kM90eKuO54jQl2a8L4ypJWfhH5/CHsTSRlY
         8XwaNP/2criZXZXxSRzK5TFaQG0+j9EwLPz3cytdjzOTcJ+q3iT7nWWAPZcnwcx6Mncj
         IEE9MeJoFMIqAiqosb/OKt6sszefEMPOGLImdm9fRB0cZftSTYhisVac3/Z6qukQnmGY
         cVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089153; x=1776693953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zzlcIKXiRQAFXIYPSVS0Jyv6z26HXplRvWhk/69wTo0=;
        b=mQmzFj5oZAWkQYXpyhRko5qoflHixtJbdYXa7QAVlw0TZvLjXkDLGLA1jPqyfSn3Vn
         75wp1pCu/OnmKvMxbJR0LqGgmrsmBTYpeXyetD54e0EWMeUJIY9wd5b7URL64/DQRgWZ
         DaaMaHGNJdwwvLGo6VF3DdslkXkJRPfNF8HQ7wIxXqFhpMOX7sHmPuOsV7X4DB8JODbJ
         c3ORzsJcZr0tNbzK/2AKmz8CtF3ueEe1xwbh/zI2SPf5e+2e1R6fMwciknYnwQQ9kHet
         Scg0bp3HiH+hCoIxuJW1bW9ZXgEeVpBhrszbpeCaX9aLVXaHPap4IJeD4qdRbWsEIijS
         QCsA==
X-Forwarded-Encrypted: i=1; AFNElJ+4v0te/zzMyFRDKWp0qDr9qStgns9qH7krT46nvoahQmMz3YoC91CQevkFo24YLGvvTot0Sjupr4Im@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8oA5fhWzJf+N21iDxxcEFhnd+sDWST3i7uKyhGupqE8oiambF
	EsjZMjztZO5ohR/ukqfa/S3kEMebDl348KgwUKNSot3ONTJj2gQKbKsWkDkSUTVJxKzUJDd9Jrx
	NVtaEQH4Aq6oSfIRyhRdSpe0OG8441dftfAbqwSHlnjOnod1dc4faDQ3WmI86CPsb
X-Gm-Gg: AeBDievGOdTAAI9YvcqrJizKzdOeXUEv74rgQvbvy8JeFMah4H712cDuAYp839OANNL
	QEp3CvV1cTRqmMjzzgHjpHg3AnNEOO9++D2Ip9KqIn0ccXt0Qznj5PfkMMV7D5M5uINIzmXi/Zq
	4+wQMVKEx1/6/f3sYRAntbadfFy3RHiYFRKxPM1eHq4mvsEDkVj8Cld4QfAkQZBe9K4be8VCJOY
	zB/sti880Xx2b8Co3W8pzpNeHyy7jd1Q5i5p+AbDcB36AtKvHFdGerPIZe/xjCH9wIIDEpcMbXj
	385WgAHSVODpQMQOonA0R9gN0MPFr+HHa1j1saqT0RDa7QoABLXsOxfvwurtHK+VMHB9BCStYIN
	VZhsh5/qZ1d2PtYsrpb3hry0FwQBDT0rmM7PpGW0YXgywv6rnbAFTSt1J4Z9wR/L4Nc6clCBkox
	OPLrwYnQmRGwlUOJmwMXxJBTUc8zWVT0kfH+M=
X-Received: by 2002:a05:6808:23cd:b0:468:48d:806a with SMTP id 5614622812f47-4789c6495e3mr5922033b6e.2.1776089153231;
        Mon, 13 Apr 2026 07:05:53 -0700 (PDT)
X-Received: by 2002:a05:6808:23cd:b0:468:48d:806a with SMTP id 5614622812f47-4789c6495e3mr5921957b6e.2.1776089152744;
        Mon, 13 Apr 2026 07:05:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:32 +0300
Subject: [PATCH v3 09/21] drm/panel: himax-hx8394: simplify hx8394_enable()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-9-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2523;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sQ69JX4wAjTsBAqHELNV+ZWRZ1CzDcUvy3hc2w/OnYg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgnq9wrcj5XzE9oVZBrEZ73tbhQ0/6I45ZMe
 5cGUc3/NSeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JwAKCRCLPIo+Aiko
 1QBSB/9KGQm1y1KQajg7NwOIhHN8WXXzrrS0RWTsSDRmNGY0j0OwvgRmyzjEYEMlApcJG5cGSW+
 MA+QpWn5TKdgsx3xafMHT7Mn4rPdD2MoT8RE+NT/v8ne1/0vBgFzeZ+FVz8Rvr6c0HAIXrO+nIy
 +zj6bEkP4rGqq0S4E0El3RBA5FH4C6GWsAXJCIZ0Ym65f4KIomZJcJ5Y05xNq1ZXxRAc16XYUNo
 Z7Xb9OUE8fD5A/4ARm7uWcXinFOVqhYd69y89t8OPZMmqr8/WaQvDaV/Pdyo+pyZWS29fKprvci
 byYPvo0iwqec96IDG9c0HZAx2dL5BzflsfNu46HVuLuVQHfp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX3angsxyAEbg+
 nYyb2HO2qFJ25jbtOMq5msCML8/JJllvmZtuYx8q2iul/HO8atOUMCwRmvrutQb3r74AlBwHXn7
 9m/gz/APhwxA9dr2M2xAhb0pBXbGxPfUps/pnr9I746wjpp73aYKcTk6qs6ulAhcXENG3oZVdD5
 MfWYBAQh/P/IKSRJgI0Lt3Nb95B4bMYOJjxmcJHLgdSTRt1Lx6tfTzkH87a4z8xCy8qUUAtK6mJ
 5YU7ltvODvI3NC0NTD/Gw1iO1DwWFWSHMTFyn6kbIq7EqMl/sKQUzCmQuQUYwKuHcduL0tHvwIO
 Q/tC/IkjVc3Tz7yItS6UtZgtCWX9/6jb70+7/OkWt4ABkqY55c9+zfP6ntvDWX1XuALO6cJwgvq
 lMLyuaxVCk0KqJtRwmh7pYM70+JClaAfCjyq8OjhgtLVZXmEnQCQaKxQdYSuV7v/IWZ9UbrRedg
 4KsTYvEzcP4oYctR/NA==
X-Proofpoint-GUID: 2QRMCNv_W_4j2zqHbHPd1CnLernG8Cq_
X-Authority-Analysis: v=2.4 cv=D7x37PRj c=1 sm=1 tr=0 ts=69dcf842 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=jj6w_h7ptVUN3La3dRgA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: 2QRMCNv_W_4j2zqHbHPd1CnLernG8Cq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35104-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: C06FE3ED077
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify hx8394_enable() function by using hx8394_disable() instead of
open-coding it and mipi_dsi_msleep() instead of manual checks.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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


