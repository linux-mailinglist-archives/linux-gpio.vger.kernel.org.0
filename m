Return-Path: <linux-gpio+bounces-40126-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I4nYHUyKV2pFWgAAu9opvQ
	(envelope-from <linux-gpio+bounces-40126-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:25:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B915A75EA61
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 15:25:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aA++a2B4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EIRUKrcd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40126-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40126-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5FBB30038DA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 13:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FE141DEE5;
	Wed, 15 Jul 2026 13:22:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014813438BD
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121729; cv=none; b=oXktnGjUC9K5dSUd6rpGO26+wUF5mz9hD3aC8XnZgTCgGI9SOAaSM4xurqWh/nrlW+W/A69wdd56LgpuaWKTg9L8ljPvNDjZkO5zjjhejqsV+zc5VIpyzqUOsJQOfJimyHZxeKH4GAy6TqKd8z4pHoN9UsUDDOgYbfeitgusspE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121729; c=relaxed/simple;
	bh=ByDHC8dtY78xRmzHX2yJ5VDKFyYEdCxJnLZpQM0rE0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ghs5L+7eKmSV/9rTTUaSp/0nnXOFHzREAWI/lnO8zFlrfAuby3Z4rUltU2C5xBVjECaHWuvCiTMmPGjdwHrBTJXoCCh5ZQO7Fby8JXjWVUCfPkPMScMKfRsB/DkPLc8bPIDYr47lMbCkoYHYm4zrYrh7+VHFvcXRh359SiMnS78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA++a2B4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIRUKrcd; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcifV3678321
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7L1Ymikwka8l5y8KgVBcA2
	btGkMRADHGPxoYKWS5su0=; b=aA++a2B4oR+5TMhPJjKCbwiNzCvzKJdW+g3vOI
	VtlyBxkaL75fG6jr+yN2KPKKXuylyCyu6hcnAOvK8W46wpMjMXBbYhyS6l8oJOa6
	CRwatgb4FEey2WlZSYTchZoh2ywzuxnw1nhI28ApHqGw9IifbYez401+8/uWIUfi
	HUvSWb+8hC9iOQL5uUtR14iV5xDnf8uTlI6ZlDDBgI0aR1w7xD/a3uImA2AdXND7
	aZNfsXNDTLB8nMed5o8Hnkr/1vz57LLtEgts5VkAZdrCK7jJ2dZor3UM0udXfM4r
	F/jU5lR/UUF9O45Prfow3IAyvmPGNfr6JAElTFdScds2Om+g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe65299s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 13:22:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f113592bf3so40370686d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121726; x=1784726526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7L1Ymikwka8l5y8KgVBcA2btGkMRADHGPxoYKWS5su0=;
        b=EIRUKrcd8KaRuxwSVW5xaovCuGsZSdQB8Vz0aXcaSiOOFf1e4+gJ/MJs1ejx8EysZU
         50mJ02qVjqoREu5QGvFUgU4uSD07hgsgg5g5hlWxPqEV8Es+2RhZb8jWlo7iyZjWpnoJ
         R/wE5B/IvSkUPuTE+p2MP0zM9tvnbhsZ44O8bmP6SWnMxX6APcVh4ILgyVl+46svB17e
         6Rx5qJ2ERAs7zZf891LxSmz8tGXov83AphyZ016T0XXxzSoxTEIywXFIw2/eNO6YG8bF
         QEsoLAlVjLiIlnuV0V8KCzdpAKjhkv/8vuIn2QGn6M9IY9kO8y3ejfn5dsucVZoo1w/k
         w9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121726; x=1784726526;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7L1Ymikwka8l5y8KgVBcA2btGkMRADHGPxoYKWS5su0=;
        b=KZ2IYQ363CBG5EZV8vc91rZWxylvPA1rWJiqVQkhZLgJETeGxzPw+j3ID+rqaG2doB
         C5jAxBFhM9VSoFPzB7Km+kt7XbrYDB0WEMrZL9p/VBHh+DZW/G8q5GLltbsNoi+kIcuw
         fg0nBc+Rgl+w/dFsSywIxGofcHyHaXS0Q6AyIgOnPVaBSyEKN+PsjrHOud8fzWw7iJUl
         XF8nFj8+oJ8jA8GaHj3vMNt1rauTSP6QALoDjnSU532r1Vdja5CN/L8AEhrYNm6wrTlD
         yNLFe6JXAAoHd5gGOJ0YryCFp2I7vuXRFzSOF1TKD7Q4ogYjDUzLOgA/iHu/HTSDLr+Y
         WkEw==
X-Forwarded-Encrypted: i=1; AHgh+RrCJOPw4exG0kQRvgeNLd2oENPSqxyIE/4+pbT6r73Nud5x/oCwZ6imH8uv1koxRHoiPRRHkGwjQoiL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8x2lH24LSMPFatdysY6BqaGAJzu6DGmDlztidhvlFFB00J0Fy
	TuANa/V5mLeUADr7R50XKHsp1RD9JRtooErBam1sQN90jEuGcnAuU1UbTKzCUOfQfuKat9Ov6BM
	ja988/U87ZOYk3IBDVCwjqB5XNK+A9tBqor0329KBx9E2Ldt6jVpX12ivdiKpnDOF
X-Gm-Gg: AfdE7clsGBUtfVuIy8UxZbJfxt31NxLtQqqCA/R/kuC/DneGj8fZf//ke7Rw4O6f6Ub
	GJTivl1EgAqTE3YlrOQLNaztSe/4zlF5nwnYWCnR/p2cPsTeJncqTaRPZncOvOkj/+y1IFsYFOp
	BoiGJUA0iJayZcH1WKKAzIbkRetNnomQcpigJnqIRx6ERcooRlB51TFT/luyWqncgMifdQGlmu/
	/cVQvII10aJtN9fmoOgTMdqNKUux/s9JWAiEtO8MlWRWQeKMRWgcZQOlZFVbKf8fNUTBkvjB2ln
	UqTtExgmESiW6zqCocPEIxCNepUQ2iAi4OmDVRSk/96v/OW5yjv0j4sbnBcAEROdJmuhTu0x4sv
	iZk5IaV1asspX+9CXCz1wE+n9bzZ2Xku8T9besVAE
X-Received: by 2002:a05:6214:1d2d:b0:8eb:1ffa:4e5a with SMTP id 6a1803df08f44-90400b8abccmr205223856d6.13.1784121725835;
        Wed, 15 Jul 2026 06:22:05 -0700 (PDT)
X-Received: by 2002:a05:6214:1d2d:b0:8eb:1ffa:4e5a with SMTP id 6a1803df08f44-90400b8abccmr205223546d6.13.1784121725395;
        Wed, 15 Jul 2026 06:22:05 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd56c4cd1sm192874866d6.16.2026.07.15.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:04 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
Date: Wed, 15 Jul 2026 18:51:48 +0530
Message-Id: <20260715132150.1322663-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX1HD6cCkqxyYg
 UpS2sUQV/4xgBX4nK00h51E1+fbijmgycwyewx/yqsNS03A39kBYyjGrTlaRpkR+jb5uUflSVUf
 AAmwLNzquMdJCJHg/lkxLYlJnWKAN65R2hyfD9S/m9FCZBim15F/GxDCiaGHU2osnCqlRc+/BWd
 KrqpJNUxmB1mgfu5pRLPD00DGK5fXZfnVo8W/yP3w9YbhdtbaCp0+/OIN/hZGJqV6vnVxVWGPpX
 Cs5BY0d3g8C+BHsef29Kx6UVtgTICd3rtYKrVjGQ8Ittj6pRBWKnNjOtCtORvCIY4/KKKXtOzi9
 sf2nS8j6F2k++RJADt/SYjbwV2xdu6PO+f9o5uJm5UcbuRrpoCdY2r+huRtXty+ga2YbNHBPn/x
 qkj9kLuKVQyTYeqANK2a2YsiRfX8ki9ToHphMB2wvyxf1dg1pN0qL3M/EaEDDBF94vIJBb7cpY1
 pleeER5dOfZ9UhTEU9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX+GjILZzW5D45
 PguBC8QzY9gyjQNizz+ouz1NzSMxhj+ltjzzVCt5YwbGTRnPH0sbMrfOLg3O7nktgivexqMTZYe
 rTnx5mSZ3HLTw1tudDFCrxNECln9T24=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a57897f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=2gB7WEHjjayKgNmZduoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: R7T5muNIHCiXTX5ZehQY-XtD4Y6wVXh1
X-Proofpoint-GUID: R7T5muNIHCiXTX5ZehQY-XtD4Y6wVXh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-40126-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B915A75EA61
X-Rspamd-Action: no action

Eliza is a Qualcomm SoC that uses the same LPASS LPI pin mux
functions as Milos. The key difference is the slew rate register
layout — on Eliza the slew rate field lives in the same GPIO config
register rather than a separate dedicated register.

This series adds support for the Eliza LPASS LPI pin controller by
extending the existing Milos driver with a new variant data struct
that uses the correct slew offsets and sets LPI_FLAG_SLEW_RATE_SAME_REG.
The pin descriptors and function table are shared with Milos since
they are identical.

Patch 1 updates the binding to document the new compatible and the
single reg entry used by Eliza.
Patch 2 adds the driver support.

Changes in v3:
- Fix enum compatible list to alphabetical order
  (qcom,eliza before qcom,milos)
  (Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>)
- Drop incorrect Reported-by/Closes tags
- Link to v2: https://lore.kernel.org/all/20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com/

Changes in v2:
- Use 'enum' instead of 'oneOf' + 'const' for compatible property
  (Reported-by: Rob Herring (Arm) <robh@kernel.org>,
   kernel test robot <lkp@intel.com>)
- Restore 'items' descriptions for reg property, drop redundant maxItems
  (Reported-by: Sashiko AI review)
- Link to v1: https://lore.kernel.org/all/20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com/

Ravi Hothi (2):
  dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
  pinctrl: qcom: milos-lpass-lpi: Add Eliza LPASS LPI TLMM

 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 18 ++++++++-
 .../pinctrl/qcom/pinctrl-milos-lpass-lpi.c    | 40 +++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)


base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
-- 
2.34.1


