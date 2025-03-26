Return-Path: <linux-gpio+bounces-18009-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E135A71901
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CE2C1899036
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D24F1F4632;
	Wed, 26 Mar 2025 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZTESSew"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329311F131C;
	Wed, 26 Mar 2025 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000004; cv=none; b=nqfTDnmTxRS4Gpf82O4zn/5PDUUlLjlbIa9gv5eD3dbb816hSSJMWEFVYmCCvoBqSFsk+sUGx6gY5vPVJPKgP83jCNy7vC5iKdTr3KqgWJwCiCjaF4m75ua8EL0G0IhTPcj/AruxP1xlVzs/9/9yalMvv7SP8ovVvcpg2/aXp3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000004; c=relaxed/simple;
	bh=Nmk76CaoJMOrx+LZHhJxsLabnunUZrZNLVDdV88pNSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dczTDNcWLxlWiLpF/DQD1r3uGiCD0UBZvU7DeB0syfz9meZfkeS84cv+tBhxK8IHa7saHD05iqJtnQpuHHatLUfZjdld9CYXVw+gMYUOUf/vdUfAjO3hA6ON+RGiuupcVDdH4DC8sJ5dyaQ2fXP5en4cE7rmINMAg4016DVt538=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZTESSew; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf680d351so6067105e9.0;
        Wed, 26 Mar 2025 07:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000001; x=1743604801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqsDr19JXvidHyyqxIyci4BA4wq1OiK0LXdbSrmZDL0=;
        b=mZTESSewpO5ZDAbvthCp5XwmAAuvNamku+ZZ8KtaDN5uqXtyzYH3rPE2Vo+9TkQ1Pi
         DBz6xte9xKOtrRV7oDAixnAdjKFerK223VKhN+olwgBLVMb/InI3P6th7/XSKw07ZeyA
         LUnHaHgNoyDKJvjPkjzfkWYwqMlxpsxsPzgQdveWx9FXmnBVmhQBaH8PBHG5SHiplfZF
         R/ylEnxFE1SR6smkvHi/Xt6zfg7Tt9CQoBQcTXMo+ZNVDzalJJTupDZLq7PZNdz2Bcea
         aTAkN4y4p+Vx2iPfg+/tZLpfSQZ03GIHtR1tPWe+4OJsNOxIps9ygWS8AagzbGaWJb4l
         Fnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000001; x=1743604801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqsDr19JXvidHyyqxIyci4BA4wq1OiK0LXdbSrmZDL0=;
        b=toj8rJjjFxkZsxA3xYHULrxQAYz11XimfgbsoDjeHC/RmrEf5dzzVmd+RKwjfRJoz7
         ZUGVksvhggzRT0zllN8QG8tdIrkL6K0taR1++Y4DbOY3IqzOvDEUA2A5AaHs1VH2hgh5
         tjEOmd1JCwZKAq6rYnjO57Rzc0S0x3ZMI4sOiDqNxEteuEvNOeaWIAqfTOBGAYlhVbUO
         YmCUu0TyTUbb+F6r1u0Qli769CiY5tyRG3SLV9ngv906fHGAioYuZj2ez2S5HJl4tlhn
         odvpa4YqvSNZ/trO4hlhu2WKE8RpSeosU9pFUkkKOTS7GRl6+K0WjSd4RvsWuO/gzXYv
         LLMw==
X-Forwarded-Encrypted: i=1; AJvYcCUP4deDVfU7kNsXO73HcaBTU3uW7OCQwCmmapx+uE+vNVQC4pCYReYmfmPtJzy7vQ/ZujIgjF5o+KcPEOHo@vger.kernel.org, AJvYcCVIVWCj9ZhF5jBTnb4LimqIhYxvh6H/VGBoSC3ohFUIAqZ0dMyRWE3W3N1qSAziswGjfnuVpZnz40Pz@vger.kernel.org, AJvYcCVP2GTOcyiOPWBlyRWj79h/UKrD/yOcxc+2OxCxos6F/AaspzctaYWshUhmsiQHr8nwGqCv75orxuVJ@vger.kernel.org, AJvYcCVfXNTqULjWDu4uD3dCvW5Co92l/fROcCoh1G9OA3x0/DLnLeu3760rLn13i0Ki0C7MmnUi23V65XuRwJYc@vger.kernel.org, AJvYcCWCGJuVQmRfdJ3AStiVM7Q78bNg7oEznMNXvcpcwlzf5xIq4GUpQsI+up0t2Yi9jI1WxZ4juu8f8UVT@vger.kernel.org, AJvYcCXMH6Un+lWYYwMnOAJx83Yu6OBdnyOy8Phy9JWvcK6tMq4Dh4xChmq11wNnzpZqsH6wiont4dHh0K4Mmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbRyaMxFDsndonWfsSBiZP6xtEjwbFR7zxT2ATIvRF4Lsp5tF
	HEsG8RJSzRACdg0A0mRqNC8+ej46Yzuwx/Xnsxoq9iHS3tAv9PWt
X-Gm-Gg: ASbGncv9VIQEEKU87lhHYtRp1TVClZGZijZnyR1ikpg3Gt6sLQjSxdRCd8TKNDk8psR
	8sapsWvfCSYiX7hmKiYpSYDmqq6EjGtevWPFM2sKxQU3pPTG72XA7RfrVycAMYgs1rASP/ToUG/
	fz9dXnsQYVt/f6dukGZUZg4avtZyH8cuS5YZkYc9BpmFeh4zRbsUGSZJnSIEMX+/n+TVWggFK0R
	rSNtOp4hbWPJ4Osai1DNaWIS5mV/JcDPeR+MAoVHepqOFSBT4UMegd4TQ9YGCCLCs3wKgd2ZOBg
	35PXvJQM6KOs6Ch5pkkT5LL21W6ErOEPVwDU+YYlU6PinD7pEag81Z9hk3mzCLUhVmG6
X-Google-Smtp-Source: AGHT+IGhxObQ8qqvBlkojpEfVbwey9liws3lzPxH9s7ZyCGPh8xlJSvklFG6Hxw2YfZBFS9UCG8znw==
X-Received: by 2002:a05:600c:5126:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43d846b0f81mr454215e9.4.1743000001044;
        Wed, 26 Mar 2025 07:40:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 03/15] soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
Date: Wed, 26 Mar 2025 14:39:33 +0000
Message-ID: <20250326143945.82142-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a configuration option for the RZ/V2N (R9A09G056) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 49648cf28bd2..764aba6d1ae6 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -352,6 +352,11 @@ config ARCH_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
+config ARCH_R9A09G056
+	bool "ARM64 Platform support for RZ/V2N"
+	help
+	  This enables support for the Renesas RZ/V2N SoC variants.
+
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
 	select RENESAS_RZV2H_ICU
-- 
2.49.0


