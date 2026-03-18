Return-Path: <linux-gpio+bounces-33707-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EHgBf1QumkAUQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33707-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:15:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C662B6C3F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 08:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DA443069D5A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 07:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF8136996C;
	Wed, 18 Mar 2026 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9EiNtSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWvr9Heo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A671369988
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818080; cv=none; b=T3wxUfUXPnsDWgzC8CCfSSApJP/lfxnRENAo9BdsvdIqTo2tRuVhK8AmTFXMB+Oi6O/U2pZwNVAFOO/a6QU5wFl4zqaFLC3uCVkKokl0rCHLhilFY67bhPbTPlwquxNsYg+seyVCORiUZO/ymt4UQ3b0lh34211KuG7VnxIg4W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818080; c=relaxed/simple;
	bh=/sEl/7vWyc59W7NsH7dnJ+QHe0uCU49M0vqsEXr3P9g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W66hYBwi4TcJQsiLU/OSqqX1nDaAVL56Z7Oz8rD90V/dAQVnZYWbZu1Ke9W+fNT900fn/AvhpPgLQyimMNsLql+mqGqFiFGhuPJR3cBaH1NpSztymlizrxXmDX1hkjtl1nlUKNOJQmvAJFpbopzXTgorissk/9PDBCVV9cqI3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9EiNtSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWvr9Heo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2AVZk3281113
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T4xBNHP02lwoVag6zYe/Ke
	vtJOqcf8IpqE4F+k66rl0=; b=d9EiNtSsxZgmCN3KGqSSl19c6kzj85O04DTyf0
	KmpS7aZV2TwHtEB5YOGzuVVVbJuM1CYHy0TFlQLGviUzQwAxsCG5ZywD/1L9XfsW
	+pzJotOyK/1eRpH6YPq7M+4t7iGm3eubj39wYidTfSXGkB0hdEFL0E4e/7FZ8wSo
	Ttd38Yew+GGcIlcCdEmFQCIsFCvnigmjsKrHspiA0UQQFw3MDTm1JMi095pZNd9R
	XbNF4djXo0igiO9SG0bDndx+7wXgcWEYPEq62k8mVgRa8sjiGl/3tO6UcUr0fNLA
	n74+hsIvTtEq5GFvFCZ+zD4AcnfotqB8BzX2TY0JK/yPwgGw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62u648-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 07:14:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so36591897a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 00:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773818077; x=1774422877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4xBNHP02lwoVag6zYe/KevtJOqcf8IpqE4F+k66rl0=;
        b=JWvr9HeoEgPmQTbwqJZbAV2r7kBdqzrOiDIxF6XkQppLpJo0Sg4/leOfrefe7E1hcy
         vu4Mw04+6mFZxm+3TVAO/bFQZt8gIasm2vxukPB/P2/Vnta+76I9jhOqLgRxHMkeF/RF
         u7glb6EfwqiWJTvO1lAhI4vzfm8mIx9yPaDesw7WpnlFMk7uBqQ2EJYAYbfHQtiywKw5
         SRs4LZy5327pgH1vcLrOtRnfruSNWYHU2L/IMt+Nbtq5YDmi4AFXF1WlkFiM2wQY/tUz
         gaA31ejTbaYw82uV69e0fxYEzb6ezlBYVPpo0TJmA5myrlA677rn+CqQj3xtTJvsOya6
         duRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773818077; x=1774422877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4xBNHP02lwoVag6zYe/KevtJOqcf8IpqE4F+k66rl0=;
        b=mj3Gjsx11c/0+tr5BnCZTj+60zNt4RVPomDwqmzyIsNq4vGz9/nIIItrXMSBfCEPv0
         ElFGxYpwIdzr0uUzf9rQrBYEquar6QqkPSOH8UKSGRPrR/9N3vXNv9ovNP4cl9HZMqYr
         KOoKl68wIS/LM1cRr8p0RgWbTpbuYjJ810rMQZDG4pvhRFJ4HylwI1xH694rGoKmVUfX
         f0Niq7w4Erfbrp0LJ+G8B8BY2pvisk/8nTrrINDi7ZZCw9jNqSV5RLmnmwJAUXEOiOZ/
         qFeVwDb/FC2ZqDglmcKYTTMaWk1XFmjvqmMg5yTnUjrlTBYNpTU3KTHSp9Fiq8Rq2wRe
         IG6g==
