Return-Path: <linux-gpio+bounces-37650-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJYeLHDnGGruoggAu9opvQ
	(envelope-from <linux-gpio+bounces-37650-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 03:10:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 079015FBD74
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 03:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6741831A5080
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 01:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AC5352C51;
	Fri, 29 May 2026 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcDvB9AY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYNiFvg1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08723537FD
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016749; cv=none; b=S3Ct/TnYYUFjQP+FnkPkv54KsGewZ5N+MJcQMlBnz7DNCqM50te4+kaTpc5naO0zik8PnYfLHdjN1gguwFbHx9JOuKCUp6HiBQdXt69g4M7syv8uzRCJ/2habHLeWOkGVuuzUscFCGTfAEPwqhvqI/16/jBTCTbkVSNMscZ+iBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016749; c=relaxed/simple;
	bh=eHzmOULRV2votD+kyy3YF5bvH7sFd6INfw6oEHcYFRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8DJOEmhVBqlBCEQZlwa2r3IFfU0+ooOo4tfgrs+zsXo2f6VtqtgVuYziCPaQPkH5tOIPkYNnxpzPU/l3Dfv+Pc1b+Suiyz3SmLBPDn8QBTkPMygabMfuVRDqveNSWAHQCbIEiEBK9P0NY5ZijdjAwvybGML6g8yJcQglWuBMKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcDvB9AY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYNiFvg1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkS4n1931774
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTcrsNh9ZEqsKUj8N8O+AtmSHFfVnpNdf6+Ukz07bSw=; b=WcDvB9AYL6bIzhxg
	JDXX66aa/8XIzWo9cm9tc0nbQjY+tGDpJogkK3OzZOMCtwuwFF2bC7tJc5nd0ZDa
	Fb2zKVzuXN0htYLFaEr3K3FNTWujlHKXsacSOjBseJ0x8w21QIT4fSioIMnqrkpw
	WMdMtawl9GglCjfTADofs/Ooy0VBu4ECNY9zfyfH08YhvpMhEfbGflN/IXPG0+Fe
	tzYf9/CFFrZMBpagZX3b7ynLArbKB9g0RWzC+bUzk7lWH3g9HqFg1igjT/3BL5qn
	J8BHemcTqZXAMabr3vySMvCUXTtm22vb540MiBR8bqh4J/bh2c/UKDVePltCcnR8
	RQydtw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxa9w7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 01:05:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304d8613efbso1580286eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 18:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780016745; x=1780621545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTcrsNh9ZEqsKUj8N8O+AtmSHFfVnpNdf6+Ukz07bSw=;
        b=BYNiFvg1YgVXx2eU0xaInz4LE1wCwQZ3O9L85v7RhSv7y8ZWXy/et09KDPxqwVbxbS
         9Ococ6165wvtuRkIWvCl3M/CUDnhSjVoE+20sl7gq3symIKEXtG+hlaknlMsHl0rSB3u
         ITULUQpnk3S2aEkjSvPOEhN/GJ4SBbJixc0gzBYeY7EDzZnHCpy7qSSZGesP6yRQzU0F
         4PQ8u3KgnNM4w7BzJfYWZ/gCjyz6noju5Q5syy5gdpIHgVP4z2LOWpZgAv9JlAShdEeC
         AoyB9Et7eVD0PhRucM/QstEsvBP5FMT1ue65i8v+IbWRly6/Ea+3pfRnRUmF+HKpOBoY
         6ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016745; x=1780621545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pTcrsNh9ZEqsKUj8N8O+AtmSHFfVnpNdf6+Ukz07bSw=;
        b=P+uGjmgBzck9gPc2V+Ecp20KBix/rgwuG4X3A92HtbGjS6r22ImHxTB59cSSUTdbEv
         9CeVUZWo1SUeR5SGsEouqyh/Xe17RPVAMuQADjeQ4YRwaLHdhjWJ4xiHhRpYRQ6ILCXr
         qCFDqP6+0/RSstMeZL/CGyrAJUaVhS/G4crRxkTob3N5vsbJDcSE+Em+e89Fo0gAdaH2
         CNDfOsBGYSEUaSM80lEcbCbAUAk1KNfxNjpN6LkDs4ITs7+3u4jGZsFselEXqvndd7+T
         zOy6B0/MtF8XA3eQcVXLkwx+X+7ZDQn/jYj1qbBgyS92FVbKRNDiWNjEYTSCVxQx43kL
         +FmA==
X-Forwarded-Encrypted: i=1; AFNElJ8xXrTO2lZmm9YKVtZCJiRJjoFhnYOlTniiPJ8x38jpEPtvs6np4zvfzd6ek4UkGv5lvUSORP/nLmmq@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDfUzD+oPgR5KsY8x7bwR8coV9GPgya+tSEV59AH85QRFWq3v
	gv7lAgw3Ft9MCWbKY2Byb/MVhlzpPS2rFK/jyAZc3487DkRvQcUc/WJIjGPi09YdflEDgg5tOVV
	OEsquGN9+ZWLYvCGgX23Pa5r+0LhJTuZipHHJMSEhi2izrcnbwjaKEdOhkjSUO8Z7
X-Gm-Gg: Acq92OET68DfX2IFnK2eD0udjn7WNRPrd09I5LdtUStLsEppAAi+LBTkz+lgLnvw5kI
	bugM7dSWqNINW76VMEpSCgBGoS+OP/g3fVnNV8ECykX6oSw8PmZSSGNBZVO6E1t+U0kJwzh+4J1
	/8VcNuXxSUAhIzOwkQWcuIFHFtCLJB7WQpUNV80sqkmaPCM+e0FCH1HqPq2TU+cEycW2zzezshm
	zfTzlG75K/UjQTNGb0V2mAT27Ox5dSVMEikkrxdQDGu0kdogGh3dwI40i33ShCpM9szNMAeaawH
	jnB50tuTuVQvoJQBqx9znhwM5MXdE496DCQ9WNQlMs7jcdHRAG1inPE45JPxhQhjnWO09kbo+MY
	8PF3l84XP2qEFl3ciVvn7h3QRYcZqVwYDUAEKeFdKwVVgUsss+jX8dhKVPkTzG/P/RpVml5VvqA
	KANHS5NHsO
X-Received: by 2002:a05:7300:a889:b0:304:caa4:3559 with SMTP id 5a478bee46e88-304eb1f5f4bmr393420eec.22.1780016745097;
        Thu, 28 May 2026 18:05:45 -0700 (PDT)
X-Received: by 2002:a05:7300:a889:b0:304:caa4:3559 with SMTP id 5a478bee46e88-304eb1f5f4bmr393390eec.22.1780016744418;
        Thu, 28 May 2026 18:05:44 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c3121sm179812eec.5.2026.05.28.18.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:05:43 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 28 May 2026 18:05:35 -0700
Subject: [PATCH v2 1/4] soc: qcom: rpmh: Allow non-child devices to issue
 write commands
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-pinctrl-level-shifter-v2-1-3a6a025392bf@oss.qualcomm.com>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
In-Reply-To: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780016741; l=9203;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=eHzmOULRV2votD+kyy3YF5bvH7sFd6INfw6oEHcYFRM=;
 b=lT6vmnQU6ArieAWcqteXb8b5No5i/HP33DmEaIGVZ8HBhQuWiDnAIl592HVUxiFsPC52hqDgb
 z0kRkqqDYvLAOLiQJk5Kks7PDccC7vNB27ZVb4LojcG0LqE9v+rEvMP
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: j-RyX4RtsF-d5NLoQJrecOUT3hETxch-
X-Proofpoint-ORIG-GUID: j-RyX4RtsF-d5NLoQJrecOUT3hETxch-
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a18e66a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3W70XLUb-i4rQMzVbXEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwNyBTYWx0ZWRfX4kdnKNtIh75Y
 L/LUyrH8QRFVW3UUIUmM7MPojjdf3EcYlj0jEH+pnj2aYdIjcjpFLMNmBnDkNpkFP+Mz8o1pAaM
 2C9zTm/vTSpSYNXE6d0LzN51oapGV1xUj+y6xcUTjMuJ0ltW+U0cAvzTUfY1Pt+v/Nb+6aiTANb
 E4kSdUxhkQAiXty4DSvgmJhF7835Hg0ed+VYttBlFUxGWJ6tR/Jl06J2uuNWg291gy4aiINSQ5x
 QOGm/0oQz92zworOLZMh7wZrjvCPPDL8pnVoulT9bIHriD0/3IywhX0NI1Tx/Ze/cZ46SgnD+BD
 S1vEQ927KW/kTQtsivI2T6TauTt2x0dJydbLQxspO/JTwsp76W8aWP7W3ZpyQZnhAx3nDkvPKa6
 /R4QPKuQJy1ojszYLUxuGryHH8jKnuQTVyatmt+Sr6ETjKvNKoPElL5qsq0SMPK2CqcAMTmLqyH
 GLWQX/h4R4IkgNZSA6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290007
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-37650-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 079015FBD74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the RPMH driver only allows child devices of the RPMH
controller to issue commands, as it assumes dev->parent points to the
RSC device.

There is a possibility that certain devices which are not children of
the RPMH controller want to send commands for special control at the
RPMH side. For example, in PMH0101 PMICs, there are bidirectional
level shifter (LS) peripherals, and each LS works with a pair of PMIC
GPIOs. The control of the LS, which is combined with the GPIO
configuration, is handled by RPMH firmware for sharing the resource
between different subsystems. From a hardware point of view, the LS
functionality is tied to a pair of PMIC GPIOs, so its control is more
suitable to be added in the pinctrl-spmi-gpio driver by adding the
level-shifter function. However, the pinctrl-spmi-gpio device is a
child device of the SPMI controller, not the RPMH controller.

This patch extends the RPMH driver to support write commands from any
device that has a pointer to the RPMH controller device:

1. Add rpmh_get_ctrlr_dev() to lookup controller via device tree
   phandle "qcom,rpmh"
2. Add new APIs: rpmh_write_async_ctrlr() and rpmh_write_ctrlr()
   that accept controller device pointer directly

With this change, the pinctrl-spmi-gpio driver is able to issue write
commands to the RPMH controller by using the controller device pointer,
and vote for enabling the level-shifter function.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh.c | 173 +++++++++++++++++++++++++++++++++++++++++++-----
 include/soc/qcom/rpmh.h |  21 ++++++
 2 files changed, 179 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index ca37da3dc2b1..9dbc42b775d9 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -12,6 +12,7 @@
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -76,6 +77,21 @@ static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
 	return &drv->client;
 }
 
