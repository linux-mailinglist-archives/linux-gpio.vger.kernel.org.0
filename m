Return-Path: <linux-gpio+bounces-34534-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPm4OlrMzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34534-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:42:18 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7DD3762A7
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C56A5301AD28
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5003806D7;
	Wed,  1 Apr 2026 07:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0dPc8JQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZmvuhX/0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DB37DE8D
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028416; cv=none; b=Usg/pmfntRwsfZ4DTqUYWxqNO0N5q2a1FUEHj4bVde//mQPIySHcCfsXOmEv3dQ4eVn5Dm7nNshbfhoB4NmNVca5nhe9KjqgnbkF+o0/8FHoKoVFiv3sXqturlfllMlbidIrah9AKAe6FEHV0xkwGYsBgdXicVYOOr+I178n4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028416; c=relaxed/simple;
	bh=yhP4V2QbDZyJf1WM2vX7tIqhltacQlU0i2WT1b2Nhzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNMym8+vPKR1HKsFgvlDaSn9vBtrnhPkqJTAHhhgNsUph+vf5CAlTjQfgn7YgugxiLJqRUZPsKn1duTTUvuzLpqkJBcIbl+FuL4cX0J5a6bRWqt1F/HlzdllqKtinR/ebwJ74La3LxrKv7GcI8H3eW0FAMyCxvbwFvR4Th4T6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0dPc8JQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZmvuhX/0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6312IudZ1004515
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNv+a5JUOkvD13PQtmo1wRsoE/3FPaE2XhBNcETttd4=; b=G0dPc8JQ/45NbXvB
	GoGCDjbCFHHc9lsHFrhnaAAI0TMkLT28BdeC9sndHsG+HSxhrF33RkgMdi4vaOm6
	ROVHMkmiNG4hmP+20mEZHow1vMVwWA8memHpAzni9TInX5v9YnVRBTdetEcKQUXF
	LOkhYCdMmT/ccWBHwmsNst069vd8JnsYyVHrZYwclBt8Ktz7ZzeJzcRbB3erWqgZ
	4mo0oWcrqpzdSnskAVFBnejSI5dkQotrZtGRkgEqJXl9HxEItjEF8KJWyePxxtHD
	7sYeWc4p7L0L8FCR7QoqzTb7CI7mWigrRpV29vDrKgyGnjniSc5acrwhsZUuY9KW
	vzOQjg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8tfjh339-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so210616861cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028411; x=1775633211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNv+a5JUOkvD13PQtmo1wRsoE/3FPaE2XhBNcETttd4=;
        b=ZmvuhX/0lqhkA/9cy97dUl6V2ThqqcQ3gaXLmeoVC93CcE9ZODc21L8fN/mIxOfcoK
         AFvv6n1/gsl5Z7Zn8HcC1UKl5X5Ezk/OlorbnrlvKTvQO1jy+/wwzEx5+H1k3/NLihmZ
         AUsjDQjyHxzYsbrpZ/430pO69dPVcFA1VJjthcivuVZ7b8/AkuxJi39c2Qz0+wtLNlS0
         zh7KULNGhcF0pgjjWdwDlXdhDpVN5uGizEpgCGKWv8xtFexR0reo8DjUdMVcTs8gR1Mj
         3sF7SCmc7dls0kvnVf+rmu6h1JZT50TII7XYpJvQGW0eluqWa4etOCcgclceYIl+dXYt
         2pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028411; x=1775633211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNv+a5JUOkvD13PQtmo1wRsoE/3FPaE2XhBNcETttd4=;
        b=TYqT1Od86NoyhpIGblrJT/snXB0iTAo8Heax7fi21cLKyBiOpyKAfcHIpNqZWJrN1K
         0G3VfJZnCh/LMMv0GA6yWUOUEVSJrZqJ2RkGXUtdgPxp3bBKxArxWlWTX4Znm8MtBByT
         qxK8Cy5T1ogaknLujwS8o08ZYxHra4V02J2mq30CO6FUcVqFABA6IIHhezKXHAKX+FUw
         qqPXVH9JmZpRtYr5STVnXnLFsENEu4aE0f3jXWDRCacWu6R8I7c9fnyToBQoEKq6xFfJ
         WG8HAq0YlJxzINzQ2zGF0jpXxyqKepLX++6wEMD1gwSIx0kpebB/V1mtn7LPhEE3b+fT
         2SiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2F/s4/eUVpKUqy+so1IEEYttFNgSNYZc1pgKV2Qxs2JPoWU/w51GnzvEBVJ8wd+e3iZxpOktthj2L@vger.kernel.org
X-Gm-Message-State: AOJu0YzcfLbVRTbRY2a7U7dBMY2YCZKbYnf/3RJmaOIUK5KNV9OEp5CM
	rgqy5PwylaswZNB5KF+F3WwQAIJdiT4AmLoD4+14a150VYHKH33fOXMx2rjqgAbTiU8+nk0pbub
	3d8DEfjsj4JBQ4OsWOHU9nzmpXfv2PinxMFvBQFC85FitBw51kFEoqbinpla15ko6
