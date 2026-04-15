Return-Path: <linux-gpio+bounces-35166-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG9COPt232ljTQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35166-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:31:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB428403CD3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 13:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5EBFE304C477
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A60CA37B415;
	Wed, 15 Apr 2026 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmIWpX0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnPBc1+w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDF237C91F
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252584; cv=none; b=UBatgZWnfrIT6izr+GMA8TbC2D4qPqWw7iWGa1hT8UWyOXAblvyxMkE9eGNz0+jVbmfD+R2cgXhSRs3wNwNTWXxv7oGXRW9vXHLQOsf4rgp8PFudwVJatik860udxeVMiqYtckDsAcz2ZOID4j+FXLwzJZYy6zPJSidkcmXqRTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252584; c=relaxed/simple;
	bh=zkTj1FPBTPay2KEYBi9VK1EONkKuBT3XGTuds7WjW4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=alKAFwGMLxlMwApBzKczMQRsnhm4O/E5fY4FRVLZ3JMJkW34BK8lMA5mAWJzfPyIOIOWPBng6K53Cj454JyZKH4fLYrLRrhhhCeasTe1S3QMrI6w7m+ympCMDiuoKSrRLfmdK2geCrRw2MhM6oIR0ZAtPeokphtfncB5JhfCtf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmIWpX0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnPBc1+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F5xRTa2773224
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MvJqQNQOqBECWN6GQMmqlr
	hF5/Geu/mthKKLlru98gk=; b=ZmIWpX0RnxT48IdcKUnQ+i1bqGgW77TDmA5m4S
	VtEfxVwA5r8WgE1UZWPN0mXL/VWkyD8W7/jzLWS2MlinOYXZNB7TaXxRC8G0W1QU
	BRvv+jAaAIF258zVGwqBhY0a0Zdcfs+PzFquPE8JACPGO9PnSAf68NL73hn1uCse
	HCxfCpXV49jp66/xlzhpbA1Jug1Bffgjw/RvpuxffWYKvm988HsvVRMUm2Gf0V3r
	6ENMn/dJwvdfeq82+VHxXgQ8I91J0ECFenFP1HkvtbS5/WGnK6nuGJ+/T6oq8Y0u
	/v8BBXCKI+Cgint9cntsZRb7DNhOfox/30ABJN0cwMgHAOTw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj50v14xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7691378914so3195929a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Apr 2026 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252581; x=1776857381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MvJqQNQOqBECWN6GQMmqlrhF5/Geu/mthKKLlru98gk=;
        b=TnPBc1+wQcradvZgvJ3gP0PifJHUkO+28oCmrkvbiIPRCnqsjyrZgQkAAul0nFs68I
         Kr+yxqY4t9clu9jjLfhr6y3DS9SPmszEiluEiJT3yKT7d9jGSOO9Z2rftbYjZRgND2QW
         H7DTLFEC2aLwNn9qVYtemdrqBDI5MV3bBNoGPnpLpnLasT0XQa4d5EMSiq1g1SYvOfLe
         AQa8nSnF19Y/1R+NuesaIWKmZ3F+3T1IlyX44BE8WhyX6wjbp9SDvCN/fSkIGf+4/xRP
         yix0h9aVLLTJteGmbNlV9FMPQ6v6wMg+F1FNUmrX4XpM1iihYYu9Rszs49ntnWWq917D
         4GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252581; x=1776857381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvJqQNQOqBECWN6GQMmqlrhF5/Geu/mthKKLlru98gk=;
        b=ad7PPn1T+Ge2HMuEDmfmQWRPrKp0gs4/To/1Bx9L2vZpygaGLwSfxeTJCt0Ms7e0ZM
         hlhtXe8uRDhQHqiPP/g+Y7LftI2o4YAujJUq60Mnz59NIumMMdqNzTpmCRG6iG5l6wyT
         UoaRKao4SAxgelyxvj1Gbw6hRF23jVIuamOdg6KDjzrmwopOInvXkAPM22WVypFfCHUk
         /7mkSzE/OIUJVaOtZJqo3pZqz/DYzEE/MOEmg0j0khuMILV+kPo6wjR2GhyVvC+fmoNE
         IATs74IMch127dpjdZAWxr1m2Hq6ozrDfYwytFxIng/CEvWFtsg4o6ZHY9RfW7KgVN/i
         SrhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xQrhtvVaMxs6gKeY217U1S/fVhJoWO8YRRp0mH2UBudfoG+JTBXBRca1UDo9DZhJdAC/68H/VZy37@vger.kernel.org
