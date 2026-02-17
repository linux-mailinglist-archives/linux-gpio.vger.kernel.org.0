Return-Path: <linux-gpio+bounces-31753-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIqiMulllGkFDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31753-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:58:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DE414C313
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:58:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93B3A302BE84
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AA0339860;
	Tue, 17 Feb 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eI7MdCMo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kV6qHPK9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0475355815
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333095; cv=none; b=LYKCL7IGeydqhVppC7XRFVhbgyzg9u4VbmVZxd3djWMVtXwhs44VXq+ws0WhHRA8ehcNu9UDe+BN1B5t2ICi6GZb7ZlGNfGe3qRruuhabY91KiBvuurhBWMhjlTvQ/Sfp00tsL8XjaHObGsiHVhPCnIHPJcLP5E8zz3WhNqUpn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333095; c=relaxed/simple;
	bh=AKMb+9j9oMhiNTynuvcjtxOzX6VQbOZ4F+EJJAQf8kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMxLw/WYmZ0oYnAKS4z4iYHF3CGeUZyIl+h8GdTPsylXplXZmHtzNGeCYKPMYHlW4zEoNgJ/ms6bYVNcCK2WiR2SKSZp0rH4aMFPJuhxgLIZDJZoUFQ1rcP6eexQ9l0EWHy6L06MVtKkxJclwDDQTbfIcvIVxnNIhfYH7m5RCg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eI7MdCMo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kV6qHPK9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9tT9x2804570
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UZA0MnlUc9zNakYu7M4upaIgtQwUOCwPgWz
	P+uIZc3U=; b=eI7MdCMoQg4OzCoKxWqs4ZLpRt1ASyj2bZd9yrmg5pdB3Byb1Kl
	CVu2ESF1j1o6V4bJooktKEs9O9wRr1MBu7atjmrP8iVYkg2m7CnWpSzZcvpNf1AU
	d5ZcSQAPQXZuEsMxwUJlZ88qu3oa7BDmhaygo/t1ETGCQ7lc+oKbBVV3ffGGA13j
	vRij6kVQf8QFcwEOnx9Tqtyx8eOZzyshLtmatLUE8jwBAFErnLHTpnTFEa9ssEDc
	4fLByEyZ5dBcPsPMgEnR7c4xepgrjhzqkvr/ldeXdi60yUfW2wNS/Z+h4pPwtmnf
	uW6rc9fByAYoeuy4EnvM0Lhn3+Vv9uP1oow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxukgxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:58:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c881d0c617so2563905485a.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333092; x=1771937892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZA0MnlUc9zNakYu7M4upaIgtQwUOCwPgWzP+uIZc3U=;
        b=kV6qHPK9S0d/YsldPpTVl33bTYriYa546KmqAG5hKn01PsZZniQtSsrxpw8oAyrLIt
         mKOIHkECTh2aJtzK5OobmrSmWCQPfW9BHsAT8UZy/lxA8llu6veMTFy3b9CdEdP1BaCl
         Q02yNDviakE9EnwOEtuV4m0iIhz5zuXtKuqpWZkOekzAPpGch6WmmhukvleMwEgv+dBC
         195xBah9SH5bYJXa7DpHoYar6Jg3J6m8fe8JJ2J8w26KrKPMGzZSYsCoHKDLwVLqGgtQ
         ISEwTdkFJoSdb+fgDjFoJpcLcNnVi06hz6b7KIldEJSs1jvriFO4sibtFCiHN/x+0MSw
         lH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333092; x=1771937892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZA0MnlUc9zNakYu7M4upaIgtQwUOCwPgWzP+uIZc3U=;
        b=Hn5UvXQF2cJ8OMxYleGoG60aCqlEmbv7UglpvcO6OMr1euqpeo9n2aquVSBrJm47z5
         X9CycK6tgQeCjLlwrBR8CaKrsOEbF7KSFQWppWvStGa0g14n2fGZccbjnUVrSg7bZ9tV
         PV1D9y+fEjgVDyaW9aCRnmm59FtJGU0/WjHmGZgp0SCDpzJNy64Dt+ObYgqHZqSC+LAB
         45iGHKlDuyZu+OMSNgeqZJhkgeGBGyZDGqEBYm8telsLtsayasTh6qCTTeGZtRhoTj/e
         GcJr1Px3nN1K3CMPP3paCvPS8Y+pMjRSqKPZMfkBxCd/eZoKscZy2/rJW2Sq+E30N5I1
         tbOw==
X-Forwarded-Encrypted: i=1; AJvYcCVtPtpa1ZW1pzhp4ojq+m3axCzYJSbLDcL5QgWt6VzClXereDFM64AAhbtNgJbr2Gfn3QgomE5Qa/l2@vger.kernel.org
X-Gm-Message-State: AOJu0YwAB+5wwB0gI6v8iIQ6tOmK7iG807cOqnvTw/86ox8PQ3bvkT8u
	2Iel8xyDOKyLoMYbRUvW18oBGYgkWF+H8uLr+bwcSxYvRItlMhVfG8gm8On0/JXWJ8JtdOvqkbO
	aMX8OH4G/X8HKjO9yGQMSR/B4i8csOw2RpF+cip75NS9eLR/mE3Eqfy1yJGlMoMVJPX9PRWs8
