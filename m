Return-Path: <linux-gpio+bounces-12801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0109C368C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 03:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FA001C20A61
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 02:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C7B2E40E;
	Mon, 11 Nov 2024 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Iqs2Ik+N"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m17242.xmail.ntesmail.com (mail-m17242.xmail.ntesmail.com [45.195.17.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EFF23CB;
	Mon, 11 Nov 2024 02:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.17.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731292471; cv=none; b=liYPQEB5sx/CoKHwhbsrvnogPUG76zEbKtyhUMtW+dXUqzriuQ0uuvy9TQJPfE1UkW7XkRDEvXvqjwwAKObsYZCXbvSkQ1u2vvb6cM2uZwivAPtVLOsV5g1MJoZ17xmZYifOnYy2WEbRUxnXBBTxZvL4f+/hbjZnZh7MWSnDPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731292471; c=relaxed/simple;
	bh=QIHShdzz/cGBXxItNt60dt64FPy2K8LNkGmcDihujAc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UB1kcRC3VZputA5bQKSdnkF3U5cEoKJtbYP2YvqUkx9yHpNYYEuht9vYmpf/z4s8Trcy6llkmUstErSj7uuoA8qRGKnzWtKi6m0K9+yS/Z0/NmUlImW1RR52zy+O5/g9m3l6TBE3GA7Rv3cLpifjkXuaAeB/gPSPsBU16FqIObw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Iqs2Ik+N; arc=none smtp.client-ip=45.195.17.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a582e;
	Mon, 11 Nov 2024 10:34:18 +0800 (GMT+08:00)
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
Subject: [PATCH v4 0/4] gpio: rockchip: Update the GPIO driver
Date: Mon, 11 Nov 2024 10:34:08 +0800
Message-Id: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkIeSFYeQx1CSBkdTUhDSExWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9319126e4009d8kunm258a582e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTo6DBw6CTIjQyw2Mw0wGDI#
	HDNPCxFVSlVKTEhKSUJJT01LSUpCVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSklJQzcG
DKIM-Signature:a=rsa-sha256;
	b=Iqs2Ik+NcCDLFSg6XbsIWIUVDLf10uJ+I3F+4RKhZ8gUF1NAWIbdafEeWJu5oeSFwzbIvbF/bajJ3bprPT3BP+KP8LA6ucz/jLnRy8JlAkVma7es47nK0JljLJaD6IaWw1BLWY5ts7mdEp5nyFbiHs80wqAExBcm2RBMDFeWDn0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=tP2ohGVIGmdTyqdy89HiQz2NLz+eTXxS/9PUWtKazWc=;
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

Ye Zhang (4):
  gpio: rockchip: explan the format of the GPIO version ID
  gpio: rockchip: change the GPIO version judgment logic
  gpio: rockchip: support new version GPIO
  gpio: rockchip: Set input direction when request irq

 drivers/gpio/gpio-rockchip.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

-- 
2.34.1