X-Forwarded-Encrypted: i=1; AJvYcCUXawDNK+rNoFtlTrmDTnHZjRJNLFR0e8IPCY+qtytTphAeY4My3GyGUtwsTLF/ypttF7Q53kXPiFOm@vger.kernel.org
X-Gm-Message-State: AOJu0YyNImisEH0/5oHNv/v63ZcIl5wtPC2/ly24Y7KK5M12dC9WtW+L
	MW8yP6FxM4em4RMuf6bqm35HEkxpQmXyCdDnQ3tpZB+GER2hpmfxmat+W2P+87VS4/2cLS4Sme/
	YiZPiJX4A5OfBtKsoqvMfTCPpKT+84qrh6OE3M9IjU5J9vqQqsOjCNF76CdsiplYP
X-Gm-Gg: ATEYQzz3sG0DiOWdirMSVgf8/xSWQQIhKD0vFADgpo7RvoHxadfFqXElBzv+VC3OK35
	7jFIaIUN9JOCsDdTIJZ0CQtC57bAOjBfuyUB5lw4YPCN5VoZtBz9h5H9seyE8b3Xig5rC5MRjoL
	ILl/Oh+d6AWoNM+iu6sMLV5z1ngdmIk/0Z8wd8Aj2+Kb8NcA5Iw9KQIO8SL9XLvea9X/jAgEeu6
	wcar7Shj1LKRop0Vn2yffUHimdKs1bAVUUfA0ak5bKGmDQn5mDvSZgx2ru2uI+yrNdMseY9kFRa
	BeRhfsfK+DuBuuCF68hTE5qO9PQ+tNlNtIRgav66/BInUitOl9sNao3g10eHVXqF33f+A+c1OTu
	E6EkttBBKleJycfug4C0zBkMzxGtFpwbTj5KyyIsWiiCfMDiwN7LlVad7ysvuArQ/6VJOPmaDzM
	KQzW7MMxfhnBvR1E5WjgqOn6opTfqMHUqjEda6P8hZZAxcxMnTLYX226FI
X-Received: by 2002:a05:6a00:9a8:b0:82a:8aa:cbb0 with SMTP id d2e1a72fcca58-82a6ae5306emr2273753b3a.29.1773818077218;
        Wed, 18 Mar 2026 00:14:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a8:b0:82a:8aa:cbb0 with SMTP id d2e1a72fcca58-82a6ae5306emr2273729b3a.29.1773818076769;
        Wed, 18 Mar 2026 00:14:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bbe801csm1575768b3a.46.2026.03.18.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:14:36 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Wed, 18 Mar 2026 12:44:29 +0530
Message-Id: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVQumkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3cyCQlMjQ4P4kpzcXN2UNCMjw6RUQwPTJFMloJaCotS0zAqwcdG
 xtbUAWjRSzV4AAAA=
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773818072; l=1127;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=/sEl/7vWyc59W7NsH7dnJ+QHe0uCU49M0vqsEXr3P9g=;
 b=bHUpDZlxHJ1OKeVV+GiSbVvJ2TxfBzFC3McaETWFdOvD91SCMqE6hPvugprAW8xDKM1i8ZVk1
 zx9ioRmiVAnCeCZ/jTiWPFbCo+ZqlTBWolJUtWK91rpQIiTxEu/x6LB
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69ba50de cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v7fG6qyLzT-gi-QuDAwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 4LSkuQCe5GZQvko_0bm_Wuxnz0u55i6r
X-Proofpoint-GUID: 4LSkuQCe5GZQvko_0bm_Wuxnz0u55i6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA1OSBTYWx0ZWRfX2C6XKKkfBiff
 p5zZSZIsydEieE/WLFWPhUALvPvGb3I+Gh+tJ+a9yc0AikZcNoZe1xVmmcynwunFDZuPVUi52TT
 YdRDPb5Y05EgsXXPbYKTuTyIY9LL1eyx7Mtj4bqPnSi7KKBAwjREOmCs3BIwLNbTBKn4ZZ2K+Kl
 Tp5A+GHUeh0XXJgZVdQIPorInEQ4RsP0YbiQ4FT42E3VGjUCjR+t2ItQALQhRsp9iDTbSHxOqz3
 oA8yu9jPV28V7hXxO62B6OtWhSRdCvdkA8OQI/ThnruthQJBOnT2klGhNi7F2144NCJ3RX6gsG1
 GI+Ft9ZOUFIYZNjoUNUgAUtVsGIXvnBXn5LeoBW13mu6S0wSh3F4xyk5n0AuHe4JgtrJHb+1ggR
 /UNvZdl3KzQqdE3TIi8X3JvpmIM5N0E/MpgBTg79/26BQO5Y1xF7MIoJPQE+W4+Eez1rIK4Giad
 YyJfCSb9wlDA2dm6dSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180059
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-33707-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0C662B6C3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        |  137 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 1049 ++++++++++++++++++++
 4 files changed, 1195 insertions(+)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


