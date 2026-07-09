Return-Path: <linux-gpio+bounces-39759-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ah/CDADaT2qypAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39759-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E56733D1D
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 19:27:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=figBezG3;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39759-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39759-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6D73303C4C9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 17:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B72466B63;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B9397338;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617885; cv=none; b=okbIQGQ8m359bc5YUQTD9PCbcakglPyQcZ8PCJcDdt04V+hjfPXaMEoeTrh/HdC5yrp7hHuFH1Of2NyPJySKUtMd/BUK8PfkcF2IuPGZIRTHB1jHybmwnA21BkT9IXJLSfSZAYApvroRX1HR+LNK9DVy7MaVSG8yQKe6E5twFJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617885; c=relaxed/simple;
	bh=sukWlxC8McdyMqbXOPPFAxKItWB1p7RLYeJjYFSvLwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=euI2mQ20sP8YL8/umtuTIuX5z9uJJPTY5svwmCm00Y2qxyMuYt1a7qCM2KXYjAAB0UxSBY0JeKUpetHMfZAmeqyQIb2J8WU2HCD0IUBwDqC6ntt+osRqTYJ8/JiG2DndNpTwmYvP4F9eI5oIGmlHaNcwnaaiyePnCGBV2VCPyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=figBezG3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 162D9C2BCB7;
	Thu,  9 Jul 2026 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783617885;
	bh=sukWlxC8McdyMqbXOPPFAxKItWB1p7RLYeJjYFSvLwg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=figBezG3wTtQim8kE3xdouyCCbLtWVze1YMIW4FmvLhHUTG8N0UnLHD+fN/UrYlqc
	 gRjgClNiDjeB7Y9ZqcM/mvpwGF5XuGBQMdbziag2oBCf8fM/yL6i4/8hcWL1oUOGt/
	 roIFmKL6dPEyUK+i9amP/S3X+rOlaE3xehoICqcU5mQ/oL1OAwwMaiC7oDrCA3RtdD
	 klrEEerttAe6vdoer9fEHeXFyLTdCgMrxvfIEted9WOK1WvwN+1rGj9cjv7VV/PR2M
	 JR4po7ZRnsJfi1z7Qg7L24uh+tPP0F+WsdhFkrcneV6NGjRE4Xzqa/3m3gi7GYrxLl
	 XYozHlJsfyGrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AA7C43458;
	Thu,  9 Jul 2026 17:24:44 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC v3 0/7] mfd: ls2kbmc: multiple fixes for this driver
Date: Fri, 10 Jul 2026 01:24:16 +0800
Message-Id: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEDZT2oC/32NywrCMBREf0Xu2khy06bWlSD4AW7FRZpHG2waS
 aQopf9uyEo3LmeGc2aBZKIzCQ6bBaKZXXJhyoFvN6AGOfWGOJ0zIEVBBQoyJrx3XhEfNKmRtqz
 llLYdQiYe0Vj3KrYrXM4nuOVycOkZ4rs8zKxMRdbQ/Y9sZoQSxauqs7U2VvJj76Ubdyr44pnxD
 4uZRWm1Zk3FGiG+2XVdPzlMtBnnAAAA
