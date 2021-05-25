Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C1538F6D4
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 02:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhEYALm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 20:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhEYALl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 20:11:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD603C061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:10:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i9so43141489lfe.13
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zs8TmT1vnSuVpBrHCDIkd50pLy0g1k3AFJOO3yMYcT8=;
        b=tn9sIfHcm2kOvHMqO9+seJvEGILq8cuacHjRYpz1xH7af/oDFavqQkpODX1iFchWjc
         0tjcdmlLfd4xMxnHuXI3iQxvAaLebejTOe82ow6mnMeDCIzoMUrw/7GPHbenD1v3FIEN
         2czfKM3YWsGCkZCG8V8ih2YrP93y7CzOMxSWdZiz4XW6O5r2SzQ7JteOydm3XzmsC+Kd
         Mt76uGySuuixXUtZh41TFWtiYEbPdlAtktmmFwyXniWjv+TFPWkBl116NhqT0PtPoALj
         +B66jH7R7btcvSI3A/26YjHgxw1/P1qMKW42UzRiFtwVvTHTwq+e2Jypn1I9XEj3pAYz
         gczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zs8TmT1vnSuVpBrHCDIkd50pLy0g1k3AFJOO3yMYcT8=;
        b=d4oAZgHZ3UQlTd+CObRQBAw7TVoI8U8HabEz7+rhhgCAWilBBG67RavH5YnrwHecVY
         Rr6QJ3Xz/TykoVOV8Km5/dtq54DoZPFrd5e2Pj2OFJod9e1DjlxU8H/YIViResjYs2am
         Fa0ANdx2Xukn4DQZnQdRUpENhQree0xzt7UFQOWlj81MGGB3XJV/I4M9Jr1omPxVDIlH
         LflPxpbisDt/sPOWX/gTmVghiLySPScOQm6wb2ux5TjRRU/JyM3039kE/6dCCuOUaAiY
         znGXIqXRMLVm1EuZg4a60rtZgqfIoCgpUkHwUy+1S66VoqvTNfpz0+ppxsDz6zHf1iEf
         b94A==
X-Gm-Message-State: AOAM532XbYIZGRz2+Xn1pt/bjm0uLM5iIYxDRqVBoHO7CQHP4pfHgBsG
        py/bYknZX4iIQ3vOlEHnyKE/OUkiKei42uNFEtJsbg==
X-Google-Smtp-Source: ABdhPJzXn1frIVMSyZpovgE+XLpJdzV19ECCHFaLfT/f9QhTjVX++aWYs0UULtF12Ppj0Jl4ip17/fnvnR7dX0PJ7RA=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr11968205lfn.465.1621901409913;
 Mon, 24 May 2021 17:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210512180140.33293-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20210512180140.33293-1-rikard.falkeborn@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 02:09:59 +0200
Message-ID: <CACRpkdbciLfw2dOqaRwBAWQz3PF2cCzz=Kxkqf02G_G6qafRZQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: at91: Constify struct at91_pinctrl_mux_ops
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 12, 2021 at 8:01 PM Rikard Falkeborn
<rikard.falkeborn@gmail.com> wrote:

> The at91_pinctrl_mux_ops struct is never modified by the driver. Make it
> const wherever it is possible to allow the compiler to put the static
> variables in read-only memory. Note that sam9x60_ops was already const,
> but the const was cast away when the return value of of_match_device() was
> cast to a pointer to a non-const struct at91_pinctrl_mux_ops.
>
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Patch applied.

Yours,
Linus Walleij
