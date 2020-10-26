Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49B9298FB2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 15:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781847AbgJZOoZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 10:44:25 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:37928 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781716AbgJZOoZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 10:44:25 -0400
Received: by mail-ej1-f68.google.com with SMTP id ce10so13941743ejc.5
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FinoEaTb28UA3v7u3K8ZRplxXK9tCCPaXWNJBgpGjko=;
        b=CmESRoAHUQxPDl2qJke1q3f02nuj7mpdTsN6Iuo43SefubhMpPsdNcExtRDJXaZJh5
         lR+gQiV3xhGoxiApR08xIX7+ZjeXSqdvXcz/YGVh/Rq2gkFemLeSWcnNH4rhbMiIsZAs
         P8c3nV0p1RpbS/brhEeK9TtymgsOla/sUasOo672mvdBAwkC662zNNmzQI+liFPLiaJA
         MNP2+U2Wr1NQc+k7EdKp/+sfO7FJV0wZPU9SVCa1/nQyu/2P46VlIxTD5LRIlVjg1Oyb
         ZrDMoukwiWv1dZgN+XDV8Nzwk4mh8qTcZx4WftNv3EOmPH+Uk+VXV/gixjehYmtzOERz
         YVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FinoEaTb28UA3v7u3K8ZRplxXK9tCCPaXWNJBgpGjko=;
        b=pCbSU9rNkmTISNAC2LEbidIMyx4LYJDJ2B1f2z8s7LErN7RQiPXd56MN6Mreop47nL
         TxEbVmNU4YUSnRLxmxPNG+NzggB8KjefBOnbiRr5PE+FmCGYTq70ykyXWu0b+8X7sHQg
         sIn7oyLSona1QE+lf5sJO7v6on+dtJ67Fs8ZyQ1HBN/KcrKr1O877anxGw6S1wOz/Alw
         llfRGP+q2I/EFC6KommuQFO9vszYLBxoOooJoS6A173mnR4UeoQQt+wEpq32/sw8noyv
         REKrSSFxv4suXF2UUk8sUnYBd+E630OP2qI2vA5ygC5iecZ2OtvBdE+IAPOVQLvbY7gO
         KTOg==
X-Gm-Message-State: AOAM533Cdo5ccP/5j8M055Wtxo+qSOGbQBZsqMJt7PVsWeBFpIsktRav
        7c543tm/P4bMbeq5vAsQ1ZDIIW/MEm6+g7+SJjm/aw==
X-Google-Smtp-Source: ABdhPJz7QXmPfcWL5WSumSU0L0odIIIA2bhMmlWIzi/+h0X3xUJ2F9lybutp+q6pfx6aF40EHIBP0BA+w3npwqTIl5E=
X-Received: by 2002:a17:906:7d0:: with SMTP id m16mr15697749ejc.445.1603723463045;
 Mon, 26 Oct 2020 07:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201021112537.40738-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201021112537.40738-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 26 Oct 2020 15:44:12 +0100
Message-ID: <CAMpxmJVU9j7R=wyi4saRPzCwqpP2TOvpsk0mOP6jtokbFF7c_A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Unify expectations about ->request()
 returned value
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 21, 2020 at 1:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Half of the code in the GPIO library is written in an expectation that
> any non-zero value returned from the ->request() callback is an error code,
> while some code checks only for negative values.
>
> Unify expectations about ->request() returned value to be non-zero
> for an error and 0 for the success.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bartosz
