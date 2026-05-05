Return-Path: <linux-gpio+bounces-36125-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NDCFU26+WmNBAMAu9opvQ
	(envelope-from <linux-gpio+bounces-36125-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:37:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A25264C9E50
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D91BD304203D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1363E329E4B;
	Tue,  5 May 2026 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c3PCpREu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGslGEGB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737513246FE
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973695; cv=none; b=ik7ae5Zwok7ZW9VrxyKFPlLGY8Sor3fAb05EcMeXJXSbysQ7GNR45WkGcn1kz7/4dia5i1CSkabm3nlxnqDaRkPxT5pccIklq8oNGgPeSHDS8EwT0TtUiiRJoGRRZaxPm2DLxZzhP53hcd6EwB1hXnI5A1pbj7oeQrnXR8Obdzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973695; c=relaxed/simple;
	bh=o9D9Zw2e3v9jjEe0WlnNjCKjS7ljgxEbcFShc2nwRJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAz7mQB3hImPexiWIla6DEM4JVvHs4bGdPjWC8Ksp/tmjP5hPblrbo8gEHr5Ll97r3rW57dFR9IQxtmMaN1PVvwdnBQeoBKorJ755AsBf3IQTglrkjI/VUhEWj7NBnSQ6ElFxS9e9o/1Vcwxqn93TZB7D56lBldyLcO8awB2BGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c3PCpREu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGslGEGB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455wOG1299881
	for <linux-gpio@vger.kernel.org>; Tue, 5 May 2026 09:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YAt88ACrK6ebceojmYiwgVZwSKwG7ByrdX+
	VSiLcbRI=; b=c3PCpREu0pCOTLFpMktvvXYLoSf9SIeYgt/gUZkFbPymV2Yj8sA
	Yk+8uhtnSFkDQe6nDsFFNcLABOzWhqY+hxMQO3h24lmbonneO+FlBt4LzeOzHLh6
	KZzbg2zwsKaDrBPDSnxLGDxoKC9HB1U9EyprnuoGs7ppsuSCZ+ZOsEHpqVPXdcW/
	yO/F8MA+TkJpb+okavMqJtES7aUbaLZHRivVBKv6o8bqN96SjCodXTTIKyQa94pE
	0ICnsHWJ5uIq/wIhk5fr8uKsgudUr7cOHlaQB9JSOhXkriUvLiyXRV1XXHTyxrD0
	xN0z2OGdmzwCJQ9BdpQkQfn4Qr0Y2/WOMdA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvndbsg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 09:34:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso140133961cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777973691; x=1778578491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAt88ACrK6ebceojmYiwgVZwSKwG7ByrdX+VSiLcbRI=;
        b=CGslGEGBriP8TiS0ARdjEaImW85aeMi6GBnmof+6FPckY+ii0xh0ZqabKIEEKG6cAO
         qFpfy8qheCBu+fcfPrX2p1o10XblzXp47zAHfZmb/chHj6SMd8P6DAH5VBuJV5UA2p6w
         wrLYsgTLfmlqNVS0ndukF20PrknQZ7sVtmJ78VdRKGAqEBMAK9wst4ezKfVM9hwwHhFO
         NhAH3ZuINlXzBZxUMWBSjz1v2d/DLBLFEKOa24kMCMHOSuQi6odBQ3t73pqIW5LACBwY
         ATV6PKT1RRGCjntj6YEdkr35yDewN4QvGoVm6h/Zxbc7Z/AYU8RqwzPpgD1FTryaPQs0
         /O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777973691; x=1778578491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAt88ACrK6ebceojmYiwgVZwSKwG7ByrdX+VSiLcbRI=;
        b=JHXq54aoHNmILc9IOU2aUelw6aTAuBc1uhfgG4hl43/1d9cNFmtmbYQmrKehZW76n5
         Ge5aYmtC+npuvr5GuzrVR9oLftI+C4VQRjuD8S/Fcfx+rcvCOCG9UcN70mrVCPSOvYBx
         cDO2E8ORVINff7orHZyp8P2sj4pxxWp+xnVY4utQy+L+isv9G3scIZXyFpnfqKFdb2E1
         4g7cKMbRftAVK+3tRau1loXVCjRmG8jdGoO4aF5VicT2wROnyfMBRITihaCZM+4TjsiC
         JMB9l9YCH9cF0/NlR8SID36UIigAXPZlARQAYc6rgaF11KJOqHjWrGEMJsWLVMFbZP5A
         9Svg==
X-Forwarded-Encrypted: i=1; AFNElJ8Fyi7ZauO8sDuU7pzIMEBmJna1NVmReNnA+syU4VLZlBQZ6vJYca1/UYGByp3ZXsHNSUIqiNjGdHhk@vger.kernel.org
X-Gm-Message-State: AOJu0YypKFfC5pudu7d8o4MWEAU8QmllwRJG1A/l0RlUxCm/4m+rHAW9
	9VqSygCo2VmJU3bKiY4MHSgDvlmREd6w63wPEN/ijnZzfKls9a7LOlkqyO6Tl/0Qfilvnvu7pxn
	1DS3ur7XzIGphw3sEfHFUmMEVHA07HXNOHWx8RLQickqRJoi1+YLsjZm+hN9QkCYv+JI86fbM
X-Gm-Gg: AeBDiesKWbvzip88pkerDxERugHZNJEhPRUNt/8df53q1F3qLAR6MLvwIflqffqQjGa
	A7uId8n8eP+ThWTAlaHblaw7BAGp4bOcgpYeCv4vh1nrWB9rgmwjgrl9hZrhdaOynCvrVp9H1IS
	bttmnD/rba5PfhT1Q9pvATPt5V6VV33K+kYnRWKKBUEr4aXzPQhY3l6W75DCKsIksxuW7WOYG1+
	sqfkTpK558uekv7qGMHciPviF4DmEH+ePpKHqRj/zZAqhnKCWyzC9NSbjVIX4F1YYiPSZ1kwrOU
	WMgoki2EZwMzE26S9HLJgbABeXI0fQh/A87l/4CJ9TaHtg7QHqekqVofdfB17PzbEiaFhRONF3h
	FEMijUwzDe+pVe6LSTW/SnFAmovmbV+WBz4zntkaio797V+o=
X-Received: by 2002:a05:622a:2484:b0:50f:b3d2:6edd with SMTP id d75a77b69052e-5104bf6b69bmr192016571cf.43.1777973690718;
        Tue, 05 May 2026 02:34:50 -0700 (PDT)
X-Received: by 2002:a05:622a:2484:b0:50f:b3d2:6edd with SMTP id d75a77b69052e-5104bf6b69bmr192016251cf.43.1777973690132;
        Tue, 05 May 2026 02:34:50 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm657001505e9.13.2026.05.05.02.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:34:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: qcom: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 11:34:45 +0200
Message-ID: <20260505093444.61336-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=33165; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=o9D9Zw2e3v9jjEe0WlnNjCKjS7ljgxEbcFShc2nwRJo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+bm0A1tXJfmjbx2zvFfyvo95f6h/p2uk39mML
 0z6f7+4M6GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafm5tAAKCRDBN2bmhouD
 1+1hD/9IvOvlYzlDsmZZaz3Jh9cob9i+jqmXcE1WDzTXNW4SMlHdlQ1iDxG4uK5+21TdvuH3c0J
 1wrfKiEZpHuhSchRaP07qxbgljMeZby/FY8NlCeNNZQLt6/ToNbyKRoo00C0aequzRFjtUOliEW
 8U2Y3s4S8ngCsIn30OPHawMRZbyfvcTmHh6IECUsgodxB2xNI4EKpTUfQsXLwSExUcnTcGevgUA
 0QW4f+NBieWNKaOsiNiqkZsJ7yfw7uqH98cKGIU9WQBjUsEpJbXBG5sx7l14VGftSmd3I5CDDdP
 eGX5AiyMiS61I228PeeIN0bMk5aWVIdCj3G1NSHIhwNMLRNdY1DZQxaca3l7VDnPnjPJU8cSOpt
 w5NaSmvGrIWfeOURQNL7JBl8INE+coK/fSO7CyhMnkp89tK8NiDrztx45bx5Cv4jvgHo3iIExFN
 Jx5Di3zcyeR8vMFJ15aPEE3lgHYl1+qm2koeT23gklRS3DkPhPcdunHzHOP7ukqbtflA3qocR0R
 3vcWzM42grZ22L/G08EUp/LoNDn5u9gim5Zz/4gmpFkfPRKt+JKnVUp0aOUBb4DrfPBaOwG7Nqt
 Cwi8aMJOv7GJ2dlnQEZpozFvA4CqXRiFJ+uC2bN/g7sR+ixm6lif80oJB2VtXxrpGgmDftYQiqu NlSiXXnxvKRG7Zg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xqpTGob7up5-C0R9SAD17dVuCwS6lZ7G
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f9b9bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=P9AO8p_xAAAA:8 a=LpQP-O61AAAA:8 a=IpJZQVW2AAAA:8 a=ihISPRCK7baVuPMuo1oA:9
 a=dawVfQjAaf238kedN5IG:22 a=BrxYzOUWrsNcVizivA99:22 a=pioyyrs4ZptJ924tMmac:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: xqpTGob7up5-C0R9SAD17dVuCwS6lZ7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4OCBTYWx0ZWRfX9SQPVdsSNeLt
 oxTXkA1E4M/G525NakIuK82j3k3zoPIJ9B3P1P36pLZKLBWirq4IYolWFZgAvmJdGaJEMqm88Hk
 d0ChoczRrgqlQXGZT+7GrRS0uYjjYXoAlC4l1ubbuFeAEqqiv3veLvfCqIK/tiKuvW46DuMrusX
 bcCxAPOJNcN9dC1Nfna0mSOvvLukqk+ywy992+WvQ0yn3D2Q6koh32soIWqFsXWNC2UX6shRlfa
 V/dttSIAWL72HqN19ruWrJ56UF0px0BPwrVvlW6M/GZyT59yrTqjw3J2X0XeJsX0WTm0iVGlIn/
 kN3QhlCUQzGl57vhLcbq1xYG3v7u3ylzu7al7kg/FGf5PSk01OcsFDI9wDym76UoXiJ/FwmAhYh
 hbdiLJwAZpE4t1r5uzd8B3sHQBxuSvFOMs9qTGw5AG6ZJncArbm31yJpCIHJGrxofZDerp5BI6a
 WfPQJUwZrJYfBOvA43Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050088
X-Rspamd-Queue-Id: A25264C9E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36125-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,baylibre.com:email,codeaurora.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sonymobile.com:email,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Some Qualcomm pin controller drivers already have this correctly placed,
so adjust the other drivers.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-apq8064.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-apq8084.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-eliza.c     | 2 +-
 drivers/pinctrl/qcom/pinctrl-glymur.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-hawi.c      | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq4019.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq6018.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8064.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-ipq8074.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9607.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-mdm9615.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-milos.c     | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8226.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8660.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8916.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8953.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8960.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8976.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8994.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8996.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8998.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm8x74.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcm2290.c   | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs404.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-qcs615.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7180.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm660.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdm845.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx55.c     | 2 +-
 drivers/pinctrl/qcom/pinctrl-sdx65.c     | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6115.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6125.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6350.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm6375.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8150.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8250.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8350.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8450.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8550.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8650.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-sm8750.c    | 2 +-
 drivers/pinctrl/qcom/pinctrl-x1e80100.c  | 2 +-
 44 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-apq8064.c b/drivers/pinctrl/qcom/pinctrl-apq8064.c
index 3654913f1ae5..a47f3d4f1ea5 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8064.c
@@ -622,6 +622,7 @@ static const struct of_device_id apq8064_pinctrl_of_match[] = {
 	{ .compatible = "qcom,apq8064-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, apq8064_pinctrl_of_match);
 
 static struct platform_driver apq8064_pinctrl_driver = {
 	.driver = {
@@ -646,4 +647,3 @@ module_exit(apq8064_pinctrl_exit);
 MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@sonymobile.com>");
 MODULE_DESCRIPTION("Qualcomm APQ8064 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, apq8064_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-apq8084.c b/drivers/pinctrl/qcom/pinctrl-apq8084.c
index 9fdbe6743512..e3c1f86aba7d 100644
--- a/drivers/pinctrl/qcom/pinctrl-apq8084.c
+++ b/drivers/pinctrl/qcom/pinctrl-apq8084.c
@@ -1198,6 +1198,7 @@ static const struct of_device_id apq8084_pinctrl_of_match[] = {
 	{ .compatible = "qcom,apq8084-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, apq8084_pinctrl_of_match);
 
 static struct platform_driver apq8084_pinctrl_driver = {
 	.driver = {
@@ -1221,4 +1222,3 @@ module_exit(apq8084_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm APQ8084 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, apq8084_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index c1f756cbcdeb..1eb690d07e18 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -1519,6 +1519,7 @@ static const struct of_device_id eliza_tlmm_of_match[] = {
 	{ .compatible = "qcom,eliza-tlmm", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, eliza_tlmm_of_match);
 
 static struct platform_driver eliza_tlmm_driver = {
 	.driver = {
@@ -1542,4 +1543,3 @@ module_exit(eliza_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI Eliza TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, eliza_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 9838c7839923..20f076e59375 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -1777,6 +1777,7 @@ static const struct of_device_id glymur_tlmm_of_match[] = {
 	{ .compatible = "qcom,mahua-tlmm", .data = &mahua_tlmm },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, glymur_tlmm_of_match);
 
 static int glymur_tlmm_probe(struct platform_device *pdev)
 {
@@ -1811,4 +1812,3 @@ module_exit(glymur_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI Glymur TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, glymur_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-hawi.c b/drivers/pinctrl/qcom/pinctrl-hawi.c
index 5c7894f3b9cb..cdde69e954a7 100644
--- a/drivers/pinctrl/qcom/pinctrl-hawi.c
+++ b/drivers/pinctrl/qcom/pinctrl-hawi.c
@@ -1584,6 +1584,7 @@ static const struct of_device_id hawi_tlmm_of_match[] = {
 	{ .compatible = "qcom,hawi-tlmm", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, hawi_tlmm_of_match);
 
 static struct platform_driver hawi_tlmm_driver = {
 	.driver = {
@@ -1607,4 +1608,3 @@ module_exit(hawi_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI Hawi TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, hawi_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq4019.c b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
index 05fdd73b951e..adf7c8631f72 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq4019.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq4019.c
@@ -702,6 +702,7 @@ static const struct of_device_id ipq4019_pinctrl_of_match[] = {
 	{ .compatible = "qcom,ipq4019-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, ipq4019_pinctrl_of_match);
 
 static struct platform_driver ipq4019_pinctrl_driver = {
 	.driver = {
@@ -725,4 +726,3 @@ module_exit(ipq4019_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm ipq4019 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, ipq4019_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
index cc83f9362a85..9a42e343ff17 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq6018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -1072,6 +1072,7 @@ static const struct of_device_id ipq6018_pinctrl_of_match[] = {
 	{ .compatible = "qcom,ipq6018-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, ipq6018_pinctrl_of_match);
 
 static struct platform_driver ipq6018_pinctrl_driver = {
 	.driver = {
@@ -1095,4 +1096,3 @@ module_exit(ipq6018_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI ipq6018 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, ipq6018_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8064.c b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
index 0a9e357e64c6..78d320d56be6 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8064.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8064.c
@@ -624,6 +624,7 @@ static const struct of_device_id ipq8064_pinctrl_of_match[] = {
 	{ .compatible = "qcom,ipq8064-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, ipq8064_pinctrl_of_match);
 
 static struct platform_driver ipq8064_pinctrl_driver = {
 	.driver = {
@@ -648,4 +649,3 @@ module_exit(ipq8064_pinctrl_exit);
 MODULE_AUTHOR("Andy Gross <agross@codeaurora.org>");
 MODULE_DESCRIPTION("Qualcomm IPQ8064 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, ipq8064_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index 64ce8ea8f544..0b95f52adcc3 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -1033,6 +1033,7 @@ static const struct of_device_id ipq8074_pinctrl_of_match[] = {
 	{ .compatible = "qcom,ipq8074-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, ipq8074_pinctrl_of_match);
 
 static struct platform_driver ipq8074_pinctrl_driver = {
 	.driver = {
@@ -1056,4 +1057,3 @@ module_exit(ipq8074_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm ipq8074 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, ipq8074_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index 5cc45b9c55ab..e95ac064b84c 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -1774,6 +1774,7 @@ static const struct of_device_id kaanapali_tlmm_of_match[] = {
 	{ .compatible = "qcom,kaanapali-tlmm",},
 	{},
 };
+MODULE_DEVICE_TABLE(of, kaanapali_tlmm_of_match);
 
 static struct platform_driver kaanapali_tlmm_driver = {
 	.driver = {
@@ -1797,4 +1798,3 @@ module_exit(kaanapali_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI Kaanapali TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, kaanapali_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9607.c b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
index 5794b0a11010..ce61eb415755 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9607.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9607.c
@@ -1050,6 +1050,7 @@ static const struct of_device_id mdm9607_pinctrl_of_match[] = {
 	{ .compatible = "qcom,mdm9607-tlmm", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, mdm9607_pinctrl_of_match);
 
 static struct platform_driver mdm9607_pinctrl_driver = {
 	.driver = {
@@ -1073,4 +1074,3 @@ module_exit(mdm9607_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm mdm9607 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, mdm9607_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-mdm9615.c b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
index 729fe3d7e14e..f87e4d9a8f4f 100644
--- a/drivers/pinctrl/qcom/pinctrl-mdm9615.c
+++ b/drivers/pinctrl/qcom/pinctrl-mdm9615.c
@@ -439,6 +439,7 @@ static const struct of_device_id mdm9615_pinctrl_of_match[] = {
 	{ .compatible = "qcom,mdm9615-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, mdm9615_pinctrl_of_match);
 
 static struct platform_driver mdm9615_pinctrl_driver = {
 	.driver = {
@@ -463,4 +464,3 @@ module_exit(mdm9615_pinctrl_exit);
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_DESCRIPTION("Qualcomm MDM9615 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, mdm9615_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-milos.c b/drivers/pinctrl/qcom/pinctrl-milos.c
index 74b5253257af..f5079a0ce0a3 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos.c
@@ -1310,6 +1310,7 @@ static const struct of_device_id milos_tlmm_of_match[] = {
 	{ .compatible = "qcom,milos-tlmm" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, milos_tlmm_of_match);
 
 static struct platform_driver milos_tlmm_driver = {
 	.driver = {
@@ -1333,4 +1334,3 @@ module_exit(milos_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI Milos TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, milos_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8226.c b/drivers/pinctrl/qcom/pinctrl-msm8226.c
index d27b7599ea83..6f02e7c2499e 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8226.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8226.c
@@ -645,6 +645,7 @@ static const struct of_device_id msm8226_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8226-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8226_pinctrl_of_match);
 
 static struct platform_driver msm8226_pinctrl_driver = {
 	.driver = {
@@ -669,4 +670,3 @@ module_exit(msm8226_pinctrl_exit);
 MODULE_AUTHOR("Bartosz Dudziak <bartosz.dudziak@snejp.pl>");
 MODULE_DESCRIPTION("Qualcomm MSM8226 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8226_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8660.c b/drivers/pinctrl/qcom/pinctrl-msm8660.c
index 5ded00396cd9..5b28a1c21a88 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8660.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8660.c
@@ -974,6 +974,7 @@ static const struct of_device_id msm8660_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8660-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8660_pinctrl_of_match);
 
 static struct platform_driver msm8660_pinctrl_driver = {
 	.driver = {
@@ -998,4 +999,3 @@ module_exit(msm8660_pinctrl_exit);
 MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@sonymobile.com>");
 MODULE_DESCRIPTION("Qualcomm MSM8660 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8660_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8916.c b/drivers/pinctrl/qcom/pinctrl-msm8916.c
index 709c5d1d4d0a..d115035ff96a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8916.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8916.c
@@ -960,6 +960,7 @@ static const struct of_device_id msm8916_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8916-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8916_pinctrl_of_match);
 
 static struct platform_driver msm8916_pinctrl_driver = {
 	.driver = {
@@ -983,4 +984,3 @@ module_exit(msm8916_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm msm8916 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8916_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8953.c b/drivers/pinctrl/qcom/pinctrl-msm8953.c
index 02ea89f5feaa..d537fdaae148 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8953.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8953.c
@@ -1807,6 +1807,7 @@ static const struct of_device_id msm8953_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8953-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8953_pinctrl_of_match);
 
 static struct platform_driver msm8953_pinctrl_driver = {
 	.driver = {
@@ -1830,4 +1831,3 @@ module_exit(msm8953_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI msm8953 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8953_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8960.c b/drivers/pinctrl/qcom/pinctrl-msm8960.c
index 2fb15208aba0..a373150468ca 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8960.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8960.c
@@ -1239,6 +1239,7 @@ static const struct of_device_id msm8960_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8960-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8960_pinctrl_of_match);
 
 static struct platform_driver msm8960_pinctrl_driver = {
 	.driver = {
@@ -1263,4 +1264,3 @@ module_exit(msm8960_pinctrl_exit);
 MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@sonymobile.com>");
 MODULE_DESCRIPTION("Qualcomm MSM8960 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8960_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
index 906a90778b97..bba3c87d8144 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
@@ -1087,6 +1087,7 @@ static const struct of_device_id msm8976_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8976-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8976_pinctrl_of_match);
 
 static struct platform_driver msm8976_pinctrl_driver = {
 	.driver = {
@@ -1110,4 +1111,3 @@ module_exit(msm8976_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm msm8976 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8976_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8994.c b/drivers/pinctrl/qcom/pinctrl-msm8994.c
index ecbe6b91d1da..fdaa67c5869f 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8994.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8994.c
@@ -1334,6 +1334,7 @@ static const struct of_device_id msm8994_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8994-pinctrl", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, msm8994_pinctrl_of_match);
 
 static struct platform_driver msm8994_pinctrl_driver = {
 	.driver = {
@@ -1357,4 +1358,3 @@ module_exit(msm8994_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm MSM8994 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8994_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8996.c b/drivers/pinctrl/qcom/pinctrl-msm8996.c
index 73b07a10a957..332b18a8fa9c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8996.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8996.c
@@ -1911,6 +1911,7 @@ static const struct of_device_id msm8996_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8996-pinctrl", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, msm8996_pinctrl_of_match);
 
 static struct platform_driver msm8996_pinctrl_driver = {
 	.driver = {
@@ -1934,4 +1935,3 @@ module_exit(msm8996_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm msm8996 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8996_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8998.c b/drivers/pinctrl/qcom/pinctrl-msm8998.c
index dcf11b79e562..0552c8212b29 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8998.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8998.c
@@ -1525,6 +1525,7 @@ static const struct of_device_id msm8998_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8998-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8998_pinctrl_of_match);
 
 static struct platform_driver msm8998_pinctrl_driver = {
 	.driver = {
@@ -1548,4 +1549,3 @@ module_exit(msm8998_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI msm8998 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8998_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm8x74.c b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
index ff432ec5815a..9422629ec6ca 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm8x74.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm8x74.c
@@ -1073,6 +1073,7 @@ static const struct of_device_id msm8x74_pinctrl_of_match[] = {
 	{ .compatible = "qcom,msm8974-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, msm8x74_pinctrl_of_match);
 
 static struct platform_driver msm8x74_pinctrl_driver = {
 	.driver = {
@@ -1097,5 +1098,4 @@ module_exit(msm8x74_pinctrl_exit);
 MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@sonymobile.com>");
 MODULE_DESCRIPTION("Qualcomm MSM8x74 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, msm8x74_pinctrl_of_match);
 
diff --git a/drivers/pinctrl/qcom/pinctrl-qcm2290.c b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
index 3b28ac498885..d20b5bd329fb 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcm2290.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcm2290.c
@@ -1124,6 +1124,7 @@ static const struct of_device_id qcm2290_pinctrl_of_match[] = {
 	{ .compatible = "qcom,qcm2290-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, qcm2290_pinctrl_of_match);
 
 static struct platform_driver qcm2290_pinctrl_driver = {
 	.driver = {
@@ -1147,4 +1148,3 @@ module_exit(qcm2290_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI QCM2290 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, qcm2290_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs404.c b/drivers/pinctrl/qcom/pinctrl-qcs404.c
index 1048a7093b2e..01c0f0b2839a 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs404.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs404.c
@@ -1635,6 +1635,7 @@ static const struct of_device_id qcs404_pinctrl_of_match[] = {
 	{ .compatible = "qcom,qcs404-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, qcs404_pinctrl_of_match);
 
 static struct platform_driver qcs404_pinctrl_driver = {
 	.driver = {
@@ -1658,4 +1659,3 @@ module_exit(qcs404_pinctrl_exit);
 
 MODULE_DESCRIPTION("Qualcomm QCS404 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, qcs404_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 0ed4332d989e..9b4b95771d0b 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -1073,6 +1073,7 @@ static const struct of_device_id qcs615_tlmm_of_match[] = {
 	},
 	{},
 };
+MODULE_DEVICE_TABLE(of, qcs615_tlmm_of_match);
 
 static int qcs615_tlmm_probe(struct platform_device *pdev)
 {
@@ -1101,4 +1102,3 @@ module_exit(qcs615_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI QCS615 TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, qcs615_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 01cfcb416f33..a02a9a78a557 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1148,6 +1148,7 @@ static const struct of_device_id sc7180_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sc7180-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sc7180_pinctrl_of_match);
 
 static struct platform_driver sc7180_pinctrl_driver = {
 	.driver = {
@@ -1172,4 +1173,3 @@ module_exit(sc7180_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sc7180 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sc7180_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index f22fd56efd89..bb32a56649df 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1494,6 +1494,7 @@ static const struct of_device_id sc7280_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sc7280-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sc7280_pinctrl_of_match);
 
 static struct platform_driver sc7280_pinctrl_driver = {
 	.driver = {
@@ -1518,4 +1519,3 @@ module_exit(sc7280_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sc7280 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sc7280_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660.c b/drivers/pinctrl/qcom/pinctrl-sdm660.c
index ab0368653d30..c4a1ec90a341 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660.c
@@ -1433,6 +1433,7 @@ static const struct of_device_id sdm660_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sdm630-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sdm660_pinctrl_of_match);
 
 static struct platform_driver sdm660_pinctrl_driver = {
 	.driver = {
@@ -1456,4 +1457,3 @@ module_exit(sdm660_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sdm660 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sdm660_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm845.c b/drivers/pinctrl/qcom/pinctrl-sdm845.c
index b5ed2311b70e..48fbe3623e17 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm845.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm845.c
@@ -1339,6 +1339,7 @@ static const struct of_device_id sdm845_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sdm845-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sdm845_pinctrl_of_match);
 
 static struct platform_driver sdm845_pinctrl_driver = {
 	.driver = {
@@ -1364,4 +1365,3 @@ module_exit(sdm845_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sdm845 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sdm845_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
index 3e87f5927924..656a0726db92 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
@@ -981,6 +981,7 @@ static const struct of_device_id sdx55_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sdx55-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sdx55_pinctrl_of_match);
 
 static struct platform_driver sdx55_pinctrl_driver = {
 	.driver = {
@@ -1004,4 +1005,3 @@ module_exit(sdx55_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sdx55 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sdx55_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sdx65.c b/drivers/pinctrl/qcom/pinctrl-sdx65.c
index 4e787341b2a2..dde8993ca9b1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdx65.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdx65.c
@@ -929,6 +929,7 @@ static const struct of_device_id sdx65_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sdx65-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sdx65_pinctrl_of_match);
 
 static struct platform_driver sdx65_pinctrl_driver = {
 	.driver = {
@@ -952,4 +953,3 @@ module_exit(sdx65_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sdx65 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sdx65_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115.c b/drivers/pinctrl/qcom/pinctrl-sm6115.c
index 234451fbf47b..e36716514f1f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115.c
@@ -897,6 +897,7 @@ static const struct of_device_id sm6115_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm6115-tlmm", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, sm6115_tlmm_of_match);
 
 static struct platform_driver sm6115_tlmm_driver = {
 	.driver = {
@@ -920,4 +921,3 @@ module_exit(sm6115_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI sm6115 tlmm driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sm6115_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6125.c b/drivers/pinctrl/qcom/pinctrl-sm6125.c
index 2cf9136860fc..7447ef9a4931 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6125.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6125.c
@@ -1256,6 +1256,7 @@ static const struct of_device_id sm6125_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm6125-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm6125_tlmm_of_match);
 
 static struct platform_driver sm6125_tlmm_driver = {
 	.driver = {
@@ -1279,4 +1280,3 @@ module_exit(sm6125_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI sm6125 TLMM driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sm6125_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6350.c b/drivers/pinctrl/qcom/pinctrl-sm6350.c
index eb8cd4aa8a97..4089c96ff736 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6350.c
@@ -1363,6 +1363,7 @@ static const struct of_device_id sm6350_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm6350-tlmm" },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm6350_tlmm_of_match);
 
 static struct platform_driver sm6350_tlmm_driver = {
 	.driver = {
@@ -1386,4 +1387,3 @@ module_exit(sm6350_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI SM6350 TLMM driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sm6350_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6375.c b/drivers/pinctrl/qcom/pinctrl-sm6375.c
index d4547dd9f21f..8da71d940b90 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6375.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6375.c
@@ -1506,6 +1506,7 @@ static const struct of_device_id sm6375_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm6375-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm6375_tlmm_of_match);
 
 static struct platform_driver sm6375_tlmm_driver = {
 	.driver = {
@@ -1529,4 +1530,3 @@ module_exit(sm6375_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI SM6375 TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, sm6375_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 0767261f5149..3c29de948034 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1532,6 +1532,7 @@ static const struct of_device_id sm8150_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sm8150-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm8150_pinctrl_of_match);
 
 static struct platform_driver sm8150_pinctrl_driver = {
 	.driver = {
@@ -1555,4 +1556,3 @@ module_exit(sm8150_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sm8150 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sm8150_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index f73f3b052de4..abf5f68ef62f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -1354,6 +1354,7 @@ static const struct of_device_id sm8250_pinctrl_of_match[] = {
 	{ .compatible = "qcom,sm8250-pinctrl", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm8250_pinctrl_of_match);
 
 static struct platform_driver sm8250_pinctrl_driver = {
 	.driver = {
@@ -1377,4 +1378,3 @@ module_exit(sm8250_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI sm8250 pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sm8250_pinctrl_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index 377ddfc77e4f..8bd278c97171 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -1632,6 +1632,7 @@ static const struct of_device_id sm8350_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm8350-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm8350_tlmm_of_match);
 
 static struct platform_driver sm8350_tlmm_driver = {
 	.driver = {
@@ -1655,4 +1656,3 @@ module_exit(sm8350_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI SM8350 TLMM driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sm8350_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450.c b/drivers/pinctrl/qcom/pinctrl-sm8450.c
index a1d84074ea49..8ca5b6e15e6c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450.c
@@ -1667,6 +1667,7 @@ static const struct of_device_id sm8450_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm8450-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, sm8450_tlmm_of_match);
 
 static struct platform_driver sm8450_tlmm_driver = {
 	.driver = {
@@ -1690,4 +1691,3 @@ module_exit(sm8450_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI SM8450 TLMM driver");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(of, sm8450_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550.c b/drivers/pinctrl/qcom/pinctrl-sm8550.c
index cc8fbf4d5e84..d12256d970a0 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550.c
@@ -1752,6 +1752,7 @@ static const struct of_device_id sm8550_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm8550-tlmm", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sm8550_tlmm_of_match);
 
 static struct platform_driver sm8550_tlmm_driver = {
 	.driver = {
@@ -1775,4 +1776,3 @@ module_exit(sm8550_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI SM8550 TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, sm8550_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index ab41292e3b4e..cf57d226c47f 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -1732,6 +1732,7 @@ static const struct of_device_id sm8650_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm8650-tlmm", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sm8650_tlmm_of_match);
 
 static struct platform_driver sm8650_tlmm_driver = {
 	.driver = {
@@ -1755,4 +1756,3 @@ module_exit(sm8650_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI SM8650 TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, sm8650_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
index 4cfe73f30fac..f27e55c088d5 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8750.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8750.c
@@ -1701,6 +1701,7 @@ static const struct of_device_id sm8750_tlmm_of_match[] = {
 	{ .compatible = "qcom,sm8750-tlmm", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, sm8750_tlmm_of_match);
 
 static struct platform_driver sm8750_tlmm_driver = {
 	.driver = {
@@ -1724,4 +1725,3 @@ module_exit(sm8750_tlmm_exit);
 
 MODULE_DESCRIPTION("QTI SM8750 TLMM driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, sm8750_tlmm_of_match);
diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index a9fe75fc45e5..8d2b8246170b 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1851,6 +1851,7 @@ static const struct of_device_id x1e80100_pinctrl_of_match[] = {
 	{ .compatible = "qcom,x1e80100-tlmm", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, x1e80100_pinctrl_of_match);
 
 static struct platform_driver x1e80100_pinctrl_driver = {
 	.driver = {
@@ -1874,4 +1875,3 @@ module_exit(x1e80100_pinctrl_exit);
 
 MODULE_DESCRIPTION("QTI X1E80100 TLMM pinctrl driver");
 MODULE_LICENSE("GPL");
-MODULE_DEVICE_TABLE(of, x1e80100_pinctrl_of_match);
-- 
2.51.0


