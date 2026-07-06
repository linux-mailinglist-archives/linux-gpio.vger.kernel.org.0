Return-Path: <linux-gpio+bounces-39509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GddmI0+FS2pySwEAu9opvQ
	(envelope-from <linux-gpio+bounces-39509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:37:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5170F427
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:37:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ghoFoJ8A;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39509-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39509-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 919483014741
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 10:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9D73B3BFE;
	Mon,  6 Jul 2026 10:36:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F33AEF2A
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 10:36:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783334219; cv=none; b=WD5h1oGIZjep9XrieLE0b4ITFQreNgezqpY0mhz9D6Qu4bm75tukMUrgoet6+AiiqIT9PsJnAyPB5JRblgbOJNjAk2oiwwciKqhvWA0MkLOsbdd9l/Ow0UpnQ8F6xAryNVrl2Hg2i60BTN/moh0pdju8pHDj5GMASxdbobt9lOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783334219; c=relaxed/simple;
	bh=9ckmCu1Il8WQdocyIBxkKHcp77UlWwWP4JDoN3Kai7A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MobYmTBWIdnfFu2Y+ZKmr+q8QVIsH+SeZERgq/OjBRPKLMWtWibFnuJjA5DgcWz0Xa1r0b65mfV59m4FQViwh0gapoL1UDwEFwXfMmljCY08S3aZGqm18kdomvjjRzSsHtdNsLZvFx+rc1VGjt3XLnxTgfNxxGnosj0vwKP5tNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghoFoJ8A; arc=none smtp.client-ip=209.85.214.179
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso13299435ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334217; x=1783939017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCUD/t3t6txCOG6dVFtbTiB8OrVr/aFPI7SiRKEp8Ok=;
        b=ghoFoJ8Ar0wasqM0QBPiFjR3hJ5PIZZ9+7nAtGEwtric701JW+5TD4P8glVvuQ6CDA
         aPE8TF+FX7IGWpIiW8o4yp4ilkx58hdqz/faPlKV9dn1Rfw7sRWDcQZW15dgg1Mj3E2O
         zybG9t2wbZriElJHMgKnfbexoufir6EUKoP8/eHMleNkZjajtyiBIvynxZr0ZxcOsLZc
         sPcFxGM5o9Dwo/TZP2FvyjyreK7zlxOJffCHs0BNAFTDvt9VAoYlDAaa7FkKte17E7kO
         FzUCV5e1uexndUGyAY5JMB7Z3suiSIjz+65FLMAp8yU2QgQIynU3lFz1V5VsaTLCaWOE
         N3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334217; x=1783939017;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCUD/t3t6txCOG6dVFtbTiB8OrVr/aFPI7SiRKEp8Ok=;
        b=sYe01HnitFehatKiwFkzNDyYTilvwLownu4961sir0GTPQkh2BD9eu+djrb0ibbScV
         IGae6rDoduli1h0IAl8FeREfVmDhuKM4/ikWwAernkCPvtTVPf6viNoNBu4s32OtrRPo
         zZa/biVaLNWZQU+yAcRLnbA5wA/F6A6QW94iAi8YzcaSdfnf9MGOJXdiWizxpL1a1Ff1
         m9gnAd+tBGdzN20eeAXUbONe9Gta8+dcx/wsaYtOUa1mDO9WB4XNRqPtcYCnUVO2JO3y
         TWf2BazKIQhKV653MRjIgEZ9R5UumcNsAOVRiOcQlt+F5mVsQKQCuMt/Kck3txkn9kL/
         rLNg==
X-Forwarded-Encrypted: i=1; AHgh+RrG9g6W/80aIHUy5WLOhCFB42Il1yNDmt6pUN+rCZKTrBAXoNtOgtdftJQDqgBDLzj0oLe92N1IdD9E@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+FX4whvNoM7F2JSF8gJpGvnhHdpcecL7WcRYiMYoEdtEaPbB
	SONXxQTk1QqjiwjEVknL9Y3u+qvXpP06vtyU3Xiap/IjN9hkviE8fKxp
X-Gm-Gg: AfdE7cmCuczQvpe+OY6LHaSNyf3aTRLvNdcHrDINUhx6j1yk8AHQTAixBDkHhntKr0z
	Cusq5KWZyNkCProsnCzT6B+u9yoAIz1G9HhJvIAmAA9wPUEODD6fy9fBk9IqROCMoyCKxHtTbkx
	noiEKIxlOy8EmVdVqYaSvWG0kvCxwk7jXPd22TgCXu6FjW3ha16HIsxUvIq/+PQIaqCekI8ZatZ
	eLmRV5B506RVXF0waVRsNmjIIBX2QyLopLXCNu+4iQYOR3rxmGuWMYWFoctZiQDcnP0MLcxpHdG
	Eh4xLhPNoeRL6Nmbl9I9c67w7uoWagfmJDv/T5/Zsdx9nl4TVoaUNVNuvkF1CbwqqnkGj/UPWTe
	aAkwBdFd0zYoi2/xxdeUQ9873LexYP5DycjuGQw5/9KazXWRTb8398qlgnqroQM3/WCCCecQqJn
	gARWftGrirvg==
X-Received: by 2002:a17:903:1aae:b0:2c9:854c:a45c with SMTP id d9443c01a7336-2cbb9ee5558mr94098595ad.34.1783334217205;
        Mon, 06 Jul 2026 03:36:57 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cb3f5b7090sm36802845ad.26.2026.07.06.03.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:36:56 -0700 (PDT)
From: Gary Wang <is0124@gmail.com>
Subject: [PATCH v4 0/2] upboard pinctrl support for device id INTC1055
Date: Mon, 06 Jul 2026 18:36:33 +0800
Message-Id: <20260706-upboard-pinctrl-add-upboard-intc1055-support-v4-0-cedce0802d3d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGFS2oC/5XPywrCMBCF4VeRrI3MJL3pyvcQF7lpB9omJLUo0
 nc3iqi46/LM4vuZO0sukktst7qz6CZK5Ic8ivWKmVYNZ8fJ5s0EiAoq2PJL0F5FywMNZowdV9Z
 +bjSMBqEsebqE4OPItUXboETUtWKZDNGd6PrKHY55t5RGH2+v+oTP6zuEsCw0IQfeYFNaobQ+a
 dyfe0XdxviePUOT+MXFQlxkvMD8hSgr0xTwj8svXsNSXGbcVdoqCVJssfjF53l+AEjlWhKiAQA
 A
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Wang <is0124@gmail.com>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39509-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[aaeon.eu,aaeon.com.tw,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linusw@kernel.org,m:thomas.richard@bootlin.com,m:danielecleri@aaeon.eu,m:junyinglai@aaeon.com.tw,m:louischen@aaeon.com.tw,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:is0124@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[is0124@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AB5170F427

Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
Add support "UP Xtreme i12" board.

The pinctrl-upboard is provide additional driving power & pin mux function
through native SOC pins->FPGA/CPLD->hat pins for flexable board level
applications. it's probe from ACPI device id AANT0F01 & AANT0F04.

Signed-off-by: Gary Wang <is0124@gmail.com>
---
Changes in v4:
- Update commit author name.
- Fixes respective tags.
- Fixes the indentation and wrapping in commit message.
- Link to v3: https://lore.kernel.org/r/20260702-upboard-pinctrl-add-upboard-intc1055-support-v3-0-e6bda3032914@gmail.com

Changes in v3:
- Correction pwm & uart pin mode in INTC1055.
- Remove unsupport up boards.
- Update cover letter.
- Link to v2: https://lore.kernel.org/r/20260612-upboard-pinctrl-add-upboard-intc1055-support-v2-0-4111b256c840@gmail.com

Changes in v2:
- Add brief introduction pinctrl-upboard architecture in cover content.
- Add more detail explaining for pinctrl-tigerlake commit message.
- Link to v1: https://lore.kernel.org/r/20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com

---
Gary Wang (2):
      pinctrl: tigerlake: add some pin groups and functions for INTC1055
      pinctrl: upboard: add device id INTC1055 based UP boards support

 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 +++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-upboard.c         | 21 ++++++++++++++++++++
 2 files changed, 53 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260609-upboard-pinctrl-add-upboard-intc1055-support-bd1d81311b7a

Best regards,
-- 
Gary Wang <is0124@gmail.com>


