Return-Path: <linux-gpio+bounces-31287-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKINLCw9e2mNCgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31287-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:57:48 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60470AF452
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:57:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7D3030059B5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 10:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72B938170F;
	Thu, 29 Jan 2026 10:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leVPLF1w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB233A71B
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769684266; cv=none; b=HtT4ofzleptbTCVGOsd5jTJXGxHH4KRHPBplLz4wG6Nb8snaAvmhawW8Aj7dYIF7iNAdA19m9q6sJvZ7W/ioUoag3uXrwbbKRWKdiH0y7/ymqoQVQFTaVKeLfed9/MQXB3Of9mb5onFKqQR9luz8iUGK/yDUzenVmwLUucj48zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769684266; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QYJjgkiV8tdK/Mt3rQ1/+cNDO7kC6DX8+KQCL6Mo3WdNOf8JHbRM0V2FrZtOvmRvX03NLJsY+VUmSmXxpHRCddfsaqSOsrWY+zhFYknxgzeZ/YsOIcd73nrKLP3Xar6TrzRwwKfv1EwoPbSu6WiI3et2xcTGFbxfH32hQdH8VoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leVPLF1w; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso927239e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769684263; x=1770289063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=leVPLF1w/K9e+0HBeIH5QXv4NHyo8NebbCF02p4hNKoz7HAabRiqpnUZvQn5QlFE0W
         o42X41kyLerm7T5JqYqR+kS/NOj6nHhbqA+OrT1+JDpsSFx4AaZmLU0rqd3tXRgvEq0C
         iY+Zv3LPU2R6uxhFNqRjvR9x3dv7MVh9CAsbJhuHw0QjLx8POWVe1CfZF/oIAaXWrvyH
         ENV+GXzrb99UIr9pnmLn1LSVAPqZJ/6JuO/LQNF49gQrjGJujI+WOwafk57jMFZK7CYa
         jb4Ksi2SM78b1Dk8jfD6W6jRBNo1RHFoJis8H073NMIfOHmFBa1nN0NlpL3U67QH6qb/
         HJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769684263; x=1770289063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=s3Gb/hsEAao3u/Xus1CKwhQNXedHsX+170qJk3cBa2TBMRy8maheh0wVKvulEEWJGE
         Sc+Qqrs+DRIylOCxtqpUJyjc56JYgIizceNLU/8ZFwmBia/VWub9oU4WSpL79laU+hx0
         et+9bIKSbjzRdxYkstVIOmGK8CXsXX18GEjgSckHwTEK9xgVfYQlRVuVmy1WNlJRul9X
         3n7o+mYye5lTUFARXCIM3TMYaf1ZpP9KcCk6S7PRBeEgza0cuaMtT3MVxJY4TPDrvjhK
         Lb11rJ14vPVSZ19/6S80cxDcxJDqR1wpxwAh3clCDWNpt7PEFYOyXaAxNnKYcoBVmCA2
         yvbg==
X-Forwarded-Encrypted: i=1; AJvYcCWZIFRfD5uO5lhaEFqfR3LXtqyq/GV3jrPnlXXsb/Ww1538p3q0XWI71i9JapD9QfELw9B6Myr7Z3Ok@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHsul6KqJRXtPCfK0L2woV5gpfzoJATuy9HQnnXE8ZjSsngU/
	nxhXyMp9iZ3ozYAlUiy8ObK+/XpN5jx0SgqPgTh5wsxP/7Tl3QESjwcf
X-Gm-Gg: AZuq6aKqGXGuTs6phxyjOcFYJY6jcKw6BmuLfoZyxXgBr51NW/3ru56QlVwM334MRKh
	MOkFGygqmbg7obdictl0TJ0gEwN/jbv/mGGWpq9gzcAf9LywCqVKnjrJn4ujRdJuhB28IAUQouw
	7SRuqiCHmqw9u1gI9oZdc2E9KTtQJYngbatubTmfi4ZpXxu3ujlJq5pRCpkptJhKmlmyvB0+V0U
	DRETr9NHZm/fKAxR/ijFuR61POv9ulQRKxyiAktf0YJZc8B/bWfdTFXFakK3U5H2n1eN6jy7Wyk
	proHWfBLEL9b6ILUFJoBXqFbapZ9ppw3x4Ou6R3rH2j5MM9EpcEXXoRsOonwFL6wGA6zcdedMAG
	/CTGjHzobDH0WvdWjPEQVUVvuOz+9K23f+MqTAL/3Wyl5HhQUKkUQt4RHg+7JzMUyffbt9JMpFs
	fAHC9e32LqOWX9j2rB
X-Received: by 2002:a05:600c:4689:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-48069c5bd29mr110958455e9.22.1769677870614;
        Thu, 29 Jan 2026 01:11:10 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm175338875e9.2.2026.01.29.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 01:11:10 -0800 (PST)
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
Date: Thu, 29 Jan 2026 09:10:51 +0000
Message-ID: <20260129091108.95277-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31287-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60470AF452
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


