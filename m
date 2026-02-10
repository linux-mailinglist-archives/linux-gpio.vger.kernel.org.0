Return-Path: <linux-gpio+bounces-31538-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKSsNp+TimlvMAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31538-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46267116272
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 03:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 985A7301724F
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 02:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0A22C21F3;
	Tue, 10 Feb 2026 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlKHJ73C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2A285CA2
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689435; cv=none; b=gnV52g/VIPvEWtCOUnIzpwLpKfm4Ksz8SgqeLtuReDlAmHsxU0igX/d1NFYq1oaTLRzz8pxsSgniNiAN42s+q/DQoLySkBxffalzUw69B4q1g3aAt/SlsWaniQSz7X/6kQXxdk36+lr/tZQ+Bbfb4EKCPw0my1O/7ZYQ7RVXKQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689435; c=relaxed/simple;
	bh=/ICsutzuX+LZ7m9I9aGGUYOr30MrEuyQKRWLfJGcBKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBv1/1Auu+jGvZiU5bmnNqxPgAZEzk9avfc9BnAf80ZwO2fLFIh0w8ikljjxgAqCWiTjGWYVwjm4KO2pC+7TV+Aa/hKjddzHPAFDenqA6L2M8eCOD/tf76PhJpnFH40k4zYUaVcrvOCYv/LkO2DI/UwACdBHqRbRn80WgClvPqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlKHJ73C; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c5265d06c3so678450885a.1
        for <linux-gpio@vger.kernel.org>; Mon, 09 Feb 2026 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689433; x=1771294233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSA2DfHeEWFn2IlLoxdyjrJ3c05oOywysXab7NEt2VI=;
        b=XlKHJ73CP4vdolQ9yW1Fn8hGpe3X/rRPl/BWaDyw6QvOWjzPSiUmHaHnCndZsQ50cY
         10YCyvW7Ms4JBzcUQaqXwFC4xLuWYQlEUM2tsPpPobI0C9kK6mhSok8kvrmkW79H347g
         LSrhT+KmZoRdIcsp9DUDnVWQEzGWROxdQmPw/j9Ar7Ej3tLfN28v21PpdUnGcGDv1XXy
         ubw+XDDtiDoKwE87nWpbNnD9SgnrzHnucsuoD7+5edKsjeic2eN8QPgvSmTHpfpOepXF
         ldmZgjXPMuytafAWYyTeWco+1gZHA/If698UR0Y4WXlRgLqKlhqpM6LMZcYnqRYVS1w5
         2F0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689433; x=1771294233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSA2DfHeEWFn2IlLoxdyjrJ3c05oOywysXab7NEt2VI=;
        b=v53bysYdwsnNYsNMo4FMX7mDb+FEQgdAZluEDC05rXMIaoCu6Thm3lX9Ukdj/AyJbu
         7qkSFtnJan0hvhYWFd3RW9atNsidx95CBAMmyBDto0ntJGq4tMvMbPJiaFXoWSMGtdcq
         uavH4OGk/9qgCYk7O4W4zKu6iGWc2TOZUsRxsduIPKHWsZN+1lXhv4MdarzcXmuDjrBk
         oF/MDnpgIa5JcK1LVsrLIywU7JYK1OxKwA9PPJuF6g11iR4ASuOo6+f5vuhngUxywUk1
         dRk3wpk/JGZlfuC1L/S7UKe93Mkf9pSVvofwiEYBgcJ/uBHX/FbrVhcd1AEd4nMivCC4
         97eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkrhdWrmuDD0yREV1r0KWDFjzwfzZ9Bw2aO78XkTwTsrW7TPCGgNRbav0xO60arUF1LL40bHWcBWlR@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJgUCbzZwZ6Zp88iZ1Pcvr/C8mWS4uEz1mLcOoRhSkBuxTFVF
	08v/yFv90jhpT8eI7pHNb8SlN5pA4n/8uYrMrIjKiV7i/RXN2CdV1w4c
X-Gm-Gg: AZuq6aIX/d4InS9fin+iR3aF/5ZpCAF+j0zNwYliz+KMeT6RROVB8rQZR5LPjiZlXyJ
	qEFs6vPMmJZjgqSSWxNBxRBCxt8dZmvFA0MO6Ear/AOm+pOCTreTlCu4QwTTYJHXTJKM42/LF+f
	vJ9zApv39FstSdb7nFKBi7Yjf/uFLgWsY0Ma5BQ5Da1l2YIwug6HpnrR8iEiEoj2aSTIuxaBSy7
	qUyj4j2pKKlioFR2FhBEcJQmul2oqnvK2MGwLePrZQGE3GQNCllmWrgGFiQQy8R8mlLzFNvhA7X
	yMGLgT4pchuQxyyl+BLn0TrACXEyr1AGC8EysvJh5XvyZFi31ZYGA/nvEV03GkuwVDKGL+ED6+n
	P/RVy+OLI3yb1N9PDsdMPWW5YfWg6ISEzmHTArJU8jm1IWJP5Bs2hAxeLB0ZX6ITFLplzDnyooa
	FEh5twRaydTZJab6CDh30FBslgAVMtOyxsLoMp4AlGigqrftf5OXxBxSXvStsuRdT0ps2u1Tfvx
	kY=
X-Received: by 2002:a05:620a:450e:b0:8bb:a037:fd90 with SMTP id af79cd13be357-8cb1eefbc2fmr108292385a.12.1770689433095;
        Mon, 09 Feb 2026 18:10:33 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a1575asm1009087385a.32.2026.02.09.18.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:10:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 0/3] SDM670 LPASS LPI pin controller support
Date: Mon,  9 Feb 2026 21:11:06 -0500
Message-ID: <20260210021109.11906-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31538-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 46267116272
X-Rspamd-Action: no action

This adds support for the LPASS LPI pin controller on SDM670, which
controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
not sent yet.

Richard Acayan (3):
  dt-bindings: pinctrl: qcom: Add SDM670 LPI pinctrl
  pinctrl: qcom: add sdm670 lpi tlmm
  arm64: dts: qcom: sdm670: add lpi pinctrl

 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 ++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  74 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 174 ++++++++++++++++++
 5 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0


