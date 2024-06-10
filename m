Return-Path: <linux-gpio+bounces-7305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12621902054
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 13:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB6901F216CF
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 11:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282F47EF09;
	Mon, 10 Jun 2024 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="livBFA0e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B17BB17
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718018828; cv=none; b=pTfxckGlMwIpq+it9ousoPN1vPI/X95V+rE8PzwNUavzKBDAuu2xWERlR5XIRzUPIPdOQ74N0u8TZ97dfT/v69y39TTtWtFyoWjQQobEvQCQQBkuG/JjD3iJ7WWHk7ACqVQO9Wb5SzgYK7pLJ+GtIKuaz/LoCAXU3UQQ6xFANJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718018828; c=relaxed/simple;
	bh=HQ5K2V7ImuQzgY0Z25LLWCsNKSjf75rCGsKc2Gobefw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZfkBDZOvW8MLDWBwTyCLvap1TwWpJ26XFf4rSKAUpORyxY/XNxfA2sYhd0V6obkBhkukpI/d3RTx6dv3NpGLACMNf3Gf3ZT8ynJKTa2SrT5ijk4ekga7KwYCxmhScrRqO3VTeqNMXzPrX72xf/rDHkYj+XC2DeDNooh3N8sTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=livBFA0e; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=65Hs/UBIIEGh/K
	jtF098khzUPg6uB3YzgN/ax7OfSBM=; b=livBFA0eYkDxlKayfRaD61UktqpDXR
	pjujtn2ULSGBrP4rJVymie95LzRWDsN7AbrfhARj1ErAriTVqKGBiFW4zHuW/9UP
	pwaC7ObVVchJdRrEUqGltkD3DEXWeOM49GSj31QaLrKL4AxJh4+7cFjA3qrOgad1
	33nTwRTWT9o73FJncRWV72BE+4Yb/ic4God3IQZK2b2r2oVEa6lrM7XRWbWzNfD5
	Agnd9PSqSl2ONNnvLLq0K/g+DTjtUUWZWTZdgJmAxSuZ3y4Nqe5vms1GINHUAfSN
	dvaAjpM66z1hR4RP1KfAIU9NAYEl0KzW2VUH9jQ0+W7yE3XpywVbAA1Q==
Received: (qmail 56150 invoked from network); 10 Jun 2024 13:27:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Jun 2024 13:27:01 +0200
X-UD-Smtp-Session: l3s3148p1@LFySbYcaWuQgAwDPXymAAHMyzy0c7Kdl
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/1] gpio: add simple logic analyzer using polling
Date: Mon, 10 Jun 2024 13:26:58 +0200
Message-ID: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here is the next version of the sloppy GPIO logic analyzer. Changes
since v8 are mentioned in the patch itself. For those new to this
sloppy GPIO logic analyzer, here is a small excerpt from a previous
cover-letter with the links updated:

===

Here is the next update of the in-kernel logic analyzer based on GPIO
polling with local irqs disabled. It has been tested locally and
remotely. It provided satisfactory results. Besides the driver, there is
also a script which isolates a CPU to achieve the best possible result.
I am aware of the latency limitations. However, the intention is for
debugging only, not mass production. Especially for remote debugging and
to get a first impression, this has already been useful. Documentation
is within the patch, to get a better idea what this is all about.

A branch is here:
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/gpio-logic-analyzer-v9

And an eLinux-wiki page with a picture of a result is here:
https://elinux.org/Kernel_GPIO_Logic_analyzer

I've used the analyzer in a few more scenarios and on multiple SoCs
(Renesas R-Car H3 and M3-W) and was happy with the outcome. Looking
forward to other tests and comments. From my side this is good to go.

===

Thanks and happy hacking,

   Wolfram

Wolfram Sang (1):
  gpio: add sloppy logic analyzer using polling

 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  93 +++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 340 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer.sh      | 246 +++++++++++++
 6 files changed, 698 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer.sh

-- 
2.43.0


