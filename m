Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B623EE036
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 01:06:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234465AbhHPXG7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 19:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234258AbhHPXGu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 19:06:50 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89890C0613C1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 16:06:18 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x27so37627152lfu.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 16:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbLlLwK/VNlS75a/X+hMyEwJqBlLcD/FK1WB01XtTs8=;
        b=WienlzZurbN/2XsS69sMGjJeCuTkP8yZTjTDnLvBwquenqVStUoFPE+VJqNf35BhxX
         mUX5EXM5ECSRzpuicp8Xyq+AB6iGK4BRN/VH2jERJLeq/p6F0bCfq/QG3kMrygk6+Mse
         Mgx06QK1x+AG55F1TUzL3CV+qam1vSP7rYnKOdvLqSDyVqdVrJ5uiVXafkvjlx3ZxWat
         MIwtvFSm1nLXRsEHEF/3GMeuIHDlu2/ohXjNXxQITdWTTJhnjwde2EmkYSQRM6WViKjj
         aIMKzqu/2749BDrKfZrFOzUr/CuAZPBB7gSiFjCcQOfxADbG6vZFnP8Zz1hSYnwrSgVO
         pP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbLlLwK/VNlS75a/X+hMyEwJqBlLcD/FK1WB01XtTs8=;
        b=KXSZIdZxoDXPwNfjaR3aUuWX+ppsUByEOKflOyiwfH9ABcSzDeKtphUxdrOshb/Pug
         zJlkdR/tqN1LWxZEFk7YAzS1POvi4zrJwGfli42N3Q25CvTw8YB9TD5Is4t69NpW9uZ3
         5XdK2XkV1g4n6j6mbWIo4Uaz3z0NyMUfk69avDWlHdU0S5nwShRZXPO5kJ7OFQtNb2Mr
         ZQ3n117JXd9WUHzn0X3Wj/xtClTSk8HMcKuhqiXfdI+wS5C8snQXk36RjJb7Px3taJfr
         e2C1wIP0qVe9iTgCg4Li8ahO+ZBDiM3v10aM6EdlSjokGs5fX3ilfASxfWQlP/h4anK+
         dUIA==
X-Gm-Message-State: AOAM5312oI65sdWYs4HS+iqvMiFxMFHppJCwGsz9x7+IFAbscBVQJjrd
        cr0y/ZUKPdTLKwNODmXyPLchHSqPVjBpoh4zPHy4ew==
X-Google-Smtp-Source: ABdhPJw7R9OwquiOsdkg97GqKDA+WvX5FSKJp3noOZ+hKqsy3JBsIb5In/u+bx3VfAzyQP2bkD+lGSMmZ18S6r58HV4=
X-Received: by 2002:a05:6512:3250:: with SMTP id c16mr113752lfr.465.1629155176951;
 Mon, 16 Aug 2021 16:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210816115953.72533-1-andriy.shevchenko@linux.intel.com> <20210816115953.72533-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210816115953.72533-7-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Aug 2021 01:06:06 +0200
Message-ID: <CACRpkdavU=_Fo3DQkD_MAT9Ur-RX46v0L-O=tqibpUtdUhe-NA@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] TODO: net: mellanox: mlxbf_gige: Replace
 non-standard interrupt handling
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     David Thompson <davthompson@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        Liming Sun <limings@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 16, 2021 at 2:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since GPIO driver supports interrupt handling, replace custom routine with
> simple IRQ request.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  .../mellanox/mlxbf_gige/mlxbf_gige_gpio.c     | 212 ------------------

Don't you also need to remove this file from Makefile?

Yours,
Linus Walleij
