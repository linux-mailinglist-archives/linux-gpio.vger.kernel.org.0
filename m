Return-Path: <linux-gpio+bounces-39548-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tDgUEARvTGrakQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39548-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:14:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D69716F6F
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 05:14:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bhlQGpg3;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39548-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39548-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 130D83023A50
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 03:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CD73803D2;
	Tue,  7 Jul 2026 03:14:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0E3093DB
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 03:14:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394047; cv=none; b=kcQDMvB/PTq+2+lzl1Mcv1CoaQ+Zdx7Ua0B+iEcAxJDWcPFiIzCpBnDXTnx5BmXOykJkPpNaHA/mWDm74TqeE0ZAA7XxLJlhKPStZDDFm8qFXrQXH+t9T7UC/StyMnvHidWWGu4PrOSdGk5fZxVxRYFLHWQjA4gVnofcanX1bxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394047; c=relaxed/simple;
	bh=n2/nKFygs+4Z+p5617bemBXSFbdENuHbHfewNN2PB6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FOtADL+2xRQBV9CHWRNVkfTPr7UlC7ftpyONNBE7r2Gx4008vvv2j3U0qbrvEj1KG2gtm0Tma1wMXIYTBHbUQkqfRTMVKvI/6jNa/LSYtUug4e3CyHShZMkxTFdRtD95/M9SXF8rBec2o1H3yvdeZxe9nCqryppb/e+oFsypohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhlQGpg3; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-847921eed4aso5045948b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2026 20:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783394045; x=1783998845; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+fjWa++UBimAMIMqNtyKD1hu2ij4ym5qJ6xUR6av8M8=;
        b=bhlQGpg3SFuVt46dOr+0xVb4eIPfo6zBSGEBlIywqp5A6HBxqGSJSbM0zWh6iMbkEH
         dcSBwbW+WMpF0wyxAjagt6lgVPlzaMJ9m9kTj0i1/9B+h4YxgP6nhu+UTsInrBaruG5H
         DN0rjOxCZ9CQwotrQid5748fM521tSt7bTxb1WB+4OGXgKfJMxd8FQcBAcJoWNCghOZo
         W9BrR7WhxXPakIClApWccxBg7TS8e6zVfD67m5vO5i/Nfk5YrCO+LggDisloXLoGjzee
         F476HWdZbN2Hth3E0ZfsXG/l6pa3eeebkL4KmYup49eAZBFBlqPEHB1fL4eVoEOpbQAw
         /6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783394045; x=1783998845;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+fjWa++UBimAMIMqNtyKD1hu2ij4ym5qJ6xUR6av8M8=;
        b=W4D1qoK0Ba1U1GYvdxpx8BsFgPmWVBn0Z06rAi1dIWW4eSYxf98XomQCCqS0jZcwrs
         pcEiriiqgOmIHdLdijUuZUG7s7w6PV8bEWAocG8lMqKJTi9AeDv0QpopE8c4yZZ4e2es
         wFE7RyOMntQRppDav4AATDWoJSk7oSoEBcYFYnkA5v6m+5tCOSEK4RuS2PbRuXmYK7op
         cTRGUtt71NciWSYxW4FWK05VKWp7DyqyOmBUneB7GHNriMfPfScveD9v6dIGjqU7pbr3
         drcKxSjAL7R1cvYR6EmKylsVyH5gIhyySFqPQmEG5D3oKuwBdhsUdLQhyTkOUVA7jzik
         RTug==
X-Forwarded-Encrypted: i=1; AHgh+RrKQClk2GqYmiReRmsnBcRl9BTJmXMH4ILDg2KbroHQATbTJoTfp+rFt62D7S87b39rrNXWmfO5eTY/@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+3RVmd8XBRdhTFX2uc0MeXov5MpTP54WuO9QjPVyRy8rMXs/
	dnRzzoYhRCPAyy9rQfP3xmwI7dnkgXsw818YkLantjZHPL9/xuqF0H5S
