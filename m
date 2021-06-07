Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A478C39D5A2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 09:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhFGHNv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 03:13:51 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:40534 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhFGHNu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Jun 2021 03:13:50 -0400
Received: by mail-lf1-f46.google.com with SMTP id w33so24591635lfu.7
        for <linux-gpio@vger.kernel.org>; Mon, 07 Jun 2021 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJqZi3n7j9AKUs/vG9dNnCAv8v6cQQzyBgG+YQYc710=;
        b=heIRpxVgLgVE9VbdvxJ9bVlbUFs3IX84r8llXAY0+5b8E1n7RAOm1a1166iWY/gOLD
         XNZxJFIkJuMW8RVuznJEipdDCSQJy5E+KgniSp7IQJREoBsna8hcz1a5SNFKQPui8rlV
         1M+8FU5U6Z8ol8maP+iXKxQbGasIkt1OOngMn6ssuSQydwLBYoEoFEhG/jB3vMor/Yg/
         rKFedQHC1A4TagAs5f5HunysdBj4CAlO3GRJzHS8zjVg1jS4CBcmgpjm/3NKKiGdZqqz
         G10Z2zZcFVddak+M2tb/wU6iy6I2xXgkwFQQSFPN8wyaPgHWKZem/NWPJHIrmkR+nbAp
         U9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJqZi3n7j9AKUs/vG9dNnCAv8v6cQQzyBgG+YQYc710=;
        b=tqFhf27v4HL4t4mjeisWImmtkfgo7k5ig/5VllzOTWyc1KNN2Wg0+VXCaetrRJWyAT
         FTVeJ97/vA50iLMhuhJikyipb+HxRlCR4v2kkS6kQRjMNhVlw8kE0WS9NkBKaTlIS+mh
         sltHcXpH0Mdq5WSnY1GN+E+cKVgV6SdSpg5/5ZmypmDb4BoqC7mrlQ9btvfULv6mfgMe
         i4EvlLlDwi0nHoIf4SLomBq7CJkzszY+WPLkvw1er5eJ84tMUOUjNMRBqX3IADbPRq+1
         l50GgYWoIbf3Unwbnf5k73TQTHvoFaP4hUB8jVcRIkZrqQhVA+BUORVgfbzZWwjevHKr
         Q3ZA==
X-Gm-Message-State: AOAM531QRA7lpfMiSu248NbIPdiT9oIaxwYuVi+ki5156vWLbkXVjRWd
        +XSow/cRVvL5+9i8w0ZF3QKwBLhyo56vBqst2s8hPw==
X-Google-Smtp-Source: ABdhPJwVTqQeeEbNWKQksEGrk3q9M/AgF1nnmc4hYNxFcVK0tYr6p+ohPNX2kcVIGDfNigWTl/LzEZ/LN19HxvF2LHI=
X-Received: by 2002:a05:6512:3241:: with SMTP id c1mr11434271lfr.29.1623049858937;
 Mon, 07 Jun 2021 00:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210604055536.20606-1-sergio.paracuellos@gmail.com>
In-Reply-To: <20210604055536.20606-1-sergio.paracuellos@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 09:10:47 +0200
Message-ID: <CACRpkdbmu32csSoptceUcaVYxXSFwk316k5Ru09KCodvLXMOPA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: ralink: pinctrl-rt2880: avoid to error in
 calls if pin is already enabled
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 4, 2021 at 7:55 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:

> In 'rt2880_pmx_group_enable' driver is printing an error and returning
> -EBUSY if a pin has been already enabled. This becomes in anoying messages
> in the caller when this happens like the following:
>
> rt2880-pinmux pinctrl: pcie is already enabled
> mt7621-pci 1e140000.pcie: Error applying setting, reverse things back
>
> To avoid this just print the already enabled message in the pinctrl
> driver and return 0 instead to don't confuse the user with a real
> bad problem.
>
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
> Changes in v2:
>     - Fix commit message s/is/if

I just fixed up the commit manually instead, no big deal.

Thanks!
Linus Walleij
