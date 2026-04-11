Return-Path: <linux-gpio+bounces-35050-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNyVKAg82mkqzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35050-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:18:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C13DFD4B
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:18:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D9783122815
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27BC3624CE;
	Sat, 11 Apr 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HVtX1g1H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TsFLe/Bh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5B5361DCA
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909495; cv=none; b=XwfSQJJRcwBhvZwFs42SxhN+GsmBlJf3AIayr+6t6v1fghfp3N8JQKaYyvdaEY6Q2xfAtswpRrYEIdffJP1R05mcqmeMbRO6sHrKpXRC2EW7sAR+uoWhzNqPYjsVmlAN3I1FrX3iYoP6twDs69TH3ghGgqle/CE+7QBcMNmxCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909495; c=relaxed/simple;
	bh=TunD4E0x54s+DUKwuOGbXcTKMUnxxvwmjd9+k4H8VAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sLLKCFcmBlYbdI95T4g7VW3Wnxp46X1ue2etYlAcvJ97YNNDVxRhC5reU26WyRD3kT822tVw8e9z6l/7ianD5HVn83aj5+5uU2MS3SiLCXqmusGFTKDbt1lUZaBS26GBiw/5mHw8TQ9XtK7FlfXFaikcaBPuinX2m91RZbRVJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HVtX1g1H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TsFLe/Bh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B434cK2736607
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5Psy+WxXrFJxWjrPWpUan7fIsF4S4KxZB8EgUH3wwc=; b=HVtX1g1Hn1UjhWAO
	eUueBXyLW5F/JIiQD1ybbQrYHa1VlqXQc5keMZ5KOEitP+cIP9APU4wt5pnfXlK2
	u45AhyigTGRnVOfP673i09iqypc6/Ln465w2cvUW+sEsevIzbXgIrXchSuowPlgo
	BoT+J23XHz2W5h2P97ekfqQqR7Blr514IchPmEIc6P+iW0I4mLrwG9rhiLN5DHU8
	7k792e1QO5PlixINwHFV2gxC6+1uA6UUIrW5r5Y41lJ4EJhnWrtEkQ1ce8X5p3CH
	zisVNHcvFmeTMCiSgNtXUGhaU4zGeWKlhOftJhB7oVtGSflnOnNksh/1ozd6ps17
	zTPL8w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcrn2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso36868241cf.2
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909492; x=1776514292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5Psy+WxXrFJxWjrPWpUan7fIsF4S4KxZB8EgUH3wwc=;
        b=TsFLe/Bhx8UyYTdAo/KSMCBNliaQhVrDVS+P0exaRb5zg6tCT7Vh6TmMPBSh6KRXNh
         BzMz0PPjRDBZlZjgnJ5r3/HOm9hgcpIOxlPmDhYkHgB60Tqq4zfMAbRheLjQkCS+w6Eb
         PazcpQi6hemf84NtorqM2cqaYjxocDjqWCPbCwUh0Xt47rshbyceHr1+zFLbj2Cuo9qT
         dXd9gr6nG4SIKM8U8nVu5Icct4MUwGvjDYgo9/K4l3ijBAa/hhrcC4ZsjEPWvJjsvBCN
         0X0xaIhCBMYMpSc9NAOZS8Lp1hJklNeZAui5j9OAaOXg7rmuks+WPyFo+10Q42glSpjG
         wImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909492; x=1776514292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U5Psy+WxXrFJxWjrPWpUan7fIsF4S4KxZB8EgUH3wwc=;
        b=FxblVZ3y93gmtciV/0kPTpSMTEh9qgLMv0znMUUZNqS18mTXNQ5c9R9z8SVogitgAz
         +uwPv1HvWgHIkSiDkw2Z8Vyrc9HRPrCNc+sMnRLKli+ymV0hjO50EMcKrLmMMnktJ4Mk
         ICAvGmFv3X17KcgbpedXfHQtsj//JIxYmtm/kXIQHAWTPpdYVvqbz34zRan88DqCzz2w
         RIl0G5XwBx/ciL65Lek9UHMGPQjFGrHLuTJ67NHutHurvov4iMrXmGGgdssQVQiUWFv3
         Vp7vU74/ckdwKj2UufTS8aqzt9WY+ezTkz7vWgOz9iAe4WhTxqFWn2aTuowXLyC8GKsk
         v5MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsEuStoBtHqOwnr77XY9XvVpFdJM6Z/Ni6z54w0VASUJwlGba1Um7hkDZDW3GLQyMooqTGFg4elGV8@vger.kernel.org
X-Gm-Message-State: AOJu0YwwUPY2WLJY0j1S0AkBfScJD3IrRq2V9lljcs6ovcv8Q8DCh/nV
	dVc1wtIAJqdLznHrTpy2b2xacO9vsXWiMIHNhABvJzEy8hSMO1XNwwfMVRDasha5KGvxY0vMrql
	+3wwKUgfPolVX55u5ypf3WRRbDckzMeCAz8zjEjFvKa2yL8OLo9PSKD1jgg4y6WSr
