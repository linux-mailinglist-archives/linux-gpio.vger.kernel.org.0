Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C076125515F
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 00:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbgH0WzY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Aug 2020 18:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbgH0WzW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2020 18:55:22 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737A0C06121B
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 15:55:22 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e11so224451ljn.6
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2020 15:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qb0Ec8fDQudSKqvQFmwnBIuKxE0k0ElPX6kr8ZppFm8=;
        b=MeAnpLG4pG2Ikxmbpy6Cs2fX3iTsHcQCQzPEKb4qfBmXfZTbxuDZ6g4JEVaZgTEKKX
         8FlO10kwzHHTDncetdmSpJi3tOJnfsSngYRqcZfVB9EpeO6DmhzghwCA69NW5MUB7BaS
         P3VcgSt11sTkF4YuIng6D1f56oMTRF5wN7rYphD/lwg+wF7N/EwZVVt2h6redx6XRvRl
         zA0raTj6jLEgtK1f+66Rbr1ZudmIpRDXRXweJjjDmmiVEMiSHBmji98Fp1PqW5qoXTur
         JoqgtkbQMK1+nuke+LwvH7Ah/pH7u6nOh3R1W58mJ20j0n8GsyXP/BEvJ5ZPBsnb/hFW
         2eQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qb0Ec8fDQudSKqvQFmwnBIuKxE0k0ElPX6kr8ZppFm8=;
        b=N3ek8sKmAeI29r+fBdUZ+N0C4dl1yE7qjuFSNaiJD9GJQqe7iOYACgOgtxrGXTjDto
         CTeKcB2951Lb5cEbGJ32a4M/jiu+hcqXOWw+nMUDDd06Wlm8Lqxt3R1bXVwjGL8svHeA
         fBzpYw0MyRREJu8pMq1Ubo0cE54/wz/+IoANwj+zMdZzFLIvGI+dQovcx/WaCwVq++ny
         hQBYTETCZOn0qfAuZLJQ1selPix1QbhvjIoXRFDqLYOwFcCBCUWoHqhHavqO1f+A3gXa
         dil91mgeL0CgAdKYFlVqJ1eeYpBPHHP+DDPWQ3DqlTE1Hjg6+EUFUVzwh65px9lnLPBD
         rSng==
X-Gm-Message-State: AOAM531C9h1+vHCUf+fF85wskJa1/mZF3KG/Ef9JXIua8TExZK4nCh79
        ffXjnyY6c8PQapqvcTwh37VqNP3afvq5wnJtsKum0w==
X-Google-Smtp-Source: ABdhPJyauiwVNK3F8aHtjkSSue45fsdrC/ZAP+yDT7A1hDKs5ujzLl8YJlHq93WLvkvXZHRQtIN75jL/gr1bSV1yhnE=
X-Received: by 2002:a2e:81d9:: with SMTP id s25mr10355947ljg.104.1598568920739;
 Thu, 27 Aug 2020 15:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200804091603.541-1-a.fatoum@pengutronix.de>
In-Reply-To: <20200804091603.541-1-a.fatoum@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 00:55:09 +0200
Message-ID: <CACRpkdb9NBpS3yvvX+G8NWgVdSqR5vd6DxP2rT7GCuB0ObnvHg@mail.gmail.com>
Subject: Re: [PATCH] gpio: siox: indicate exclusive support of threaded IRQs
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     Thorsten Scherer <t.scherer@eckelmann.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Ahmad,

On Tue, Aug 4, 2020 at 11:18 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:

> Generic GPIO consumers like gpio-keys use request_any_context_irq()
> to request a threaded handler if irq_settings_is_nested_thread() ==
> true or a hardirq handler otherwise.
>
> Drivers using handle_nested_irq() must be sure that the nested
> IRQs were requested with threaded handlers, because the IRQ
> is handled by calling action->thread_fn().
>
> The gpio-siox driver dispatches IRQs via handle_nested_irq,
> but has irq_settings_is_nested_thread() == false.
>
> Set gpio_irq_chip::threaded to remedy this.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

I think we concluded we want to apply this patch, but with
a fixed commit text, can you send a V2? (Or ask Uwe if he wants
to pick it up and write the text.)

Yours,
Linus Walleij
