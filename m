Return-Path: <linux-gpio+bounces-34643-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOpQGIrAz2ky0QYAu9opvQ
	(envelope-from <linux-gpio+bounces-34643-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:28:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7F394749
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Apr 2026 15:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EADA9304F2EA
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Apr 2026 13:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048DC3BC673;
	Fri,  3 Apr 2026 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOQTx0YV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaYNqI6D"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA5C3BADAA
	for <linux-gpio@vger.kernel.org>; Fri,  3 Apr 2026 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222895; cv=none; b=PaEGs8EXVxFxA6z9X330kk76kEnHdDGG5/LyZhBCVULV02i0Mo8Feai/49RrNzE0MQre2QCX5QbA0hGCLJ2MMgHlgn09aa35FfTNDPXCmK/qHnOlCuRjPLLp/J5jqSyzVkSZzpRate7CmYnhnMptoHEe+IVib4nxbrAw6W5EpHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222895; c=relaxed/simple;
	bh=GPisFIElRHMZPwAxr+SS9sz+OH93AgvPc0XFAexIBI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t4u1YKI82rf9ryX5f5TRvU1Gs7bt7CEj41GtS3hXW7sGqx0fOCmPorL7Gd90rImWe5kZv5hFKHL2jd12p/wNYeeQC9Rl8eRuaL2MrLIfgcsQTYxtx1W3ixQZ4U/sB/h6EUrxZSKEpwX+EL2FEHSq1prl7Te6i4yHdCcQIesH1/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOQTx0YV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaYNqI6D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633An8661562206
	for <linux-gpio@vger.kernel.org>; Fri, 3 Apr 2026 13:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8I8lIGtrhdAdS5Ttg2u7P0fAQ6iGQRRtk/2l9tRdAI=; b=VOQTx0YVWxuPABO3
	JN14sjTyTE2Fbc62fiD+M/iOSOnOEw+A6+wim0jcW/yNNv7OIkLi/EqVPp6osu55
	D4P13fWzxeL3nLo3yt089175qi8X3ZkoAGnC1ujyf/oDkvOF7n/iuTuJu7sc3u4b
	OWDBW12bvcNYpDbFF8qV8uHq2wO8qn20BnKZrjeTMiTIIwesvzIt0AIzGIbc316p
	W7Y1w0lagQuwGyxg5fut+EK+JC+PkJcz0zXTW/AMYZa974OVQ1yogFW2CrP9RymH
	s7zgkW/RHdSEkokt1D63vjmiCLPjUNMQTmGdAkLxhdgZ+UG+D0tsTEkNyYEsvt3F
	3c6Psg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9um73hh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 13:28:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so86853371cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Apr 2026 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775222893; x=1775827693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8I8lIGtrhdAdS5Ttg2u7P0fAQ6iGQRRtk/2l9tRdAI=;
        b=VaYNqI6Dp2/jLJ+EAmk9rlXZl8JfgBkWeksUlr2aKrnQkz/i2PoFxw8A8pf86j5B4y
         49QS4yXewT/1YQsOqmC1jjmNqrocg1pixRLKNQ0YmjQGUX59NJT3DnCSbWacmGqYBZoc
         8BUmygEWH1FhdGWqI204UzilTekIQsFfYcVPz7qsVua+geyRD9aZVTfFedNeYnNL2a4l
         hr/bh7TWZyExonmsJ7XH8JihszvIJsb1a5q6Z870Ug0h7tH86Cd9MND2aaYFaUB739ZR
         5kbuIiqhtsdDN3RuU00pxoqWaSF7U3hw3L4+DNQTLiIZkbV5RvhizZYiW8jHKOy6VAgO
         8FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222893; x=1775827693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f8I8lIGtrhdAdS5Ttg2u7P0fAQ6iGQRRtk/2l9tRdAI=;
        b=VSZf9wQXDBjmK+WdeYLZgj7GnEApBY6HfuotjsJMtJiWOrRaFofCTAjSXUv+5dGagq
         c0fA22KhQLwd1a0G2vBsIXUX2nAD/Th1Dx4rOzdtKcmrSc8AP6VaWG/y+KiN8rDRjzk3
         fH8/Am4YPaVXKXH8Y8k8OrSghR0wdkiw5nOqzRxJuny+p1w28daJUBkm9k1TdzmOj8xi
         pk4OLeQSLEQNv5MRrOSZv427d78CngOxl2ETRg/4A+urMLZPJAXsIfvWewXD4NZ25YH1
         GJaTNHfVHRsFeJLaDjEk87WDKRQ58khdyvweU/WUUFw9XJMg0tJRlI5YhlIzGc6gIuG9
         45tg==
X-Forwarded-Encrypted: i=1; AJvYcCXzVNZeJv/riaPf+Qr0GSyswE4KbR+/QQrx6C7J6deI7tAL4PsLJKURklTHVFfy4puavV+f4yb4L5x9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9r7/R+GGn+ZAntWkYIKLmKFxD54Fck/Hr1Y+8xvXMVCi0CgZp
	GgXQDM6I2zrMvDIekMBHqjHztXgOvnS17PjO5NFyFdvpMeSR6LKieyUiGj/SQRFg6oAg1oDJm7d
	bS5FMMvvTk4F3VGFXYOixzh00rJ257slOCsiYM9YiOOg4fpy4p2iZOvqnY21gNN55
X-Gm-Gg: ATEYQzxn4jqGEWnmsZXIzvJfPcUn4Cml9b9cJrpfVwjoHy40JwXck1pnhqK8FF8GiLY
	CbDWWPnY4C4XnzWR6SghcGPNR+Fz6yIeqP+FGdbIe/kaQGi5+AadJV5h7FDHAsWhng1MA/TlhTt
	+XIqpP0M2Xp8bKtpTvKaHyLidpQ/BWToIgtpy+uqqNFea611ykGi6W3rXp14QTxS+IgPK7xOaVB
	EAy+p2EUF6Q4WqFJS0hPJ/q68zGxVbLF3E+iGVC/RxDOxjHFaJicsmXljMxDB4hYj/RnHwquBvH
	viyG0YlvXDYS53jLJbanDof0gDmLUKIUGYQ+E5SDtiihVPNkeUQwbGaopnk277KEfMSG+fHlC6Z
	DGw0Uu+dgMSyt2ONP0AI563/iDyGuv4QeogzQhHW0Jn+/kiAWnhht
X-Received: by 2002:a05:622a:5c0b:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-50d6baaa2b5mr20483381cf.12.1775222892329;
        Fri, 03 Apr 2026 06:28:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0b:b0:50d:6baa:9e8c with SMTP id d75a77b69052e-50d6baaa2b5mr20482931cf.12.1775222891861;
        Fri, 03 Apr 2026 06:28:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e312csm22224685e9.7.2026.04.03.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:28:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:27:55 +0200
Subject: [PATCH 1/3] dt-bindings: pinctrl: describe the TLMM controller on
 Qualcomm Nord platforms
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-tlmm-v1-1-4864f400c700@oss.qualcomm.com>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10779;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GPisFIElRHMZPwAxr+SS9sz+OH93AgvPc0XFAexIBI8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8BkIi9zujPgr7QuZgR9W/yDBhdpJfF3ah5aU
 pwjTDjfHmGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/AZAAKCRAFnS7L/zaE
 w37jEAClf6v28pgISFrnyGjOyIqkDIRI/71BgH7O2/Z3wTjP5CqeFmyS3+iek5LN7UdUcqAYAJA
 LuhtSwpvCtR1HVeTxexduQ1yKQur2TThD2f63hy5eJbpxzs2ZjnlZwOg5j8B98eu6Kjou9wsZeH
 epz0JCI8z5DlyGysEW8JxCmzKfiiDq7E4QUtTwFJePjWfa3MBlnAsNzjsaTe8K0xkreN0w/SlB7
 X56H4kksKx4QVbzkcxJqrZqm6rDLNp0IJ7QTGkDIiy6fLqwkol8QmY20oMgXE9c9bl7ipDaNtrx
 xOIfOjQ2jVVZEjIQBO+lwVOtEbfobsKbHSZRXrXTMqIlxCA2ZtvrkTYroz0sci2CHRbYFYfQXkQ
 G3Xp1Qjz6xOp94QkrBrrRTd9g0WZCOfHGxfBhb2ukBZ+UzY6Qvd0zkX1yBpo/eZ0wnoODCC2cRD
 +JuXR0LYrIrNcVApsCbZFVD9wW8UujdCo3jD7H2NKVQ/NinAa2DBZJJsi5A7xcbOsqVF6+ELdj7
 N6MZ9yGpJzan2+PxU6XPaJq8Fw9ZBIyFwSJQdh6MzwdPyNtPrZ9qsfCBsk7e0b2w2RR0PI9+B4Y
 A/wt8+E4u+gmfcurlKQVQUX5PZSWpaAWdoxwqafOEqtNlPErZ+hA+mq89YpXoNah1Pyh2lVo/e+
 QfSFfIv3LEKbWZQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=U/WfzOru c=1 sm=1 tr=0 ts=69cfc06d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JO62WPm7RC265l9asukA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: oEPAk6SWOcOycrYUYh80kACinWGxVkWO
X-Proofpoint-ORIG-GUID: oEPAk6SWOcOycrYUYh80kACinWGxVkWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMCBTYWx0ZWRfX2v0BJNKJlg8+
 6GS77V7zVwwzVbByBqYMSn/BX6rNfkSI6HZRrM2DNvBaUOmbzpWDOBWaVijpx4eqAivXBwfWTOB
 TYh4WmUe39M3+1iOTJ0IAwMDLWB6IFR+pf10gf9trjgt74WMB8iA7+/pQ3au/DUXxAQjs7TqMME
 B8GdI/qxG3g0LduOyToYIRoIMweN8Q47akiPMKxqOwHUjVvbP/pmSx6V6mQ40eDAkc5lI1w9Zxo
 fdqc4KeghO/MGTtz68JEwjOOHFvEzBEmjX91+BXIeauVK41M59FM19RLJp0e+grf5lClqkdnj4Q
 YancTfeiQUr/661082Folye82jxG3720SLQEIV1HIcfDURGYLGG1aCUWEo6IabGD2K/YiSCJefq
 yY3dKeD24H59w0R2m6grZbN8YwoO3w2bRL5uhGgIO2QwtAIGVgSkVtFS8nQ5VNlt0v1Fafx5B7y
 gfcQHybxZKHpr0rJykA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030120
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34643-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,f100000:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBD7F394749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a DT binding document describing the TLMM pin controller available
on the Nord platforms from Qualcomm.

Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,nord-tlmm.yaml           | 206 +++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b1fdaa24a045469e3dec512ce0200f240daa1959
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -0,0 +1,206 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Nord TLMM block
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm Nord SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,nord-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 74
+
+  gpio-line-names:
+    maxItems: 180
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-nord-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-nord-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-nord-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180])$"
+            - enum: [ ufs_reset ]
+        minItems: 1
+        maxItems: 16
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+        enum: [ aoss_cti, atest_char0, atest_char1, atest_char2, atest_char3,
+                atest_char_start, atest_usb20, atest_usb21, aud_intfc0_clk,
+                aud_intfc0_data0, aud_intfc0_data1, aud_intfc0_data2,
+                aud_intfc0_data3, aud_intfc0_data4, aud_intfc0_data5,
+                aud_intfc0_data6, aud_intfc0_data7, aud_intfc0_ws,
+                aud_intfc10_clk, aud_intfc10_data0, aud_intfc10_data1,
+                aud_intfc10_ws, aud_intfc1_clk, aud_intfc1_data0,
+                aud_intfc1_data1, aud_intfc1_data2, aud_intfc1_data3,
+                aud_intfc1_data4, aud_intfc1_data5, aud_intfc1_data6,
+                aud_intfc1_data7, aud_intfc1_ws, aud_intfc2_clk,
+                aud_intfc2_data0, aud_intfc2_data1, aud_intfc2_data2,
+                aud_intfc2_data3, aud_intfc2_ws, aud_intfc3_clk,
+                aud_intfc3_data0, aud_intfc3_data1, aud_intfc3_ws,
+                aud_intfc4_clk, aud_intfc4_data0, aud_intfc4_data1,
+                aud_intfc4_ws, aud_intfc5_clk, aud_intfc5_data0,
+                aud_intfc5_data1, aud_intfc5_ws, aud_intfc6_clk,
+                aud_intfc6_data0, aud_intfc6_data1, aud_intfc6_ws,
+                aud_intfc7_clk, aud_intfc7_data0, aud_intfc7_data1,
+                aud_intfc7_ws, aud_intfc8_clk, aud_intfc8_data0,
+                aud_intfc8_data1, aud_intfc8_ws, aud_intfc9_clk,
+                aud_intfc9_data0, aud_intfc9_ws, aud_mclk0_mira,
+                aud_mclk0_mirb, aud_mclk1_mira, aud_mclk1_mirb,
+                aud_mclk2_mira, aud_mclk2_mirb, aud_refclk0, aud_refclk1,
+                bist_done, ccu_async_in0, ccu_async_in1, ccu_async_in2,
+                ccu_async_in3, ccu_async_in4, ccu_async_in5, ccu_i2c_scl0,
+                ccu_i2c_scl1, ccu_i2c_scl2, ccu_i2c_scl3, ccu_i2c_scl4,
+                ccu_i2c_scl5, ccu_i2c_scl6, ccu_i2c_scl7, ccu_i2c_scl8,
+                ccu_i2c_scl9, ccu_i2c_sda0, ccu_i2c_sda1, ccu_i2c_sda2,
+                ccu_i2c_sda3, ccu_i2c_sda4, ccu_i2c_sda5, ccu_i2c_sda6,
+                ccu_i2c_sda7, ccu_i2c_sda8, ccu_i2c_sda9, ccu_timer0,
+                ccu_timer1, ccu_timer10, ccu_timer11, ccu_timer12, ccu_timer13,
+                ccu_timer14, ccu_timer15, ccu_timer2, ccu_timer3, ccu_timer4,
+                ccu_timer5, ccu_timer6, ccu_timer7, ccu_timer8, ccu_timer9,
+                clink_debug, dbg_out, dbg_out_clk, ddr_bist_complete,
+                ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi0,
+                ddr_pxi1, ddr_pxi10, ddr_pxi11, ddr_pxi12, ddr_pxi13, ddr_pxi14,
+                ddr_pxi15, ddr_pxi2, ddr_pxi3, ddr_pxi4, ddr_pxi5, ddr_pxi6,
+                ddr_pxi7, ddr_pxi8, ddr_pxi9, dp_rx0, dp_rx00, dp_rx01,
+                dp_rx0_mute, dp_rx1, dp_rx10, dp_rx11, dp_rx1_mute, edp0_hot,
+                edp0_lcd, edp1_hot, edp1_lcd, edp2_hot, edp2_lcd, edp3_hot,
+                edp3_lcd, emac0_mcg0, emac0_mcg1, emac0_mcg2, emac0_mcg3,
+                emac0_mdc, emac0_mdio, emac0_ptp, emac1_mcg0, emac1_mcg1,
+                emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio, emac1_ptp,
+                gcc_gp1_clk, gcc_gp2_clk, gcc_gp3_clk, gcc_gp4_clk, gcc_gp5_clk,
+                gcc_gp6_clk, gcc_gp7_clk, gcc_gp8_clk, jitter_bist, lbist_pass,
+                mbist_pass, mdp0_vsync0_out, mdp0_vsync10_out, mdp0_vsync1_out,
+                mdp0_vsync2_out, mdp0_vsync3_out, mdp0_vsync4_out,
+                mdp0_vsync5_out, mdp0_vsync6_out, mdp0_vsync7_out,
+                mdp0_vsync8_out, mdp0_vsync9_out, mdp1_vsync0_out,
+                mdp1_vsync10_out, mdp1_vsync1_out, mdp1_vsync2_out,
+                mdp1_vsync3_out, mdp1_vsync4_out, mdp1_vsync5_out,
+                mdp1_vsync6_out, mdp1_vsync7_out, mdp1_vsync8_out,
+                mdp1_vsync9_out, mdp_vsync_e, mdp_vsync_p, mdp_vsync_s,
+                pcie0_clk_req_n, pcie1_clk_req_n, pcie2_clk_req_n,
+                pcie3_clk_req_n, phase_flag0, phase_flag1, phase_flag10,
+                phase_flag11, phase_flag12, phase_flag13, phase_flag14,
+                phase_flag15, phase_flag16, phase_flag17, phase_flag18,
+                phase_flag19, phase_flag2, phase_flag20, phase_flag21,
+                phase_flag22, phase_flag23, phase_flag24, phase_flag25,
+                phase_flag26, phase_flag27, phase_flag28, phase_flag29,
+                phase_flag3, phase_flag30, phase_flag31, phase_flag4,
+                phase_flag5, phase_flag6, phase_flag7, phase_flag8,
+                phase_flag9, pll_bist_sync, pll_clk_aux, prng_rosc0, prng_rosc1,
+                pwrbrk_i_n, qdss_cti, qdss_gpio, qdss_gpio0, qdss_gpio1,
+                qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13, qdss_gpio14,
+                qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4, qdss_gpio5,
+                qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9, qspi0, qspi1,
+                qspi2, qspi3, qspi_clk, qspi_cs0_n, qspi_cs1_n, qup0_se0_l0,
+                qup0_se0_l1, qup0_se0_l2, qup0_se0_l3, qup0_se1_l0, qup0_se1_l1,
+                qup0_se1_l2, qup0_se1_l3, qup0_se2_l0, qup0_se2_l1, qup0_se2_l2,
+                qup0_se2_l3, qup0_se3_l0, qup0_se3_l1, qup0_se3_l2, qup0_se3_l3,
+                qup0_se4_l0, qup0_se4_l1, qup0_se4_l2, qup0_se4_l3, qup0_se5_l0,
+                qup0_se5_l1, qup0_se5_l2, qup0_se5_l3, qup1_se0_l0, qup1_se0_l1,
+                qup1_se0_l2, qup1_se0_l3, qup1_se1_l0, qup1_se1_l1, qup1_se1_l2,
+                qup1_se1_l3, qup1_se2_l0, qup1_se2_l1, qup1_se2_l2, qup1_se2_l3,
+                qup1_se3_l0, qup1_se3_l1, qup1_se3_l2, qup1_se3_l3, qup1_se4_l0,
+                qup1_se4_l1, qup1_se4_l2, qup1_se4_l3, qup1_se5_l0, qup1_se5_l1,
+                qup1_se5_l2, qup1_se5_l3, qup1_se6_l0, qup1_se6_l1, qup1_se6_l2,
+                qup1_se6_l3, qup2_se0_l0, qup2_se0_l1, qup2_se0_l2, qup2_se0_l3,
+                qup2_se1_l0, qup2_se1_l1, qup2_se1_l2, qup2_se1_l3, qup2_se2_l0,
+                qup2_se2_l1, qup2_se2_l2, qup2_se2_l3, qup2_se2_l4, qup2_se3_l0,
+                qup2_se3_l1, qup2_se3_l2, qup2_se3_l3, qup2_se4_l0, qup2_se4_l1,
+                qup2_se4_l2, qup2_se4_l3, qup2_se4_l4, qup2_se4_l5, qup2_se4_l6,
+                qup2_se5_l0, qup2_se5_l1, qup2_se5_l2, qup2_se5_l3, qup2_se6_l0,
+                qup2_se6_l1, qup2_se6_l2, qup2_se6_l3, qup3_se0_l0_mira,
+                qup3_se0_l0_mirb, qup3_se0_l1_mira, qup3_se0_l1_mirb,
+                qup3_se0_l2, qup3_se0_l3, qup3_se0_l4, qup3_se0_l5, qup3_se0_l6,
+                sailss_ospi, sdc4_clk, sdc4_cmd, sdc4_data, smb_alert,
+                smb_alert_n, smb_clk, smb_dat, tb_trig_sdc4, tmess_prng0,
+                tmess_prng1, tsc_timer0, tsc_timer1, tsc_timer2, tsc_timer3,
+                tsc_timer4, tsc_timer5, tsc_timer6, tsc_timer7, tsc_timer8,
+                tsc_timer9, tsense_pwm1, tsense_pwm2, tsense_pwm3, tsense_pwm4,
+                tsense_pwm5, tsense_pwm6, tsense_pwm7, tsense_pwm8, usb0_hs,
+                usb0_phy_ps, usb1_hs, usb1_phy_ps, usb2_hs, usxgmii0_phy,
+                usxgmii1_phy, vsense_trigger_mirnat, wcn_sw, wcn_sw_ctrl]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,nord-tlmm";
+        reg = <0x0f100000 0xc0000>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 181>;
+        wakeup-parent = <&pdc>;
+
+        qup_uart15_default: qup-uart15-default-state {
+             tx-pins {
+                 pins = "gpio147";
+                 function = "qup2_se2_l2";
+                 drive-strength = <2>;
+                 bias-disable;
+            };
+
+            rx-pins {
+                pins = "gpio148";
+                function = "qup2_se2_l3";
+                drive-strength = <2>;
+                bias-disable;
+            };
+        };
+    };
+...

-- 
2.47.3