X-Gm-Gg: AeBDietcILLvYu0RRbeBMyyNJo+oGGsLu3L099KzoDYwSZb/aw0V5JAnh2cV/i6ZVCN
	T8qWE0ot17D7bASApZw/YUX396SLzdFgwaDdHLMeJjVbAmNFSktcIq4zOtE3gued73OGCOl8cD1
	wb4bBbTXV4rW93BEWov4KhfNcBmROWWyI5iAJd/LoX9NgNb3pWGU08wFFe1yoppWC64Ph1qc6MI
	kPzz1ezzys5I0oz/uB6Q4v7tAvnnS3NWy5bAXYDxyzVNS1OdTJ/wHnPrnORSwH2GBIPzTzrU3z+
	ALYn4EmdE7C6FDccKUGAUrvFjSanrLqoDOuX8B6ClSRr2JL58yOkRnlQzw4W4UmEORZOhyhW7oF
	dIeZ8EUmtcLbR0VNJ15rOVTG3ysZAnUe65f3c+xwBtKDwfU/aTX/22UUDcmpq02cDpJJTF3SZ99
	FFD+jYN7aTb95R/647g0MrN6CU+lT6yaHMYQ8=
X-Received: by 2002:ac8:7e96:0:b0:50b:3d1e:58ba with SMTP id d75a77b69052e-50dd5b00979mr98627111cf.28.1775909492118;
        Sat, 11 Apr 2026 05:11:32 -0700 (PDT)
X-Received: by 2002:ac8:7e96:0:b0:50b:3d1e:58ba with SMTP id d75a77b69052e-50dd5b00979mr98626411cf.28.1775909491599;
        Sat, 11 Apr 2026 05:11:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:11:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:40 +0300
Subject: [PATCH v2 20/21] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-20-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TunD4E0x54s+DUKwuOGbXcTKMUnxxvwmjd9+k4H8VAQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpHtM3Gez7N+kbhy0GNn7VWDq9k4rV8AIC5g
 V9gzMYNDHuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RwAKCRCLPIo+Aiko
 1dOlB/9R7LXGfMg9J3Q3qbrUwPk+5jcoHdyw4BIu1kwNEY6QOBkdv6gsS6c3TuPy3k0JwKB93h0
 fOMRcIaHEOlOn25jeLblSp/mrdVhZCAb5J9U3ecVDSBU1Kep9OoFnBimg+yTRWtG4u46uAElXsq
 PpizulwSizhLUPv32+Szedtdb/fRJRpNR9vqfAUJmc5QcV6kSogBIO0cpM+bhQdKJLNklkClg8u
 itHCVH92adX1pQ/CJdsNgRTGzExAZSkf7OnJhhctcdmAAD8lOYWKC/Eb6VpLmoVFgxE58V5ldX9
 BbfgdcO7eIP825VIrDzxhl9u85az+rqkOPQlcrysLmZiW+B3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX5FLybOju/gRT
 8ZzZ4bzlFbwqG1pBPEiFx/FvG67qpixKBG3WL6zWdTO/1WmOHDkr5XuE+4vCzPle2tuG9wO601u
 KF0tFcnndC699LZ3Cdh62tqN1GBl6KY+qXFbfzjYZXBofKS+gX5clXuvKBFM02TuJzoq3d8fGFU
 0y5ryP3XSTc5umAa7wP7zJeTCnxJz/n2mr0fg+qjHVHBNbbT/KXxfquKIUooLPgbqgZzktX6Aoq
 MqrD5vWizgpvGPG6qYvXR8knI77pdlVPk94/e3S5BCQ59wc9PotyPES7SrMeMgjJuTbLgoUrQqq
 ZSoRccp6iSR42oe1/98YkEZxkrKi1RkfwstmqYLiUQFs2fS/OAXA8O/PG02Q2H4KQeG2RlBKECN
 65MAhozqTmiHmDZVh4W/9QjBfPixgxLlDN0Kzr3ZXncILTJMGweCTJYY2y00tNMIelWpk/KBJ8I
 FGAu76/5k5qAL+Y8h/A==
X-Proofpoint-GUID: skoe0_xM_voBTZti58wjFjX2_38jx-M5
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69da3a74 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ClTKKeZw4Bcbv9k5X4IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: skoe0_xM_voBTZti58wjFjX2_38jx-M5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,0.0.0.45:email,arduino.cc:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35050-lists,linux-gpio=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[23];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.787];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
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
X-Rspamd-Queue-Id: 1A4C13DFD4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight.

Add bindings for these GPIO controllers. As overall integration might be
not very obvious (and it differs significantly from the bindings used by
the original drivers), provide complete example with the on-board
regulators and the DSI panel.

Tested-by: Riccardo Mereu <r.mereu@arduino.cc>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
new file mode 100644
index 000000000000..410348fcda25
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/waveshare,dsi-touch-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare GPIO controller on DSI TOUCH panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Waveshare DSI TOUCH panel kits contain separate GPIO controller for toggling
+  power supplies and panel / touchscreen resets.
+
+properties:
+  compatible:
+    const: waveshare,dsi-touch-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        wsgpio: gpio@45 {
+            compatible = "waveshare,dsi-touch-gpio";
+            reg = <0x45>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+    panel_avdd: regulator-panel-avdd {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-avdd";
+        gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_iovcc: regulator-panel-iovcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-iovcc";
+        gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_vcc: regulator-panel-vcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-vcc";
+        gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+        regulator-always-on;
+    };
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            reg = <0>;
+            compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+            reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_avdd>;
+            vccio-supply = <&panel_iovcc>;
+            backlight = <&wsgpio>;
+
+            port {
+                  panel_in: endpoint {
+                      remote-endpoint = <&dsi_out>;
+                  };
+            };
+        };
+
+        port {
+            dsi_out: endpoint {
+                data-lanes = <0 1 2 3>;
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
+...

-- 
2.47.3


