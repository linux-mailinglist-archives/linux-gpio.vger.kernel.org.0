Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C91F105332
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfKUNgk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:36:40 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42457 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfKUNgk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:36:40 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so2649232lfl.9
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LuG+CdNGVUnIX1v+CNdzT7XEzz2gupVj4beywd52puQ=;
        b=sg9J/8fd/HesjKTzpK23I/hltkQdu/37PoL5zbBv2HgPDIrRYQfnCdzMBVUnCvbljF
         pYtnUGgstAYiTMMs5Ml+OhJBEz+yWXA5Q+NwN/PamWwMUvHbtLKwG9/Hd9QY5JyTLKsX
         G3qQdhOEHea22iG7pdoDLs2bPfxEu7H+rYLKTVE233CGnHTaH2NZH+WAiedNwCyssCQJ
         fPi2LMjhu8cOgd/JzLhxhZHad9an+b5eU5IjY5waEBoe30jyhRRxtUWuKl/CmdYQkJvN
         lEeZZK7eQqqXJ0j7bcm+NcmRTXHJfAOoVc8PqP8NFyWftDLu+Y2V5+/6pYN9o6YOR7gJ
         phKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LuG+CdNGVUnIX1v+CNdzT7XEzz2gupVj4beywd52puQ=;
        b=mCLP7Gr8NaZseg/Aiqb+keI4vNnzou3Op7btQbsekEsJvLLjIUMpR3hWWUVMyojBWl
         F1shtCoHWev5ufYx/eIl3qRGLcHYzkJb2HLYOCArb4YuWnEDvQgWjPsKk4eb3rKvVSt7
         mj9SB+bROF4UxwNAMIod9lthFkSteBEOV3WqkyRmBnuu4M46eSHYpF1LTqqngA2TLXvo
         zuXUM55Rs96UGbFA0o1H31yNkQZaS0jec+G26IDnF2lLt2Ll/Dx2SMIjtyYaodYr9RU0
         MBAvjUOL1jkKv7gUVCepKjgv2bT7s8Ut0o4Ew0p0jG96tTox+KzqaDCzdtAfspft9Q+8
         +UDw==
X-Gm-Message-State: APjAAAW/GGwZLFDeKoKlezAW8j6QySm1NrMnb+ezyovnQRkzRPTDpxLH
        OiKLygwSRwkDvl0NJXwfkgF8kycj+iepyAAULC+0hw==
X-Google-Smtp-Source: APXvYqzZ2nkX66u2S6j/c4+ZblLoiNIqGBC2k6lPmEaggvWz6NWuLYFIIRtPQIdjiMeAqKZtWruMXUXKs04viM0D3A4=
X-Received: by 2002:a19:651b:: with SMTP id z27mr7646879lfb.117.1574343398192;
 Thu, 21 Nov 2019 05:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20191114102600.34558-1-hdegoede@redhat.com> <20191114102600.34558-2-hdegoede@redhat.com>
In-Reply-To: <20191114102600.34558-2-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:36:26 +0100
Message-ID: <CACRpkdZuoCn4T0_NLpnu5_9eaxgva57SMdmQ0FAO+46wC=BSKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpiolib: acpi: Make acpi_gpiochip_alloc_event
 always return AE_OK
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

On Thu, Nov 14, 2019 at 11:26 AM Hans de Goede <hdegoede@redhat.com> wrote:

> acpi_gpiochip_alloc_event is used to loop over all _AEI resources, if
> we fail to bind an event handler to one of them, that is not a reason to
> not try the other resources.
>
> This commit modifies acpi_gpiochip_alloc_event to always return AE_OK,
> so that we will always try to add an event handler for all _AEI resources.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -This is a new patch in v2 of this patch-set

Patch applied with Mika's ACK.

Yours,
Linus Walleij
