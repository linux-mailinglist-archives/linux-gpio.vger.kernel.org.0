Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9410234D196
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 15:45:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbhC2NpA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 09:45:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231558AbhC2Nov (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 09:44:51 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C0CC061756
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 06:44:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v15so18525019lfq.5
        for <linux-gpio@vger.kernel.org>; Mon, 29 Mar 2021 06:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/xbwOyUoByuGnZGoWKpGwyaF8Ra1/D45zi9BaPI7asA=;
        b=iLaLQP3gfwQoeqqnF5bgUGM7HmMcRJd2XQHUEp2ZXgZlKyrHNnyDBgzyenG7VRZAkF
         TkzvXw0PdghuCeoFyIHVAyjML18L6DnL1Hm2qHPdqlUDIqO+7D5DIFdTbqWTL6RsoslN
         frLA/pVwrLgTFkwzc8E+HCJfWM2a1mHPJxa5YgZ+221DPxMO5Dy422whkdUC9MhzSUh9
         2rOQox2y9WTkTSEc/xw4jjloCHigCq6GFtgQYrqbSvXYEZAy3M4vdnPZgY+i1bRuZ7CU
         Z8VriZNADTlteSOp000kLFSykkZfOujZP2h5exuCf3xSPgm0yGnV9sxj3dfzMnrR4+bG
         c37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xbwOyUoByuGnZGoWKpGwyaF8Ra1/D45zi9BaPI7asA=;
        b=nPd9HFo0ipvpOeCpymwvBU9CT/g0Rt0CgAfhcoMummRxmDrIYXk7jJdheoozbnIgbd
         83gM51JjqjwKEjffM7vg0XsFYnHN2f1gTwLtJ/Zm0vu+Qwgg00G2zj/OMtWrbqVx4Tcb
         IvG2peb6dLC2+KqgSQcp2p2t0diL22PF4v/Go9mvRXWR5Qh1Vm25PJPOU5+TpZxBdM9c
         ZkJwZhiprQLv+45sKOXt+EdObjPIymk1djoWsgBMFVZ7VZ4RL5MOdjWDKdTl3D2ljfL5
         Jr/eX1psyEPXFelNMXSCwGihE7UyM+vvjCVFzRaSQ+J8NDtxDah+eS49kWf/LUR2Z3q6
         CFLg==
X-Gm-Message-State: AOAM530yu6YS9MtjYtPN2wSCOPzsLebLQuWRCXh8Alkui8138Cxnoua5
        C9Wog9wH+g6BGs+Qvn14ZTNZwflwBFyoenv97qqSm21ACpu3z9FC
X-Google-Smtp-Source: ABdhPJx46cwsZAPTk7xADrpjLswh2jZ2RWz0/XBNMefSDCHrAKWZDNbXjH4pAv01Lms1i1d6DR1r6h75l/y09/ITdeY=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr16860525lfo.529.1617025489839;
 Mon, 29 Mar 2021 06:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210329015938.20316-1-brad@pensando.io> <20210329015938.20316-14-brad@pensando.io>
In-Reply-To: <20210329015938.20316-14-brad@pensando.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Mar 2021 15:44:38 +0200
Message-ID: <CACRpkda78p=aU5xfT+HtC9OCkZdkVEiN64F1jck2FDJB02C+Rg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] gpio: Use linux/gpio/driver.h
To:     Brad Larson <brad@pensando.io>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 4:00 AM Brad Larson <brad@pensando.io> wrote:

> New drivers should include <linux/gpio/driver.h> instead
> of legacy <linux/gpio.h>.
>
> Signed-off-by: Brad Larson <brad@pensando.io>

Fold into patch 1 as indicated by Greg.

Yours,
Linus Walleij
