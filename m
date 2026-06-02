Return-Path: <linux-gpio+bounces-37823-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CeNXDu72Hmq5agAAu9opvQ
	(envelope-from <linux-gpio+bounces-37823-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:29:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA862FC33
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 17:29:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m1GKEih7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RaCUKCOw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37823-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37823-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BC083073A15
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 15:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B995D3D5648;
	Tue,  2 Jun 2026 15:22:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300063EBF24
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 15:22:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413730; cv=none; b=BRxmkLQi/5NUWvISjVZpuEb7ZyV3KauQm5VI4AYubKlFcZcagt+XOr16PkMbrefZ35/7sd2qDE6XU5K0jEp6iMbLDlQ2KqRH6Vu7vXTe3bxuFIYJQ1ZWmCpsOIrHPbXRKJm2oxm0DNEM6ZzBlP5xKleMnMf94u4wOM/kbBIjyoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413730; c=relaxed/simple;
	bh=vfsXdZG8RK9SsniqXU+dBdSc0gHULBPKwykc8fgAMbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNIH5YiDjlMInqDyZSp3kO+Vtx4scPmMLNYj3rjFFytevd+ajJiiRrTAXhjAoUExgHoAr6FY5AgxxkxpwcG76Tx5BcqN37sS0ha8vZ2tZmldRr04fHUKansCl1a06QsqGtOQXKlnecW/KFHWy8ZCB5r26fSks3omWhXI39H2T4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1GKEih7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RaCUKCOw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CRYZV4012499
	for <linux-gpio@vger.kernel.org>; Tue, 2 Jun 2026 15:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IuvoyJtxM0mmeO0yKi2t4/9X1/idXd/7BoCaglXbIs=; b=m1GKEih7qejGmGtw
	Sy9sBND8U39/UdJJmEm47Ju5Aj6k6jMRqHW2gh4kz5D3RVYueq67wphb4gGQxntl
	VKqdH0O1bZ1Mc8dyJ+7jaB2Zd1ycKgQHTN6R0lFtyaaflfGJI/DjRc3Ejmj7JIue
	20tKl1dlbRAiJZIfZp+98cS/o+u3uiN/WwPaZFDmw0pkkpwvH7EV/DjTiSy9sfEX
	mXPKikrTMHKLmny8XlI+fYHV1axtYHT55NBx05pugbOJi+prm46sFpgaQIgsRZHG
	lwd7jm+le8UCkeCdohe6b3SdJUOZJqLC6R6+Xu1szmnif8iYZ/v/3d8XnIrj4WXg
	XzQvCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf4jadf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 15:22:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d982d932aso3526558a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Jun 2026 08:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780413728; x=1781018528; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IuvoyJtxM0mmeO0yKi2t4/9X1/idXd/7BoCaglXbIs=;
        b=RaCUKCOw9AGuymktr0kAz4Q7SpD1vRcVNxxvRpUa2PG4rgk8h1kD6d1oSl/TSk7WF2
         u4DW8iCVIJdbxXKlroEAH+vNixO30vM64hDgseOZq5g3lO0XdZ6jF/u22ZwY0mxVQGWQ
         PaYFs1JEPYC59aI/N9mMjLGfIe38TsDW1TyyKkt52SfF9xtBa7GKQVeg4dOb5fJC05yy
         Fc0lVob/RL4spvJ0fnd5vR0dXppETT22abr/pytAAC1AfeILFtTbCjZcHV0i0SXcwyCh
         Dk4DCIV9n6Za36r9n96UmtFwRhJ42ntlfsVgpOA+rflIfGuH373K81oOF1dn/l8vbM8J
         XMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413728; x=1781018528;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6IuvoyJtxM0mmeO0yKi2t4/9X1/idXd/7BoCaglXbIs=;
        b=BvgbDc4CQB4yVZO80JRi6a80Fw/XexeqLURieIBosWgxmcB4KAkdYMA1lcVKPkIK0u
         05WHA9VL6wj0e6v3+AGFM1/dyKfG9YJulbQiapU1P+c4u+T8cPa8FapZTvhMqG3Bi4Xq
         sxEHMLst/bFyTyP29zmKKJKEs4kfQS+xB56aU3aqVAo2SbRw7ER+vBkLzF8DXpygTX1T
         J/xB8PByopE+vvBiaOv9wV7cmGlEtSi3xJvnlsKlKD+e3yZIuJrLuqFJnmZpltSwwtGh
         DXMrq8geAJLlsO3i2YzYSH6PW/96KTWpE2OZ7l1WrfR4SQ9SaSkVeovtYHFbklk+qfXG
         eRkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+eAInbqjoJxi/lown2zde95Lzy+fnuJuaOVfTqVAo5x0W7FmB885S1eJd0AYNp/NpDfhOA72Zx4bj4@vger.kernel.org
X-Gm-Message-State: AOJu0YwsiJZ2xtYybmJZkfgC76J7CBFId3cm31w5biaVS6lZP6Ks9iLE
	llDJ2QqFhMmCs0Yr1jDOaXl/azXQl5qpVHzaI4NJe8aL5GRRTw//BsExeM9NIqE4DB9J0E9sN0d
	/Ay4q6Uoro0WFOIwIsLbAGNQIyeCeJwatpZrrFu0eHnlbR5svTgHAllXI99ubwU5Y
X-Gm-Gg: Acq92OEIBsvFt7xgO5/8F3mKvIvaVF9+YAMG5C8Ia9VL3I9Pjx/ZmxvxKoH4hkLkO1Y
	L7YI59CE5yLzHSQUNP4F5q3hEtNC3hG1AGzo3CxgQkdfrDpPaWUlx6LP76BC6zMFEsP3PEj30gA
	dC+YW4ajag5VnmiYcW2dd0WbWdd/PwDlLbUlkpHDbespGhmQRJvHchGOnsACqc+p8dEHNw19HNu
	1ew8QHqj7HtNef5enXToNZuI/JDR0D/QG9Aq/3y9+0t1Qhb3FHd5G5zLT9afDBKVAqN9LanBkTi
	0g2VlUA+sks9P2BkXouzz8UE2JkrRKWINd+11p9EYn3ydsY09dHeVM3dNO0WxfCaHh4RQdXDr7g
	LZ4BIhtTTviTEGslSQfriGh8l9Vmoe67tnSV/VmlZiKgoGQEu3GnH21N+
X-Received: by 2002:a17:903:1cc:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c0ab826cd6mr157598505ad.33.1780413727814;
        Tue, 02 Jun 2026 08:22:07 -0700 (PDT)
X-Received: by 2002:a17:903:1cc:b0:2c0:ab82:6ba7 with SMTP id d9443c01a7336-2c0ab826cd6mr157598215ad.33.1780413727363;
        Tue, 02 Jun 2026 08:22:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm135136465ad.15.2026.06.02.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 08:22:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 20:51:49 +0530
Subject: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
In-Reply-To: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE0OCBTYWx0ZWRfXw3yT5MuT2VS6
 5wHn+mxLSRlWEoLi6WAFCTyhnCeJrRQKDhpBd4iphUAUtbrROEBRLqxzrFtyLeF3TpG14imRgds
 SlbfdL1ohQEdfCJam8dXkKw+qnAJlZGkMA4KwtgKPdWpGAZ0QMxMROPPHOxWLER3gcXkhvp84Ok
 /vEJPMfBoYUfdbW2Fpeso6ZLUCSFyTYb4CU+zlvHgD5kZJ0Sc0qUBHDJ0Eefay26pjSRv7q+Ht0
 O7UFRHBYaPbSS5yTNe9tA0ZaMqLVoPbPdsuicrfWHMrL/TgQ+6plqOIsiljrgLhQ0HpwP190a++
 4FrnmdOofYpWU3S38D0ezq6WkOLHBTwIJURFMxKfaRw3eICix63qWPTElrFf7lZLUMpjDxz6CiS
 Xo9u/hRE3iO8JLk3DrnhfZoAHhF2DVJbsULNaP7JxsVTpSv3c6wk6yaHN4amCJDjt/4tnk+3VCF
 AftAGOyWoCvxWsRpv5w==
X-Proofpoint-GUID: 1uQF19ejlaB9lckK06arbVYAbuaeMNAW
X-Authority-Analysis: v=2.4 cv=AJZ7LEvz c=1 sm=1 tr=0 ts=6a1ef520 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=nhq6iwPr6d6TsRTX7tUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 1uQF19ejlaB9lckK06arbVYAbuaeMNAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020148
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37823-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,redhat.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:richardcochran@gmail.com,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:netdev@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,devicetree.org:url,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 98EA862FC33

Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
clock divider. The hardware generates a fractional output frequency
from a fixed input clock (typically TCXO4) using the relation
Fout = Fin * (M / N), with duty cycle controlled by a separate D
register. The clock output is routed over a gpio controlled pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c1688bb3d68d8d476a8d498aa2774606b8b26018
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  The Peripheral Web's PDM GP_MN clock divider receives an input clock
+  (TCXO4) with frequency Fin and generates an output clock with
+  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
+  and routed over a gpio pin.
+
+  The divider is configured using three registers:
+
+  - GP_MN_CLK_MDIV: holds the M value.
+  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
+  - GP_MN_CLK_DUTY: holds the D value.
+
+  For every N input clock cycles the GP_MN produces M output clock
+  cycles. D is the number of native clock cycles in which the GP_MN
+  output is low, counted over 2^13 native clock cycles.
+
+  Hardware constraints:
+
+    M <= 511
+    N <= 8191
+    N > 2 * M
+    M < D < (N - M)
+    M and N must be coprime (no common divisor)
+
+properties:
+  compatible:
+    const: qcom,clk-gp-mnd
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PDM XO4 source clock
+      - description: PDM AHB bus clock for register access
+
+  clock-names:
+    items:
+      - const: pdm_clk
+      - const: ahb_clk
+
+  '#clock-cells':
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+  pinctrl-0:
+    description: Pin configuration for the GP_MN output in the active state.
+
+  pinctrl-names:
+    items:
+      - const: active
+
+  assigned-clocks:
+    maxItems: 1
+    description: Parent clock phandle used to set the input frequency.
+
+  assigned-clock-rates:
+    maxItems: 1
+    description: |
+      Rate for the parent clock in Hz.
+      Supported rates: 19200000, 9600000, 6400000, 4800000.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - clock-output-names
+  - pinctrl-0
+  - pinctrl-names
+  - assigned-clocks
+  - assigned-clock-rates
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    gp_mn: clock-controller@88d3000 {
+        compatible = "qcom,clk-gp-mnd";
+        reg = <0x88d3000 0xc>;
+        clocks = <&gcc GCC_PDM_XO4_CLK>,
+                 <&gcc GCC_PDM_AHB_CLK>;
+        clock-names = "pdm_clk", "ahb_clk";
+        clock-output-names = "gp_mn_clk";
+        pinctrl-0 = <&gp_mn_pin_active>;
+        pinctrl-names = "active";
+        assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+        assigned-clock-rates = <4800000>;
+        #clock-cells = <0>;
+    };

-- 
2.34.1


