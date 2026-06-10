Return-Path: <linux-gpio+bounces-38236-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uUWiBIo6KWqwSgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38236-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:20:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D3D668346
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 12:20:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lMfdUPBj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38236-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38236-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0890300D61D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED5D3BAD93;
	Wed, 10 Jun 2026 10:20:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DE23EAB8
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 10:20:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086837; cv=none; b=rAyVUc0lMSdprx+f98nHaghHglRjaJy9UKXPzpqdjMlNlY/00NeNX4PrMsSkTnwbFQeroliEPnpDtEQQjXcdpgOLfHP/6RhFD3N6wBz9wNr1q7P+xjYRO5aFBK2c108dfrLrzsJy/0AproxebgF/YNJSSBPJS/2LHU6bcZVwVEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086837; c=relaxed/simple;
	bh=PeGiLG6hCrHkk1TB1pa6/NVtDkTBudB+5q9kndy4mOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=REQmf5WnQv8zSC12bkyh4cimxh6lcG4i/bqEd6XGjLMw5ZutpRcJ67757BGX78vw3XC6xczQd1NnSdVHb2xMYvOVdlJl7gVUG+rytPtSQRbQJTuHQ0rC2yHk/A6yXdoL3eYym6Gzxp9MC70S05NDrXVGBtQkdvngSOGxr8/C9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMfdUPBj; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so40423225ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086836; x=1781691636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=lMfdUPBjp29W0RHEjvOefw2ryJgHhH9vrQpzKKQNxJUO58Qh+q/MrxaXd2q05XgS7y
         4Y4h8tiLCxpl9CmOsfkX1G+hsXlv57bdnqojTdvdlNrMXcv8v4dqyn2PqZjj4rGxrbmf
         tJFgSUMAML4tkKqzusNQcVRdcXWep9bTmptq0bxOfLWYYW58VHYvdvxRXetRoERf7Le7
         QtEHsXDK6YQlLl4YOribiNRWEQYKZWah7/zLWYXevWnnz+sVH96BVDj4lkg9EUA8dG/i
         dxQ0OnAUKbhl44vpm+IN6PiLRbFfuxzwPjj0LMnNC1YHB3sOwYEg33awi7pq0XVxm+Mb
         44rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086836; x=1781691636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJUYz/VnH85xP5IAHA2EUA0hKYGmtjdBqL/tBoqQ/8M=;
        b=g8uvlLHSwe06pQbYZ8AwkobwEVc+d2kE/zY2UE7bq8KO+M5r1h4EcTQtbfy7tPJO7Q
         HBd9tq4S324iQpJLkax3sfq9pMwVq2UZ+sbHzwKJu63b3lT7OdGgDaCbMpxSRmCSG38W
         AmdKGUoZlmj4UiHHwycbCDvvl1zkjxNGdQ59wdlXTjgV/nm2D6ycgkC9aQkYJy5q6hMw
         iXCC4eNe0VHIv22i7pmM/FWyx2NmDHqvBowQSxdj+cp9xuCchXLPCIQfBXpyLv8iIHDI
         fyu7WdKfmiCDpWZx6y1nI/FXNeHtP6yq/YwLpef/F4KDoGnoStWbePSFBV1MuHe4U1Nm
         oFWQ==
X-Forwarded-Encrypted: i=1; AFNElJ82/Ajp/u0mVq6E2QjUpAoV9eJ8tlitw/sy8LFh63fugy9D+0Umf2QMV4BGHuoxtVapAof6bPCyhOFB@vger.kernel.org
X-Gm-Message-State: AOJu0YxFDN3TUJP62vbHBhGWSSmusCaBheXECyl+eYJD1Vt9V/K6uLbu
	WwR9GvXNfzjPJOb9cPkXMJcDEUghXmuQmWUnWyeTCXSdAOn+pC36PdiS
X-Gm-Gg: Acq92OH0P3gLeRj6Cg7WLY30NXnsVBTuMI+m57oBqJO4ybLMm6zGZ0pB1GXJhXhMLSe
	zPcTWX1pgaRz0RfCzjNw6c6Xf42g8XTM7Xt4GYR0Or3UaZeuSJEGA0TevVtc+jXtLHOkpYS9aSj
	Xo2n3WN65TXzCKLrJWnVcTtv6AxesqqgdYnCEKQYAHFvd+Xei0GNn7Twyv0B9JtmF/ueRa5A5gC
	J99HNy80vX4v3QkIrfLExV+4TGZ+vSPGUwZKMm7scp994IGlZo5PYISyjskIcsQdfzU0m9FfvTm
	9EQsM95NGuminm0T1QTBfm48d0G1TA1GWAssUn8P5yypEvnwUUK2tekXPXXxE7GZC7yKmAJWrDE
	XoV6DFwdD+MrHsxsK6ZxfiUNBRBUXznNmqYY5Xt1VSvhHX61nk95SxusqQPf5Oe+FKfl69oRbjB
	7VOrV+7Suh047LLGglXI0uwWNMHRRbQdnVblXtHFU073EeqtPbYu2KeDczIzdD7z7jHLMh
X-Received: by 2002:a17:902:e544:b0:2bf:2d0:8877 with SMTP id d9443c01a7336-2c1ec7fe13emr206516295ad.23.1781086835997;
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:20:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/10] ASoC: mediatek: Use guard() for mutex & spin locks
Date: Wed, 10 Jun 2026 17:20:11 +0700
Message-ID: <20260610102021.83273-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38236-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:matthias.bgg@gmail.com,m:lgirdwood@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:brgl@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72D3D668346

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in Mediatek ASoC drivers
to use guard() helpers.

Most patches are straightforward conversions to guard() helpers with no
functional change intended.

One exception is mt8192-afe-gpio, where the mutex release point moves from
immediately before dev_warn() to scope exit. However, the affected path 
only emits a warning and immediately returns -EINVAL, without any further
processing.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (10):
  ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
  ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
  ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
  ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin
    locks
  ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
  ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks

 sound/soc/mediatek/common/mtk-afe-fe-dai.c  |  8 +-
 sound/soc/mediatek/common/mtk-btcvsd.c      | 81 +++++++++------------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 13 +---
 sound/soc/mediatek/mt8188/mt8188-afe-clk.c  | 29 +++-----
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c |  4 +-
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  | 42 +++++------
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++--
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c  | 30 ++------
 sound/soc/mediatek/mt8365/mt8365-dai-adda.c | 10 +--
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c  |  5 +-
 10 files changed, 87 insertions(+), 151 deletions(-)

-- 
2.43.0


