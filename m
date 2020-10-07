Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0955F285BC9
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgJGJTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgJGJTn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:19:43 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE63C0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:19:42 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id y11so1465963lfl.5
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HearCtm5CzMBeIR1tHWuaWK0TC9md3N7NC53VUCWgV0=;
        b=tvUxN56NHfUl5/2EqKur2+5/omgmNucchkaRxEodbK6bpaQJjNKooi1cKy6/DPqoti
         xQS1dAoFvYB8aBcz/kzDREA4vnTD2B01zVEpGBDcgI7/SDexYB04zwEAE44CFU3WS/UZ
         wsS7dGd3b1XMPekBf3XdUa5uLsR2Z/oUydBoVU7VC1rz4bSrNdJw7fIBAUC4lTEbJoGF
         6hAXcK4Lexczm/fx6zvkHbZ3l8JNoh15PmmSDQ4PQ/PP+Xq47/BeSDLSDjGfSVnfr3SM
         hoqML1sRnpG9hSYIGye/ASCyZzynNZZwxVq6swk549j+//v5kRBeuC1SPPNeVv0v7HyG
         HstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HearCtm5CzMBeIR1tHWuaWK0TC9md3N7NC53VUCWgV0=;
        b=B5ju5o9bUy/jmR/po4iDp5Ogn1JDikUj6vAfm3sKjfA3em3AL8xqVoPpB0V09wgN8p
         J3w9qPOW/3IxOMisTN/wx9ttDVBSlVzExRC2dLE30vERFoQ5vgEC07L8mY5NDmH3qtDi
         z7fI5gbeOnMAqvoJO4FFOGnFWyMLAtxEBCnEyCfksX9jS3rWr2mjFmmuFpywWMciXD4s
         dH72b6y62wl8ShOeEDmtSVYUeEex1BUncV0sKWu/BLy4I/ldSbXCQyuMgYLOPRUTiUm/
         cUkmth0ZYe7eVUlArK6LGh3upskBgNFZgYI4b7HKRVFJgKvuodYjlLgHuAVOMwxgwgHi
         rbEg==
X-Gm-Message-State: AOAM533DkW0G47kUe8fCjbOjWPl3a08eMk9dneqb3QW0IqappIerCgDL
        xHhDJTO+46vGNZu5SIeZG1uWvMp3ILjNMtrwCidB1Q==
X-Google-Smtp-Source: ABdhPJzztxuaghX7mt6AZbNjuI6U2enA74cptLuZ2N1KOPduaNmzcuFfhw0yARzqithV/Y+z1T9IEU7p48uS5wXZCmM=
X-Received: by 2002:ac2:42d8:: with SMTP id n24mr594980lfl.502.1602062380977;
 Wed, 07 Oct 2020 02:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201004162908.3216898-1-martin.blumenstingl@googlemail.com> <20201004162908.3216898-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20201004162908.3216898-3-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:19:30 +0200
Message-ID: <CACRpkdbTw4UBw02RXX2prju45AsDZqPchhz=gdzsuT-QjhYHVw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] dt-bindings: gpio: Add binding documentation for
 Etron EJ168/EJ188/EJ198
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-pci <linux-pci@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 4, 2020 at 8:00 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> +properties:
> +  compatible:
> +    enum:
> +      - pci1b6f,7023
> +      - pci1b6f,7052

I think it is better to let the PCI driver for the whole hardware in
drivers/usb/host/xhci-pci.c probe from the PCI configuration space
numbers, and then add a gpio_chip to xhci-pci.c.

Thanks!
Linus Walleij
