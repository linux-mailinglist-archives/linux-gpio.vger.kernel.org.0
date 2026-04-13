Return-Path: <linux-gpio+bounces-35101-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CZwMw/63GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35101-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:13:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C60A3ED26C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70EF53081307
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C73D3D7D67;
	Mon, 13 Apr 2026 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQQ/bH3y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBpyB5zY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEF73D6CA3
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089150; cv=none; b=UsLrkhv/kKPlHCbomNoDo7REyIWgiMspBPChYZEvv0LLfeSMfGqncX714/kD3blkEZKMcbAQClV08uJJ4eLCyEVUeZxgiThQcdfZ/9/OFc7SlThMeNODSsWV2poluJ3ZNjz51pxyoYqUCVZxBTLnOgWi12MHY43COpkg5Pjql1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089150; c=relaxed/simple;
	bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WTCHghkgXdFZCgWqYAghagTkke4JHCkR8l8lBIh9UL3lTH5DnXqV3sFpwvPbEGjepUy61OPWaQeo/qUX2R0frj1tmEXg/3HY2Ju7zI5xraAYuXUnUAeZMYuzCAHEr9db6m8+976l1keIzhjy6ACog01SXpLhYUphXwPzQIFeHzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQQ/bH3y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBpyB5zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DE3wsf1367778
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=; b=fQQ/bH3ye3psNQw1
	4KQ13lxs8CCzZjFxE8jYCe82EMLhjFHpyBbnNwEjV/vo0+tu5JzzQWKG+R+3PGdk
	XkZZs7P00lK3iKj9I4AJRsZnMXN1wFTh2qarn7BgFXDZ+sSC5JZZk57BghnkBWJB
	mVSqKxnPZxBg2VHqGa9vUfep+A3n+pxJcQ3xOXaBi3JmbmaalkCVPZ45sRz4aP7K
	c5QA3M6btcGe1U94s8jymR6Pyitr4J8ZH6zidpruCkuUMLWM8q9jPZfn7F3NJTzS
	niWmPLGL1JS6TdJFD0yMqmlW/SQ5Ng69r/5hWAhsF5Eyoga1Y3dBk98rsvtl68oK
	skuiSw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevtnqsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:45 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-689b18091ebso8852123eaf.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089145; x=1776693945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=QBpyB5zYwi42P78v0DekpnCtfF3mKyZcTmEa/5WrbedXFSzOl/mfioJFkR/GYY53Tf
         qe6Qe0+J/woSUt2rxYWB2EyXvWYzw4UyaeaAb6opkF4JmwNCJg5Q5bZuauW2Wxy750wl
         hrUp85FdmPfE5WxOD6PupRfufFcrMBynTcTnfnjED60pSVJXiDn2Dwgoo9uIpUnOsMfQ
         zwM3Gnb52H5vZfz0kblVg8vY7edU1rCfUkorStZ2bJ0SHUrwdv9ll/MLdHKB05/jUjdV
         Z//ZJvHpvp+U/2nrfSJZLWYInZlwSv4EANa0O29I3zkYNUFUeWTgP0N1LD5UgYOFmBoS
         K7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089145; x=1776693945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=X5IBU5y5OttjRxATs7U0K7UO6me1+ulKXa+EiQiI2cVb5RcAE56dbotqS0yrV+4DVY
         djlTccGsJJqAZpUQIITqhZ2pFgD2oKbmYiLCg2K384rX2cPaAw2UtJ7qXL25MDaTXyCx
         N4CR9YSzv5r7DVWMtGkYZoc0XQNN9dIJIxms5DjHZM968oBwwogw9+fkpRD7Ejy17kov
         hgXyHcaKUFR5UKNz3LM1tr5ySHElac223W3OgPS2edPoeTzoDk48eQz26wFVxJFkTt6D
         XaZpq9dq1m7eft+pN8WMulanLf/OSnN35ykM+ZXAiQHDAQmVan3kv3XPVHHVTkC+Shis
         t49A==
