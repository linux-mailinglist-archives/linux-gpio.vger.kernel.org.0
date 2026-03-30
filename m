Return-Path: <linux-gpio+bounces-34376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLG6LksBymns4AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 06:51:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F9D355603
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 06:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74235300EA82
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 04:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C54346E58;
	Mon, 30 Mar 2026 04:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6s4M8Su";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqf+FF7L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1FF24B28
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774846273; cv=none; b=W2/oHymf/InpUIix9/cJrZ5KQn66m+92SAuBUAEgWmkl+5XUHKD5leXWvEcFtaYETtfcF6v52PGxbnn4UcFtKWkNt0+p09JmQ8FJhIgxES/IU4yXycH1nyjZqwZFWTPCc5pdIkVcoOk9d66hNjyjfpX5QA7xOABsDugPphqYfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774846273; c=relaxed/simple;
	bh=IbMfSA/YZ81DtiE0UDc0yWJ9qnzluHNhmHfegFBS4zs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EvIKo4+Ee3Uix/EivhDEBDKkEs+iUHPCWTv8VfJt8TmG6srfL3bJ26zjdZP9sbx+q71FJneDycxoL48sUH9EKtfdvopRs7h0Sp1UJAU6JqVpp5pskf+k3mNADXOAEed3g/xV76oWF6cRTZ1fI1UfAWTYJZKel9/wZwTKRi0dYog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6s4M8Su; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqf+FF7L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhiQH581227
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vKmfxj9lYsf73NBF2dYNq9
	WOcQ5WGyYMLr/gxZDq6dY=; b=O6s4M8Sup13S8gIhCaoH/C2/1TYeLviSLa1jcA
	2E60BzrCfg4WYJ1Tn+Ayrg9R3EHbRbOr912o2Co8dFsJNaNqcs8Q+uz6E9KVPoS4
	Q3/JNEl3mmf1FjXnNumkX8Hbf/NZ41Rt3hjQHaTXJh3yVDc+3JZRndgs6WupMRiD
	OE8vyDR5VOJEOD9N//Vp8O54uDDQVs6wV0egEMpvVPLducUDvQwuaP3iOxBt6hdK
	PTCwsakGJsE7nfDqUlH7k6cwAXmWKaGURNV+i48QmxkBeUcc6i0unYTl+xZ1Vz6G
	QgYlbOncjewT8h59ZNltLGOSmDdf358FzEEzDIGIRyGqx2DA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqmk87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 04:51:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c89d4ce16so2677812b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 21:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774846270; x=1775451070; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKmfxj9lYsf73NBF2dYNq9WOcQ5WGyYMLr/gxZDq6dY=;
        b=Gqf+FF7LKf/s7TyEvolldCpHAzX+qltSfdqnRcp1dsAw+9EUFCtSZWPH6pdjLgFqF2
         1St156MBdVpSBJN3LukYOVx7KHaxPZhtLj7kXgi5rwxNxnpMr+JxwHxgrg1+EAkkJaV1
         BKn5iRsBTeDwBr81BdDXwq8Dkd+Dix01HihEogpLOba7xzFg3Y5B8w/hfONThchmd4h1
         V0p070Gk26mzmDc6/vn06ZkbsjLEWxxm4kmL/TKTYQoPS5z+qFI0LWeKrMEwT2prM3RE
         pUcq2+LJzSmsCwdnQqvpo/wQ7Hz5kK1dbD8mEzjmG7/5t0UGvi1oVCIVKvgC2n2+4bm5
         Lz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774846270; x=1775451070;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKmfxj9lYsf73NBF2dYNq9WOcQ5WGyYMLr/gxZDq6dY=;
        b=UBWt1lH8zOlYzuEJq7Sd5btisKqNd8vB/OKuwtucG+S6EC+s0o5KPjRw4skbRXVwGU
         hYCF5Lqs2YwDzt7eN7ofzz4l6LVSKY15HQDTSkoJv0NKiKDpmjCTrYtmV4GWhFNSmXgm
         ChHIyR/ewWonPcZwfFPxYTnG9plmQ60nv9a75YKo3NsZqm0pCp95K2gDBH9ipzyLcbP0
         XWI0g1kTuHfJyN1xNxzJOOK/LdPn6BspfCX+05WzPpWq85y/L9CZTWiB/tl9mfJJsxPb
         hRGM0OLKrVxR8EZdu3KLGS3cmwNb2T3EpjpzYOBXQYPl3q+EMxeKql8ba0Vj1kZ4s+gx
         ybmw==
X-Forwarded-Encrypted: i=1; AJvYcCVhbzLBiv2mHeYkxpPWMh5NsISw11M1MgyXB4UztvOhysvdAZD2Mw+rdnJESdpnKq1TA8kc0MKf85nU@vger.kernel.org
X-Gm-Message-State: AOJu0YzXw0bWg/Jqilr0+szKo9gZgIWoqXclZ1JtVve18wc4WHtJ2VMU
	J835LhQCRMX74WTneTW12+DnErlRfV8onRczyC+tBrDVq7F1w52/d+jbpc5SF6dOMEdChYL1Ufp
	hLOf5yvyxH0iIcMXcVdGZYCk78bMzKcCGd3wHRsiLa3egjvLo4NOvm833YYmZGvsu
