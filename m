Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20917348B30
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhCYIHe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCYIHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:07:16 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2CC3C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:07:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a1so1999023ljp.2
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0wB5lQya3fiuyoxrh9PPyJyATOmdemC/qwgZIh3MLq4=;
        b=aM6TFeKy/Sr4tGz1N1EnSXdfLU3vaY2kFJX6BdJBgbN8xVtCGXpCEg9Z45lrOPNDGK
         DURl7B5z2+X1tLD7URoxhT3zym1TUIu3Rbenz0WDKPOBKjrQ5ayWbVYIg2fEWptAdn5N
         fvIOtx72uXurYiOV39DZbqWVzh3c7FaXh3q1WnDlyPBbNFRVA9i35GNIX9MZJOg4kwfv
         UK017DDdxjchn8spNPBYnfKmRpNh1wJqpCVMiE32xJE72FgUXXcTKTjSGV7VROCKwnvr
         xhNWS1SxFiwkDbplB1uJeM1x2b4R1+q6eZLAjNHK84mWQjb96MTxlqKWwrT/j0l+oYtK
         uzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0wB5lQya3fiuyoxrh9PPyJyATOmdemC/qwgZIh3MLq4=;
        b=U0O4iA1jfF8MQWO7fFbqmDrtRS3UsPLdt/0ZbG4XaBgqfYMWMmE/fS6xYWp53CcNky
         +gfd/VySlGsS0GNWwuVK2SWHTMo014sRbVPJL336rxOtg45tFb628XSd8GmnVj8UjdLM
         BWKRg3GOBQUIImfqnFy7UOVfdXtTNHfhSiSRKPV467LFLJO7C7hR256JUVkBJe8bWiV7
         VX0WwAbMTdt04isriMBDneGjlafLTSgJjJv9WuwhWlzhBK/vOmOfGFcMFci2CHWaqE1Q
         1vnI1iIB1wYuYd6l0k2jCeuPMUrNuSdFyyZjHd6xqpiVfsGgimE4rz7jZYRKT4JLYsss
         iH4w==
X-Gm-Message-State: AOAM531pga6PHGKpbC/yvlvakmfXH9VNl4naVs3N/GdPHNfJEPHtBz70
        su6N0a35OVnHgaqu8DaNH6R2UeoL399JrtU6WS9Fpg==
X-Google-Smtp-Source: ABdhPJyEjmj0S3oXWHBTy1EHddL0x3XbQxu8mxutybTuakd3pMAfgd9Z1tNfs50pgymJMyN0PvQ3nb3gnIjf7aoNSkE=
X-Received: by 2002:a2e:1649:: with SMTP id 9mr5011080ljw.74.1616659634275;
 Thu, 25 Mar 2021 01:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210319152133.28705-1-hhhawa@amazon.com>
In-Reply-To: <20210319152133.28705-1-hhhawa@amazon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:07:03 +0100
Message-ID: <CACRpkdbMiW=P49kyxvy1PqgpZ8BAGaZ8wyrWSdTJmu+oD4dV=Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Fix pinctrl-single pcs_pin_dbg_show()
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        ext Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>, dwmw@amazon.co.uk,
        Benjamin Herrenschmidt <benh@amazon.com>, ronenk@amazon.com,
        Talel Shenhar <talel@amazon.com>,
        Jonathan Chocron <jonnyc@amazon.com>, hanochu@amazon.com,
        tgershi@amazon.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 4:22 PM Hanna Hawa <hhhawa@amazon.com> wrote:

> These patches fix the pcs_pin_dbg_show() function for the scenario where
> a single register controls multiple pins (i.e. bits_per_mux is not zero)
> Additionally, the common formula is moved to a separate function to
> allow reuse.

This v4 patch set applied!

Yours,
Linus Walleij
