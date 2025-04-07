Return-Path: <linux-gpio+bounces-18386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03568A7ED1C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 21:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2413188260D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 19:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D194624FC1E;
	Mon,  7 Apr 2025 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGjAYt6p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAFB22D795;
	Mon,  7 Apr 2025 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744053407; cv=none; b=ZBZm5Mj4RDLHLTSFEZAJA4DX7PvLhKY2a3fYqk3wMlZo718ank1YLZUN5haG1h7TgYQc3+IO+cQ/wbxAPag1CeXzW0rO0smjylq1YFBRc7QmrvoQYEhHjSbTkCHA1HoGc/J3KAjzy8vKDgiJ4583blujHSn7tK6WdYBA9TzQVbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744053407; c=relaxed/simple;
	bh=gmmabwGHkSlmOFtJXlDgZZP3CgF8i9Z1g+GEyX0vNoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKMEDCA4JVdLewXsjbk9VAktcGIYbdbrPt/MCvx5RfzvqHgkr5Z0sfvHaPquDQqCdIRgG1GBLgm680O/wV83ulNe1JylZazhBqg8ehdQ38JZdiqPQUJjC13C3a6gly5Yv91QoJoAkW0jQtDxZ1YhQfl48GSm3ScG3VJKLS8aEVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGjAYt6p; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3995ff6b066so2595033f8f.3;
        Mon, 07 Apr 2025 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744053404; x=1744658204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDXupFd8FIsq9zL6MfxQznOtp8Pu0HwKzwKZiKLIo5Y=;
        b=hGjAYt6puNJ6AZQsIV3XKAqVmVsEhofJ/mkJsMRNiSRrYdU55PvjoGyTTehmqrK+ED
         p5Jcd5DMdZZo+i+wsfOQHpA3qbQ1HazB5ct1555BUf2JNSC4vfCqBHD/A8t15B89wO9c
         HCR1aW6ZMQh5ZdYds0R72GE30gBroW1ydrxn492CzXMjGkbm4/5RbKWKPLXcZR/NVDQY
         QOM7/ih7ZafEifLtlJDrblnp1Iza3YE5Jto/pgSnxnt3YZA0SDL8NPb086YjhfmseLTx
         dvTUJs+KnBsHTTw/6POJWE3X2OiVa64/TVmZZAdvOIiX9oOPPrgQtFYLpsqYGnD0+W72
         iw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744053404; x=1744658204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDXupFd8FIsq9zL6MfxQznOtp8Pu0HwKzwKZiKLIo5Y=;
        b=bAyleVNhb+jTb+zwrhf2jjpMrs5y3wZdeAfyCLor8nJ/t7INg4ED7Opp7+y8Ofqy+S
         JPDkht62riz6ZPx1slTgBTd9ktdaKDkxrbou1d4T0f+c60Kk0DT7+Fkr1KWIRSmFeXsE
         UwKmFEkJF2GdSOLjzyaN4bzuj9yW82CIYZnevFkR2y/rXy9uwbK77M+/SxiNSYtPppvp
         oy7zOMIo/PzU/Dm1CQV62af/t+qqohyQTY9yR54IoQt/TtTxd6mckNsEV5bj6ICo14/T
         015AOxf8Btool1wFRHS+VYmudta2dG6GKEGfJYlfXGv+OAv3vroIoeDaq/uvX/QOQAS8
         pC7w==
X-Forwarded-Encrypted: i=1; AJvYcCUHZEEgIfdt+hSXP/GfxMYinnDkwmSECGt5a9rN/0DBLi0aKdD/4k+L3VPkmWQlkj9y1Cv9usCUR+Fv018u@vger.kernel.org, AJvYcCVf7WKfowsO4cb0xfvkdVX3NHnmr7JFYny9DXYL8zJ9lZwjHW588sPdktEKbB0NVkHVMb+TNAIgqgfP@vger.kernel.org, AJvYcCVjlRSKKyahbHq0UZe8gEJ4cMMtYZs2jykdsZeU2blZ9g4PPrLVeC9xM9X0ENA6s11bFKp2XNS9MKtv@vger.kernel.org, AJvYcCVkjNix68R+EiQQYHroHcwQxZwih7iAeUaQ//ShkF4xik8Wl8N1sXLrNITC1llxsLFtWNLa/sE+m1lEMA==@vger.kernel.org, AJvYcCWtaPTN/aUk0a0BjSjK4R/lTmF6tKVTltR45PQ0SsVQPYtJNkqemIfXXVWTtIbVlKpJuormQFMZBBYksX+y@vger.kernel.org
X-Gm-Message-State: AOJu0YyncVVTrjadMW5fFt6tNyoS/6Ulha53hgDMSk6nIrRriyE+3HNV
	P9q+uevrST084zKilR6tYmhG7UlezOwFaD2AAVG34zz2hpg2gEc4
X-Gm-Gg: ASbGncuhzhlFLeuN+9NMUrBtloTDZfXE/6CGaL2dz4dTQNvofgf20asAdDygWl9F5Ue
	zv3GZGsx1PHSe7gOgrA1GCsPoZVld6213LVfOGjG5mBVnfO8BzxaQU+sHTqn/EmDqmfkuLvuVeH
	qIxe54pGwXuIwexqF/IHszJKB9D+CljNkdXyxFJWGtAzMF1sJigoih29ccHhWjF3cSZNf7T3nhY
	4qBQYuCf8G0HG/3Ippdzy9W4/KrFj/fyyegFX7jlHNw2aGu1ty7++iDZhX9fa3iyVAgk7eRiZUb
	jdCBZ5D9eDXdzzTUG7WU78UicyHVjzjO/48a5F5IjZHTptmmrhxXWSWTByliBQLO3eunNg==
X-Google-Smtp-Source: AGHT+IEEXMszvoyDLUtWrF3nOuLWb64ul1zh4PPDYNbTCPzwdFRs4tGKl6VYRCeGwd4qqWCm33LfeA==
X-Received: by 2002:a5d:5983:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39cba93cd69mr10772725f8f.48.1744053403946;
        Mon, 07 Apr 2025 12:16:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096bb2sm12994453f8f.12.2025.04.07.12.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 12:16:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 02/12] soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC
Date: Mon,  7 Apr 2025 20:16:18 +0100
Message-ID: <20250407191628.323613-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new Kconfig option, ARCH_R9A09G056, to enable ARM64 platform support
for the Renesas RZ/V2N SoC. Default this option to "y" when ARCH_RENESAS is
enabled, ensuring that support for the RZ/V2N SoC is automatically included.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-v2:
- Selected the SoC by default when ARCH_RENESAS is enabled.
- Updated the commit message
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index abf3526a1b69..3fa5ed36d20b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -393,6 +393,12 @@ config ARCH_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
 
+config ARCH_R9A09G056
+	bool "ARM64 Platform support for RZ/V2N"
+	default y if ARCH_RENESAS
+	help
+	  This enables support for the Renesas RZ/V2N SoC variants.
+
 config ARCH_R9A09G057
 	bool "ARM64 Platform support for RZ/V2H(P)"
 	default y if ARCH_RENESAS
-- 
2.49.0


