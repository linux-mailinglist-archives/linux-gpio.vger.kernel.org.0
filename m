Return-Path: <linux-gpio+bounces-33124-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEO9LMpjsWnsugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33124-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:44:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C69263C66
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F34153145A09
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 12:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A7E3C5525;
	Wed, 11 Mar 2026 12:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLFnQhC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+1B79Bg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A628980F
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232957; cv=none; b=mUT5zQYYu9ldYLEVJsdAIcewzXIyCNud5PQp1qoUr97GrvJ+YliV+EJaPhwtYMG8dfTBOA2XeHWwcZ9srp8xb0p9gY0b7PGzJovvbvT9dLIK72e9fp7rQMYWB5it9iqlalIHpDTheoiog7EtEns6EsUoDG9xLaPS10YPZeEQIFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232957; c=relaxed/simple;
	bh=L9LmYv8a4KqOYPTP8d8MMLXR8hSAntUDeFVnT+a+4W0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dm7iXR/UWe3JiZiFUKybUHqrsQvKkRd+EK17q3aoqQhq6cB/sPKWVdqv0S0JE0MhYY4Xx+uRS+HvKnZ11nMO3s0dkPDJMJxvliJXXi4pneRMBaz4e0T3CP+moKMo1bC19Luo+tJ8cwf98dUVY5KndovyLQPk0QB4uhCqX1zpkEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLFnQhC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+1B79Bg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8Mt4o508377
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7zq6aMQv4ht5OAgkaxoMXFfhgHLYK4u99dx
	3juwPAiI=; b=ZLFnQhC1vw6usoyHbaQ9La7BX1TZW2nugk4l5AZsEKvnM+bGMX3
	q0QauuY5n3olqcg9NKxL8fDK6E34fPLt1dpGB+RYLZtp+ISvKc7hg6S2KGB2LeSo
	k4jnSFUGScjaNp1srN0wFdkNMpQTQlO0xEMbWeZgFQkxO5ErYIrGgPDTPqnLAwun
	/SRapH7cryM2YdGLl20w034FjDbws89SoLVONnz/JPKPoL81Q1uK6/ugWiaMFqef
	Ota3U3YxpGeHIfBWkFYsSeWWfr+IjI3v3DmASbcamviR7q+zszS7j3pFBMq54xq/
	kFCMrcpxtrepfoLeaVE0kHwaMaoXAorZwHw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppakv7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:42:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd81c571a5so1825922585a.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 05:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232955; x=1773837755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zq6aMQv4ht5OAgkaxoMXFfhgHLYK4u99dx3juwPAiI=;
        b=B+1B79BgSXs9CsXhJLdsKdhbTb3qfRfVIJDRX00vOQygMKIHrEMZgAhi7xCrDaIpXR
         /FXWgthaq9nFwYueM4qRQGsdqhKRNe5SM5dCN8lg3vSE0wluUpwVGvPY49FSitUpUELm
         0qh7kkWLNr66qnR4iokrpD9EvDfaOsNQqUr1E7X8lR8lLI0kGlCRUwN/vEZJ/qQT4eK6
         jQk69bkrJgs1p3zCijvfyeGF+sVeytpLFShrSHMjO9JHYtuOXxz2kqH93eXEWpzHjUCn
         20Yd1E1JfGsVat7oNptXMUWcPeOFxxRvdOSgp73JhbObHpWFbEUve4EvQRhCfpo0easZ
         paAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232955; x=1773837755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zq6aMQv4ht5OAgkaxoMXFfhgHLYK4u99dx3juwPAiI=;
        b=khyPPOxLDWJ7uKLU0cD0EiQ/DCIrc8oeNta0Ix7fVRJbedfwHuMxesePnxoA1ZMJZ1
         aTfKALoZ3OHaLrxByDHtrbta7ThKlRusSrpym4BkeAv9g6wtJryob5aDWGYDqALgrl/I
         sCVFDC8p0ZePkvTTIFUxCmWg1gQBaJ/L4xaalRDpMkvF99X5Dh6U5YCApQfAFnjChZWJ
         xNp8kDxuhgCxJRxV0hlrf4QcVQAeDmFdUPB+Y7UoLZDPkfHQoFwKlFJhAfRxMvCIMHQK
         j/5Ry96y2WfVGKKZBNjtXljAXJWWhd36ST9VnsXCVgfHaOcnHIkgjtQsshk6/fuToZBj
         iZzg==
