Return-Path: <linux-gpio+bounces-34537-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFLiG3PJzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34537-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:29:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13145375E6D
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 538933063AC5
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32F137DE96;
	Wed,  1 Apr 2026 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEYcjqyU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2auBSxz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D022D1914
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028420; cv=none; b=J5FqSdv6OB7Ci2Zm5sXB3iyEH3lnPRec0qeT3GA/ChYWjB2LMjEr94p85Y914lI3rt+MZ6OdO2mBm5D2Dq879tFqHXfPsZJhTefUBJp98/o5IPelutYJ2Xv7OgZ4HZIsj0D+JwcLgyFzOh5d8rScPgbi/YiOIl/w46x2oDZwUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028420; c=relaxed/simple;
	bh=ICRBrnQij3AHdlL1aBsp8l8GKgsmUylWuvxjYCl0Jww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xj6Pik7YZaporaxolkwTxIPerm6s27XWqlhPFbsOOmuyIucJnFV1eY7eUFDZXJdyFLCkeIAe7h2jUe4B2iGfl3Vrf7/ywFCmv+O/YjKPZ9hGElBFAORnYsCyJamjv1hGE52s0D0FmuctaYr7uPLFRklmBg3JjmICy4oGqkF4O3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEYcjqyU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2auBSxz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317EkoV4106675
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrsSeXDgflueFJTKbryvDrNrj0ECLTEOv9jGD5jIVFo=; b=IEYcjqyUP0UQxGwA
	Z6eTHdZQCkC0M4R+Nr3UYGtd/RwFFgVoRKq3KW8ZmwE5LqanPkuMMk6ezagYt7k1
	UUDce9ahN3n9SC4q4Tm/Y2gtbAv3VIc0HKM5eNFmGLCUTr8Iswi6Tc59VBI6iQGp
	GLZuKqh5/fwdkq8myJXyj19G1oVoRn1NnPCHXCDJlxEixTWZeB/NZImrkEpm1+xH
	ke6kWVWhPPn2HquEasM90JbfqauQMVEF12TAMOAdn94uDeQFtn6qtIrsKWCKNdeT
	dC5HTsV3aCF9KhvXD+XFT/i5YNVHKZOPBfyNuZHQxn6ApiGBfyPZc/aM2fziGG7h
	GLExnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt901nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4076dc16so88094141cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028417; x=1775633217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrsSeXDgflueFJTKbryvDrNrj0ECLTEOv9jGD5jIVFo=;
        b=N2auBSxzq2xLCGmqfyBoDJjH4Lxwg1UM+1eY+ajyxllCZjNA/99Bu2vDqzcjPJ3O/F
         xVdhy3Pj0XregC/waBv3oB9Y0qEH9R8/huPjlqRRAVRdUIO7/Rj9bRhQzBGdpIGR82X2
         4cmCih4i+YuCoVVUb4ksHPwv5XhFPUoASPUZi30vX4zk9RXjtbVYrCg9bBHC6AntadCq
         ZdEJDe1DZMxAL1EbRBJDNQFezcJ+UKcZ/KdXiZHc6bekYIwV/vz+Pig7EyrJe0Y/LuNA
         5tGxlO5G2KnLkInW93YrQpTxG4uIPByTbd9DQi6ObrkDtK0bV55GHbO2VPTFX7urKLpc
         sjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028417; x=1775633217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OrsSeXDgflueFJTKbryvDrNrj0ECLTEOv9jGD5jIVFo=;
        b=sUHNc3NCoBKcov0a5ceJns+ipn+nQcbdF4PDrxKM6ya83zXkb9Rw/StgCzbrkuIA8B
         Zi+SXuzo4IJN3qU4EmFx1K1+lOxbXwiQ2Qs9oWecoytKpvIK6j8sYPN0o5IjGe2BdXll
         1oZBBynZx5Gv5DdSI6yaaRQK4FOmslc1fvP4246Bqgd2su63zMFMX1fPliS0JrRufEPs
         TOcCHXxLI6vtuLhlPI6+dbouec6p3SBrI6cott8NZpOBMbRUrrfpQ3/dvXmf0sJvB/0G
         cN8rBdqJelRvH1KOAE6ehRCKUE9K3JmIMoHt7sD40uoxMJZP+GKRjZj6PHz9waiDCEFB
         Nv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlKP3OiIItw95GJybR5ieyRZdM1/MskOrEwd8EZE6gDDdqLWHouW9WM/LKrL/LPeu2Qx9fz3q9v6wj@vger.kernel.org
X-Gm-Message-State: AOJu0YwKl7P+JgXWKKDNen9AQp/JBWtiXZqslJOkKNgICooCMsxWFY4m
	23+6aaU//d0AZBsyfXdsnsoS1TSm/wpu090WTtW2GA5zLQBdSCz5aBw3CAtwBhJ/xeP8u+kUOFF
	0OCTNuWxg0D0k41q7KriDFlc3KQHhwEFkxxrb3qWKNoHvf2iPnXak4Q4wLzHoLhM5
