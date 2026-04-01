Return-Path: <linux-gpio+bounces-34535-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAcHOcHKzGn5WgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34535-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:35:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90125376007
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33EBF312FFE4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A103815CD;
	Wed,  1 Apr 2026 07:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO2i+Brb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7LiSgN9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D45637C932
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028416; cv=none; b=DfABJtsnjWKuyAQOEBWthYxuQu7Bezooqz/JL5e4lcIxnNNGYei4zmUcL4e/djvqYQxskdOpST7vQ0QtPwyyiUivKk1Eif/u/xL7hw90rQpH8KNRfMu4XadbKeACCG6d2BzbV2j40leCtIQiuXwSpny/IzoaOcyepAOV7HgCZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028416; c=relaxed/simple;
	bh=HHcarmRqwtUT/YnQfaZxOlaXpKjrD/Y/4QHeex8uzNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adnrDMJyzFpAHBiitkHfZA7mpv5LjRT1867OJeiX8rn20V7alZ7cEY10g6YbeTEieusAnCiWoKdlijL5rs65blVM8l00zW3vTY/D3ajmBdEntRKGAagPNxYpZcxZRad3nZJwq6GMmecBwsMOkxjivkHHwSAnI+WP0qO+XSBsiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO2i+Brb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7LiSgN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171MPF3103827
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fp6DewLgWhkxTtOGAF8HtbyDZ+xvVZUBiujky/Sm5BA=; b=HO2i+BrbJS3aiPtj
	v4kPGZNKYHHM86EH38RuVw7cei4j+KVK6xNRer833xxTv2tlTElZSKpgU5sPejLM
	BDip6oXrnV1PlK75RYJp6ugchKetW7zmQXWq7WWw9yDBj75EFaSvcQ8nlzmicbyu
	QLwpltl59LvbAJoqGZUIQwfizh/BK+55T8sSDdHSEky4cM3TuGiOg/bnI570NV9o
	kqDnzVKejNQ+/I8cTI+CSQdBiBd0Nz/v29xbuu55PrDUqyTrXnLJLH6cAgHgUsif
	pqiAYs6MWezMRqVjscd1Mv/Ey7o4icaZjcmQeSJgy9PQIFT4E5fVE25FUCzHr8v4
	veB8QQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js233f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:26:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso96174301cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028413; x=1775633213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fp6DewLgWhkxTtOGAF8HtbyDZ+xvVZUBiujky/Sm5BA=;
        b=j7LiSgN9nSwJy0BMvsgoT4QLN7iXN/qhqMrjFH4EM5+s/Dx21/7OzR8SfoUrnm6gY+
         SoOU6oSubcwN2WdMJI4qgWXIuIM1XoCARvKDtNTVzOSkHvIBDfwstNklle8eCcs1TIr6
         PZhlFC00lO5IZkW8Ni3McWdxf3EHWcWMWCgMhcdiniyrEJ8YxFLm/tYg3O1mXdVjOdNP
         XJGBV/S30RbFr6ZpkQ0Yp6uaKEZ0H+ey43er0hakkFYpVKh4uCs7w7RrZPna8UzgojhD
         o/KJuOs+cvj5InkiBIpv8RvzeiXDL5WAMwPmPrmI6kQBt57Fl0QxBkFgTlqM9ZiFb+OT
         5s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028413; x=1775633213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fp6DewLgWhkxTtOGAF8HtbyDZ+xvVZUBiujky/Sm5BA=;
        b=BqHrgWPU+iOR5C8h37mehyVWn3DO0fLNfSCB0BrQ/zYna3bbevbkjZHcicz1wJHbRW
         eJ7VlXrEihEaLaHjTvbG+/C4fqG7hCkjqaN1c+xbSupHwTVCNDBeSE9RgSZZXroOQoH3
         xYenhxoynnmdRYGrOkUfAWGZ3cT+loMqD0DT9kEM4k7ugy1aWwe804C9cj1UibMBaKWy
         Y2JO9NMxKSr9p9Ztz4/khLClr8IpeX2+byQBLMUqwSHgH4v7ap/fTbqTRaveDvguODR9
         tUJqvd/eRXajCA+MiN3cPfgLrYXxwNCdcm5yu2mP0hmCJpHtu5WKCWaC6X8M/COVHF1H
         PK4w==
X-Forwarded-Encrypted: i=1; AJvYcCUK2q71607o5wS4cPbgdVMTsJpn2rJmMH7MQHT3Yz0pB1pj3rw0jNz+aUn9QIL49Kcx9BVdsegrlwQT@vger.kernel.org
X-Gm-Message-State: AOJu0YxM1Aqh0SP41BgsuqixyWe5n9N4348d7y0G8BiZTi+LPUlc68OQ
	Ikays2peHknflg7Q1jUn5Ydtd2px4IGLv5xhWlo1v+kzRrJaihm9h3DpVOpJwKdAa8BisP1853/
	K+0yIM7dyL/yoBcRCy2SzGQrTL5bkc93XCL6KA+yfdfp0WUC8kcjVI5V1HQ3yizwP
