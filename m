Return-Path: <linux-gpio+bounces-30812-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNuyJzjQb2mgMQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30812-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 19:58:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29849E7A
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 19:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64D708AD726
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 17:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257BF413238;
	Tue, 20 Jan 2026 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZ/zD1KE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNdcZi/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4103EDABA
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929828; cv=none; b=aQb1X3v/KwlfGjKLlwcqhJjEvB5w5eI8H2rY+UmYwBBsfZZKyUa84UgePDFkCq9pOOkqlQy2BdXpwcCj9/XF6X/t+vLnnpl46VF1oJnHKwdyE+pkBUUSPhQknIX/TY1KZCkIhSpzT/j9CLzmVXG64kUBU7QHv0i0nAvOeakMQ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929828; c=relaxed/simple;
	bh=yVhF07VxzTW+N0dHjwRePyJygjk6zzmQEWTrMJtov1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bkPbFW4Iz9Oll4cNsk+6FB7wLnx2lKRRSJRvA7SXIUq4cnd+hZSaiPnCeHhe7s27ZwqPAQX/3YF6kniyoRi8srWDnxUr5wPuxfGV/0De2qr0f54M2YwA5aKXa5IWCunl+JKt3u3QJ17vQPgCFHzredPvsOWPRjiJ12JtsXgsZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZ/zD1KE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNdcZi/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KB2k713252690
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LAoJ+q7g8QEGWaQNfDk7kF
	44veuqOX7O1cwfh6XDgwM=; b=OZ/zD1KEh6mFAVY4I0VqE1253EeZnEfami17LO
	OTeHOtxk1SWyfYNAGBf5XNKMbhAZDiLGi8peugx7sNpea6jJkYyG0fQGHTCfK5+F
	WzXZMVqh99829dNezxq0sHKwGelVr6jqRRhU0G2aviYj8ZSyhlKP6hE0dml9iRhM
	vo7hZAA5rsHiwwDhMAS76IvSMoNttj9EvZgCYUbMXezWd3v01s+CAepwF/gPiSiY
	FmrrSMh+nMSc+rz3ATfhKhO10i45upOjhSFEADMEaqYMExIxOQdolnozzo9slQrd
	YgLta9dON/2eoRldwDnUVUUm+hCqrksWKzXDkH2lwITmr3+A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt27aje3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 17:23:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12339e20a86so6043800c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 09:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768929824; x=1769534624; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAoJ+q7g8QEGWaQNfDk7kF44veuqOX7O1cwfh6XDgwM=;
        b=bNdcZi/VUY6W9Ln9tVwhsTPoK2MoJHTW2DslXRV4ur3A+qZjSwJq2Oqg6hCZZexiC2
         be4dfWTQFNb6sGK+MLWB6ao6F1xMiy/jxG64mHS2kpWWZ1T9PTudPHR+u3fIWV9rX1T8
         YlvODRnGZS6bdKZXGpIjHRVrk4hCkFVEv9KZMn/o4Jlc8x/bXxOaPxkiH8t8r3Db99OR
         cx3hVgn9CXt9qNQ6vp8XbpRYYLeEMYbvsX+pUg+ts/IQ4IJAGchZ2FwE5IKbFTlQmCgX
         7nbFN/bnCDDtU/wVCQ9Wje2Y+m4RQRfCeNZYMsGWBL66t1dLdK3xzPaIvOiDkqW+yb2T
         lexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929824; x=1769534624;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAoJ+q7g8QEGWaQNfDk7kF44veuqOX7O1cwfh6XDgwM=;
        b=EF4KeKZCrKaBPrlmpsMGDNqszBZXyuR6cWlHfh2sg0kA3bI+LiJZ1d470IpONUErCQ
         5P2//309nrKDcyPnniPPShyvPf6N2Zv7sYVy5xXCda/ZvYOgKparSAPEiIwv0W+8vCFU
         w+IgjJ9CQW/Frt27WmpjXxICo3oVVsLfQZdabi8rZNWTFszR5KaiDD1G1weyMk7lFuf7
         UrbTHj4MxCTsJxk2lPuEzpmBY8nDeGw84IAnXccXYdYmG66jcNbW5H76diuJVfFXlaV0
         FizIFOJJCA/VxbH9gpaBMJzItVF5S/WuUL8SpqXgpMCJaI9LhPrxZ6fz9Ds6vzj7ERGc
         ZfHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDY8iTWkRkHI0uAiS0OOpIm0ImLKTFl8g1md66VbHYvAeMJDT3eQ4V7MlIZo3JJp6iEi0uUa3HEwjy@vger.kernel.org
X-Gm-Message-State: AOJu0YwiUdQRO9dXifVsLhxXihxntDcT/22aHE1kUeHKJfPKsOmF0cXq
	3oCkQYRxVjhmb0A/ZJitO7vjSlNW2ED9+SHyrZ2ap+0jk/rAepddDcIOWxFlm8M5AzRnNOMKBIg
	pcgxMjuuBhDeDtFu0Ucs6bp6+GQ+WdxYL/lBvC7CdOanOZYF7y3QiPjMImwY/9esi
