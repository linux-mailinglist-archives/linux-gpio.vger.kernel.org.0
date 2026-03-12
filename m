Return-Path: <linux-gpio+bounces-33269-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJJVJTnksmkcQwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33269-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:05:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9510E275295
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7C07B3006094
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C97D3F23B5;
	Thu, 12 Mar 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqu2glHY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFRlib9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A739D3F65EE
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773331016; cv=none; b=Ohl4RN//yp9VNSRS04Bz+n7PduUJg9cdNyk+Dun8fggkMslyJ2tSoW/9JCLx96Ksqs9ls0iG44V2Ee4SnriPtxhdxIip1GyZbClQ5QErNACSH4T6zOw4u2gdXBd2uraDWCsI8obpVSnahNPO5xtjPpbRMA/jjLY/qOTe3irCzVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773331016; c=relaxed/simple;
	bh=QOSYTgCaUcMKAsSL/8j8RieU+DwqZrAkCE8Aj7ml/hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ekpjd200cgVAhVrpaXN+kj71KOsMZ15+lCK6uXi3PUSpU+hi2Xwf0WsAxBRBPjJ8VHKnf+nZOxZn4tGWsF6z04xFGRxH6cbWKnxW1S57u7i+TIhD0n/Rrn6fa8gYR5RQN56nrcT9Fy7o6fSH/Ckgw7lYYihmTQx6S/nwV7SqgjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqu2glHY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFRlib9f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9Lb9S4132592
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	532KCWBD+lQ65ANLZbE3X+kGTv2qa2uYgZCfupjZ2zw=; b=hqu2glHYf04RA5mr
	U2UFJH2xE7nnBbfTW7K0ICNYAoA8Md9uiqmD3lblHVF/pcQMOnD5WSktesmZ30VM
	r5abLt9fD+zkiFE84llwfB4I99egRJx22Bov48iPvbklKfrqGQ7xUgHeQUkQD1Eo
	Lq2Z/C/kizbGYbsLaLJ3F0iNNbGAWHjIMAtUHYrZRGzznpUa/ryZC5kffalkbJxr
	QQ2NCg+LnOAeljixDXmBXV4z9J25cS/OGOTtZ4amDC8iSD621Yv9Wu1cQJo6NCju
	V6dblkN/QjzeyLwCU6gK4LG0S6/UvZDlhzuJ9m3r/jyYQ4Jdvcy+oifgNx1tvas7
	b1YZnw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w2nqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 15:56:53 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a11aeee8cso207718b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2026 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773331013; x=1773935813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=532KCWBD+lQ65ANLZbE3X+kGTv2qa2uYgZCfupjZ2zw=;
        b=KFRlib9fQ839BdVh8rVwqvU+4zN9Ku37db0F9Oq7VVpEnJIidgSJI8eq5HRCduCN82
         +vO2l43045lR7CagZSKQaLBS4U3CSi9X/mDUoWiyfPNv3JVSH+YgBUUA/TnacraHlMGu
         D8wqrvJOQahZbI23/cCIhoJ9oppKcTY7BO1FLiKPxMZjR2JWdD+WnmKvOEpBUeyhmnXO
         wrcRfwexbcTcSww4d/d6QQiPn/NMMZ42UAaCsa14h7aAd/PDwmy2fuFqmv8hT6rDGLvw
         XNZxI6MAKdndrz0QCMuLOZ8Ribv7PoWWyw1OIv+NxpglXhmQP2FD3WEinPvuHShUgWwS
         DUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773331013; x=1773935813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=532KCWBD+lQ65ANLZbE3X+kGTv2qa2uYgZCfupjZ2zw=;
        b=NoxBVTjzph7LbbotbcWrgY/1xT59X50iY/QujiXVDNca7jk6ZMDfLI+mC15rlpK5rl
         O6Vjuz1gAa3Z8uTZD8yO2HFKQ/qR5uQmr0Pt+p3OIu/lWzrAJx9DGp9tRXNQGcAIk9bA
         OQT8D2fBo056hU0Xp8wMDoPBwMTzKB8Ltb1fXB7nigc1d2FSUM9cOO0uTiDd3hvL1Qmg
         aisTw0kl7si4254/t1JYAk4ueD0P1LSpfrhNKTaynPyIQmxbRnBE8QciBiO44Ks3LgD1
         X3WDpvOsRoUoMfNqIxoMHYCbgkoLFdk78kRdXhX3WDdi3H1TmGduyncObaimdpf45FmM
         Wynw==
X-Forwarded-Encrypted: i=1; AJvYcCW/rAhJunjzGLyPIA6TI3ATAsiXsWtzSrLJCvTgQT681CgAHb8KNgFvyH9jP2X6Gi6uF6dAKzqPBcg7@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZPEBSXb4e6t5HOkymaZJfF37FZ6iHddbIYMZZhwqdpevNsCe
	UHm9ShnZInWyudHgi98Iur510M6k+Ptu5XBq9oZMpEvE18Tb9wgNvHrDUClBktG6Gg91U8x3SrM
	At6WsJ0pgFhtb+p2M0+EEAL0vyQpQ/6Jrx9yW5k5qeSLWo1MkH5pCQqq39HSGy8h/
