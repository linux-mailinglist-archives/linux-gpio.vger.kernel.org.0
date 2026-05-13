Return-Path: <linux-gpio+bounces-36780-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK7uH2W0BGowNQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36780-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:27:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9C153804C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 19:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B754F30794C9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 17:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948A944CF4A;
	Wed, 13 May 2026 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kryTxQA6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCjxlbY3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12073ADB8F
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778692634; cv=none; b=sO5HknJ97RcXwX3m+yxyG2i6rs0T486xJankAjqnVUK7l/OjY68SWfXzEflFmspFtOMR1Cj//LTRV9VdsR3Smu3jH2M/eUy3pgOu/LzXvI3CJYln/tNGJIU9Dms1aerLKLvfu9oXdv21wuVJgLV+6CkMlEYRPGEJ3WGg+MXNC88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778692634; c=relaxed/simple;
	bh=Kj3iXhctlrnoi195JSqc+ZVTxrEJIVDVilbcH2wOlpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BksVAlRjb80MsCGmtvC4GiU7O57emqgZ9p0hQrcEwYkQLKjEV7uCpTX8Pdxy45RjNAUoQctKaDmppxel0cBX/SmWXpiJDx3+mHfHfjQTMARzP2FsRWk1hNQsbmTaGWON6HzOtD2OrMpDGJe/pRgjwD4DjXUC5g6CvVYqR4Iz94I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kryTxQA6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCjxlbY3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAWrEu1393359
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=; b=kryTxQA6RM485eQX
	dx42ibBOB75xs/MJw/7b3DKZEiDJoe6dqOpjyvUAVS/XrFHKfS7lTZhkbJMgzocU
	m8TngOGjPaWwym33crrprlVCa/LhJP7R2/qHPUFnxVCLowrI1BDsElkK7//ZEtWt
	1Oyuw+KaiRd3xVbzKPDHVxIxS9tJga80y+guWSPjrExWnzHAgkPbLmRbKKIODbjf
	harIdC9nNhxRhduZLHu2336MAwCDgWEQkn1tN7iFieVDpCdTzbDg61a91GhkyNjw
	pNQq9AZFNeEJEwZHfZN/qLVPM2HdlXKI711JqpJ6sWkMQki6Uq7Fw0ye6KznP0Ue
	OCw5LA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k262teh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 17:17:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so5515141eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 10:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778692626; x=1779297426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=;
        b=BCjxlbY3jZcFIHe8YTMbEOoh4nr9Rt8veOvWDiLvlnV0U+Kwy8O2zUr1hYIkAuoGPa
         6YJoUPghFitnuGro3hhGppBsX6Vwm2a1OLkij8P1Xpv4iFQvAcUZfJG7TA9dQoqJp07p
         mut20yOvGfXt58G04drxekh9TpVRuY/kHShEWcU0qsPaznaM5TWZoIYSHiZK+Cgx2BZl
         8d3OjUlexApnS0rlojIzwzLy0x1aVCeJ+BZwitNXpFGBcCdUkgwfVz39zf+B3/eX0RqS
         WdGnEDx7fvPRmQKCtV/fIZimjLSGdIDXzF1byI9eZG1+aqSq4DFBj1iBMLk/AP59OJlh
         yEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692626; x=1779297426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSNW5jdxcUIAPP3Bs33L7OprcOwqqAXBDPxUoI0e9M0=;
        b=NoHZebcgT/f1rOtbtiZl95+w0Yc2Jp07/K9EJbS6RgItokfPVWapvh58WqOMe6BjdI
         YQqwon2MYutUjmBhR2HIKtI5L1YeYORiAL2INGzPAeBhy7vxa2jQ3ij+B9xlq2kY9VqC
         5EoQ2CEHuSszDY0oD4TAX/A3YA1eRLZkK7h2WGgF+Z8FfgoGWd7c20QyAataju5rRBHe
         NNVwRBmRWJ70VdD6e+BsL5l/bM4FlhKStT4wMlAzWunDmEeRRs+q56NfxHnQRvASuWoq
         l1PfEd4SSMo5M/4R4CwLYeOPtMzOAjNXkwwn6336Yui6bcJaapdpesuJicGt1rv1sxz1
         QM/g==
X-Forwarded-Encrypted: i=1; AFNElJ+NQuKeamL9nAlZuZNuqDOB4p7345aUiiU4SziX9cdnjVHHafaVWJexNRFTdE7lZj1Jqp3IUfBErEl6@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJ2YDnvXmOBs75znjezQSAHWmMDoYOK5G+TdZXxbjCqmkJPes
	M1+dtaAdbgcSAOvSu98ByVe9TSedkOt1Pb1tXUVBl9IVxcSxgpQQPq82LQkp070AwOmtHe2NqbI
	8ZtewXH/h+jc3LrfS1AJ21JeCUh+FLjMUMnZsLT0PNoHUocC12bOtoeoYWCmFJ93Q