+static struct rpmh_ctrlr *get_rpmh_ctrlr_from_dev(const struct device *ctrl_dev)
+{
+	struct rsc_drv *drv;
+
+	if (!ctrl_dev)
+		return ERR_PTR(-EINVAL);
+
+	drv = dev_get_drvdata(ctrl_dev);
+
+	if (!drv)
+		return ERR_PTR(-ENODEV);
+
+	return &drv->client;
+}
+
 void rpmh_tx_done(const struct tcs_request *msg)
 {
 	struct rpmh_request *rpm_msg = container_of(msg, struct rpmh_request,
@@ -156,23 +172,11 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
 	return req;
 }
 
-/**
- * __rpmh_write: Cache and send the RPMH request
- *
- * @dev: The device making the request
- * @state: Active/Sleep request type
- * @rpm_msg: The data that needs to be sent (cmds).
- *
- * Cache the RPMH request and send if the state is ACTIVE_ONLY.
- * SLEEP/WAKE_ONLY requests are not sent to the controller at
- * this time. Use rpmh_flush() to send them to the controller.
- */
-static int __rpmh_write(const struct device *dev, enum rpmh_state state,
-			struct rpmh_request *rpm_msg)
+static int __rpmh_write_direct(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
+			       struct rpmh_request *rpm_msg)
 {
-	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
-	int ret = -EINVAL;
 	struct cache_req *req;
+	int ret = -EINVAL;
 	int i;
 
 	/* Cache the request in our store and link the payload */
@@ -193,6 +197,25 @@ static int __rpmh_write(const struct device *dev, enum rpmh_state state,
 	return ret;
 }
 
+/**
+ * __rpmh_write: Cache and send the RPMH request
+ *
+ * @dev: The device making the request
+ * @state: Active/Sleep request type
+ * @rpm_msg: The data that needs to be sent (cmds).
+ *
+ * Cache the RPMH request and send if the state is ACTIVE_ONLY.
+ * SLEEP/WAKE_ONLY requests are not sent to the controller at
+ * this time. Use rpmh_flush() to send them to the controller.
+ */
+static int __rpmh_write(const struct device *dev, enum rpmh_state state,
+			struct rpmh_request *rpm_msg)
+{
+	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
+
+	return __rpmh_write_direct(ctrlr, state, rpm_msg);
+}
+
 static int __fill_rpmh_msg(struct rpmh_request *req, enum rpmh_state state,
 		const struct tcs_cmd *cmd, u32 n)
 {
@@ -271,6 +294,126 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
 }
 EXPORT_SYMBOL_GPL(rpmh_write);
 
+static void rpmh_put_device(void *data)
+{
+	put_device(data);
+}
+
+/**
+ * rpmh_get_ctrlr_dev: Get RPMH controller device from device tree
+ *
+ * @dev: Device with "qcom,rpmh" phandle property
+ *
+ * Returns: Pointer to RPMH controller device, with a devm action registered
+ * on @dev to release the reference when @dev is unbound.
+ */
+struct device *rpmh_get_ctrlr_dev(struct device *dev)
+{
+	struct device_node *rpmh_np;
+	struct platform_device *pdev;
+	struct device_link *link;
+	int ret;
+
+	rpmh_np = of_parse_phandle(dev->of_node, "qcom,rpmh", 0);
+	if (!rpmh_np)
+		return ERR_PTR(-ENODEV);
+
+	pdev = of_find_device_by_node(rpmh_np);
+	of_node_put(rpmh_np);
+
+	if (!pdev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	link = device_link_add(dev, &pdev->dev,
+			       DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_PM_RUNTIME);
+	if (!link) {
+		put_device(&pdev->dev);
+		return ERR_PTR(-EINVAL);
+	}
+
+	ret = devm_add_action_or_reset(dev, rpmh_put_device, &pdev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &pdev->dev;
+}
+EXPORT_SYMBOL_GPL(rpmh_get_ctrlr_dev);
+
+/**
+ * rpmh_write_async_ctrlr: Write RPMH commands with the controller device pointer
+ *
+ * @ctrl_dev: The RPMH controller device
+ * @state: Active/sleep set
+ * @cmd: The payload data
+ * @n: The number of elements in payload
+ *
+ * Write a set of RPMH commands, the order of commands is maintained
+ * and will be sent as a single shot.
+ */
+int rpmh_write_async_ctrlr(const struct device *ctrl_dev, enum rpmh_state state,
+			   const struct tcs_cmd *cmd, u32 n)
+{
+	struct rpmh_request *rpm_msg;
+	struct rpmh_ctrlr *ctrlr;
+	int ret;
+
+	ctrlr = get_rpmh_ctrlr_from_dev(ctrl_dev);
+	if (IS_ERR(ctrlr))
+		return PTR_ERR(ctrlr);
+
+	rpm_msg = kzalloc_obj(*rpm_msg, GFP_ATOMIC);
+	if (!rpm_msg)
+		return -ENOMEM;
+	rpm_msg->needs_free = true;
+
+	ret = __fill_rpmh_msg(rpm_msg, state, cmd, n);
+	if (ret) {
+		kfree(rpm_msg);
+		return ret;
+	}
+
+	return __rpmh_write_direct(ctrlr, state, rpm_msg);
+}
+EXPORT_SYMBOL_GPL(rpmh_write_async_ctrlr);
+
+/**
+ * rpmh_write_ctrlr: Write RPMH commands and block until response,
+ * with the controller device pointer
+ *
+ * @ctrlr_dev: The RPMH controller device
+ * @state: Active/sleep set
+ * @cmd: The payload data
+ * @n: The number of elements in @cmd
+ *
+ * May sleep. Do not call from atomic contexts.
+ */
+int rpmh_write_ctrlr(const struct device *ctrlr_dev, enum rpmh_state state,
+		     const struct tcs_cmd *cmd, u32 n)
+{
+	DECLARE_COMPLETION_ONSTACK(compl);
+	/* dev is unused in the synchronous non-batch path; pass NULL */
+	DEFINE_RPMH_MSG_ONSTACK(NULL, state, &compl, rpm_msg);
+	struct rpmh_ctrlr *ctrlr;
+	int ret;
+
+	ctrlr = get_rpmh_ctrlr_from_dev(ctrlr_dev);
+	if (IS_ERR(ctrlr))
+		return PTR_ERR(ctrlr);
+
+	ret = __fill_rpmh_msg(&rpm_msg, state, cmd, n);
+	if (ret)
+		return ret;
+
+	ret = __rpmh_write_direct(ctrlr, state, &rpm_msg);
+	if (ret)
+		return ret;
+
+	ret = wait_for_completion_timeout(&compl, RPMH_TIMEOUT_MS);
+	WARN_ON(!ret);
+	return (ret > 0) ? 0 : -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(rpmh_write_ctrlr);
+
 static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
 {
 	unsigned long flags;
diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
index bdbee1a97d36..90ddcd7ca2fe 100644
--- a/include/soc/qcom/rpmh.h
+++ b/include/soc/qcom/rpmh.h
@@ -22,6 +22,14 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 
 void rpmh_invalidate(const struct device *dev);
 
+struct device *rpmh_get_ctrlr_dev(struct device *dev);
+
+int rpmh_write_async_ctrlr(const struct device *ctrl_dev, enum rpmh_state state,
+			   const struct tcs_cmd *cmd, u32 n);
+
+int rpmh_write_ctrlr(const struct device *ctrlr_dev, enum rpmh_state state,
+		     const struct tcs_cmd *cmd, u32 n);
+
 #else
 
 static inline int rpmh_write(const struct device *dev, enum rpmh_state state,
@@ -42,6 +50,19 @@ static inline void rpmh_invalidate(const struct device *dev)
 {
 }
 
+static inline struct device *rpmh_get_ctrlr_dev(struct device *dev)
+{ return ERR_PTR(-ENODEV); }
+
+static inline int rpmh_write_async_ctrlr(const struct device *ctrl_dev,
+					  enum rpmh_state state,
+					  const struct tcs_cmd *cmd, u32 n)
+{ return -ENODEV; }
+
+static inline int rpmh_write_ctrlr(const struct device *ctrlr_dev,
+				    enum rpmh_state state,
+				    const struct tcs_cmd *cmd, u32 n)
+{ return -ENODEV; }
+
 #endif /* CONFIG_QCOM_RPMH */
 
 #endif /* __SOC_QCOM_RPMH_H__ */

-- 
2.43.0


