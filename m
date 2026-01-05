Return-Path: <linux-gpio+bounces-30151-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39CCF44BF
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 16:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99F2D301596C
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 15:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8932FE060;
	Mon,  5 Jan 2026 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HDdRI2aE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArNp92B6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89E420A5E5
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625524; cv=none; b=T5L/dFINSUr3CJ2wOsJ7QlBoZv1jISrS9fuIrI3agBL7O9s5ayXROOBsDXtCx9K7SfB3YZNflZp5UDjQcinAPL7+B3rPyVjpFaX8FCH5T1zhbV+BF9Ex3tE/z49LqTORDOgjOCEg5mMLaC9L4Ak9bEC/Qs/f8oRWVOVXKXaY+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625524; c=relaxed/simple;
	bh=Nd5K0RjbOuP4dAx8M/lpJYl6guQq4laUFsGnK6qHp/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aIXoeOaIP/jRa2au3ywFWi44VdihgnYUwgD5p8ZCdux+1cEPTABSqgwVTnxghLqCQWoH+D53c1p58sZznwwPPc8eqEBllmH9hQ0HgzzHrvTVIPkDYASgu5bR9eJT3PQj4U+2oRQ/S25NK7dV9sBYpiCV7G+PX8Vwe+w93vkj7A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HDdRI2aE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArNp92B6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058wAi4594030
	for <linux-gpio@vger.kernel.org>; Mon, 5 Jan 2026 15:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h8sqd0bRx4sFyRQxvQ/xS8g6YPcXDS+nVdy
	q1H9VC1A=; b=HDdRI2aEFWBsVCXxYb7DDF/yRICuvU2f1RuxCRwfI5Ux79Ff1Ls
	TAAc+iOctJFy16bG8MRe775UCe0R2y0gzCJpoSIq8yMX/SMVozMNBoWmRMmKHPMr
	wWGMSJJc0jg6YaPx6DFv+z6S3ioL7TgmXLlmkH/OCIVvXUGERk1SIixoRjuKEOJR
	x+LpUw6izpW2OetRDZs6XB312A5fN33LzD39eCa8lHr9zXR/W8wJlCm0SCat1ngC
	kPUutsKih+ofHY7gWteQeDo3K8blwJ44VzKyX/9o6uUoqRF9k/vkGV549tWfTv7G
	wv9A7eSrA5K1EwyUzp9RHicOe8TEhJY66Dw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pgx7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 15:05:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f5bfb23fbso61325241.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767625521; x=1768230321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8sqd0bRx4sFyRQxvQ/xS8g6YPcXDS+nVdyq1H9VC1A=;
        b=ArNp92B6KmgHGVzQXC+nJwG+UzwTzliMEWXnGUzOhN2JewxLdjuS/zqWKjJwDIaCfU
         WCijVQPvXpBZljZ1qBwobCvu08HrH4nwzxXIMXEppSR34dWS8/j9jUrJo7mmLranLv7j
         g6TLQqjRnyeIbF5ElEfMMT4hazxvKXyQ58jHGPzfV3O8AEdHubAzN8CgSZmLT3Oiqqy6
         ZArk1zCpKAUweGLQYTX27efRZcDFFZPM/nOtqthYS0VEzR+VX47i9iCYf9eno7qhA9gP
         r+Kc2QkQPjfpjVNYYXJeoPhD/blsvilp5SMx75dqymyH8ybS0+v0jgyNvwTUaXxIdFPd
         W+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625521; x=1768230321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8sqd0bRx4sFyRQxvQ/xS8g6YPcXDS+nVdyq1H9VC1A=;
        b=NRDaQVRSDgoX5/FilQ6RO4ZFQw2uziAzR85HGVa0Ro8y/DfGlkUC5JasBtvsTq8y2t
         VZ9xlbUitKpyT9RZLTXxeYEr6eedJLaAo+mvC4wE+skkKoPCuX+ly769lmesJxQadMuC
         sn74S3589Dz0DlGe4HSuaOxWeGEryFSjW0frbyVP4EtoBrMMTFndaZHg2TvQlwbDg3GD
         3EbvAI31WorpifPcuk+c7yctxa0f9XDOe7tG9emlak+wT+4I4fiRGVmRZPtwIEjhi0Co
         gjOSaq+NQ+WLUIBrXVnxtqoz2MOqExscCsyAU+w3Q4AS7b7E3kMZ91dnJupUYcb64TQd
         gt4g==
X-Gm-Message-State: AOJu0Ywv0Sum6jqQJVfanHyoIy2+eYUvxPIWp27Rtnpr3hseh9KZqk4t
	g2ZMpn/xQA/Gf+zirIVR1AS9l44fHNLEqs9CAFt4jBF4NJJ8TiXM4HrP/ed4d2Z9zfXgKGxZKT6
	CGwE2oJOWawhU3ff4/MnZW/KcasRc/+a0v+S23/8jL8IMh+NZRBtkdzhcb6u2D/z8
