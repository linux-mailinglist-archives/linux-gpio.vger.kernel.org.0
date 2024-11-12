Return-Path: <linux-gpio+bounces-12852-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A06F09C526C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 10:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 589D71F22B02
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 09:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0800E20DD5E;
	Tue, 12 Nov 2024 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Edqr9xHV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1045.netease.com (mail-m1045.netease.com [154.81.10.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00A520CCE9;
	Tue, 12 Nov 2024 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731405048; cv=none; b=r3hwizIOplNB393z3o5AwOHFmq+Xxomi8wXE6rfW8ABviFnvtLtsPvJwPxyhvvyj9q7rhqwrpNXwOhKiIprQnjtqB/qj0k2HLTbWs16msQr+DO+XrphYJoPnKjOyc9htgoEVKYOy1zpuXlRdWZ3RzQn5UNurfR6GLSr2gycsSaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731405048; c=relaxed/simple;
	bh=XHialZyZOzF+GsLmhXh8aADlthJnr1ug3hIWROfJHuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=knSPmwQMYUPkkwWyJxAEPXWMr9VYIx7Tmrk0UpyF7ZIf7DzuUeSW1Xvb7zEYG+Qj5sEWI5zNEdc6L79s0TM95RFeW8WVapBSN5SWeEYw9FcKrleNY9XBrydLn4+1CqfZvVEd7/sG+HQQ8qMkB+/74laoCCsmyoHUh6AcZhKq+HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Edqr9xHV; arc=none smtp.client-ip=154.81.10.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f0f;
	Tue, 12 Nov 2024 09:54:11 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: [PATCH v5 0/4] gpio: rockchip: Update the GPIO driver
Date: Tue, 12 Nov 2024 09:54:04 +0800
Message-Id: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkoYS1ZCTU5MTR4fQkJKTB1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e14101309d8kunm275d3f0f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NSI6GDo*ATIuAho1PzQ4SSJI
	FDUaCz1VSlVKTEhKSExNT05IS05MVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkhOQjcG
DKIM-Signature:a=rsa-sha256;
	b=Edqr9xHVK5HY+RYR2Qhw5SKDHWdFh7d+vTKB1XYxCAtdo3oeM9ecLpupl6n6F1dt7Z4gQvdO3HMvS4uMJmJ9jzt0VqXORY8GIAJgmLweh84pPMbebd7r6iyMkqgyijxQw4dDHqY76dMaVUlLd7t+rxD53+RwB9thn3v5ssf8CyE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=6AuQFO64sIU4rM/H0ID+uAjI797Zr2ZRce2AWgFdwng=;
	h=date:mime-version:subject:message-id:from;

GPIO driver support acpi and new version, set input direction in
irq_request_resources, fix division error and debounce config error.

Changes since v1:
- Split commits with multiple changes into separate commits.
- Adjust backportable fix to the forefront.
- Modify messages of some commits.

Changes since v2:
- Optimize version number comments.
- Modify the GPIO version judgment logic.
- Use devm_clk_get_enabled to simplify the code.
- Use guard instead of mutex_lock to simplify the code.
- Use irq_hw_number_t and irqd_to_hwirq() in the request irq function.
- Since list_first_entry cannot return NULL, remove the NULL check.
- Temporarily do not add support for ACPI.

Changes since v3:
- Give up modifying the debounce config because it is not actually used.
- Do not add support for retrieving clocks using 'clock-names'.

Change since v4:
- Leave the V2 case first and the V1 case last in version judgment.
- Fix the error message in version judgment.

Ye Zhang (4):
  gpio: rockchip: explan the format of the GPIO version ID
  gpio: rockchip: change the GPIO version judgment logic
  gpio: rockchip: support new version GPIO
  gpio: rockchip: Set input direction when request irq

 drivers/gpio/gpio-rockchip.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

-- 
2.34.1


