Return-Path: <linux-gpio+bounces-35454-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL6wJV0O62mvHwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35454-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:31:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B07D045A433
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 08:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1586F3015C9C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 06:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AED163537D4;
	Fri, 24 Apr 2026 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hqk6LNcp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Coo32nJ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38B2C08AC
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777012307; cv=none; b=IFAddMEvrSTMFrbR8RN8irxGHKvn/BVNwmHnonfcHVwAJw+ZiKxAqBH39oSwG+rfM0OJW9EBJDSuxuzzFMCWhdH1vZ2iTiucbg0rlWWKGyZ3sWjvo2d2uUXl3xokuRwbiXYAZuKXofuZkfVoL3TlKYn4UQjAgsw8KUhftXg2lMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777012307; c=relaxed/simple;
	bh=zzvMqByL0RJuKYWie71DUYUH7s+eXERIngEuTBdypHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rZ8qsUvWTh9f7YywZhd0hl2ho3IjmyvM++EsVoQ5F9cT6tadhbnZvsgXbgAUlDYwpgZTDw2nTdlBj2yJFOzK9sM9kHD3UJ+lert/hUBRFajyglutnXUoOg+J4+52oVHZ9YXrYqcenrXuRgRW0X/hhirD6zGcZSN3fw2U49Nt4zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hqk6LNcp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Coo32nJ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NN3I4q1888410
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XCWQVhmsaS2QaLE3Q6kqx5
	j5JEt6MkVgu02k8sxgf8o=; b=Hqk6LNcp9iaVCCmLgmfYNfLRiLnchCODmXMjsu
	l81I9EJ46GvHoNq0VNJU2mF4ucCDa+Myh0ddojhpX55RAfTNxyy1W+YXpDht4hn+
	TwI0xuzSOBzjKzmx7C+HV+QW3LSLGZtJoZ15LlhF8ID7XOzOSqX2ut3OZUf/2A0H
	RHcaeXlNaTNmPIOIdG7I3DI6X47nRcOsLk3RVHKYdVDruvSA2aJZ2Jmn38rIK16T
	N8gD41yQTh79jQUZhzGnZuNPt+uLy87CoUlHU7NJCIIA3oD1r5sN0B6nzNkjy5B9
	E3Pkyw3hr3l3C4DKzLin27NVmvSwERBfPWi5/e3ngdZS02Kg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9du2pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 06:31:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c797e31a9b7so8606363a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777012304; x=1777617104; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XCWQVhmsaS2QaLE3Q6kqx5j5JEt6MkVgu02k8sxgf8o=;
        b=Coo32nJ+OA+81aHF58MxsAjapvuF8EHfjY4DMOfKEtREsxk4Blhe5AeHWknOSmSVKf
         f0IpogkB+eyjvueLuo4OuviQSoDh6bbOZAkmu+8ItJXBl5X6jPHqc5ARDrDIgZKmEfQu
         LlWww4dEbYePnu2kbnm37fHUPh0U1QxNrleQHa8EY2iqtC1FuZCHlms9PXFtVZctm7r4
         nMiHP7CC5NZyXzuxIm/agnRwc2yxyAr8z+SsS6uFgE/IAEHMO/s9/5sbOj7Fr2q13Gay
         Masf8qcbNrVMDsxWDcPt1Q11Ti4tMJzK8mf+Yyp9SKwfgfO7P0cTbGfnVXs4qbFk5XzM
         khQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777012304; x=1777617104;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCWQVhmsaS2QaLE3Q6kqx5j5JEt6MkVgu02k8sxgf8o=;
        b=RfFwU0TI3ho8X/G6dQGCOEcIo6yCBybStIX3BnabOSTzBI+H1IyxMjj8pi+qum2vj9
         DXct9gsG6ajhvRd4erGjyzZuHIX/7RT2lzLn5CTwr8/Wj5pDkByZfwlO5yOQlH3eS0yZ
         TbTwz5FL7WFWPd3tzQqtxNOjFk3aaK+z3MxqT4QjF9VGQXd1caTuY5temR62LdqU5Pcl
         psdW+WXTFvEdgMpxM7DeUcTF5Ki3deHrymEhCx1D9jVAVPilb0mKhCHdKNyarP+gaX7+
         eoCCu7wysFHVWYN52RIKnDbUxrRQaSB2asZifcmxBXtuiq5tazx+ZdFEFqQ3BEk9QEgK
         /YgA==
