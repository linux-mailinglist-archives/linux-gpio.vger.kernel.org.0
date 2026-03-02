Return-Path: <linux-gpio+bounces-32361-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJE6CH/spGmnvwUAu9opvQ
	(envelope-from <linux-gpio+bounces-32361-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:48:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 100321D25B2
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 02:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D473630095D8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 01:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582F4284690;
	Mon,  2 Mar 2026 01:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="OAuBQPZT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC6F1EEA3C;
	Mon,  2 Mar 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772416106; cv=none; b=pl/Kaak08RfbHTHuJRoXL/Xhxv3c35p8ywM1xZ4rHEwBPmkHIYqDMuk6WuoH2LOi+Wy5AeIU0PcGM/D4HMwJ/XfZw7r/ZkmfdgdocTajjQpjv/fSThRr+VCJHcPjENGvi8L/Al23RcdalHvhDR5WoLXhMS9ffx6WxlLiMW9oZDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772416106; c=relaxed/simple;
	bh=QZhF+qgQ4Pl3QoZ34rhwgRDMWPaVbM4WW2N6h02fTN0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=YhoesYf8fLABQEsWVUJOYeWy6x4JAbT/gRKXLLbEqkHxja/VOSKI9B8tcbyywlEVWQQiBV2V12bOLZ8g28TbTMTr6Y2rdzvX44GKRuXQHdv/cGnTFksZ14h8hyc/ZQ2EpDE4AZQMFnA5TK76Pfmkw/CBSaYOMbRdJhWU+2qajKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=OAuBQPZT; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772416095; bh=0F/TALQeGdQvO7Ni2Nm1Db1m0TwKWhjswTikRaNXVwM=;
	h=From:To:Cc:Subject:Date;
	b=OAuBQPZTYrMGvVnXyp+DK4wDB1eSkWcMg7zFfTlG1On7Lt6UeKTMDtnR04IQ6i++P
	 XwfHf7YbllXiMB63zJBxBHz7ZHuzkQoYi+v4QoHi777SN4NWNe6veipoPOXv/NGS2D
	 ZncdackyQEQA920kJEAmpVJAuiGhAkmzounJnMQA=
Received: from WIN-B62RPRBL2BM.localdomain ([218.76.62.144])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id C0CB9282; Mon, 02 Mar 2026 09:48:12 +0800
X-QQ-mid: xmsmtpt1772416092t210ubnfp
Message-ID: <tencent_3649448DE1A5A80CABC8A0A9C23982B51107@qq.com>
X-QQ-XMAILINFO: OKOirRU4nj6h1dRInmKP8hogqARKPUn8QIggM+Mp21ZByprKvIMHleXZEyvAAs
	 3XSqeYcJy1abw6WnPXI1qFA6jpgWi4+Hf/8ZdP0F69mkDsKzEHhoVpc/nOZbGDxPUI/Jy05TOSDL
	 1TWrVDouwHWbkUlMKfCU/x+FjrRhwn76vzL/LJZkK9lWPOMO4EplJON8XDpwJEyS17Ay64GVPSb1
	 K/V3OMjE8+KDy216cyCIuOvGrM8iZuiswYjyXN0/2O9CmtCdu/IsuQ7ngaN59lDtlHFn4KlxIEn+
	 dBH2f1suxB3zuJf94bmPwSrKvFPszo8F62RCM83XN37EO2kFJIbnEHjPbKP36C1mmO32EwhXbTXq
	 /9iRIMTUmweDnj2sgPE53T93AX65oPCLFiuwrBCIwZA8rsRqls6HsiPuDMDcVlMUOO2ajMSgghXt
	 DFLfR9Bsv7o3Polko9qprXUBWxN7V2m06VMqLDEW8yNLWcsdwQ7ZKYvyGy8fGQXrykvUSfZYzrIF
	 lI77lya06Xfrvzi7CbgxMjqPc4H5g22vIxgi7DJeFqvFMgQ16cAYrCCRnTEQINAtv7zRarRflCM/
	 iBincgS8dwSuIEWbKLonE39BAMf3q6VpA/6GZ0YD0WBpXeoOOjihtiwSE0NfYdAs+0RIclJf8GXV
	 g53FcW8O52ZQXbws0+ZYDUfj4pE2VX7LU3QLAv0aJ4e0GtEgyRkti3yizc7LJtiKQ2qou4VgdmX5
	 5TGA3/N7bWQtr7fvy0I9e02OeKf5QqoquvUAHft+lzgro/OLUTdkQMncQ1s1d6DDZKeohvRAD6Xi
	 Cf07CZQt+bsq1Cc90hOYD0QmrI6DutKL/hRfic+bBOLz1+IkmCo2yHZ7pL1bzDSg29BumNArsPei
	 oKaDA/+Gqaml6NzZniaPxw6y0HbX1yVCUkbnT2Qd3Vz3YPBfKczhPysdos+qwBytCPwyXqbQ9bs/
	 k91KruioDQbzS7Q76bzvopEGch3Y2XbW5f794Mk29aV5uP4FWXKfY265Yf0SrDIcAElg3yIkHwVK
	 ZQGK71iuUiVU7E4iTd
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhu Ling <1536943441@qq.com>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	chenbaozi@phytium.com.cn,
	Zhu Ling <1536943441@qq.com>
Subject: [PATCH v1 0/4] gpio: phytium: improve IRQ integration and add SGPIO ACPI support
Date: Mon,  2 Mar 2026 09:48:08 +0800
X-OQ-MSGID: <20260302014812.9649-1-1536943441@qq.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[qq.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32361-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,phytium.com.cn,qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1536943441@qq.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:mid,qq.com:dkim]
X-Rspamd-Queue-Id: 100321D25B2
X-Rspamd-Action: no action

This series updates Phytium GPIO drivers with irq_chip integration and
power-management flow cleanup across common, platform, and PCI paths, and
adds ACPI support for the SGPIO frontend.

The first three patches switch to immutable irq_chip usage and tighten IRQ
routing/wake handling. The last patch adds SGPIO ACPI matching and ACPI clock
property handling while keeping DT clock handling unchanged.

checkpatch --strict:
  0 errors, 0 warnings

Zhu Ling (4):
  gpio: phytium: improve core IRQ and wake handling
  gpio: phytium: switch platform driver to immutable irq_chip
  gpio: phytium: switch PCI driver to immutable irq_chip
  gpio: phytium: add ACPI support for SGPIO

 drivers/gpio/gpio-phytium-core.c     | 114 ++++++++++++++++++++++-----
 drivers/gpio/gpio-phytium-core.h     |   8 +-
 drivers/gpio/gpio-phytium-pci.c      |  43 ++++++----
 drivers/gpio/gpio-phytium-platform.c |  55 ++++++++-----
 drivers/gpio/gpio-phytium-sgpio.c    |  44 ++++++++---
 5 files changed, 199 insertions(+), 65 deletions(-)

-- 
2.34.1


