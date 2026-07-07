Return-Path: <linux-gpio+bounces-39599-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mLK3IGVSTWpxyQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39599-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:24:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FC71F2CD
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 21:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="KPOR/Oyl";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39599-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39599-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C63553010BD5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 19:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC344386C15;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F9B3546D8;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452255; cv=none; b=H2YFfFuTzNLOzrPLbhTAdhuhfXG7BlWuD6Yv16gFjy/KW6PIYQkB/H6om3B714MKNKPx1WNnUjkOteskIr8blBFeMWZeyb5oZvJzjJ5IDGFzmrAbPT+Nj3JcJ0jaS1K91nlPKIGhTCHHskenQCj//b0Tw49HTU0yPfnD6XXOyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452255; c=relaxed/simple;
	bh=Bt/q0n0w05U5iaF1GtMTt+11t9g0yfG2q6EzIbfOXug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HU1WwI0QvNDlj1IXlQkvtK0SmF1EMRvkvkmAPtWvbAAPED+dZZ30zHELX8sKSbQtvioEjYNnZErOMF+K13NB30BafSmoLuRaG0ZP3TWCjcN84A/QHk/cOP/hzTwfVHUTwxcAf5gons/qwge48TuAzJDPWU72AaQ8wj9QtWTM7lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPOR/Oyl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1261BC2BCB8;
	Tue,  7 Jul 2026 19:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783452255;
	bh=Bt/q0n0w05U5iaF1GtMTt+11t9g0yfG2q6EzIbfOXug=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KPOR/Oyl8KGu+3g1h6r37PWwVBXhCB7QWz9MGSDwB+XqmJ7uE8PzEYYYsHbVyzTTL
	 59xb52GQYUtCCRbvvUGuOdpPP4Ggb3HW4m2FHwOucDdUj44Ckx59LgDrIAIgMyVngo
	 6ilRDJl72LnHD+1+CbQpASzjP5COuk4CYlKC6aUZObbWbLyd/Da6wKu4wHzaypcn+Y
	 /oFcQ1m/fgzyvY0j0LDvImOBPk44sWVQlp2GN5aLAySM4C4LqdiJIcjeARAWyFfMnw
	 Eqt0ftvCcf+0FbiE8TxpBCN353RWkEDdSAu6L8UQ59mprxUqTJZ4x/gA0H5xcXHYvU
	 IFloJ0JW1h8iQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BFFC43458;
	Tue,  7 Jul 2026 19:24:14 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC 0/5] mfd: ls2kbmc: multiple fixes for this driver
Date: Wed, 08 Jul 2026 03:24:01 +0800
Message-Id: <20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJSTWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMz3Zxio+yk3GTd3PwUXVMjA0tDS2MDA8skIyWgjoKi1LTMCrBp0Up
 Bbs5KsbW1AHs6g9piAAAA
X-Change-ID: 20260626-ls2kbmc-mod-5209193009b2
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2483;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=Bt/q0n0w05U5iaF1GtMTt+11t9g0yfG2q6EzIbfOXug=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqTVJUE1eQTF0tg4qKpKE5TVY5SQc+fBqBfzKle
 yUccej24LCJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak1SVAAKCRCwMePKe/7Z
 bkPoD/4/pk8IBhQUNkY07oLMfY2c91J8OSgnwPm2aPokh0VuS2pSqLhxSOdoS9QcJHNuJL3XiE6
 AUVfsReXZjtrMXQ9z7prcoi2Jt1Owdqz7sP0xrOD8f97JfQbbzUoowt2L0LWb1u1d2EHNKElrxl
 LogcRw0v8wIIVFxP8r9/znRTNk0Nhs75h0tSvFgyKYSpCYsCklYr13HV0/rSfzr1nqA/nGb/byY
 TuFjdxEYYV+vzQgAMTIxHeLqeivFG/uETr8z6CugA/BhZGkX9FYIpqeWgTF5/V2EfLGXeg/MciL
 xu8ia6AVrY470yJrXt2JlznIZaVhgh1vw0K/n6w7CrBfNUiFLxTwp+rMke/vcDxZs3IXouFPWv+
 vhQi2LWJ8M8bdGxNkGQegyAsqtHByXYwO51MAI8QHydwrPcU2NQBUWKmA7HW1fn0mmos2Yn5Lmo
 BhYxt++D54YydtEOyrzw9hoSZukcXBar2N40bl8d+cv9fFqUjhcpo2EwVOJ149zvbcswJ/1gtby
 lkLE8WKUIai1qGwkX+uVXwy+UnefrBxsYNkhxwlb+/6C+Pm++/sHghyBz6JmbDjVMpdIKqYREci
 lu/wxKWXdlXkmdBa4uaLRtRDgK+DPp0LFoOcDegK9jsJdOD3D4/PIj7uj45zGe4fzPs+ZmLAJPl
 MQGTldZy+zCkmkA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhoubinbin@loongson.cn,m:qiaochong@loongson.cn,m:lee@kernel.org,m:chenhuacai@kernel.org,m:corey@minyard.net,m:linusw@kernel.org,m:brgl@kernel.org,m:xry111@xry111.site,m:kernel@xen0n.name,m:zhuyinbo@loongson.cn,m:jiaxun.yang@flygoat.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:shankerwangmiao@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39599-lists,linux-gpio=lfdr.de,shankerwangmiao.gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[shankerwangmiao@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[xry111.site,xen0n.name,loongson.cn,flygoat.com,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A4FC71F2CD

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
Miao Wang (5):
      mfd: ls2kbmc: make a copy when parsing mode string
      mfd: ls2kbmc: sanity check for the connected pci port
      mfd: ls2kbmc: redraw using exported functions
      mfd: ls2kbmc: able to compile as a module
      mfd: ls2kbmc: capture the reset event of BMC through GPIO

 drivers/mfd/Kconfig         |   2 +-
 drivers/mfd/ls2k-bmc-core.c | 224 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 174 insertions(+), 52 deletions(-)
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260626-ls2kbmc-mod-5209193009b2

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>