X-Forwarded-Encrypted: i=1; AFNElJ/46RNARtasu3g3OQ1iF1e58nGeLTEgMZ3rj5mTC5+KHXePd3NVV09yQnEBzppvOZKt7mI30jl2snfk@vger.kernel.org
X-Gm-Message-State: AOJu0YzRezMZ1X2yz8vuHHgVzFsrEk5dwIXSEuaOpm/cNFwzVPJS5r/a
	y8hrGdWfU+FhLgtLHjE8n3dphPE5/UEqWHRLAJ7vrPhx9eghgRAu6k4BrOlCT2522pvyrHQFQvy
	cWQvtP9H9001+vecmEFuK/rSWpXnHdbDSr0XjtWN+GRkxr0SCg3s2mb9P7Wz08Xcl
X-Gm-Gg: AeBDievdryYq2HvxJ0vvqeX5bwamMhioK67gyJW3KY+YBGiTBa+X+N4UERDzC3uXd5I
	5n22oDBvwb2S7xWMRCyPajTj5OPFD0wKnlu3MWHswGn5gwnvVxcNGb3hk2Dj1dpdM2gLLMMcW0j
	Vc70xQiNPJN3VUqrMXabkKW0N/R444ean37jwQ0QV3/KyuzoiRrbE6FLajg1Ml/9iVOZiU+Yi+m
	TJh0NWAVUZPAcanmPdpJOM6gwF1CO4PmTimzhrzm0hZ45IiRraqFjehE1lOcXDSSKLiFrr4EEZR
	4MQoEyNscvt1zblIbM0oCSOpQuOkgNr7+USfzxfJSewAL1FFc1B5R6eTUTprFrSaR7ZekZ4LZd7
	BP3rY0WJDHAzTbFj6UWHLCqu7ev4kXCa+IRqUAZii3tDEkvrcVLULU260WjhM9LyCmq4+9qRSNP
	L8DyIS//jrNgXTTYS3CFJ3Rk+ZuZf2XWJmd4k=
X-Received: by 2002:a4a:e75a:0:b0:683:121c:5aa with SMTP id 006d021491bc7-68a68c658b4mr5989927eaf.10.1776089144770;
        Mon, 13 Apr 2026 07:05:44 -0700 (PDT)
X-Received: by 2002:a4a:e75a:0:b0:683:121c:5aa with SMTP id 006d021491bc7-68a68c658b4mr5989901eaf.10.1776089143843;
        Mon, 13 Apr 2026 07:05:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:29 +0300
Subject: [PATCH v3 06/21] drm/of: add helper to count data-lanes on a
 remote endpoint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-6-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3Pgn/KFfGhQShasaHa6RZpRh36xAil8iwYTaF
 PURzX5YSwSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JwAKCRCLPIo+Aiko
 1fDFB/9EesztfHAvYdUmud1fJO8CCtfNhvEOQ3kNwUvIqdraNNcQIOwG+H7kHh0yg20MWC6Jn+8
 FqoQJDs5Co3bpIo8ZwJ4IDnYK/kCqqtZjzlYd9zRgILKvL3icL64LlBLD9gDewH4sYKkwFTtWQc
 fSbO8HHfaTxY8VdvALi5Fzn+OGQvs/mSJnTyTiNVMNpPghzRBG27oiM8IHtiZ6aEHzU49y2X/kH
 s7UlKDnMqPAnxmpYfHnOIpArkvJua6TULsf9kClMopHCdaET8FSNnwmMQoXT7Mzh8WndcaFk/gi
 YO+8mpPk9sCX+978OKLV0XocfLnJh9Q4fsX0TakkWLQe4jXS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69dcf839 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=O3ifdCkKFGgQ8ueZnWQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-GUID: hREMsWp7v7M3vIEyQbCrHBgkNUmY5Z9H
