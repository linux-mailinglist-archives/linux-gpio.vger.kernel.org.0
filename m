Return-Path: <linux-gpio+bounces-38328-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F7naCZyXKmqstAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38328-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:10:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AC6712DC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 13:10:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=X2cMN7hK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Y/KtdwfL";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38328-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38328-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DAD632F590D
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2273DCD8E;
	Thu, 11 Jun 2026 11:07:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1939B3DBD7A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:07:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176039; cv=none; b=NxmRxfxOxGAM6Ao1Rx1gEnKyco5wHlIZuCUX/cYaunr0O/lFaJ+wklGAMINhXdI//yM3thwXzwtBMBFTVPB/TbGWO+8Hdij4gud8CI5zDY9CZTD3mF1lM+R3MMRwvq9nIwWzA1tDtcxH20TK/OwJ0GNv8NOwzVL3xlLrlfO6hFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176039; c=relaxed/simple;
	bh=ARLjwJgApzTkrcroRk9dcgpN0egJBD6E5kLjVaxLPFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obs5l7mnq7DXegB/xiInB/AGfSP6LxAgZU3kynlo4dEu8ll8EmWQcOk/3abWV2XQVFuNia4YINQkd41ZKtwxHWZdrFkidzkNR43CRxAZmYH1UyGsP6DAkfDk++PCre2uaoJf+f40N2lAlZBKuWoZdXdNdBaiseRgJWxKSfPYKEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2cMN7hK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/KtdwfL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BA10uU299643
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kQTGZ1s5mAqlsYyB5U6ZEWJC+uc5J6VJYtO
	Jm8qQBWY=; b=X2cMN7hKRwmRhqDwelHBzcz7f3obeK9U2YilPd6PSg8LYLGdMMU
	hYOKaNzsmGRBG4eNaYVCI1H4MLgck13/En/NdZVmzrS4XJnmfhtzgi9AcU18JorT
	orDXcTYJJdf5kO28Zb4N//4ulySWYqcvlksJ4C7eDAbz4urNUkTQk1xH5fwzv4m9
	WrqIyvewTTTCnb1uA5sKErixboJaqtBkqeNvJKvHBkGQlU649KCjuARXsNHkttSY
	0dlTAaaO+WL2Rd0MviKcHVAtQsuyL/W0RRy6pd01aaZlv9Hc1cOvIxkj6VNfnRfp
	7pOPxk/dbs2ZKgTIgL5gQbS/+h+m488GYog==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe70320j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 11:07:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963d24c3886so6223299241.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 04:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781176036; x=1781780836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQTGZ1s5mAqlsYyB5U6ZEWJC+uc5J6VJYtOJm8qQBWY=;
        b=Y/KtdwfLE5X0rsgo3EvWHDJ4iM3T1z5KxrIfU42smkitAjfM5IV3nu8dHzWCioNGkR
         Xkks4iqZfZg1x0QqAGdeBjBUtxZkBxb/MPoarmaWcqFysG3nx/Cb5RL1jUdK5lN6mplN
         vg7rIWirKshIM+Fz6yZdJeDNrAeIzBsXLI84kbGQbmfaMj8o9KaSZh+SgsctChldOXDz
         7voR8rPL5uyESjJ6OFphuU7vWMvlVillc/955o0P4BxD3ny225OTEuPlw5WaCDC9nHGp
         s0k820HYdYAb3gELRWlRjKm9MsS543cV7A3AmXq0WVhrHb0JOfniFk4mcV/0hPsCxIQE
         L6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176036; x=1781780836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQTGZ1s5mAqlsYyB5U6ZEWJC+uc5J6VJYtOJm8qQBWY=;
        b=LNT4IgYZQGXjjstyxgZnU0k3EhvkcESTKNrA09zc02a9l7N+kZpJ/CHiBpEeEXDvo9
         NUYEUIsZP7RCvU6soFGlBmLhD1AZETHRJ3BQ3dl9VUlfcES7tjNYQqM7G3AWmr/Hhou0
         ZhIxq6EDK4ghC8TX2pV3LW4REzWh6r3xHa0FvtzL1UQxtX0I1559chDR16eEz+AxvLsk
         sr0XRFOdVSxhYW4cRnZqxrZX6v2Ws5D1cGhUAwX3CzXhPysWLAzV+z9t6iXpeWc6dGA7
         OgE2bsuP2gbSSC+1T46VaX3PKUUaM0XvAh9VWfxH28rlRS358jmAHBcSKUpEBeyGaPJ8
         TyIw==
