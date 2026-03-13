Return-Path: <linux-gpio+bounces-33316-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNJ7Cgi5s2nbaAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33316-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:13:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C027E99F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 08:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8632318F0F0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 07:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E12D3659F7;
	Fri, 13 Mar 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtQZISQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzokFzfU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE3221F2F
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385744; cv=none; b=ugUdTUq/tqlYvUJvm9xFVJlJ6ztRRDWNe/l2P+pzu4tyGy/4iSE4FtT1RKxTZnlY7OeqKl9uP1OmnGkj0nDKzTlR6oFAIHgSnfOvujKrTrEwfOat3L6Gq6uTcqJyo1oFBJ0k/8GUJAwu5gEdzRPtJdQW9SNZxFElBZRWKGGEHLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385744; c=relaxed/simple;
	bh=rZiOZBnfnYQhiYHGIxAvJ9diYifTV8qWwPU2z0ofvp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxxGIBAGxuWiD0StZE8qZMVUO5VxKohzVFMD1i9Jss3k/kUVn40xRq0IY1oi1z9yC9JvC58E4b1W9hve9flbc6SaZuAEE+RygKKSrflPpKCbPG/j7tNpNBrd4nqb7aIQYbMcYFnI8YSSE1JLJuBvJ+b091ZwfTyrcfUxREwJz40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtQZISQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzokFzfU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tleZ2018424
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=; b=VtQZISQ4gXif4eDM
	f+9MBd27EG8icye0NwvCDGtfeiTqdpiNWJOYCUp7SPKQ6vVIG1K8wx/DJFsNH3Ha
	SUaTCM7ZGEQSt5PlCbDdMyjcT6kHxBq9ZCOsVTXOkOmsl9QA5n32ndJPTnH8sVGf
	Dx6ExBfVyWgS+SwRm4Zbep5GPcAABzlu/WiA2kKv3JTTc45LQ9uDMpW7Dy9ODPvK
	0eldBnWNhzlj5qlq9OniUuY+jczVDFqXkaRpFpIITJh5HPKSfG+63XWuBE4iKyMh
	IVH+3QPVrQu/m5WZKs0xBmJZjT/18lyl3pkQOP8bV0YU6bRuBu9zktQ5K/5Purxu
	w1t8kg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wvxqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 07:09:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b7ed8958so6190040b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 00:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385739; x=1773990539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=;
        b=MzokFzfUXe0xrIz7ZO3lVTuk/B75C3RZWLD9Wy/nzyeSLSGCeHmLOM16viVJyxgiCx
         TrHf3lW5l71JkqcWpxUih4xQEpYO6m362UrXkU3b+gCzls7Zfa1wGaCy0/J6OZea+Dyg
         0KaNZ1vohu1wgTBjivEWY7/9yKTAtu3z6wWHHPwWvVPOffVuoeTmpHxUCnxDGzH0Umjn
         v/Fp2n3tSKeJgKIMfsmBB1cHJ2WPjxm0w5lh1t9PL4kpW2uarsL6BC+tRwrKvEGd8+vI
         YV5vAwdqYlMKa8L76mDQpi+XfbZBmfaY85P6QNd0jMPj3N11LjZuo+Qmj/Dn7p6bTGkV
         LVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385739; x=1773990539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=;
        b=ppRK/Vt87LQ4wvkm1hOtmMmj2Cxq1HR0Xcfr+b2ZLIgT89xyn5fTO2LDZ0mgY9hTDt
         /X+9NlNny3OzJfQj7v5++R5aWREhmjluclj2DsuCVcH2B2EKBVQ9dJ0LsmTcfeOJmup4
         KCvG8dmz386Ofhoq87+SMol46itqK0NDXCTjKlOoxltviVq+7N3P1PcEDsWisLaafOh5
         GfaTUf/RE7d9mqjPPNrOidAYLS+mwRi8Qk7MiSHknwqfFvm1a4QCHx1e2ogWLLSLSvuq
         zZZmlcmuXIR8N/kBoJ4f3b2k8hv3uFtwDys0qeHf3PJ/ltp1Jv30f5Z8nQxnHyU7d8qV
         NKSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcB5uFpozWuNtowrDDi/eojMQs3oqCnmY+aiiMcrnPULpN7m260ZRa/c9/F12mjtkkrop+VoU+v9UV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp78bZkgDWv/9mecn4qf3/h6u1MmbTS7xnVzbhBpnify072Ieu
	9ZOi7njMmXJ5MZ5uR6pZRWOFalKmByy7L50ouT0bVHnZPsN20OmDbFmnGhP6QGh+4b8Qu0xecfe
	n6mzw1nNQJAWf5C5CJFjuIg4avr2iMb/tPddhOhSb+Cnaej3hXfikl91hmgooV6BA
