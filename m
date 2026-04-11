Return-Path: <linux-gpio+bounces-35035-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNUQMoM72mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35035-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:16:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C563DFCBB
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:16:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E2D730915D3
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C0C353EC0;
	Sat, 11 Apr 2026 12:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDdlQJeL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U7gG/LAl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943BC253950
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909466; cv=none; b=Z/7TQpWz3Wh1S3qgLNnO2UDJo/r4/Rs45pN08Pnwl+aC1dZ8r0/m2rJqjjEv09RuPp+VN2zhv0dEzJbd96nrFfNqeiKjt0RwTQUStp4jqMclwUxTgMCMGxHFXn47mnXmw1/rfHO58ASlxDmofLOmLsaInf831PAG5RhPJ1n5ZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909466; c=relaxed/simple;
	bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqBDKwehwrCZQmV/dds2Qj9DzlpMkkX3w/phsxP2fnDsI5/v0FJ/BTfYimv7tiWGuXYHO3NatNXt3ypxDeC9mEkBrQbSurc9PVpV5h1iePTspAjHXU4OxWfHPldviJqU+1w4lP1fKZBA1POdJUfpm4qmSghQiY1KlgsOcaGGXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDdlQJeL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U7gG/LAl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B41UJX3377228
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=; b=fDdlQJeLfUJ/6fnP
	4WuAE2oNwfNKdLsfhcknpaOxkpm3LKFlX0RdRq+b/p9mvmH162VbFuE42hNkC8Xf
	zFDZ5JE96e9JEP52tWvDkVwygdNZBSaFYvVFpwwpQWC2lIgYlKdPBNVXkYbZsbl/
	b3eRNKm9G2dTEINWcaEVKLZB4MKrsv3KtATazQoGlHfoavMFvIlAI/BVatMs5zuy
	Sj7oQmoL3iu11im5gbL/KwPpUl6Cb7vTyl5GP8MSZTNXfTNVdw1SW0i60qppqhca
	X7oEYk7VS/maaYuX+QlJbe2ky65PBl9O2M4G05LOUcm5GVYBOBvqBiRdzhB8TfxJ
	x17s4A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkrnfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso36154901cf.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909461; x=1776514261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=U7gG/LAlIoQCnv/poYYeOnFFOktuKy3aNbyk+GwBmc2Vo6qqcISofsuqhea0HYXobn
         Ids0ZTUSAuK7xdtVadz8TJoj7LbjdXaC6jN/e+224DtPbLKRwAJhcqWC8y1IWjGFN9rN
         TggAsEmdS1WEwZpyvQKimIpkmCwKvFBseQwUL8FGnETA4e7lNIz1wDxcdVqYCHG3DL+A
         wJRPgnIqyvli5ZIKI07lmof+oclozliC4vxUoCW61KHuKw4lnPXwRXfJUdkhyf++CxFY
         zXAglvmZ7hky9wdwdffCvEeebMoZiFL/EtuqxEYSrp5CVuG57pfCoTMNkBf7pPcqsuV0
         CuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909461; x=1776514261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GER20aNRyZAzUKwcjDT9x/OFiH7hEb7KOqKA2FbdkL0=;
        b=mCjmDjEuaOBMzESRydC5472t/wmnJ/aKWQnN7vlIIkUV9FfXWOfQ8yMvEH58q5koOX
         KRZHr7R7+DDsSSCjeRn1OQ5vNiRcpOw22cdCPH+v7UWR/JFXBo7tqrKCZXhZDiAi3kpZ
         nlZ3qPshy9vCAOFmQTJ5qbmWmC7YvGUHo1Dpuqha8CaXRxTSmTts7FdLlYCAolWMfhUR
         0zFtcgDXnv7yk79E59gr342BhfISZQfMd3g2B5XA0Cj+7sSEP2YWqgtL9RCtFL2T5SXd
         pnElZaHhxDX1+jzmlbGqRq116Fblb4zZFTMsXP887xe4YJopnzAGTnAeRtxZCqAi50UX
         /cyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvMbEIZeSX07qeejjzXfmmFkYAuKW0ZeuhITw7W8eISWg4+1MAEQF6aL45FljPqcHZ7AF4W00HkzBI@vger.kernel.org
X-Gm-Message-State: AOJu0YwHlnjD81SLFN6Q0B55SawOuABUs+Euo+VRQRpew2tSarjZLVS8
	cyHLcFJ4rY8wV4y6FUq4W3BGgWApa2i9Q5QexuMJ41+uIv6xxkQkcC5azsGT2zIIL5nd6SBI9oQ
	GLWqa0FNJw2PInRkIj1UNb+zdLDNjWhAOWhQY1D88f9u0KkaXURsgBz8Zw968rZAlmsmvb0bT
