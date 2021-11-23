Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE91C459E48
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Nov 2021 09:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhKWIkV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Nov 2021 03:40:21 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33050
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233911AbhKWIkU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 23 Nov 2021 03:40:20 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 425263F1B1
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637656632;
        bh=COz8Xt5iyR6b2fbCfQiCZFl6eUlmeAm2S/sJlzQf8ME=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=bDwxxcolN8F1AdapjCIvtS8fgDxluK4WBRQPl97/UWUpdKtfiRp8wnxIyZKV3qD0O
         OlvoXWn+to/PZKNonHQl9lAb7rio5G0TngPox3FZNJo9xplDJlEN69oV4t7Fp0nPxE
         CsV9Li9nRWETbFwJl6OSKoOuzsDWkf6PBTU+hmxQc9ljJ8sdBPirqP/SSIilVOeINe
         hCdDIntQjkcK2jfigCgk04ZiJvbOXabOEHAfPnGes2ymTVDS39CMgb7YwB1fc3O47T
         3I5Li0VLI06ed3jPwtM07Lg/uecPCTU0+hjquW4z6UW5t7sOVy6kpi1W+wGQmpBt/7
         6nHK0sWiPbOEA==
Received: by mail-lj1-f197.google.com with SMTP id s16-20020a2ea710000000b0021b674e9347so415470lje.8
        for <linux-gpio@vger.kernel.org>; Tue, 23 Nov 2021 00:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COz8Xt5iyR6b2fbCfQiCZFl6eUlmeAm2S/sJlzQf8ME=;
        b=DPmTaDdXS3AR47Up4r8BYy5E40ONV9TslZJgoV5Q5ytLcDP6qS5MKOdXngtgB28YeF
         2SlJaEWHQQ1IUrXk56w9cTWWutA8b5SBK5u6fM/yd3BBibMOGQ02qDwzhNwSZ3Eqc5Z/
         IAOZNjsmCXyTFefaQ3K/moUSTlhzbpcOUsScsyD6R/3BneuIym1WBdTc6ocuDeR5La5d
         g2qMQk3zQ7lhSC5JrtLa/WlDYQIOBNTQPncGYwMvv27j3z1vuiH8Ea4V6UlKbZcrb8PL
         jBt34vjbFqQ739ParjVoeVBPtgww1qeEYL8OxlJDvqMYcz+lhOXuGUaZtiR0u6kwkxRM
         z1VQ==
X-Gm-Message-State: AOAM532NmZoU59okSZMYw/C04SmHekgic2czlpOpzlDcCECjlCWcexBq
        Up6hiRF8LquX918FceEzXhe3NPMtl6h/zNO9M9MBvfJ1B+hYpoq6qjHq0G2+9jc9ftcfbdHbpfI
        1eyPlhR1RdLww88Q12iTXprbh45YFseb6nP2gBtM=
X-Received: by 2002:a19:6752:: with SMTP id e18mr3052882lfj.195.1637656631736;
        Tue, 23 Nov 2021 00:37:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbTmlTJExHRzGjXz7RgsWigueTPgxob7fbleonTy2RgKaGipXnBNDBGRNeCgrAxkc2Kr1DIQ==
X-Received: by 2002:a19:6752:: with SMTP id e18mr3052859lfj.195.1637656631554;
        Tue, 23 Nov 2021 00:37:11 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l16sm1402483lfg.90.2021.11.23.00.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 00:37:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        David Virag <virag.david003@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH -next] pinctrl: samsung: Make symbol 'exynos7885_pin_ctrl' static
Date:   Tue, 23 Nov 2021 09:37:09 +0100
Message-Id: <163765662601.91709.15516222234511579630.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211123083617.2366756-1-weiyongjun1@huawei.com>
References: <20211123083617.2366756-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 23 Nov 2021 08:36:17 +0000, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/pinctrl/samsung/pinctrl-exynos-arm64.c:490:31: warning:
>  symbol 'exynos7885_pin_ctrl' was not declared. Should it be static?
> 
> This symbol is not used outside of pinctrl-exynos-arm64.c, so marks
> it static.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: Make symbol 'exynos7885_pin_ctrl' static
      commit: 16dd3bb5c190654854c0846ee433076139f71c6a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