X-Forwarded-Encrypted: i=1; AJvYcCXltr6rplAkX80KtX45cJ65XWhXqZz9gS/qYHvYJsdDxuivTmyf++tqkIKTrXbeiWPXOC4DRlgWiRku@vger.kernel.org
X-Gm-Message-State: AOJu0YzOutBm3rktX0RFoMtjMN2M60zS/pT2kFOTItQPu7WnLpBGiQvI
	mlvGfhQS2+7WupNFzPTx7aBL0xT8pYeIPscAJirGT9aUGuMUqwj6Oj6nEKW/36MYLa918XnCWKt
	Hlb9lmsdHdhYg8K/iaNMBNzeIs8GsduA66UXQuCFZ+MJpdJn9RKyAYXDj9nWaCKCJ
X-Gm-Gg: ATEYQzxOKY+q4Czb8+Fu+M9YmAO9lkfYRd0fjTlnlQTf8taHVgJybQ8yinweN4OcmLA
	mbhtOraqjCVqb/YtNIlNmyYQmOj9qThep60Z6GQK6iAqLdz+gbVfHdjk6BL45rdBs26xnaxZyh1
	lGH8AUS7MBnCq4Zi3hGSD4W7QXmKhqSXEcbg0JTIxCVKjaEcrggjbDl47yCXDh8Zhe3Q79P2gq3
	EipjAYrGOq/Ypv70aciEaOjIYzynPZN3ncGl4XOFmsrsnGfY6+cOXUTgXzCEPcAQhSi5M1JtV+N
	1fUbq2SMk3V+a3fs8skMq3lGsckE3/0GrUn3EbLfGPoD9AmiKSJyBsPibiq65qIu8De/yNHfByq
	9SeVMwQyM6qdvbkTIQjh92/2ysb2YKWBpWvx02BiP0Y9KcBlrhNXIQnA=
X-Received: by 2002:a05:620a:4083:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8cda1a19697mr275598685a.39.1773232954849;
        Wed, 11 Mar 2026 05:42:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4083:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8cda1a19697mr275596085a.39.1773232954429;
        Wed, 11 Mar 2026 05:42:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm39011365e9.6.2026.03.11.05.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:42:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: add glymur crd audio support
Date: Wed, 11 Mar 2026 12:42:27 +0000
Message-ID: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: saGf1gpfRIPsnvjiSL6QYnKfU3L0vadJ
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b1633b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=D19gQVrFAAAA:8
 a=NEAV23lmAAAA:8 a=6BfG5fDPucmGwNyM8DYA:9 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX5LW/7mcDxskP
 EJhbdIbc5wQ2uhdIlw4qvl7o40jz1gSZY0iPO6eng4UNjL01X5qoAk+w5M0XPE0x8fOUUvA726o
 zCxAi0rifdT/WM72kXjalA+YUq01GwOoGmY0BVb2p9K1jDvvX6Ku2+ueRjp5HyQByZ94NoX4Xlj
 fGU2mF6OxgJ+YDL6EZjo65YY15F/x7NRKrAbgYNd/96/cM+m8QUZzkQbJl9k2gg3pvq/z/rMm/Z
 onNuBOCgVR51x7/L6V2rl1GZglfxHYjzBsdDlJe4W73kbMFo+7lKnyva0EWzL6WPP+j0GJHFsHG
 Z4oeu/Rf2DEpnvEA6mPSDGWYaDJzFm21RahXsiE7Rwj3prxsqtgL9nhdKcHbYJMcAD4FH/h64V1
 2uAjFchOb8txIDvJl2qI0rQRsf4wNxhpeTyomPCAmFtF0xwfLEp7DDTMFawXP6U835kGohDubQS
 P46bhJXCMG8mJ/TAw8g==
X-Proofpoint-ORIG-GUID: saGf1gpfRIPsnvjiSL6QYnKfU3L0vadJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110107
X-Rspamd-Queue-Id: 15C69263C66
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33124-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,lkml.org:url];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This patchset adds support for speakers and dmic for glymur CRD device.
Along with the dts changes, a binding patch for lpass-lpi-pinctrl is
added in this series as DTB_CHECK will fail

Also this patchset depends on ADSP nodes patch series
 "PATCH V4 0/5] Enable ADSP and CDSP for Glymur SoC"
https://lkml.org/lkml/2026/3/10/271

Corresponding 
tplg file https://github.com/linux-msm/audioreach-topology/pull/53
ucm: https://github.com/alsa-project/alsa-ucm-conf/pull/713

Srinivas Kandagatla (3):
  dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add Glymur
    pinctrl
  arm64: dts: glymur: Add LPASS macro codecs and pinctrl
  arm64: dts: qcom: glymur-crd: add Audio sound card node

 .../qcom,sm8650-lpass-lpi-pinctrl.yaml        |   4 +-
 arch/arm64/boot/dts/qcom/glymur-crd.dts       | 110 ++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi          | 263 ++++++++++++++++++
 3 files changed, 376 insertions(+), 1 deletion(-)

-- 
2.47.3