X-Forwarded-Encrypted: i=1; AFNElJ/MYbG/s3PW6d5BBlQvHpbH73WLcfEDx4V68aek55ynCZomfd/vXDgsruTayF0e6/7d/d/XWC/bMdhb@vger.kernel.org
X-Gm-Message-State: AOJu0YxppGzPNr3z4JMULaeMDSJBLEsTZnM+Z3dvPXwg62mb5hrKATe3
	D55jqK7d4J4xAtXB5h2bWAJbladH8wc5rsYYgnpLBUa6mG8l+CrGcd2dXKmDloJ+V/F6/7eRh1k
	41N6xiq5yso6mCd/UUZuWbFacMqWj6PcvdMVVFADuOgadNck6QeS7TXPfHpPtRsgc
X-Gm-Gg: Acq92OE4rVszRAma6sS/+iMe/jAq6GqFSByUlvL+wkrdsj8FpqImaumgZz+/cUZA6Lt
	Sp/vDeF+zpSgIsdsdbPyUCnSPulrTAzxzD9PatpT+ufJCBUxmIloXUZh0SnC138ZN70YW1SIkd5
	Um43enkvnVA34h1ue6Ginyq9y9QpSuhoIB1hjNXP9fmtYZwnrt/5zCbRRl3TzyN3Ea4I1iZbtPc
	wFcjvtpnj1lyJOEU5aCKGfKjp/uOoOQ3epeMJcvrO50jnxYNa6qoEwzDiMfz0V0FhX01ecGu5ml
	XHXGGwFOee3kUnZRQTe+DXTZhslGqyPQ33owA6T3Mv33WXP/KvxJcA59J3220laDoPD6ApEBdfp
	7Fga1/dqT/IyFGkxef+JSLvqASOT98Epv4u/qNdwlMOLVaETU
X-Received: by 2002:a05:6102:5112:b0:633:d7ec:153e with SMTP id ada2fe7eead31-71d5c2715bdmr783702137.28.1781176036252;
        Thu, 11 Jun 2026 04:07:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5112:b0:633:d7ec:153e with SMTP id ada2fe7eead31-71d5c2715bdmr783680137.28.1781176035827;
        Thu, 11 Jun 2026 04:07:15 -0700 (PDT)