X-Proofpoint-ORIG-GUID: hREMsWp7v7M3vIEyQbCrHBgkNUmY5Z9H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfXyuStGRFy+CHn
 oiJgGnmr4dSztnrO5ueLNgwD1j3U/3/DDuL7xipU23HYOMCTbQgX3ecq580ZopJIKFE3pZx6r5l
 vzQITAFkMqNlLwsoM0ZUd23b+cpIAS/qwRhKMSWv+NTMl9+XPicONKKuO6dmN4woZtqJW2EnzL9
 XdI+3SUPJA5UlK9B81hxpfoLj97c3BnDu/Pbb7IO9M5IWacVaU4SBKhFKrwn9DMFU76lhL3R8fK
 YJQvnPk6da1mhsGzl0qsq7VMhnteARclPWRWUoe97aHdAx1E8EbDfxQEIsUFSDHsYC6Lf3UHjQO
 7rzN21wo1dixHB162ALtS08YSAUVajcBd3GzeyhWH65rY8LSBdTuPGVi+NOOO77JBhi1FbAv1xa
 J1jE22yOyspo42yB3fe7b6s9eHA+jUtkyMQ6TGu28HlcO2t2udEJ9CaNE9Dr4wgnpPnNVGrSV2x
 t/RKBiLJRwUNCUWbW/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130138
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35101-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2C60A3ED26C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the DSI panel supports versatile lanes configuration, its driver
might require determining the number of DSI data lanes, which is usually
specified on the DSI host side of the OF graph. Add new helper as a
pair to drm_of_get_data_lanes_count_ep() that lets callers determine
number of data-lanes on the remote side of the OF graph.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_of.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_of.h     | 13 +++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 4f65ce729a47..ef6b09316963 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -558,6 +558,40 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 }
 EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_ep);
 
+/**
+ * drm_of_get_data_lanes_count_remote - Get DSI/(e)DP data lane count by endpoint
+ * @port: DT port node of the DSI/(e)DP source or sink
+ * @port_reg: identifier (value of reg property) of the parent port node
+ * @reg: identifier (value of reg property) of the endpoint node
+ * @min: minimum supported number of data lanes
+ * @max: maximum supported number of data lanes
+ *
+ * Count DT "data-lanes" property elements in the remote endpoint and check for
+ * validity.  This variant uses endpoint specifier.
+ *
+ * Return:
+ * * min..max - positive integer count of "data-lanes" elements
+ * * -EINVAL - the "data-lanes" property is unsupported
+ * * -ENODEV - the "data-lanes" property is missing
+ */
+int drm_of_get_data_lanes_count_remote(const struct device_node *port,
+				       int port_reg, int reg,
+				       const unsigned int min,
+				       const unsigned int max)
+{
+	struct device_node *endpoint, *remote;
+	int ret;
+
+	endpoint = of_graph_get_endpoint_by_regs(port, port_reg, reg);
+	remote = of_graph_get_remote_endpoint(endpoint);
+	of_node_put(endpoint);
+	ret = drm_of_get_data_lanes_count(remote, min, max);
+	of_node_put(remote);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count_remote);
+
 #if IS_ENABLED(CONFIG_DRM_MIPI_DSI)
 
 /**
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index f2f2bf82eff9..7bcc0ccfe0f4 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -62,6 +62,10 @@ int drm_of_get_data_lanes_count_ep(const struct device_node *port,
 				   int port_reg, int reg,
 				   const unsigned int min,
 				   const unsigned int max);
+int drm_of_get_data_lanes_count_remote(const struct device_node *port,
+				       int port_reg, int reg,
+				       const unsigned int min,
+				       const unsigned int max);
 #else
 static inline uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 					  struct device_node *port)
@@ -140,6 +144,15 @@ drm_of_get_data_lanes_count_ep(const struct device_node *port,
 {
 	return -EINVAL;
 }
+
+static inline int
+drm_of_get_data_lanes_count_remote(const struct device_node *port,
+				   int port_reg, int reg,
+				   const unsigned int min,
+				   const unsigned int max)
+{
+	return -EINVAL;
+}
 #endif
 
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_MIPI_DSI)

-- 
2.47.3


