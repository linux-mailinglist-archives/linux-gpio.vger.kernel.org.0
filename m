Return-Path: <linux-gpio+bounces-37240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLK8HgmVDmrJAQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:15:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB1959EFBD
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67F90306D613
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 05:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C3733DEE1;
	Thu, 21 May 2026 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeLIjShD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8E433E34E
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340427; cv=none; b=KS9aMfQeQzWsHNDEB0eaBcc8VRqd1+iUjA9b5u9VYs0Rezae9uzuznKKqGcNFgpwBhnnnhNDBtTXs1RZpd845QlbAZ7xJUBFTs+YFJpJG3+wugmtwphFCX8OEr4HnVWdlMLZrstqnpSooGbpszfvA8twgekFyEUUrYHAGxSRzh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340427; c=relaxed/simple;
	bh=gGj3bx1qE3wnIKHp+6qyWe35fzxuLt4vuc4uZ4QLGkI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FOe8w8Ze+S+M/+B/3mZV6aWzZJQFvGtlG+yfSv0ReeNS81HSxqq2otuYJnyQs3I6cp7MHIgmSmwJs63SrK47J0ii17Iu6IXKKh+ASn3ksP2vh4QvHNrhWe3sA0ezES3OjTVA5TQJTreq7B5IQSKSQ/6EJBxPtovX2Jp0e3m1R1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeLIjShD; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-303dbfbec77so5960740eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 22:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340425; x=1779945225; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bnS66HRPMnJiuE1UMjp+LGMM6n3gYPvVDfnlD++FnrY=;
        b=jeLIjShDdpTtGTEjj7v8lVikDv4Fee+TIlHdKmPiXW9ezEYKd2scYllnAnzx9h9NEY
         9iM4u3p0aj2WDFzw6LBHPMTwo/yD1XQNZC7HsoFGJgnYKpHVoAMzCJj3Ni0p7tILJR4l
         BfFyEp27OyzO3AXzZafUhZ24DvrsMDk/0sfXquJ8U0n4BrOZL5qRIgHQGaT9lwceEbL2
         sKfj5A/uBaWMN1cZ2crApDgTkm/qgHeo/7+S25BylNmGCl61lSqDnAcDWHAXbcPoOcwW
         0RJNPuozG5b8+jRQ+8cEgvKJcpAJQV4AO4wK60JxlBX7rGXw8LwOekbBe5MwVwEz2uun
         +whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340425; x=1779945225;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnS66HRPMnJiuE1UMjp+LGMM6n3gYPvVDfnlD++FnrY=;
        b=rATaGWsU8yvMA0oLVmrXl53oLSO3EhrPFY2CSc3HtEf86CHBdqR7f2e+x5xJs2LYk4
         d3znBK+uMnBR+WBv8/V64OaQbcHdVjaCsC2xOaP+YD7qfPbYLAtwC7IEYozI/oxQAvk4
         B0y5DRL1Z9ihbSR3P/ZEkvvDkiXgJwjb1o4Rdy56ONsmVffMumQKXW4z1yPviWcKoTpQ
         cRdtCfKWRr84T5iDzQEZERQ4EkQL8zqs1MRRDb5YQ7r6WPxRBJ72nJcRlQDZ1Q3qpWkz
         yTZ5f1x5n1I395+M9jiZEtPThVIxl67Wy1DopkQvi3TJf+b0hwrfl2OskdRZDIqpP7Jz
         2gEg==
X-Forwarded-Encrypted: i=1; AFNElJ/tNG1AaOfsTHhedpNNGacDmfXpgypS9k0H4OB5JSaPePLD/hQBqavpZPV//aPrd899xDmOOkTWU5gB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8v72RHWmVUzU8P0n4S6Zo1cf+qpv+ZRrAP5EgYBJ0ch2bVH+8
	JqnysDJE18O/xCL5H2fzyxh7y142R0K6dLDV+mrjoGL5qrQIPQEJKlV6/NWphQ==
