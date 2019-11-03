Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1272DED645
	for <lists+linux-gpio@lfdr.de>; Sun,  3 Nov 2019 23:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfKCWfz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Nov 2019 17:35:55 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35602 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbfKCWfy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Nov 2019 17:35:54 -0500
Received: by mail-lf1-f66.google.com with SMTP id y6so10811326lfj.2
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 14:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EHtdTbqBxd9JTKBkMBRWhQaNOyW/MKSbbKYTSzXac2s=;
        b=RW20B4HiwisBi+QgKxV78+/7ahWabvD2Ujxzw9C0QLTzC4lFBaXW/aDjyAQ4YzYlJm
         f3LfHiRVzK5cZLHWD9MeQlwlfdoZAjS0ICQyJePB3LKjdzNjnECwfLNrAWcp5S+jkwtA
         WPDyoXQ9ItnxCrxoSpzzcO5bYucDWQQTO87rEgzoli2PkRZMdJK111r8tuZVp0oFLzQK
         DftFukh3yFDXJqncuJ8LLANgiTMpNxAgOfEBLnDayf5GlGhIxOjJZGUaRg2AW3zSvU5V
         2xdXlUKsIfdOzrVQ1iVZG87Be66/5/OwWDKbuMP0yL9EO+wmE6Qz/J/7Ur7JDRTiaP9v
         RHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EHtdTbqBxd9JTKBkMBRWhQaNOyW/MKSbbKYTSzXac2s=;
        b=h1jkigIV0nAie5izK88J9Se0KrkyiFfuB1mXJK+TNfi4M3Vy5pob0IhsBURpgAC17C
         RCcGbKz69Tgr1//vNWhFlUjMSEywFXh+ll4lm9vjZ6juSW1ciizxlz7Dd6aIg7wcjQTA
         vyOGIrtLGznRSSturNe9QxwUfjt+xYFBpQzz7ml7lkyzlLsjQHoC/6f08w8l6vrZng3U
         IdHSGuuCX6mQdbsx+r2i3ZJAvz4z9ypOlVwkuxHT/0ZT3P489RX0MjL1bN/nhKKcuFz4
         7o5J2B2qLWiV7OoIJQZiAesdUj8H3ylVxu55kcDIqlHqewe0FsrLlsO/Dc/bCXUpP3dK
         MfTw==
X-Gm-Message-State: APjAAAV/KVy0AYiFai+o1MxwVQ/nS7BdOHF7gVpxZC0YrcPJ8uKGWYP7
        aA9hOHzDnjeICz9prMQ1YeYtqJOTB45UwJkkEDC8TQ==
X-Google-Smtp-Source: APXvYqzgwn2ea3wgkeAplcvs+z5xFC8B7B9ZgEIYnEjFBzdQK4niVCmNaMSjFFIdFzKBhXKld0V8HRZoBmyNEWVxAhg=
X-Received: by 2002:a19:651b:: with SMTP id z27mr14242065lfb.117.1572820553199;
 Sun, 03 Nov 2019 14:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20191101092031.24896-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20191101092031.24896-1-codrin.ciubotariu@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 3 Nov 2019 23:35:41 +0100
Message-ID: <CACRpkdZh-gV8T6cN2R9DrLE32EPGk9g07z_K00W9n+kbiSW7Wg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: at91: Enable slewrate by default on SAM9X60
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 1, 2019 at 10:20 AM Codrin Ciubotariu
<codrin.ciubotariu@microchip.com> wrote:

> On SAM9X60, slewrate should be enabled on pins with a switching frequency
> below 50Mhz. Since most of our pins do not exceed this value, we enable
> slewrate by default. Pins with a switching value that exceeds 50Mhz will
> have to explicitly disable slewrate.
>
> This patch changes the ABI. However, the slewrate macros are only used
> by SAM9X60 and, at this moment, there are no device-tree files available
> for this platform.
>
> Suggested-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>
> Changes in v2:
>  - updated commit message to reflect the ABI change

Patch applied with the ACKs.

Yours,
Linus Walleij