X-Gm-Gg: AY/fxX4nGCurN6lZcVGefW3FzuKx+GLU9fy7pb7EtyEOday4ypRxkAPwkRVL1Hm3rm6
	OHaNBdtyZY/5EUsqarQfpLDxbf11Y1ZrLGHWb19wItKssuSeha2+KP1sG8lV7qBVJbENXszLLmc
	Vy3lGByJMp9liG1N6fDLOYks7YbXHEpI0Xr6mFzL0AqxdUqkfkLBT7Mal08UrsT8PyWczQz+PEv
	+wrqjTtnIhmlJEmrSpZXuW+yTUYIP5zFazh/nXG4U3Tk/4WFWzWbhHUvHSX8IQMEgDqUoeD2d/E
	T7sHjwTxEYXMIG5kJNX1xceaHjMvK7WYL3/iP8E/yWFqOKQGxzI+TjgV3nAEURNec/6yMWwUaN5
	M+UCj8UX1YLm2XwNJboCxjqvm0+V81S51TCnXBftlIgXy7HbnRnngcbck73n+V/rtPcV+nmhQhg
	==
X-Received: by 2002:a05:7022:b8f:b0:11b:65e:f2d with SMTP id a92af1059eb24-1246a958b7fmr1475255c88.10.1768929823534;
        Tue, 20 Jan 2026 09:23:43 -0800 (PST)
X-Received: by 2002:a05:7022:b8f:b0:11b:65e:f2d with SMTP id a92af1059eb24-1246a958b7fmr1475226c88.10.1768929822772;
        Tue, 20 Jan 2026 09:23:42 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af22aaasm18714842c88.17.2026.01.20.09.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:23:42 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: Add Mahua TLMM support
Date: Tue, 20 Jan 2026 09:22:49 -0800
Message-Id: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOm5b2kC/4XNyw6CMBAF0F8xXTtk+rAYV/6HcVHaIk0ojxYaD
 eHfLaxcaNxMcid3ziwk2uBsJJfDQoJNLrq+y4EfD0Q3qntYcCZnwpBJpMhgcJ2eQguj7j141cw
 KptZ7EJxLISplpdAkXw/B1u65y7d7zo2LUx9e+6NEt+1/M1FAQGtMSVWN54pd+xiLcVZtLvoiD
 7LRiX1yp98cy1ypNHJZl4jGfuHWdX0DAvN8BRQBAAA=
X-Change-ID: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768929822; l=1688;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=yVhF07VxzTW+N0dHjwRePyJygjk6zzmQEWTrMJtov1s=;
 b=FsSrT0lsNjNnSQpuUvhk17bWhZvcBDY7dzJZh7Teo0uVxkwysxis3lckzAqgOk3m0dGUffq6e
 0UEvKtjU3s/ClvMQhBY30kBisf0I5VtJeSlDt2houFzoXTKqd7sFrA8
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-ORIG-GUID: 3skbXAfI5McqWMoSY7tQhLmFCRw5AXBA
X-Proofpoint-GUID: 3skbXAfI5McqWMoSY7tQhLmFCRw5AXBA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0NSBTYWx0ZWRfX6zNA4DtuGwEI
 hR5s/++a/cq/lt6xW0wx6pM1rkd7O+fxwCxzv8kp8vBLOriDYHf+C1WdJ3YkOUj3VVsiovXXHrX
 13CmIsdVdWnjslXZ0g8nrZNavHux71gzX+yfNQZCSam4ssTlSJwHL9DgSpJJlzfyu2JtADViNkN
 JSone6I/2Y+f36O/h3cegvos+4xtLdb5DM7gVfaE6uO3DF7fEfLLIYsnh69KXIgi3p5UYdA6E5E
 EFRHvayVCN3KITjrkcoauexEcZn8R0dUnY7H9dQ/BYqSkrkfEBKiG2WKvOp/YmxcsIDSlLx9ObK
 +Dcoxk+UYT8kL9mAGY91gJZPGimRHr/NAag6jFKqu2Mi+A+AER6sE4PmmLIxPVI0v66mwJXqUEI
 t+b2G1iC9u9vjTVlCQ4QPYWbM/0VKGf+8F5b7MZbENGzZb8tb3jFecLhhnkgocnAVdKyayocBaM
 oZc4K4cS7USmuYTs3Jg==
X-Authority-Analysis: v=2.4 cv=P6U3RyAu c=1 sm=1 tr=0 ts=696fba20 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4Q-EQNNWwN3BBnYOq88A:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200145
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-30812-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D29849E7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce Top Level Mode Multiplexer support for Mahua, a 12-core
variant of Qualcomm's Glymur compute SoC.

Mahua shares the same pin configuration and GPIO layout as Glymur 
but requires different PDC (Power Domain Controller) wake IRQ
mappings for proper wake-up functionality.

Changes:
- Add DeviceTree bindings for Mahua SoC TLMM block
- Add Mahua-specific GPIO to PDC IRQ mappings
- Add mahua tlmm soc data
- Enable probe time config selection based on the compatible string

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
Changes in v3:
- dt-bindings: updated commit message based on review feedback
- pinctrl: updated commit message based on review feedback
- pinctrl: Fix spacing to use single newline between structures
- Link to v2: https://lore.kernel.org/r/20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com

Changes in v2:
- dt-bindings: updated commit message based on review feedback
- pinctrl: drop GPIO 155 from the PDC wakeirq map
- Link to v1: https://lore.kernel.org/r/20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com

---
Gopikrishna Garmidi (2):
      dt-bindings: pinctrl: qcom,glymur-tlmm: Document Mahua TLMM block
      pinctrl: qcom: glymur: Add Mahua TLMM support

 .../bindings/pinctrl/qcom,glymur-tlmm.yaml         |  6 ++-
 drivers/pinctrl/qcom/pinctrl-glymur.c              | 46 ++++++++++++++++++++--
 2 files changed, 47 insertions(+), 5 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20260102-pinctrl-qcom-mahua-tlmm-433644bae64c

Best regards,
-- 
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>


