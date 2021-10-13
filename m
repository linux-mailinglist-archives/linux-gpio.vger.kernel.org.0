Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F8B42CF0E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 01:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhJMXS7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Oct 2021 19:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhJMXS7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Oct 2021 19:18:59 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2403EC061570
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:16:55 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z20so16720799edc.13
        for <linux-gpio@vger.kernel.org>; Wed, 13 Oct 2021 16:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tiCnQHVrdBabcToDZIXeMhi1lk1+r3rn3k08DaY++3k=;
        b=gXp7ANWKXJjGzPX8TUlAUpIrWwa4yllom1qQmDKgBHfENLyvHx5P2aT5JqhvjUHg7u
         eUAsV84owtZ5nGVG3xN+XfpnyICgDndXnGFWVxGJZnI9ZotQk02eFB4tTTSoi4Dcmui8
         LvWYwMAnRZtOfCJ4/5YgIvAne78HKKPSGVZQFFNXrWDJvYC4VrBKSAXawZsQjE6fFBrB
         6twNb9t/gbLWUzoVKSkY/GZ/OjS9w7NApeAyWkEjifx641uWxcq5EjFlRNVov/Pa61uU
         cqqM5CUENzoh29AAnwd1oSryY7ZLY9zSG+KKJHTCvUFgb1bSNLps8T/RBwSOhC0sUzbz
         ZskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tiCnQHVrdBabcToDZIXeMhi1lk1+r3rn3k08DaY++3k=;
        b=B9QayYjULQgDF3TpyBTdat2vGzJNPRAKyc3FubfY4WpJqxGl3Fjua+wxw8eKfu/Rdt
         DN7yGWOV7gWPozUIW1GTro3CeYBMGECtZ2UvHTyOXu296T47wZLJgP8eZz5UACitw9s6
         zOcloA38cAdJZS6bY9RE2its2ydGYTVFW5iBF1UJB6+MO0aziqcn7vbsZWu4e3cZlNFe
         cFXFdST6TM3Jx4st9tzHwa8OXFYhb6MYW2zj5je7N9Ogr6siqMaEQku3pUS2y+vpIOxS
         2EZFpHQMtEq8DRX6cDm0mobQNkR62NDNnUqDpPTSwBMvg1y1n4Fr47ZyMnNd6Cli7Z0X
         UtRQ==
X-Gm-Message-State: AOAM531jWQtEwrTA9UF/N7kEIXJ8a/dKA9OMhhnwm9Tw+XeJt+d75PCS
        C6pSTc5rPF+vyo+tN84cPk+6oIyPiY3naY5EtE61+w==
X-Google-Smtp-Source: ABdhPJxu0km3cFQTmT8RT+LuC6goiXXQsKlnz/Be1AH+gs6vANTgQ5AtYZTSuZjdyka1+YfqWnTR3cs3oqVz8LGFO64=
X-Received: by 2002:a05:6402:1d4e:: with SMTP id dz14mr3538927edb.348.1634167013772;
 Wed, 13 Oct 2021 16:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211008122517.617633-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20211008122517.617633-1-fabien.dessenne@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Oct 2021 01:16:42 +0200
Message-ID: <CACRpkdZqioY0uLJz1yQfxwmKreuJcwkNh_PbJNZ2c-Eh0aMPbw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: use valid pin identifier in stm32_pinctrl_resume()
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 8, 2021 at 2:25 PM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> When resuming from low power, the driver attempts to restore the
> configuration of some pins. This is done by a call to:
>   stm32_pinctrl_restore_gpio_regs(struct stm32_pinctrl *pctl, u32 pin)
> where 'pin' must be a valid pin value (i.e. matching some 'groups->pin').
> Fix the current implementation which uses some wrong 'pin' value.
>
> Fixes: e2f3cf18c3e2 ("pinctrl: stm32: add suspend/resume management")
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied for fixes.

Yours,
Linus Walleij
