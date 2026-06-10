Return-Path: <linux-gpio+bounces-38232-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r87PAhksKWrHRwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38232-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:19:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62344667C04
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 11:19:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="WPUb/pAo";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38232-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38232-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2D91349AE70
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 09:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD553BA222;
	Wed, 10 Jun 2026 09:00:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69C3B8130
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 09:00:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082017; cv=none; b=NBGO9Um0WPG7yevurz5x3luzgm+cszpu4doX46wV2hjXC0oxKqhDjHya0e8ELsSXmeCVj0ylVnfSsnAbG1DD4v5/VgBb34bkUWh/tOaPh96Q8vwRnzWvlnfEkg3aHvhZnXT+U7kMG5niiueuUFksfeL8sqQ+jwSOIeNgcTXELhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082017; c=relaxed/simple;
	bh=adQkjTCUBge0DN12BPGBfTK4j8DDnGyAmmaTSzwM/88=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mzx82OABlX3UGHCfbtCBZMrkYWQC2E26m9gy26S6TZfE9VMXlqDgJtgo0iTRVCO78aLkYT8lnT7kmD1XYci3kwgjFTXdmMhCzftJXAtZbNsTWs4dxDxL41t96NVxHuoQHVUQ75cO2gY1kyPuYwRUYLbVx1dkGTd8iS4BC3vDrO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPUb/pAo; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso6442399a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781082016; x=1781686816; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YxCGCjO5J65KQbrEt8Fhh13O8MG6osQvSprxzap97q0=;
        b=WPUb/pAo+7Tw798jA1iz3sXgQQXd6o0hOLlv4oyro9XYYC7QDSJ6XZOEzEpyvciwL5
         DsxTlPdrCZVRr+Z4ycSXjcH3cNyWl66cxw5R3MdQ8x0HrOzQWlO3UKin3x8NWeDdfGwD
         PW9WL4jLZ56AdLkCk831cmRiFbVDGCyG8r2DauDX3UQK/9uwRIF8uQ7Jnq3xKRbzrmo2
         +vjj7+ZQd7Uczc0yT94a00Jx4VMz97vUlazzeRaLySrLNcENhdw/gKrMHJezF9bHWzZl
         Bv+143uGoh9bjHxSyTKwmYkHYwPBYMK3yfFXA7E3AiRVPJkVsqiSTLjC4Uh/WYzexfDB
         2i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082016; x=1781686816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxCGCjO5J65KQbrEt8Fhh13O8MG6osQvSprxzap97q0=;
        b=PkCfbbHc47UmCyulV/Dd7pvLIYHrI+oVRI5/HuE1nrIEWo1k5pHz1oMQD9bb2/pJHm
         h/3qFKcH/00aHGMzdODvd3Ag9cpdO/Ak2cPIkQEvBTZ03zB2jGxQzoN6RuIQquFOo8SY
         kUhLkLc1SmnaUQwkw+x9+ZldFKX7qLIeVUDgLuqhGpFd+ee+6YuJLUH+SWI5yumnb4aA
         4BDSvpmxjGsmAyrmPfSBGJu+pY3o9ZA8VQdVPXY4gaCwk0ZtKUwNVp/bb/LDbmnV6pLl
         tssfEjwf3KaUO+aU3bRKoVKPPlNKG5VrmHBdiEWTOWbfYdnw7+43Azfg026quDHCBr9M
         zxbA==
X-Forwarded-Encrypted: i=1; AFNElJ/kULY5jQEIhPHnwQo+vU2rEvO+v1fFT8ovQpplPBVc9y2HMMyhy3O48ub2GuWGtF+E8W9PcKuMQNvt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxul7Ajbwb0K7HtnlSZnWWy74nfHbojv9bzCjv/ubNCzckmjKNI
	51QtpMXdTuZm8T6oRmwq1A3oDK40KoDEecEIOy+t4YU3xxU7w89ETtUT
X-Gm-Gg: Acq92OFPDOFRXgStgm4GDHgzoRydHUpEm718SulfdXIAPpbhE3rg3TCbgP6ASHdqJFk
	JJ+z/Vib5x4R9Ynse5ThTqOR39eM5YrIbuom7jd7PdFxyYVir4yoQ7RTXqSoMyr6XAzNj3Ch3Q+
	ZzqgHzErVIg6V1O5UnhlKqUknlus5erFCHQchFxQQwZce+GRzOg6vx4lhlA/bgWk0Q6+p6fVh8k
	CjMtrGkryigZGph9LEnu5LmoJpRq9cXgZCd6GQ6qi06rvsasLaL07lBUuyeDPcF7Mx3UL2QMcrB
	lDXLeIiQrrQXGB5xuCxZPvjx+Aec35lL/M1ue0+PAGYQTdPQqoI4VveHV/n7n1Uthe5B6FNrhUz
	hGKqVjj6SJUQLk5Jjt6gUntthoJlKdW0/ctyw96bJCwpji7ZAm52YlQIyXASTi6HxNiQAjdjkk9
	F+Ym9AA2PLv3qwgG0Jn73LfMiLvWZKmKM=
X-Received: by 2002:a17:90b:4b0f:b0:366:1172:597e with SMTP id 98e67ed59e1d1-370ef2efae9mr26079598a91.9.1781082015523;
        Wed, 10 Jun 2026 02:00:15 -0700 (PDT)
Received: from [127.0.1.1] ([150.117.174.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376465ca306sm1308995a91.2.2026.06.10.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:00:15 -0700 (PDT)
From: GaryWang <is0124@gmail.com>
Subject: [PATCH 0/2] upboard pinctrl support for device id INTC1055
Date: Wed, 10 Jun 2026 16:34:22 +0800
Message-Id: <20260610-upboard-pinctrl-add-upboard-intc1055-support-v1-0-8185d2abbfb1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI4hKWoC/z2NywrCMBAAf6Xs2YVspfXxK9JDko26IMmySUUo/
 XeDB48zh5kNajJJFa7DBpbeUqXkDnQYID59fiQU7gyjG2c3uwuuGoo3RpUcm73QM/+d5BbJTRP
 WVbVYw8DEZzoShZOHnlRLd/n8drdl379aR1+bfgAAAA==
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Daniele Cleri <danielecleri@aaeon.eu>, 
 JunYingLai <junyinglai@aaeon.com.tw>, Louis Chen <louischen@aaeon.com.tw>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 GaryWang <is0124@gmail.com>
X-Mailer: b4 0.13.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38232-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62344667C04

Add missing groups and functions in Tigerlake's pinctrl driver for INTC1055.
Add support "UP Xtreme i12", "UP Squared Pro 7000", "UP Squared i12", "UP 7000" boards.

Signed-off-by: GaryWang <is0124@gmail.com>
---
GaryWang (2):
      pinctrl: tigerlake: add some pin groups and functions for INTC1055
      pinctrl: upboard: add device id INTC1055 based UP boards support

 drivers/pinctrl/intel/pinctrl-tigerlake.c | 32 ++++++++++++++++++++++
 drivers/pinctrl/pinctrl-upboard.c         | 45 +++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260609-upboard-pinctrl-add-upboard-intc1055-support-bd1d81311b7a

Best regards,
-- 
GaryWang <is0124@gmail.com>


