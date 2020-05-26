Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DE71E2997
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 20:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbgEZSEA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 14:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbgEZSEA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 14:04:00 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B15C03E96D
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 11:04:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m18so25654814ljo.5
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CtYfPx9roHCcHXP8upDfuoMS3cYKTuxtQ6edbtqVsSY=;
        b=VnEP+OHRBqpCbZhOU5BHczA1Y5mLEWaomAcYNWy/9f4YL/I4AxkvEuX1YIbIUK0TUC
         TDAnFveM2R1qiK654N4jJnbxuyuHmvIuLKeNENJ95bzL46B7t8pa+OfMbnykMJ2BJtyn
         YhsnFUXRKB7OFVSzX8aXL7hh7ZnV6zLFPsfl0/i5Uf3i+XXUALP0VfdmiNbHRv5fBmog
         cjsLlgT27/B4k3oHY3xtqgxFyEfSxKiheCEntnEXvwWirBlt7yMW8fRhAFKpCVGKaX/t
         3HofuQ28qkT9X7vaXBJMxvBOV/KH/AXjRouSAJHs9n6knDfJjxHATUHZFaSyRT9H4MHd
         k98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CtYfPx9roHCcHXP8upDfuoMS3cYKTuxtQ6edbtqVsSY=;
        b=uW3+RR7xy8IwPPjOB78IechkW0GtlI2w4RVsaeeqzkrVX0O/cz6n7/h6PMGWgCWZ1P
         4Eu6vwFAEUUHRav6D6emDreqKxMEvkTVCP8WKZ0H3KxNuaEradaAa3FhK3MKJ4rKG3ED
         lNG6JrxTty5DoFGtF44TQZpYyn74GIx9p1wvpGh+r/Wh/5X5MiYAbacVg/MvfJ8LnS7o
         2EJ5zYlLW7K3g++KBSc7SNaBWly40KBmCJJFzkPZeGZKrEch0h6gLePAmidxDHNGMNDF
         zvytl67sxnZIYXVbgQ3EYBQi/FHl66rkuVF1KOF3CJDwTWEssMU1KB2M2Y2Vvqdqm/7v
         6nYg==
X-Gm-Message-State: AOAM532GOvgP2Vd2mKDx2NnvsGj/A69FISCfCVp8xKNltq7GPrmReaMU
        uOUZ8obp8Jq9ihx80zlhfZmppXpKQQ49GDSCwEi+Iw==
X-Google-Smtp-Source: ABdhPJzPIvxnyRV6JtqUfT5rgx5/dJoJblhSmHJzOVlMkJlMz1qDHDpGnk+cSCgEO1hmppE59YpJmdOe96ssizaaigQ=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr1219186lji.286.1590516238461;
 Tue, 26 May 2020 11:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200525054833.28995-1-saraon640529@gmail.com>
 <CACRpkdbubY-DjuTx=-vj9rrLuSGgZekDw0J4DHpnU5bf5BorZw@mail.gmail.com> <CAErSpo77YJaiiWnSUgoJ-0Kyjt+RAW2f3bqcy95=BG_SL2GcHg@mail.gmail.com>
In-Reply-To: <CAErSpo77YJaiiWnSUgoJ-0Kyjt+RAW2f3bqcy95=BG_SL2GcHg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 May 2020 20:03:47 +0200
Message-ID: <CACRpkdaVGKh1UGSwqCA1pgRg5EzEJq9+eZqRLdF_FqYUaC=28Q@mail.gmail.com>
Subject: Re: [PATCH] GPIO: Submit a new GPIO driver
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Richard Hsu <saraon640529@gmail.com>, Richard_Hsu@asmedia.com.tw,
        Yd_Tseng@asmedia.com.tw, Andrew_Su@asmedia.com.tw,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 26, 2020 at 6:18 PM Bjorn Helgaas <bhelgaas@google.com> wrote:
> On Mon, May 25, 2020 at 7:58 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> I'd be happy to look.  Can you point me at the patch?

It's here:
https://lore.kernel.org/linux-gpio/CAErSpo77YJaiiWnSUgoJ-0Kyjt+RAW2f3bqcy95=BG_SL2GcHg@mail.gmail.com/T/#m07ed4e8c45518413e0d0280cd1a07bb291ee04d8

I complained a bit about the patch format but the patch is entirely
readable.

Thanks Bjorn!
Linus Walleij
