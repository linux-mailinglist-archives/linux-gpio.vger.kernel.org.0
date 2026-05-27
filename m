Return-Path: <linux-gpio+bounces-37579-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHZKE0PsFmruvgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37579-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:06:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E60A75E49B1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A99C53013625
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 13:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9B040960C;
	Wed, 27 May 2026 13:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzJl661R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8940911D;
	Wed, 27 May 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887123; cv=none; b=MBGNe2oDZc3mwis6NNuM8uY0AWTzvfelD10vqEYH1U2rtzTEmsuwmipLzmwC2iKWu77iUsHuSVGU2hgYP9JVFLy98SaTE5kKpH8qFSKcPqkJtkFWg7HbGH+N0YaJcwTH3RgM2sL31PzbEru35L0Ot5pc/yZfvjI4jMTcq4GsPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887123; c=relaxed/simple;
	bh=edoo4qnUqQRv1oZlXngfVXZlGdv0tZKJ8Bik2Q6tx2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DgcMbVSOWdj0WxQ+wcbLBiHQE9xyix6Vtz6I/l0gm2XZh+rF6iaoqJgOb7LiqBuPdczPY/Y2oH4/UiuU/P0AxARzH6UOBzbH/rC2clzpTZ3xh0wqSGeEs4ICY4RylMMz4h94LaPnqKjdOHSDLbMp+RPxgLNfeUp7dvEtr6Li3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzJl661R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D33D1F00A3A;
	Wed, 27 May 2026 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887122;
	bh=6k8y+j/LwQCnn7ug1eA6EQHzr60+MSJ2c512PKah/sI=;
	h=From:Subject:Date:To:Cc;
	b=hzJl661Rp0FOmsOSEJ6knuxtF6qq1D1ZriIjd0tdQv4jm1Js9nGuzTwPG43xwqXLX
	 0/6HfWrivq4uekymdICfDJQpWJzXesZGyHW1wmGLf+FrCub0LF8FE14C1SYvP4EvM8
	 sWtUUDLB4lR5Tk+J7hHj9Vks7fBEkbXzorn98d8O+omSoi3032xlS27WlBiDTjTMaH
	 q1CgjjJbU9yce8aKYBNM+CTmAq2y+E5HsxhdmgyUd7OT/eXUORMh57V0Y4ehJcOb8m
	 O6mb6YAqcGNJR8S+klTXunLq91zCR5JzROfV1x8GkyWDpqJFtyVNDqdGysekO/yh0O
	 FLChZQtyf/qDQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 0/2] mfd: arizona: Move IRQ GPIO to GPIO descriptor
Date: Wed, 27 May 2026 15:05:15 +0200
Message-Id: <20260527-mfd-arizona-irq-v5-0-ebeda2e925da@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOzQ7CIAzA8VcxnK2BAqvz5HsYD8iKEnVTZhY/s
 ncXPc0Qj/8m/bUv0XOK3IvV7CUSD7GPXZvDzmfCH1y7Z4hNboESK6mVgXNowKX47FoHMV2hCky
 BFdVO1iJvXRKHeP+Km23uQ+xvXXp8DwzqM/1vDQoUmB1RsGjCUuP6yKnl06JLe/HBBpwCVAIIE
 mp21lTBKmp8AegpUJeAzgAaj1ZpIvblB2YCYFUCJgNWekPcSKeW/AOM4/gGYJ87JHIBAAA=
X-Change-ID: 20260314-mfd-arizona-irq-6fe7fe179a09
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37579-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E60A75E49B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Move the hack using a platform data-provided GPIO line to use
a proper devicetree-provided GPIO descriptor to poll the IRQ.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v5:
- Rebased on v7.1-rc1
- Cache gpio_irq in a local variable.
- Check gpio_irq for error value.
- Drop surplus goto label.
- Pick up review tags.
- Link to v4: https://lore.kernel.org/r/20260326-mfd-arizona-irq-v4-0-50c47ed0a18e@kernel.org

Changes in v4:
- Fix error path to use dev_err_probe() and report mismatches GPIO
  IRQ numbers properly.
- Fix spelling error in commit message.
- Pick up ACKs.
- Link to v3: https://lore.kernel.org/r/20260319-mfd-arizona-irq-v3-0-24c251377ec2@kernel.org

Changes in v3:
- Reword the irq-gpios documentation as Charles Want it.
- Collect ACK.
- Link to v2: https://lore.kernel.org/r/20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org

Changes in v2:
- Instead of deleting the feature, migrate it properly to devicetree.
- Add irq-gpios devicetree bindings.
- Add code to handle irq-gpios for GPIO polling of IRQ line.
- Link to v1: https://lore.kernel.org/r/20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org

---
Linus Walleij (2):
      dt-bindings: mfd: wlf,arizona: Add irq-gpios
      mfd: arizona: Convert GPIO IRQ handling to descriptors

 .../devicetree/bindings/mfd/wlf,arizona.yaml       | 10 +++++
 drivers/mfd/arizona-irq.c                          | 50 ++++++++++++----------
 include/linux/mfd/arizona/core.h                   |  2 +
 include/linux/mfd/arizona/pdata.h                  |  5 ---
 4 files changed, 39 insertions(+), 28 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260314-mfd-arizona-irq-6fe7fe179a09

Best regards,
--  
Linus Walleij <linusw@kernel.org>


