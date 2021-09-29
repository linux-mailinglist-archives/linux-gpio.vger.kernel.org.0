Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F40241C633
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 16:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244929AbhI2OC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 10:02:29 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51336
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244761AbhI2OC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Sep 2021 10:02:28 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1A0F3F4BC
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632924046;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=qtleohm1B1pwNSS2f1MKsyxLyMrkhRgGGrtG/EnhxoDFDY8no7PmsvFW2QNN2hTyA
         R1zAwtOu0Y7M1tPCI3+J8L4+RPHlALcvPEoFkAgmrmiNiznSB8eMKjfpyBwacrjPtG
         WRI5+2QrxUJGJ3Do7GCmscH9jvcQ988rN5RGyKIZnKxz/DoWHcWkmMGKYn0Yf3KBPO
         p5+zz/XelhTrM+rP4K7o680btvFHf8CQ+hVTJxGoTXaAQ5dFiO/8eiGCWpRcJ6at5S
         R269OK53HhIRj+wSbcD1uW/uDW4NDes10dm4Ozm6zeHvLeYQoin5g3S6BBNdJgQxkY
         cFPpJAbk7KTZQ==
Received: by mail-ed1-f72.google.com with SMTP id s12-20020a05640217cc00b003cde58450f1so2526047edy.9
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 07:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mf2QkVX2ZzY2roVO0lt54DiqIHZ/KT4mIU4bIZQY7eA=;
        b=2LbLGEqAS9kRrvT+VrLqG+RNKXB/Cq5rzHV6mmAfgpqlblBn871JncMLK0p6/V/ap6
         BPFKc+4S8JvpWSkI8DXTpL9Cs6OWK0NN3wa5L9SVT7sbrfIYRj62xK1dB5kSe1ayo2kN
         ws6T/Y/NM8gY+PKH3v2KNjok7QT30ALOGMw7vXBBNEFD2ziRqNP00rzlRp1Gtflr3J1E
         j3AstIqK4pyQxFcr7OQrVUJ99Cc4Cntc407/9QcLmXfU5PPLqmd8l2NrQ+XPEtfNNeqr
         tFGsEwgIATwqsrd6QCdvSO3RHuJe6m0GG0u4CSQtox0k/1nIhnAYLhThjc5vWhIAMsJR
         zDeQ==
X-Gm-Message-State: AOAM532kosWESXxkTFZZexVR6T7N3u8aDD+l41k4Zm1OsX7tuTslUy/h
        FkuDh6sf7HK+qK10934mC0HDuj5MgAINEknOQN6aYzHkg/MKW2ViJNj7FLdAprV0nijzs5dJ1Ch
        vFSis8/SLKwA9dbSZNtHpHslBbc3QmL2zr6th+1w=
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61880ljm.474.1632924036574;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKt5l2t81qxHBKi3o/CZN3L1oKUtNTtom/CYUokyE0JkQifqqKnv7EtIY4e4dm53UQ6EHscA==
X-Received: by 2002:a2e:a238:: with SMTP id i24mr61835ljm.474.1632924036320;
        Wed, 29 Sep 2021 07:00:36 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id t135sm252900lff.203.2021.09.29.07.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 07:00:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Will Deacon <will@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will McVicker <willmcvicker@google.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kernel-team@android.com, linux-samsung-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Saravana Kannan <saravanak@google.com>,
        Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
Date:   Wed, 29 Sep 2021 15:58:49 +0200
Message-Id: <163292392314.29281.7860159491587813094.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928235635.1348330-2-willmcvicker@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com> <20210928235635.1348330-2-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 28 Sep 2021 23:56:18 +0000, Will McVicker wrote:
> Now that EXYNOS_CHIPID can be a module and is enabled by default via
> ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
> remove that.
> 
> 

Applied, thanks!

[01/12] arm64: don't have ARCH_EXYNOS select EXYNOS_CHIPID
        commit: 6ad4185220e6e3b7ebac7c7a5f55197aedd000da

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
