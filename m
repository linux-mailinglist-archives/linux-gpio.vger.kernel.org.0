Return-Path: <linux-gpio+bounces-7582-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9A91009E
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 11:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2F221C2121B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Jun 2024 09:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DB81A8C36;
	Thu, 20 Jun 2024 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AimULBvV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982561A4F20
	for <linux-gpio@vger.kernel.org>; Thu, 20 Jun 2024 09:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876533; cv=none; b=lpMxPATsEkcGVskP6Qa9fBXsIwrd40HkroVlH1okvjg84UgWqaz0I4yBZkhYwt0U7gyP8y3fwaA0rkMU07WWEBsJxAGJ83oW0nzfFdvhBgxAf60fgwzPyrX2LArNcJnuffj7xBFACVquxEcnT4WPRFpQ4j6ZPxru11XFi4dm2Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876533; c=relaxed/simple;
	bh=M464FrXG1BzMSxJoRLmhb8x64qRh6UQOdAL9CWcr+44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ueLWvpPMgP9ZW1ABNKUMOtEXcz+jtHzNlyQepcx3AFXG6hMrD1XUDHEWsB6SMJ2SH9dTJly3T2fu5V+ZQfK85my5jhenpLvnn6YBIiwI5kM9KZjIl6xiC6H4YRoCxX4JqJv0Lj7ZB1OwY9PgMNzsEA3FVSlTH3HbHUwGB8qFIPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AimULBvV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=B1z8o3F64A+DCT
	XstfVDYp/68n3Z/j5/2uQhMYJiAuA=; b=AimULBvVdvlYFkN7X0xpWDxwRoLpTu
	a+/Q0BoDct/2TWNbFRCIlHQQt0nsy6IvDKNQkQZKoyFnU5g+veiOy2TgZ0IaDw3m
	eZnRdV7O6bR6TL2KA+8KsQkatIWD8iRp6Ek7HgYFWVLTLcIlsYJWDEFdb9Wuc7ha
	Y8yfha7niZBttr6pDo3jeip5dzf/zSFO8L1h7OjQq94V5KaBL3Kc2u/leFkqmmz2
	HvGg8UAfN7AZQDg0ft094PKEuCf/N0woc+0pGTaNBE7OZcFBMTQ+Zn0IWOgCXQzJ
	82YKQOTcoXN7ezrUK2ZIYAPSYZZDjWSssZE2yNnTsVDwL5/Zs7l/7M0Q==
Received: (qmail 964825 invoked from network); 20 Jun 2024 11:42:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2024 11:42:06 +0200
X-UD-Smtp-Session: l3s3148p1@SUi6IE8bCtAgAwDPXzjQABqqX1QYyOSW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 0/1] gpio: add simple logic analyzer using polling
Date: Thu, 20 Jun 2024 11:41:57 +0200
Message-ID: <20240620094159.6785-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v9:
* add comment why late_initcall is used
* use .remove_new instead of .remove
* add needed includes
* use devm for allocating mutex
* remove stray ',' in compatible-array
* remove success message in probe()

Thank you everyone for the valuable feedback so far. Thing is, I am not
sure anymore if this is suitable for upstream. Maybe it is a tad too
hackish. v9 had some ideas for improvements (IIO interface, configfs
support) which I am not going to tackle. For me, it is (and has been)
useful as is, but I need to move on. The latest version of what I use
can be found here:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gpio-logic-analyzer

If someone wants to continue from here, I am all for it. If that thing
is useful or educational for someone, I am happy. And for those who
don't know what this is about, here is an old coverletter:

===
Here is the next update of the in-kernel logic analyzer based on GPIO
polling with local irqs disabled. It has been tested locally and
remotely. It provided satisfactory results. Besides the driver, there is
also a script which isolates a CPU to achieve the best possible result.
I am aware of the latency limitations. However, the intention is for
debugging only, not mass production. Especially for remote debugging and
to get a first impression, this has already been useful. Documentation
is within the patch, to get a better idea what this is all about.

And an eLinux-wiki page with a picture of a result is here:
https://elinux.org/Kernel_GPIO_Logic_analyzer
===

Wolfram Sang (1):
  gpio: add sloppy logic analyzer using polling

 .../dev-tools/gpio-sloppy-logic-analyzer.rst  |  93 +++++
 Documentation/dev-tools/index.rst             |   1 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c     | 344 ++++++++++++++++++
 tools/gpio/gpio-sloppy-logic-analyzer.sh      | 246 +++++++++++++
 6 files changed, 702 insertions(+)
 create mode 100644 Documentation/dev-tools/gpio-sloppy-logic-analyzer.rst
 create mode 100644 drivers/gpio/gpio-sloppy-logic-analyzer.c
 create mode 100755 tools/gpio/gpio-sloppy-logic-analyzer.sh

-- 
2.43.0


