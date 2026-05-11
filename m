Return-Path: <linux-gpio+bounces-36599-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6N0XBLQhAmocoAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36599-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:36:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03010514863
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E880301D10C
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 18:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF7147CC7E;
	Mon, 11 May 2026 18:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9PZ6eci"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B836441C2FD
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 18:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778524196; cv=none; b=cPA/XcjE1WlguHvvKsOVW434bXiuguPolhANPZUIh2Wu7U+MG0B6vxOr5UfvcV5rfI+zRy04MNn7gJlCIYxyriW7BwtSgNFJFSShiRRPF70Uu/YimlFL4B2TnctcNUGa67yimyM/vHVeh6NhzpoWeaiFdZYR7BuOuYDP+0uPVO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778524196; c=relaxed/simple;
	bh=RG9Z76+47yLVeXFvC9hsIzhM1O0fTKF+lwJmQreos74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=cCja7TaMEC2pwppDh21hH6CO/FgGZrvlXG8Bh9cZYSTshmbreegDoEXXBU2TFKO4r9gIDg7iAM1Cq9XyrwdjgRNvyiHmE9uKQvRP4E+qKpc1Pl37pfkvJtMfi3YTlE9Nc7miBPjvsg9S9K8G2Df4hqcI2FrKyVlKGUvda4y6LUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9PZ6eci; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba928852a5so30887615ad.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778524194; x=1779128994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/dUnpjgB2glFg8Z4jjdQyqS7WANd7FZwf3KfWMkfsYQ=;
        b=U9PZ6ecimCOJFR1npVK3a8Fe4ATfKqYiTRDaALIFyWp3kbwOdx3fYahkuesOX+8bC6
         0+gVOuEDBQpDll69/mF7v8eKVgwA4QuKv8gV3mhsCqot/MEUHYXXBQ37s+riEh+wOt0y
         J70dj6RAgAEo+dfz3+Bo1Cp5fK92U4MwyNszu3waHF8dVKOHgeHFaYpfYr759zFVuP6G
         32ta6+xcTdYerHh3mW6rvkocLaysAI1VlJ5S/iZGO9gtQp9MwF163/dwjb90pHhMncPV
         ssGMfKYlT8/zyOmrXqITVzt6cjZDNt0RksjODAi5GTdXO/aI1NO3SdVjmiHMgn8GX/zg
         TrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778524194; x=1779128994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dUnpjgB2glFg8Z4jjdQyqS7WANd7FZwf3KfWMkfsYQ=;
        b=pZk68TzIjZyhydv6xmcqHk3XTHGWWq1cMhEgeafyWV+v0dI/SkbV4RG6s3TQT2CRKn
         qF57ehcr4P0BV+Sz6eHh0NvGblqMPOfPGU8kiA3qZoIs7tkTwDKYoJ6P/dzFsP2Va24s
         mwdgrUn0Ou1ymO0q2mHgBGMBlEE7EkoZIXM4NcDbPtjGq/r35zDWKejMMOz823NP/fio
         nRhrPzLIcQF0IfZI6CVpZntrqCUxsoNkERsEtQQQoaKR7LFX5iB6QVKaSTSo5m/u8XQD
         Kxxdr0fxTPZm/og02ODlTYRaVLzqU2kNrUkPEPA88J/A7jPBu2FtWwbBF9gb6QUMbZtT
         +HjA==
X-Forwarded-Encrypted: i=1; AFNElJ85pqJ6L5gcRwUubWDGnN/LW4zGzoK/urXBE+2psWM4JsICSmnx2tU4+KEWy8WMK/PNzlSUhQnhIOXC@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYZ33H1TTkEb+MkgCBO1RbUiP9HPDMAPFToj7S+IE/EAE93gd
	nYCtlp9YP3+DX4icsY9neMAOXy7YP59GnKxbIZRXuaR5XirkQXiNaYuy
X-Gm-Gg: Acq92OEMZmsEQyq6UjOkynJusmrjEoq7F3l/cATbxdP3dt1cs4xC3NMbKMEXWgTwyWY
	ne7bFwLXLrnFOD2rkiMRCZVIU2CV6x4cvG4wkVMAD2DNocC8sq0KMNlHGQVUNhDq7S0/WzJoRdT
	NR3gR2HKQamWx5OpqoqFvf8kFvG0WPf+QaIbtn/0QDo8uGmqbiMaDlTnQdLjg6p6TpZWTK6y5OP
	1qryHw+CQkqaudoBludl+nrDRTB06XtbbVDvm2CQJz5VDSTUYDJjZC0gW4Bq/1UGT7lBlkB3AhR
	e5Jd7csnFBkRI8QZ+L0kKplzGrcqR0+mcuSUJuxWiCKJRPHI36UsllBwLNZ3Xg+H2b26ssYleUa
	2BwZWIfga5gvruirmPl6tkXdvB5t6sDxk4C6e/sOFore/WPk4P51PtAeugwbPuwFyuPdce1jTWi
	YKfx10RtKLjbZXK47AyNf3PURs3TWlZoXiP5q1
X-Received: by 2002:a17:902:f70b:b0:2b9:ea53:4cfc with SMTP id d9443c01a7336-2bc7aa204a9mr109094785ad.19.1778524194172;
        Mon, 11 May 2026 11:29:54 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2700dsm114260525ad.2.2026.05.11.11.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:29:53 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: linusw@kernel.org
Cc: kuba@kernel.org,
	alexander.deucher@amd.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH 1/3] pinctrl: bcm: fix SPDX comment style in header
Date: Mon, 11 May 2026 23:59:43 +0530
Message-Id: <20260511182943.228154-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 03010514863
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36599-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,amd.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kmayur809@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Header files should use the C-style '/*' block comment for SPDX
license identifiers. Correct the style in pinctrl-bcm63xx.h
to satisfy checkpatch requirements.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm63xx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
index 95243027ecd..3dcfabb94ec 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
+++ b/drivers/pinctrl/bcm/pinctrl-bcm63xx.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: GPL-2.0+ */
 /*
  * Copyright (C) 2021 Álvaro Fernández Rojas <noltari@gmail.com>
  * Copyright (C) 2016 Jonas Gorski <jonas.gorski@gmail.com>
-- 
2.34.1


