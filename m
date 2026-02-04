Return-Path: <linux-gpio+bounces-31448-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hgCqL+6Fg2niowMAu9opvQ
	(envelope-from <linux-gpio+bounces-31448-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 18:46:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E7BEB185
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 18:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6C4F3072429
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 17:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2B434BA49;
	Wed,  4 Feb 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ph0Zwv2I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTzvtXoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B6534B1A6
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770226974; cv=none; b=oPmIJDqFK2gJ+qO3QKhtev+LKKSgh3moBcj3jAudJTxS1b3Ixs9fojxrBNcuJZlN/J12vq00V6QtUZtgDvOqii94AguTwB9rZNdHH4kfJCSJHo50UnsB8v3wocnAwUJQ5lSkZK+Vsd2SiE5LzPr83WDKIqRr4KM4f3fBbetiE0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770226974; c=relaxed/simple;
	bh=lxAoslCoGfU7do1qJxQC7CExg6SOCvzg3I3OOrDkREc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZCZD8y7mLGL9jdSm3iGFV/OO9p4ThekcY+ngItAEP8WVTCc07A+r+SgYL5gAicRsSUEO5llEXUOHXuM50OzKxRCOPLTmeRiw6GryVlNOgnMrk9vUSx2l68gSdO6BuCUx3OLwDM7DG0UBOMYg+GvWuazeLGdN5IDVSpisJfgvl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ph0Zwv2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTzvtXoJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIOZL2159324
	for <linux-gpio@vger.kernel.org>; Wed, 4 Feb 2026 17:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7zWGsz2dqtQaICdB90yHQ9K8yiLD4YIaOfG
	q4qsMxSc=; b=ph0Zwv2Id0TsFqjU04PBDuimC9V9Pe1uEYvuV0sN2BWKrk5sJD9
	rzm+exKmCEox+9YFExbjZ4bSm+oa/0yW6iD+y3yQN+8dzMTIovcZAMVLQY1tS6ch
	sCZyVg7RlEOZWQrVWkBf/6wYT43ekVe2cG8E2ZI41ffZ++O/OTrfhYGFqrdRWXjV
	BSFVfITlqsfL6JV4Vphkk2QvqJ4lACaqA8Pe3CUUUa3qzIdSfCuxazwuHkMBmFTm
	5oHk9oee4Td16YR46ap7LN1ajFQTpKf9XXli9EUu0ED+Sier/h7hDy+/LrlNMCEL
	9pcoa7rNHEN43H07q7oE8uUNZYL05uQpf1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvh4r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 17:42:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so2277888285a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 09:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770226973; x=1770831773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zWGsz2dqtQaICdB90yHQ9K8yiLD4YIaOfGq4qsMxSc=;
        b=QTzvtXoJiMYhLLsdMozGhiCRCOdL+S9X+Dphki94sEk7P+GhqkHusBVu3g4ry2M2Fu
         TCoyP5Ep7IvustxtrnsEuBkV8J01fRDI/iLteXK0hQaEPtjE8b1eyu9pbLxj4A/6UM5A
         9hhCwVXplUPWytiFgCEAsRrDyXkZvAYccSDd1Ambxj4J3xhhUleK9DBjK4ffMo47Y9yu
         Pov03dCpzonVAfa8YLKnYnJt7B+W6VxzrgD1tYS6Q77bDIC+rbJEbgq3Hqp8hCnbSHzj
         6B2+CUAxNVV5yvPcmp+bYq7b3TACB3z/GY5dAKACl8uW6WGpBS+ScCUtIzBNE3n6y4D6
         f0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226973; x=1770831773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zWGsz2dqtQaICdB90yHQ9K8yiLD4YIaOfGq4qsMxSc=;
        b=swsTcDR/RzncRJHF4UxtJiseMyrUxMMq2s3RN2Tw2/7gkRUg7OS8g8C01ctJmTzbKW
         pY+EfOPvMe2ZqBbioQ84ltcFaPWwzlKoi38UPCXiwP0FyI+k110K9GnZ+3H3ee/+ZJ2q
         JVPMWYyamo7/r7ooGOC1kXHYPJ4sl04dzVdYCsAg7ptBOiI7hYEXdkLsyO/gD+sfdHNV
         GH8nJmKfozUjuxQrDwY25uGLLD6Lp2y0n33pBNTtRghHBuySwsVBa5W6ggwl5wPWTaRE
         WCr7UCaUmLaTg6Z2QsbRxQW3D+ygpFI2o2HRXCFq3UtTJPEgzhNRUtYIrMNFdEXirGsN
         veVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrq/DbUD7PP9WYau+mmDr4uyZZ9KjinhXvEY5JJufebHTsNwQ/X+OGQyaLL+3pDrOMzyOVVdJGgWpn@vger.kernel.org
X-Gm-Message-State: AOJu0YxL18wJutUv3YVjL1iinp5KvrhRU1dnDBOk5RuVC4bhISBX5eZo
	eP8blmORd+rzbaSIq5ThcBVzJqlhAftdHwu/s1nDXUFsAV0ctWRyCxlbEqPPRfQLMDpLKs/O5US
	OXXMLWSblxaaCF+HzEUbn6AQZye74m80+AuS4HfnQwpD2nMQ6kr4mpEq70z8YE6NO
X-Gm-Gg: AZuq6aI6MdxZ5gtR4ewrNbvJ13en5g4kcXUDoC6wiXh+rZQ7yTp33MqKc/XIX+nbVcs
	4VqJLm4RhoBnXUjfWnVDcaZu2UFYNCmZM4PNZOCTr3WgHg+cDCC3YR/kK9F10BQdChBQp96ijeM
	aJjkqij678bxaHLvAhW0hUQBN+GYnm8/cVDa5jxYIWzAEU/0gBk5rYvwc2heXy1PrA+01+5jpzk
	F2KldPC5Yqswe/dFdkLW4enHJk3G07UcgVcrpZXcD02n+vCv0uHz4Y1HoFmheEdqyc5G4MsMpQi
	/r1mWe2OJhIAhouLkUv18sQSqbBBCq7zXm39c7qOR9+FSB7c4YQbtRYzmVxtjbUUacFpQZbvKQw
	euhB2qEMuDy74hqcqpTubrJXTHneQ87FGD7CXKcqHeBk=
X-Received: by 2002:a05:620a:3715:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8ca2fa6cf98mr486520585a.90.1770226972899;
        Wed, 04 Feb 2026 09:42:52 -0800 (PST)
X-Received: by 2002:a05:620a:3715:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8ca2fa6cf98mr486516685a.90.1770226972431;
        Wed, 04 Feb 2026 09:42:52 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm959985e9.0.2026.02.04.09.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:42:51 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: dts: qcom: monaco: add lpass lpi pinctrl 
Date: Wed,  4 Feb 2026 12:42:35 -0500
Message-ID: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX4jkCM8NBk4aP
 dtZnlj59Atvc2GmFdDuLR+mL+iMpL7cFtiZwrKzqAsN95Ri7VxO0HXRNi8WaNdfpiEwVFGKeimJ
 MYjaTZUhDjyWdXAdzS+hEuPlwHnpbCkzhaDvyvQOY5JF7GwA/e4IDPi0HYs/vGlSBhLSSDJep/c
 QkSBOssKmdMGsJHbxscnXSYoV9lpCl/CQWOLb8uAAxrlG/yjxuVmf5fvZ0JZO5S8htKd2htKFmh
 rBzf2C4wmiWkSrSBA7S3E/lD4cZhXosfIm8oswACgZZWoj/L/QARQOFb/A6zdPF+O3enBXx1hH7
 ApOCAp8YZvd7ZH6RNTw7jVg+bZzermwY+yaxeGHxJdv4DHSRpmuKzGN+tNICXdN7cUGsnuumWGM
 o63YT2yqNx+M0hqx2FprPxIx6d9IVGKJStR3YcDKsZlpBnDLPOYubxg6ipKh19s//hGGUiFBMUw
 Nfp2k5ZaCBi8wbAk9NQ==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=6983851d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tLhI3IazSDFM1hWFGSEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: P3XNW46lHdbWyUp0pORxFSg6fuwMw-_w
X-Proofpoint-ORIG-GUID: P3XNW46lHdbWyUp0pORxFSg6fuwMw-_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31448-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41E7BEB185
X-Rspamd-Action: no action

This patchset adds support for LPASS LPI pinctrl on monaco which is
compatible with SM8450.


Srinivas Kandagatla (2):
  dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add QCS8300 LPASS LPI
  arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl

 .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml   |  6 +++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi             | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.47.3


