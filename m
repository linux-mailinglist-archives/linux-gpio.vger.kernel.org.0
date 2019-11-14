Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00B5AFCDF7
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKNSn6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:43:58 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32809 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNSn5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:43:57 -0500
Received: by mail-lj1-f194.google.com with SMTP id t5so7836565ljk.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2019 10:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0akErYpVPfvA95ks+ZVK153tf+Gz8y9EaErbWtVlmI4=;
        b=OWtGNSoKK0V3J02veluyxQWSi82ISrP2cFU0v00xGFsDqP5uCRLsRSU12PZN0pHXZe
         NSPvOXGxGPVUJXT5FpEfQXPlxEJvx4b3IXbSJf3sb49wtuP2ZjmMfdgaTAeONOtAj8Zm
         6aaMq0yT1w5IJhuiFyl9BIpNQtjyeS8Uc2cDKpsPHGxgP8I5rtUnAaCEfu6BxdDkTGYo
         Matdu/uURSvuMhjmGnKat+vRucBCB9EgwsOJYFuPbHDpPY/icndFOXScl7kM9M3IXU9B
         P+BtwbcSht22xxU2k83z3ZCHHMKuYD47Tw4rCY6bHywGS8TCqM+RTa5d/b+2Dkp3OvoU
         gxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0akErYpVPfvA95ks+ZVK153tf+Gz8y9EaErbWtVlmI4=;
        b=TaCQfui63LhmiieJ1fN/s2A8Xzs6nmf5oXHK8XzMK7k+6WKEJA8Efjrx1GKwyg0RTF
         u71hOUAYxuVb14ApaMvyLFrUuvpY74ssdPn5eE2vNBKqOoSYlgK2TPx8EOgJ2n+dE/zA
         3PGa+CncjnUf/phj3V785a9UIMKmJVo92k21B8zTW553xWdLGV1AoV6n8UTK3FYcmDTy
         /J9yThBCtD2jXCps2cr1FKFTTB9iUCt0OrFeI79nmSfj/kZ50DyAFjZXutZEXSl8uVEN
         QRni1joMqca+0kNN9g6n+vCeNtERCBXs1bfs5CIo24NKC5Iw5Q2xTptUO61xoI/UiG5p
         YwEA==
X-Gm-Message-State: APjAAAV6FHg0v+ZBEJNINIeGwVjKDsYx3NFK2hciL38lDfqqXIDv2yL0
        Qir6zL70G6CRTyjkZrAh99bVcI01om0u5pGeJWw+Gg==
X-Google-Smtp-Source: APXvYqztdULr6zBxq7zLFJnIfqPSSqTjnXCgz4FraVOChcfBeCHK0oETCJeBhuCVU21yNsx8uAJjJ9A8j+SNA4YTOKE=
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr7506336ljb.42.1573757036127;
 Thu, 14 Nov 2019 10:43:56 -0800 (PST)
MIME-Version: 1.0
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-9-git-send-email-ilina@codeaurora.org>
In-Reply-To: <1573756521-27373-9-git-send-email-ilina@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 14 Nov 2019 19:43:44 +0100
Message-ID: <CACRpkdYZoAnFno630Fxazz_Kvz4fEmKd-wohprdQqeM44f3tAg@mail.gmail.com>
Subject: Re: [PATCH 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Marc Zyngier <maz@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 14, 2019 at 7:35 PM Lina Iyer <ilina@codeaurora.org> wrote:

> Some GPIOs are marked as wakeup capable and are routed to another
> interrupt controller that is an always-domain and can detect interrupts
> even most of the SoC is powered off. The wakeup interrupt controller
> wakes up the GIC and replays the interrupt at the GIC.
>
> Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
> and ensure the wakeup GPIOs are handled correctly.
>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>

This looks finished, and elegant.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
