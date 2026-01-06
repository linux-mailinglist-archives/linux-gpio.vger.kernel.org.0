Return-Path: <linux-gpio+bounces-30184-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE3CF760F
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 10:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69301300FD5E
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 09:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2345330BB86;
	Tue,  6 Jan 2026 09:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJnxGMIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY8qFCPz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7674B30B52E
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690021; cv=none; b=hScBOhAFD8emwJ0BbUbqRDdkNjcN8qe8WezVz7f7vCfT87pH+4ZOkwxSX3o23y0/Mz8qsN38gpW40BHusSvJp0CgKEOMtU4KUPmy6WCP4TEL+ZzziVrPNEz9sEnD2g5mWRYkjb/fdLm0xEjfftFzZBui4zkY4TqSI5Ik4jhlODc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690021; c=relaxed/simple;
	bh=w/A977JRSXpQfJbkXr/2XYvk5k4zy1OWbRcWorwj+Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V98/Ze9TgvAToOdMLi2aj+uhOpRIBOG8jlN8FzA79u/nIWXZuRsFk5alZJKcuQ8uhl86yYSvTvqHyJMmPsxkrvOy8HYPytRzX594unbHU7ZJH36Up7CGXsK7iwvQWY3/hoHmGsI87obwAcWoJgCKqkAXD1f1WVAB7rW/V+Pmn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJnxGMIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY8qFCPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QJX03271609
	for <linux-gpio@vger.kernel.org>; Tue, 6 Jan 2026 09:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zUmJx583wbIqbI/LnTq2qTUX5b+XpJNoiwx
	n1/rffoo=; b=dJnxGMIAyzB4PbZ6MmAJk5BnLsOhqj3GNT0QhtWZwCRCaqKJRyo
	6gq39vnXnOoszTprusZdSQL7N/GxoWO5RS9W5SnB2Z9bxmRCpjhCoC9moTOqLTr6
	Fe2SeWLCLC4YJ02HHKQZAmM1d3akRT4yENG52WyILRPHnGuOwmnTbyiMAmNiUD7j
	ieO4CHSTVkN358A4ndSushtRNHzpfeV2LqwAvWZQB1/6ejtK+iUYwPu6UCD7CNyQ
	br1CenYNR/qi9jiaduj5bezt5X6D66XZmWNnEbWiKkciWL7JMa82Li/zAFek3qMV
	BEIbxe3e8DaH/hDao5i2C070EB0MFnYmgyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02nmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 09:00:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so20420511cf.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690019; x=1768294819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zUmJx583wbIqbI/LnTq2qTUX5b+XpJNoiwxn1/rffoo=;
        b=VY8qFCPzXV05Qp9awzLoe9CBveVbC+k9qPLuAEv+qk0mlCoDwlzVR0PpawRnkh2MOk
         i52X36gzJ1jM8AtxgXUGvzJGlKvegl9B7+4ewOQp2Joq5arFQxoGciezyJF3Eh+Ib1L1
         2rGuDz4c6W1IUR8rT4EaRYprSDQAGm/9GOUez9Yrr6/fnxB095dgvT6ng84euwvPwogU
         0WKQKPF8Ch/z1/YQDrpCXieX/AhYgc5TprYV1/57oAmPIAkUZBYiGzOyBEpvK36UURVP
         TtQuQiYn1CMqudJhkbDsW+AJgyNTFvHW2/szp2yxUbc6ur/eTCmjcQeleCHfKTLKvjUW
         oKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690019; x=1768294819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUmJx583wbIqbI/LnTq2qTUX5b+XpJNoiwxn1/rffoo=;
        b=qgFXPAJVSckEYK9ABLXxXvtGJeWq6STgU67kywIiTj44UM+OljiOsFMZcb2hvD622+
         MACWK27pQkvEOTGXc8KNjue1kHyqVTBPNGLUZXBUelSNixPCSSme1vLVNq0aRAmQEAHL
         RQWxF3Fzp0rwCr0NAYC3b4EjwAhF9C1iSzS2eUffCt2HDpWo4sREEzIOue9hMNJOVEoK
         v/umAoJMB0Hkhxl2xpGMF7qHYSyY57MCggnQ+nFesUW+hvqywnmRUPQXsihVpk9rZfKj
         0u/md7evbWuzsQnx0Gp57NS0sisJNCl5dnYMqPwHDZHjQR3qPMr1/p3D0WG4BE3o3KEx
         MexA==
X-Gm-Message-State: AOJu0Yyihb/upSpb95/Bo+LHaDg7ZkedkwZlR0qZcWXKtbAK3dHDBhhM
	e6q1GUz+qu4OSoCqa41gO2/78j321ysrYztJtXKDjWytzG5Qr6HuclOpBJjwFotc+vCquNRp0B3
	GkjvDrvuCOJ7JQ+pkgZJXDoy5R0GFp2tG3IW12IRG2fCMvPlyLuQXKT0PZMHiMS64
X-Gm-Gg: AY/fxX7o+BP0tw8X9MPL73PJa6DFjXQOD23Tx1PIO1C85R6C2q/XJX5qul1mymeNXTX
	oRNugW7HoToNO1bf48HQdIP01NZ0+TpgmkjUho05z5Prrb7gPzSOuVwn0zrrBzGOA1smmURfLhJ
	pcWutyg4PjozCNKRK92HjTMHe94POckxpFY/ebW6IfKtSdbCC+yfGW6PDYEsCx5eiuI87l2UgQ0
	viwTrJ2jZVEdqfllYqMIXQaBQ3+SahhnU5ghqGSwQW3l3kdxblbdM8PB7SYHXCtoZu4Xo8dxm43
	29tOmhJR6WB+vnMHx/uxMSqK/xCUU/qj9uFbbN416O/rjgWLzg6kGqqIRZowyihmeyY/0kPOqMT
	udtu1aRi076/Wdzw8E/N5S6E/3SYGiGYyljftJg0=
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26639861cf.68.1767690018469;
        Tue, 06 Jan 2026 01:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiDIRIh0uRsi01LsmTGYlRfJRiytQ0H19Dw+EIaGym4rEAY4QFPoKpFGj+0y75JD3JHMf/gg==
