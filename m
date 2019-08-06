Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50C31833B8
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 16:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732905AbfHFOPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 10:15:53 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39256 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732894AbfHFOPx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Aug 2019 10:15:53 -0400
Received: by mail-lf1-f67.google.com with SMTP id x3so7501750lfn.6
        for <linux-gpio@vger.kernel.org>; Tue, 06 Aug 2019 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sAIRh0zHCkxzUmxSyq4qdiGiTcGIDNFzc3TNynpsgqk=;
        b=E2Wc85sLfivMU4AaCneNl6LCApr1GrJtCEc8ojybQ7Z4JKOMkTX06Un7zgIDoQQb6+
         6vGIgLwWWDOA62UzA4bpo0CrCe7PnH02iRtfPaN7kS1BhzYyDFD4Lc/w6uBmKmyepx3t
         hwdxXtIIH1ol5XXIUCjaCG9CtUKpjyQR+XqGrbI0yYK1whN/UZT7myGqfhLOzI2V7+DV
         7LggCCWyMn9I8J1CCfg7ozwxE30C//brOpGIMtNuUaUYM3jzowZpPqd9SBI+6PpNABrF
         EZay1BlpSDwastDS1SVWap2cMmM2NjJzWQ369b7XgPCsh+xSWfkg2CaG+BvdyWXr4hY4
         UWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAIRh0zHCkxzUmxSyq4qdiGiTcGIDNFzc3TNynpsgqk=;
        b=F68DSK/6OTaPJpVIq1wQMFD9OEk9TVYeUHohTYF7OYMPgvqbP/RIlhMe5D8GxeiK1L
         n6pKtgxFRA1t3wB1/iBQr8SMf3IQ7/U1Nti46zBCl1o+JsRHV/UnFV55aSnrMYKnZST7
         jF2qjVx2cE1gNVFgUadCz9kqoUA8Hin9GAMXpEPdf3NW4Zo3IKnXlga/4ZZiIkabeqZK
         2HzbIOVSu4nQsi1ZOezaa25GbOpIB2vlCmaI5bzIc+hNBtdenAAQbhKL1FCa6dEAqR2b
         LTTvvWHdaYyzJciNxliwudG+rGnb49kxmMdmB8YHywQucsC3Yf+qgL9oRSTr95mNg9yT
         ynnA==
X-Gm-Message-State: APjAAAVbwLUNMDcsUolKlkILTZClBiTh67ibd77E3X/6QKsShIk/jclX
        Z2OQcUKUHFGdFN50BxMWghvoqaCx2vuqIFJAgLlfZA==
X-Google-Smtp-Source: APXvYqwa7eUgjmF+/YyxXU15VYYv+720bBdbuzkjozsLAQLMlpvCf9Pylm6GgktGjdxlqgSSV2RTz8KoVio2DmPxnIo=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr2453376lfq.152.1565100951048;
 Tue, 06 Aug 2019 07:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190805162710.7789-1-krzk@kernel.org>
In-Reply-To: <20190805162710.7789-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 16:15:38 +0200
Message-ID: <CACRpkda8P522pkxctZbf2Ut13V6Rzx=mSYsRuHv0BvPyF6q1gA@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: samsung: Fix device node refcount leaks in
 Exynos wakeup controller init
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 5, 2019 at 6:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> In exynos_eint_wkup_init() the for_each_child_of_node() loop is used
> with a break to find a matching child node.  Although each iteration of
> for_each_child_of_node puts the previous node, but early exit from loop
> misses it.  This leads to leak of device node.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I assume you're collecting these for a pull request to me
at some later point, all look good to me.

Yours,
Linus Walleij
