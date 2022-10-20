Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D870D605FC8
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 14:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJTMLN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 08:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiJTMLM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 08:11:12 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAC7147D22
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 05:11:10 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id p4so8892984uao.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAYy9wtWo5VVBpt05/j32BMqpTHXKRzHcjb7mtgwB0U=;
        b=FBcqjES0ZejRGI6yy0431s2WK3WgKYS89/YnvDq8Ygh87hTcvPTau7tlHAnlnRflO8
         FERaL4Wh4qYYimwpX2KFYgeH07IxKHQnyFNIRy3bJhLJihMM3zMbHL8BB3ehDrlkmaJ8
         OyB0djiO2/v02NziHVW0S2lItuf0iAhUX0y2e1PNUb7I8UipBq62nLhghQt4kW3K5Xtz
         gLA7sEoXj6gGppzar7MAsUINgfTVuPJUFd8T7zvwbyFEcJ40yf1go2OEEf/553Ek1k+S
         1HEFlyXGmgAUv6vcq+H3w9+NTtAXc2M4dhymefEAKstPLEz2D1fLJUlXLn9JqOhjZ02u
         oqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAYy9wtWo5VVBpt05/j32BMqpTHXKRzHcjb7mtgwB0U=;
        b=Bysdtp6hA6eqhW4311oLxQ88DeHVG91Nr9q/4YmGQ3WV1e/lqDYwxhxaCan7g8hriF
         msCJShPNCrXfueYdWzBFWsNq91d0bQsET/ExQSFWe1NofevTy6HIInC3v0qut9Rgfo9X
         kVjtO4tK45V44fObnyLiDdhEw8aQjsAQhRuapxBSE0MZO2zYGj4mJrfcw39xgIqZjeZj
         J0rycPIXEo2B0vsN6Lk26etKBw1cI7qPLeL9/TIa8ob8OLr9SwxS2GgUI+FSfBcyyfWN
         envPoV9qqGRpScUd3ZBZAuNO7lJH+sY8V9chDBqTyqA1iswEzYnpRRfs+ah5Y+4VH/ct
         QHew==
X-Gm-Message-State: ACrzQf0mATPREo2opaFOeFSezc88DUE5Er+alL4qC+WX4a/S1I3VBOAZ
        dw5r8rHbXScf0qyJKlACMaIyjF/fTPY+LQorclcqxg==
X-Google-Smtp-Source: AMsMyM50Iqg4begwqkLowuX5dzS4dkHuts4D+yZVKunL1BzhnhCRhsMKk4ZoP0NYS3hYmZJgPceIiLDn/45J6sB82Es=
X-Received: by 2002:ab0:2155:0:b0:3e2:bdc:cfa5 with SMTP id
 t21-20020ab02155000000b003e20bdccfa5mr6822463ual.119.1666267869676; Thu, 20
 Oct 2022 05:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663519546.git.william.gray@linaro.org>
In-Reply-To: <cover.1663519546.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Oct 2022 14:10:58 +0200
Message-ID: <CAMRc=McQa0iDS+6OCOt9R1B-DdR7t1jD3D-Q3DTKbm=zidXpAQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Introduce the ACCES IDIO-16 GPIO library module
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        andriy.shevchenko@intel.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 18, 2022 at 9:54 PM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> Changes in v2:
>  - Added offset check for last byte of inputs in idio_16_get() for
>    robustness
>  - Replaced hardcoded '16' with IDIO_16_NOUT constant in idio_16_get*()
>  - Renamed IDIO_16 namespace to GPIO_IDIO_16; adjusted 104-idio-16 and
>    pci-idio-16 drivers accordingly
>  - Utilized DEFAULT_SYMBOL_NAMESPACE to simplify namespace exports
>  - Refactored callbacks to utilize cached output states; idio_16_get()
>    callback now requires struct idio_16_state state; adjusted
>    104-idio-16 and pci-idio-16 drivers accordingly
>  - Moved bitmap_fill() to after idio_16_state_init() in idio_16_probe()
>    to prevent clobbering out_state if the implementation of
>    idio_16_state_init changes in the future
>  - Adjusted offset checks in idio_16_set() and idio_16_get_direction()
>    to ">= IDIO_16_NOUT" for consistency
>  - Utilized __assign_bit() in idio_16_set()
>  - Refactored idio_16_*_multiple() callbacks to utilize bitmap_replace()
>
> In a similar vein as the Intel 8255 interface library module [0], the
> ACCES IDIO-16 GPIO library module is introduced to consolidate much of
> the shared code between the existing 104-IDIO-16 and PCI-IDIO-16 GPIO
> drivers.
>
> The idio-16 module exposes consumer library functions to facilitate
> communication with devices within the ACCES IDIO-16 family such as the
> 104-IDIO-16 and the PCI-IDIO-16.
>
> A CONFIG_GPIO_IDIO_16 Kconfig option is introduced by this patch.
> Modules wanting access to these idio-16 library functions should select
> this Kconfig option and import the GPIO_IDIO_16 symbol namespace.
>
> [0] https://lore.kernel.org/all/d1a24895f2ea67f689c24c34a20ddb43cd7246af.1658324498.git.william.gray@linaro.org/
>
> William Breathitt Gray (3):
>   gpio: idio-16: Introduce the ACCES IDIO-16 GPIO library module
>   gpio: 104-idio-16: Utilize the idio-16 GPIO library
>   gpio: pci-idio-16: Utilize the idio-16 GPIO library
>
>  MAINTAINERS                     |   7 ++
>  drivers/gpio/Kconfig            |  11 +++
>  drivers/gpio/Makefile           |   1 +
>  drivers/gpio/gpio-104-idio-16.c |  88 ++++---------------
>  drivers/gpio/gpio-idio-16.c     | 146 ++++++++++++++++++++++++++++++++
>  drivers/gpio/gpio-idio-16.h     |  71 ++++++++++++++++
>  drivers/gpio/gpio-pci-idio-16.c | 119 +++-----------------------
>  7 files changed, 265 insertions(+), 178 deletions(-)
>  create mode 100644 drivers/gpio/gpio-idio-16.c
>  create mode 100644 drivers/gpio/gpio-idio-16.h
>
>
> base-commit: d9e7f0e320516c660d6f33e6c16a3d99970eb14e
> --
> 2.37.3
>

This series looks good to me, Andy do you have any objections?
Otherwise, I'll queue it soon.

Bartosz
