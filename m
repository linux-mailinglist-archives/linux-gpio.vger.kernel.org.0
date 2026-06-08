Return-Path: <linux-gpio+bounces-38080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HqxnJAiFJmrlXwIAu9opvQ
	(envelope-from <linux-gpio+bounces-38080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:02:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F453654541
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 11:01:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=windriver.com header.s=PPS06212021 header.b=BmSUrsff;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38080-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38080-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=windriver.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 081773077622
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 08:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725203B4E81;
	Mon,  8 Jun 2026 08:43:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD583B4E8F;
	Mon,  8 Jun 2026 08:43:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780908229; cv=none; b=qyF+YVnWew7d1g8FnP3y8Tvu3Pg2HE/i8CzChmHDrwaoVoEH2Od9JvgdFu9xy903nnc34nF+ebGjjk3q+4H46HiyqZwiAV4FQ5peppyrsHMzJ6RNc4HZPvmAr+xdDqzetJU/eihX+YeAkZ7lB/RUppjErFQ1IqHsUnI5p+Dd9ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780908229; c=relaxed/simple;
	bh=R1A62sBTIsnsIrIkuVdi5uShNH1tnFh4b+CAqoV/ki0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LV59brjcNFWHzvD+tNmB8j3wK2jhF6akyPk8WnX/LHP/30fapFf4O84uo1Mw1gINAe23MKE37FqjuzenDp7b63W/PzI98X+tjVj5Tp9tluiCjj46M+yF79vJaX2OGoK4kICY9mc76O1AprvKwEBjhpNuZPuU5dwiSpdfrNGzMMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=BmSUrsff; arc=none smtp.client-ip=205.220.178.238
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586TpNx3823718;
	Mon, 8 Jun 2026 08:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Y/mpt48Jh
	m0iof1AVQVCusozF8bWRFDzyRGy2n0WC2E=; b=BmSUrsffsS9BiWcQRhcOpluYB
	J5udOibxkqaoCDw6lte0MgKoRXzcQlKwLVi9ZSx08rkysjhYIiAvGUWD8jGWu2Jy
	6dTobXzjzJgHd8OWEyBaPRvRGOJhN6nfFAD0h4P1lAlTLU46znPy76G1DekLQyhP
	CgEQjzdFnMqgX7qWbtm0ciY4IJqCKiKUcw8MqS/PvOwJOpmHplGLc0MOtwzV0I67
	HhAEpTrqU5fzAT7vWsz8Xv4c9K3q6MJ5Wq6N3/TFTBy5vJgEvxOXiV4Q+v+mKwTk
	7tmgglBCsydcM+NbX52n8B3Atmb3lKGvozdCILQ96sU4BMBU89s+9b4uJAbAw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4em8rxjhfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 08 Jun 2026 08:43:37 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Jun 2026 01:43:36 -0700
Received: from pek-yzhou-d3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Jun 2026 01:43:34 -0700
From: Yun Zhou <yun.zhou@windriver.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <baruch@tkos.co.il>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yun.zhou@windriver.com>
Subject: [PATCH v2] gpio: mvebu: fix NULL pointer dereference in suspend/resume
Date: Mon, 8 Jun 2026 16:43:34 +0800
Message-ID: <20260608084334.2960803-1-yun.zhou@windriver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7EBramag7WcFKFY5czIHx60YX9hY6aR_
X-Authority-Analysis: v=2.4 cv=FP8rAeos c=1 sm=1 tr=0 ts=6a2680b9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=bgq-gzGYpSYZ73kGfkMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7EBramag7WcFKFY5czIHx60YX9hY6aR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA4MCBTYWx0ZWRfXwiixkGcfzXi+
 NsIxKo+1ICnbIEF4M9vtOmi8dLUuUvhroKIOQQZqLdsRHY5xFZBRLHFAnnc9wwdGNYWZSUtyqjH
 GyaqzvIvPPHv+I+uQzktup4+lhHigTNmlyg6AT/NPoNWicxWiKcFatVOvv4lOizfwp9aeAk7syp
 OHAkoYIIKtviu+mJowlmdpYK3G3WfCcjvkAjvgtFXjS35oCkB7hiNw3BArHm+BpLTKEMX7+UsV5
 2k9sYiafCuCyZSsiTRcN7JLi+uxnlICAbRN2p/Zo46ObS9WvXEDN79ebyLlvm/Zpv2z/GmEOMUW
 R6fdOWS/hfuzZr0vmKa7zDr9nRbtuBW0LAL1DTgF+kvDS40kLdoEls+OoZNTGeSzgbNhoJ1skym
 rJ932vptDvzvXqY0ZelEO9EewodNS4dB+dgl5AZ3F88yIbTFHNlB6vDiAvmc/ksc0rfdKIqSD8o
 yPyI6EEy68u8+OKrlVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-38080-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:baruch@tkos.co.il,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:yun.zhou@windriver.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yun.zhou@windriver.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[yun.zhou@windriver.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:mid,windriver.com:dkim,windriver.com:from_mime,windriver.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F453654541

mvebu_pwm_suspend() and mvebu_pwm_resume() are called for all GPIO
banks during suspend/resume, but not all banks have PWM functionality.
GPIO banks without PWM have mvchip->mvpwm set to NULL.

Calling mvebu_pwm_suspend() with mvpwm == NULL causes a NULL pointer
dereference when it tries to access mvpwm->blink_select.

  Unable to handle kernel NULL pointer dereference at virtual address 00000020 when write
  [00000020] *pgd=00000000
  Internal error: Oops: 815 [#1] PREEMPT ARM
  Modules linked in:
  CPU: 0 UID: 0 PID: 406 Comm: sh Not tainted 6.12.74-rt12-yocto-standard-g4e96f98fb7db-dirty #353
  Hardware name: Marvell Armada 370/XP (Device Tree)
  PC is at regmap_mmio_read+0x38/0x54
  LR is at regmap_mmio_read+0x38/0x54
  pc : [<c05fd2ac>]    lr : [<c05fd2ac>]    psr: 200f0013
  sp : f0c11d10  ip : 00000000  fp : c100d2f0
  r10: c14fb854  r9 : 00000000  r8 : 00000000
  r7 : c1799c00  r6 : 00000020  r5 : 00000020  r4 : c179c7c0
  r3 : f0a231a0  r2 : 00000020  r1 : 00000020  r0 : 00000000
  Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
  Control: 10c5387d  Table: 135ec059  DAC: 00000051
  Call trace:
   regmap_mmio_read from _regmap_bus_reg_read+0x78/0xac
   _regmap_bus_reg_read from _regmap_read+0x60/0x154
   _regmap_read from regmap_read+0x3c/0x60
   regmap_read from mvebu_gpio_suspend+0xa4/0x14c
   mvebu_gpio_suspend from dpm_run_callback+0x54/0x180
   dpm_run_callback from device_suspend+0x124/0x630
   device_suspend from dpm_suspend+0x124/0x270
   dpm_suspend from dpm_suspend_start+0x64/0x6c
   dpm_suspend_start from suspend_devices_and_enter+0x140/0x8e8
   suspend_devices_and_enter from pm_suspend+0x2fc/0x308
   pm_suspend from state_store+0x6c/0xc8
   state_store from kernfs_fop_write_iter+0x10c/0x1f8
   kernfs_fop_write_iter from vfs_write+0x270/0x468
   vfs_write from ksys_write+0x70/0xf0
   ksys_write from ret_fast_syscall+0x0/0x54

Add a NULL check for mvchip->mvpwm before calling the PWM
suspend/resume functions.

Fixes: 757642f9a584 ("gpio: mvebu: Add limited PWM support")
Signed-off-by: Yun Zhou <yun.zhou@windriver.com>
---
v2:
 - Fix Fixes tag commit title

 drivers/gpio/gpio-mvebu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 22c36b79e249..c030d1f00abc 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -996,7 +996,7 @@ static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 		BUG();
 	}
 
-	if (IS_REACHABLE(CONFIG_PWM))
+	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
 		mvebu_pwm_suspend(mvchip);
 
 	return 0;
@@ -1048,7 +1048,7 @@ static int mvebu_gpio_resume(struct platform_device *pdev)
 		BUG();
 	}
 
-	if (IS_REACHABLE(CONFIG_PWM))
+	if (IS_REACHABLE(CONFIG_PWM) && mvchip->mvpwm)
 		mvebu_pwm_resume(mvchip);
 
 	return 0;
-- 
2.43.0


