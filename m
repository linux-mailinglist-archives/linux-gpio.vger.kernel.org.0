Return-Path: <linux-gpio+bounces-35115-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK/vKpj63GnXYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35115-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:15:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5314C3ED303
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADCBA300D1DC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 14:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB0AF3DDDDD;
	Mon, 13 Apr 2026 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbV555wZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLw15uoO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A73DD50E
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089190; cv=none; b=o5tudbfF9YwHsJFsui1aE63VALjhZOMaqBkQoIgeTQXDVCtZ1KvNcWa+tMugCac0LfpUEwjZnp4FudIOdjCnn6wgBsiGN3g2jep7ND6BSjlbSGWyKE6WbgD3HhM1On6n9uvEXmyANZBkEdWeuGXIjehfN6v7BCOrfy6/XuhNeoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089190; c=relaxed/simple;
	bh=NxOTOcbnEcq1UCCLVr2MVAq8PhJPaj6hbxOeziIVdG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8eBTucNj8s2wGZ4f4RVk2Dg97nEG9QJH7Rlytcz6lCoh67hUNhRY60BOUORFB8wAG80+byCGmibLoce8hUP4VHQV2vgctjc2aO6JVLc0ewb+hhgMmcqsNm2deTduz9iMPvQyP2w77TMfhvCfVffy3uHvDR2PeJZku8tQ9I9s9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbV555wZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLw15uoO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7ttrE3974426
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WjVXXDUz+b865LEXWgbJquW7AHByUWxUZ2e7FwcrFA=; b=MbV555wZ7gt/jskI
	8sJl+Yg4FtdsndyBJmwetOSOj68lMxTv0lOpFSp6ZhhQdoqBvGlz1QA8BgbKnbcv
	N3XRXapDFWTgy4TW0HGee0F24WsT953NTEyCcq+Y7cMzIdJU/ioRCb9r8r0f2s0F
	vyZy7XJ+UBx+GLRyG1gE1PA+ruxE7opnrfD3hgM8pb1GrOAoIWjkVBDhxJyrNKgD
	3AfjW66zLC9INGmVllEoLcJEYc7CKYo/NYcyRgCsuwq4F6E3ofrQCkojmwI0ScEa
	J4xibrmPH42iHUxFK65xIvvyoNVI8u8RyxeA4orjQJvscPzRJNjsRLRDDy1NMPOD
	ig4D9Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfjbpd9yb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 14:06:26 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-467e00b684eso2793635b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089185; x=1776693985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WjVXXDUz+b865LEXWgbJquW7AHByUWxUZ2e7FwcrFA=;
        b=iLw15uoOLM/gzCfcO5u5dsNC5rN9OQi/fep6y/+z/ammD+U9aGtjPqaISTbGPx62C1
         Pzf9YKK4eGVaFMrQu+gBQy34bKMzvagSVnfO+mvBdQPgdBtr3gWfkXOC4qU0OuF7GoY8
         dFmmeQT8Y+tBx/ieYsnmiOR2EMlpJFm8RrydAnz7+OtXPYEXeKPdhnds1ez33IPIbfFR
         syIT3GPP4t12r21DSGvA1XfIdZqoQk2uo/9/dbHoZfYiMnCAD5cT1j7rgyURXfI5DBxV
         PwWyar3BMotMWJbXU5gj3AdqzPOH9Iwe47xLWw1MHHSHsWkTQPDtA/gLSpdFltKgUyYj
         ZEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089185; x=1776693985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WjVXXDUz+b865LEXWgbJquW7AHByUWxUZ2e7FwcrFA=;
        b=Lff4Y99nKYh1ZweGvl7SeF8eYA/yEpSiLqv5qWxG91RPiyGNAcRtGg3sTqUk5tGgLE
         cgWBG64k2SScxQCn2kOs9HHqklx3TZleFYfjo0RMa0wRAajgv3PtiAQSAvCMPkaajZfD
         819ptZr5omoPZZ7yW8KxvrZkx5bmY4d8XpshpZcIYSkfkQ3AA5QWduwrmbl4lct/j6Rt
         Hr+Bpo5xpCYTXCrRM9qlIkLP6XrUAQoP+us0WZD6nOga5+6IFKgqtx10EQwpCn5VvZI3
         VIXpj1qWnYT+T9Ly7qnlG1KkZA6EGU29xD61urOqEzcUDPjp9iwX4JgjgzzFhTs36Ile
         bwcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PrZm90crD/1FRNL9ncqb+3AxmLdtlFp10gAeurkZPx4tkJRQAgnJuj5JBNLfQ/nSOv9QubkkxKh0A@vger.kernel.org