X-Gm-Gg: ATEYQzyNOyhE6jueAjEDQxX3Bm8p9/g3288U54OOdQFPFO1XsWSGOcFXyKhyMzsGs+h
	sL2gBzFh+jqQZHnPBvbvcX99WZYWhUrdPMTBFt1CNoZmUvOxej0H0x9tpjhF1M4a3Ggb36eVL8O
	ZNmItZaXql/xeJbuUwdlCxdpERh7uvgDxkhSStezPqp6RJgREc08JAhLOVvDzMxggrpIV1pvRwD
	cAaGcCBGeQsSJZpc1rI+xe53Ngt4hTohY/SZkryioxemC/6PPpUGeYYQ0nWMGmqf2eoSgzx7J4H
	cLfgmYIww/p0W8T1lRJZy4xK45bjDVgfZrTW5AtRY757wIfZlPFbSct80TlZ7hsEpG4CYlEXJo9
	agtxWKVVGMD2ytwtJ/MaiWUz26cmTIwRVrEDx+7Q0yLgUV8fGOFa7N8QsoErYW4fMAplmA/wiKz
	LKp4C/ooBhBF5Hq64HwRLeRI4LKDpwmVqMgfo=
X-Received: by 2002:a05:622a:1190:b0:50b:3895:c22f with SMTP id d75a77b69052e-50d3bbe4931mr32294681cf.26.1775028411496;
        Wed, 01 Apr 2026 00:26:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1190:b0:50b:3895:c22f with SMTP id d75a77b69052e-50d3bbe4931mr32293141cf.26.1775028406296;
        Wed, 01 Apr 2026 00:26:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:22 +0300
Subject: [PATCH 03/19] dt-bindings: display/panel: jadard,jd9365da-h3:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-3-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yhP4V2QbDZyJf1WM2vX7tIqhltacQlU0i2WT1b2Nhzk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirbFLb6Baak8sFkzHlNdA4IIkaehp7V4znF
 gWdYY8j+seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1espB/9PREhQL7BJDveKAw5tO27VKyrw5BHFLVpBB4WXTy2SgPayno+Uz6Aqpp/LxuYUg/v45PR
 7zdCuTavjnDDTILojt76Fj7jn9VByeHKOToCqKFB554AwNx5rq+3iG6SKEL4FcImZix4DJTf+lk
 UXwLIME3Zknt8jwiEw6m/ve2pq9UWWfVN10cY3bld9+GT1gfw70avMmCRpbe30qZytYeICB3ED6
 8jSUqaTHBRn+iPFduDiK5b9XpW6+FVcfVSUNiADxOZaZNRJUGxD9bhxxmfdkLruF7REkgTHzN8f
 Xgo3UGueIUwF/HhW3FNu9Jksy7i+9N1mJXi4UtKbnU5f+m70
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ARXodY7R0Vmkx5k6uVoEjF7m1pF5FBIR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX+xsm9LDsPYFq
 O9iFVQYffLxnr1CFHp1XT4+p0y5dyVsbmBG+RDLLq3kpuWcGrFb/o2UH1L+MMxla/NxSpPTRKGA
 +4SUAD0U8VLglpLTeh2zThIzS/xfIDvehKJmUeyqMvRIDjEvtpDyF5KZ1r7yObvDvYkoX2cuA+v
 pnoSYj7rTgTmQ+nPap1orAppeg8vxl42SIo/Dnx9OhlZJHJgOpoyvXpbsRzdxzJKdgakcnbwz2X
 0ICEdQzCXMcn3PZ2A7R2HWG+dxkjCU8/FFASV+1OD9JX+aOYcKzsKSbiSvbzZi7+hNTJL/wAOYt
 Oras3RtcT/G4lLzNK6jTb5Tm/ooSxfz9bBQ3AyiVN0majQVizFSnkfcr35FUxS8YJ+6jKI1RKyM
 e17Yt12ot4RkiAWysujzaq1S35XBlnQpMEhXUe+B3AJAM3ks79ZRnlbDMfd36R8Y1x8O4gOvCSS
 tJ/hTyn181SQR/XfwmA==
X-Authority-Analysis: v=2.4 cv=fJc0HJae c=1 sm=1 tr=0 ts=69ccc8bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3ozaZGYpt45I3yT0zMEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ARXodY7R0Vmkx5k6uVoEjF7m1pF5FBIR
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
	TAGGED_FROM(0.00)[bounces-34534-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D7DD3762A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe Waveshare DSI panels which use JD9365 as a panel controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index e39efb44ed42..4eae802de9fd 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -24,6 +24,12 @@ properties:
           - radxa,display-10hd-ad001
           - radxa,display-8hd-ad002
           - taiguanck,xti05101-01a
+          - waveshare,3.4-dsi-touch-c
+          - waveshare,4.0-dsi-touch-c
+          - waveshare,8.0-dsi-touch-a
+          - waveshare,9.0-dsi-touch-b
+          - waveshare,10.1-dsi-touch-a
+          - waveshare,10.1-dsi-touch-b
       - const: jadard,jd9365da-h3
 
   reg:

-- 
2.47.3


