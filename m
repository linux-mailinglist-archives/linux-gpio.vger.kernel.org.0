Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 465B011FF4E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 09:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfLPIDJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 03:03:09 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42375 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfLPIDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 03:03:09 -0500
Received: by mail-vs1-f68.google.com with SMTP id b79so3544121vsd.9
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 00:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=djH4P6rJZ29fmLrYIiEBXgddCiM+F+NpoLnU2C5W0ic=;
        b=qwt0z/LDUa3VNvkNIdC/63tkbfoyK0jXZJvA/wiLJjxOR3b5qhc6JaodJj9bOkRKwG
         g3eBpO1p+ioTRY7g6pGvNoi6BdBzScu+cvGTBIK/k0R1xWxQaqr1UweirkYWeNcQDXti
         aakgl0uwXh/ejXm76Y7SABdLL286aMbpCEU+qlGpGrvxRVd2s99obiVu9NY/qXHBc+Fo
         +Z21ccz5GZZNU6mhaj0JFdUyGsw5esbcSgLLn+tCDLsAfXO57NE1zVZkfARXL6i5x3Zu
         1ekV7sQAUUzqKdGXqgzjeLa4HQKpmw8mqc3DfA0WMyHxK3f2EMsA6OodJSfbY5IEXoyM
         vJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=djH4P6rJZ29fmLrYIiEBXgddCiM+F+NpoLnU2C5W0ic=;
        b=a933Ix1dnx/wupPTpKQqyU3mL1XWHkKs7PBm00xrcP3RCFqpRRunNUSSk4qyisF3G1
         WdIJoB5C/Zcg4zaab8IlPrigrEu3aPRxcYIZ6ZydEAVlSnv71UcBT5f0hAnM5HABrKxT
         3d2JIFvEoUygJkqCtBo7W3DyIrfGSCXaaBGqV0jaTJ5JGUFROniaP0fvXRtH+Ufm7qzV
         XlxlN08z2/h+gZBjzBTumtcc2njWkkoMM848SFxd1mMQhyWXZzIixSKFctLasV7geRkr
         EeaGlKrDzcTGsuKE2EfKXK8DNoWmYGtoKcGS6lLsSUNBXQJBQgF1nyXO0oBqpodzq6Q/
         pwQQ==
X-Gm-Message-State: APjAAAU3j3V4OXxNJJOTPK8T8M23Q2zgre02l8ZMqcD3Bgb1n2Jmbg8W
        E3xF+24xOCT9EwVbI26f1d2U3A62CXq4ZKp640qrHZsdI6Q=
X-Google-Smtp-Source: APXvYqxZxtF9uyW/0SNV6/rz9rMvjg9NIlP6IK+cGDZLXzWXTlUoLJrRiVnQ98z3asU2QxPF43pmYU0H04Ya09B4Yv4=
X-Received: by 2002:a67:1447:: with SMTP id 68mr171823vsu.115.1576483387832;
 Mon, 16 Dec 2019 00:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
In-Reply-To: <20191206170821.29711-1-ulf.hansson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 09:02:56 +0100
Message-ID: <CACRpkdYsVBdbNQg=T94=HJUfJwcoMeeK=9Q_Dac18n3ae-K4sA@mail.gmail.com>
Subject: Re: [PATCH 0/9] pinctrl: Consolidate some pinctrl code for mmc
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 6, 2019 at 6:08 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:

> Ulf Hansson (9):
>   pinctrl: core: Add pinctrl_select_default_state() and export it
>   mmc: meson-gx: Convert to pinctrl_select_default_state()
>   mmc: mmci: Convert to pinctrl_select_default_state()
>   mmc: usdhi6rol0: Convert to pinctrl_select_default_state()
>   mmc: omap_hsmmc: Convert to pinctrl_select_default_state()
>   mmc: sdhci-esdhc-imx: Convert to pinctrl_select_default_state()
>   mmc: atmel-mci: Convert to pinctrl_select_default_state()
>   mmc: jz4740: Convert to pinctrl_select_default_state()
>   mmc: uniphier-sd: Convert to pinctrl_select_default_state()

For patches 2-9:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
