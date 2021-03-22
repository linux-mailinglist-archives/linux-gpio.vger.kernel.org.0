Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B09C343C7F
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 10:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCVJRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 05:17:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhCVJRm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 05:17:42 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A04C061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 02:17:41 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 75so20076021lfa.2
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ch0dHKDeX3zEu5dljhJrXeF0NTI0JqsPh8WDLTeb26o=;
        b=W0CqXd0mdBJEWcj1xHvO22fw1y5lVwV6toMXP9bE8URF9FKbRz8uTkWii76ECLT6oA
         syLB7n40USNNBTBbqI4hTvUzY70X0C9Psfn2w58v0BgNqV30gFOui6hBkvluNcv/iHmO
         bWMP7k0bUcIZamdG2NmZCJ8GLd63we95LdCKnvXx4SKntyMfslTmm/9Z0tC9gJiOUsJL
         jXze63UDS06WNUijqL/I+8y2XzDDM9bAz4tyDATVo3qJCfE3tMahmZxxLvU0edQFWDMD
         AgV+ctp+HQdvGTzc+uyF5eM/1fOq+n1u5b1A/1Px58hVqf5Aa0OLtsgeGjS0jRY9MoDl
         YTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ch0dHKDeX3zEu5dljhJrXeF0NTI0JqsPh8WDLTeb26o=;
        b=iELvv4SdbpDQGTWjmfwi5y9UZT8CocmT1K2pD3+nNhNq4RqhvkZQ3wPTZa2JLPGRMW
         tQsnNfuSv494aZuYkyN29Ye0pAnOKrRagKXzW7cvJLpBssVaZGay+IagmDX6mJnTZIvd
         JD1TjTdNAXZ7JAgu7a2h6I6AYQRe6uc9FMB67ssryE8jOOonph2OcoJL6QAwmiTZZCrr
         U6pPeTe5s8JZg2N9qMKN5D1xmyI+bbK7eogtCZ0EquJ17NGO2rZplg9SvuAgN7DNvWR5
         52G4Y6d6y8GkpZxlxPScGuz1cYXlNihDnhl2xl5UGBPNBbkmA8rwT2byiTFI3hC++Rb2
         sToA==
X-Gm-Message-State: AOAM533Di2+JP6fumEiMI0eoicdh10ImrV4xG0zJDD0pXbu/1sOewhxs
        rASDDRuiHjbmyJbFiOTOAT7A77vamWyqYTGWKXbIfQ==
X-Google-Smtp-Source: ABdhPJy8h0RHjijQFNv406chmytcLenoNOeAti8xjPVpfQY7oyJFk2x/BlNSlItRdUTcLDmcN/2h1BOcw/6vI9DwVy0=
X-Received: by 2002:a19:343:: with SMTP id 64mr6290186lfd.649.1616404659903;
 Mon, 22 Mar 2021 02:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210319131205.62775-1-alexander.sverdlin@nokia.com>
 <CAHp75Vc=HnafsnnJYceBB66k+r9NcZqn7mxjdsc7dsQd_tK=LA@mail.gmail.com>
 <028a836c-9343-f08a-3f1b-22e45f291d1a@nokia.com> <CACRpkdbqKmKh0+g92LHJYKO2vt=-TkdTFuSrNwChCbQ-siG53g@mail.gmail.com>
 <f7dcd087-f404-3268-426f-1b33d1419f80@nokia.com>
In-Reply-To: <f7dcd087-f404-3268-426f-1b33d1419f80@nokia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Mar 2021 10:17:28 +0100
Message-ID: <CACRpkdbRT1b=w6UPjK98U7Jn75Ou+7Y7YjUqa06mwp9E1TwQnQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: pl061: Support implementations without GPIOINTR line
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 9:50 AM Alexander Sverdlin
<alexander.sverdlin@nokia.com> wrote:
> On 20/03/2021 12:10, Linus Walleij wrote:
> >>> I'm wondering if the GPIO library support for IRQ hierarchy is what
> >>> you are looking for.
> > It is indeed what should be used.
>
> and what has been used in my patch?

Yes you're right.

> > I think it can be done with quite little code.
>
> Guys, have you actually looked onto my patch before these reviews?

I don't know why I missed it, I guess my second mail is more
to the point.

Yours,
Linus Walleij
