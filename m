Return-Path: <linux-gpio+bounces-38217-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8CYzNzkOKWr/PQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38217-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:11:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3942E66682C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EzlvVYKz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=caT0dEE8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38217-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38217-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D77C31A9FAD
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 07:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8A638758F;
	Wed, 10 Jun 2026 07:05:54 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA1386C12
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075153; cv=none; b=IoNMjLT5ubIszs44+o15+zcaGDCrHrCd3DbLVh65njkxeXgsqLt7+lqKRzlxjXGZKZxqb6Z30tIu1vPoda55kbYylFd7cv4P0Uqx3x9EHjLLeJ3RR+kRYtobuJbHO/zf+gEnvmrYl05V89NknBahO5KRS6H+f9PZh32KXOWjr38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075153; c=relaxed/simple;
	bh=1k1Y5oMLDiqacInqtAp0TedkE+LbwYxgKQfdjngeRkw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B30d0Z/zMa6FZXCBAwcnE1ZR7JB5T105jhUcMcLc1BfphYs3T32GxDYbLPsSP3snGoMvQ7M4f6mjZEeU6jEIJllJzzNr9iIXg+asVtpuuaT7YgEccFLkiVX8sTnMGMsl+0vTzA5uy8/BQ+3+XiYo/J8tCENBFPv7O27S0Ki1FCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzlvVYKz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caT0dEE8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2epbo4097267
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bs3X/qgIm1gb+4pkuHTTTP
	KhSMR0SloJaTwaykgIQ+I=; b=EzlvVYKzbm3ZvnPoVswNW4GuqxBbiDCKbhRWGz
	f1esSS2WqjDpWl/O93gaYWPeZgJXVe2OnNr1v/NfldkSjVDzdr7BKtMrOQ5ilwEm
	atMKyZiLfpbSx1skUzweEOiGq1wH8klQnJLgapGKUL0YZqqiK3sP4NVUdxU+V1cp
	gxa9KEtSBqRS5crrV6Zv3fSPsqAowvZqKR5jwRtb6UoWLKtNrcEzo0lg3omEXxGo
	qI5izk3hbJg096Pvqfhapx4nmCcbTILMSOvcIdBh+xPGU4tqH93qGN7nJjtgd7KD
	TG0U8NoQRblA467p0Az5eCeZ9/qki5Rp6Js6szVcmdDETqCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jwdq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 07:05:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304ec73b015so1087933eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781075149; x=1781679949; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bs3X/qgIm1gb+4pkuHTTTPKhSMR0SloJaTwaykgIQ+I=;
        b=caT0dEE87MAYTtWUnFhspZIuna7HWTLgLhW5J/ugi4ay+pm/s6Y30PJFkF3XBK9Z5Z
         79X716vcMfIox6EHO2lT1pPDZ53TKxMPqwGNwQj6yTmRUcexvN63H9/V3bkiYAUR8e6x
         Fx38AI4ZnT5nSXaV0iNUXTg1D97Ciwd0z2/O7o8ZnSlAHYgtH7HEsdujziBXzpFJm9NV
         NfZOTSeGh0mJKBVoGnBshNNhWhCFeb7AIKlzgiwbTITT858CqvtMnfGMG1feozHdDuT/
         LsaSGSAASc6IGW1M007pbV3zoDNUulD7tf2z+7oxFgvtJPYPJ0rLXLBnvFEBaHlJPQRj
         p1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075149; x=1781679949;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs3X/qgIm1gb+4pkuHTTTPKhSMR0SloJaTwaykgIQ+I=;
        b=HsvwfOLpsnhyRaAr8+o9aaewFDe3N6U2+I/v+5smR5Dq32pM1e49PTur6T8kotEMQP
         AIgm9C1lPjJk+qT/Wi95TXGYrExaX+KXqdWd8kUKRmVpIoQAR1w0+it2sPCqF5CMUbKo
         sAfrN/raFOgDGnLTvj2K8FaIbYZDU7jCFmxH/0A1oirCZU1h+JhjH1ObWzeI7j8A95wl
         2ZMlAkGLqPbJDm8nTrhRqtKHrW0Rj/ePR8k85Fy7IRGuEsdCn8GXTrYhJSv/FqR3SOfE
         0zMuzCgDipbKvw6lDVWhMEEEniTLFO938MH97r/uTQxG8VljJob9oWZDccx9i+IYEo7K
         A92Q==
X-Forwarded-Encrypted: i=1; AFNElJ8+VQ8VAOpt1IfkybzSbW7AQ+fbMMzJfEktZZbuoYKhxMA+O0LXTM4+BvLYuHi/rC1JaCKRpc96PDta@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz18+8S4jfHePZtptN1GA6YFK0c3/NPbDlvsbiIXWLmrxFvcEk
	+efgvl8iGOrxfdvlOUUJSnnJT5PTInPibaJlWIARXrCC/mfU80b3OsqyKuOzu6zQ3n+bpYVQ1Sd
	FBt6s85+wZpW+ZGxjL0HFlB3gn3rvotwBRwZArKY3pUTv/Nt7hFiH7LGkuPNl+Vbh
