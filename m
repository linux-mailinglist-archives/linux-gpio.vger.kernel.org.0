Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 298A9105325
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 14:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKUNdn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 08:33:43 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45604 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfKUNdm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 08:33:42 -0500
Received: by mail-lf1-f65.google.com with SMTP id 203so2625058lfa.12
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 05:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ayr33azDG5K9t44zml1H/6SXUfSnIkQYrJwinHZ+DQI=;
        b=cbZJoAS5ZqVSucEeAtCgt5yZO7IWmGGHSnXWJtFPmuBc39kv313TsQ/sEIYj4NyPVW
         OaY9krQY02fHpqzzz5DjKZiAa11IvUb+wJl3MVBHTx/va7MIxjStmRDRx5nUElgLimYr
         7WBB7DxVy8gmD11f3y5v6VkpmWY8KPxQHuqwjRAIXjI3lBlVxVByHPhrjdbNlEUmgRbz
         rPYtT0EkI3HE7GyNqOxZwdDcJsMKyzi81g/Rls9cOswmkVMmvRAzkRff4THU4tEhYjfo
         2yqZYbD2bjf2ZtJPNKh5EgmnHKanFKkr9bUQokew3IaaZo/B2ewbJVlVNhsjpe7IdCwV
         f8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ayr33azDG5K9t44zml1H/6SXUfSnIkQYrJwinHZ+DQI=;
        b=mOHJqFLaw7LcGNYtk5mDj0wblpZl6GaIqPIuNQ2mGLc2zAUTOc/8az30Lj3WLpBQYx
         aWrxCswphXHwjahJNQ3Bv+C1jaeAFg9H+PiXruYLaEI1lRI5jFHeipt+e092Nie4wvYB
         dCKd9U+A8Qur/QM3I5Wpojcqz7XnQKm/lkv2J5nUkcqt/Qdg2s/MjvcuU8YNGyUQmGMc
         c95lLDV0pKR8CqikJhVbShdTYgvB8CFLpeAaGzaHvMAI3CqujatsBPpSPUhPTaxMIaw5
         BaaEwOxR5CNgOD9bqqXOezzOB1DbLcYRlqCNmo0VDFZsky7EF0JTYy2OAmN1XOzEr2sL
         SVkw==
X-Gm-Message-State: APjAAAW0Kx2rpvDI0GWu3qRwpNNtXMSFJ56d8H4w0MpM0iOXwCCjOVV0
        TPgfOBcZ8yqupT22esUft/tfTRUspnOHa1lX3ckUlOeTggbCLQ==
X-Google-Smtp-Source: APXvYqxQmOfoYPWhSLur+b4vBiIPAiFkN7+KZSB9b9SkIWs/l2mTelhTrhoXZG7Et0WplhTcYmd7M9pJY1XsO/1qbzg=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr7369327lfi.93.1574343220488;
 Thu, 21 Nov 2019 05:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20191113071045.GA22110@localhost.localdomain>
In-Reply-To: <20191113071045.GA22110@localhost.localdomain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:33:28 +0100
Message-ID: <CACRpkdbDz6HSZZPFB4cHMO=C9WQ7O_UQJAgO_2zyALEYzEEVsA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: rza1: remove unnecessary static inline function
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 13, 2019 at 8:10 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Having static inline oneliner does not benefit too mucg when it is
> only called from another oneliner function. Remove some of the
> 'onion'. This simplifies also the coming usage of the gpiolib
> defines. We can do conversion from chip bits to gpiolib direction
> defines as last step in the get_direction callback. Drivers can
> use chip specific values in driver internal functions and do
> conversion only once.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes since v1: Subject fixed as pointed out by Geert.

Patch applied.

Yours,
Linus Walleij