X-Gm-Message-State: AOJu0YwiD4wT0ntmeTLm3+oxuJV9tgCC+lqg9fNJNo0G1P1GnpL9HGjT
	IWiNh5UUh8unJ4LDkWgn1w8UK241Rr8dymImfY41nZpYUIpMvSNhD7uYnogCCNd2hFgflrIgN/7
	wwf8EGtSK8whtSNeW1qgMcL1zVdtseVM7hvlPBph2OahbnbayrmoWpP1+UbEpyJSH
X-Gm-Gg: AeBDiesDTnfBGQtfDCDiTZC/3d7ctr10z7baMZGJFYFoRAughVwcFk1A7i2RoZqBci8
	e6OL7/2A9+M3IN9uIn+mm5crWtbDVL1Z5A0egs95BZNU9PfcPAS3Hjy8gEk0sA/GHUIRbPYi+35
	k4Yrw2Ckq8mji8pmo0zqxdirbbNz/28OdvV4o+UboEw1YevpIXR5fqSjNAanGe4bha4R7B4pboZ
	hmWPJfpJkSKpt3W2QQftb5y8j1krFl5QnJGx4Bm2G080adJvOeX6RhANDRj5fpMTFQdhMlFr5vv
	WdU8SSQjtZW6sBg87TEWCP1zSd31ZLuEMJMGIr2Uq+rZXuoD12cVeIhoYp6Utab6k7mHoH7O0Ta
	iE5pqXkowmCRAnpho0xQho7rFQmD+Ali41hApeBx1kZVcl6VA7c2mMZ7K1DVGzL2Yrw2sCGz61h
	bb0ihB64utyEYLGTtWKndaI/tii809AecYNfW/ZlipW54wrHfs27X3Lu+s
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr25183970637.48.1776252581411;
        Wed, 15 Apr 2026 04:29:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr25183939637.48.1776252580924;
        Wed, 15 Apr 2026 04:29:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1417183a12.1.2026.04.15.04.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:29:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
Date: Wed, 15 Apr 2026 16:59:23 +0530
Message-Id: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN232kC/yXMTQ5AMBBA4avIrDVpiyZcRUSqBiN+W0Qi7q5Yf
 ov3LnBoCR1kwQUWD3I0Tx4iDMB0emqRUe0NkkvFI6kYLWuqEl5uwzgyqYVBHavGpAJ8slhs6Px
 2efHb7VWPZnsfcN8PqYuTw3AAAAA=
X-Change-ID: 20260326-ipq9650_tlmm-2a1cea46fc91
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776252577; l=842;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=zkTj1FPBTPay2KEYBi9VK1EONkKuBT3XGTuds7WjW4E=;
 b=gct8cnLRX2BpHIVUTXwooKifRVem7Rf4JL4pVZzEVlUXczvn8jflm59sRI8dfrdgB3CDzpwGH
 v8poMwWur64AJaw6PExA/eu3zcflRzfWJtngtRWeYTW7b4GDdm3l4m/
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 0PEXF9OR-6huZbWMsN9fK0nQklZih2V1
X-Authority-Analysis: v=2.4 cv=eLMjSnp1 c=1 sm=1 tr=0 ts=69df76a6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=udllaobD4nFk2SGM0x8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX/NDVrcCtEuBV
 oU+Ec8/rl5JlhMJcmDOOXkjzL7+D/G3A8P5hXDKs2jsOgbeUGC7yOzqMjtroOEuMyDIzIaZ/6Fg
 gML8I2PYXuRjulO/iXFm+LNBwktgtaUTlTN7n6YaDoVBzK9Mn3+hUbHX6jjuq/BPa3v6Ymw+xnW
 xvyHm8b6Pa3GAdcxubZqfJ2zvCLvqT2BVLefSArArVrkh46V3GH8SgudSgp7nJOf8WJOKX/cnkB
 2i+gr9yH1SFk2OpmN5UMyjmY6QWbvTuIncxkQxkoNaJcKO9HsFhqwMKPPHuQSZz2UEFgY8jmr6P
 6JaVznx76qkVCiuj1CjpD4pFU4ENuzhtgr1Qw/ohoYV/2q2eCeiOwUXDSp/Yca8NtKHLl/EtZLG
 Rql/Ms6SCmfXHdQ4+bZE4GlDF+NC8pTXCSPMRY6pQDIWI+Cf5QWWQLFIRlGu9BmJjaqtKG6hH8C
 HL7SocnFQUll57OU9XQ==
X-Proofpoint-ORIG-GUID: 0PEXF9OR-6huZbWMsN9fK0nQklZih2V1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35166-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB428403CD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
      pinctrl: qcom: Introduce IPQ9650 TLMM driver

 .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        | 118 ++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   9 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq9650.c             | 762 +++++++++++++++++++++
 4 files changed, 890 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260326-ipq9650_tlmm-2a1cea46fc91

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


