Return-Path: <linux-gpio+bounces-35100-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Dk5lKWv73Gk3YwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35100-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:19:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB43ED39B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 744D53020FF9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EEF3D567C;
	Mon, 13 Apr 2026 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tu9OBUKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d7+3Ekdq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1963C3D6662
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089149; cv=none; b=EMg/wESVDOr3odewzYEA+Dhx2KIOqg0UOFzMUfQdD3TLsuZDvxJUN8vj8W6kGARhrGVExJSUa1dXV8RCNWIhJspAZwVYqPHhELVGozVfd8diNzdLcRgXNHSU9UdVAXgcp9xl01kF+swd6TZpCf12YpXH5E1KO8aKtOsZmNKwTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089149; c=relaxed/simple;
	bh=YNT6HJHw0/nCX1SaijWIwtPuC2ZuLp0/LuAjLLjwj8k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdwhykWBm2qSghEs8jka04X4GFQIqpEYAwNuccrbZfOUQUMjz4pB9I2CSW/eSsPPVuFml1AM0fbOjStt3fXMMvLggYGAUNMuX8rW/bnCLlXPf7ypc4DaQlEJBV+eg6e8yCG5L3AqU8CYuWKUHSp9ag22pRVpKctMI/+2cL1bv1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tu9OBUKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d7+3Ekdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DE0q8G479974
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YM4SiJ2Zj80hOp1krAUX7NiRV5WgNIXZzU0sB+g1E9U=; b=Tu9OBUKnDAQSV07M
	dcK2CIyAVspJE/h+baTOjqtp3WBm1+eFGCcwbW3tycfCi9Z4vgIiOlPSiBBTVDGv
	RYpv6UzAFZTgFHYj2jYdorktUL0MBHZzVa/5ch6pqVYnMqPVGZuLYXava7F+BVWu
	3a0WGx8ugiXJgweK8/oWF3fi47At8oOFExKen5WqSlX6SSTlCQ04PZ8100p+VfLR
	L67ecL66Jr2+Hs5Ap0JgiK/m+Le6jth62RU0hmOXpgOqwrckhd/VTs9Y7uVRGJIc
	74xCrt5mgbJtA1YqZ0I9nTSFdYa3ScTTdCau3ikl9SKeJZkXFTm/8pDY26LfoBqE
	S7dgnA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dguuj9dkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:05:43 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-475f6d0de69so6197917b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089143; x=1776693943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YM4SiJ2Zj80hOp1krAUX7NiRV5WgNIXZzU0sB+g1E9U=;
        b=d7+3EkdqeaIo0jVDdQtLy2o+B13Co0PwzYN2Dcg1l6iLySceOI4f+KU/P0ZsQGTt+4
         Ao1H5DQS+wzii4ydA0dIt1EKPXgx4oYJMZDKFKIStILXPnMH05eAEdaA5lZoYBtEzDD/
         1o1B6ckMZMiCGE2NI2dgqtymFUIPRhYeDtzbaQFh5zPXVCq4hrlihO27K9wz7ZrAFGBm
         FpWX7hC3eewhOF8LCPijUrYxTgQ+cZgQoh8fB0GICJRQJ5DgvR4gZVqSVmA+Z2l+2KUA
         DS3Ah0weKJo7LRbATbr0lbmsfVeYVsENEWch/qs7M5nfihoxOUJ9aA2mr7wN2+weg/5X
         2z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089143; x=1776693943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YM4SiJ2Zj80hOp1krAUX7NiRV5WgNIXZzU0sB+g1E9U=;
        b=hh875zKB4wAi7+pHEKZY2TFMD/aSQ/8Gf7Q2GKC9FQrY5ys1RbKKAujDUd94Zc73G7
         GZplIhvCHOx4P94gzFoVWqLQR+pDAE9EnXt6QpsS19e+4AV1p6ZAuN+TprsiL9QgDRhi
         4K+c3klzw3lMlb+Qx45lGs8X19De/p7HNY6cdQIXDV/KzZeVrExdbxjSExXHJTXDQCGu
         9Q0h6BmR4y5LBEaIZh1QufJ5DRyO6uVEbaAKQD82P91QksQE5XOJltyBJzvjwX4cBIPg
         Iyxg6P2k/fSC0ucM1ZHzZ1NY/S4BbrXGvVuTt4TUwZmk6eWON/GoZ+ezBjC9xzt+3xNu
         UfDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Gp5aqSPUVDNWTAhO/gI64aKvLtKubppjSRaCb/ZLZb1HhszXo9puCgtyN27SIHVvtUFYSuytQODHn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnq3A2NY6thiodteHv3Nj5GSNdPdrQgLjTtQ4i+J0wlOemWdDV
	6ITyDNAEJ31f1SnqcnR4WSPb0W14gBLQUIPKUfJq/evBZ3nUjd9qUwrZF0vTl/dU7G0Mw+9YsSk
	xtoAYHeeAKkyducBz9ZTB8fxlWkjeBnfTvNVwZb26DrIsMAcmj7kITPxNSHcTT1qr