X-Change-ID: 20260626-ls2kbmc-mod-5209193009b2
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3331;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=sukWlxC8McdyMqbXOPPFAxKItWB1p7RLYeJjYFSvLwg=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqT9lKe2UhEAclLxvizAebe3Mw+jE5JzpCIBFl1
 do84oJt6RmJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak/ZSgAKCRCwMePKe/7Z
 boFoD/4zNd1tNOwcPbcH8RsMUhxL3Z/D3tQHNXN8Vh/sMxjtT8QVk1W9incgMg0CxrFUW9q09XQ
 lzHakKOaZQ0vKGFcfiU3zKYl1WBTNkSTvKiyrpIa0bFUYAx5T2QcngzDxvLUR0pbMCw0SIdcPEp
 dy4ws/UYwgiFLca3LsybyE8wOcEDPARul3qPQrwWZEGapgw+FQbsU2o6tXN9lb9+9egv+6KMjxO
 2RnOp7av1CLIyONHVBEs7cxxw5DzO/suYSZ5Uu0adPiIRsNA7t5pH9A4EvniLC7+VMzMMdS8bcX
 96wSMZOdZIInmBop0j4sV8SVW27Q0vfpULsBiB5NTVG2ROiG8AjdV9aIcS5kiVJVD3OynUpigTe
 dixWQU8RaCwd43mqkjvqILJpMTkp8UwJoaERKiWcPcmt4OeNj8Om1yb/7Sr+AC4Bvomz8rvMhzh
 XLuTmtCmmLPzxxITNU4hDKaBCWbgmUd06rQovgmqq5PrgeeA8vaGd//4c2kUhyj2WZtHEHSQt2s
 0UZaCIwTduI0cWKXH+wJ5m0vCqVMaPQFR9taDkLW9lqkFehFOytNLqSCKTIvo9yevBpy7UBJSkz
 /5/AxUOebWjB2ab8LGq3LabHltqwwa/mRVHbHeXBLUonpdd/G86EBFWBk5isoi1rciOOf6EdfOB
 aIHX8caxYgUcSbA==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:openipmi-developer@lists.sourceforge.net,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-39759-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[xry111.site,xen0n.name,loongson.cn,flygoat.com,lists.linux.dev,vger.kernel.org,lists.sourceforge.net,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[shankerwangmiao@gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78E56733D1D

Previously, the driver has been introduced to support the Loongson 2K
BMC running on the Loongson Servers, which is essential to prevent
the system from hanging when the BMC is being reset and the default
efi-framebuffer is being used. However, there are some drawbacks in the
driver.

Firstly, the driver tries to read and write to the connected PCI-E host
controller registers, assuming that the BMC is connected to LS7A PCI-E
host controller. This assumption should be true for real products, but
to prevent from accidentally reading and writing to the wrong PCI-E host
controller, this driver should be modified to check this before
accessing the registers.

Secondly, the driver uses non-exported functions to tell the vt
subsystem to redraw the screen, preventing the driver from being
compiling as a module. This can be fixed by using the exported
functions instead.

Thirdly, the driver directly accesses the GPIO controller registers
using hard-coded addresses, which might conflict with the loaded GPIO
controller driver for the same GPIO controller. This is fixed in this
series by using the GPIO subsystem APIs instead. However, legacy GPIO
APIs have to be used in this fixed to correctly request a GPIO
descriptor from the GPIO subsystem, which might be further discussed
to find a better solution.

Finally, there is a minor issue in the driver where it changes the
mode string describing the screen resolution during probing, which
prevents the device from being probed again if -EPROBE_DEFER is
returned by the probe function.

I have tested the changes in this series on a single-socket Loongson
3C6000 server with a Loongson 2K BMC, and the driver works as expected
when the corresponding GPIO driver is additionally loaded.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
Changes in v3:
- Check the return value of devm_add_action_or_reset when registering
  the cleanup hook of the work queue
- Use swnode to create the link between the device to the GPIO chip,
  and prevent borrowing the legacy GPIO APIs
- Link to v2: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com

Changes in v2:
- Several fixes suggested by the Sashiko AI review bot
- Add a cleanup function for the wq on removal of the device
- Relax the reverse dependency from CONFIG_IPMI_LS2K to
  CONFIG_MFD_LS2K_BMC_CORE to allow the driver to be built as a module
- Link to v1: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com

---
Miao Wang (7):
      mfd: ls2kbmc: Make a copy when parsing mode string
      mfd: ls2kbmc: Sanity check for the connected pci port
      mfd: ls2kbmc: Redraw using exported functions
      mfd: ls2kbmc: Cancel the work queue on removal
      ipmi: ls2k: Relax the dependency to its mfd driver
      mfd: ls2kbmc: Able to be compiled as a module
      mfd: ls2kbmc: Capture the reset event of BMC through GPIO

 drivers/char/ipmi/Kconfig   |   2 +-
 drivers/mfd/Kconfig         |   2 +-
 drivers/mfd/ls2k-bmc-core.c | 235 ++++++++++++++++++++++++++++++++++----------
 3 files changed, 184 insertions(+), 55 deletions(-)
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260626-ls2kbmc-mod-5209193009b2

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>