X-Gm-Message-State: AOJu0YyRM2sQ0IAP2/YAZ31N6FNphAJECGieh1Pxy2gUVPaO5gEvOpYL
	6wRb0vrvggCpnJJLlQwaiEhK4J4yD12lC25gr9gEnha8+j1uk5LZRM09DzvTXKYhaPse+DnU18u
	7Zgo9WWmdQl7R3hIj1i2qWGWpy+7FqeN2JGJ5eTLxd3yDOjS6zo4ng6+Peqa8fAFZ
X-Gm-Gg: AeBDiesYb3gTYIzRij4wqkjRNx4B3L6ImDGY82XadcAcaMA31KGn8M4PoMC5wgyHZkv
	MvuQPMFBBo5JXJGNNgF3P8UfL3ZqHmRk0qVMNStMpd7frgHpI/Oo/OVqC5V3az5NU4l75bOsDUL
	3MZ2AGERm/lebkX+DAS6QxYLEcJOX1fNoJTYgLzv2xfiikgijSesfTBU1lLo3QaTyAhFjqP4YVV
	hEhSyQA90RnuYftQ1vFKYsSRqLrAT4InyAjbUq235OEfVfUes/Js+uzB50FikeXqqnBl7z0dgY7
	QXERytSoTwWo+9D2reSB0M7lvMvWNwghAGrvvrhdbPK4eT5Em01ERBD8y1R8V3Ul+2zWH7/muHW
	cgt5GR3byehMor5eNty0NPY7veJKZYXpA3a2KqYT6Lm0KNXb5w/AmvGDncn84++6meCZ7A7Z2vV
	MmdC8Ja8YFmftzwFWDu8qQQU9bVhahpNGIRc0=
X-Received: by 2002:a05:6808:1796:b0:467:db23:25c with SMTP id 5614622812f47-4789f9008e6mr6468630b6e.46.1776089185115;
        Mon, 13 Apr 2026 07:06:25 -0700 (PDT)
X-Received: by 2002:a05:6808:1796:b0:467:db23:25c with SMTP id 5614622812f47-4789f9008e6mr6468565b6e.46.1776089184531;
        Mon, 13 Apr 2026 07:06:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:43 +0300
Subject: [PATCH v3 20/21] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-20-3aeb53022c32@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3582;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NxOTOcbnEcq1UCCLVr2MVAq8PhJPaj6hbxOeziIVdG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgpJbQp7/Thx5AFbDZ3MJz1gCOh8B6IHEIIW
 fv5ZYu/LouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KQAKCRCLPIo+Aiko
 1WlsB/9jCSy7PdUg/mLPbALC+8TGXtsfMpAIz+y/8wCXE020hB6PkIF3wXzJPj1fgghhVvm96+o
 V+llBWNzGIG6xJOLUaTAYK8aJ01D7Vxf5h6mjbldw9m3yFVyRI2yys5vSipyVw9Wk1/SzKxOxaj
 PgQVJh37OWIinWagd2PrA+gvCOLqEqRuGG0Kd8CT6oXMH7bBTNQLrVpKS7DfisGHcBMTEaJWvTM
 lwV9+R0HVmdkogNr0isj1DFP92rnsMQXDvdXXoFaAWuTqcbseOBKGVK2RKhsaPoRT7L+GuJ302l
 dI1npvbMOw+/Km9vf9Dzm8uGawi2mmG5y1OPEy+E3LpGkrAI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PuijqQM3 c=1 sm=1 tr=0 ts=69dcf862 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ClTKKeZw4Bcbv9k5X4IA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 2ewg48RGYmx6m8gZIjdILe2uR-iSCbny
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX+vAddeZcmfp8
 Sf+Jj2n8dIqOl/dQhzP4+borDsS6sjndvEbt7czgwYGPFYzFXsjzB6OjPSqUe9wB0DtUP7uRSzD
 /B6wV3RwR9mOprJTJIZG3oBWHNqre+IAPxyaDOj8/1LLYhypOD/EsiFp4HX2/set31UU0fHryCa
 p3KUevf35nqSfHbf3Mn3ZiEEqENIeMX8llQ8XkZ4HQXAuIgjn4oNvZCp+gqlR7X+Pi21Vb18wpJ
 IK8Ne4D/2DzAdrJ12Qo96kCoxsHb+Th9z7u9L1GvsAOV9wDZx2ArWRSW3jTChLG8pEhOkxzU/V1
 ed+aS/72Dmh5rIMRM+iGOFqBzO4prBdL7BQO2BFvwECBrB6ZdrK09FWims2onBTkcvIP0n8U+/e
 1L9tYXAl8doa7Jw0Ih68FxWSK8pXawR7vnM5R0DNlqPCwGQqGN6KRHv+0QXOrmvktckJQMahGUI
 +I9HBVn4JG1UBHo6ejA==
X-Proofpoint-GUID: 2ewg48RGYmx6m8gZIjdILe2uR-iSCbny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35115-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,0.0.0.45:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.182];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5314C3ED303
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


