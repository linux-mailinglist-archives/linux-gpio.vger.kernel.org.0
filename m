Return-Path: <linux-gpio+bounces-35225-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM9ROp/X42krLQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35225-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 21:12:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86724422088
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 21:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20CAB303A5C7
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Apr 2026 19:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D73D33B6C8;
	Sat, 18 Apr 2026 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lygkBmW8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E32331209
	for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776539496; cv=none; b=Dpq2m4af8eWveiBdxDFXxYkQfQzXb7Gx8qHTN5H+HoE5pTqOircNSCGOE73y27DwQC/AfVeUDPFqiRXY6Dd7B+YGhX4WqlyX2lIp8GNCz5A3g3D893gZ5ed0Bk3upvUc90AaUs5yAfB3yse5mDyjBhEhdDVPwaxxbBlOpcjWwrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776539496; c=relaxed/simple;
	bh=QuEQxYNSSYDlBxtNYRRY/Ah0N6OsfCulkyGo4LLrmn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J3N5+NdIYMyM3yuwaNfjJT3ap7urBG/ca50qi5EAd02GuEBRPFjEOS6Ih1gfks2EAVLa6cch7PcWlwKzyHkMHzvDzXPai9bgS3pLnrZ/fznkTodZTn/iK7V8no4QwBdEKqqstrzoBjgL1GEfRHfaS3O2qO9GOPupQlFoxkNUDNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lygkBmW8; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so1850297a91.3
        for <linux-gpio@vger.kernel.org>; Sat, 18 Apr 2026 12:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776539494; x=1777144294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3f3NWwwGjda6a6KYRAcwpn+DeJKRTTACZGUkh8g/ZSk=;
        b=lygkBmW8t3FzloVewJREtX4yft6kNMZglJpG/3Phw3g6c8+uWVbwGMLmupTM/wbTWK
         FGKl9k6GWr6kpQA7LzofZ1wM0sIYPovKyswF5iP1tF0nn3UkgnEL3Tc0Zye+IjZV2P92
         HJGHR7Lyzivsa9pX2kLNPSoZRtVDhGS7kYJa9RqiNzdhmSUsHnXSbIQeyYYzhvpt9txF
         EE6M/TthXrrE/NHRxHDRqmhOTIt07ZeUE8IGSQM4V5s6YFfiHdgdSn03ERqfjLKim/ZM
         6tbD65buu9tSAyNYtiLItyFd5GSuYA3Mk4+gMDyKYCRY2uU8VDHU6Sy4fgorG2QYftda
         QwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776539494; x=1777144294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3f3NWwwGjda6a6KYRAcwpn+DeJKRTTACZGUkh8g/ZSk=;
        b=oEG7k58f+SrDg7h0a++g7cIrCQUr9PAHbGvKja+yRq+MfaYH7MUPAWcxj9RY1zd1bv
         qzPmgfAeD+qJpk6f8RVQ+YkO32tZSMAuNlH3k1l5x+pMYtt3T6DXjUAYxgeXHmbQZyMV
         j/736vXIkOpWcbZjFB9L1Z2zfcA3HXdxYCaRoRtCWg2y43hufKhQLu/cM7hz5AoKGwBk
         RuCZtG4X3+SGbEvOVgoN8xSQKye0mSyl46WpjGIhNbnHuhPSzyrEi71UApT6HRbS1aTf
         z2ooi/2+0dvgPT/KtSCx2QdNO47Oq7d1nM6QFWKN38jsop/FArYjEJ3E1R4/6TB9N4qN
         o1zg==
X-Gm-Message-State: AOJu0YzK9yuEMFQSRtVfenX8YM4lbLLJNdpCvIp8I9b4ZFn6xjOFhJqZ
	lqKihh/IsXJ66JvN9pzrWLF4t47FqJnzVkeCYFCq8fYCWxmBwyTUN7dz
X-Gm-Gg: AeBDieuKJ/TEMmGxC+YFI8gIZawxt1QNFVwDW/Or3+EmQG6UXLrvvzE+aAER4jU7eXu
	jKfMuLOLIxFMiReQ2q7TGUCJpyY7ZfqJj6hih0rJslq6uwb8jU2pDER0N0HJorv0fsZb0NS3Oit
	+OHS/Z8WJ7HvlpLizdRCszbagidW4Hx6h7Y1nNY45FiFAV6EcHFo25sjGQHjQWDA9GiskRY3Kom
	J6VUjWHkgurARjQDWp6L+wTUQ0DWxRadkpKn5+tR64y24e3IAuh/teoPtIujoJH+0SsOc9e5uo2
	mdSdsuo1ENudvUa2FeleCA5EWio5O2mU8TY8AhPXg7+UBEp2kYcSojpH62C/C49phxUK91Wra4y
	qGe8oc2T+upQzM2KePA1NFJB99BY8Oh/3epJKhjBxVLnJUaHPnxwaEXuUtLvebh+d+/jbtGE7cG
	ow2vVp2E+Gv0/DK0yU8w0o4kvrCjuCdUfPFcGOt84myY2a+9GS8sRMgBQ=
X-Received: by 2002:a17:90b:4b44:b0:361:3224:2f65 with SMTP id 98e67ed59e1d1-361403bdd07mr7876514a91.3.1776539493601;
        Sat, 18 Apr 2026 12:11:33 -0700 (PDT)
Received: from yash-Bravo-15-B5DD.local ([14.99.167.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36140ff148dsm5549142a91.7.2026.04.18.12.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 12:11:32 -0700 (PDT)
From: Yash Suthar <yashsuthar983@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yash Suthar <yashsuthar983@gmail.com>
Subject: [PATCH] pinctrl: pinconf-generic: Use kmemdup_array() over kmemdup()
Date: Sun, 19 Apr 2026 00:41:24 +0530
Message-ID: <20260418191125.26925-1-yashsuthar983@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35225-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yashsuthar983@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 86724422088
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

using kmemdup_array instead of kmemdup ,as it is more
readable and matches the intent of the api.
tested with w=1, no new warnings introduced.

Signed-off-by: Yash Suthar <yashsuthar983@gmail.com>
---
 drivers/pinctrl/pinconf-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 2b030bd0e6ad..b5c1587bf2e6 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -371,7 +371,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 	 * Now limit the number of configs to the real number of
 	 * found properties.
 	 */
-	*configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
+	*configs = kmemdup_array(cfg, ncfg, sizeof(unsigned long), GFP_KERNEL);
 	if (!*configs) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.43.0