X-Gm-Gg: AeBDiesdB+QXhYBHyaZPrc1yvmjSTNt3DHR/0h0xmM0EdnxVvAes0xG0kQ74jimt5wM
	B6NaGjSB3ttgYkp3Loj1PyfNR2UDv0PI38bR/g0w+Ba5OTde+7jaBKVF6nEODC7stij89QEfXPz
	ag8E0Pbxd+gHQN69PMuQAh3S3Hrp+h+ehuTe+nCTkKQjKYt/zLm4bQCfseAYb0BDr4UJU6lDTvT
	tpjYR71QeXxgfVLspZppYjbRsCX74TGIhII+IgcsSJ+hFmNxnX1pjaKS7NVwpKeMhe0QL/4DMMt
	OsK+tBBfvRwmNITER7hekWIp1FsKa7Q/t4gslCRVMAwF9fst34xghbDMTfIy3HdgOorpCaTffth
	zGalae+sXwHu870om7HtPXiBMT08aS60WL8nkgCND7cLJocYImEz9A1EnubGXEw+T33PvHQhNyA
	TfmjLbxul08IMD4xdGizcabSHcFwD0cwoXOI0=
X-Received: by 2002:a05:6808:2383:b0:466:f3a2:dc37 with SMTP id 5614622812f47-4789e91d1a8mr5906355b6e.30.1776089142586;
        Mon, 13 Apr 2026 07:05:42 -0700 (PDT)
X-Received: by 2002:a05:6808:2383:b0:466:f3a2:dc37 with SMTP id 5614622812f47-4789e91d1a8mr5906300b6e.30.1776089142010;
        Mon, 13 Apr 2026 07:05:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:05:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:28 +0300
Subject: [PATCH v3 05/21] dt-bindings: dipslay/panel: describe panels using
 Focaltech OTA7290B
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-5-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YNT6HJHw0/nCX1SaijWIwtPuC2ZuLp0/LuAjLLjwj8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgmQoSiaFtAo67akgghmrqYUVSE4xx+oTpFU
 qpAdn+c9O+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4JgAKCRCLPIo+Aiko
 1aP4CACKe6YIma38tUfoF6tvlx57U2bDp/AxO6wcWq1ufDdvaZn8fnEuXmin4pgufvz4UvE7R7/
 aJKpzBAUb6GXnjaQiVD36SMZuzXvHqtIZJvdNzygr26s19zHWR7OPPcrLcd2iI8rrMvIeGY09gL
 V38Ja9fv/f3/xmOICslXPQvGVOfAe7jxFy06rBdmkYYsGAV7k2lTg4/OYeF4+Huyn+gSkBz0QG4
 vqwpCcg6JuuE+XdOZTUA0pSsmBAcdZ+vdfktD+YXCTyxO1P290H7x18peGnz4LfOZYAjS+s1N1J
 VxcBZORCYpciuv8u0ViYq/lIyQhNV+HUaKkm6Eyb8Rtr7ABo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX5FkAkfxfVTjx
 5aKB/cCJFTb13l59rOH/exFQL61kVYeKZxKlwkC7Oo0eROgHH0lIagpUc7ugsqBnS9yVncdyDcw
 3vZSoabTgKFM9mk8kkTL51V7lVjS++FFmCliBRfy+n/8ttCEhAjZPUl6AhVQr5kUTZ05qt3JH7m
 jpOHi1RFz4SXO64EZi9biF1XJbgMO4en1VcJwswnYbejE/OOZ4OaC6tKhN0bVNGxwsaNYZvv3Tz
 RJhfAQ6ckM4j1Oqpdaj8KsAhLwVpQx4R7Ie1RGeXUmDp1/SSVoS48hiPIHp9gtbNjYmyEqylS4k
 W0+A2CaPU2LbGkDW0LD3osiJvRjxzvzQaX3Itfk+rGQmBl5BgSeGcCNomYkDGFppmJ0km8mG6X8
 Mc2mhvWGZLDMKjSES4YIx3yQcr19QrvfI4T1vlZpn+7wje4e3ocSKGnxXSFm07PtwGuaLlVJP0e
 w9wmzzdfN33tVqpA0cg==
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=69dcf837 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=-Tl1ayhUDf8JvLimEB8A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: eLQr1ejQbOEdlxHdL2HyyjHtpG385sAh
X-Proofpoint-ORIG-GUID: eLQr1ejQbOEdlxHdL2HyyjHtpG385sAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35100-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.036];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CDB43ED39B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add schema for the panels using Focaltech OTA7290B controller. For now
there is only one such panel, from the Waveshare 8.8 DSI TOUCH-A kit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/panel/focaltech,ota7290b.yaml | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
new file mode 100644
index 000000000000..db6775f4d75c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/focaltech,ota7290b.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/focaltech,ota7290b.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Focaltech OTA7290B DSI panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: waveshare,8.8-dsi-touch-a
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: supply regulator for VDD, usually 3.3V
+
+  vdda-supply:
+    description: supply regulator for VDDA, 7-10V
+
+  vcc-supply:
+    description: supply regulator for VCCIO, usually 1.5V
+
+  reset-gpios: true
+  backlight: true
+  rotation: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - vcc-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "waveshare,8.8-dsi-touch-a";
+            reg = <0>;
+            vdd-supply = <&vdd>;
+            vcc-supply = <&vccio>;
+            reset-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+            backlight = <&backlight>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...
+

-- 
2.47.3