X-Gm-Gg: AfdE7clcfDvu6l6gGRM3SybDAAhDDxaw5jd/EgMpmEWfYkN/PbLQt3RWNV4pfp6q0lh
	I57vSYYhmp6HiS/+yhocXzbO7gd80PlEGTw1yd+YAmNlM8eKHRLjoLU9qbEg5VzXJK+eQ7GdOkJ
	nMkN0c4Ei1O9+83tolqwGJNEI50AbthO1NuPsnyYsUlj9f05xhRnPX1QV1Y/3AbXzKjjeZpzq79
	b4NDK9mm+AxZ8SbShDK5GW5o9LmLPOCMHzSoiGia4JK0R2Z3FiLXA3f+yylI+UBYJsW6dxsyDq1
	QJidbDbQayIKbNJ5bMdb+S7BEidpIIRQnNYIyltS2+zZgcI4X+aPPqhTKB5GLvWBuA11IH83saX
	KZvvdtevwOREMjvFvQzBKmi7EfD70f/y5n2iBfaLHLRBN4rCMUO0qR1YbzH7N5uzxaSGQvhYfy7
	3lN5ZgIsfxqLUFFLopkhlnNgAN0dyEWFANAb6BwCFdxxk3T5FCCHaVf8wGwUF5LUy/taYixasqe
	4pA9uLmHJoUDDE=
X-Received: by 2002:a05:6a21:3294:b0:3bf:6c08:2849 with SMTP id adf61e73a8af0-3c08ef2d446mr4097835637.56.1783394045522;
        Mon, 06 Jul 2026 20:14:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d89b:1fdd:a8f2:dbeb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm3339905c88.7.2026.07.06.20.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:14:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/4] ARM: sa1100: convert gpio-keys to software nodes
Date: Mon, 06 Jul 2026 20:13:59 -0700
Message-Id: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPduTGoC/yXMOw6DMBBF0a2gqbE0dhQQ2UqUwoYHDIWJPOEjI
 fYeJ5SnuPcgRRIoPYqDElZRmWOGLQtqRx8HGOmyybGruOa7UW8ts9Etzh2Md0BAU98QAuXmndD
 L/v89X5d1CRPaz29C5/kFSAKU23EAAAA=
X-Change-ID: 20260705-sa1100-swnode-a2eebe973ebb
To: Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39548-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:linux@armlinux.org.uk,m:linusw@kernel.org,m:brgl@kernel.org,m:soc@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93D69716F6F

This patch series converts StrongARM SA-1100 evaluation and handheld
boards (Assabet, Collie, and HP iPAQ H3xxx) from legacy platform data
(struct gpio_keys_platform_data) to static software nodes and device
properties.

The first patch registers a shared software node for the SA-1100 SoC
GPIO controller in drivers/gpio/gpio-sa1100.c, attaching its firmware
node directly to the GPIO chip prior to registration. The subsequent
patches convert the board setup files to define static software nodes
referencing the SoC GPIO controller directly, allowing pin bindings to
be resolved via the attached firmware node without relying on name
matching.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (4):
      gpio: sa1100: register software node for GPIO controller
      ARM: sa1100: assabet: convert gpio-keys to use software nodes
      ARM: sa1100: collie: convert gpio-keys to use software nodes
      ARM: sa1100: h3xxx: convert gpio-keys to use software nodes

 arch/arm/mach-sa1100/assabet.c | 75 ++++++++++++++++++++++++++++--------------
 arch/arm/mach-sa1100/collie.c  | 74 +++++++++++++++++++++++++----------------
 arch/arm/mach-sa1100/generic.h |  3 ++
 arch/arm/mach-sa1100/h3xxx.c   | 69 +++++++++++++++++++++++---------------
 drivers/gpio/gpio-sa1100.c     | 10 +++++-
 5 files changed, 150 insertions(+), 81 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260705-sa1100-swnode-a2eebe973ebb

Thanks.

-- 
Dmitry