X-Gm-Gg: AY/fxX6gVluvaMcMEfnee4aFirHoCHO6n4hUKWgREMyvrYoy+sbR3SZo/ltJoqp0H2x
	bwKNwEiJW3DjGEIi20W/12MpDnhgzX/EuIGzL+lxEEAQM7VxpNbLsFFCJR6xevRt3CkTVb77C0o
	SFh1WDCKtAci6AnXEgqgukkPAO4hjwrdFKuoWuN55P7cER+CySuRGSTVDHsQ0zcn6lejAhp9kSv
	NcpVE8hz2dLRFlCNIq/2xfKw/6w9L5wnaFZOL4U3iEpTKIcGPEFb5pROePqVXJzJvNN2WH8sjE8
	YlpGQsUCTpmjc87Kiwx5nUWuu1zXdbqU8NG7IqsF2+pJTZweunmiwYHq2Dbpzu4+RHThNaYSi7g
	HiqysEuGKWYA8td0nvcwThk84Gs76hdXnSeIWOx8=
X-Received: by 2002:a05:6122:7cd:b0:559:6e78:a434 with SMTP id 71dfb90a1353d-5615bbb613fmr16174863e0c.0.1767625519941;
        Mon, 05 Jan 2026 07:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtVydwCbdWuKMgUh2s3Z2eGw3aJWvq/Nci+QqerT78i3llXQMgvkcfAvCV5pFW4+FSDFw4XQ==
X-Received: by 2002:a05:6122:7cd:b0:559:6e78:a434 with SMTP id 71dfb90a1353d-5615bbb613fmr16174732e0c.0.1767625517957;
        Mon, 05 Jan 2026 07:05:17 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dd3b:c635:dd06:9574])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c08ef66sm57732685e9.10.2026.01.05.07.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:05:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
Date: Mon,  5 Jan 2026 16:05:08 +0100
Message-ID: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEzMiBTYWx0ZWRfXzdZGIDTuVvzR
 cotl6DimRk+cDA7Wgo/WxuuD+z/Wr7Ov5i1vdaJ2vcRqpevQ1MjBBkFHcoqyFJS3o4F4afNWSPG
 C+4T020qTASMgNLz8LycHT6eSw12ClJl9lFaVA62qO6B29eRfqdF16Brv4mDMZM3AF5lMnl/sCs
 Gt/lDYHXBk3p8hS0e+cHs5eJzJClUV1c/P6UQ7LK4ru0bebPWbyPI3ZtAixt6iEWXcW4qI90MkY
 Wc1UVa55Cg30avYhTqU8TmcQUZnz+zVat2I/1Nx/tDjDABK1Bqlx9yPaQ2X6xy0Hxk3TFKEt88E
 q7p1xckxJBJuXrXgisU0Tkz3BeLiBMoGbY/OgCin1rBkOWp5NIKNufUxxtzAPX8RLHl7tA9s1c7
 qbdNYgbMttBuMVLSMX423G7dNf5XUCxS8OutmuvFwb2bOe0rCCHC5D3XLLHbiGFyglMvm56hBiz
 rk6g9o0f15kUGh80nuw==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bd331 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=z2IfzJB68yTmpBagawIA:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: eQllglMXI5gpqUt7WsCRzlHI5Khiv_fo
X-Proofpoint-GUID: eQllglMXI5gpqUt7WsCRzlHI5Khiv_fo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050132

The GPIO controller is configured as non-sleeping but it uses generic
pinctrl helpers which use a mutex for synchronization.

This can cause the following lockdep splat with shared GPIOs enabled on
boards which have multiple devices using the same GPIO:

BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:591
in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 142, name:
kworker/u25:3
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
INFO: lockdep is turned off.
irq event stamp: 46379
hardirqs last  enabled at (46379): [<ffff8000813acb24>]
_raw_spin_unlock_irqrestore+0x74/0x78
hardirqs last disabled at (46378): [<ffff8000813abf38>]
_raw_spin_lock_irqsave+0x84/0x88
softirqs last  enabled at (46330): [<ffff8000800c71b4>]
handle_softirqs+0x4c4/0x4dc
softirqs last disabled at (46295): [<ffff800080010674>]
__do_softirq+0x14/0x20
CPU: 1 UID: 0 PID: 142 Comm: kworker/u25:3 Tainted: G C
6.19.0-rc4-next-20260105+ #11963 PREEMPT
Tainted: [C]=CRAP
Hardware name: Khadas VIM3 (DT)
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
  pinctrl_gpio_set_config+0x40/0xdc
  gpiochip_generic_config+0x28/0x3c
  gpio_do_set_config+0xa8/0x194
  gpiod_set_config+0x34/0xfc
  gpio_shared_proxy_set_config+0x6c/0xfc [gpio_shared_proxy]
  gpio_do_set_config+0xa8/0x194
  gpiod_set_transitory+0x4c/0xf0
  gpiod_configure_flags+0xa4/0x480
  gpiod_find_and_request+0x1a0/0x574
  gpiod_get_index+0x58/0x84
  devm_gpiod_get_index+0x20/0xb4
  devm_gpiod_get+0x18/0x24
  mmc_pwrseq_emmc_probe+0x40/0xb8
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0xdc/0x164
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x80/0xdc
  __device_attach+0xa8/0x1b0

Fixes: 6ac730951104 ("pinctrl: add driver for Amlogic Meson SoCs")
Cc: stable@vger.kernel.org
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 18295b15ecd9..4507dc8b5563 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -619,7 +619,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.set = meson_gpio_set;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
-	pc->chip.can_sleep = false;
+	pc->chip.can_sleep = true;
 
 	ret = gpiochip_add_data(&pc->chip, pc);
 	if (ret) {
-- 
2.47.3