X-Received: by 2002:a05:622a:4d98:b0:4f1:b398:551f with SMTP id d75a77b69052e-4ffa77f6136mr26639491cf.68.1767690018029;
        Tue, 06 Jan 2026 01:00:18 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a1e5:bc32:d004:3d67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3196825f8f.43.2026.01.06.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:00:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] gpio: rockchip: mark the GPIO controller as sleeping
Date: Tue,  6 Jan 2026 10:00:11 +0100
Message-ID: <20260106090011.21603-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695ccf23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=-jpIsuwBRm6Qzzl2v0IA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: FnmKc1wJe4w9LviUFUqwAXRXtuR0LLA-
X-Proofpoint-ORIG-GUID: FnmKc1wJe4w9LviUFUqwAXRXtuR0LLA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NiBTYWx0ZWRfX0AquhrgfTveV
 43OOESj88gso+l/0SPvxsOdrMS92rgQPUDqKioUEl2SWNSOLhgfT1o5FfwQ/tUwxyv8tRo/XyZ9
 iAjOwn4CfuYrrt8KNQe+FLSJ064wf8s4blW7xHj1s+AttYsaE4q83BI7UOc7T2G/zLKSF2UnYRX
 ISnDfGqJvB5uO8Sn6Ubk60s/lM/Fh0lGVu5LXAZArd7dt8iCrL9ffNXJ2Y2pHCeIRZTyAvNA7g1
 wfG6pK4ROfV3G02Bs+RELB6E+vLiaShPkW1kkeR5t8yOIgo1BFC6UbFn9xk1upvEn+c5T/Ib7qz
 DlkYSLwsuT5R2tJgVlWmEoJGG6g/IRv+W0Kigl+9m8ks/cab1Gnk+ZQsJ+xwllGjMdAHupG3uIj
 2pHt9JVB6S8yFCiFx2Lr/OSLZgbx0lH89bCE8ItiVwKNFj0E4mCtICvK9nnXJ9fhO9Qg3dSp/9I
 9opU9VfjhHzzbARPCOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060076

The GPIO controller is configured as non-sleeping but it uses generic
pinctrl helpers which use a mutex for synchronization.

This can cause the following lockdep splat with shared GPIOs enabled on
boards which have multiple devices using the same GPIO:

BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 12, name:
kworker/u16:0
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
6 locks held by kworker/u16:0/12:
  #0: ffff0001f0018d48 ((wq_completion)events_unbound#2){+.+.}-{0:0},
at: process_one_work+0x18c/0x604
  #1: ffff8000842dbdf0 (deferred_probe_work){+.+.}-{0:0}, at:
process_one_work+0x1b4/0x604
  #2: ffff0001f18498f8 (&dev->mutex){....}-{4:4}, at:
__device_attach+0x38/0x1b0
  #3: ffff0001f75f1e90 (&gdev->srcu){.+.?}-{0:0}, at:
gpiod_direction_output_raw_commit+0x0/0x360
  #4: ffff0001f46e3db8 (&shared_desc->spinlock){....}-{3:3}, at:
gpio_shared_proxy_direction_output+0xd0/0x144 [gpio_shared_proxy]
  #5: ffff0001f180ee90 (&gdev->srcu){.+.?}-{0:0}, at:
gpiod_direction_output_raw_commit+0x0/0x360
irq event stamp: 81450
hardirqs last  enabled at (81449): [<ffff8000813acba4>]
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (81450): [<ffff8000813abfb8>]
_raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (79616): [<ffff8000811455fc>]
__alloc_skb+0x17c/0x1e8
softirqs last disabled at (79614): [<ffff8000811455fc>]
__alloc_skb+0x17c/0x1e8
CPU: 2 UID: 0 PID: 12 Comm: kworker/u16:0 Not tainted
6.19.0-rc4-next-20260105+ #11975 PREEMPT
Hardware name: Hardkernel ODROID-M1 (DT)
Workqueue: events_unbound deferred_probe_work_func
Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  __might_resched+0x144/0x248
  __might_sleep+0x48/0x98
  __mutex_lock+0x5c/0x894
  mutex_lock_nested+0x24/0x30
  pinctrl_get_device_gpio_range+0x44/0x128
  pinctrl_gpio_direction+0x3c/0xe0
  pinctrl_gpio_direction_output+0x14/0x20
  rockchip_gpio_direction_output+0xb8/0x19c
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_direction_output+0x34/0xf8
  gpio_shared_proxy_direction_output+0xec/0x144 [gpio_shared_proxy]
  gpiochip_direction_output+0x38/0x94
  gpiod_direction_output_raw_commit+0x1d8/0x360
  gpiod_direction_output_nonotify+0x7c/0x230
  gpiod_configure_flags+0xbc/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get_optional+0x18/0x30
  rockchip_pcie_probe+0x98/0x380
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Cc: stable@vger.kernel.org
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/d035fc29-3b03-4cd6-b8ec-001f93540bc6@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..bae2061f15fc 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -593,6 +593,7 @@ static int rockchip_gpiolib_register(struct rockchip_pin_bank *bank)
 	gc->ngpio = bank->nr_pins;
 	gc->label = bank->name;
 	gc->parent = bank->dev;
+	gc->can_sleep = true;
 
 	ret = gpiochip_add_data(gc, bank);
 	if (ret) {
-- 
2.47.3