X-Gm-Gg: ATEYQzynCZZxm+642u0+AzLRg8RS+7ofxziij9xQawaBMWNxyhUyWglBRFJrOnCcXYu
	Ou5Zi9ljQ7aNRO0G7NrgxrBnbOuaNHkGdoHHmeqh0NRPU2RINh8v451zZm9xuDJvOgOx6x5Knre
	EtQTQihDm+weukFuqeVV5DuzalnKZetAx0fdK9+nbs7qZB7EPm0sZuI1dcH7nBwDD8qT6usZGfh
	netjgXptD+aBlYLg1TzZcgpSmG8duFlddcSrzFQggizkNjriiGu4poQi0m+SdmdHcAY4cJjHr/0
	e4NRwaAtvGBYz9otkO8Hfkx0/XPF/S6u9GllnnWHaGBaRNeOBRCm5rN1pyp/5ydW42AxnT4MTF1
	b+GBxvHjLqwxS0q153pka7W7L0Ul+yf8UHOsGh2T+49NicGYeHQ==
X-Received: by 2002:a05:6a20:7345:b0:398:8dbb:d2b with SMTP id adf61e73a8af0-398c613774emr6285889637.58.1773331013188;
        Thu, 12 Mar 2026 08:56:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:7345:b0:398:8dbb:d2b with SMTP id adf61e73a8af0-398c613774emr6285859637.58.1773331012653;
        Thu, 12 Mar 2026 08:56:52 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf254acsm6067852a12.11.2026.03.12.08.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:56:52 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 21:26:36 +0530
Subject: [PATCH 2/5] dt-bindings: interrupt-controller: qcom,pdc: Document
 reg and QMP
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hamoa_pdc-v1-2-760c8593ce50@oss.qualcomm.com>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
In-Reply-To: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773331000; l=1350;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=QOSYTgCaUcMKAsSL/8j8RieU+DwqZrAkCE8Aj7ml/hE=;
 b=vpMHwGtb+th0Tp8dNLcy9+dpWI7h4sgUaLhyFiP3eXoPG1Bjk/hZpF6GwjeiB8dNOXp8PpvYI
 Psv4dPIRU4NCujY4h8JilSKBMXyf9TNk+hbWBS4VdI3i3b4sbvZklYa
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: QpQHnF2sKH3vyMW952zsRwU8SeBXiboM
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b2e245 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=w7jjODl3O23ZzICBv2cA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: QpQHnF2sKH3vyMW952zsRwU8SeBXiboM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyOCBTYWx0ZWRfXz+HxNFv1P4yo
 N5sJ08FzZ/F4Iz4TBzVvLzsXU39Rw6b0rZovy0RhfgC0XzdGhu5Xd8ionvZZx2D69yImwQG9v7a
 gg07Cxpy5+tBxNZelRQ96T1zJmMyR+BQYU+9cV1zPIA/zgDn7P0s8haPKk5rIqOgXUN2k0TB5pC
 qfa/xgotITOw1P8k2l7qjS7j8UgJOxN3bkJNkiMaru9SL1Gxby1cMQY3vfmdrM2Ws4R95ZScUNG
 IIl4f2eB34TMIXJhwewGc5l1lB6Nuajwsi7edpCAXhFKPZhx/A/DNLGZJ0wFtqaSXh1OGG1Q1zU
 YHbh+8/vQobqd96RyLq2D5U7nkcNESNHKuvMyAB1aCGiwuJwB+e1nxXxI2O3iGSuQs8KnNP3jSA
 QH6Fu8Fn0mMctrRTcTbu9qhfQTiRAbZNQCwLocS5p8nvRA4yyk5uk8BLv9ePifU9KW5KLRbUUyk
 EPwamBvlC7rkZ6Txigg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-33269-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9510E275295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document PDC reg to configure pass through or secondary controller mode
for GPIO IRQs.
Document QMP handle for action concerning global resources.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 5ad68b2c6fc630fb4044c7224e6791d3bf4c2937..00eb9b28170c29c811c17b1f02f1f4f14779752f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -62,6 +62,7 @@ properties:
     items:
       - description: PDC base register region
       - description: Edge or Level config register for SPI interrupts
+      - description: PDC config for pass through or secondary IRQ mode for GPIOs
 
   '#interrupt-cells':
     const: 2
@@ -82,6 +83,10 @@ properties:
       The tuples indicates the valid mapping of valid PDC ports
       and their hwirq mapping.
 
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
 required:
   - compatible
   - reg

-- 
2.34.1


