Return-Path: <linux-gpio+bounces-38820-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yidSBednOWqFrwcAu9opvQ
	(envelope-from <linux-gpio+bounces-38820-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 18:50:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 829446B1447
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 18:50:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QaPwKAS1;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38820-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38820-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60FC03031B68
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 16:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1B533D4F8;
	Mon, 22 Jun 2026 16:48:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA5E310779
	for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 16:48:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146906; cv=none; b=TmiwR3lqtRaV4TXv7+R08W/D0ehCM+1zeTqbIu8pG8M7ZqSLLJdNGcslDoSDhHpsA2W/KnNk3691LPpvyWdgw+zzvXhs2vYk5dpZQHfcnDHrX4sOFjOyZtc7i1rp653JtfPYFyb6WCywqflaFzIbcaL49tq+vAjcM4DEDIs6yO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146906; c=relaxed/simple;
	bh=nPl4d20ypHqRDJbFSq6hvNUyePGiVLKN2Be7HpMX6HI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ze2L4MlQh6EM+iyBH2A/Ex+pXfLKc4RKf4vRWo68Qj+UjUVxGVhkHyKcyeZ99O68JE8gR8zcwQpNFQ+DRv+bvOO5gko3Ib7x6cpFPS1cLqiKszlWe1LR2u+Ppo0NnBQ/iregs62RWZyJ8C6KrwSjzVeJhAjJhd98qP+/x64pubM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaPwKAS1; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49222fb062bso49140155e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Jun 2026 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782146903; x=1782751703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqoLcS7itfev/Efa5/B6w/5mWvavLBCsHyG9p4Lb/70=;
        b=QaPwKAS1cL08WJltSvhB8ga9uKDyysheeedZdLy2B7NOeKx8MVhA6iUkgB7IQ3Ykgn
         4Z7MxtmWnz/BC5OcBk6QgB/+lXlUZ9o8YQ6DryS3+P/wlZNuFb7ab8ix/uE3P+6SEuTp
         3Y8qjLo2tE55batdH9vCAgvMoVousxHrrGFtCyliCSjkIjsaILkMsY/NCA+FW/kON3DJ
         VEGLGleS0NFBiLebuaRs3XfFthd7i2s/wdF88PPyakft3qfKGxKAjk9cCGFpagjW0cIz
         sD5ac+T4MmcfMJIuh+EWjjl9ZP1p/XvpiPCupOKhLDzVfiW1zpmgJOSOWfxfZ4T4aKB7
         Zq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782146903; x=1782751703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqoLcS7itfev/Efa5/B6w/5mWvavLBCsHyG9p4Lb/70=;
        b=EvWzKMqgbKXu/KYi+EtVgBtFLQ1OT54FQw4nxfZ3W84rLM3eOHFUgIRHHdwjyOMggl
         RF/csfg5vcLGPxSQNtvRC+pLCFkluO6ukqD7G6yLaj2a0yUPMUh9k62WdgV/1fywVbN+
         mGFOmgo1w+QNb9zPXwG10gIh1b7JKxhh4CICxMt3IdwL7C85HIB8C/LsJQe8wKLKLUqJ
         cISpfsAivKx1wRXWyhqaZmnG1iwHaJeXW7pMKh+oueA6X8aW+J24d+/SL26QPMJC8dnO
         fbDcrbhD/f/wZbql+ggT0jpk9YnvqGqrGF/jJr6J2j2dk/mOsWub8dOwWjY6Rx5ohw8T
         qg8w==
X-Forwarded-Encrypted: i=1; AFNElJ9VVz7LiIoE8naEyzHSvkR3Z12jpi3T8byYK/Kl+jQWVHXzaIbxaJ1HEW4N+WRRveNCeopNtVnls3v9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+YgsSABWSpADmlsCiuE8KdxvQtCnqn+Px+tEvEpA53NL8Z1Q
	IRo7dBFDMewT07Vqx9LDpGe2rDwIJgGbi336HSMZpha+dbyKSWKn/27f
X-Gm-Gg: AfdE7clme/n2I/JHvsbh2Tv+W5/xIoPKcRBvwKSFS4966lo7gL7Rmbiks08X+Ra/qIE
	GgNyFdA1HeNtXwUB+0UUfKmO4YjGtlN3oDH9OuYnVBS3221lrK9CuhjRMcxprnHTPnJZnGsrO8b
	sVoGvVtjXIqaDV6TyTfDcTZEPYGgkCZq7BezyHGkjh+VdTBB5qdZg22Mojx++C68ujPRplWOxzQ
	ZIUzzjI6wOhO8rZfHsptktfAiC3rLHn4V+xVzLb6CGjZnqYdDHgWWDl9LYSkyIzqszWs/C3pLUO
	4VP6/tGFrW/tON+Y/9OJrSKhVmRsiLDpDsrArIyDHxyMp43dittojJXG9cxiweDBIqhUFQog7j0
	6EXNvhpbF5ID4nS8AhmL9i9z6KuQQ6eJI0RBfSMWyG6gphiJ099UKWqhGIsaNK5+6JoW1qGEuwv
	34HgUr92oUAr2cafytJbpt
X-Received: by 2002:a7b:cb56:0:b0:490:b65f:8b1 with SMTP id 5b1f17b1804b1-49240e22ed1mr166874405e9.5.1782146902628;
        Mon, 22 Jun 2026 09:48:22 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f56aasm27433872f8f.6.2026.06.22.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:48:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v18 0/4] Add SDHI support for RZ/G3L SoC
Date: Mon, 22 Jun 2026 17:48:10 +0100
Message-ID: <20260622164819.184674-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38820-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:linusw@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 829446B1447

From: Biju Das <biju.das.jz@bp.renesas.com>

This series adds pin control and device tree support for the three
SDHI (SD/MMC host interface) controllers on the Renesas RZ/G3L SoC
(r9a08g046), and enables them on the RZ/G3L SMARC EVK platform.

This patch series depend on [1]
[1] https://lore.kernel.org/all/20260622155610.184271-1-biju.das.jz@bp.renesas.com/

v18:
 * Split from patch series [2]
 * Moved sd_ch2 variable near to sd_ch[].
 
[2] https://lore.kernel.org/all/20260603065731.93243-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  pinctrl: renesas: rzg2l: Add SD channel POC support for RZ/G3L
  arm64: dts: renesas: r9a08g046: Add SDHI nodes for RZ/G3L SoC and
    SDHI1 pincontrol on SMARC EVK
  arm64: dts: renesas: rzg3l-smarc-som: Enable SD/eMMC on SDHI0
  arm64: dts: renesas: rzg3l-smarc-som: Enable SDHI2

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  73 ++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  89 ++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 199 ++++++++++++++++++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  74 ++++---
 4 files changed, 410 insertions(+), 25 deletions(-)

-- 
2.43.0


