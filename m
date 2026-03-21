Return-Path: <linux-gpio+bounces-33972-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EQ0Hn+ivmmLVAMAu9opvQ
	(envelope-from <linux-gpio+bounces-33972-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:51:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C22E5A0F
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 14:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1E173025701
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Mar 2026 13:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF39F2F1FD7;
	Sat, 21 Mar 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwjM7TCF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cjl2Msz5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB15B2F3600
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101053; cv=none; b=GME6aRp8egkwmrTvvlKIuM8BRWczLduj4aeqvMg7MXx225ItLIiLOTLGdp/nVVKFl+9fH3sinDCqSlZtFsQ3C8FO79nGdxa6BYTkPEU5PQgQr3ycyJGCxPWw01zALPLQ8646/JTNzT7dYHnZwrWJuKFQ/oTw5Eo48lJyFBbNdRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101053; c=relaxed/simple;
	bh=uXQk1v0Ji/oDdHW3LImY3hB6r2koEUo5lgQw9ZjZLWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=St96ptfenULMphWRi7OylzvDWCfLaBwy8NwKezij4mz6tWu0kLBbj2wRMMyt8pUdLjby1VjexHUydOUhLX2+opzvEpMKLgPqh1GIXYPNaTJn0H2F+stJ0JEJ+AHjc7Q6kvi8X/T4udO1i3D7NZFmRk8fRA/YQH9pG4EEihl4GHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwjM7TCF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cjl2Msz5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LCtLYP3602665
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QAFmZUiivMO
	LtH63BICH0mfE5HC2uX+V+RTk+fQ9fv8=; b=IwjM7TCFlRPMjZOygjYv8mulyR3
	TYPjxhSE7QZeoX8lctFkVTTnq0/fcyXWNTXRe+I5UEYTbknLF2OMaKxO40U2pUtj
	uwZrqt+rrth8nIPaa1TBHM54Mhtc+tif37GeiSbfrHU2dwumHYw71AsWFwmfwTfx
	I+9mOC2ajv2v5NWUQJ9bAbJzXncnbEiFvp+V01pifDD1Bdo1ehowDO9u7/hQwIuQ
	Pees+UHni4V668i6T01kMJss5KDYkOYYUuXvr7Z97QLNrumRt/aDLf3Y1GY00PD+
	9LGDuub1ZCbRnLwtriBuRWunJHOMU3pW8uxTY4HJH0ADqTrB6PvM6Aw8TMA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng0udc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 13:50:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b04293b16cso67363375ad.3
        for <linux-gpio@vger.kernel.org>; Sat, 21 Mar 2026 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774101049; x=1774705849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAFmZUiivMOLtH63BICH0mfE5HC2uX+V+RTk+fQ9fv8=;
        b=Cjl2Msz5Upv9dj6QjkJBd6cSKXgdiJU1MldMWAgXg1AsfG1kcYl/fC1WNu9ksV0F8S
         BXoq+WzUSOX9XOCgc4gZHrDIXZAoW3XjRW+WaxHtu14t4Uc9sKeYHlsWofMRwfEyeRx0
         LRb4dIEZ4ceoLWO0ZfLnBdiNykU+UbOEp6pLj61fLy7OIdGRMUo6HI4wbvBPsmJn6Fl6
         m8l57o9ENOx2vnwKvutp7p6cgyL/dR68Y492m/oWL/jDIinULQ07qZoStw6jOIikpOQ8
         V/dLWPZiZuGxnZ3AIGAsvnYDEm+CvRY058DRAWWHmHMPJbnggN1sr/2qmNlzc4gq1us0
         KidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101049; x=1774705849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QAFmZUiivMOLtH63BICH0mfE5HC2uX+V+RTk+fQ9fv8=;
        b=TqmnSebIUpaUmkVmSOwiCmEiYh3XB4inWIiGLl5xmGV0MTmio4x/4jJU5PPz6axTPg
         iwSx3hvYrapRiiNVtq1zwQowDyj8+lEYU7KZDHQ1Mfb/LP7oX59HlXKCLWS6S64X4/p1
         LpuGxMnSHzABy0+TvtKOFsc0QXFmwRUNPJG+HkOqXV2YQgMMmM9WkTxWpOB4mfzR+VuY
         NKDmXfaBMNWoccVHzqjlKe5KoxG0Cpjd3lVC09WciyhrovlqpulvgwNzIWvruxTCffEX
         ux9GWU6xexAHZ5y09dOLelaIm45BQCWHAnpbEGGEi9Y/LnSRHtoXnAv3mQtf0NDdiRUV
         sBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzWIgz0mPqjJbvR6FjjqBkr8WQKyLV2BbffRDCq3UsNXpoN/+CHm1b22LEa/orEbYvOlXH+UuvDy/V@vger.kernel.org
X-Gm-Message-State: AOJu0YzjXN6kRHI6K6FHbxjXQ+5oSKrM1FIYUMsWcntAc7t9ranDuboe
	b5IB6x0ZeSpR2sn/Z68rq2EJkj/xFTuDfuLP3KjsNQMsWEykFWK9yq/ujJ3FkuMqWL20McolyPO
	IiCGA1mIv96BoggyUrLVhO74j0shmPURTGYXJRJK0JKS3mVN+F4EGj/WP7KD2fX8s
X-Gm-Gg: ATEYQzxBUpA5rFuYc1fXVLXEydQHVsU1PFOrebCTaoa6Fet28ioIIhUT8Z1Ysau/MZW
	V8NG5vOidwX6nfwtIvSrLZSc00Uf0hPYNvj1PSkqe2sRBBb+n9h5XeIJbSzCfcUC6E4wezTwOtc
	gMDhQXHa8E66pZFyn1Ab689y2Vy40S5u2yz/5p5KOYgrVqjSGCA532A1d2QkrMHptUybRnu+bkm
	c4nchKXyyl+f360McF33FiDoCsXJgrQMdjkjhkPPq55CUhDpr0v5+x7YKM7MS6Ub4n93JWMwQx8
	PRZpW2AfpmXFoXR1se4g2rgLp2tt208krU1KMJIML2QQtrN0ehmfH5sHE1oGkMYZjCVahpRXb1v
	tcbC6blN/NQB6CsrlOLAfgubNlnSVIcNVVyuKF/FJ2YUcxbPdIdtl6ZRU+w==
X-Received: by 2002:a17:902:dac7:b0:2ae:ceb0:d5f7 with SMTP id d9443c01a7336-2b0827ee664mr59256415ad.52.1774101049048;
        Sat, 21 Mar 2026 06:50:49 -0700 (PDT)
X-Received: by 2002:a17:902:dac7:b0:2ae:ceb0:d5f7 with SMTP id d9443c01a7336-2b0827ee664mr59256135ad.52.1774101048589;
        Sat, 21 Mar 2026 06:50:48 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm54897555ad.2.2026.03.21.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:50:48 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linusw@kernel.org, brgl@kernel.org, linux-can@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: can: mcp251xfd: add microchip,xstbyen property
Date: Sat, 21 Mar 2026 19:20:30 +0530
Message-Id: <20260321135031.3107408-2-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
References: <20260321135031.3107408-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sXSwULKP70BZ9Vs9iHkmPIH9ny2t4084
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69bea239 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MbkHCQl1Ze6FRj4IwLIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: sXSwULKP70BZ9Vs9iHkmPIH9ny2t4084
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDExNSBTYWx0ZWRfX74lHaHX9jBrP
 45AYjp53s2/VhSROhdVslJKkMYAO7uyXkJwe6uNP9JyJEuReuaKvxpkbPamvy6xnBtPV11OtEFd
 N5d02IadDrbbqykPlEbPcgipyMgxdSB6iwahllBDCDwOG56RqRU5cA/TXOMoEzc2oXPanQl2LEb
 +9P+0rN5CKcgukrzNq8ima68zc8ehpJv/qB2LihI4nBm/Mpa9IxhR7wj8ZPZ5EMwEHiJC0oqRIp
 ZGSomIGDYUTpzhw3qIXPiBMkJKlnh34kfn1kKnwLt84PX2BMhdRIrlTjkYcDsLrDbDATS9WMlH+
 n3poZxjuTCocHJBe6+fauzUsEH35o24wFNHjVLnIYkuGCUY75yJOgmx+4oQLHvIZonLh/4/Bh9l
 RPsbr24403fh47sNW4ZmmnM8zs63bX2swiK2DUS53mAT2Tup6cnKz/mb8QWBqdQ5Ub7X2sxMxp7
 WBxwFuSuUdK2EG75AsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210115
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33972-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B6C22E5A0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the boolean property 'microchip,xstbyen' to enable the dedicated
transceiver standby control function on the INT0/GPIO0/XSTBY pin of
the MCP251xFD family.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
v2 -> v3:

- No change.

v2 Link: https://lore.kernel.org/all/20260316131950.859748-2-viken.dadhaniya@oss.qualcomm.com/

v1 -> v2:

- Drop the gpio-hog approach as suggested by Dmitry.
- Add the microchip,xstbyen property to enable transceiver standby control.

v1 Link: https://lore.kernel.org/all/20260108125200.2803112-2-viken.dadhaniya@oss.qualcomm.com/
---
 .../devicetree/bindings/net/can/microchip,mcp251xfd.yaml  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
index 2d13638ebc6a..28e494262cd9 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/microchip,mcp251xfd.yaml
@@ -44,6 +44,14 @@ properties:
       signals a pending RX interrupt.
     maxItems: 1
 
+  microchip,xstbyen:
+    type: boolean
+    description:
+      If present, configure the INT0/GPIO0/XSTBY pin as transceiver standby
+      control. The pin is driven low when the controller is active and high
+      when it enters Sleep mode, allowing automatic standby control of an
+      external CAN transceiver connected to this pin.
+
   spi-max-frequency:
     description:
       Must be half or less of "clocks" frequency.
-- 
2.34.1


