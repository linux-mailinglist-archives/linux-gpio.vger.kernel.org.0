Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4858418B35E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2020 13:27:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgCSM1x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Mar 2020 08:27:53 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43400 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgCSM1x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Mar 2020 08:27:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id b2so2673311wrj.10;
        Thu, 19 Mar 2020 05:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tjmr+ew1+U0WzAY8kVkpYSlD1YeBvSFCuj5UiESo5VU=;
        b=b4+8pComvUughuuAspy9Uy+B5Y911EqKC6lJPjHhybj8Bbe8AbB4DhYgOneNOX04As
         sv2mccdAFvTwzMQgtFLhWeQWMzH8ilCEFf9xBEB0JYavTo/t6UOlWj7YJG7J4E1R+yXr
         2Bn5D6shgQafduysSkDE8QJz/rtYn/7wQskI9o1USj+gLgKbaqIyYVNgNTclFAlksznZ
         oshPzuPxIOc+C73ypopRyikLuuI5o4tSjzENNyuaYc8K1C9x5nO/rJYzpbu7V5v38r79
         1+ZsuVlc1SBXUMpPeijANx5UPb03g2lJtvf/mqVAOC8QREkvm+5NbMU4Fcils/PQEoN5
         Ioqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tjmr+ew1+U0WzAY8kVkpYSlD1YeBvSFCuj5UiESo5VU=;
        b=ZvmPP30mtEDOR3fPhNySPV9b1x+ex+AI+JLEIcaRt8ay9sRV79UV6w2Pc2Lr3qRwUa
         TJtm+TY7lVaRnsv8DG17/E886hrqC9B8VhHlFDK+phdFnCG4TBADmVdoHDX1ukQE6v13
         jU60eLF0fHFxSZLiVfdbdUOQfhVTF7WuoMufrYYmGHBLkKwCpdi3tvSwsnGavUuzY/0b
         g8RBOyEsPk+BNtb1GP6E6+UV6Z3uX3BpqTRp+mqRKSbTWmC7sw5QpSpFjP8l40WIFfhH
         aq2/LyaRVhcEb5uqk8r9RM9izwTPtq5pZzl4+zMNAleqYkJU2JKJs5dUQrzWigls3ver
         Q8rQ==
X-Gm-Message-State: ANhLgQ1nKAtIojoPBna3RXzxcBpK/7Ikgxi2k28XaIkLLfGK8kG4ujSH
        XAqjCWhiiE2M9voVVz0K8jw=
X-Google-Smtp-Source: ADFU+vu3taUE7717U01TDWtl+uZrtA/J2fxGL4WrO7Lzxl5LAWNxOjxZWMZSghG7TCk690WeAWZtwg==
X-Received: by 2002:a5d:6cce:: with SMTP id c14mr4219926wrc.149.1584620870757;
        Thu, 19 Mar 2020 05:27:50 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id x17sm3524082wrt.0.2020.03.19.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:27:49 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 3/9] gpio: tegra186: Add Tegra194 pin ranges for GG.0 and GG.1
Date:   Thu, 19 Mar 2020 13:27:31 +0100
Message-Id: <20200319122737.3063291-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319122737.3063291-1-thierry.reding@gmail.com>
References: <20200319122737.3063291-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The GG.0 and GG.1 GPIOs serve as CLKREQ and RST pins, respectively, for
PCIe controller 5 on Tegra194. When this controller is configured in
endpoint mode, these pins need to be used as GPIOs by the PCIe endpoint
driver. Typically the mode programming of these pins (GPIO vs. SFIO) is
performed by early boot firmware to ensure that the configuration is
consistent.

However, the GG.0 and GG.1 pins are part of a special power partition
that is not enabled during early boot, and hence the early boot firmware
cannot program these pins to be GPIOs (they are SFIO by default). Adding
them as pin ranges for the pin controller allows the pin controller to
be involved when these pins are requested as GPIOs and allows the proper
programming to take place.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra186.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index 1086c1fcaf49..79b553dc39a3 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -839,11 +839,19 @@ static const struct tegra_gpio_port tegra194_main_ports[] = {
 	TEGRA194_MAIN_GPIO_PORT(GG, 0, 0, 2)
 };
 
+static const struct tegra186_pin_range tegra194_main_pin_ranges[] = {
+	{ TEGRA194_MAIN_GPIO(GG, 0), "pex_l5_clkreq_n_pgg0" },
+	{ TEGRA194_MAIN_GPIO(GG, 1), "pex_l5_rst_n_pgg1" },
+};
+
 static const struct tegra_gpio_soc tegra194_main_soc = {
 	.num_ports = ARRAY_SIZE(tegra194_main_ports),
 	.ports = tegra194_main_ports,
 	.name = "tegra194-gpio",
 	.instance = 0,
+	.num_pin_ranges = ARRAY_SIZE(tegra194_main_pin_ranges),
+	.pin_ranges = tegra194_main_pin_ranges,
+	.pinmux = "nvidia,tegra194-pinmux",
 };
 
 #define TEGRA194_AON_GPIO_PORT(_name, _bank, _port, _pins)	\
-- 
2.24.1