X-Gm-Gg: Acq92OFSnp8r5AEX+eqwGxCubYV7/40LBL9JyZtCO3zvNUcwDF/zOUrfYuwYIOZeToN
	5y4zwFY8itoOWraVumhM53HqnWc/msdXnD5ODwu6mI5z3kHU6mUbU1hudlbFk8sokRPh0NylX/+
	EX7wdfudWuZ1ZnyuWbWfC8caA4cArme+YZz6oNtBkp9SvkMxMlJZS9ukHcFw8ekC2d8dBGkAwK6
	td+VeENTHt3h11nus1w/ajvp2RMSbjqwZQh9pfn/eBm7Pv+QEY4QSvmSwka2HOpH21Ik0RQ3TF3
	Im5Zf2ehrYNkINOVr2b5jTVsZHOvTcwcdV4Ei8aHyRVNLMzQzpquaKf1rMmkv9NascxyHCSxhxg
	JImEKrJ0uVfboFUru+7OFBgLamBgYu/GB8RhHkPDZ2Q4lh3xRZpRSmHUNq8n7wHuTsAqvmJe5Sd
	n7qIvD4qK3
X-Received: by 2002:a05:7301:4186:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-307d62ddc77mr4916500eec.18.1781075149296;
        Wed, 10 Jun 2026 00:05:49 -0700 (PDT)
X-Received: by 2002:a05:7301:4186:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-307d62ddc77mr4916478eec.18.1781075148760;
        Wed, 10 Jun 2026 00:05:48 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm22435926eec.30.2026.06.10.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:05:48 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/2] EDITME: cover title for pmg1110-gpio
Date: Wed, 10 Jun 2026 00:05:45 -0700
Message-Id: <20260610-pmg1110-gpio-v1-0-a9c50cd8b5d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkMKWoC/x3MQQqAIBBA0avIrBMcIcGuEi0kR5tFKgoRiHdPW
 r7F/x0aVaYGm+hQ6eHGOU3gIuC8XIok2U+DVtooo6wsd0REJWPhLIMzq7OnRSQPMymVAr//bj/
 G+ABpQsBpXgAAAA==
X-Change-ID: 20260609-pmg1110-gpio-fa65a9c911ed
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781075147; l=563;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=1k1Y5oMLDiqacInqtAp0TedkE+LbwYxgKQfdjngeRkw=;
 b=Pp1GIQxyRwkRVj711E3WZLraDbdIJoN2IZBYnJQO8oyUciVwyCzczQcTpj7M5xYvuqot/+mbr
 bL+OAXA9tu4Cv4/mS4acMhvzdYi0NiKZwaJ5oAj5ghJhPx+W2/eS9Rt
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: 03RPz0bq25e5ayUXMELucGgPg4_k9EFg
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a290cce cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uVLeI_Ghca3BpNyjC_oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA2NSBTYWx0ZWRfX4WUg0kd+sMNP
 0NDEvAHCUlpLRQIsTJEPRUm2Sm3UQVoc0wE1PzivzRB8UUcQHeiGNR1Xl76qLK0rmDCOGupAEE7
 ipy+3tSWv1T9FZyqx9uBKnUNDTDkmXi1vyba7eX6jeTGsmB6f8RYDGaFjP0v8OvmSyoS90+/Mnp
 V5gpQct+FbRB1vJtT0F979QpAyU5CcfrkfIgHtpDv2sLd9PsD/SB1kPTJE+gEs9bMZnWTCiVCqR
 FXaajqKTJ2C1RA2e7lW6xjXt/SnwD951MLZ1+5nbGwaz6tG9cFtl2RHhvM6mJiZPN7MpXQSDIrR
 5uNxnK2Lxt+p6hvA4XMlFRmVOeJ95pcFqDNlbgmJ28TBqBMGHbXCcQtolmXZJ1ShLu+KYESCO6Y
 kvCaoZj+gO2fYKYQnGb5SJvKvvfMaBsKlcY6QCl2/Xtr8qHiqWZMsO71myPB66mcNbLnweki4q9
 bMS2OE8eYr80EbQYkkQ==
X-Proofpoint-ORIG-GUID: 03RPz0bq25e5ayUXMELucGgPg4_k9EFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38217-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3942E66682C

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (2):
      dt-bindings: pinctrl: qcom,pmic-gpio: Document PMG1110 GPIO support
      pinctrl: qcom: spmi-gpio: Add PMG1110 GPIO support

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: ef76a3a28c79b628890431aa344af633e892035b
change-id: 20260609-pmg1110-gpio-fa65a9c911ed

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


