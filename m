Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849E932CEE0
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236907AbhCDIxR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:53:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236805AbhCDIwp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:52:45 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1622DC061762
        for <linux-gpio@vger.kernel.org>; Thu,  4 Mar 2021 00:52:05 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id p15so23413343ljc.13
        for <linux-gpio@vger.kernel.org>; Thu, 04 Mar 2021 00:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+0XMK2C3jkeiWB9VzQQQ0cOj8xpFdNqQrK20xkK9i1A=;
        b=lSyQGH2WdOfmSXrtbCsBPnVj//cGCUNzQNd2nr1iLgsYdyeZ2UROgyYVda1T5m9WZv
         jA2MSnC5sCaprR0fPW8ymMXHYN2M6dEqr2RPA8gAtydmewhOZ2GJHpCyWdQbdYAyultX
         tneNhjNhyv3tFI63o9bv/6LGmMb3e3ExnfPvMR89aqyP8c3o6KiFKCku6legmwk0p2OO
         UbIEc/1a1Mm6ldokUTB431l3fFt5z0lXZfiwu6LEzJiNxn+m8bhju8ijAn3XefLCtWvu
         yMho7AlweWK+1JmlcbjdAANchs2FW3KyRGkcZxqaxQsDp5xnSQgI1upmqresIJZc7Pwq
         /OIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0XMK2C3jkeiWB9VzQQQ0cOj8xpFdNqQrK20xkK9i1A=;
        b=Vo0/EmMPjzv+Co1VEWf4nPTxUZ3AyB6dSojSnwwnbf1LuSHyACf4cMYyk1wSs86f+K
         X58b4Mw8SEdF2sLTxh1xT3qJvmBxJlVoFrD7PeBFbH78Gl3WdO//ONYhjc/h8NxkJu1r
         HyD1hEj1/o8ucvE1hurQVTjEMMP4VxTc3kSSBceNyOPzQB9GwYkcnzCKHXHgaZc+o1CV
         pNOjESAW0PpobgqCk4diMsdmeP1GYBgGqsbPpDaq0iojyjAaP6e6EcSueVBHwlakwTnO
         3L5vFK7eJX21hjxySKoSE+0H2GRhxEn9ZgFbrGowvui64iyPL7BCGTb+gjbWVpWvqCvM
         APRQ==
X-Gm-Message-State: AOAM533n5M1EHmpF88SRoBBosN6pPkWp/lHH7y2NFOn1fvLjDT6a6fwR
        yLAcOCXHV7xvtVggLJC3zVc3ekgx9LheYpKhb0YmLQ==
X-Google-Smtp-Source: ABdhPJzbb++Rp2hEA6RLGpqIxuh+P7Z4Bnbc7cEOCh/2DXY+1S8b4BFA/vD6pDDcq1594E0+HBqctMM4/DGjkb4ej40=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr1838007ljw.74.1614847923518;
 Thu, 04 Mar 2021 00:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20210304034141.7062-1-brad@pensando.io> <20210304034141.7062-8-brad@pensando.io>
In-Reply-To: <20210304034141.7062-8-brad@pensando.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Mar 2021 09:51:52 +0100
Message-ID: <CACRpkdZr8qrQ+b15z_zRP3wAntQeW7T0Z515sUv6e2gL9GzDyg@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: Add Pensando Elba SoC support
To:     Brad Larson <brad@pensando.io>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 4:42 AM Brad Larson <brad@pensando.io> wrote:

> Add Pensando common and Elba SoC specific device nodes
> and corresponding binding documentation.
>
> Signed-off-by: Brad Larson <brad@pensando.io>
(...)
>  .../bindings/gpio/pensando,elba-spics.txt     |  24 ++

Please use YAML schema for this.

See Documentation/devicetree/writing-schema.rst
for instructions, you need to install some python pip packages
to test your schema.

Yours,
Linus Walleij