X-Gm-Gg: ATEYQzwdL7amFdWyE1SPDhTN1rJA9rL3w1go6BvfHIxjqLe501ndry76A8J+HqGJ5i7
	e0nklMq9gmiyF+IrVgF1m+QvfiZhNGA+NaFMSTgV+A2MXz6Qq748mh9+68uKhLMN5Sz+otMpJGF
	N9LhDj/4wqhwoM3AvKv7DG8t0s255A196/eAIPA+iSRQqT32QhwgFQsnDIW/PTLjxhnKpvnMU8N
	BJQhsKig7xhYgxnY3o3LU4dGiMp+OQVwB/yV+JP3pLKtmOuTtAqDe46cHN4Rr84gsPud6yri/Vr
	fkckh1mUs0TDUyLMPDUn90qFzCEDqHq5qMO/E+702o2Y3e9sDuasCaNFjOZ1b+yyurvOqhlEtqf
	wLlTt774wSfDZhVWpKe4WV4PKIUvQQkPC+jez+rxQ/mn9DWx7IgyS2vUYzbmMqLINCd7nnV5TrZ
	7Km5bltyCN51zH+QYzsmXOTyybnddZA+mm+aw=
X-Received: by 2002:a05:622a:60c:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50d3bd40f98mr34192241cf.48.1775028413501;
        Wed, 01 Apr 2026 00:26:53 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:50b:3a6d:db64 with SMTP id d75a77b69052e-50d3bd40f98mr34191931cf.48.1775028413026;
        Wed, 01 Apr 2026 00:26:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:26:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:25 +0300
Subject: [PATCH 06/19] drm/of: add helper to count data-lanes on a remote
 endpoint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-6-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3274;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HHcarmRqwtUT/YnQfaZxOlaXpKjrD/Y/4QHeex8uzNo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMirf/D5V8Y5hyL+Zg63UnoU5G3+GGFvPWTA3
 7U5rYhghZ2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIqwAKCRCLPIo+Aiko
 1RVtB/4wGDo7gJsEJlTeeGYm6xCRzzyNAlOtSsGBTzAqQjHPPxemPBNkIIjpDpEz3WAVxdAhg9A
 z3CJpRTKg2RDGPZjsDcfkwEhklLBd+HYehWEO+wPo9AbfvKZA8sAW51n5xjPOHuoVtuc/sLzp+I
 S7V8xpBqtx+0B3QlWtjtT4wT+V3nM8h9gJ97rUPvUMnOpeutrDFhB3puaTciW2MnLmCaEHJfveV
 nuRAV3XJkr5oFj01gfqI08tlheFfBvnTt0HdEk+KLBZREem9VRaSYf+rk+ZnBa2Hdgm6yecZZ7h
 8ytRBoa6UKtwFtSYKd+y7TpqPuKaoroauh6BtknYEVstJS5Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VytAIApR9DrDQS-EOIDhfRNRZrJmJ8Ld
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccc8be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=O3ifdCkKFGgQ8ueZnWQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfXyX44lx1plm/P
 m77K9REj3jNHohu+G+JI2yHAt2NxYQwV/vWMkc0+9y24ZQwu+92Z+6yxrgSHkTI8ARzAanLRNb2
 o1RZj/cak1Uu/ZrdesU/u9bewN1nG3kU64oAK/ybWB9sSMiiliOyx8TFgeLjGCmMFmJfa59ckSh
 5wXy0Qanemnk8SZ3yqIpIVI89+SSgCx9snMnSYVuAn8y5fu7yGcvNQnhk3Fql4bCHLQ0/ch7SNY
 0e1bpYplNLshKQfxXVjNr7y4OvRUX0w1b99eCVXl8XFeQo/As/SVd9LZFo0cKHtoUk13JhDDBZF
 TuI4zH8Bpc1gSVtjs2z6HukRNBxj/clEv779GJan97dk5V27zHXviLz5b4WXkDgynqYYapkpf7u
 8r1qeWSFBBXy6iBjCW8XV8Js0hq2TLt8nspwUeQMYs67DRy+vNDU8uygqF9pd4rOP0po3nvQdhn
 r5yovLBwR7p3A5W5LRg==
X-Proofpoint-GUID: VytAIApR9DrDQS-EOIDhfRNRZrJmJ8Ld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-34535-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 90125376007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the DSI panel supports versatile lanes configuration, its driver
might require determining the number of DSI data lanes, which is usually
specified on the DSI host side of the OF graph. Add new helper as a
pair to drm_of_get_data_lanes_count_ep() that lets callers determine
number of data-lanes on the remote side of the OF graph.

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