Received: from quoll ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda363bsm67981125f8f.31.2026.06.11.04.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:07:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: pinctrl: qcom,pmic-gpio: Add Qualcomm PMK7750
Date: Thu, 11 Jun 2026 13:07:09 +0200
Message-ID: <20260611110708.69234-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5784; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ARLjwJgApzTkrcroRk9dcgpN0egJBD6E5kLjVaxLPFU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKpbcnA0AqFJx+QLyAHylek/lzi9io8jYEiwvU
 VMGTe5hktCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaiqW3AAKCRDBN2bmhouD
 1+CiD/0Zq/HQVz4zuW7AtYLiN81z5omYFZDAeoiLHkdE4b6WqcpxHw9zbA8pkVqlYczNpYf7UyC
 YU+kuca6mCN6T5qT7nt2D6BCu0AhkNieX7jGfTa3kCO4AWPacSBeUNKQLcbRdyAaeLTmc+Km4Qt
 gvyUhTb3dEeO6HU1N1evcQPg1EVA730NMefr6jyhOsFatHU3VreoZ3ZNXeLvLZZIDBL0KWV4lHZ
 shpF2G0wW6eggcw10a+i982RdQJ+IO8MI8RaEd1/XPv7opLfXy7odx7JfHEehSX6dwVpkrsUeO2
 wnRXB8oTlq/sNh0CLRSIXjWRm6OkeFe6cnBPnj5YPo22nNouWSUepyi/KeNantH55LD9oxsbXXH
 ky2aTKBgCraOg6MHLKXCCASyd+r/z3gDWjg2eswL3E2kTzUGbRzlkPqVYsf3TlufhnhpKo9RocU
 H6ts84xJqmGlkyb8Wf7s1REJysBd1/FZYifE2vjmKY+zpE1nGcsX60cEg6jih/r/Mxud/FNgHu2
 PjAn3IO6Qn89CHDSU7vH5nwLqqJcpK5JD1nsKczJNJ6t84U6qobSumfykdkEAoo8NR05AyqQPPp
 dIP81/ouAEnEsPxCJ45pQ+rwfsmo9MxoBYkTcwFRXqnTRBHha4mhinqN7jZwLGk2WGzKS0PxlkH 2d07uEVSq7l6c9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fWi07Z4izCxFYPRSiUjiVfx2628XMviB
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2a96e5 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Bpo9OX9RG45pMRazLfIA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX9H8WH97MC6pO
 aFSrd7XNlVAFT2v718tqoobz11md+LkG+fnVyToGJ41Eu68NRYWeiPLsmwDtvUB824oiZ6TYviS
 1UWBntt0/egY/UN91XkYIdyiBYWqZDVvUCvV8rlHb40FYDSOLFiGJTLFTq7wi1VLxWeLoir5DCE
 aP+99/GyBsKxWr06m81/CffIGfnn00NtnbpRMopBh40zTWTIm5FLoR/4YWORHJWy3bKpAB9GyHS
 YFHRIfBTHndIBnNapz64LHTNdM/UitUDID07E6xBIe9jwTqM7dN9zoYpQViGwuTtEk1pCE8YazC
 zXb/kM90l6+PBLAQSVArdLVJ3O0QcJ2PPyCY61YQPnBC96vrBdCR4rk1qFdVf4Y/FI6OhfH5ttd
 sx+EFTR+OSZwpr81iNYi0CeEQnZ0ctYsUPDnq/n0XTRiH+/DMj0Tnf6vJFgQJ+l1MczalVkUcd1
 HJ+fPjaFmkUJQx7iTWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX6esUFze5+wuB
 p9ogg8/HMKB/gZcmWMmUGIzhp+w3ckL4ohaf6qojdqQZyakFJ5q5nSUdlmI60t85+cT4y+Onz9u
 3izem8F1aHDHgLT6FZLqqPVrBw7w74Y=
X-Proofpoint-ORIG-GUID: fWi07Z4izCxFYPRSiUjiVfx2628XMviB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38328-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A9AC6712DC

Document Qualcomm PMK7750 GPIO used with Eliza SoC.  PMIC is almost the
same as PMK8550, thus compatible with it.

Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add fallback compatible.
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml      | 152 +++++++++---------
 1 file changed, 79 insertions(+), 73 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 386c31e9c52b..f656c836896f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -15,79 +15,85 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,pm2250-gpio
