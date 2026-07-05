Return-Path: <linux-gpio+bounces-39453-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mesIBhwCSmoI9gAAu9opvQ
	(envelope-from <linux-gpio+bounces-39453-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:05:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5418D709310
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 09:04:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=otsbk5at;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39453-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39453-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E052A300BDB0
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 07:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25394357D03;
	Sun,  5 Jul 2026 07:04:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E618BBAE
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:04:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783235095; cv=none; b=VDTTqcO3WGbTSjrYtNK6GRM+TaXpHPD4VegZeWD7R/EQs7cyHBgBA47BKUxzjIQ0kL7lWzs0apeVQvbfGoF47VHiw52P/2O3RaiYYUSMCI8NQaN8fYYrX8/A9fytjujpHpYsHRpyVFsVzYRNcSypCMsKUx1x0sEizkm92uMlcOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783235095; c=relaxed/simple;
	bh=rVUEl79PoXlXUwAmZC2UErhUtKZCSu0B1xf6Wz6IFuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dcc3hYYJS6rw0YhhfotBGWIIRDhKoI14pQqaSgU2CdLOPrXa0AR/OsUv5h5WUvBDB9N2yqK38hbCuS+Lm3GOA6VwkDsFUFcQzx43r+22Rq10+329KRYeha+YfDSvOQhCJJGZq53bRygnIrQsphXuIOlWJ7hcifbOMmq1dVYduXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otsbk5at; arc=none smtp.client-ip=209.85.210.182
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1921911b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783235094; x=1783839894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=otsbk5atf66UubxH+brOs/j3GW8dAEIbsHYGvvNLRt5K2KYQuNzJOnDQ3pqigI97WU
         vhMW1pkZzU6ZEzDz/gfpTDZw/forUg2LDY4vEtqZRJxNyLqi08kmtt8enheiKEujVgSQ
         E+pHy4a7X/D6EHxVr0vFguyEGNOMwYi9vZUHTyAfyjdB5Ck8kO6s74KP3FjhEMPfxLaM
         rgpbSIW/jvEVzfDlXOujm2LYlVOnAMhVd9EXpBAvdS0EAHZPXDnUTTEHyGpPxgB4FfRe
         edKN1wTHGIwhmBUm8sHMWpBjW3/f2sJmzZIRfPnlWdxIcGff9TfGsunjz4ENmOrCHFpq
         aW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783235094; x=1783839894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=Jf01wsCoDIc8adYUuzW+coWjmPCC2CtJMLv5oQ4P4QEt3cW+QxJ3zYBEhxAyQruVzq
         0d7Sd4rpJkjkp/iecZolB3pX/xbVoiwPaZLys7y0g2mVPDm7WkRfiSocGScrtKm8bBS+
         35kjKaCVtEGkfIHb3aslmoZ9BpFk7MF7GXgkH+U5xS/nde7cnq+ZIFTTS/rV7+azxdWl
         rngtrk7y56YeE8yJiRYNzc553vqD7hC2gv5sbgDUbwrh69N4kg1ofWPFcpvSEOBKxktI
         1lCEeZKrBLU3+qDQnq3gYKbexOP6PA7UTIIDuoLWOIKm7659XVzU6rgeECIRDX1D2iTZ
         5XTg==
X-Gm-Message-State: AOJu0Yzn+bGtXPx8p2hVmZA2qnb2uKJMDwBJFRqSQb9IFwmH5zw0eO4R
	ojo5IDKBhR1YJfyKBGSiyeGYvcUJQIEPGQt6dJab7z4BOCCxr8pBa+Bze8kPNJP1cRHBwg==
X-Gm-Gg: AfdE7ckHT3oV/WCm6XF0jXDbFMRzoqJoWEOM5QH2YBdgFN9uv3QHq1aB6Gezfzdutn/
	EHEpZZqOfrXmAiSjcOEhf7/LQz6/6UU1NYJ3llg7CVxmc9NBIh2r9HVOoXiNMuFMhFeOzUyoj8C
	MYHG11GS2hwCTpCeNTySZScwDoyR5UQuzsPs1KOTFLO4y6gyQ0gpTh4+qOjBh+ZkTZNlJW9JPtB
	Lg7/fNgvEAs+6BVbSO/efVFgGZbvzrY0AZxJP4W5qhDLy+1trzIUPIzBTYOSH2k44rIwJD91tHF
	wO1+Xcqn/7HSsC1hpCVwFW3zr+wHrJKyPcGb279QBdLr0xxXqEd0IloMpnSyfpjSEudKaxO7f10
	fI/dmkFSfowtdwCfbW8AdQUnPdA0lmH7gTnXwbdpMaNvmAw0ipsaar9DicW/BdJIPk7SA4kQhBX
	lY74qzCzAqWL7ONb+scfCT
X-Received: by 2002:a05:6a00:189e:b0:847:973b:3d04 with SMTP id d2e1a72fcca58-847f6d67be4mr5897810b3a.10.1783235094116;
        Sun, 05 Jul 2026 00:04:54 -0700 (PDT)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bcf03bsm2012675b3a.26.2026.07.05.00.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:04:53 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: linusw@kernel.org,
	corbet@lwn.net
Cc: linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>
Subject: [PATCH] docs: driver-api: pin-control: fix spelling of below
Date: Sun,  5 Jul 2026 15:04:22 +0800
Message-ID: <20260705070422.764-1-ceohunk@gmail.com>
X-Mailer: git-send-email 2.46.0.windows.1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39453-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:corbet@lwn.net,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ceohunk@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ceohunk@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ceohunk@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5418D709310

Fix the spelling of 'bellow' to 'below' in the PM API section.

Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
---
 Documentation/driver-api/pin-control.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 1f585ecca..80106e44a 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "init", "sleep" and "idle".
   selected after the driver probe.
 
 - the ``sleep`` and ``idle`` states are for power management and can only
-  be selected with the PM API bellow.
+  be selected with the PM API below.
 
 PM interfaces
 =================
-- 
2.46.0.windows.1