X-Gm-Gg: Acq92OEUUlml7brBKbMy5OLCe1k/zSWRiWpk1IgiTYg3owXzyX/ltXossyghdIuWNH9
	LPVMI8JnpUeLIGsniPACaN2c1pYlhUaAxP+lC2+6lNnHnkmClH4oUGIvQL1mI6DIEpB3TBgI2sN
	iO4zA0SHy5Z+px+TZylZzDdSB+3PIgqeL+QAqxKirLfyoujcZZT4DBqW+5Wd4U+15XcsH728Mqo
	4Cap5R8FFfMlqkHNPCjQzIaqfZ/Y4uhmlVW1+aLuhTDF3kRLdgSNqCFsnwD+BD/17T/LdCGZBlP
	ljvk1rF/Su1fepBYn9lB+Qs/KKseBILqhaXxG0DJMsdP1hNyGiQpzueAYvZ8RobHUJi1WmnlpmW
	YVVwsYWF541oVM7j5yzOJeDZK6UDxTa2tI3cDjVWSaRQU+GDE3cEnr6NDQt73GxTo9iMBWxg=
X-Received: by 2002:a05:7300:d505:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-3025fd4ce24mr270835eec.11.1778692625722;
        Wed, 13 May 2026 10:17:05 -0700 (PDT)
X-Received: by 2002:a05:7300:d505:b0:2f1:1fe8:cf5c with SMTP id 5a478bee46e88-3025fd4ce24mr270809eec.11.1778692625112;
        Wed, 13 May 2026 10:17:05 -0700 (PDT)
Received: from hu-aletran-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm23075939eec.25.2026.05.13.10.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:17:04 -0700 (PDT)
From: Alex Tran <alex.tran@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:16:58 -0700
Subject: [PATCH v2 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups,
 functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-scmi-client-probe-log-v2-5-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Alex Tran <alex.tran@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778692619; l=1456;
 i=alex.tran@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kj3iXhctlrnoi195JSqc+ZVTxrEJIVDVilbcH2wOlpY=;
 b=8IZtV5wzteupSXqIq+Bsxez1uHO07ft4wROITW/YKp+/ETuq3ZDtrIO4dorhEbPjGInJMDVlv
 mm2SVl1RvGNAtCxpfXCiux0cQSUOEKk7z9zzmj5dpwtHLyyAvkQN8yW
X-Developer-Key: i=alex.tran@oss.qualcomm.com; a=ed25519;
 pk=vKab/gw1fXij5UviWoglv+ho+H/oOiTHyETCLfayPE0=
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a04b212 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HhDMDxCfm6Xc3nGqG0sA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3NCBTYWx0ZWRfXyMR2caczq12+
 CONqQ6/ZuJk8qC/cFoS6xFmSDuTPfnRfNBHuBA/9tRfUeFUmpEi5wS68Wh5zvCzbp3pCFY5QE8b
 XZlVa0S2nygoOlCSS2nrdzPwY32H792WIKZZZqrpBPWkPO99mI/pTvv/0cD17RsH97XJ6kjRr5s
 5BBNhNeJ1DAgr1wTdka0zNPVgmEMAOojt7KFEX2qxpIdtWhfLuppPE2IWqpgKOZJCs6nPgKjWiU
 zNLi7bdw3R+8ah9anFUeVgK/tRNHgyAJmh2stD2zV3Aal0YhOa3Voqvgv9Trt6KA31XdhxhJ+Vn
 9W8VFVC0IeXNFzgnlJhgJ2X7agCcSKwlLHhv/udnKv/gY5U4PcJBRl2o1M5t+sl1H7OUmIsXdhS
 JIzHetyakATctmqMboOQ/LY9ua+kVJ65i8+T7A2YwTm6jXbOLpa1jyNm9Gp+LiPt1KGis+batXI
 mJh66egDxbKKCLu7Pkw==
X-Proofpoint-ORIG-GUID: 3VrzUKDTIkORFaBBXihG81CY-XFkfjck
X-Proofpoint-GUID: 3VrzUKDTIkORFaBBXihG81CY-XFkfjck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130174
X-Rspamd-Queue-Id: 7F9C153804C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-36780-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex.tran@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The SCMI pinctrl driver does not currently log the number of pins,
groups, and functions discovered from firmware. This information is
useful for confirming the firmware exposed pinctrl resources during
debugging.

Log these counts after a successful probe to align with the existing
SCMI client driver logging pattern.

Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index f22be6b7b82a..999c2061ddc3 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -40,6 +40,7 @@ struct scmi_pinctrl {
 	struct pinctrl_desc pctl_desc;
 	struct pinfunction *functions;
 	unsigned int nr_functions;
+	unsigned int nr_groups;
 };
 
 static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
@@ -578,7 +579,15 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!pmx->functions)
 		return -ENOMEM;
 
-	return pinctrl_enable(pmx->pctldev);
+	pmx->nr_groups = pinctrl_scmi_get_groups_count(pmx->pctldev);
+
+	ret = pinctrl_enable(pmx->pctldev);
+	if (ret)
+		return ret;
+
+	dev_dbg(dev, "Initialized %d pins, %d groups, %d functions\n",
+		 pmx->pctl_desc.npins, pmx->nr_groups, pmx->nr_functions);
+	return 0;
 }
 
 static const struct scmi_device_id scmi_id_table[] = {

-- 
2.43.0