-          - qcom,pm660-gpio
-          - qcom,pm660l-gpio
-          - qcom,pm6125-gpio
-          - qcom,pm6150-gpio
-          - qcom,pm6150l-gpio
-          - qcom,pm6350-gpio
-          - qcom,pm6450-gpio
-          - qcom,pm7250b-gpio
-          - qcom,pm7325-gpio
-          - qcom,pm7550-gpio
-          - qcom,pm7550ba-gpio
-          - qcom,pm8005-gpio
-          - qcom,pm8018-gpio
-          - qcom,pm8019-gpio
-          - qcom,pm8038-gpio
-          - qcom,pm8058-gpio
-          - qcom,pm8150-gpio
-          - qcom,pm8150b-gpio
-          - qcom,pm8150l-gpio
-          - qcom,pm8226-gpio
-          - qcom,pm8350-gpio
-          - qcom,pm8350b-gpio
-          - qcom,pm8350c-gpio
-          - qcom,pm8450-gpio
-          - qcom,pm8550-gpio
-          - qcom,pm8550b-gpio
-          - qcom,pm8550ve-gpio
-          - qcom,pm8550vs-gpio
-          - qcom,pm8916-gpio
-          - qcom,pm8917-gpio
-          - qcom,pm8921-gpio
-          - qcom,pm8937-gpio
-          - qcom,pm8941-gpio
-          - qcom,pm8950-gpio
-          - qcom,pm8953-gpio
-          - qcom,pm8994-gpio
-          - qcom,pm8998-gpio
-          - qcom,pma8084-gpio
-          - qcom,pmc8180-gpio
-          - qcom,pmc8180c-gpio
-          - qcom,pmc8380-gpio
-          - qcom,pmcx0102-gpio
-          - qcom,pmd8028-gpio
-          - qcom,pmh0101-gpio
-          - qcom,pmh0104-gpio
-          - qcom,pmh0110-gpio
-          - qcom,pmi632-gpio
-          - qcom,pmi8950-gpio
-          - qcom,pmi8994-gpio
-          - qcom,pmi8998-gpio
-          - qcom,pmih0108-gpio
-          - qcom,pmiv0104-gpio
-          - qcom,pmk8350-gpio
-          - qcom,pmk8550-gpio
-          - qcom,pmk8850-gpio
-          - qcom,pmm8155au-gpio
-          - qcom,pmm8654au-gpio
-          - qcom,pmp8074-gpio
-          - qcom,pmr735a-gpio
-          - qcom,pmr735b-gpio
-          - qcom,pmr735d-gpio
-          - qcom,pms405-gpio
-          - qcom,pmx55-gpio
-          - qcom,pmx65-gpio
-          - qcom,pmx75-gpio
-          - qcom,pmxr2230-gpio
-
-      - enum:
-          - qcom,spmi-gpio
-          - qcom,ssbi-gpio
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm2250-gpio
+              - qcom,pm660-gpio
+              - qcom,pm660l-gpio
+              - qcom,pm6125-gpio
+              - qcom,pm6150-gpio
+              - qcom,pm6150l-gpio
+              - qcom,pm6350-gpio
+              - qcom,pm6450-gpio
+              - qcom,pm7250b-gpio
+              - qcom,pm7325-gpio
+              - qcom,pm7550-gpio
+              - qcom,pm7550ba-gpio
+              - qcom,pm8005-gpio
+              - qcom,pm8018-gpio
+              - qcom,pm8019-gpio
+              - qcom,pm8038-gpio
+              - qcom,pm8058-gpio
+              - qcom,pm8150-gpio
+              - qcom,pm8150b-gpio
+              - qcom,pm8150l-gpio
+              - qcom,pm8226-gpio
+              - qcom,pm8350-gpio
+              - qcom,pm8350b-gpio
+              - qcom,pm8350c-gpio
+              - qcom,pm8450-gpio
+              - qcom,pm8550-gpio
+              - qcom,pm8550b-gpio
+              - qcom,pm8550ve-gpio
+              - qcom,pm8550vs-gpio
+              - qcom,pm8916-gpio
+              - qcom,pm8917-gpio
+              - qcom,pm8921-gpio
+              - qcom,pm8937-gpio
+              - qcom,pm8941-gpio
+              - qcom,pm8950-gpio
+              - qcom,pm8953-gpio
+              - qcom,pm8994-gpio
+              - qcom,pm8998-gpio
+              - qcom,pma8084-gpio
+              - qcom,pmc8180-gpio
+              - qcom,pmc8180c-gpio
+              - qcom,pmc8380-gpio
+              - qcom,pmcx0102-gpio
+              - qcom,pmd8028-gpio
+              - qcom,pmh0101-gpio
+              - qcom,pmh0104-gpio
+              - qcom,pmh0110-gpio
+              - qcom,pmi632-gpio
+              - qcom,pmi8950-gpio
+              - qcom,pmi8994-gpio
+              - qcom,pmi8998-gpio
+              - qcom,pmih0108-gpio
+              - qcom,pmiv0104-gpio
+              - qcom,pmk8350-gpio
+              - qcom,pmk7750-gpio
+              - qcom,pmk8550-gpio
+              - qcom,pmk8850-gpio
+              - qcom,pmm8155au-gpio
+              - qcom,pmm8654au-gpio
+              - qcom,pmp8074-gpio
+              - qcom,pmr735a-gpio
+              - qcom,pmr735b-gpio
+              - qcom,pmr735d-gpio
+              - qcom,pms405-gpio
+              - qcom,pmx55-gpio
+              - qcom,pmx65-gpio
+              - qcom,pmx75-gpio
+              - qcom,pmxr2230-gpio
+          - enum:
+              - qcom,spmi-gpio
+              - qcom,ssbi-gpio
+      - items:
+          - enum:
+              - qcom,pmk7750-gpio
+          - const: qcom,pmk8550-gpio
+          - const: qcom,spmi-gpio
 
   reg:
     maxItems: 1
-- 
2.53.0


