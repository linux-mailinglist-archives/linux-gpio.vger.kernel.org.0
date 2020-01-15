Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2611013BD4B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 11:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729602AbgAOKXb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 05:23:31 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46499 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729539AbgAOKX2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 05:23:28 -0500
Received: by mail-lf1-f67.google.com with SMTP id f15so12256456lfl.13
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 02:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0kDyGOaxaI1GMqThNHth9V/5VSfUUwVFewl6E0xy0nc=;
        b=E4jE3An78Ex2CgQPVi5COQjsp0vDCZeW6pA72WOdA+dPszIB5smmk5ZEh4dswC0+er
         OwY2CCBnl8JnyoX02lSRZpLJK2slg7BhZGnfdOXQwQN9j/Nro48Xxg0+Chv3rwmAm5Mi
         KXIfKiTiWjOg3GKkjypiRFqPKGBWBOWc3wP5bfSNKDgTRWafDjGWwvNGaXdMMVtZ0pwy
         viXP7tzxMcPo7JTth0XG6xK5L5A71EcSTOdGLMhHbmfsg7LPtruMwMMJR+kDpLKT8cg2
         rdPsl9+BkssxuDwNvACevxoT4h3y7ObHKDLDGl8vSgBhdVpG7QIuvsQIP7Z7+oEQnjkR
         20aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0kDyGOaxaI1GMqThNHth9V/5VSfUUwVFewl6E0xy0nc=;
        b=d7C9mXCpfZ9+awLRlclB2UH8GYgqGepRR4PTXY+18kkQEc4iYcbnHm3YrlNotheiag
         OAe8stE3kQVIy3PaMUQWx/9sgu3a6V0WadxyIHihyu0E08dQixDPy5v4HJFzSL2LY4sb
         yhnWfPBRYQpSg8JKozSHU+y5BwRA12Q8BdNI9Xs2Nprw7ZE0pKj4DN8CFTL1HRnr/86D
         Y9SxPcalpJpTPEdaNjZPlvUy0fGACdtjQ2ikFUQtyh06qWBflAubgEERNzRI6BOvCVbW
         iVqEpqKPrpOr2/udHXe9ltiZ6cXvugn1C6q9nG3EBlNNLD7b7jB5YFv2ZHS/dK1Q9i1N
         Y5Mg==
X-Gm-Message-State: APjAAAW+MrjZlafuugSbp1RILQnYxGNNLI48cYMK6pddhNetnShZSild
        qVdE2p9hC97rq4d9FO2Gisxyo7rmaQ1SPyY+8G0thg==
X-Google-Smtp-Source: APXvYqzoH/cbCUM9WkqwMpVkWL8950Zqu8b72maR4cxbaUVrgqLDgiiLP876Lez3Tc1YvlB2kW9QJ7yqo7qN1cw9djc=
X-Received: by 2002:a19:5513:: with SMTP id n19mr4126113lfe.205.1579083806398;
 Wed, 15 Jan 2020 02:23:26 -0800 (PST)
MIME-Version: 1.0
References: <20200114231103.85641-1-swboyd@chromium.org>
In-Reply-To: <20200114231103.85641-1-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 11:23:15 +0100
Message-ID: <CACRpkdbzqeAo9+muiTez3PjSLS3-pCocktFe2Lm8tDMVzSnr4A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Set lockdep class for hierarchical irq domains
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 15, 2020 at 12:11 AM Stephen Boyd <swboyd@chromium.org> wrote:

> I see the following lockdep splat in the qcom pinctrl driver when
> attempting to suspend the device.
>
>  ============================================
>  WARNING: possible recursive locking detected

Thanks Stephen, patch applied!

Yours,
Linus Walleij
