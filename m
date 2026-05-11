Return-Path: <linux-gpio+bounces-36601-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF32LysiAmocoAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36601-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:38:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C951488F
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42E83305BCF0
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 18:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F22D47B431;
	Mon, 11 May 2026 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXnGtPEE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078F947D95C
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778524235; cv=none; b=eA1gBo2f5GqMxM/UEdAWVraukTMdWVhPfOUlXghSwYaOCHMf+Vgi/G2IXQe28PbdCLWK5U8Nw3dbflZp3xJck9BteaPrcMThrcnlN6tfN35HijqylSe5uGSSjt8Ai/TU5Y2kkUL0iIWS4A4pfQ6hed0buu7i0ZWPIFNVwCVJIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778524235; c=relaxed/simple;
	bh=4h8ZFHvotmpmnMDVehV8X6LAhmErDsDD6bRd5V7CNPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nBGadpSw2ZQWMr1EXN3JhC2x1O1wvZstCe2K/QtuMe+Hly5E21S4MOM70EVJI6AeF6w8f8PlQFHdIuoyLZ+jS6F7BOZ5FLXuuMQLeC5MmpX8Ogza6mBcVppqpwEzGtLnLvMS4j2q/twZK2R/vFyYpgSGiibC2pDRXdr+9Lqcz/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXnGtPEE; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8367df48711so2135477b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778524233; x=1779129033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=;
        b=QXnGtPEEKae8qUCEkncv6Q4AddyMxkIDrb5MBavtCz5JgrYmdoFae2MLzQisAwAu2A
         4WXpOewqD7vpPVUMzhw+pz2Oti4oAT0hoaWVtfJsybB1QwO66q0dD4xWCwWklTLt6cRK
         1keh35i5ILzMW5PHEO8dag8gusOU6V6WvziPPSlrTTGAq8K8edPETz8300qQfDLvtiuT
         TDrB4Em351zZvtlexRoSOMJknjAHz8lCmFN91y8HMctizEgi2C2X9bbVqmwy7TDRBvEn
         LyJvo2PYhDSgWV2fNIg4QnhYBdYH+AT/mMz+aFe1OL5+RNSW7aG6Ss3RiYGqUUHxUDjR
         6LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778524233; x=1779129033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KPa8QyM9bQ6Pp4HnS5gcPVJlkMa0m2NZAhl2yAgpxw=;
        b=ElYhvEb0Dw0n1GuEZbctFzjH9bHO3AxpuXIsIuxfM5MysduGN6C/7J5lbiiSXYdnGR
         mLYpZ4Jj1nEMtJWYu0I5upvPcvLZzaxnHSkaAvQXLNPvQ9TxxXBVWqF5sevpv0Mc4hbU
         cc3HDMt/YxsYCqbvEC6BiH1V0ioK6xq2UxWi9zCx7wCyYVdVZOii7sp2hMCaNtubiroH
         83xJFLWEREZtwlr01nVSFTLIBviLqYPpX5b+qeXVZzL3HUG8b9cH1kZoHREd2nXarRoD
         5qCcqTaOAT2K4GI08yKAhD0ytaZV5OnEqbPbRlzluyjcOvenhXqxCbaQj+Ed2d+ogUSS
         GBzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Qzw0vyRDH9T50THot1u2q0B0SAM9EN1HKwwT/UlFOVUzFK8BjNcudsGISPGehTAxN6BvCr3GjCXzi@vger.kernel.org
X-Gm-Message-State: AOJu0YzdfOydefuvdEOE2XoE7NdFCJ/kwx3G8miyEnFBeBjLGdBsUmeS
	+qFCFM6b/AM5AlRyuxM3377Z6/uKve1HzfKI3OqzXkDmu0kOmqO/MZfw
X-Gm-Gg: Acq92OGsvMHJwKRZorcN9m1xQGitEhLb1NNDDb7dXvpglYcT1YfvdPeChxofYhp2UAw
	Z619GUF3jVkCKBb/S1qMMqaJbZSeSd1MI0IM1l3hyQaRJKiNDWNpJwZart5iXRnuU8lFwDZTpTe
	zGdIblK8KHBuMhht/5b1hKgoPLRifSwMJkCijxvhpWZwkz364mIO/FTD9xDcxnbYQEkXff5mtdL
	XtHwuAvWkNkxYZ0OvLj+/oPIdFZVomTdE+qo41djgrirhUyWptn5AlPM6R9pXSqATuCvanI5+V6
	BdHKx15XeWiuwJfXMH4AEJ4wzmCE7m7zepKPTMXoJY8eV1i4RHcC83SDuKUB9+44T/iBdzg51hU
	+hZtVRBcN35/9+HFKjf834MlA9ITntAIBNx7HZoIjltrV4mTVQYt3zL7UH5untHP9Vrsd4/vi+Q
	fsmIbmhT/hHnGtsKuxd1i1APc9tm7b/PNJLa9a
X-Received: by 2002:a05:6a00:310:b0:83d:446c:2a8c with SMTP id d2e1a72fcca58-83d446c2bb6mr10520686b3a.25.1778524228880;
        Mon, 11 May 2026 11:30:28 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm19515723b3a.24.2026.05.11.11.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:30:28 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: sean.wang@kernel.org,
	linusw@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH 3/3] pinctrl: mediatek: fix SPDX comment style in header
Date: Tue, 12 May 2026 00:00:17 +0530
Message-Id: <20260511183017.228595-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 111C951488F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36601-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kmayur809@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mediatek.com:email]
X-Rspamd-Action: no action

Header files should use the C-style '/*' block comment for SPDX
license identifiers. Correct the style in pinctrl-mtk-mt8365.h
to satisfy checkpatch requirements.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
index 39e17532c46..fc22f412bd7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8365.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2018 MediaTek Inc.
  * Author: Zhiyong Tao <zhiyong.tao@mediatek.com>
-- 
2.34.1