X-Gm-Gg: ATEYQzxhHfGHIeNHVOsc8pHWnl4LSn2uESJLfk7MwOoGLYfp3SBWCAnTybA0A7X4J0L
	OU8eDsFivbQpPt/LOET1YQ22F82VPgS0hj3Jut2Qx2/iq3fLkWX859WFDpzEEn5h6pk9eUk0iVO
	NVfhHkfxKjhR1rsw9sPvgG0ZaDPZGMOmqJ8HbSX3VDoS6PkKJHwNajXZxQ6lctjusJ15ODT1g3h
	VF9YfSvpghH2WPb8hVeu6D084OtITVO9V0kZxOCPBHbdM6oILT8ohH+HwlAPGmRG8ypmCBV1uHo
	NhbPuQ86mYXELXy2jOW3AKM3uhU3KnCUFn+44gH2H3+esmmeM4G9ehzl36f5A/WP9nL7YQmG36n
	DaL2grUfBckkb/MgPOdl04FAovg06/PPkA9GA5Vbrb1k91x2eIfWDA2SH
X-Received: by 2002:a05:6a00:2d0b:b0:829:7553:afbe with SMTP id d2e1a72fcca58-82a19952539mr1970544b3a.57.1773385738488;
        Fri, 13 Mar 2026 00:08:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d0b:b0:829:7553:afbe with SMTP id d2e1a72fcca58-82a19952539mr1970522b3a.57.1773385738021;
        Fri, 13 Mar 2026 00:08:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm5148536b3a.34.2026.03.13.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:08:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:38:40 +0530
Subject: [PATCH v8 1/3] PM: sleep: wakeirq: Add support for dedicated
 shared wake IRQ setup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-wakeirq_support-v8-1-48a0a702518a@oss.qualcomm.com>
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
In-Reply-To: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773385725; l=4919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rZiOZBnfnYQhiYHGIxAvJ9diYifTV8qWwPU2z0ofvp8=;
 b=sK1VrvyBMnRqI17H0rZDdjGA2MW67ilKN3wCvOiI+I1r7BhnpKu8+OppiMuh1kfZPziuvlf4j
 840DYh/TkB1CtDnzPkpYqpPHl5+uafsLEr8iVy+8k4GhAvdc4Fm88jV
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b3b80c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GqrSgIjjxmp09zFQf4gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Xdd6fZUSQNC4HvcvQCVFypaHQFT25zdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfX/jCNqVMpMdZQ
 Zb+RwPZOxgKWT17R5VQCRJa+98uZ7oMI6I8rQ8e5bMPB9uf5RJK1TdDr8SGLfxRRi34rXzGAZtn
 XQDoN+IcmMe25QOiK+JgPVYucBvO3SMsd+eBeGy9ta1TEFaGNh0eAKRSWKbGx9AQce1nEqAwZjJ
 xN/jlJv9jfJT9mXaxHv+VnOTYDyr2RjKZnZ7+KHnGNGakcSvFEOTGSt9kQ3FWBI3m42rQGwQpdU
 d9hKgwxCTFMAeNozIHmuJ2JvKN0SrDH7lZ9T1uSE74kYvAt6h48NUGmwDfY9UjQxGoO27fMudFK
 eFreBAyooSQhmPCmtMM8RGTuk26XnWuaVESmayeiKJ+g9fmMqJaS9i3+lvGqzWG+pECSrq6CB4R
 Ojj8Zjp4YuS1UJ80SuHC+2BfvVAHljSCgmDb2MJb313xcPGvetwKIOLJDhazmjOvLsdcF0ZHOzq
 gG6Rqpy/tnlJrDGFFkQ==
X-Proofpoint-ORIG-GUID: Xdd6fZUSQNC4HvcvQCVFypaHQFT25zdN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-33316-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 930C027E99F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some devices require more flexibility when configuring their dedicated
wake-up interrupts, such as support for IRQF_SHARED or other IRQ flags.
This is particularly useful in PCIe systems where multiple endpoints
(e.g., Wi-Fi and Bluetooth controllers) share a common WAKE# signal
line which requests platform to re-establish power and reference clocks
to the components. In such cases, drivers can use this new API
dev_pm_set_dedicated_shared_wake_irq() to register a shared wake IRQ.

Update the internal helper __dev_pm_set_dedicated_wake_irq() to accept an
irq_flags argument. Modify the existing dev_pm_set_dedicated_wake_irq()
and dev_pm_set_dedicated_wake_irq_reverse() to preserve current behavior.

