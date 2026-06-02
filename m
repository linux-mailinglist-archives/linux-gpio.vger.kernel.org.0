Return-Path: <linux-gpio+bounces-37770-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIHyOEdkHmrCiwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37770-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:04:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 898AD628558
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88065304636B
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B514280331;
	Tue,  2 Jun 2026 05:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8QoYsFY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E825B2F4
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376514; cv=none; b=bbp313eo0X+i9eWcqzPPlESIxyvSBLz1vUfzxChttNs+M5dvtQW3ISf1Gk8m08nTE9TCjmJwOdru7o+v8uBZ20fB+ZbLZ+uPuK4JOTjQo6kMJzhNKt6w3pZ8/M5suI8YcKcQWvkAgiWbCV+PnHb8EDGOAZRfPRgW3h78x3Mw8oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376514; c=relaxed/simple;
	bh=fu0fHH8GEc/eY/dNnjeJ3WVSqYJqyom/Ku2BZeg7cwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=INTljMdtvzFWODnmClOPezgQ2Ri2RcJGbniK24TCvkXSZ6PGwsvr+F3o0RX+xPE767LNHUqi6lg7+sUK8pO3kzZh/4+uXbc3J+yLJYjSMCBx7i56DpKC50ExMoN0HRCmaP4T8IpgXWmrG2Axg/tp0mtv3OK4s1+IoqqadE9Fws0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8QoYsFY; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8532ba6c95so3182677a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376512; x=1780981312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9UBbJFTl4BJCNOtay024UeZbTsRkAab8z+DA8cu9aI=;
        b=c8QoYsFY9Sut9YrShUiaPBBVj7d0MPG4ujhdUmeEccGCOpoRr1sFJb6yRWoAuX3qu4
         nHCkwhFINEe2IoY9jZz3ZsYLk2X+mklQgjtXa2FSj197wBsVyGIhAr7pdgdTiYTZ0cP3
         c8zNju5soV9fqe1dNdvpjuCxyAEc3LN+D0mm4fjFFuHkIp4s3WpmbHN0VEhP0IHuxG67
         tcxCYHpkXLW+rMRzRujZbWb1RfOrXLSvFg9UB79hd7UNk9Uj5TC49iQ7GaiP5fpQWBtn
         pBEJn/lgsjrVaUbSTRT9Vs+7HcS2DFjDYXK0GTUWG4nxnWTFOpZg8WFYUISL85RyF+OO
         hYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376512; x=1780981312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9UBbJFTl4BJCNOtay024UeZbTsRkAab8z+DA8cu9aI=;
        b=FzIbfwWfFLp7XeUX/Lj2TBHcmHP/iO+MMmWvOjYNL7B+Nr9OhPczx0MUUGvyTKK6zN
         l+iXdhUd0yegyIRK9HddXmQ8kNOsB0MiWiIBIa0PbtlRwVq69quMxO3vJE609TeeV4zF
         wbDh/McaQpxP5wBphBcsL1ruRq/Ea6DfSNobd0oyPJ3IcLM39j7TwmFjUuRYpJTILLGc
         QM/aKIokfwQD7pK90eKHCvu18aOWN+eeCkekN7GIQsbMYeXUCzLMK5GWdSiS5aGcpLzo
         ywWSbfLZInQCutj3AE0sOR+Z7ya/l+a/XOBRuYkBSkJbpCGmvDAdDUhMFcx7cXVhjKEa
         FvWg==
X-Gm-Message-State: AOJu0YySqQsHYlHVvSZh0JZnJM9DIy3ZTov5Df+3EvSIKpQuw7EODTM7
	3kx+EkIbLl/OffrN73DkRvGcn2HSpwj2Pd2UWpTVpOIc6wChoDdJtcj/nwhfD+FX
X-Gm-Gg: Acq92OEmJJcsuI2K26nqRJwmCheIye6lQc6OpfVfwcVB7U+12c9kZK8gaob2S9FMkVF
	OD+uLsib/IwjgkrxpadHRHmT2e2/oppBHNaeMVt4l6ZnAp9gTiag6vADiJ7HamBn+S4XCirrqHb
	aWZAnFKdmTLpIRBcwCnP17nGHSv4TMlOUDPi2/3a6PfpzcOR0SFVGZ6oeqa0VhGmRaXqnyGo71/
	KafoaXZpJIElFaeU4WRfGWG0GRh0nlUYUdhqgOJkghD1j9Bluc9pCw0zMwC4eG7/1hCZsaiXwi7
	7hxuriJBBBo8XwYp96KGxKCDp3PW16XS4zF9DTbuJYa50Tay/wWCUnWwTw3k+SMNh2nTnLjPpqN
	Dkh3MBrQLw9ZSvWYtpjJdZAwhzBaFhjR9pNmZA2Jv6bSgS/b9aNxRvNVwfOlPbeUpAUCaCL3D3r
	Vc2dYwiaCn5UjSnRRYTHK9H6KXR4GWNeskRu24QD+3jujNFkIzjF/NeiZmM9n2LGR3mIZKP5xwB
	qp4lJDhYb2M+JcNQPTv4IOJK185Zv3Hc+JfSAapWeLqCQ==
X-Received: by 2002:a05:6a20:6f06:b0:39c:787:f197 with SMTP id adf61e73a8af0-3b427f33690mr14407222637.36.1780376511958;
        Mon, 01 Jun 2026 22:01:51 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:01:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/7] gpio: move ppc4xx driver to drivers/gpio and modernize
Date: Mon,  1 Jun 2026 22:01:24 -0700
Message-ID: <20260602050131.856789-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37770-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 898AD628558
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series moves the ppc4xx GPIO driver from arch/powerpc to
drivers/gpio, converts it to be a proper platform driver using
generic MMIO helpers, drops architecture-specific accessors, and
prepares it for module build and COMPILE_TEST.

Patches 1-4 move the driver and convert it to standard platform
driver infrastructure. Patch 5 switches to generic MMIO helpers.
Patch 6 drops PPC-specific IO accessors and enables COMPILE_TEST.
Patch 7 adds the missing MODULE metadata so the driver can actually
be built as a module.

Rosen Penev (7):
  gpio: move ppc4xx gpio driver from arch/powerpc to drivers/gpio
  gpio: ppc44x: Use module platform driver helper for GPIO
  gpio: ppc44x: Set GPIO chip firmware node
  gpio: ppc44x: Use platform resource helper for GPIO MMIO
  gpio: ppc44x: Convert GPIO to generic MMIO
  gpio: ppc44x: drop PPC-specific IO helpers and rename to ppc44x
  gpio: ppc44x: add MODULE info

 arch/powerpc/configs/44x/warp_defconfig |   2 +-
 arch/powerpc/configs/ppc44x_defconfig   |   2 +-
 arch/powerpc/platforms/44x/Kconfig      |   7 -
 arch/powerpc/platforms/44x/Makefile     |   2 +-
 arch/powerpc/platforms/44x/gpio.c       | 210 -----------------------
 drivers/gpio/Kconfig                    |   7 +
 drivers/gpio/Makefile                   |   1 +
 drivers/gpio/gpio-ppc44x.c              | 217 ++++++++++++++++++++++++
 8 files changed, 228 insertions(+), 220 deletions(-)
 delete mode 100644 arch/powerpc/platforms/44x/gpio.c
 create mode 100644 drivers/gpio/gpio-ppc44x.c

-- 
2.54.0


