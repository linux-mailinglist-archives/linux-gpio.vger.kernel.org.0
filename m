Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D7B465BC6
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 02:39:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346656AbhLBBnI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Dec 2021 20:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344264AbhLBBnH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Dec 2021 20:43:07 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4F14C061574
        for <linux-gpio@vger.kernel.org>; Wed,  1 Dec 2021 17:39:45 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id t9-20020a4a8589000000b002c5c4d19723so8382645ooh.11
        for <linux-gpio@vger.kernel.org>; Wed, 01 Dec 2021 17:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Td99FTDulvPZBU3NaFYSJRyN3JaDj4ogOHKbJ+TJnU=;
        b=KJggdsUvmH6q5PKrTkXeBdV/PcEqekUkL4hgq8aOZzdCPUxT+xPxVtz41A62Uu5B7U
         lLpIEqHHxBuK/AtCOLw2o9M3pv+qWagfttRf8EO5p3lj10+2d0FzzPKh56dsaiZKDmAT
         2lHIZPTsZ5k6gig8Z86AVZhSHmjNrCfCzfai+7PrvcAMlxIYMv1AhDM6baaZLGRoFZVo
         9TpfBUDplhgrJ9FGpz6cDSR6hd8xW2Q0gDTHU7ZKWCCDifYaqf1IIByaMr/2b0R4enn/
         lTadKlUb8rN0Sd12FskC6iFU8NeS1GdD92Usxz3p6OhZORFAYWOux4CLqWTX0eMDw7Dq
         yckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Td99FTDulvPZBU3NaFYSJRyN3JaDj4ogOHKbJ+TJnU=;
        b=JB9AEzA/2UNNs1/wmDC3QzmwZbEsCvP058bMoOcOKkTaXz5dBo05rj4yesWTSJnUi+
         DzYQdu2R8NPhG5DYqXNXW315/x4NRxuX+oLO15jCU2XhJtFXt+FfNrO72BxGylYQlqA/
         3KwS0tK2drbulMGgPW02vA9+JENTWgW793iwPGE57fM6WiiRkFqT/ZndDRbFcl942d3p
         YAAYG3GgCvB5n7MYHXAXmKr6aylgsEQl7/Rl8q/32kK+bHSDc+thEbVGDoAE7w/Lxfl8
         1uy+SeZB2ItqyqSFqWrr05BRRoDpFxW98i8RFWIJeO2QfQ4SMbGPbIXbqE1tHCl77Wny
         x5qA==
X-Gm-Message-State: AOAM532t+ULxuXWuS387Cz052OupyOKfFWcjUkhemjuM1tU6fFLT9+mo
        7DBopzi74B7/eHWPmoXU4TF+cUUqAFep7SGrrT3Q7Q==
X-Google-Smtp-Source: ABdhPJw7d578VYLOpQsWH+hzk47HxyEp8kmvA1vx8sLQe8APfANOj0Wwkow649hfmECy9ecSvUdHL1teqmdy71gVTtc=
X-Received: by 2002:a4a:e155:: with SMTP id p21mr6738104oot.84.1638409185080;
 Wed, 01 Dec 2021 17:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20211129105556.675235-1-phil@raspberrypi.com> <20211129105556.675235-3-phil@raspberrypi.com>
In-Reply-To: <20211129105556.675235-3-phil@raspberrypi.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Dec 2021 02:39:33 +0100
Message-ID: <CACRpkdbSvBDDeJGJWUi+oH4+1QvsUfE-J0KOvAAUknqvbK243g@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: gpio-ranges property is now required
To:     Phil Elwell <phil@raspberrypi.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 29, 2021 at 11:56 AM Phil Elwell <phil@raspberrypi.com> wrote:

> Since [1], added in 5.7, the absence of a gpio-ranges property has
> prevented GPIOs from being restored to inputs when released.
> Add those properties for BCM283x and BCM2711 devices.
>
> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>     pin-ranges")
>
> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without
>                       pin-ranges")
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>

With the funny linebreak fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Please merge this patch through the Broadcom/SoC tree.

Yours,
Linus Walleij