X-Gm-Gg: AZuq6aJxVedQ9Y5DC+aovlruxFvC9fAVEZ5L9ayYrhFGi/V6gru+no1DKiDOSyyYujn
	l6ob2S4zKA8DD7NDieVdpP6DH1kbfUSpQrZi3n5+xzZmccCrQq3bpk4qbi7m2hKymr3IRaAA7xq
	prZUaQrc6G2QCOhp69y9AXKesOu3ULxWOeVnR5WP/lRbrm/uopmCE8/LWtD1w+bvRfXSPsLk2cP
	G0SZ7+ntMeBkQosxMX/MpCXSvxxwKeTZSiFhRJasTAlvWK7TVhJLYDr8eyHoSm6G1MSeHM3nY88
	Lb7O+ldV5GkDO2htPh0IoN1wiN7LhqKI3Ujr6FFRSEPc1GHkPgX0oAUATjDFhLQKJUYICjQYY3J
	2Tkm4h+jg94SU/m/djrV/jHLOMRbH/UH0bZpnww==
X-Received: by 2002:a05:620a:4484:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cb4c01dc77mr1228100085a.63.1771333092179;
        Tue, 17 Feb 2026 04:58:12 -0800 (PST)
X-Received: by 2002:a05:620a:4484:b0:8ca:90de:43f5 with SMTP id af79cd13be357-8cb4c01dc77mr1228098185a.63.1771333091756;
        Tue, 17 Feb 2026 04:58:11 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac92sm34237301f8f.1.2026.02.17.04.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:58:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: qcom: De-acronymize Glymur SoC name
Date: Tue, 17 Feb 2026 13:57:36 +0100
Message-ID: <20260217125735.280920-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=745; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AKMb+9j9oMhiNTynuvcjtxOzX6VQbOZ4F+EJJAQf8kk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGW/5XoKRg57622gQ9i3PItLwg91pyofQvZzF
 168Q/FlmBaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRlvwAKCRDBN2bmhouD
 10p9D/4ubV7NgE3wji077oU04sD3BEUnLvvGgS9AZGMS4CxcxKRTDiJeFf2kRNo79GUO4b22c7m
 Zrocl5Vfd52pCyUkK5VWGpdPmM1XAm3ptEVPCaaxLW9LnXGXEn/6X9BDDzXJvPBnOoat3bhSPzt
 ls9GG38LR9Npwc8KtPBcjADuMdd8aMThLctwz3CtAvLC0ZEm0udbLOnjidmerqpmpStK17w5fVc
 wzyUIKnMm9xY/XpTzdXMItZ/YgtMxTMkXrWtJIwUlmsx9R3+NQoKG6fDUsmJxDHGqKOUYUvqzMh
 sTa0YMQwf22qQy3ETvit521yv6ts92pQhsF74OV7JJIwHUFmXNzCZRRMWab8O0sXLtvAp6u2JBY
 P6MNkbjqw4/vjsHUHoWQoPLYPeJLWyx/nfcLrUk3Mp1bPaG723PwWWLG0WsAS9Oi9uhYIkQqSg+
 vVj0hgUPsd1fV1mnzMwieUxjAOxWfAJJ7WE1oLKQay9NxttmeP+0CRnXOohZuuxYfTZ4uwFUJH7
 pNPAjc+xfF69jaIVmW+h3DEEN1UsmWNSr/I3FOk/VqbpyMnDHizh5xOgDVtDObNofL5VVxbzdjv
 s23Uj0ZoTGrHlC1gtH08gIQOaXzsbV7hfG62WAVgWtYl9f3pHPG0vWsIN4Bs6VzM5s0DNPeCIuA ZSfc7dA/qRAunkA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Us8gQEALTBWmX0HxzePbGJQ_ZKf-GWfQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfX1iE8G70nS1Gf
 TWMTkuUQdlhazI+D6Yhr/YFIolTdP0k+JCyhfsHZ50pYM4WeVMJG9kqkF/6H+/7oQ+6aHaIXKMH
 rlK8qt7cT2rbFDPtO180Uzv8gQoCYZM0J/QmWdfAnAm0PXyHqFdEMR5qo62IuwUWvAgG/+DgAXS
 Tpyal+8gt0MJaeNRej/Rke3AXd5qsTM96TXRMlZJPRJsT3Bjte3D0us1Q7ePzlzIXKUG0nCpoGR
 YNWpjadR4n1IZa/QacR2s4sQRHuBA3c6NLbbOtIKlwGHGNiF9uAQ7AT5ftvQ/970ZEeJjBGJVvf
 x6t8FXLCXwHYyfnbHUR0O+FZ1qhCtalfPGwv0Nrssdbe/99XjYDracx3tP/TWPhi4NtSOch2jvi
 TcYQV4qPt/SokWjdYZekqg/Xb7p8CH1BV08l6k5E5Hh1K8xSYjXu6/F0xX20xN2jJWdaUreg5pE
 e9MGwsDrN7WnKg23azA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=699465e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=pYRtwT6qQFSGHNt6F1wA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Us8gQEALTBWmX0HxzePbGJQ_ZKf-GWfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31753-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31DE414C313
X-Rspamd-Action: no action

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 44f9745325b7..2da3b513d31b 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -1812,6 +1812,6 @@ static void __exit glymur_tlmm_exit(void)
 }
 module_exit(glymur_tlmm_exit);
 
-MODULE_DESCRIPTION("QTI GLYMUR TLMM driver");
+MODULE_DESCRIPTION("QTI Glymur TLMM driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(of, glymur_tlmm_of_match);
-- 
2.51.0


