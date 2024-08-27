Return-Path: <linux-gpio+bounces-9218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB40960BA8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 15:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2299B21F6A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 13:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C971BF331;
	Tue, 27 Aug 2024 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrBA74CI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEB31BCA1F;
	Tue, 27 Aug 2024 13:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724764660; cv=none; b=GQA7I7Ud740KLdBiFcmlXcZTD9s9PGZ16o6iiRh5VPUsOFmx/eB91x3f0vQXL2jnXDpjXi9HH8MgzAyI0R3SjBEQDFzHHVXPx+YYZCNMq513bmFCn0zSssv8gXJsux6lDilod2oDKa553Et6Awyg6DHiu4incKEj0dgnQB4al5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724764660; c=relaxed/simple;
	bh=v7i8U1exn/p4Kp2wy1QiVDZ6BNT58N56FTmveyApcn0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ozW8jc9nPg4Fgkx12/45/nkiVqkkhhg0t2+MWlRj1patOhLO76AXH00OAMAOAF0+pG0w3xGT3j/GTd3/ah2UqAr/cnjIUQ0aQA9kz12SZsQHFSh8dGvEXIY//rEdXgkDbLL/kmjsRGFvXGMC7KVyNT6lUz0uGoj42WrFCQf0N9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrBA74CI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bec4fc82b0so10776262a12.1;
        Tue, 27 Aug 2024 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724764657; x=1725369457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxBf660Bv9zRXPQcrs/5nvFvHYc/SYwwwZQ1HYhGogQ=;
        b=KrBA74CILz1FoA336bSNeJpOt9iAN+hx2v8ZB33EMnDGKod0+sP1m8KNlHxF4ZlGxi
         eC/X50IFTSjJZEpGF5lcsBzlCs8z9/RaTObr/RUSYgDdCSU1HU8uNrDUwUtjQzvTekTx
         ht9jfoiC13EKk8iTxGviEEo6/FssrCIFYTkEd9pbLt9mpx/gDlDsVAon5C8AHdVKQS28
         RsdczQLtutqWiiNkdbJlvh47vWfJQeb36d3rrpfb3MYW0CdNgUmUNHO/9GS2lJJ+v3Nq
         N/cd0vMdCZq67YOrbC6p2SfAnPbhtgAN4FlmkEe77z40F4EQ6l+SqziqoQdm9++aUz9V
         fLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724764657; x=1725369457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxBf660Bv9zRXPQcrs/5nvFvHYc/SYwwwZQ1HYhGogQ=;
        b=P8iHHEdKe/DvtOYwv/BNCswJoawxhcZVQXMQ7Bn/z/GiCC6P6CesY90ltfyj4zZyS9
         n51DjslJK+woldDWo5+KYvJt2nSOlV1WhJfAtfUYYEpF/EgD/Jr+7qUvWHorzid+To8w
         cbB8i9PMvlonArJ3QBQTRNxYmkrpr24KjQTZnLAzNaS6DqCG3lU4fIpZkzZKhzPeGFq5
         4GcxW0f6jxqUjK/CEUGBBR55GqmaQydVucjxD16iyliRYkmb0/tW2+cqSJmb8CmPfO1S
         scfcP8hXrdWI9QhRKX7NexZ4vcLF2K/XKOw9BscSPnmlOb9U3Sh3CsyM5IN0DMq3mp2b
         r/sg==
X-Forwarded-Encrypted: i=1; AJvYcCUoJCZyaXsgS1Ujsj70KKEqkcHywNIzoRB0JryZYFdQNYwrUedRQGU3a5UAKKac8ZykOGYMWXtDrtDxZ/l0@vger.kernel.org, AJvYcCWWKeXVR9b2iQhnDRyqL9XtS/SidLG2aNIHmzfhStThrPsxSZOO8bgwSzgN7tROuU/0On9uVKjFs4+F@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7XZ8c16WayWxlDv/SlY0AXEv2kiijGSwkDpa/Y46gKWSCbbcs
	ujdthaaVK+UaeyqNYvnrow4PPlqefQF95/eV6WrQTu1tKB4xq3eA
X-Google-Smtp-Source: AGHT+IGhFaepLVw8n3BA5Ac566F9q6frA0UQsKGr69tE8YrQqVwA3DD8C+apzBJbdhoAor20lggjhA==
X-Received: by 2002:a17:907:809:b0:a7a:bae8:f2b5 with SMTP id a640c23a62f3a-a86e2aa4c70mr305452666b.36.1724764656836;
        Tue, 27 Aug 2024 06:17:36 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5ac5:89a0:20cd:42bc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878597sm110338466b.175.2024.08.27.06.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 06:17:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call outside of switch cases
Date: Tue, 27 Aug 2024 14:17:22 +0100
Message-Id: <20240827131722.89359-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240827131722.89359-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the `rzg2l_pinctrl_pinconf_set()` function by moving the call to
`arg = pinconf_to_config_argument(_configs[i])` to the beginning of the
loop. Previously, this call was redundantly made in each case of the
switch statement.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 8fc1f28d02d1..e742a4e3eb4a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -1384,9 +1384,9 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(_configs[i]);
+		arg = pinconf_to_config_argument(_configs[i]);
 		switch (param) {
 		case PIN_CONFIG_INPUT_ENABLE:
-			arg = pinconf_to_config_argument(_configs[i]);
 
 			if (!(cfg & PIN_CFG_IEN))
 				return -EINVAL;
@@ -1395,7 +1395,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_OUTPUT_ENABLE:
-			arg = pinconf_to_config_argument(_configs[i]);
 			if (!(cfg & PIN_CFG_OEN))
 				return -EINVAL;
 			if (!pctrl->data->oen_write)
@@ -1410,8 +1409,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_SLEW_RATE:
-			arg = pinconf_to_config_argument(_configs[i]);
-
 			if (!(cfg & PIN_CFG_SR) || arg > 1)
 				return -EINVAL;
 
@@ -1432,8 +1429,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_DRIVE_STRENGTH:
-			arg = pinconf_to_config_argument(_configs[i]);
-
 			if (!(cfg & PIN_CFG_IOLH_A) || hwcfg->drive_strength_ua)
 				return -EINVAL;
 
@@ -1457,8 +1452,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			break;
 
 		case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-			arg = pinconf_to_config_argument(_configs[i]);
-
 			if (!(cfg & PIN_CFG_IOLH_B) || !hwcfg->iolh_groupb_oi[0])
 				return -EINVAL;
 
@@ -1476,7 +1469,6 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 			if (!(cfg & PIN_CFG_IOLH_RZV2H))
 				return -EINVAL;
 
-			arg = pinconf_to_config_argument(_configs[i]);
 			if (arg > 3)
 				return -EINVAL;
 			rzg2l_rmw_pin_config(pctrl, IOLH(off), bit, IOLH_MASK, arg);
-- 
2.34.1


