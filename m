Return-Path: <linux-gpio+bounces-38776-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H8sLLAX0OGojkgcAu9opvQ
	(envelope-from <linux-gpio+bounces-38776-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:36:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0610D6ADC87
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 10:36:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nLLf3mUw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=exbGW8Eu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38776-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38776-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB54B3008D32
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 08:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2BE391834;
	Mon, 22 Jun 2026 08:35:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3C1F427C
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:35:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117342; cv=none; b=V6aKke7wHP4dRdG5ne7IT2XUzYVD93mq/RX1xwiRe8qyezEV//V4ODoza8VSsnf9Y/exm/A3Z85Of0ZiwnGEZNb5vmMsVMJ/Gsqd3ZnV2tVm9viAJ9wLqlnD5dtHbf9rXdM209h4keYWAjEE00VbY3rGRYCOr6C8aJmYZEZgDAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117342; c=relaxed/simple;
	bh=UYAcFQsdl0wlVvELJYNvsPuhaeON1HGQVMHdb9Z1pck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h9DoWXMsAbiDsVFojz7Sg2d5RPCFDIhdUTGLM4o6tptGRF8CPmn84UZCgUNencJHRAreLq4sA+WJUjzC4KRvBOmv/7hstaVi9nV0msdFV3Ms9abCKSIy1qYBGwylDtJj06Hq4aZXl4GQWOgmUnHx28Gu/so7PM8X2EOxfHpO70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLLf3mUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=exbGW8Eu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BJOg255307
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sPdG0qXjeboBvQV9fnjcdY
	soHMrD/LzZsyptqg7/lmg=; b=nLLf3mUwhqT8dGr3EnipICBrtalP3AS5Uk3ukt
	YWiq55ii6cjPh/+Fz5Gqq3WySJmEAQaPVwxpAKfZGylza/T9ljqW3rPqhiXyc3A3
	dWU2qQQIUR0gPSYmpYyrpiyNj2f3AFYNKaqsj7brf6Rf22Xz6KibhNGHbL+jNyek
	VJKKjSIoI9htSmdGWDqGl1xcz+tFD27xbrLM8r4097We44SNPlxS6zCA2Fp27gSS
	1p4O+RV2KtoEMBWD12Tk2YQFbDNCimJ/m4hnUMQqREnepGDTFqRPYKMHfRNrMT6p
	xAkr9fnZyM2mRg08Celq1mwbBRnRSbRn6Ko5rrebe/bvPSmg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5nraj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 08:35:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b70ca7e5so961069c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782117339; x=1782722139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPdG0qXjeboBvQV9fnjcdYsoHMrD/LzZsyptqg7/lmg=;
        b=exbGW8EuRdXjks2uNHMMMjiJmjnxL9yTElIfttCNbre1XAetj7yBMZs2+eFGdwttB0
         gjidY5heK1cuBX5YGFozJM/IZIU6WFQW/VrLwLInNHIQxx8rR95DzoLZoHNce2Tp7hUx
         /lzyP2kUWrjEFXU6htqg00Lc3qA3yUnA0Ca/tRqsNMiys9bMPK87G/Iuuu+ZgixqS+eI
         Z2/j/gnRSQ6nnvUf2hwPTFJGXHqyIqN0Qw0fpzf9rnYjwyhgQb8PNaMRzKFcqY2Slq55
         T/rTYDh8m+z6xsGRHAR65Nur2xEMfBEpEeXk7ot1GArS/WXOVEeQ/6krTGwpVsY5q6FA
         n66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117339; x=1782722139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPdG0qXjeboBvQV9fnjcdYsoHMrD/LzZsyptqg7/lmg=;
        b=Blcjcsq6qWn3smJv82lallFgMCclnWmQCcuZIAHeIZycFdMYqlzi0iSkZhy79y/oSE
         ohLj2cDPSIzlPUXmPWkY9hMMD8XcWbpFBEliG1+997T7gUSA5pnHBmCnBnjA3XZNI3MJ
         kRKxf3UsjmomuLjuCm9ryPK12Q3b55fS0x/Vm44gIOid8V9H5TTZh5HLFwJrfJ/YLz8g
         dnXJCsZIKFl+9WFB2zmiWVS9GqGBk0wFCnNwetu3TYvuu3pdNLI5/nmQ0jKEIIkllG2e
         uXhX/uvZVhJXpPe8KxsURRM5bTrqM6qejTOUq6iA4ECiw9LYdUt8tnOA27d9d4LcmbYY
         CmtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/y1rvJJmyKl5IDreoah4kcvg9V9/Kx0tT+swhQ7IRAUWLImlFI9W4ljWS5ECK4xAHDw7CezaBSA6VY@vger.kernel.org
X-Gm-Message-State: AOJu0YxyoXNh0s6143pYRKv6Zl7N9D+AYilRNPEhghD/heEfUbB5p6Vd
	2qfz5TO7gCzdtso91IGKHGei9m7BPXpN3Y774VnRdwdEZjfp5h418CpczkIEBEJ8fWukjTxa0Ah
	OAzFoEfosgvN4monUOOikLtCV8Zj33otBA4fsh4KAua4KXDwzuYbE0NbiTOP1IKR/
X-Gm-Gg: AfdE7cnraDq69h7q5dM5vMXfRxdrTKW5nonW3zSWZJbMLFPXYyGMWdalcAwl4BvUuDn
	TA4CMDT0A9fAIjxdPDKs7LZyf7xVC3w1TQaFFPNYPlCZvzAbR/q/UfFcBL4hcQeh38kVGqh7Oah
	NVIt13uxg/KMnWZ0QDeGTEZpScMIFZH+ZB/SlGJqz0Xi8aRrYmiS9AIffrzQX2TZHokok9I1QPn
	698Rv/K+9Z4pJ9TIvlwbXFpIXLCdckAo3qDBPB3VZ9JfeFlac4kI21horPb7HHVMIWCgogW94ZR
	yAJLCvkybpy0Dq03x5rFHCQjCWMoxXtxyRRh1255UOTrV14O9xyTLxCZLX9Q/oEcDF4htK+e9VU
	Z3ka4Y/YWJRl7/C3exLWxYw5y3vzXwJilxpPqoorDdcjPIS4pcI6VVCv1QoNxqw==
X-Received: by 2002:a05:7022:629:b0:138:30b1:4c00 with SMTP id a92af1059eb24-139a2035deemr7515161c88.3.1782117339019;
        Mon, 22 Jun 2026 01:35:39 -0700 (PDT)
X-Received: by 2002:a05:7022:629:b0:138:30b1:4c00 with SMTP id a92af1059eb24-139a2035deemr7515147c88.3.1782117338507;
        Mon, 22 Jun 2026 01:35:38 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adca1b18sm6801967c88.3.2026.06.22.01.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:35:37 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Date: Mon, 22 Jun 2026 01:35:31 -0700
Message-Id: <20260622-maili-pinctrl-v3-0-9724e1000471@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPzOGoC/22OQQ6CMBBFr0K6tqRMoagr72FctKXIJFCwxUZDu
 LstLkzUzSQ/+f+9WYg3Do0nx2whzgT0ONoY+C4jupP2aig2MRNgIJgoSjpI7JFOaPXsegqcyb0
 2B6Z0Q+JmcqbFx8Y7X2JW0huqnLS6S5RIgFTr0M+je27WUKTyW1ABfAlCQRllUggu2kpDXZ9G7
 /PbXfZ6HIY8HpI8AT6Q3y8DJEijKtVq4I0o/0DWdX0BisZ9pQ0BAAA=
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782117337; l=1257;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=UYAcFQsdl0wlVvELJYNvsPuhaeON1HGQVMHdb9Z1pck=;
 b=Z3SBQcWgGoqJXq1T3gxXIxl+q2t4tfHXo7kVzRNohfs7pPfe7kvg0Tp6TYZBAeqjGrs4RYNBv
 U19dZQ3WnU3C55WylYSmvUXKbUQKOjx1IQA4LVA/GfF6c+6tHdNezls
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfX+5QoauZjdfZe
 DIHkSyOq3Tgt71cXaslqldBUINPkK3HdZ1/dfBIFP13pNr7ftcq3j0Em+gUNhPISEJ9F0REdcA4
 QzYQKaB5aDsEgXsysaojPXqAZ2rtrVU0JvHiUet4PEQLzrH/OEnmkMtK5CY/WxfUC9gCfMwGBoN
 /7Td4GgFr57HlbSBGUkT57sgi0zRl7vC9IKygEieymWek4pWEYXayXg4WhUf2QsfBuVjp7X1kTG
 04d7AGARVWayC/hW3LTq0bGXrpxbrzfb2Dq6+r0HanrVxio55t5J4mvBeBSfL6f6dBF4YczL51i
 6g86al/78UWNu5GF1KvN5CNies2zT5ztA2iG1ERU2kt6ETGPCZA+dzFLFecr9V1RRgOQAIkeqnY
 fpR+4CvgKaM4s5DjBjWsKRLJxWpjMCx98627JRKkPLSdvD7hFBcmACBCZpoRyqAHRXixp39JbP6
 ixLJScbpaS79hjWtqtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA4MyBTYWx0ZWRfXzrrHRcfWcNBA
 WVpJiqEqVnZ2Ti7s3ZWu66GPvIbJ6o8UurBwusEYVdZJ/vfY3btW8EaF3iizYd4xpUnUdhNcfap
 pZWQJMSFGKBUagb8QPMAPa+Ch0UXYtc=
X-Proofpoint-ORIG-GUID: FTxoC1bj3zq1friasWsAsWh-PIPhWghN
X-Proofpoint-GUID: FTxoC1bj3zq1friasWsAsWh-PIPhWghN
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38f3dc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=shj1PICiUaLHCvf5g4YA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38776-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0610D6ADC87

Introduce Top Level Mode Multiplexer dt-binding and driver for the
upcoming Qualcomm Maili SoC. Maili is the new mobile SoC, and its DTS
will be upstreamed later.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v3:
- add reviewed-by tag
- remove comments before msm_pingroup
- Link to v2: https://lore.kernel.org/r/20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com

Changes in v2:
- Move MODULE_DEVICE_TABLE next to the table itself
- Update gpio function to MSM_GPIO_PIN_FUNCTION
- Link to v1: https://lore.kernel.org/r/20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com

---
Jingyi Wang (2):
      dt-bindings: pinctrl: qcom: Describe Maili TLMM block
      pinctrl: qcom: Add the tlmm driver for Maili platform

 .../bindings/pinctrl/qcom,maili-tlmm.yaml          |  120 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-maili.c               | 1625 ++++++++++++++++++++
 4 files changed, 1756 insertions(+)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260614-maili-pinctrl-230a8ce90bcd

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