X-Gm-Gg: Acq92OFkeL7ywLInnrUoBNf+5WawsgudQi+CvcF52xfL62bq1GOjK/yJAd+0emsAdDm
	H4DZx8jh5IK2EJZyrt93mB4Nx/esRYCnVDH3wDyQ88CYFua8Doto3iAeJ7anUd3qrs0DBRcIabM
	/73pgmJ7G2+ll1apyVXb3GjtW6fHhIY04hONHs9bF5K+UCpYKjnQ8wZLiVYhtxOTO0AHrjC3yi5
	5VReIIwkh0Jsb8+EQt8HxP38XkhMuy7vwOY+iM4jqHnKqGIOroyDBeDkVnEUWzwQUtInXI9+Lmf
	5tXFahKnHBYEkdOmGplkNHYzkfWMSDRDnYgrUnxHAwmpMZPaRYmVH+14/tFrDViPYE3BJ9Hq2/2
	SkacH1wf8lk4PGsKB00HuC3+yFf5vj9vW2x6aB6tntjbDukHviStA8cTDlONOQuctkg/MiTibGT
	K3PPJBCdiPLPvz3KYgmLPcYT08ujvox72Pjr5BbSE2TobCIWeroAqT235LBzf+ZI3t4ux13j83Z
	o0QWw0Vq8Y5DjglDz1wFsII
X-Received: by 2002:a05:693c:300d:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-3042f9716camr847573eec.20.1779340420662;
        Wed, 20 May 2026 22:13:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 0/5] rsk7203: switch to using static device property,
 drop legacy gpio API
Date: Wed, 20 May 2026 22:13:16 -0700
Message-Id: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGyUDmoC/x3MSw6DIBRA0a00jEuCiJ921H00HQA+BC2fAtVG4
 95LHJ7BvTtKEA0kdL/sKMJikvGugF4vSGruRsBmKEaU0JbUFcExzR0lNQ7RB4i5tLinQlFZUXH
 rG1TCEEGZ3zl9vopV9BZnHYGfq2nNgw+Z50151lkRrJ1WrfXkmBVrC3NgY/Y+SN7xTUh4+8d3y
 Rtb6cibj0PH8QeJ8BEPtgAAAA==
X-Change-ID: 20260310-rsk7203-properties-82bf2c12b985
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37240-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: DFB1959EFBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series of patches converts rsk7203 to use static device properties
for its devices, including gpio-keys and gpio-leds, and removing
dependency on legacy gpio API (in favor of gpiod API).

To configure pin functions the board is switched to use gpio-hogs, as
doing full conversion to pinmux is too challenging without access to
hardware.

v2:
- Added a patch to isolate the function gpiochip from the parent fwnode
  to prevent ambiguous property lookups
- Added a patch attaching a software node to the main PFC gpiochip device
- Adjusted the board setup to use the PFC's software node for LEDs and
  GPIO keys instead of creating a standalone node
- Added support to sh-pfc for configuring the secondary "function"
  gpiochip via a "functions" child software node.
- Converted board pin configuration from legacy gpio_request() to GPIO
  hogs, using postcore_initcall to ensure nodes are available during
  driver probe.

v1:

http://lore.kernel.org/r/jwtdoptatzfo47mbpmmjwhhhjn4mbw6ekp4gtoopca7azbcelo@uvtz4w2ga5qn

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (5):
      pinctrl: renesas: gpio: isolate function gpiochip from parent fwnode
      sh: pfc: attach software node to the GPIO chip
      sh: mach-rsk: rsk7203: use static device properties for LEDs and GPIO buttons
      pinctrl: renesas: gpio: support software nodes for function GPIOs
      sh: mach-rsk: rsk7203: convert pin configuration to using software nodes

 arch/sh/boards/mach-rsk/devices-rsk7203.c | 282 ++++++++++++++++++++++--------
 arch/sh/include/cpu-common/cpu/pfc.h      |   3 +
 arch/sh/kernel/cpu/pfc.c                  |  20 ++-
 drivers/pinctrl/renesas/gpio.c            |  28 +++
 4 files changed, 254 insertions(+), 79 deletions(-)
---
base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
change-id: 20260310-rsk7203-properties-82bf2c12b985

Thanks.

-- 
Dmitry


