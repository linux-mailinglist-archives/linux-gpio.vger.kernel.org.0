Return-Path: <linux-gpio+bounces-35037-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBkaGgA92mlCzQgAu9opvQ
	(envelope-from <linux-gpio+bounces-35037-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:22:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E63DFDCD
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 14:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FDD03016D2C
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Apr 2026 12:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3B7352C34;
	Sat, 11 Apr 2026 12:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EITOwlpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqToP9cG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBFC355F4E
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909467; cv=none; b=ZtmWIb51Zy5JxwW8dvC8i+sh0zdVdTqQkS+E0w9Vf+pTtwDPgjU//RGbck538GXTfdDZ0JcGbB3qjByqLwUIQFs5bzeLbSnyz2EBWYapMpfLqaMSt5H6fDxw/mFM0Z5mp/DXQSTKcK0qvlJjbri0dHQrkh3aYUzdADXTz6zUXLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909467; c=relaxed/simple;
	bh=Z9LTIc7mkl8iWxx7biEWKT9WKaSV6D0MGLZPFj17wto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G69m2aArVFIeMpu6NliGzh/gsdp0e9jctYnT3ZW/3n/rjFUfvpq/T5xbeNauosdrIoT1FUw0eRAv6rcvpsVPQOagPvKaCdNorgciglF4j/hp65gvb5RZh2inzMURh6aFJEZj4V3t3j5IACkLhVVwffKttcbzQDIHaMAEPq1e184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EITOwlpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqToP9cG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B43UiA621326
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7mkAgduLRIwjHS7HjVchMyGBpOAMFCr+vZmhtUZ640=; b=EITOwlpgdnKjwFHO
	48WMXU3hvSeIN3rejsMYcKnMxz2l50VMm8YQVqgvU0wV6X3D3cszHRmijJJEOPWL
	SjUxUYP3d9ZY105unmjjfJrrgXmgaGIGCVfuxoUo5t9MMAUh89nUqGkjMSLhO1Kb
	KlWSGcgYL6kiwTeah5Uf8gwiShYV+mkWKIhls1Rk3OJmEhZXNKDLPyW5BhVfU0pq
	3eJcjjj0a6CDhvGA5yGld3cB6Nq3KZcgD8Z/BPwoCDC7kmAgMip1MRrfwS0bs4oS
	mcWrRUdGScta5liECcLCqY3VkdVlRa2HJ2l2IZuNSqr6LapYKPKQcFOZ+s/OIpod
	kH3q0Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfrnaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 12:10:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d6bf346adso60404001cf.1
        for <linux-gpio@vger.kernel.org>; Sat, 11 Apr 2026 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909459; x=1776514259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7mkAgduLRIwjHS7HjVchMyGBpOAMFCr+vZmhtUZ640=;
        b=EqToP9cG6F6i77yxV9TAzwHwMoSfnfL7awKFde3nF/VDxtGBhCMvOK+p7kYyPTy4aC
         arE5Yj7iwLXyyVjFKkd1LS6EE4c+caabbwTSPGKr/nJeevvQRu36GTnseAFZRmjWoPVu
         6qvfn5QQBtFcLfSfAmisVTl90JHlRsIfS0WudunrxKT06Aeztu+ePiolnoFZsTyLcqrv
         B76Yg0G+hrT+NEganjcvtTneaVVsSxbGZ+QSvtohEVJ6HkzFaFZHdkhioxJGLifQdt0W
         yQsu2EIR3D9W1vJdXRNjGyvvLKzB6PsWFcv4lrQv4su8n+6FiY3mjwgGHOXBdleyMXcd
         jYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909459; x=1776514259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B7mkAgduLRIwjHS7HjVchMyGBpOAMFCr+vZmhtUZ640=;
        b=J1vttsdlecBbNv2C3QhoRvu6Rdqgc1A3q31SqF6mcp4xR5RCx81lVkjDNxmuj9Qlm2
         8zuK/V8/OZ5Bn06ls0ksh0rzR5CaMT5qVvYGNSbdwZ+wJO2aID90hoBo40CkZMeFgwFT
         fBe7x70n4NrT/P85EFOX0jLlfhNdFiVyid3zpfcpReF+870NgogI75RCQvznt1xKEf5M
         ToDd8p3xQ3gBFUrU7nG8YdGGwyk3gM+idpAJuFhJC2Edvg1k9RuoTG9sPRzKyZoK8o6t
         bDqqlvME+kNAz9wS4JsiujXzvBfgb/Ory4c2l+O8dPCNhcNAI7+odPn3hVsrlkNUWePv
         EM9w==
X-Forwarded-Encrypted: i=1; AJvYcCXiGGpVxIGqoCu2+nNmhv4wefXokKEjLehhWUFS2TXaygLyL+lr3tTn4ydxNSWR6nc1ehAE1cYVjlJm@vger.kernel.org
X-Gm-Message-State: AOJu0YxIg0UDDz9IOQ65hp6/oASPoo1HvIbhiRQX5mjVPtM6FWDZcnuF
	CuPQUXA4aw427SiOUCX8ciP14hViJY4ddl/7ZwamAPCRcyMjX3nvr6N6s6UEOB8it7vhWwhLaFj
	tadsIJxnpa5AV6HWdBjMS4VDKMvxGR0PW0+hP9TdnxeY/y8odHCnjtF37od2HqrLcF/w2+Q24
X-Gm-Gg: AeBDievu0ikHTpB8Z9uLXlTM66hCuU8vQp5lIV8YB1QW8f50fT43xqaDHchAs7vhrrm
	44Bj3e/3W9dw/OEuTE/SU4ZwYIJlH4mVI2dCLOhIXqQ/OEvtzygUJNAuENPSmjW0mpvYXKGyKUE
	JxdrZyGU3F8ZXeWeVJhCqwzpnotxzMcoDqWg9Gb745l7O6Hnu9Zk0hRtNgOR3NI5u62bbho797S
	MeLwLCzcJhe7qtNtp17gaOGdj1ZHHAi//4JpG8pwsouf1PdM/7gm6EBcS0A/sM+zskyqQFbbvCr
	223xRBvQz7b+AL/bsAJbF0LKKiXGshmX/ld7PoDUGl2USfL/aITtLavDRONwWW3QyEEb8M0sAQz
	QLq8ZtzM2bWyle7MxPKwK46o246KRBRfSQJnzUTDFbbEnSwzwEhVk12DxGyWjdbOfgR6RCfN3h9
	kUWTKWVHrn7JMQubUCrrb6rJGKsEahF56LoP0=
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr101502171cf.17.1775909458969;
        Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50d:8b40:d97b with SMTP id d75a77b69052e-50dd5ad8ef6mr101501651cf.17.1775909458536;
        Sat, 11 Apr 2026 05:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:25 +0300
Subject: [PATCH v2 05/21] dt-bindings: dipslay/panel: describe panels using
 Focaltech OTA7290B
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-5-75cdbeac5156@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z9LTIc7mkl8iWxx7biEWKT9WKaSV6D0MGLZPFj17wto=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpF1TANS4p4rX2cYweDRiiHMA7RoKoPoC9QX
 c6o/e1yVUaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RQAKCRCLPIo+Aiko
 1WtSCACBJdPTyjoXeeXSRIv58J/lofWPnpp5jcJnhszneW6J3/v4wsakJe1FN4+zbnjl2MKC33B
 3+lRHRCxFd8vDAnxX/Wq1+XDBWttO/OaDi6H3XkM+sVPw9Mv1IjZG9gz/MJEQslATnIDIcS0qwH
 gi15MoN40fxlT4HKJcXm3zy2OFJkRtCW6hXWSc9rxGFEtPQ6pDHqGB+/P0tQ/XqiFFQBAQuP7iT
 0GkJp9b9LGX4casWhIoZLMNZ26WsXarMBsGL/Wjex9ATiKgCQVDH9BpwtYZBQ2RcY475rEMhOwq
 bzXo9vmAyMLfZt5hPeVTyuZamNjIyXMFbFa0vU1K3JyeZY3a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tX7heU6svFwHEltGrAHYKEXHtqau1sW-
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69da3a54 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=QaDNpyu5kUm-e7c-h_IA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: tX7heU6svFwHEltGrAHYKEXHtqau1sW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX8xnG0SJqN3NL
 +gLANXmvoWoQHo0aDT7q/F7Ae7gwGa2/Fr0hgXLs9+7c3bKaSo22KmHZ4CYmBia51Kk4DPaYrB4
 hzDRoXHetTJ+PXjmHlEXGU1cwMboLy1ztwGqgP6inFv1bGk0JsYhAUgZeRx8hxnIyTmYk6Wr1vw
 5VSIIhm0UbyrCRAZ/PqIrfHSkOEmd0u5siLYjPkbSw4QGWqez8U5FEOtqyo3OkFM7pR0axRk5Sq
 b5oL2Zhc51BJfiarPT+RNyOzebFbsBfgUAndJ8zE1b4DxFTsu3+4+m5loVs0w0dyu1KVIRbJgmE
 zA6H2ElLIXo1KquG/rU3/uckyMls0JE35gE3jkqe0HZ3eWzu7DfynCJTjNm/IzEHKlMsWQaBrW7
 TpKwG0sCQjR1+a/1l6wEPU3sfgb73SrO1Vj6L3C2IEgqI47KDJmoWMaHTgQFgafKuSoesyB4GGm
 l6/HFy/w6e+aCbM4R0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35037-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,huaqin.corp-partner.google.com,xff.cz,redhat.com,edgeble.ai];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[22];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.694];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE0E63DFDCD
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
index 000000000000..f2f6e254b7de
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
+    const: waveshare,8.88-dsi-touch-a
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
+  - vccio-supply
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
+            vccio-supply = <&vccio>;
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


