Return-Path: <linux-gpio+bounces-37773-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFsuF51kHmrCiwkAu9opvQ
	(envelope-from <linux-gpio+bounces-37773-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:05:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D3628595
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 07:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DC5E3077DF4
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 05:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E9928C84A;
	Tue,  2 Jun 2026 05:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9ia7i+q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F924A06A
	for <linux-gpio@vger.kernel.org>; Tue,  2 Jun 2026 05:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780376521; cv=none; b=czSc2jEiU6NeR1us/bB3gLwloRIScgnwnNdsdR6T9pAugO+AhD9skIudaNK0wWobjf3M6zjsfkSUye/HYVFpOnbEyGEpw1JQ7YlGXA7iJ2lVpZtYpo0QJ05BhxnTul7aZE+dh/qPOLi7mVlAR+BRaqHG/ZF8UNq3llcAnvHP5r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780376521; c=relaxed/simple;
	bh=blhUGu1oPwp8bc3L4HpG86PruEuGmLzkdRbiACFT/go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q5dP+PFNphgxxO/j/GltfDBVCsD4jWqoMD2MdRRS0MO85N+Z7YL0G5WnXW4Ba2L8vsXRoXC7xFVEUA3AugvBZrwxD+rtfgVr/arbzNi02GL29bqUb2TQciT3gHtZ3L8Js1bikUISNMdCx5VR6gJ5V9g3rtVbuUyNrpd++FTXjHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9ia7i+q; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36da151a152so1327518a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2026 22:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780376520; x=1780981320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqpZtb3L5AZBzchvpjx7HvUJPGkad1t8dle6FYbZAXY=;
        b=G9ia7i+q1pc6ylY/FT7qRwcD0arO36fhM5AAjdDLGT7i6CEs5Hr2Fttzn6K3oKi+Yz
         Tv+zEAD2dw3IqHd66jLOEkkGZjCsYavdvM+Z8JTjQoJ+iXSBPPrhfd9+ftnET4Hhh/gP
         m4oz2ZWwpcAYS+2TEWn89am4Hn+pX0bMsszY9JI7DMuca+h2k3ssjzMl4HfNEZQHy1RE
         WgSNjXkIhrWiiM6OWY1UC5SGfr7LC5l5OEBWF+rdcSSmveMmuvMjL2tcVw7QDu2eGzpu
         AeOLUOvewJF2VmeL9PlNrt4kecmykm9XyPJHWD2Flrfv4hb8tFQDMkuA9/onmgyXe9hj
         q0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780376520; x=1780981320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JqpZtb3L5AZBzchvpjx7HvUJPGkad1t8dle6FYbZAXY=;
        b=M2hq97LeUdne/mFS4NZMo12NckLrPNEKzgtoxIXDZjYHb2g2fGaERRVnZ58bmLXAZF
         II6BTvOKGCkgLoz5Dg90+fJ8hi6Zi2wrTHR9HeK4gPgJidv5wtuWuyvEof2AA3RIUOU0
         3YbYGEgTUHeQidqfiSwid3slLdgPqPUPYZWCUKPQUeleEcCYfcLjm9d8g3EiqN0B0YYA
         LsQ4HyOnQ1Gch6dhlm17+nUtOyNyWkAxnoALkPpEpRhUfXnVv+vh+UeD/r3JJ/B6KBOF
         03ADRGh/+PFdbpCWW/noBADh3SyJk713H6qi7taPcgrvs571kZtLUYwqn5aneO+oCIz6
         FhCA==
X-Gm-Message-State: AOJu0YwCtDiOzCpx5pcSncrChJdSp6UB//PfW+XWLKdxsuL/nW61zp7S
	9C53hZBSfjDJfZKPP43Lujyv/E9lNb8YuYPcpBbbQxNrnSeGOGTDLoSdB48vu2bs
X-Gm-Gg: Acq92OGj+izmok4Ex7sZZJYxpJQ11BYzI26pkxTK+p/Vgg1WqXjPjzmtJMI9VZD8DO+
	IANRhmtHRKWycrjgOce6fcuubc4gwt/e2ohW1BH+CoNZqLWYUv9t2SdeXR+vQlbwvBBjQhozBBQ
	a5xHZ6t359fQkOTQ7P6G4g6+mn/tMMZ391aoANNgd1Cg/OBQbQ7ZFjtrHsL6KOxaodgzQhgoK/K
	wO5x1+J5oLhHWCiDXgDd82uL6IVOQk9gmkkqIdvSVckrdBlS7VE4+hIKjCuHlXI7WSsY3UzhUKM
	67lMHlcqueKruo0JWLfvy2btwGh83aDHqerJMPZ11pCBWvyt7cC7UU7668dDSFQIh3o7SsKZ5CY
	JM1XEiOLIK1sA5jApNM7hOKT8dZa66Wx/35su7qpcfY6G6aLOeNlxLENiMMCSCeQqeW3UyS8lr/
	aqjX9KFKCyu46NsuRbuKTbN+67obb7J/CKR4Vigk4CwrkUkbzly08hwcsKqE7IT+87AYHvBtc+v
	2EuSIIB0lRm3f5wJytxpLxfcN0n0s9cifeXhiQi0xKKQQ==
X-Received: by 2002:a17:90b:354c:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-36c2eba615emr9027043a91.0.1780376519593;
        Mon, 01 Jun 2026 22:01:59 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8589d055c7sm8958467a12.9.2026.06.01.22.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 22:01:57 -0700 (PDT)
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
Subject: [PATCH 3/7] gpio: ppc44x: Set GPIO chip firmware node
Date: Mon,  1 Jun 2026 22:01:27 -0700
Message-ID: <20260602050131.856789-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602050131.856789-1-rosenp@gmail.com>
References: <20260602050131.856789-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-37773-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B30D3628595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PPC4xx GPIO driver stopped assigning an explicit firmware node
to the gpio_chip when it moved away from of_mm_gpiochip_add_data().

Restore that association from the platform device so OF GPIO lookup
can match phandles to the registered gpiochip.

Tested on: Cisco MX60W. No more probe deferral.

Assisted-by: Codex:GPT-5.5
Fixes: 1044dbaf2a77 ("powerpc/44x: Change GPIO driver to a proper platform driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 0d2244272e32..07b699cc4dd9 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -169,6 +169,8 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 
 	gc = &chip->gc;
 
+	gc->parent = dev;
+	gc->fwnode = dev_fwnode(dev);
 	gc->base = -1;
 	gc->ngpio = 32;
 	gc->direction_input = ppc4xx_gpio_dir_in;
-- 
2.54.0


