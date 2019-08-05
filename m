Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C331F81577
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfHEJap (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:30:45 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45941 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJap (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:30:45 -0400
Received: by mail-lf1-f66.google.com with SMTP id u10so18610702lfm.12
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2F9uPCRSmPiTo2hK4r/nBZb2ETnTkjzstupTkcKIfow=;
        b=t7U6r61gh2G+txxmAuRpaIMbfCPRaDMyyIO/DfFxxg+JtNnGBLZnUxPz1OT31MR8Ta
         u+bgHQQrsqGfkRbNhJKzPtenaidsGBnCiThyLb/tzDCpvLiVaH90rNOyUb/jua0ryyG+
         nV4IiAWVB2f+6NLuV/5aG0usZKw/35iQ1ehdXDFboqr9ZKKz1MWi+luLMSLdXOZbFmXl
         8UtI6s3GxdQ+zbEt7opMRSYufzsClWfsWpvLl3KSpb997MD0EBvKNNuqkW3X/eYjtj+Y
         IulB2m4FlF2d7DwCcYEvXhSTTA1xAcZw6ZaYLGTBZtEJLhQRfIwYKHJzat/TMsiluHdf
         AQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2F9uPCRSmPiTo2hK4r/nBZb2ETnTkjzstupTkcKIfow=;
        b=PoVgVJopuZnFcA+koe7+p2UHOKPqyn3Y1s4BdS5kkid4n0brXmwsaV86+4wDAQrHiC
         SL4iBLE0EEgaYYf7j8vx0AVnuqyFLZSBqFxZC3MeTkz8Z56bEpmYtutjC9NgbFiNA68m
         MLNaCeuR7AlWTRFtieZtwePgbY8T4oYk+VS1iQ77OSxDlIHBiHcMjrZ2YpkUWn1xB9ie
         wVlp0yg6C7+EhnQCLAogodspuBw9v5u1PQHOHWJAIy/GtKvem7mcEiODo9sEo0499Lj9
         Y5T/dQ+ZlmiVhypVuhtUnpHVE7XTg7YNZQsIUdvlddDCxdCtnaIylcez36mswxcSNqVT
         5mFg==
X-Gm-Message-State: APjAAAX2yvH4f6ily9cUPWpa0YjoJLwlFtPOCKjvWqkpASMWzcaoJ6c9
        1qL8WAcftCrZ1r4/qt5zX3nSa1x3xaOCJ7XQ3m514Q==
X-Google-Smtp-Source: APXvYqz7JBE9oQJCNW1UI+7INxOFq+v6UPMn9y4R/8owWAYGv9h3lldCN/2lgwanhTATZmfTmuSrRDYfei2zMsXMHWs=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr68650031lfh.92.1564997443136;
 Mon, 05 Aug 2019 02:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <1563776607-8368-1-git-send-email-wahrenst@gmx.net> <1563776607-8368-2-git-send-email-wahrenst@gmx.net>
In-Reply-To: <1563776607-8368-2-git-send-email-wahrenst@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:30:31 +0200
Message-ID: <CACRpkdYN249RE+=MpKz0X6Y9rX=hMQHPQmou6EMdCkO-m2LsDQ@mail.gmail.com>
Subject: Re: [PATCH 11/18] dt-bindings: pinctrl: bcm2835: Add brcm,bcm2711 compatible
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 8:23 AM Stefan Wahren <wahrenst@gmx.net> wrote:

> Add a new compatible for the BCM2711.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
(...)
> +  "brcm,bcm2711-gpio" - BCM2711 compatible pinctrl

Completely uncontroversial so patch applied.

Yours,
Linus Walleij
