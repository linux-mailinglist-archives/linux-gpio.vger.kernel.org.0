Return-Path: <linux-gpio+bounces-31630-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIASNeO0jWl96AAAu9opvQ
	(envelope-from <linux-gpio+bounces-31630-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 12:09:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373A12CDE6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 12:09:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CB833037C2C
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 11:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2334B2DC35A;
	Thu, 12 Feb 2026 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PeQkpJBG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJ3oMA51"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ABA344D89
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 11:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894560; cv=none; b=CKjh3+EUHB8zYYjS5W6ABTzbh7zqjYT4v7fmbQcZBRtmnOADwDW5W8Iasn8qisnfBWh5dVuI0oL950Ccl6nQpP0nLCQD1Kgwn/yoMn1F++LAp79djFZznLKPi1skWW/ifwiacCoFjShalnlcfcCPHQqDaTfQ64yn9sUXW7k7Aik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894560; c=relaxed/simple;
	bh=lpmL47WC8+jBv9Ak7qxcbTyEmzUlSRaQE8xlvfXo9Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAI2urhhXwUkaxVe0xn2x+y7hjXV+9fpM40m76W2Nm4KyG6DwY+vlw26uTdpdGizVAb7OPwXO56DjiCfFMgjda0ntJ6OZCPEpJWaAWlMzUjN5/hjdPjLeHRatK57Y93po6UuMItsEtJtrN7aNnzmTu0CV6ZFq2V1PL7Bd7aZ08U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PeQkpJBG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJ3oMA51; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CAOxRH3963739
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 11:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lhyQqMMavHv/UjL4sPNstTEkfpEibtFU8cb
	g4lFko1U=; b=PeQkpJBGg8izwJT1kbkYOyiPuDRkYR13Ix6BehNFl8RLy/yxz/3
	7OgHwIPTcem5/NhWTFAqSwQ9nl1l5hOusn800hRTIV1glpuHOzflmfwbKhe1Sefj
	k8QvkXJQ0HDyf+NjUedWLODdTeS0simYi+GCtdkyTDRLHwjoZVPsg8sxW9BqpeFO
	hn+acD54nwOLZgQ5j2vXYqG+D17BMXFv5UlIShfuFXB9PcZq7OmUYosn9PzLW7ZQ
	RklUQI9TSbwolsxaYF92NpHNOTu7yQndxTJTBpg1PvT5Ew9taYNO7hOgJOhM3x5L
	V4G25tnp7IGf3P8NI8jtk74RZVRrfd2YNvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y8ntqym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 11:09:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b6b37d8so25782385a.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Feb 2026 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770894558; x=1771499358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lhyQqMMavHv/UjL4sPNstTEkfpEibtFU8cbg4lFko1U=;
        b=AJ3oMA51ylJsjYgDPY/+nTzt94QKzJCkFbU0gkG0hBHh1IS/eurfh6YzqLeNOsdcfC
         bjIBjsluaqOPw1V6nVFpgR7U4bOUJx8Qk3c07wVtMr3VWwpDv/unKq2rSCHP1r7kTpwi
         rh0DaqI+vSCkZqOdUiQebuHQ+VcUMZxog2DkX3ydc4zVWTaOdxsj6zbwXv6ncOmVzneg
         CGDEbXR2FDr5IUhTjvzVNtR2sBA2u7POxd5T8ZLL4IRt9U9un6vTy2nv8dScR90vNPHu
         XSeYcgQOYqRCvygDmeXuP7abDFAv5ZPVyTwLRDjAGTVyKVEs41aVDylSNvL2tKIdvjd5
         DHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770894558; x=1771499358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhyQqMMavHv/UjL4sPNstTEkfpEibtFU8cbg4lFko1U=;
        b=Yu3w8OFdBno2KW4tQyRxKMHjf1T9T4oEl1bIjH01B2UGu22bXdxVcBEVpeeNveBEmt
         UhESFT6hmKXhVpMDiqSvw7E+fU7VA8/rWbQL1tTWu1Kcgvl33bdOXQTwgnEU2HvyGNSK
         lWx01ildlcJ6DB85z/OzJHMXYL+nDWLbfvEn/CZFktuPnCSL477UeYdkkzpV6fUvNaZN
         dXhyBoRV3i4qo0mGbhYoPdaU54s2B18SExX/89toQSuCqtqCt8DJ+MVKJJNmjWlEjfD5
         s6enX0ktcNIuRh9cmrPmw80QbbAMTS4ru/e2ePxFmB4vB1PnbbVAABb0nNPk9whnn2GT
         z6uA==
X-Forwarded-Encrypted: i=1; AJvYcCXX05RaUNwGqngFg1GIfId3GRMA6L8siIJxdE1ulWxOaizBG58X0BzNCb4gbsumqfy9WT0Yb/jwJA2b@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlLWaFLMaIBpE7UO/kq/jH/jdgpEZJstTLWQZHZutyCVqIPdH
	FL1YnDzhUiyNfIPq4HlovBTZOCICVJCPGPPfiBBlNR2YDPpF4zTiSvDOfzEL2lAJC7ctkh1Q14I
	6hNbIIJXdK8XmJD5yOGJ3inypLhfXKsEIWNTCEyTirW+L3Wfu2qMhzkd07+bH2ugRmoxP7FxJKf
	4=
X-Gm-Gg: AZuq6aKRs4POWi2Fz1Ri6IW/XiD16z6IaI3hLefVbtEgfLUgiEQnugeQ2vRZxoKqExV
	pmMuj2Lk4qZSVgmFsYjpfVmMzmGT5I4ECYbkGT6x8jQjmXsu4wbocJaeMbfKJmZzb7jfDIAndRH
	nPaWC+k0L3xv+uLdRCbtp+cWaAD8394y/FYaYHhS3GdsGjl56GtN4nMTsuhLoNDJw823jJR94o1
	ksAqagVl91jB4vtg1uSCyZAEXgUxgPqYQ8S39NdVgn8OewdYOWsNMrXdbgy1JbQy+STJ4IS6IWQ
	g2RVQLSOiWepQ5N88O0eBYIAIFokFZyHUltm6BxBWNVIaP/CtCXsMl33/EWJYdtzCVk46pbDrQr
	ImswVX6PF1NDqQuXFm4m/HcD5U98Uo3Vb8LvUsg==
X-Received: by 2002:a05:620a:488e:b0:8c6:e225:2671 with SMTP id af79cd13be357-8cb33139e9dmr295250485a.48.1770894557725;
        Thu, 12 Feb 2026 03:09:17 -0800 (PST)
X-Received: by 2002:a05:620a:488e:b0:8c6:e225:2671 with SMTP id af79cd13be357-8cb33139e9dmr295247885a.48.1770894557330;
        Thu, 12 Feb 2026 03:09:17 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d78cfsm269091665e9.1.2026.02.12.03.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 03:09:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: gpio: gpio-delay: Use Alexander's email
Date: Thu, 12 Feb 2026 12:09:06 +0100
Message-ID: <20260212110905.52842-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=lpmL47WC8+jBv9Ak7qxcbTyEmzUlSRaQE8xlvfXo9Zo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpjbTR6bgOdJXpeiR3hVB+YBEBLu3y5YaxahTD2
 PPBmvjuRpqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaY200QAKCRDBN2bmhouD
 1/wED/9JtwjVcZd+/ARzDwsRs+S5pQ+zAspuJGI0wGvRsqPaACZ0q/1Q2GMCFfq262lv2M5ND6P
 IZiJd4BMn0MEq6m48R0SbHT6Ind5H4zbjeUz4SvUWdyQdJJj0JJoEwSUftN9IjbceirCwg5qivS
 +WFPqRbAo6NV4+p1zg3mNH2BAZ/45prBjajh7TPixQdocIw0E6G0q2YTQ78vkIGdJJXP2PNJ2Ie
 /Zea4jyv9HLL7UIdjQISXIxHKl38BTo26ua01EScmpBXdjXhAj8SMwp8VJu635tomY7NwxbYexF
 Fgp0PfAJcSwH8GZDFsWtFtUy2/1P01zvC13yTNYZleiKjOv75Sb4OhFkwo7qbAAJ4+dwOXP9zbx
 XPYtrZrWdCC3+sOXnhshOfsICd6fRhcOJKrRrrEqvCGjCN1FfPPIKV5yqQXBGQFcFwYlnnjOUVS
 Dk2xf6u4cpCWD71/ZTRNiF/2LapEYf/bE8qSbQuXmSa8QbIlad99e5Q8FcBaHMWqoAo/4SfCclF
 O+xgFrJBtCTgAj5RcAbQhXrGm8FYMW/xBJ6F84Wuih93mrSMtynDJGReucSkKmmOsS5a+KDnIYS
 SXTrOzMJbWwp9zFqUCQqQD6mls7ex+awHCwLB6IHAR7zP5rLVcIwi0FyGpK8aBR7vm+sbDjR/BB ao3PJSGifo7OcRQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4MyBTYWx0ZWRfX/zrOP+AmCaGw
 Od/iaA0it67XLYtBEjGWXxouNEOgiYPH83uZr0G4ccK9cMRBxgJSGAvT1gDb87hNEcAzryNrkw9
 sgFyIh8DTujEWeN+ZYfIqw56nLMB4RA7soUwZVhXMEdHuDv26fwJwXSzKOVM25y7ix8GfaQiQKq
 RtBzVqsjTsCsZ6uV5kh9SFh6MIuOpunvpwiZ7kPsZmS2T3F028/xXe0wmtSGJSaOTazDLg8oi/E
 MxhF5QjfIox4JeTcvwSS4JDdCmLwa6KAXyY0MkECMcHWJr973EqNuxed+3eity6MtG9Ex6T9Mnh
 iBwqvT4C9fOALYZOcluJh0XmZH9R2YxL6iR/40zHELN9U1RLadTAgtaI6nZhy6QKEif/qxoydyd
 knwJEr0bjVw/iwtbTgap2cqYPhhLk40ssBruRrwrE/lGquGxjdvzLfMrRkLGztMwy0RysO2BmXJ
 QOVMs/BVwbly1Ee4+5w==
X-Authority-Analysis: v=2.4 cv=VNvQXtPX c=1 sm=1 tr=0 ts=698db4de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=8f9FM25-AAAA:8 a=MtJbINxUkvSn3TFoTc4A:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=sptkURWiP4Gy88Gu7hUp:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: TzrErHZk6dCAfMMTiQs1dedfq4Vk34IG
X-Proofpoint-ORIG-GUID: TzrErHZk6dCAfMMTiQs1dedfq4Vk34IG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31630-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5373A12CDE6
X-Rspamd-Action: no action

Group/anonymous mailboxes are not accepted for bindings maintainers, so
switch from such linux @TQ mailbox to Alexander's email.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/gpio/gpio-delay.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
index 1cebc4058e27..b99ceff6c5f6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: GPIO delay controller
 
 maintainers:
-  - Alexander Stein <linux@ew.tq-group.com>
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
 
 description: |
   This binding describes an electrical setup where setting an GPIO output
-- 
2.51.0


