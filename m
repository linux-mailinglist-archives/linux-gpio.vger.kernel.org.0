Return-Path: <linux-gpio+bounces-31289-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKuJKNE/e2mNCwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31289-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:09:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C77AF6B8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBAA1304FC18
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649663859DE;
	Thu, 29 Jan 2026 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOPodC7X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7613859CF
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684596; cv=none; b=uscOP/LuU6BpgUgsUjHq4hBHAdOYFiSHlS/nIlRE80ijDsCR+AKo3AL9Pl/rWGGVJAMeyoS8yS3iCE1opahI7L1XmMyDq4JtW/4jABwTA5XJ+9Ascx9x2abMbJS9dihhEHh8QGqfRca+KA9F8MUnzb/J1kTdHyiEYPqHyLpvRys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684596; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OgUWnE/+lbPw+1Jwi9ogVVUbrrME+9VTnD0hZcYortCaHQoy4vLeFjRRC0+xjQ2kSLSoVnh77JgJIHSzYLB4EjkgOdKdjPmQgWHHFAfMeGufU4OYLgAMPUFTtzJWSewvQkzjsOCqLVVdCO0QkdPmYobKv6LXqP5ghPhtIitrDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOPodC7X; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8845cb5862so128589466b.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769684593; x=1770289393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=HOPodC7Xh6Ypj2husmTq28fz1USKNuAJdblqivI9SBsPbBE9ExgaBjVh00N85Ydwqs
         6SqfHjVdsUqLjJB330j3wexWl7SAWq8rdO9Gdxjp5MNL4h43TBDWRmoKPjz9Pjxz8Zsb
         pnQvxWZ0x7wHFEhbM2rDw5ibTAV2uN9mStBnrOgEArKJNgEzujVS2qvFPoWr3ugFM8Xj
         /MCHNlE1HFUT6xAlhOKe9m8LJeHlVyscC3MypHGG17x9NXmnvvyjmZP2ioMTxjB4BPr/
         3fGpJohjiGUCLa4CydC/O6CRci/N1hm1Kh7ufILgwcin8y4k5m46hGc2IE3UzIh6so7w
         u97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684593; x=1770289393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=Pl/q2CfE28M8VWZiPUhgfwXKqonpAa8/z4Wlagr1W7CfeWL38alI8+e7A83gwOwbM0
         y8MW+zMtO5Gl3Xwt4w50Clg6Vq2Mvfhg/YmzzKnZNdWZZSC016YQUIOZZH4uh873yC9+
         HGLGKYE3LnNIdEun9Wv4XZBoQp10mLhbYKEnWtRQjf/uSFV06pTu5lPHbF4fYP3/Xhtl
         pOwVwF6+7aAMcN7tSUuOdilIKuDi2hUmW4yF6oQqO3OHjYBQavjQIMZNjhMlArr/cELQ
         t1DVZVSVDgU1U+C7lU0/NOmPN8yEn7CCQhhJLqaw5ECUgkbml0PY1gdK+0324rZteXhf
         auKA==
X-Forwarded-Encrypted: i=1; AJvYcCVrWqbt3SCTPaPSakGX2yAS6wB5C5lRTD5xehIlVuvdShIX0sGINl6pZFbKLCNJsJlDwJvY8pUdaxhS@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzBdDBSlRJAbinoPKGikx1+3dXKpMZEOKwij1yb9/f3aZDKYK
	Cm+AbYmm9H2De1OHj/gXGmXO3M2cgRmq8zya9jXYjdLr093Db3GI4Qdgdyosdg==
X-Gm-Gg: AZuq6aL8iHICxat6FRuTMJXYxi4d2JvzejW5wTjnHgCozq4yb3MvnuNziAapCejmjtd
	PDQ2af5X7tOnLM3zMavi4kESXKol8du16CP0AOaPnsK5h7OxUeHjHZWTambjQA1G4ObLWvMIiGr
	kaou6RoA/y+D4HPMLv8ormHpIJ5SCIrQ1YZdxKEfQ6B+w8vczyjM2RnRypqVtGTmXj6hEBMmmZn
	rLq90M/Gp4YfyomxaNwlvnOzVjkmQMnJB+4pjxDIzUz8OWwdNLbdBg5Phnf5iAvzvXZalITymhA
	w9mgSGsBkyszCs0E46a8Y4ekiu43n03Y6ti4QKu0Nd4yQ0upZEi3ant6VKyFQvkawtsE5DKANpE
	DVVDGwuOngq0d+7tlUBZnUkmN0pVCWqZKGNileIbfsKRBOtkP6YiZ3+SJqedUNYHQmrXTyAC5OF
	Y3oIAFy+FXCUsheoW3
X-Received: by 2002:a05:600c:8b61:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-48069babf02mr104749815e9.0.1769678490897;
        Thu, 29 Jan 2026 01:21:30 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf16sm13999753f8f.22.2026.01.29.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:21:30 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/9] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 29 Jan 2026 09:21:24 +0000
Message-ID: <20260129092127.95378-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31289-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,baylibre.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 24C77AF6B8
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pincontrol support for RZ/G3L SoC. The
RZ/G3L pinctrl has OTHER_POC register compared to other SoCs for setting
IO domain volage for AWO, ISO and WDT.

Document the reset-names as all SOCs has multiple resets.

Document the bindings for RZ/G3L SOC and add pinctrl definitions in
driver.

Add pincontrol device node and add pincontrol support for SCIF0 and GBETH
nodes.

Note:
Some IPs needs to set the register IPCONT_SEL_CLONECH in SYSC to control
the clone channel of the IP. Plan to add clone channel control support
later. The IP's involing clone channel needs to do the setup as per the
below flow

(1) Set SYS_IPCONT_SEL_CLONECH register as necessary
(2) Set the PWPR register to allow writing to the PFC_m register.
    After setting the PWPR.B0WI bit to “0” (initial value = 1), 
    set the PWPR.PFCWE bit to “1” (initial value = 0).
    Select the required function from Functions 0-15.
    (Hereafter, Function1 setting example)
(3) Set PFC_m = 0001b and switch to Function1.
(4) Set the PMC_m register to “1” (initial value = 0).
(5) Set the PFC_m register to write-protected. After setting
    the PWPR.PFCWE bit to “0”, set the PWPR.B0WI bit to “1”.

The clock and dtsi/dts patches depend upon [1]
[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (9):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  arm64: dts: renesas: r9a08g046: Add pincontrol node
  arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  16 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  10 +
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  13 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  92 ++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |   6 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 285 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  39 +++
 14 files changed, 465 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0


