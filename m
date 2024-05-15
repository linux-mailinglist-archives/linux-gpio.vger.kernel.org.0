Return-Path: <linux-gpio+bounces-6396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7CF8C663A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 14:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58A16B21365
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 12:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45573745CB;
	Wed, 15 May 2024 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/hDoivy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4DA14AB4;
	Wed, 15 May 2024 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775468; cv=none; b=HmJISdRmbCryjDon7rpkfFG1PEATBhIGVt+IABTf3VqAW8aRlOMLBlSrmiFPme+ckcNeKrDID3WPjXr3W682CTFU/kIyhI80y8MgfPZ5oTnRUmtQrlSLnhMff5Mk57f0ATAA7rtkDw3gmU/F7E2FTpGT7RowJ03YvWVfeWMjUwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775468; c=relaxed/simple;
	bh=Q2y9O+8MQgFUY1TFrbqsl53M1XGtWJlJDpF/18mcmIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j6yhMcGthOdiMrnaJaBPF6cEZwDDT5TOu12uc2vTldYaAL6xaG0qDNZfkbwF+MuGMn2tNone7AyO9qEuFUFYrrqYSOgGMECxg+wHqZNUl8+NUo4ZAgm8pXo3oJDUQoc7IK+WBrAZjbNuaLQhHUsFqq+o0NZO3D4eSweHuSbmnUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/hDoivy; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso7332565e87.1;
        Wed, 15 May 2024 05:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715775464; x=1716380264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0aAEbXdgajt50FIPOAy30WPXnBHXkZn9O/zxN8IbEU=;
        b=f/hDoivy6J3btMafQLocUW/DJo0FK3hK8YSYfgFG89B1R5voVaTP2dGcI2QHV4UGEB
         pjOGe1EZng9xH2sE39CIjFIKeJy01X7dxe/ifNQbjTzbFA3EODuzFn9mUplP4IdHd5WA
         FZ7fVwV3VYntfptsqaX5dMptaKKaveJBgJDH+F23ZWJm1QWYpPAkYKHtctsgOnzqqp7P
         c+darUDx/kajHUJH/4aTnmnwT/1yM8NCjpXLrtvsLRoK96wuks59RjKAPrphY+VJGYnJ
         y65F6bsmYISWjCJi+YOe5IFal6aI6Oz33OigJA99ETf1UhLqzBEud8uvn2rbTEguFNQB
         S0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715775464; x=1716380264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0aAEbXdgajt50FIPOAy30WPXnBHXkZn9O/zxN8IbEU=;
        b=RuuQcugd7oqrEk/zjj2SYO5hrqIJmB6fWyxHn6V+iXrhOyknDMtanEj5wK9x4rT/mJ
         71J+hI3h13CFmxXW10vh+kF40zZ+Ry7B5TlFe89lY2Xje16brjp4SOK6EknCf9viHl5p
         Ohz3XOiO+VoRGFVsPx/310Z9ij6SEsDPbGL6gFvLWQQtMBQ6D4ByIVukQew2aTp47K13
         5PZ1SYYdR3wWR5K02XO6TCtiLCG8KlzQiCKV7ZbMdwwk5t18pgf6+EM14AaioZgg2KbC
         MgCe+rzXvNf1fS742iwRKmhz6hJicTunhUZYO6BBrsTNy+iuqtpXvCzR30/uuJwExyln
         BnSg==
X-Forwarded-Encrypted: i=1; AJvYcCVeyBeE43z7VoY5BsUvUOELe0hgcP+lQ10PSL6FCukRKAJbHReYffKR8vuvgOlt5s31j7Vq1Lr5b0Ylqnk2Y5oV+DnB258vOlVIO1He4yniQtxz8r81xZReyZTDZWcMNTr4igd2GAR4mPLLsTXjsnZWdJSoj6SOIplVgdIJ58w+DwQwXOg=
X-Gm-Message-State: AOJu0YxgT2UM6P2aJb5jSYo65q7WgaGTktVSs2UW1P+ddzBRrtmsqkJj
	27E93rv7oNO653KTwy05wk30ILBIX5OVk7M0rtFgD89e8puxa3PF
X-Google-Smtp-Source: AGHT+IG4Hkq6991vIoxDDRYmbp1gvzhu/qj+0mxidX62jQ3RMGCze6F96qvW6K5C207sigpd1tp2RQ==
X-Received: by 2002:a05:6512:124d:b0:516:cf23:588 with SMTP id 2adb3069b0e04-5220fc7bef6mr16714600e87.27.1715775464345;
        Wed, 15 May 2024 05:17:44 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad684sm2515614e87.3.2024.05.15.05.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 05:17:44 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 0/3] pinctrl: rockchip: add rk3308b SoC support
Date: Wed, 15 May 2024 17:16:31 +0500
Message-ID: <20240515121634.23945-1-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes iomux routes on rk3308 and adds support for
pin controller found on rk3308b. According to rk3308b TRM, this pinctrl
much the same as rk3308's, but with additional iomux routes and 3bit
iomuxes selected via gpio##_sel_src_ctrl registers.

Downstream kernel [1] managed this SoC's with rk3308b_soc_data_init,
wich picked configuration based on cpuid. Upstream pinctrl patches
droped soc init function.

The function rk3308b_soc_sel_src_init sets up gpio##_sel_src_ctrl
registers, making SoC to use 3bit iomuxes over some 2bit old ones.

These patches have been tested on Radxa's ROCK Pi S, one based on rk3308
and the other on rk3308b (from the latest batches). For the new boards
fixes broken spi1 clk.

Similar effort [2] was made several years ago, but without keeping base
rk3308 SoC pinctrl support.

[1] https://github.com/radxa/kernel/blob/stable-4.4-rockpis/drivers/pinctrl/pinctrl-rockchip.c#L4388
[2] https://lore.kernel.org/linux-rockchip/20220930102620.1568864-1-jay.xu@rock-chips.com/

Dmitry Yashin (3):
  pinctrl: rockchip: update rk3308 iomux routes
  dt-bindings: pinctrl: rockchip: add rk3308b
  pinctrl: rockchip: add rk3308b SoC support

 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 187 ++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h            |   1 +
 3 files changed, 189 insertions(+)


base-commit: ed30a4a51bb196781c8058073ea720133a65596f
-- 
2.39.2


