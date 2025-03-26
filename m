Return-Path: <linux-gpio+bounces-18021-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD0A71939
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 15:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709B63BF53A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 14:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B591FE45D;
	Wed, 26 Mar 2025 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOPuQ9Qn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A31FCFC2;
	Wed, 26 Mar 2025 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743000020; cv=none; b=jsRx2plXYl1yyKsdi+crNs1SmJD9/gSLMogIs3FQ4ldG85aTxsQ1ePPB5lh0gFvUPrI7FEtMzvOEUpEkP1UZoFF8690JLzuwj+vaccnA3dI1RV65tC7gUx0al445jBBKoBRas94i8ZQpjfGhRsJRjgR7rjgoeWwUfDPabBqGh9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743000020; c=relaxed/simple;
	bh=TWUDBBZnu1BkI2OqASq4QWH769tWlcTAxmoohiQh0G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlPnGEhzLVVWFIdMxP67CjR2U8AcD0s5Tnq8y/ZespCyuDAZFFFPuZsaV8Y/FM5MQ+nNPtoIESgbE4LHmQIJZpZstm4FjUdw0+A4ATwYsRTAQTU7uRjvf4WmWQWl4B476h3XeTsmrwBjFCKtK5itCC4jlr80Z3loMwBt80zKs+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOPuQ9Qn; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so67814045e9.1;
        Wed, 26 Mar 2025 07:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000017; x=1743604817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oh3CNNvRBoX7TVXDcHJxqkfkaJkOwYjEATrQz4KoURc=;
        b=fOPuQ9QnMSY/K4Qt5vy7m/6qfVlrvxP5IKZPvAASd/6TD0JLZiRds1q5SlYZDqvzB4
         s+if6FtFlpsDbTz7HN/qzLu3E4eIIosZGhRn/8rfaSLj246xN80XQ5Wy42ttnF/QAmy4
         b5497Gzo3X4opRPXawheYF9PQGpAuzXdWy400s4d8luypJSolDyASJ9au5tjRvK/Um36
         Md/IvdWhlqHz26AE6H5fN3xB8R6vR4ug0bQRciXLHpZdZIoOxXTCD+l48XILK2hchj3V
         tX+MbFTDyTgzefeCHBfREs/iEZtJCRwI/6fvpun5YU84V9+imeK4c7Ta5HSSJyqm8axs
         uQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000017; x=1743604817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oh3CNNvRBoX7TVXDcHJxqkfkaJkOwYjEATrQz4KoURc=;
        b=PeoO8Dsu9u4T2f+Xe3ieTZ4nToW55ZBNGfzNh6P9jvX8iNrCtzip3xHd1FjrSC6I8+
         e5dq+CqZ8lDbdlGx7xkRFQTOfSICrODtIAE8mQ2R0XpCcuYL6wjYqoGlBZnh+Clek6NN
         S8oPjumXjKwcC/xSr0kYMFxDOohCDsn5R0qXdewwdBnslrW9u4XZzAXC+5NudPIRXXD/
         U2BJaJey8zLSSrONe0Gl7V8NAuJCMqmMcoidDzMEXzPm/I2T2GrG+JGPkrbJzhquIvCt
         TiHrWe0AUnNlELlnve5iIgaB3SCHo0MrU9UaZDfB77isW6VSKxlRNPsn/8iGctGmVySX
         C7wA==
X-Forwarded-Encrypted: i=1; AJvYcCUHEcd/j+QhBj+WGFUz3TQtMCpJfocq1sVONsjJIyh1MhsstrsvW30Jj09MB+ZwGPxiXnsAZJUWX/SFXw==@vger.kernel.org, AJvYcCV/GtpPBgEDQHYIZviOWYvKY1YQF9VUS7DlcCCM2kmbBc4UGciHReM7c2oAK2CgSP6/t82Gm57e7tEb@vger.kernel.org, AJvYcCW3PxguF4IxiihEJwB+ULRIoFRCxWCfjUrlsYcNAsiD9U/HVoTcrxxoEbUrbiw74z4rmBC537PUEsxO@vger.kernel.org, AJvYcCW9dDLryzUgT/tM2+pRTICXfy4IGTZmBDEz0yds/WukEg9CnGliS/+D6u1jv78VwAE9uN+Ez6ZBTRek@vger.kernel.org, AJvYcCWId/CmijaHwIrbfdgEPzgYWkuFaUlUREHNO1/tfYzCe12m49uOVeNzaJ//2HfP1G6Tuphr6Z8OKzNefLl2@vger.kernel.org, AJvYcCXNivMKKgwNuw8H1WV3Qu+jLkseE9DcPjSo0HPBHzmplpkQ/10keS+BkBNwxdOEkYYdhYtH/o1/orljFMeJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0/oPf0fq+KvKBvSnx4RJ+pIMkH5f4Ru2YyVwGuaGZxTm9r8L1
	0HcAgDyWiLRlJ1wIF6vCF6LFzJ3dZaBpGqz0X88ceKpNLqxdfGFm
X-Gm-Gg: ASbGncs0z89f0CYvj0m4dbnBthFdXs29K4O0izYbo5VT7JcHF8jj307kx0VMgZAaT63
	DHZ739mxEIvk84+3oGeYK9dFe+r7DZsuD/jHA/217g3y+ftf58ENE3PR/ZVNdl+j61j4ccnzJBr
	cz5L/qFs6b1psqo2iRFbyZrnQp9M/LlgmRC31MtSYFeJR+igRq/FBfvt8b6aNYP05V1Pvrwkp2V
	Mf/K8Wor3Cpeg7/xcl1qZW2AtsUh4QaLjk+xsJUY4SY30odne2cn+sMKtD8370zO3EwbbvQiQKk
	PdUFIpZTqrlKdJpO38Q290Vmkb2T2dszUTqNRFHSNbGGpgE/W4BNJ+FZIu9HMLHgNMxzj9odKqY
	VATc=
X-Google-Smtp-Source: AGHT+IFS3943lenVZZ8F3Rv9er/EfJngMgScjrNWzlOZgNty3csF8GqBJtNIJJuQ2lTosciCzIcFdg==
X-Received: by 2002:a05:600c:5ca:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43d52a8ff36mr137475145e9.22.1743000016374;
        Wed, 26 Mar 2025 07:40:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e63e:b0d:9aa3:d18d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9b4sm3891885e9.20.2025.03.26.07.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:40:15 -0700 (PDT)
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
Subject: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
Date: Wed, 26 Mar 2025 14:39:45 +0000
Message-ID: <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
defconfig.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 11e7d0ad8656..c7b41f86c128 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=y
 CONFIG_ARCH_R9A08G045=y
 CONFIG_ARCH_R9A09G011=y
 CONFIG_ARCH_R9A09G047=y
+CONFIG_ARCH_R9A09G056=y
 CONFIG_ARCH_R9A09G057=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
-- 
2.49.0


