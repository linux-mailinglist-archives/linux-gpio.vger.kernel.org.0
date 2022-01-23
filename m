Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B73497154
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Jan 2022 12:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbiAWLq5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 23 Jan 2022 06:46:57 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56416
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232966AbiAWLq4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 23 Jan 2022 06:46:56 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 961583F1C9
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jan 2022 11:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642938415;
        bh=t1Mr2leewf+dJOw+raj7dTmlAldoGuESwLMLnJL3mUo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=UeSY7HEbDIEI29Yuog5Wc7qmAGEEkRRL4gUX8ShE0tLoKj/CAI5idXe2LkObNTRYT
         GkDg9xVTO3wQ1QLw+ZubpMrqAnrabalTOTE0+qKgkCEstqIUpIqroVNnaVuawms4b/
         AFYThjE8TMfGb6FJLrrVbANly3ZcIns76N0xF0yoJbaUUXlicLDeX1SsHn1Q4H0Hec
         aQDXPRnAIqoH4xYj1E/bgQDS5Z36S39LSv6Fy76kP7o8Qo3Dup3Bkdvw5Bo2qJfx8+
         wNO2IUzae016VE+1eY2mmCdKOSOQfR9yDvlxYpG2RWAM5QPmHYpZxTEvL8cSCYjje1
         U8F4m4n891yzg==
Received: by mail-wm1-f72.google.com with SMTP id j6-20020a05600c1c0600b0034c02775da7so5341918wms.3
        for <linux-gpio@vger.kernel.org>; Sun, 23 Jan 2022 03:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t1Mr2leewf+dJOw+raj7dTmlAldoGuESwLMLnJL3mUo=;
        b=CRu1Au6SBdEthOiwzzs1Fn1eywSbcTLa+JF+LO92kt+e6n8fkES1MbcoqaKTZoYhmD
         5J1cbNl9InxwOrxzCSe05qsaxOhdZGm+aOcwoIUYLenBMs5Vtaqn8sCJwMPv5Bwto7GR
         I80jhtduUhHG3LfKW1i1k6aG0Mt1WpXnp3sJ5Z6yu+hbpHutD82RWqaJZkJsmEgLMQ9Q
         BwPwHS9dAhzKs9BISGhgwjo2hv8g9k0hqLi+sCJVhhuGX7BAbsQZwzzXNP8zRckQTnQ8
         zKz/9t0fxUXEdLDpNXDd3rQfbI/+Ip3Ni3ZCqD7SdPzagEUJnYP4YnHRsuozD09o1J8Y
         vzDA==
X-Gm-Message-State: AOAM532Widm7j+4C+p4EFXbc6w3BQfXExLyiGTAr5Tl0WmjuCv24kkXS
        7lXAMZCMigOqtLtCnRR9rFesxGy9FiGr7UyYzSbm0c9dfdnmL+AWUF3eholFTtVHBoB7uUIlq42
        go5GhHpIFC2tFtXNkwikTyA3lb/1gEIv9nm3Qtvk=
X-Received: by 2002:a5d:6e83:: with SMTP id k3mr10395741wrz.506.1642938415402;
        Sun, 23 Jan 2022 03:46:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS480IySxN7r/zMW68vwN+Cqc0h0XRSdNUxo2T7syZh+fpKi38vkV6Glz0y+IeA+oKqVXahQ==
X-Received: by 2002:a5d:6e83:: with SMTP id k3mr10395729wrz.506.1642938415273;
        Sun, 23 Jan 2022 03:46:55 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id r2sm16992751wrz.99.2022.01.23.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:46:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gpios
Date:   Sun, 23 Jan 2022 12:46:51 +0100
Message-Id: <164293835975.31601.16620899683024964008.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114203757.4860-1-semen.protsenko@linaro.org>
References: <20220114203757.4860-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 14 Jan 2022 22:37:57 +0200, Sam Protsenko wrote:
> GPIO_ALIVE and GPIO_CMGP blocks in Exynos850 SoC don't have EINT
> capabilities (like EINT_SVC register), and there are no corresponding
> interrupts wired to GIC. Instead those blocks have wake-up interrupts
> for each pin. The ".eint_gpio_init" callbacks were specified by mistake
> for these blocks, when porting pinctrl code from downstream kernel. That
> leads to error messages like this:
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Remove EINT handler for Exynos850 ALIVE and CMGP gpios
      commit: 96f79935015cf3d7ca6fabf63cd13b8af45a7713

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
