Return-Path: <linux-gpio+bounces-36424-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHmPHe91/WmyegAAu9opvQ
	(envelope-from <linux-gpio+bounces-36424-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 07:34:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C84F1F09
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 07:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4ABD8300844B
	for <lists+linux-gpio@lfdr.de>; Fri,  8 May 2026 05:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBE33290D2;
	Fri,  8 May 2026 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LY9qr41r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBkSvXDt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6C1AD24
	for <linux-gpio@vger.kernel.org>; Fri,  8 May 2026 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218471; cv=none; b=hmxJNHZD1HLgjL7jHZSG7T3eDQri84baMJA3nH6fXStOBL2eKfCLIG9tuS7zeC7ysc+Mb5DnI/FlRfdYX4ISvylEM//k74VyqgEP5IU+WgviCp0HylmbxKzj86wkUQ3dp+MlKHWobtvKuEWCjTR9C8V4y2JX71x+psCEXeO5Erk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218471; c=relaxed/simple;
	bh=EtK9N4+NFj6QWTPadZKysZybLT+fRdMIcJYSRMi39J8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fiVy72un6QFyO+Px7/CNxpqJ5V4vJ0GPVEi+CcGOF6zLs+1b9jGj7KmxGJ3D67JL4IZxSNCykOryqIVgtZWeGDi2UOeitY5xXkaPutcZR6hUbI1LsHKAkjBZRhMQS0Wn4kH/VBtG96FUnWSpG8SzbfRvbOnBtEtJCyZKqGDAxwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LY9qr41r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBkSvXDt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484a21r1417593
	for <linux-gpio@vger.kernel.org>; Fri, 8 May 2026 05:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2i6vQY2zhkjKUePjVtxsVG
	kCMbPYzqKLTsKJLhPO/8Q=; b=LY9qr41r+CSRLTLBvL7Gkclx24MmzuYx4c8YP2
	/pUWtglS67Kovn7p2S/Q+BlaMo+Z48vrtwpWagTsfCBvtL9UXUqgJOGVEyKeS/u2
	C7WkdwcqpHoivEdvy7jPEAshG+by0P9ZS8RBnM1W++XNaFGWKraYUiAAh24ewmR8
	LB6wrtRMJwBDhtkIvrRVJJ5pAiFYNI6USVKulhVtLSXd9b4dr1Ibd1wAqQAXgwpr
	dTQ6QK7BPJUUBlvp3L38h0tyDewos7yZ7/dAsNEepMgiSHSbqRqdexz3wzeUDEaO
	xYR4BP7B8L14rMd7uuFokQ4oqCMsHeZNMHZS+4RkYxjEHFmg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0ywhj0dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 08 May 2026 05:34:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so2476885eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 22:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218469; x=1778823269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2i6vQY2zhkjKUePjVtxsVGkCMbPYzqKLTsKJLhPO/8Q=;
        b=kBkSvXDtZ1vcFFOG0IDCNNxkjMGZEC2ixNdCFM5EJZ3/OA89wORWaQ/uB4AbxufOE0
         kRlwG5WAunAgf4Z3TuSQ84gilL7T7WhaTdxg5q4zyLGbBbGYPbSkN3hyNYQ/pQoSgh2u
         gmsacodFS+qitR+hC4snbPF8LhsYYfxXDNfLugllMRctjJ45tISuzNuAcy6S+Z9ykLGW
         5Ikuo5t2ApufC0Sgt9NT+QnL+cn3lPdNWn6lvJNvpFfjOeMxhNr1gV1BUmkNV8t0DVy+
         xZu2qNOVCMxrzfEBCns6Ej8yDbxWCz1jBQfwsglHhJnfO2BN+7K6jFySjcXWUfXN6+GS
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218469; x=1778823269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2i6vQY2zhkjKUePjVtxsVGkCMbPYzqKLTsKJLhPO/8Q=;
        b=RicpD0sb6yxLxcMR9HggX2fiRsbXxArldo34CIupa0wngzDjk8YZOQyKPD4msXLIth
         q+3qFlDMrNvZKz3AjI1r5IqcFRXgFg5oECJ6N/cOj0t1aGyY8e47TrLV7Sdx4ZK8SyIG
         4cELOhxceLdBMdTuvKbejTJeosXTomxxj8AgHDbEbwC16j6ulrwOdLdZmuyd1Xlt8Ctj
         h0ZwSAuZo+TYVTSHS4wlg+hmbz6vqsFZGTvFiRLGzS08zsJLQ85h8mcDiXSzvn9+3HQK
         xbuZOaR5Auog7NoqNq6FM14R523jmXdgeQk0Qv8UM/N8W5Jp/A90AlEm/RiJXZCZ1Cgr
         oYlw==
X-Forwarded-Encrypted: i=1; AFNElJ/51tQsNx+c4jx8LMcFqdS4sPVlNJVGlf1ZP8UPCtuuwHyvZNaEIZI8bXiMxcrZUBePEfJKwblxC2oZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm/XOD5/EdozB2cFKjvHrXtWjQg42FGVQlOSOU8209QNB5NBso
	XAZzd+yXAXXY1rWVfOmhBNGGb9h1jk8OqJm01teJxigKBjwtPDWeSLbTWXpDEPKdIF9qdd2gQn9
	2XbupGe4cMrP8qokTVTVhShSqfokcNSUTXM7y4aNCORvkCXnOgDMrmRcXNiptU3h5
X-Gm-Gg: Acq92OFaQ2QI5CsBPHuH1PKPWJXmROi6NuAnMYF9EKCpvBMSWco9684Y+qfePDucno8
	/KLUekYtPOLUXMIb5tIV1V3XdUDRZqrTqrEA953iLHznWEasBw7O5NwYS/brmt3F9bdi9fbBEWj
	7YAAB6s1R74rOw8DzAKVatEXBzP7lbergUopfGjoeVISmp7Em6rS9faOaKIHsw5Fa5kxmxO6IVU
	4is37ZFU6E5MYnLQ8fA+Mv8zSdCLAjTkTpYWJ86wR8wQmp7QgDaQxd897yLckWNrsbThdJgcMLP
	+uUJS3DMbjS+Dqqkm/kcy+jRpkLmwwAgwmVzWjMayr0Aej0NGUdbhBw9exoKuv5ChcV4xLjw4+P
	3EgbUldM+mAmArEElZ8ZT3X2XDS/kOhEU6qQWkdu117rpDt/RNphevCTSDrGn4I8criqSyIT7sA
	==
X-Received: by 2002:a05:7300:a286:b0:2d9:3616:d897 with SMTP id 5a478bee46e88-2f54a77fa85mr6196571eec.22.1778218468701;
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
X-Received: by 2002:a05:7300:a286:b0:2d9:3616:d897 with SMTP id 5a478bee46e88-2f54a77fa85mr6196556eec.22.1778218468092;
        Thu, 07 May 2026 22:34:28 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:27 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/3] pinctrl: qcom: spmi-gpio: Add pm8010 GPIO support
