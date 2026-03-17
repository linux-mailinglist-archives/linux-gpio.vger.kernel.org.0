Return-Path: <linux-gpio+bounces-33606-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCpHBf8quWmVtQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33606-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:20:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5B2A7C15
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 11:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49CDE305DA44
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 10:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC21C3A3E9F;
	Tue, 17 Mar 2026 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt8f7Jel"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FA039F184
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773742593; cv=none; b=NVoVHw1KUrJStZbqXQHqylwhh5Rp3qYKVTcyrj1RiFR6DCc6eC4lox5FRC0O8z6CmwWEl7tMYCWSdeQvXwC66q0wO5AHmCj+NMhWSWZklu/Y3koxhC3fB5vJTFwAX9opEH4gQRPoo9mrFmJU/emMcaV1uiYH5Tc0ljxsBLnVpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773742593; c=relaxed/simple;
	bh=ABn9Ni57R0ZkpGLX2ZIwE8vOk53v0f5Zak751TrF5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YC+RCLUx6PSW0dTPz7dotxCUUbtL7m7Q9kCft8NoqYKZXriJaZPdnFexQgL98/jIAaEnMuMs2gUmmYAJJOrlTo92Bj7c/vIiWbct1OSAkKw85VRUSTI6U0N0z2v9Ga11Q5CjcU/frlU9lcQtkDtox58w2dP4vQvnuFIDQmyPG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt8f7Jel; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so45575385e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773742590; x=1774347390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxpIVyCSKVrX2DiLGUQhb5TMOZpG4m6V2TbsqVVpj04=;
        b=Bt8f7JeljAb+cWcPNtxImOJ9/dmJjqgIF5JVMEXx+dz3VU7/h4oPprOGZXEzB6nWtN
         IhnCIrTVELTYstyYJRzJAuSoW2wEqDgj4TG8ME9fzK8EcCPm6OmW2j/O9EXviRkm+bPB
         MG83lytosBI6+mZuqR+oXHBI0hVMjTqfoYtI0n3qhNixxMhSgKYvY+tfP1FWWaN3/D7N
         xHPLgBp4NMoOYpA+TB1ohksEwc6zQA0/ayJq84ce2KuSuZyCL9UTAZEWrTQza0C/LErD
         EuQAUeo7ZRSiN+//luaux8Y4pu49fgHZM5yevQziRCdM9soFZCcBIWgoozBnY0D4taMA
         l4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773742590; x=1774347390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxpIVyCSKVrX2DiLGUQhb5TMOZpG4m6V2TbsqVVpj04=;
        b=bXJaXxbD6hQJxJl81s/JWj+QmArz+TcvWyXDowgHVSgR2MeIcSiuYlXukFk4bvgxTI
         KT34EYrrvjbk7sFmlvGnugQdeb1+yglsdsQ0Q1dbqV1isqtDIHXfGqKVNByL/vpUWf8D
         p5PuXp/Trw354Wqp23Rqy9ngbPzFNqBbmje4Dje+UEskQrGA5inhVijvnN6JRtteAYwL
         1rJANX5g0l8sCA3aflz+Z7PAEUFKNylipNXSLzwa5XJgGlro9zN0Yksvh9eFC5T8aGPV
         rLkOWwHWcOvLsZzwXj3i7kjRjb+foKWcmalqU6uVUysxN25M3jkT4dBkfGwQMTJycrLJ
         2g+g==
X-Forwarded-Encrypted: i=1; AJvYcCX6AjWzLDE0y1u6mU/SoWzb5c2CjHusgdHgnNzB073rM645te0duP0P4vIFMLBFxDXrllNB3uTEUHzQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5PgIqfeTz5Z8Zu8GPSoBUMWgSkEuy+ZDfULh7KFlKNoeiV9S3
	kccZcmQQtT4djB2GBP38aTrpNXYF/wSDzm5B990oHiL8c5xJrfzpGf7h9Z5MXw==
X-Gm-Gg: ATEYQzzHpxxH8nDqMiBnAipERfe/pmgy58HezUFqGnvy9uyUEw9oaNXD8M9phuyfHKY
	89KHpBMfse7q7/D2lN5Z6dFjO0vKs+a7aDR5yC2B8Ht9mgzPDDxW/v0ZLvpo9EMmXoybBiey9JX
	DdggL4qGwYFsUKTrTLK5bUTxVCMkd6nzw641leTrTnRXLkoHxGS08WBAodTt5bY1c5p6NOYk3rx
	Um26byXpX0za1BYdCveZ+LM947BU7fnuuBiSEX28cFh40QgLVwSULgdyqCQy9r+0k75LPDskJEI
	wIDKYl6wua5pWr7jHSa7g7n8ZILViBYxXq68RhGKzxQeUSEa3q79bmWzRGWz+bX0EfYdEcqFVy4
	Xrtkk/Bz7DDvIj2QwLgcbQJj+z298WplfMR4bNMv6MldMDNkAW6Fuj/cU7gbjDj6dkQD32HQdjX
	D4PBhDu5p8VE3cw9t9r52GP+vvlwugKQeap/hX55/34jEbR6YMrCKxfuovmaU=
X-Received: by 2002:a05:600c:a15:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-48556710fd5mr284691515e9.33.1773742590244;
        Tue, 17 Mar 2026 03:16:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaee510sm53903275e9.14.2026.03.17.03.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:16:29 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/8] Add Renesas RZ/G3L PINCONTROL support
Date: Tue, 17 Mar 2026 10:16:13 +0000
Message-ID: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33606-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B4D5B2A7C15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pin-control support for the Renesas
RZ/G3L SoC. The RZ/G3L pinctrl has an OTHER_POC register compared to other
SoCs for setting the IO domain voltage for AWO, ISO, and WDT.

Document the bindings for the RZ/G3L SoC and add pinctrl definitions in
the driver. Some IPs need to set the register IPCONT_SEL_CLONECH in SYSC
to control the clone channel of the IP. Document the reset-names, as all
SoCs have multiple resets.

v2->v3:
 * Dropped clk, pincontrol device node and pincontrol support for SCIF0
   and GBETH nodes from this series. Will add this later.
 * Documented renesas,clonech property for controlling clone channel
   control register located on SYSC IP block on RZ/G3L SoC.
 * Retained the tag as it is similar change for RZ/G3E thermal bindings.
 * Updated r9a08g046_gpio_configs[] by replacing the typo AWO->ISO.
 * Added PIN_CFG_PUPD to RZG3L_MPXED_ETH_PIN_FUNCS macro
 * Replaced RZG2L_MPXED_COMMON_PIN_FUNCS->RZG3L_MPXED_PIN_FUNCS in 
   RZG3L_MPXED_PIN_FUNCS_POC macro for setting power source for pins.
 * Added clone channel control support in the driver
v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems in bindings
 * Collected the tag

Biju Das (8):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  pinctrl: renesas: rzg2l: Simplify rzg2l_pinctrl_set_mux()
  pinctrl: renesas: rzg2l: Add support for clone channel control

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  35 ++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 514 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  39 ++
 10 files changed, 588 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0


