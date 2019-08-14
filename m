Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6295E8CE3C
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfHNIVi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:21:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39575 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbfHNIVi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:21:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id x4so11861074ljj.6
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2NizU6vc5EkP2sSlLY3lPz73A+RgMAkOCKcvc8aSTPk=;
        b=a6sl5hkHU9NM8E4RM7b/VggMsrosREkVZHP89EstJFcybVhE4eeFnkqDMqQfor8JJw
         Zb8lXzWfaBlr5AcxoHYbp2oOrB78fSknDRuEOgJENyjlDhHr+XNEliW4aEufobVJpagr
         ePJ5qIzUnWs5GISroRGdjlcLnUKfNhjBY6zpN1RdKEUHWAB8b0qvK5QAxbNBUJOXE3tZ
         bw3571ge1zsBuf+vfpJXJwHRr0j9P+n2bH9WVCviIIYPcSGSU4sUmGvxO+FG4oH9kCVK
         Jo4ndsbxz6wDD+YBshWlA81v9gs+Cy1gHSbGbHHQ6ATSg0Qgby1daMDHEuiMxbfi3qsh
         HBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2NizU6vc5EkP2sSlLY3lPz73A+RgMAkOCKcvc8aSTPk=;
        b=Iv/MPFdX4/kny/q2Bb2zEXRMZoOX1gsusGQiHiyqrmtzUMlLopvwo7ELWR9sXsBtB/
         GO/xx50QVrzPoUK/p02HbGfTt8+1hsqZKnaMSr46WBWlLsi+7uXt1muL1sVEpSp9Nk7o
         HGO0NnvpJKFc2hXPyDD99auG6jcjhb7/vLANqHDNQkKkBcDuiyaV8LgtbuRQcn81TQ2H
         qDrVhmERYV+GvlK7YqNp/O4paTKABXfeTxvaokOwhWyFdBa5EzbRbY5BWhJ8H0vIMh2j
         sgvjAF+1QSMeegX4Z/VDDXhVteztUEnDEAWhb3qLuwZk57KqeQYhdzzlFv4Sm7rQuKdf
         WWBg==
X-Gm-Message-State: APjAAAXAcuJjay3km9JFEIDL2Hrjs0sF7icA91KGbSxrJAE+JDzf+/wc
        uv2x3bYocjVZuzCriTTNlGA0yrrVFNjYif1k9QzljD3TRT8=
X-Google-Smtp-Source: APXvYqw/KdOv8DzTmbxQAxMesntD6oRCGg5Ol95hEEFITE+e29hp0r0mT5jHRY2DGS3PkkUZ3/C7oGrL18KXON5jhMc=
X-Received: by 2002:a2e:9f0f:: with SMTP id u15mr14696618ljk.54.1565770894967;
 Wed, 14 Aug 2019 01:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190808123242.5359-1-linus.walleij@linaro.org> <20190808123242.5359-4-linus.walleij@linaro.org>
In-Reply-To: <20190808123242.5359-4-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:21:23 +0200
Message-ID: <CACRpkdZkO-iXy8fznnJ+USvt18cbehbfM2TexUYfAjFxD+fkOQ@mail.gmail.com>
Subject: Re: [PATCH 4/6 v2] RFT: gpio: thunderx: Switch to GPIOLIB_IRQCHIP
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        David Daney <david.daney@cavium.com>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 2:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Use the new infrastructure for hierarchical irqchips in
> gpiolib.
>
> The major part of the rewrite was dues to the fact that
> the driver was passing around a per-irq pointer to
> struct thunderx_line * data container, and the central
> handlers will assume struct gpio_chip * to be passed
> to we need to use the hwirq as index to look up the
> struct thunderx_line * for each IRQ.
>
> The pushing and pop:ing of the irqdomain was confusing
> because I've never seen this before, but I tried to
> replicate it as best I could.
>
> I have no chance to test or debug this so I need
> help.
>
> Cc: David Daney <david.daney@cavium.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Brian Masney <masneyb@onstation.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog RFT v1-> RFT v2:
> - Rebased.

As noone seems interested in reviewing or testing ThunderX
I have applied the patch, as I think there are ThunderX machines
in the test farms, things will crop out now.

Yours,
Linus Walleij
