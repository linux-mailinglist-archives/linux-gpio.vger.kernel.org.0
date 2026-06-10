Return-Path: <linux-gpio+bounces-38276-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id spMzMI6RKWoXZwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38276-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:32:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C966B7FD
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 18:32:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bf7lCs4I;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38276-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38276-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35B2735AB2A2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA1643901B;
	Wed, 10 Jun 2026 15:57:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23DB4218B8;
	Wed, 10 Jun 2026 15:57:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107044; cv=none; b=bI9/gXNWwiuxh7zLmhbP9HQOabw/N5Rwqwzm87rjE8tCGzGQqm4BqHLZtrUXGBNGC+gbAiJ4S94+RMyE15eeRNSmc4UB3wUWAjqqLCn2gE+FAewDMYJqloL+523EDkpc9VRDzmJwIpoRuuJ89+GET41ky3T6N1RofG/KiWm5VUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107044; c=relaxed/simple;
	bh=h7P53uFc7SEJfNucfm32xC+ai27BRGWxdMVNGS9lDvg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dBDlCL+OoD4Hr3fFlI4I9+CFK6YsoRaPU9B14PIfWWssllaH+s+Mp4xcezcczhAECnlChGW3HQ55zB355FQabBaR12gRP7uR1237NXwzgLiuP8ST3vSJyTSQe5J56d1WNXBZC5Z9/cGioie4tbkrb3o0kSQ9LDsUweqAc/hE36E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bf7lCs4I; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBl4u1072714;
	Wed, 10 Jun 2026 15:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pZg/Ji48yUD3zYDdKhobPrwg5IvsJ9Q+xFZ
	UIdUe2DU=; b=bf7lCs4IJNhyOJlRTTLkE8t/y7hoLkLxWFyxGC9uGrItRM60miu
	5gcotUSYHXIIBDu/tv4cy9FYbnLntqQ3MGcpFcXoFE8RhJEa22vqEtXiWKdiTfkH
	hc4bp/PNCBtczc3iENy0FhXW9kOY5WbuuflaRBZaTlHan+/Bi8dKtnDywWM4Z1Vx
	+VVu0RDSr2MZ5JbP5CmxhHbMlwnD/h9Ru1wCWeDY0/BoXCNQX5yCShSSsQljIUZB
	V91Nr5ocJ0obJAZXAQ/e8GkHUkxRuUELATg68qJeFj9ZtBlnHxjMw2k+ubEnXydj
	r8vaMLgykr31GCe+BOz3Ug9aOkXP6sdZ3Gw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvk2kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:57:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFvBXG017570;
	Wed, 10 Jun 2026 15:57:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7k8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:57:11 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFvBmc017555;
	Wed, 10 Jun 2026 15:57:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFvBP9017551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:57:11 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 3CB85631; Wed, 10 Jun 2026 21:27:10 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: add Qualcomm WSA885X I2C codec support
Date: Wed, 10 Jun 2026 21:27:06 +0530
Message-Id: <20260610155708.151067-1-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: t8U3yd8vn43CmP1jDHN33ETq7bNw3sLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE1MSBTYWx0ZWRfX/J5Q7VBVVW6J
 DrBLUsg8+w8S68FQ9oalqBGlwsHGpDL8x1oLrDiN7VPU825m+3fUp3BGCyDPxLrPi/++lCj/CCq
 fy1LGIqR7i7z52JaaopL7eQmZEIZ3NVTgEMnNNKoqrm2Ez45C/rfvR27cWT2qddFpgbR7xFBgWU
 kgFnCAxZVvPP01dVjDNcznTziUZgVrlAtefZxyzcfJqYrfadNIdfNq1y8zw0KePYvQulOH/l652
 yzCE6P1pYb3OxVek2XXTRoHaScnbFERrTo4O5wC/0OBZiAIAxcCKfuFJ6xPewcx6ZtWYarOgsaD
 +VfpcWbIY2U7054ZeW8XXHcqxYowk/qc1VlcN5AqQfG4mZoj+kJIm3qNU0uhm182Vi2t9XaruUs
 0jwiQcg34A0CUwF2KtUxqODWt2rpbsNxh+t1cRHyP+9Lcqh7F4vMy1pzH3QX8Svw8mB3vJifZbv
 hPie6VNAHi7mcqiP3cA==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a29895c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=izUB74xbDtXez7lD44YA:9
X-Proofpoint-ORIG-GUID: t8U3yd8vn43CmP1jDHN33ETq7bNw3sLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38276-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linusw@kernel.org,m:brgl@kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F4C966B7FD

Add support for the Qualcomm WSA885X smart speaker amplifier accessed
over I2C.

The series first documents the qcom,wsa885x-i2c devicetree binding,
including supplies, GPIOs, battery configuration, and the init-table
data used during codec initialization.

It then adds the ASoC codec driver with register programming, serial
interface setup, clock handling, mute and gain control, reset handling,
interrupt support, runtime TDM slot-count configuration, and stream-time
power-state sequencing.

validated speaker playback on Shikra and Hawi platforms.

Prasad Kumpatla (2):
  dt-bindings: sound: add qcom,wsa885x-i2c
  ASoC: codecs: add Qualcomm WSA885X I2C codec driver

 .../bindings/sound/qcom,wsa885x-i2c.yaml      |   89 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa885x-i2c.c                | 1643 +++++++++++++++++
 4 files changed, 1745 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa885x-i2c.yaml
 create mode 100644 sound/soc/codecs/wsa885x-i2c.c


base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
-- 
2.34.1


