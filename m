Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4AC3EB1C0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Aug 2021 09:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239419AbhHMHmO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 03:42:14 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:60998
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239577AbhHMHmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 13 Aug 2021 03:42:13 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 18BF23F070
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 07:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628840506;
        bh=lmvnwgN1nqiFs3gT3XouJcWEtaMB37eH6Bp0fzWosJo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=Vq5nQ/S/IGGL9YDZdgfuvy6t726wNsV05/L0M3KdgTi+awFQgkWwOqK1WlSs1U2i0
         kA70bqNH+ne1et7dz0XL6sk6s7fhkfGS7vrCzGpwiI4BEAWWigobrkkcbxPPWepXtJ
         EmU1c2mRE92HsizEy+7kTRM426PexovWsm9nA9MVHq8eLj8+djClrbSPfMH5FWVZgT
         pfr9ozd15jcUGWZlpLMLyUcvX9AisOtCbzX7ak4XJpSjL92J/TOfLI8EJegttuE0rf
         y39q3TMqfFNaqx23mwM2TEGgybsKXn2U7iH4Cj6EpjieL+PWfSZ2h/LWk3fb32XFCu
         ZIUTnm15wqDyw==
Received: by mail-ed1-f69.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so4454737edu.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 00:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lmvnwgN1nqiFs3gT3XouJcWEtaMB37eH6Bp0fzWosJo=;
        b=Ru+wxTiZsTasX1zi6qVOoyyiJMc0+EojtW02qvyQnSiqVvHScEMe8yGD3R72r6vrTK
         vuHs5FntcR0R7bnpTT+dBmrbQ643aOxh/KUt5EoU+Q6gwxMRXoyHuEJCy/MFMkA+OQ99
         GjsAJ4c8c8cuUyTQ4DIQmrllAH/bygYwOwxvC/LcYor9s+kMWlOkKPAakWwkaOlD8aDt
         mYybE/V/QT2NKmT4Tb+SmrZ88R7dyISxyKmIlXbGhTNwy0k9XTck6tEmDOKfFhz3WCwG
         Bf3nXr2ba3uCoQ/4uOUMpjbEMNqzPVXfrWTzAkkyjCkJCfrU9lCkjgs3LQakOFqhmjlo
         lt8w==
X-Gm-Message-State: AOAM533xj5N4OATlUffNzEynbP2qpYHGYyDMOjhFjEKwMIrFklBahz3f
        upz36/Ra3aJpntlfCgfS0U5TiCyH9K8tWSdP2x3sOV2D81C1NXWbNoP/g8g9IoNDcJDhqnbDt7g
        wj2hsVdBZG/8Iu+knC3w/RhdHRQYqqxa9TMvZKh8=
X-Received: by 2002:a17:906:4c89:: with SMTP id q9mr1193531eju.118.1628840504636;
        Fri, 13 Aug 2021 00:41:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGgR9Ep8EBsDxSeJUlxlgBMuS2Gxb0p0j9SvvvqQz9poFkzuAyxjESTmqdBeNOiwH8/02XGA==
X-Received: by 2002:a17:906:4c89:: with SMTP id q9mr1193522eju.118.1628840504493;
        Fri, 13 Aug 2021 00:41:44 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id ks20sm268665ejb.101.2021.08.13.00.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 00:41:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        linux-serial@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tom Gall <tom.gall@linaro.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 0/7] Add minimal support for Exynos850 SoC
Date:   Fri, 13 Aug 2021 09:41:00 +0200
Message-Id: <162884044884.8593.17144936297459767250.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811114827.27322-1-semen.protsenko@linaro.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 11 Aug 2021 14:48:20 +0300, Sam Protsenko wrote:
> This patch series adds initial platform support for Samsung Exynos850
> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
> rootfs as a RAM disk. More advanced platform support (like MMC driver
> additions) will be added later. The idea is to keep the first submission
> minimal to ease the review, and then build up on top of that.
> 
> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: pinctrl: samsung: Add Exynos850 doc
      commit: 71b833b329d65236285cc73f4528f08c7d3c274c
[2/7] pinctrl: samsung: Add Exynos850 SoC specific data
      commit: cdd3d945dcec0d0dab845175dc9400ab54512aa6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