Date: Thu, 07 May 2026 22:34:06 -0700
Message-Id: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM51/WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNz3YJcCwNDg/j0gsx8Xctkc7PUpCRDEzOLVCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgAwgdVUbwAAAA==
X-Change-ID: 20260507-pm8010_gpio-9c76ebb1468e
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=896;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=EtK9N4+NFj6QWTPadZKysZybLT+fRdMIcJYSRMi39J8=;
 b=hTL+S8J/RoJ1e5ujpIjmo3jJulQpBAtLGIfbaKsOvZ38XxqGNZSbS4TlsS2hvLqu2lSr23JWC
 Dcdqfq5D4iMCWfCuhGC1SsQakYd6sujwtuL05rHNr6XHKr87Er09kCA
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=bMAm5v+Z c=1 sm=1 tr=0 ts=69fd75e5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=78EXHlv9UA6XwD1DlFUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: algSFooVDjAUKUC7JJgF_Bp75alyB2S2
X-Proofpoint-ORIG-GUID: algSFooVDjAUKUC7JJgF_Bp75alyB2S2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfX6NxIuaEk4lwK
 inwSODIyJ1G9aWWPVGQasFF3mfrWqm5zyYljE2D8lhOmWAlp1xUR3li8znvx+XR7R8ZpnYzILKZ
 EbUawr+4P2RuUCh6XSzYWIPYw6P2knhduRAM5FpU8PHHUREVp+YXPVhgybqh4e2Q6lgsx2kmqDF
 k5akdKq5MnH6mTs9MqiUr5qdctVFreAi5me0HcQHtF5F6nSsCq/gyzIk5A5xFNFLXPB+JSKut/5
 ZGs9S4HF5mTjXO6QaNTC3GDc+sDssO4JNUY2Fu808TxANAqUbkFUREaPJ4nqr/kaSSRl+9tmVb5
 WvtQqzAvBjAscvkrE/cWy4HMtRhlOW4ywSqxjpJVM7e+lKjCILUCriGovCEs3cU9WIC64cLhW/Z
 QzlxCygavy30q1l2lwOYInIYjLYlktQjvv8lpF5bBCdOpSe+FPmey8SxJwT7mdK9dHA7KE1vx8I
 bDW057RR3+N19CuXj5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080052
X-Rspamd-Queue-Id: 7E3C84F1F09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-36424-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add compatible string for pm8010 GPIO in the binding and driver. Also
add GPIO device nodes in the existing pm8010*.dtsi files.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (3):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PM8010 GPIO support
      pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support
      arm64: dts: qcom: Add gpio device node for pm8010

 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml  |  3 +++
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi       | 20 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8010.dtsi                 | 20 ++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c             |  1 +
 4 files changed, 44 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260507-pm8010_gpio-9c76ebb1468e

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