X-Gm-Gg: ATEYQzz89F+JY443pXxornURcEft28BngUs1d5txorcFSmYJLXF56QqD9T5n8mx3lhu
	ELmsjQT07bpndHDTBAOfn2pIV/HdzVsskP+f4b7/VVHMhTAP2Mjoo4qr5WRUJcP3h2RElnBmrq1
	A8t7gLrh8rccQovBhoGjoBHHvj6VKU0sOmFu7ALMIP9LcXv4yO9hctbMPyPDOsvST42y+Kv0DDU
	NVyb56adD2ftp8toh9VmS/81W1VzA5UQCzeJUtiG7ukUJGdGiuRGFUI+wXq2coFP7WAUSxmXErt
	A0JHCOH8jeYQwkg8+Omo2TDcnxVc1aDUtTDOoVko6VRE4x+nNU3sVbFAIZFzTDaD4ly8/RRne1w
	1CMgslNB+PBg85jVq3BtxvC1UfwL8+arGxWj9OQU8TfSxUXfOsmZejY22nMb6VTWMMGeg5Vivxq
	KqOqCYSqYpgH9A2SLhFea42AzFbL1UQq/KURY=
X-Received: by 2002:a05:622a:5448:b0:506:6caf:3cab with SMTP id d75a77b69052e-50d3bc0a9e8mr37476811cf.26.1775028417628;
        Wed, 01 Apr 2026 00:26:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5448:b0:506:6caf:3cab with SMTP id d75a77b69052e-50d3bc0a9e8mr37476651cf.26.1775028417263;
        Wed, 01 Apr 2026 00:26:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:27 +0300
Subject: [PATCH 08/19] drm/panel: himax-hx8394: set prepare_prev_first
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-8-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=929;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ICRBrnQij3AHdlL1aBsp8l8GKgsmUylWuvxjYCl0Jww=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMisLWXFY6GGXVfAmBGZzwLhMyy/wiVS8/GGS
 nXgHm7+YeiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrAAKCRCLPIo+Aiko
 1fa5B/4rA2razUl1EdKZVnBd1wxc26tJ4GQzJOG182PKBt6opAY/YjmYxnMi0rVWhK8EhFW3ZGa
 z/8BC/+RpXTsXxC7wQ5nM1kzZtzCkDX7xt8ySloFRcZ8iijpwg+K+QrNzk8oYDFuq80xgG/I3wL
 TICqFlNA8yC4I8cO4Fi8NK+pAKSGxYkdN3ctiBIWLYuPqaZXEF3bFAnvkQT7BLBVxPrSuZ8m8dN
 BHAkPNJJp0rLagT4+4dHo6nDuP0sm5m2FGnu0uqaT0IpeRXnJsY00MQSZBtddkeFK3Yi5P9TbdP
 dmCkbF5OeIMrwcMX/zeVXQuGThvrp7TPXiZwuCjPAQqErfNH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2EA-JA8WiMSbYeZ10SPOQk6AT6jYJRAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX7jjHfdMgeMqt
 bsmmTs05j3h7iY/PJRDBi4nAkxH3Rm6dgE8qR5t6xcrW/ZK1dLjgZr+3BNq5P+qjRVbgHl97pZ2
 chLx7AXkztK5qXwsFX6+2B0qsfx8TyB2ckt2RlCGdT0957PnC9Cvr2kXT+wicytVtQJCYZkemZ7
 Wl7Yo3Sn0egzDEdJ5F4HVNxwhdbLJ1ivYQ1fIMgK9g5Um9SuNHxTO7VFPGurWiA77HnLbFLQ+Zx
 uS4KF0DlooDzIFaIuWWC/NOrkQNfgHA0DZ7bx8PLkA79iVcxGB2HXZD2adNMLLqp1HD/v8VLORt
 HeLoSV0OR1RDpWpoiEaGYaf17xoN3eCEiSbOHfRRHYJjrt3LiS2E6zitZBUNMv+XjPI4wjYMoxO
 3+pFyxsY3p6LLHZSWPntvJNfd78LV8ZtNkayndEZddgCui+oyWkP0bdvvabezUaEXSHyXzvlMcx
 5M8Y+FWMuPffN+g/AFg==
X-Proofpoint-ORIG-GUID: 2EA-JA8WiMSbYeZ10SPOQk6AT6jYJRAg
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccc8c2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cd2vOsepvhAVWqutC0UA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34537-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 13145375E6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sending DSI commands from the prepare() callback requires DSI link to be
up at that point. For DSI hosts is guaranteed only if the panel driver
sets the .prepare_prev_first flag. Set it to let these panels work with
the DSI hosts which don't power on the link in their .mode_set callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c4d3e09a228d..d64f3521eb15 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -792,6 +792,8 @@ static int hx8394_probe(struct mipi_dsi_device *dsi)
 	if (ret)
 		return ret;
 
+	ctx->panel.prepare_prev_first = true;
+
 	drm_panel_add(&ctx->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.47.3


