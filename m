Return-Path: <linux-gpio+bounces-38685-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uzH4FbEWNGq/OAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38685-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:02:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 944356A16EF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 18:02:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CeQiyIYG;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38685-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38685-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A69523100970
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 15:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B151314D37;
	Thu, 18 Jun 2026 15:56:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70709263F5E
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 15:56:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798205; cv=none; b=nm1eT/vB1OlFN2AYTvw6T/hSUoC4p0o3cFUwOy5EfCtOXQlvrn6PlHvCwkdRcxfjGzXnF7RmhH+kK6Rnoel+VIDnA4+U6aX5EIr2LcD0rzx8tSeahYlzT171zWA5TYRW3gJ7Tx5G4zT8qMJcm/W9O8pvK5fOEyCc3y2NptkxbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798205; c=relaxed/simple;
	bh=JUKmRZtoNI4o5Vm/0lOZUuEiCIpFuLYeYev7TarFrbE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HT9336ByYI4jQ+l3tnDDxbbhGUOQ8uLG/EqSpS8JS18FdgZwretESULOFLpDRh+lHhEsu0YJFMTkJ50jwaUGJujOAvuhpSfLcm4D+La7VXXrMA4rztXLtLLPL5VJdi5/TuqRRCr0ftPftzukx35qQBzs4A0Nlcf6p0yuAzRBjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CeQiyIYG; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ad4a5647e5so1305763e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781798203; x=1782403003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFV0FA736wIt2ycp5ig/UBQZmZpIyTkKFVm42cZQ/Qs=;
        b=CeQiyIYGymDlbGHDcos/uXRgLt3JOWSaK3wgdJ1+wLV6ngl4fpjvX/SztCAThQfCOL
         UyS3PWU9naACjL+JuM4qhVGuq4ax5f4VziD2EKWHZhAerqOocEqLT77e3E1SrZZDms8A
         U+k23eH3ix5cfhk8pMcZ/+3OI/yleBnn5WgybzqmG7oJNvLzQcZCvdKKwZIAmDZ672Bg
         xuCOEz5W9yH4b5DSamfW4N3JaTxktt3X8C9ORE2c35WTyI+7qW0fP2iqknnF6lV8cpQv
         hDsjg81vwYVYHUcXH7dszrDr4LT6YrklGhdhspSt4f/7axqy1DeshMPmj+5RVQovBeB4
         I4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798203; x=1782403003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFV0FA736wIt2ycp5ig/UBQZmZpIyTkKFVm42cZQ/Qs=;
        b=hP1sGPS9p/Z9dr2RXNZ/086ruU5lgxP8bee/Mxo2Pj54L8CgSstqDqHx2uJ/3/5I/n
         6A2qoYzARwjY/cIJjB6OxeT4pfTl9Bay2ti6JITnIY4A1/HajtOS5zaBuvk32kHy+NgY
         Jdghd6xqQ1Pd2A7RdGWzbUsQwtMj1GI441Mj+UmfrBhXIEtEcmjtV2QfWK17TnwoIVOW
         of4QYOyeM1nEJ9HqSniPCCTqqeW4TCSLr9GgAGTWFklsHsOz72Fg9p43d0YUDtGRrF1Z
         Wx7M+9q6PXNrHbzTXnzZCip8/moivSoNfw+U2+DNtc/xcIlfpPeGS60O3kLAhCR2r0nc
         B4UA==
X-Gm-Message-State: AOJu0YxR7fXYJfnyjs7d+arfT4MRw9+p94DbFohOkO8yoz/HY0Q9TRTX
	gFwX9pEsX5B3kaBUIxQAh/yOysrIeiBxqW/AzaL0LnVpXP5Urwj7YpYo
X-Gm-Gg: AfdE7ckCxXYvmLWRoaJsGuaFyrezTLH/OKmtUTz78/+8p9jmJw2Ui7n8mLTfqotRrRP
	pdiqO1zS9TzGezuEn3uc9YPu/WLc2YfLm/yWlpw1PYOx4wsvJy0Oqw869E9JtfYIzQz4O9UI+v9
	M6Ug6tYf3w463tLmMpFQURmBvDKsEyAuvfA6sKm/FFdFhtFGXrOsRAzYUx5AIADLu2z9QFNBNSh
	na9xYIxPtbBxz0O814Ke57YYqnoa27R7pEP9eVqf4bSgS9Y5Z3/1jxNhZTylj5o1W92r20qDRaw
	a9qLyH93XLil8Ki55VlzlB/VI682Y0sLbomWRfBCmyDiBjCvigdBQsBvHanaYch+LLHrZLN7mfE
	4yqKr0+/OVcJja6mb2U3VuwBrUGuPxzL/OvQY1o8hu0JRCSVZXlJTsbzyHkUaP5HxJROxV9Wr52
	4EKr0eMr+t6WPrWy/zQ7fpN6b9LVg1GzYw4V+V7OVMjWjO3s9Ef+XSRRh7TKrpHal/Dw+rGAkJw
	s0S9Oox788O2ky5B0czfg==
X-Received: by 2002:a05:6512:2527:b0:5aa:8822:c945 with SMTP id 2adb3069b0e04-5ad562e8755mr58169e87.47.1781798202652;
        Thu, 18 Jun 2026 08:56:42 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad56375f38sm13217e87.17.2026.06.18.08.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:40 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 0/3] gpio: tb10x: W=1 warning fix and style cleanups
Date: Thu, 18 Jun 2026 18:56:23 +0300
Message-Id: <20260618155626.18751-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38685-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:igorpetindev@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[igorpetindev@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igorpetindev@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 944356A16EF

This series fixes a kernel-doc warning in the tb10x GPIO driver
and addresses two minor checkpatch.pl coding style issues.

Patch 1 fixes the kernel-doc structure formatting.
Patch 2 replaces bare unsigned with unsigned int.
Patch 3 removes unnecessary braces from a single-statement block.

Igor Putko (3):
  gpio: tb10x: fix struct tb10x_gpio kernel-doc
  gpio: tb10x: use unsigned int instead of bare unsigned
  gpio: tb10x: remove unnecessary braces

 drivers/gpio/gpio-tb10x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