When IRQ registered with IRQF_SHARED we can't use IRQF_NO_AUTOEN flag,
so after registering for irq, disable it explicitly.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
---
 drivers/base/power/wakeirq.c | 39 ++++++++++++++++++++++++++++++++++-----
 include/linux/pm_wakeirq.h   |  6 ++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
index ad23f0fa5d1a5a9eb49b1af2288ee4908082b13e..b7b106f55559a7c85cb35d9e5ed22fe37970662d 100644
--- a/drivers/base/power/wakeirq.c
+++ b/drivers/base/power/wakeirq.c
@@ -171,7 +171,8 @@ static irqreturn_t handle_threaded_wake_irq(int irq, void *_wirq)
 	return IRQ_HANDLED;
 }
 
-static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned int flag)
+static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned int flag,
+					   unsigned int irq_flags)
 {
 	struct wake_irq *wirq;
 	int err;
@@ -200,8 +201,7 @@ static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned
 	 * so we use a threaded irq.
 	 */
 	err = request_threaded_irq(irq, NULL, handle_threaded_wake_irq,
-				   IRQF_ONESHOT | IRQF_NO_AUTOEN,
-				   wirq->name, wirq);
+				   IRQF_ONESHOT | irq_flags, wirq->name, wirq);
 	if (err)
 		goto err_free_name;
 
@@ -237,7 +237,7 @@ static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned
  */
 int dev_pm_set_dedicated_wake_irq(struct device *dev, int irq)
 {
-	return __dev_pm_set_dedicated_wake_irq(dev, irq, 0);
+	return __dev_pm_set_dedicated_wake_irq(dev, irq, 0, IRQF_NO_AUTOEN);
 }
 EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
 
@@ -258,10 +258,39 @@ EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
  */
 int dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int irq)
 {
-	return __dev_pm_set_dedicated_wake_irq(dev, irq, WAKE_IRQ_DEDICATED_REVERSE);
+	return __dev_pm_set_dedicated_wake_irq(dev, irq, WAKE_IRQ_DEDICATED_REVERSE,
+					       IRQF_NO_AUTOEN);
 }
 EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq_reverse);
 
+/**
+ * dev_pm_set_dedicated_shared_wake_irq - Request a dedicated shared wake-up interrupt
+ * @dev: Device entry
+ * @irq: Device wake-up interrupt
+ * @flags: Custom IRQ flags (e.g., IRQ_TYPE_EDGE_FALLING)
+ *
+ * This API sets up a threaded interrupt handler for a device that has
+ * a shared wake-up interrupt in addition to the device IO interrupt. It also
+ * sets IRQ flags like IRQ_TYPE_EDGE_FALLING passed by the caller.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int dev_pm_set_dedicated_shared_wake_irq(struct device *dev, int irq, unsigned long flags)
+{
+	struct wake_irq *wirq;
+	int ret;
+
+	ret =  __dev_pm_set_dedicated_wake_irq(dev, irq, 0, IRQF_SHARED | flags);
+	if (ret)
+		return ret;
+
+	wirq = dev->power.wakeirq;
+	disable_irq_nosync(wirq->irq);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_shared_wake_irq);
+
 /**
  * dev_pm_enable_wake_irq_check - Checks and enables wake-up interrupt
  * @dev: Device
diff --git a/include/linux/pm_wakeirq.h b/include/linux/pm_wakeirq.h
index 25b63ed51b765c2c6919f259668a12675330835e..61f1e840745b56baa57db37563e450cb2d757a85 100644
--- a/include/linux/pm_wakeirq.h
+++ b/include/linux/pm_wakeirq.h
@@ -11,6 +11,7 @@ extern int dev_pm_set_dedicated_wake_irq(struct device *dev, int irq);
 extern int dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int irq);
 extern void dev_pm_clear_wake_irq(struct device *dev);
 extern int devm_pm_set_wake_irq(struct device *dev, int irq);
+extern int dev_pm_set_dedicated_shared_wake_irq(struct device *dev, int irq, unsigned long flags);
 
 #else	/* !CONFIG_PM */
 
@@ -38,5 +39,10 @@ static inline int devm_pm_set_wake_irq(struct device *dev, int irq)
 	return 0;
 }
 
+static inline int dev_pm_set_dedicated_shared_wake_irq(struct device *dev,
+						       int irq, unsigned long flags)
+{
+	return 0;
+}
 #endif	/* CONFIG_PM */
 #endif	/* _LINUX_PM_WAKEIRQ_H */

-- 
2.34.1


