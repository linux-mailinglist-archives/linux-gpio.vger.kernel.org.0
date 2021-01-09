Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678252EFC2A
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Jan 2021 01:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbhAIAa3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jan 2021 19:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAIAa3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jan 2021 19:30:29 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD79C0613D3
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jan 2021 16:29:45 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m25so27007494lfc.11
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jan 2021 16:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3i+smjmiZrNQ6ALVjxaHxw8JP/5oUykBsdW5QSoLV4Q=;
        b=DIBrcFXPMWyQtndHES5B0IT5fUM7nKlkvQmsLP2vicNIOuDc1bO1qSaI2VdGz5NCGt
         itkkOgfHRWE5G3scDGm5mqFpNGxOLfspxcERbeL78sjeKfzz/RGr7Wxzbs/7B5d71uVK
         PH4nBRakTr1/vtQGskDGIuyAY6jehtpgQjljTVeCFBuNzRQGIZMtXOYnyMaALJHEKILF
         tXYPXF/3Df8I3jmGCOs2ehp8Ehr7LS3dBe3pcV0a/u9/6rJYXjZ1gLr/T1SRaPKqFDnt
         5Dy8rwY8EomRfteq9HEy3suKiN6InDIo8n9GnBUZwn8a+MvCpuPdF+Lxch82fK7G4Ge1
         WULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3i+smjmiZrNQ6ALVjxaHxw8JP/5oUykBsdW5QSoLV4Q=;
        b=hXrgBd8w5m861gvsEQGcwS3LMvhSwsV4DVCjexhUGsMn1u2f1PcE12vflP0+cIjCEZ
         JMNQ0vK1VCxJH+FlUvmWbs4jcDvoLb19lLFcLPq5BTvVmiTBDoi12W0XTD3+ke606AfS
         aKEB5pZrNlCyE0O2cptJQDcE3Qyge8HkSdSXhFfaqRxAF2wrhq/U+v48Vn9EesKlGnU6
         uOLseHOnoBprnf5ST+U094nRb5uYvDtVlImtVCXYcN3TJ04A8bH6JssjmfLlPkcHxMH6
         c+c1JGSyQ4Rc0tnV/9FS9piVC+KjRNlZ7KUuOipQqV+PCe2DHqG/6DqJILJzURaCMesF
         ig4w==
X-Gm-Message-State: AOAM5302ZQxluJhhJhNeRbNynVlaavWIWDm4LGhhRKta/vDECRXTxbv5
        g32KGjPAshHBkAtF+PxdDNXzDZ7az9hTu53h50XhjA==
X-Google-Smtp-Source: ABdhPJzEd6w8RKjS33WFED5vM0qHKxre8zXpgFG2b+4qL8JcvPAzjP5+2E8fbqEhhYoJBSMi5C/GSRxL7jBujiofSC4=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr2878100lfs.529.1610152183785;
 Fri, 08 Jan 2021 16:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20210108102026.2024478-1-geert+renesas@glider.be>
In-Reply-To: <20210108102026.2024478-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 Jan 2021 01:29:33 +0100
Message-ID: <CACRpkdb38a5kTdbt2ZXueJjqVp0LbuRqWTgYNZoxrWnFZPAe-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: rcar: Add R-Car V3U support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 8, 2021 at 11:20 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This patch series adds support for GPIOs on the R-Car V3U (r8a779a0)
> SoC, to both DT bindings and the gpio-rcar driver.

These all look good to me. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