X-Gm-Gg: ATEYQzw5ucHQXWTlrVrfjddfElVu/KIxWLtOug8j7cCD6RVFa+kCVC8MEztN1TY7QvS
	2dwRnaXT/QY1OEOGSBUvLYtKElAYJNYJs57KTe1Rb7CiVOQmr3JIpuR4G8HQqCudUyM59VMzAjT
	XZcn7iCTS/luGacRnHVKfox/tUGc3Vas2EOj4/j0TDh84cKzLKIPfAhr7Eg13HrJ3HqZMDjzTY2
	28yXJ6ZI240XncXc8HQstKp2pje8hk6eqFFU705uHqHaVElGX/OkzTKFL/gNEyFDGamANHqd9A7
	PAyZcFcI8q6tC4gXyqg1zmgJ3KhXU7weTODTRHDTv3+egEUKZgVfz6CzCMChyfTHoH32U2fMpyT
	uoC9kIzzZWQcld0FVJcxSqMAJSEB44ifQqpLPI/A8qxextfadHPGNtfXbLSmUKYXpf4r/HMu6hD
	6bD5t9NJlVaQDpS7M5iBXi4ty0+xQEQh+nPcVYIUq7rNEPLLnraL4wWq5Z
X-Received: by 2002:a05:6a00:440d:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82c95d4fbddmr9946278b3a.18.1774846270484;
        Sun, 29 Mar 2026 21:51:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:440d:b0:824:a22c:c6d7 with SMTP id d2e1a72fcca58-82c95d4fbddmr9946259b3a.18.1774846269960;
        Sun, 29 Mar 2026 21:51:09 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843e1desm6776896b3a.4.2026.03.29.21.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 21:51:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Date: Mon, 30 Mar 2026 10:21:03 +0530
Message-Id: <20260330-ipq5210_tlmm-v4-0-b7c40c5429e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcBymkC/23M0QrCIBTG8VcJr3PoUbfVVe8REXO6Jsy56ZJi7
 N1zg6CimwP/A99vRkF7owM67mbkdTTBuD4F3+9Q3Vb9TWOjUiMgkBNGC2yGUQAl16mzFqsGgEp
 NiZACpcngdWMeG3e+pG5NmJx/bnqE9fuGym8oAiaYlqB4IZkSnJxcCNl4r7raWZulg1Yvsg8Dx
 I/BksEqLg9S5pI29R9jWZYXucp0DPMAAAA=
X-Change-ID: 20260317-ipq5210_tlmm-df221be105b5
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774846266; l=1865;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=IbMfSA/YZ81DtiE0UDc0yWJ9qnzluHNhmHfegFBS4zs=;
 b=2RUh6vn2ZqA4qRrimPbl2CIuEY8CQHZB/7Xvi1b1APO4Sy32LE4Q2ilNOIiEwNH2aioYkSdQ5
 ZF0DenxrzNgBkB2ZiTK6M+CSn1RXoe9bdKBPefH/o1/FEKbpgKEc1Vs
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: p07kv7ByzZYxyh4gIx3Ctb_eAeCn9KHj
X-Proofpoint-GUID: p07kv7ByzZYxyh4gIx3Ctb_eAeCn9KHj
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca013f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4V7GHvCDef1FtlI4rEYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzNSBTYWx0ZWRfXxwM0NRckbgaG
 nkYsjDXgUg/TMNzxxLpbA0W21KhP+VOkg8b3UouxiNvflVeRUV7J2i4y/5khhSZHiZfb/njxPWy
 X0jJp4dOHeyDOhDDC6G7wXDb2AjdAEzMgt/hxP5AE7IeIIl0A3+jOHvPUmg/Og/fLq6KaaJEAJx
 WNiJtiVAQzQGjAifa2fQJlS01yJU93+T/MmwcJ5kP4za52SChcEUwaDdREv42Oy73ThwHaPC3++
 /8h4LTC9/ffeI2CNNjpULjl3UuRG8bRSfcDt1Z1sIqxEZImEMSknOCDjyjeCSHf78IsS5GyCF2l
 278p41cv3HJpraPeBE2pywDEpRYBCTTmSiDolwqWnYcij1nfgz9t3ezRENRNNk0B7YXj2xspdto
 TO7QD99tBHB4icgNLr24Bxdcyu+P9N8fVB+R13fr+9yAvbTnDG89u/4hX4CDATcOsB2hbX2tW7R
 lKoGPQcbPenkiB3qD0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300035
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34376-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 65F9D355603
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
- Fixed the W=1 warning reported by kernel test robot
- Picked up the R-b tags
- Picked up the Krzysztof R-b tag which I dropped in V3 due to the
  changes in the function name, but it seems not necessary to drop it
  just for this update.
- Link to v3: https://patch.msgid.link/20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com

Changes in v3:
- Grouped the QUP SE pins instead of mentioning by function wise
- Splitted the PWM functions which I messed up in V2
- Audio primary and secondary mclk function names are expanded to avoid the
  confusion
- Dropped the R-b tags due to the above changes
- Link to v2: https://lore.kernel.org/r/20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com

Changes in V2:
- Split the TLMM changes into separate series
- Picked up the R-b tags
- Grouped the led and pwm pins for better readability and usability
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
      pinctrl: qcom: Introduce IPQ5210 TLMM driver

 .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++
 drivers/pinctrl/qcom/Kconfig.msm                   |   8 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 898 +++++++++++++++++++++
 4 files changed, 1030 insertions(+)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260317-ipq5210_tlmm-df221be105b5

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


