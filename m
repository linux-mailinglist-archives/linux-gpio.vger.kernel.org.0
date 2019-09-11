Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74480B0570
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 00:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbfIKWSy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 18:18:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45296 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728415AbfIKWSy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 18:18:54 -0400
Received: by mail-pf1-f195.google.com with SMTP id y72so14548169pfb.12
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XMh9vqXFV71BBXfbQeqQ2AI4/VRHGP8NHDiJ3hd+W2c=;
        b=dfUFqn9GmQQfPInseKvxR8/MfpW8jptfI5OoFIgi0zvZOMbwaNSR10Eq+XBJSFsNYd
         vGjgVyaCttoTF0bidKsGXaXdbNpRpMIva11M19yysOu907+gXXYL+v/A4NnXoUMCxDuO
         rUorgIlhOWzW62Yag0jaeWo8A5lF25viT8ELc0+A/LeZzl8Y8c1xQ9g+REJ8UIGOgBuB
         mqYMZ5Arjb8bcZc2LIvu52wngHmg07ljwecDu6tXfwOvyi6sErhzDq6bZQo9X03SNDGb
         LZqK5p7G9e8iuZWNrfehZHgS7Yfjbe7yaJUCgBtFlus2nv2h13jIlVEzU25ZMgxHHe2+
         X6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XMh9vqXFV71BBXfbQeqQ2AI4/VRHGP8NHDiJ3hd+W2c=;
        b=IVFGT3KDKpMcysriBus9RVfddazbsATu41i5rZ5KcnqrTvFZcKbSy3+Ac0R6DZ7wTf
         Q5JXotafpItZ0YkKeF6aWDmXJMeAVbSRfc2fXplJko/krgVlvqqH93zrEYusT/WhSmbI
         sAWGulOZmSn7QgZkoVjGrLNB5hPEb6IP4RGdZAb6P7Z1IvYBs49KitiQxNUNBQx2sxo7
         2csZI0vVsEDvPNzsCSAtlgAlZut3zJCa1VPZ/j/1yeNtxvUIWQ+7D757uPbEVc0Ec/Nx
         KIuwcKXv2Tb9s+JnlcPjpcntiNs8ACBTyJW44muW9nFYPSFKc+Y6vho6sywMiz1gto3A
         pWWQ==
X-Gm-Message-State: APjAAAV8dOzB9ZjzA8PAXXoqLgRJRXiPMncJZJaL+43mYv0rPtl5OY1c
        +YityEayhSamWc5uY8b+osCGtw==
X-Google-Smtp-Source: APXvYqzABztHQChdM8v4krHqAsKVKJHoGyO3bgM5SrAaN0DScRsQ2Ub9RLeinBiXp7kc3wggdgVYNw==
X-Received: by 2002:a17:90a:266c:: with SMTP id l99mr8084116pje.93.1568240333366;
        Wed, 11 Sep 2019 15:18:53 -0700 (PDT)
Received: from localhost ([49.248.179.160])
        by smtp.gmail.com with ESMTPSA id d15sm22787418pfo.118.2019.09.11.15.18.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 15:18:52 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sebastian Reichel <sre@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Will Deacon <will@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH 0/4] Cleanup arm64 driver dependencies
Date:   Thu, 12 Sep 2019 03:48:44 +0530
Message-Id: <cover.1568239378.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I was using initcall_debugging on a QCOM platform and ran across a bunch of
driver initcalls that are enabled even if their SoC support is disabled.

Here are some fixups for a subset of them.

Amit Kucheria (4):
  arm64: Kconfig: Fix XGENE driver dependencies
  arm64: Kconfig: Fix BRCMSTB driver dependencies
  arm64: Kconfig: Fix VEXPRESS driver dependencies
  arm64: Kconfig: Fix EXYNOS driver dependencies

 arch/arm64/Kconfig.platforms   | 3 +++
 drivers/bus/Kconfig            | 3 ++-
 drivers/clk/Kconfig            | 3 ++-
 drivers/clk/versatile/Kconfig  | 4 ++--
 drivers/gpio/Kconfig           | 1 +
 drivers/pci/controller/Kconfig | 1 +
 drivers/phy/Kconfig            | 1 +
 drivers/power/reset/Kconfig    | 3 ++-
 drivers/regulator/Kconfig      | 1 +
 drivers/soc/bcm/Kconfig        | 1 +
 10 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.17.1