X-Forwarded-Encrypted: i=1; AFNElJ/5IwzxxVYnuw3J56gIFIEHORLl2dKyqeCkXtDKjVRAJAdv19HUZxpK5h0GwCf41OJ1sROPAeHG2TSs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyht59cVGzcY/ZJ8HVFA4iNyzslORScFsrFI5koFZ1Z2iF082q
	TgirrOf3J1MHWvSxvnpLAmZMyuYcqCWVal9hXS0twj+MLvzD+AC3uVzibhpFe5rfd4FaB26HGs1
	8sDgHKSV2H0FnWz8Pe9L8/VY08DK6iHbwe0Gj/8O/edyVmGVh7+O7KfTE1T512lnW
X-Gm-Gg: AeBDieuYUwCIa+HhwBSULMnXqBo/cAHzzN9Kv5qs8YRnFTXX3sqPkCMODQdyYXqf5vJ
	LFEnJ9GUuXPDW5jibQchM6VoT9xTXrJn6AvbN3SiCMPPUyAO98rRM546su16JAxWnEHtsQo1Cgv
	XTINmO+FzvHDaaaFkQn34ViXz/Dbnzyi0YXv+Piim9FFX4uFMrD3P48enEZR6urvE8ouIR7eijs
	6BkeULQY/C7yOxl8mp5Am+FyEVPO3DO4S5myWgBEAsXagXtzhleTK+HPM27bcXqcCa/Gi0Y/oKc
	pwu734bfJ46osK+FXoxrXKo/1wViQiGY8FRl2HPK8Q/gG7cvyWSvel1p4P3VAE95d636G4ssJlr
	oJNupHqGUj830H1ZlqlNgiXIMY1j1jPU8OJuX5sCO0EjcNF7bsct7iKSbeeJOzQ==
X-Received: by 2002:a05:6a20:4326:b0:39f:3559:7501 with SMTP id adf61e73a8af0-3a08d8eb11bmr36870253637.41.1777012304119;
        Thu, 23 Apr 2026 23:31:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:4326:b0:39f:3559:7501 with SMTP id adf61e73a8af0-3a08d8eb11bmr36870212637.41.1777012303588;
        Thu, 23 Apr 2026 23:31:43 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7977031729sm17754692a12.25.2026.04.23.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 23:31:43 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:01:24 +0530
Subject: [PATCH] pinctrl: qcom: Add irq_get/set_irqchip_state() for msm
 gpio irqchip
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-pinctrl_irqchip_states-v1-1-85286f078916@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADsO62kC/x3MQQqAIBBA0avErBPKJKirRITYWANhNiMRhHdPW
 r7F/y8IMqHAWL3AeJPQGQraugK327ChorUYdKP7xmijIgWX+FiIL7dTXCTZhKKsReM77QffI5Q
 4Mnp6/vE05/wB4xH6RmgAAAA=
