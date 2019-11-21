Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F64A10534F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:40:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfKUNks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:40:48 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41691 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfKUNks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:40:48 -0500
Received: by mail-lj1-f193.google.com with SMTP id m4so3246639ljj.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eCCZXy15Ke3YP18ucAIqbA0mWkR+WxJUSl5t9RH/ZkA=;
        b=j+1m2oyq/F/jUHmrcPk5/rdBGps9GSTdgzBspP4/OUaMClsP3ukcHbu0Z7HRroZnDC
         k9fcepsG0+itsdQrbqCB+JEzPg1WyLTEXeA6qfS+2qaEOLcJwY+cx2yRaRu7vy48SpZz
         XpeB9A8/wRiqL8R+ZmocoJJxfX3olRK9euZxnRYcChRv8nQh5JS8qMkU2OWnm7ISFmCy
         Jow/ruuO2u1k0WA7AxEHfs/MWYNXpkfvbSCe498Ssw7T/+5n5Pl4rO0TKy8UVrAHelFt
         L75/Fg+IiNHaX/8DfenpUGVs4YY6oY/LB/9K6r53cwXtRQlj5lmBv1DdE4AJxQCV6AJf
         8KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCCZXy15Ke3YP18ucAIqbA0mWkR+WxJUSl5t9RH/ZkA=;
        b=RHe7GNczPg+zSZxZoxzgS+JB2YoCSLrRYL+VZj5jntI7Yvib+iPWEzGH3b53E5cLVE
         5985zfgx5Zr4dqqZ2dw2jQdxQlXARjSfpAI0s2hqO2VGM4vXovi2ljBSmr1lkDKc+gT1
         crSRZuBWT+xKaHVBTVi2JQusDf5ZQlxDt1goWnVZs4Soli2Bz2UxB1HMBgi4TBacoz3Y
         vUXiQWkmXivsXq1Hq4gOLJdKSI9j2rpNW+0hR08Hwgjok3YsoaYeHv/bM/TjS/HinJik
         hSklyS4eNHtPjrayQzzf3FHB1e5Q0Y6NoqTQnjZdy3KMZb43CGwZUjuTemBaLBI476fx
         BsSg==
X-Gm-Message-State: APjAAAVSfym+cwT8BC5OmNtNRiDPOub3Kasa1kKcrv8BOFOCHbC6xaVl
        fTljY+Go/81vcn365sZibSP4tiUvfcUC4Hw1+B2zSA==
X-Google-Smtp-Source: APXvYqwojWqPLg30PlZCllqtNJPsVF7wdnwAO33m9dMefIGBlzSQsjboqg52gVh5Nn1STfX1gDwSSonm0PdkMjtWyE8=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr7550745ljd.183.1574343644918;
 Thu, 21 Nov 2019 05:40:44 -0800 (PST)
MIME-Version: 1.0
References: <20191114100804.15148-1-hdegoede@redhat.com> <20191114100804.15148-2-hdegoede@redhat.com>
In-Reply-To: <20191114100804.15148-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:40:33 +0100
Message-ID: <CACRpkdbksXTfaWJ2B51SWZYBf6itqYKxfUfAAtqt0hXQsUt_GQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] pinctrl: cherryview: Add GPIO <-> pin mapping
 ranges via callback
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 14, 2019 at 11:08 AM Hans de Goede <hdegoede@redhat.com> wrote:

> When IRQ chip is instantiated via GPIO library flow, the few functions,
> in particular the ACPI event registration mechanism, on some of ACPI based
> platforms expect that the pin ranges are initialized to that point.
>
> Add GPIO <-> pin mapping ranges via callback in the GPIO library flow.
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Patch applied.

Yours,
Linus Walleij
