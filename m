Return-Path: <linux-gpio+bounces-16873-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D75BFA4AE4B
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Mar 2025 00:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2C616E9E9
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Mar 2025 23:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058671C54AF;
	Sat,  1 Mar 2025 23:16:01 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468E314F123;
	Sat,  1 Mar 2025 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740870960; cv=none; b=NnZcbuK/rMz10T6VIwe286hyVRw/IWjzt6UY5gTOI7pA4zfJ66XGY9MtNmj5qqVjqRHXAiJIyiiXWsfOkiy21NOURxWbNPkAZkt61H6wRng8rCPW6SM5aVnokLlLBu6w3EUZIozz8oXJ85DiTlxl4by/xyeCFMjHqOs1QVItljU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740870960; c=relaxed/simple;
	bh=so9PRmptskHbOFYIWe2JX2iUt5C4l77HzSi62jfpQMo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KORHmM5U16gzjvTRMqep1nHDg4dwaPq1o99oT7hdZYaRlJF6zvubnCuLj9CEetxeUL+PK5cL0FruemwktRV2gY0HweFgPATGc8yIW1c2rlIwJ50eIVqP9aJRzrB0cUnaO7GJTHnRFFgHjiBrXSFDKWTJPYqU3cxHaPtt4armXPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B03F9342FA1;
	Sat, 01 Mar 2025 23:15:55 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] gpio: irq: support describing three-cell interrupts
Date: Sun, 02 Mar 2025 07:15:31 +0800
Message-Id: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABSVw2cC/4WPTW7DIBSErxKxLhX/hqxyjyqLZ3i2kRKTALFaR
 b57sb3prssZaWa+eZOCOWIh59ObZFxiiWluQnyciJ9gHpHG0DQRTGgmREeZouMjJhrzk9YpI3q
 83agxyJF10ltmSMs+Mg7xe+/9uh464/PV6uthkh4KUp/u91jbHOPKOw1Da0OJnfGgQBunDThpU
 Ehh5cB0T/5ibbENincHUd78Qof0yjuT1dZaCIK7AOdFko1jiqWm/LPfXfgO8s+zhVNGFaAKjvc
 AwV9GnGtKnymP5Lqu6y9OfPKyQwEAAA==
X-Change-ID: 20250227-04-gpio-irq-threecell-66e1e073c806
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=so9PRmptskHbOFYIWe2JX2iUt5C4l77HzSi62jfpQMo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnw5UhTFh03pEtuGT1fh5CNzoD7XrtexFESEOci
 KJY1G1CekeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8OVIV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aRRD/oDYbxDwhPB4+ObLy
 9O5VeFjcL41cY7FdWUA0LVSXuLNPDqGBw2KCtyvK8Z/grbuay6/J+NbjYjIE0u2FDlxHaMPkwqC
 t+PfdO5UP9EdtDD7FwMBLu9WF3clFMOhJspNn0RGIr/z8nOPLqV230rLmpNNFgyBBRxK3oVYAx8
 a99NRCAh5awd/OkRI3Q35UH6vVxhXk70b56rjBNm/H9bPYMObDLGBw4UoONDpPNt9kiCuQYVsMG
 tp98AcbqVsCpOyDgC7qB+0tptCSrpQ9HfUr1syBEO78RmyhB6ab0BbaTiHWwEOuEoTY5JlFsx2F
 jWIcO1r5DjEAWhsYaYZT+Q40frA16sa7ypDk5tJxE/NOpgzN5HYEqHSUUNdIs6hhVoNbQ1Q3r2T
 VGuIw2UxuUHBdl01MZUJRqCZ04a+FI4NcNli5WRRHG/DtfuhI9mwBdAeFLln4LgTbRHDn1sKbiG
 z6k1N71x7LJsI7zB7AKYbh62vMDNc2wBIg5kzj6MkwIhIa/ltgYYpcLfs8tZpxyMi7l0UlzWw8L
 o5NGmLI7WJ3ed0dcOomR1vaC0mHWNthj8YqegKvMjN8rncQWk3XqgoqMW0TDmop/O8HM2sTWyzs
 ivQ8L9QsqYjCrkXqRlzGmsNghRbbt/+JbqblPvnoYc3kV3tGgS4fW+l1Z+7lmW33mfiw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

In this patch [1], the GPIO controller add support for describing
hardware with a three-cell scheme:

    gpios = <&gpio instance offset flags>;

It also result describing interrupts in three-cell as this in DT:

    node {
            interrupt-parent = <&gpio>;
            interrupts = <instance hwirq irqflag>;
    }

This series try to extend describing interrupts with three-cell scheme.

The first patch will add capability for parsing irq number and flag
from last two cells which eventually will support the three-cells
interrupt, the second patch support finding irqdomain according to
interrupt instance index.

Link: https://lore.kernel.org/all/20250225-gpio-ranges-fourcell-v3-0-860382ba4713@linaro.org [1]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- introduce generic irq_domain_translate_cells(), other inline cells function 
- hide the OF-specific things into gpiolib-of.c|h
- Link to v1: https://lore.kernel.org/r/20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org

---
Yixun Lan (2):
      irqdomain: support three-cell scheme interrupts
      gpiolib: support parsing gpio three-cell interrupts scheme

 drivers/gpio/gpiolib-of.c |  8 +++++++
 drivers/gpio/gpiolib-of.h |  6 +++++
 drivers/gpio/gpiolib.c    | 23 +++++++++++++++----
 include/linux/irqdomain.h | 37 +++++++++++++++++++++++--------
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++----------------------------
 5 files changed, 83 insertions(+), 47 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250227-04-gpio-irq-threecell-66e1e073c806
prerequisite-change-id: 20250217-gpio-ranges-fourcell-85888ad219da:v3
prerequisite-patch-id: 9d4c8b05cc56d25bfb93f3b06420ba6e93340d31
prerequisite-patch-id: 7949035abd05ec02a9426bb17819d9108e66e0d7

Best regards,
-- 
Yixun Lan


