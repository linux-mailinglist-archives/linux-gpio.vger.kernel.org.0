Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2A61D5FF5
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgEPJWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726270AbgEPJWz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 05:22:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F2BC05BD09
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:22:55 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b6so4766198ljj.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q4Oz4+ibWWpMydd1arZxA8BX6PM3A8jv5HZMESDsQ9g=;
        b=Y+yIR8l6V8vqgoEYGfFGAFQpJiHWTXKBZUGJ8iMpiV/WiETMqDCSVSF9HK4LnObkIS
         X35ZIKFDNpFJP54x12vBOBDPG8Pgvb+iIKIemhWvRNqpxoAqdTLMaffC4OCOwYxeGJql
         pslmoemCEm1ddSazERV0WkCTNg8+nPc0tmlMCYWTxkNuHsSH65URrJERFcVf1YyXRUuN
         GQC4zXMUi28jg0DqH2gu99eRLBxwE6ntLwX99izfvdii9xidE3DvrV1ijAva1kMZrXp4
         CHpI4Lx0nwDNQu3amTxFkNjBsUV6L0tRHhlrMnPwbVQpOHwUBTVxW3hScEdUyBmWu1iD
         YdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q4Oz4+ibWWpMydd1arZxA8BX6PM3A8jv5HZMESDsQ9g=;
        b=Mi+qEkCOCLMKMCTNqlr1FfkWwuWzQB0rXd6Szgwk7Gi8/osWHMgvVQQUSvU5l+jPSg
         jEmasgceijCIJlLkf/hstK8A8Orh590V4Gaxw0yZNvcyZPCPVFiLCYgA0G3VxuSsgLjP
         SDuwgTlnyWwTBcc3A9JGXu2HFFmsq2HfHymscndAOJAEuGBwaNtrRnxjNwkYY6ZqxPmv
         vQ91lMnKRwgH1pSe+3dxXb938dh8agmyQaWv4dgHQVXO5L2m+3YBPqs3xh7Ltamg3N5E
         +oaGlI8RzvQBzekQ4DGw7bcPA0S2z7gFCB5hmOEK3XS69jLIcnjxDdawMp6+9+GMR34P
         WJig==
X-Gm-Message-State: AOAM532H8BEuTgLjMYQC0ByC9a6PaBk15800F/DKsI9kxTVnbi2Tpmmj
        iZ615fdrkCrgjMnzGrlCx+o6KAF2brqq2TM5fc0CeQ==
X-Google-Smtp-Source: ABdhPJwG2BEQn2epW8eMqmhwN7S5r3f/ZN27Uv3GIAyyylObEvPx2e+gi/d5W08uB6EwXhJraZS9Q5722xnYiYW/lVs=
X-Received: by 2002:a2e:81d5:: with SMTP id s21mr4627881ljg.258.1589620973333;
 Sat, 16 May 2020 02:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200507113626.24026-1-geert+renesas@glider.be> <20200507113626.24026-2-geert+renesas@glider.be>
In-Reply-To: <20200507113626.24026-2-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:22:42 +0200
Message-ID: <CACRpkdbtRWd6+z6oLra7GwAtHOpdNr3aHnkODPP=j0myewVK4w@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: equilibrium: Add architecture dependency
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Rahul Tanwar <rahul.tanwar@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 7, 2020 at 1:36 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The Equilibrium pin controller is only present on Intel Lightning
> Mountain SoCs.  Add an architecture dependency to the
> PINCTRL_EQUILIBRIUM config symbol, to avoid asking the user about it
> when configuring a kernel for a non-x86 architecture.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
