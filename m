Return-Path: <linux-gpio+bounces-34547-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNzlG9nMzGlFWwYAu9opvQ
	(envelope-from <linux-gpio+bounces-34547-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:44:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0373637633F
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 09:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF33C3092AF6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 07:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD323876B2;
	Wed,  1 Apr 2026 07:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCoAj8BQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O86/O34Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DEA3859E0
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 07:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028454; cv=none; b=GCyjjXI0YfFhcc6uraRdm0gVjHKFeHrlJ9jTpRiySxSLBSo+wyPBEea0mFKMx+25veKhgMdRoMl0gyN8CYhxCugnvqzIdMuuaVWI18pJx6qUyzCEwA6kTzkdPcr4BIrUFpZfmg/4ynqN/3IA8ZDF79N+C/3Ddzt8aX48G2t5eHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028454; c=relaxed/simple;
	bh=HtwzxipjsvoqNyUTrD+D5sP0QrlPOyCeD+T/UASezKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV6DTmPeqdHrg/+O0vh1Q/mgMNt/4U3wnpXkjtVF028ZvCQiAKPYBYFbHs5Homo/rr5zAmTXCLnr8mcguvYkicjAeiXuSw58Qv7r0ZMP+6Fiq2wRKkrxbsZG+uHPTHBxWJbzwT2VNMHuyg2EJvsnJctUKE7VDfO/8q1bpvisIOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCoAj8BQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O86/O34Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317EoTk4106695
	for <linux-gpio@vger.kernel.org>; Wed, 1 Apr 2026 07:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBvoySoeYPTqCC73JiWh2WN7eQdyTDqqIwz/3dpgTxk=; b=QCoAj8BQqcGZB8Ij
	RhWfoHLW9XwJ8NJrTgy4j/hn8qLuL8UEJ8+pQtUzbXr416JutLAVaiO769oMQV24
	pvMl5yub73qGVensZODpy1XvAW9HgAHEPxamnu/qh089Xmn5SvMOjemgHST4hDFW
	le49YWRBp4JSd0j9VwkuS+GARsa8oS6BAW//4+5J+0F0V+oI/vvPT13hqTtIRmKx
	H1ms72LHd3co8EQfv7qUSy2WMUlDomT/NOPe/AWbMza0vgvgIfkqnezma1iJysBq
	kyCjd+YiavtebK7K/NUiyV78mn97v3iKHwpwOxwNihjlnMrQqPhpXyJeHeu+GpCz
	nR7R/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt901sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 07:27:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so205156171cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Apr 2026 00:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775028446; x=1775633246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBvoySoeYPTqCC73JiWh2WN7eQdyTDqqIwz/3dpgTxk=;
        b=O86/O34Q2Dt+0/haQt2kkiXAPvfurM6kBGRhe0LcIiko/5v4eHFjxA0TD1/iaPhPax
         uGZLKchDEj46iKaRhUfo3hcX3fE902X/9Q40jCutUlaw0nUqP/VpxxvMYtLDG22CGWBo
         3EJvXi0Gi/Ra5BqwNXp79Woh/8yWh9e4YEqSGbRkW6RFuGnOidUNEbSKjx2/LEnG1ip+
         AkT6ah1/A8RVV6taeSA3wb+sPzYCL7LAXwT2MQZNG3Ex1Z8jjvv9xIk65y7HntZOHuzO
         bDtnKTefj+qC8/qMaGxStWau1JmrzB5k9Kbiuv9dMwcG6ohkdkJxMLzUgmZSHulMk1L5
         vTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775028446; x=1775633246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sBvoySoeYPTqCC73JiWh2WN7eQdyTDqqIwz/3dpgTxk=;
        b=IkbE7ItXSr0Eht9Cj5wfAI0nSJGL23e4L7JWJSwT9wD3n48ethdI05RXFonwyftIjG
         ra0WnblGVEP+tW1uzSa+ndDWWOT1EVnDyiAY68MxhHJkQbzUMu1P2B/GnUPCYKfiItzT
         NFrAHj/qguXU40HiuwS9bsfC6yBbUoh+4O2bXnS1uBd1TYyK9BV1yUmOyg3Hwfz4352d
         UsTIkSHgVwo49HvaqQ4s8Z6clwVAEfM0RM2fYArnSBxEu0+YIHASEZn3lKoKupKv3Oiy
         KhgOPIFs09ZvVgLqmLDGMCgWvDYgnR4XzJjvPco/zE4Uj33fplsTGWByuQzjQf0uHN8a
         128A==
X-Forwarded-Encrypted: i=1; AJvYcCVmR/vmyfftYdUJ0uEr3W73qJUe1LJow0YX+wNCtOq062/TM6cpW5ZfeM7MzCHH+Dv1z6zRJXI5EBFP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr42Qpn20zNTnO6RrSQZI59IRs03ohUXFaP/FdSmsmbCzqHPtK
	jilhuTwuwk9gTpFTEg/JxvPJQdx9dVxuN/jIQ79HAeuw2Zat6bXzlM6Uwp5b49DwCP/FNvMMeeR
	ZucEU8C6rls9LTxw+vJEhm7lXq2M8gPf3LsWYC+sEcitp+/exqygZDQY4Lq9nK3/0
X-Gm-Gg: ATEYQzzq4twXdH+iLlJvIB9DfLZ2siaK13Kg0KkJrNd8w+lGuf3QYqMGHd+9yzlpBPK
	vkyBqln7v+46WX6OFNmBpOTMd9wMlSavHCGuv6ATCwGnSVcOJStEKVSfqCqOT88lY91GJK4RQM8
	lhdPQZyHi8K4vb0NRNccf/HOCDN1XOHisIYkrqS8Bup8tP4qHFmTpwdH5Bpuc4BA85VbbvtO/Kj
	UK2F4wkJvRc9ehWfDt2fEF/TFCZPmW1nUPogjQG5va8iLNfmjT1TMMeNDvXwstmluxBttxmBadh
	wTSQltwAs4lsRWkjmlD4+kUu6/C4uejyUn6lpVQ/5G+Fk9hQ58k9+E+S44lq6M1PAwIw45g+iuj
	kY+TDm+pZyb+HWXM7zx1bItTaJv45yTlr4BCHJ97iiUmSyNlPtqwcbhD0hOXXTL2caFuS/rrHxp
	xUsxgr8t8twcO5lh20BxsVVnH+JmimXN0DlYo=
X-Received: by 2002:a05:622a:4d44:b0:50b:37ff:727e with SMTP id d75a77b69052e-50d3bcd6cd5mr40547651cf.44.1775028446029;
        Wed, 01 Apr 2026 00:27:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:50b:37ff:727e with SMTP id d75a77b69052e-50d3bcd6cd5mr40547281cf.44.1775028445581;
        Wed, 01 Apr 2026 00:27:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cb9f31972sm8638421fa.12.2026.04.01.00.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:27:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 10:26:37 +0300
Subject: [PATCH 18/19] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-waveshare-dsi-touch-v1-18-5e9119b5a014@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3596;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HtwzxipjsvoqNyUTrD+D5sP0QrlPOyCeD+T/UASezKA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpzMitIROjhvWTZMh0HuxwLl6RLwi2dOSpLP4PQ
 63JxM58QDWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaczIrQAKCRCLPIo+Aiko
 1fFTB/4nRUdFFEb85PbFCgZyabFbNUMA4V+tVCnyUm+SYHghuDXjxBcCFVnqQhNafu1K4xcGGiB
 VwkmMjSSEN/x+s3y6YNdN933IlUJSZbnY5M5VKo+RtRva2IjZC79yp7r6doW2wksSlhx7d3n6yF
 RSviYmx8ORBgAJRWefPP2YxNVneOmgPCd8gNHj4AIGh+qdqMjV9Izz5C19OM5iNNys/lnczDj3z
 Q5zyPDh0f1mb1yHeNuySA7Q9mbs+X+v4AiZtJqkaV6zHWpAJvxun+CAPRXfuAysnJv04+xUa/x6
 Uxz4N1lx6KS3QWDLiM/iKcCUF3eXqvzeArFXI5g9K5aDVz0L
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: unlFqKkbJUsf38T90IaPGKYDCDYzHfLb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA2NCBTYWx0ZWRfX6ohmsWZPOGN/
 iTGwRTxJXNwK8xOM+VwJuKZHG+Ls0xV73MZvUcA1gFxTlUUSLoS5upnYHBdpO2Cjv/fVguVJ+AE
 tVDafrk5afxyHLAEpAmPoGiWvCLnzpN/ffbRfkRa3Ns3aA9fLH6DufYonGR8naEEEWvyb6ZdjwM
 QOAV/MwF+EnzcA4aHuhs06OaG0uRxYiI+9BzG+bEQBto9ghDmAOMTVd4dNjelby8q43uvjMSY/x
 WLRdjf+x9jCfDXdjGGoV4ukehFGSqFQOk9mr7dt99A3CiwIKnghBq2+w+cVTQAoomdwCIi/3Oo6
 tyOmbpUP4D+6PlOVJdx8mLHYL7g6CoWi5jCA+dQ9gid7Mx/dvdEBC/ZIMMNVocl+jiY6A3Vn9eY
 61ToPsXjR+QnL9DCqpKEYrWbeCDT5rs7MTKuyzt8acQpePJOYiuOMnZpZpDybGxsjjSlDn/QwCE
 HA59pgaswYJuQXlYywA==
X-Proofpoint-ORIG-GUID: unlFqKkbJUsf38T90IaPGKYDCDYzHfLb
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69ccc8df cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ClTKKeZw4Bcbv9k5X4IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34547-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.45:email,qualcomm.com:dkim,qualcomm.com:email,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
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
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0373637633F
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
new file mode 100644
index 000000000000..2e622b668f2f
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
+        dsi_panel: dsi_panel@0 {
+            reg = <0>;
+            compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+            reset-gpio = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_avdd>;
+            iovcc-supply = <&panel_iovcc>;
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