X-Change-ID: 20260424-pinctrl_irqchip_states-aae4f32f9f6e
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777012300; l=2906;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=h02fdp0DbXznNzmrHM3xZOzhwlTmloFlpI4uxtWczsU=;
 b=oitZkZ74zfH3TPM1mCDzF2vNaNn8TpgKaiEjNAuNXb/buNd9xf0VDxS4p13BmJNTfE6nbvE0e
 +HYXjwfB9/QA6iMdq3ILBwl1pnoKSjJ7RcMFuvNuy+abMSNZ722qYQk
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: V_47yJ5IHdin019bbsIby9NXU83TWjKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA1OCBTYWx0ZWRfX7Ajl3W4zcd0i
 qaX1Umzigkf0fKYq5IzlSkhqD6H3SU4TB0c2xT+u/WDRMVI4drDozo/6m/olfbGUP0tNBOMcy87
 DDU9H6cPEdCtoiMbsXqIrcTNro3x6NbuQQ/enPbNrqeRVcLZPO3fe3rqSGi7euA+/VvqXiejNfX
 6D6YQAZhx0plEXHoT97bICURF3Jo88QlVwLoFUib/YNONfTAcecdbWPievN4+h0IQ/1meU6Y1AG
 VsVQ5UcEfiPQkS+M4sfx0Ihuc/eZgKxz+0Xi0RK/QiDyRREA8us8lwz3O/iRHPVMyDdpthPzYiZ
 dqMB1fHAvleEUSCQuZy938ST8uBZgUWWRRAM2eYmJEBYQARBNjr5bVrP32AItfa6Ee6KjXFvA7d
 gAHIL6QQJgG5AOzT6HUrvZO/4SXhX1GE8xU8KFwkW/D7PhqTTcap0ZHK/TfOu0edFo3hqf6On7s
 9E9LHEEPJszqzsp0oOg==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb0e51 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=V_Y7YcmqozLAU5NnLsYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: V_47yJ5IHdin019bbsIby9NXU83TWjKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240058
X-Rspamd-Queue-Id: B07D045A433
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35454-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

MPM irqchip monitors the interrupts during SoC sleep state and after wakeup
replays the edge interrupt by making it pending at respective irqchip by
invoking irq_set_irqchip_state() API. The msm gpio irqchip however do not
implement this function making it impossible to replay the gpio interrupt
on any MPM irqchip based SoC.

Add the missing irq_get/set_irqchip_state() APIs. Implement only
IRQCHIP_STATE_PENDING case which MPM irqchip uses.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb85405fecdd4770ba3d4ab684563f0..925fca82252413d8e21fb47a0cc3a9ade7d5fe67 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1305,6 +1305,43 @@ static int msm_gpio_irq_set_affinity(struct irq_data *d,
 	return -EINVAL;
 }
 
+static int msm_gpio_irq_set_irqchip_state(struct irq_data *d,
+					  enum irqchip_irq_state which, bool val)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
+
+	if (which != IRQCHIP_STATE_PENDING)
+		return -EINVAL;
+
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return -EINVAL;
+
+	msm_writel_intr_status(val, pctrl, g);
+
+	return 0;
+}
+
+static int msm_gpio_irq_get_irqchip_state(struct irq_data *d,
+					  enum irqchip_irq_state which, bool *val)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct msm_pingroup *g = &pctrl->soc->groups[d->hwirq];
+
+	if (which != IRQCHIP_STATE_PENDING)
+		return -EINVAL;
+
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return -EINVAL;
+
+	g = &pctrl->soc->groups[d->hwirq];
+	*val = msm_readl_intr_status(pctrl, g);
+
+	return 0;
+}
+
 static int msm_gpio_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu_info)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -1393,6 +1430,8 @@ static const struct irq_chip msm_gpio_irq_chip = {
 	.irq_request_resources	= msm_gpio_irq_reqres,
 	.irq_release_resources	= msm_gpio_irq_relres,
 	.irq_set_affinity	= msm_gpio_irq_set_affinity,
+	.irq_set_irqchip_state = msm_gpio_irq_set_irqchip_state,
+	.irq_get_irqchip_state = msm_gpio_irq_get_irqchip_state,
 	.irq_set_vcpu_affinity	= msm_gpio_irq_set_vcpu_affinity,
 	.flags			= (IRQCHIP_MASK_ON_SUSPEND |
 				   IRQCHIP_SET_TYPE_MASKED |

---
base-commit: b4e07588e743c989499ca24d49e752c074924a9a
change-id: 20260424-pinctrl_irqchip_states-aae4f32f9f6e

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


