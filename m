Return-Path: <linux-gpio+bounces-31392-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DulAT4NgmkKOwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31392-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 15:59:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B538DAEE8
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 15:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81E1C304CCC0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 14:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2472B3AEF27;
	Tue,  3 Feb 2026 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsbSQprP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E47344D86
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130606; cv=none; b=m/XHvRBox6oDE376n7soPOn5t6v2E1xbC1kJYSNKQ0fbtzPLgCFYOAc7m/SmtjrknovdaBHfJZNIymQRysTB/b/jUOaq2B7TD5wFJZMhj2LfKcgf1e4chz/zoZt9ykxgnVt6rj53kjcE9UJMCTB15pRQRGxvuOsM1gByu8Le0A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130606; c=relaxed/simple;
	bh=dVx/NTBKTBYer1sAELG6RU2I0c4yRgXuu2CweMfhYDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LXyEsHjV4NV5C6c0x4pm/BQzg7HH9Q4SZC1g5F3gwQuxuiKA13XmeiVSbhbzhfM13IaJV1hjC9MWQnSO/sa+Sn/sjfaDSQvmyNGO3RfHJWlAiIAwvSXvcttc0l1yNGC/x99zpJO3cEPZ2rJ3Ot9vuejtVSeAXylI+Qrnpn1tACM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsbSQprP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso52993205e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 06:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770130600; x=1770735400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfk7LFQnGB8edV2Pkyiykl2DNq5nGPoA5EosQF70rIA=;
        b=XsbSQprPIHRifAz4IOQddjFyqQtS2fZaIy4E6acjgjByIE0owpcJHj8Rvp93ZsgAkb
         kBsEBOdT2cW60Jkp6WxTj4pK5vgkVsOUg8Hnk8q8M1A/HD2Sl4TMaV0tJWYmSE3p+DYf
         jxZH7TMpNkXfRpSFtw9AcqEq36hhDruOEp3mdFE4XzVqSx1DGPGcmJaAJxV9iyiJ5/Kf
         9Bz+Zd36UazoZjFUy3VwydpRpW1JkUFxlfTTrhiIxaFpI0iIcFP2FRQ35bSnSfVl3Ja4
         25b9zGkU7yaBOqCGfEDkoRxUFs2erT+2c9Zza+PDtD40GozHHBeXGpgHA3OgOgGL2B0l
         wL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770130600; x=1770735400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfk7LFQnGB8edV2Pkyiykl2DNq5nGPoA5EosQF70rIA=;
        b=p1daquwmg/7cMr6uzEkRrGSMFbwEmm5ws8PiaFlCVUtUQ9wFfFlCZpxiZdUqohToZ+
         JBen0NDjTBp6YH1oMqubC7SI2syfdo+pKcrHnd7U2yI91j3LsPMItcl1UL744WhgvnGp
         1FJk4WfOucd9hCc/oxp+3l8yKmr29hv+3VBFfRu+rFNdkN5KtYFvZXbpfzheZ6+xB3H4
         uSYWXmYJ/9oR3GTu2fB9gL5gNKD5iOh1oPlhRLAG6ocd4Osuu98IomKJx5+bhSKYkpob
         kc7GmcapDr/zjJagZL2pkQlB/YmPKo9fYTheaDwV9ymYbem82YGT/taAA7TrSEd2cjdA
         r1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsXhQgK8izjjYY9VUDrF1KbuzpsEir2f6aPKXz3uKbAuXMbCvI4DaxXTuY6J3VnMM8uMyXpNKJ2yiS@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaeOsvQiajZ1lK8ycLnZoI+yh++UVy1oYiyLqHyiCUjGfTGYu
	1WhiuN0W0kWSuhPRbLzJa/41gNIxAosPL3yqVso2HULc2B7v8Y8FYD4yukzhxQ0t
X-Gm-Gg: AZuq6aLc/W01x8lGpWGyp9d/qudmKuyMT3gVh7br/3uG2Q5+Jz5w5zlD/XYSA/cpdGu
	qLxZxxIvfxVFOEA6suGS88f6YktXcAd7ZMhGpFgM00TGx1ZO+lbFJXXBdPTqGfIZEKEthn1waN2
	zqmqkjDM4OsZvy/p4+ym1IEDfJzpSa5RVbJUah8r0QY270UaU4FV+CLx4RsiMw32dAmKQwVRgsC
	ZnaaiOM9k2QNBarmJcFDyF/rXuslYJyKiRyrkDvta0UhIacqsbnbJWq6BcNkvHvRNxH8FFUhecx
	dS4gv7MAOj0aRnr6yBeH64kT/bqm5JVqgvQL0JsXXx8CtyV/ihA8/m9UywZSFi5WOi0fzA+CTFu
	ZHvUA0Xvoy9lqn3RAoYLPHKLo/Zg39KSQu8JE0Lew0yTozcEghNFJ9YwShehsdjxJK3GnsAJiQv
	PSJyKvvMau5bniHjmpRA==
X-Received: by 2002:a05:600c:4e12:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-482db481b62mr184164265e9.19.1770124252099;
        Tue, 03 Feb 2026 05:10:52 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:51 -0800 (PST)
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
Subject: [PATCH v2 00/10] Add Renesas RZ/G3L PINCONTROL support
Date: Tue,  3 Feb 2026 13:10:23 +0000
Message-ID: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-31392-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 9B538DAEE8
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

The clock patches depend upon [1]
The dtsi/dts patches depend upon [2]
[1] https://lore.kernel.org/all/20260203110220.265748-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260203123503.314755-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems in bindings
 * Collected the tag

Biju Das (10):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  arm64: dts: renesas: Add reset-names for RZ/G2L and RZ/V2H family SoCs
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


