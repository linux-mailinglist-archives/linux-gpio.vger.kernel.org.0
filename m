Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B5746F8EE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 03:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbhLJCId (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 21:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbhLJCId (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 21:08:33 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C63C061746
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 18:04:59 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso8255694otj.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 18:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mk4inzLW8Nyomvz0lak/GtO/CGQzqzuOwnVgsqNwCQI=;
        b=qn0qlQ/bPPEacAJ+PQi0Et4rabWTmURuuO4Tc0/Od9nlXX+zbCQnAvPxRNcnWQXplH
         asYldO3ujBfe5CzmGIsmgJtHJ2zhLvD7W2/er0RpvRosq8R8wYBVU05x3odJTertmWDw
         kzyjVQiwV6Kd5RFy7Ip7wjkypWSSPTWCY3ZBnNRbD7ClexTUynp1aruiM/TUzzv/xC0S
         ilXuITXUkYATsWGGWQp0SBAfM0S8YIPi6d5kS4RtxUObu0F6bEOVdo6YnzeJlwjbNMMz
         rl54efomNmzAjBIjc/fRw9bRMP1uT2EFtE7cuI4bk30OMLGgNpCr0QTfwuufjFW1JYqg
         /RYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mk4inzLW8Nyomvz0lak/GtO/CGQzqzuOwnVgsqNwCQI=;
        b=Ey8e2wYbIagOdE8eeJ+2YdyUzTDr/D6tKrxAmw1d8dCQL2poxKHECT0VqAFIJh9A/Q
         0kIC2RWCFPv7JZRONZQXHc0dLPy8B9/YpWMKfx4qcfCLMdkkvba2LUU6BnF+/JaX5pNP
         nGySAwhzeeNISoS3Ng+0ufy0CwIm2/l+2KFcbMNEIvsnq0rcF49s7JC99I0iB7YbJfSu
         6F62J0kTSkfh9xcWfg0BLZnD28FduLuPgJxa0b/qU8H1cPex4RVdVLjb5DmtlOL7a8Re
         wmBpqx5ZzZhK4sHQgTxrzyJxZZllrYT851TMne5A7C8j1ZfZrHVebeRLYokMgPGz+eFS
         EyHA==
X-Gm-Message-State: AOAM530fTmMV/ltRjLyuCqIIxyxeHkGsjdEjl+YPudFBaht8h/nkhYn+
        aRfgP/POCbpvKXk8g4e23+v/jHP84W60zwORvdL/1Ozd33WL/g==
X-Google-Smtp-Source: ABdhPJzLKqHHsTQQ+/DZQJn7ag2tMY4yD2GC75lI7BjHJO46vCOl7pBNn7BESbjJFbsLDzye2ZYwZLbcWHnoSS+csIs=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr8719458otl.237.1639101898426;
 Thu, 09 Dec 2021 18:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8sCVkbwYeVGsQpv2q0OjwUSB_jqmjPptHN-ENSdU+pT1Q@mail.gmail.com> <CA+V-a8tTm=n+TuE5N1Ptkvh6n1sYjSZWpQpmY1F5RiwK-ocvFQ@mail.gmail.com>
In-Reply-To: <CA+V-a8tTm=n+TuE5N1Ptkvh6n1sYjSZWpQpmY1F5RiwK-ocvFQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 03:04:46 +0100
Message-ID: <CACRpkdYDNQGWr8u18K7duy9MUd-njuyFQkXvZ4VQuvxXNOOicw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/7] Renesas RZ/G2L IRQC support
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 10, 2021 at 2:09 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> I plan to post a non RFC version soon, can I have your feedback on this please.

I actually cannot see the patches (just this cover letter) I wonder if
they got stuck.

For
gpio: gpiolib: Allow free() callback to be overridden
gpio: gpiolib: Add ngirq member to struct gpio_irq_chip

I trust whatever Marc
says. If he agrees we need this, then we need this.

Yours,
Linus Walleij