X-Gm-Gg: AeBDietSPmLDCFYj1DMDdp7oQNSYN2kTh/Cd6/Agr14Zy1auaSPMChI9EAJu417y2pb
	9DaXvLrZcMdRma5Qc0byiNJXIgh6Zz4qiQJXfFFDys6fVtQ53bVMoDRunJv/+YUjatXXzguo8EH
	QHISJl1yWfbRtZleKQLrVjBTgTMzlzu59UwT1U2pnS6q8+/Po0uMNqBN3YKoP90ts8WcKq8DaMA
	8EtLp6k/oV0It4tBq9ITamBAKq78wSfpM8EPn8GMDAcvB/44LyTIwVo95mICJ3Hy9ADLjxQ5nK4
	YuAIVasNE36t6s5NisGt3cihrYg0DEfny8wA/BwYZuBwHE3HqDqO2Dk+Qv5LAvTixFcSBnj35/X
	FiIvspln6s0i9xJorl16r6PrqpPTWjJZnUzmgrcoOwHIFGzC1Kr9dtAyrXojVmx0JnfwAuBjxW2
	pEED3X8KR+rLc1c+qC5zB19ZrJJHF9o0oiyG8=
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr97758971cf.8.1775909460536;
        Sat, 11 Apr 2026 05:11:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2299:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50dd5a91f78mr97758351cf.8.1775909460029;
        Sat, 11 Apr 2026 05:11:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:26 +0300
Subject: [PATCH v2 06/21] drm/of: add helper to count data-lanes on a
 remote endpoint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-6-75cdbeac5156@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bq/ApaAu9Cba0NC2uhfLECwnb5KKZEMKi1G7RCOyYOE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpFtEH514oS6B6o1FC9Zcdoql1nj2N8uYHyI
 nbiRNU5PjWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1dahB/4yloTJ264Ag99K7uwm46uttgOjgWsKsCsqkXWtdhcPQTj/ynjNAQbI/sT1vhT2ZFtKP0i
 W9MEvdMEc2M8TpRXyAbCbtwMywfr8+wJv4RHWN3JHrppa3vT7SxKm8pr3N+N/3xLSx+fRoHbI+s
 MaEesitUe/TgtHA29UVd8bt4wgtaFBUBfF4l2ZxqnMre8maSj92zGmDcvWR8qsxqs8fGUeOaUsH
 u1oNNz2CEEYuqsT/xUuCeZtfapi6f4ARW41ivzbNMD3ycuwkhoAEzG6kUefGoaG1NWEcYwEIpPk
 fWXiJ5mOlkl8M4VIpMrbzD/Hj1Ii9EP9nDi8RwI/JMREJSsg
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69da3a55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=20KFwNOVAAAA:8
 a=EUspDBNiAAAA:8 a=O3ifdCkKFGgQ8ueZnWQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX0UgrpexRz2pQ
 7fZRIt9CavevSZvJFvns/sHKg9GLW7BaYoKEIGkvBZphLfPnpPGfqoOKnHa5OjDZgr6wbuIJzAW
 X2ERs0v+Gwmb+TP3YyikI1ylTnVOkNE4aHEM5wyFUhlYdMWtsxzR4WdpnID5Sk/QzC2S6QT3Jj4
 vN1FCBQEWqiGRkacpJCzMQgMy7Wr5WFpdA5UEzl/jn3E5FSXezqmEjtQ5IcJ+aVJEyjTDXfvGV6
 v7C92uwwzHjZZym/W9TIhDMFquHq41UWfcCD7G4Vs3jhwdU8wEihG9ZYiO3Qc6I+FxQKSaRib81
 2S17uNaeER1OSWKvmiYMqXtP7+bk088DdrAbMR0kaG9IJnLcf2CK3OeZ+eeuGQVg7MPz0S8rruY
 8qfCxjc8cgiM92ykc57yx6PfqEarOOlce/zWJB4Wk1iG1/HAOpp/bOQw/0eyuT7T+Oyo1mN7g3K
 mM+p3JGJgGMf1SB8RnA==
X-Proofpoint-ORIG-GUID: -UyaA6f0v10tTVza654xKiRixvtZxu3I
X-Proofpoint-GUID: -UyaA6f0v10tTVza654xKiRixvtZxu3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110102
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35035-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90C563DFCBB
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


