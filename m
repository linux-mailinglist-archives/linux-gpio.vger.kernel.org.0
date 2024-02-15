Return-Path: <linux-gpio+bounces-3344-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF8A856370
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 13:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC55D1C2355B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Feb 2024 12:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA3912D755;
	Thu, 15 Feb 2024 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z6Il3Pvm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0D12AACB
	for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000892; cv=none; b=O3BDC6opNkFVQZ5zWViBkEmG5UClO0EoV0qPy8yvdpQeW8R+bVkp1FLP+zNrR2aM7O3KlnnmVkFtiaEQ9SgnEeEbvNDqmd4ZjiOEszxW/DaAhyYELvSLKhxsV6790sc3foFCZiEbcUmJdhhphuXnddKoMRMpd9LJ/Ss0q2EMYo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000892; c=relaxed/simple;
	bh=SFCpTXqbRdAXHUBBAzzxnjc1Az5f8TRxLKC/k3F4vy0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nj+ZkpQgqy16x6vlY1WwqsDzrHxS/9Tnp1BYG4SYcjUNjhgglZoEbXgZVErMC3k72W6f3hXS8t75SddJs+5PcVeEy7eknZcfQ9Qc/EdjuEEnOCryawCzLgEpzY1Uq/juJNoQh0o+ekrUmlIKY0cHc0vaIY3kKdlSlkZ2yieOHVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z6Il3Pvm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3394bec856fso1155370f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2024 04:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708000887; x=1708605687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYnY7O04/x9zyqYEQqnNz4jRAg4FTDodHzcngEZrlFo=;
        b=Z6Il3PvmGKjrj3wv2OGK0Btonvz44YqMK1xp0TWb1xoWkhQa65XoKbxfGc4xOYO934
         m/LVFeHzpbYBPYTIuFYf/8H8oppIxnMTCOCUqF3/VNU10RvBjuhGKZmn9d3xD/kJ/T3k
         I/gVZwS8+kxruNjiZoCV8tvZ7DesMssZk3jW8JGuJ/IMIKDgfMTKIfHvosBNnVmBNS2D
         pPq+3LkSVikRTX1WRBGG2YFsPdSaiIKpYJTwRo02sgky/Jiqh5noDQLoEbtH+tOSVmuB
         fjM1KETp6+a/8+zIm3EnfvVvMY6n/749k/Tb0QivGn7pV/UritF3nK7xZ6zRHyfZekwV
         wLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708000887; x=1708605687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYnY7O04/x9zyqYEQqnNz4jRAg4FTDodHzcngEZrlFo=;
        b=EBGauh9+HKz9oUzmwrvNAmL7BVEDcZ/Tx+xIl+cCk4y+8pWtFmKipetgAzQfay1DWU
         gpt5D0OQpOWWR9Hd2BuFEvoIT2NKP/uXhb1w+WHoM4V5mBHBJ+GVzkJ1ivCx3dtlC5mW
         TmCb/An4R6m4KU2S9Eml0yy01WPrA0DQN3vIM01dY5nVG0mmkd4DlA+k9sRRXOU7duX7
         k2O+GSXPlsQeKc34GSAX1V2J+S1wyPxvfQapkIu2y9EYQgGkDdiL5ev1T4zpwElI7uAG
         8xq4cwL4TIZuS3uyFcOzglDTFU19MyaEMY0D/5dAftW/Psw0O5f+g5XPzvn7d2+FtRKW
         7obw==
X-Forwarded-Encrypted: i=1; AJvYcCWOSSy05+XOcLoBcXQmpqb2H44h3IiZrSUQWQCb4iiQ0Mbh+6nCyfu67GPNThilLADXdYUMz83XJKZFmD092eWaObaKnYbtAyxnqA==
X-Gm-Message-State: AOJu0Yy843EXRlQlmVxFwaqD/p87jQev4H6AzTM3IWd7AtZnhAcZz8Ot
	vaqrtuWouYfdtmRPqmCdjqgNCXKeK67mdoK1PDyGVki4/kkBbvMJE/YRQZyi7lRNxdQQG3F4EWM
	B
X-Google-Smtp-Source: AGHT+IGIGdB7TdXBD9OIkOScp9kvODa/Rio5A+z65NM6bDSmto8L+H13OukSXkPCKyay8Fdy8bJ5IA==
X-Received: by 2002:a5d:5591:0:b0:33c:f627:3bef with SMTP id i17-20020a5d5591000000b0033cf6273befmr1304211wrv.25.1708000887580;
        Thu, 15 Feb 2024 04:41:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d51d0000000b0033cefb84b16sm1674931wrv.52.2024.02.15.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 04:41:26 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] pinctrl: renesas: rzg2l: Add suspend to RAM support
Date: Thu, 15 Feb 2024 14:41:10 +0200
Message-Id: <20240215124112.2259103-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds suspend to RAM support for rzg2l pinctrl driver.

It is expected that patches will go through Geert's tree.

Thank you,
Claudiu Beznea

Changes in v2:
- dropped patch "arm64: dts: renesas: r9a08g045: add PSCI support"
  as it was integrated
- added "pinctrl: renesas: Select CONFIG_IRQ_DOMAIN_HIERARCHY for
  pinctrl-rzg2l"
- addressed review comments

Claudiu Beznea (2):
  pinctrl: renesas: Select CONFIG_IRQ_DOMAIN_HIERARCHY for pinctrl-rzg2l
  pinctrl: renesas: rzg2l: Add suspend/resume support

 drivers/pinctrl/renesas/Kconfig         |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 408 +++++++++++++++++++++++-
 2 files changed, 405 insertions(+), 4 deletions(-)

-- 
2.39.2


