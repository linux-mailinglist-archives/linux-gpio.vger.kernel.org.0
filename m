Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CF951E62
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 00:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfFXWgw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 18:36:52 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43432 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbfFXWgw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 18:36:52 -0400
Received: by mail-lj1-f195.google.com with SMTP id 16so14171481ljv.10
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 15:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J6mvSj9HIBsk8EjLGW0hTzAQhZMarT0YB1g8io943NY=;
        b=sUkqpU7CRPJa8WBRq9dbfWldit0lSlp++W1TdZzD9bsloqAAyiyEYnZaN9j8hCqVWl
         GnY52VMS/EfwfuyHSPAbY8sXyWOlrq9hBe0WvJOkwiwUmSTxlvXQTQQD3hzW71xRMNlW
         ARtdmVHxPGokOAbn1kaJQ1A6sdL/+y6PVTl+Sq1TETju8ACSE4oSpHruEkgvJmwHDOt4
         l7eCeJjOSarS8Vu/mcSXrgxukP1PUYswqgCYOcFqC6ULrw6sb2Cwy4GF79yDm/UtFml9
         TGKYDZYVHNSjsjlPkUPtS1QeFDe/laWx10l4FrczaNx+MKYryXO7+IBoAO4pb/KdpUXF
         F3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J6mvSj9HIBsk8EjLGW0hTzAQhZMarT0YB1g8io943NY=;
        b=Pmp47t3ImNcUEQJXFM0h8IYFKLbNSuqQZZTaOs3oyKgackhjNhw8COayJ1C/0yMWix
         4io2SmBXbBgBO0V7JroVDNPFtEB6Go7v6fpTwHc75bRq5ZG8qlFVyHQGSuUkFOtw0Bcx
         D79G3XXVp1Rt5zF0I+lhsM4p3R2cZWmLv4GLreilHeKVJ6DDkggWoXVW4FilaCHDqv52
         beFoPLK2fYNXyJ8miPPljfQXB6OXPzgzQGzRPo1KpiiHeL7h0XlAYBmCkho3RcKKm09r
         BUrHqCI5yDe8o+mlwoIuvc1Qdatp2xJ5w7NKM1FcK1jbPltDkOqxfzNfKjt2CqshSuIX
         DWSw==
X-Gm-Message-State: APjAAAV6LiVG0QSjOjV9Mq2B5BNSjmS/KdmqmCV4HGp9ol2F51IQFX/H
        wXMCrRn5tsuX1M6QVZUhW0WXG6Kfi8tILccWc0/WSA==
X-Google-Smtp-Source: APXvYqzwcsIfU2fhhMg3DeSXFdWRcU2jq1WdvPR6NAlR0GJdjSA/p8p4eNDenRfaMzxDWDGYenzTX1Bjfkox3wK+5/I=
X-Received: by 2002:a2e:8756:: with SMTP id q22mr52904734ljj.108.1561415810154;
 Mon, 24 Jun 2019 15:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190621152413.21361-1-thierry.reding@gmail.com>
In-Reply-To: <20190621152413.21361-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 00:36:38 +0200
Message-ID: <CACRpkdZMP3hfAdcJjs1EUMnB5naN7NHsrKFHi9xJ4k5XWCnFFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Add device link between pin controller and GPIO
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 21, 2019 at 5:24 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> When a GPIO controller registers a pin range with a pin controller,
> establish a device link between them in order to keep track of the
> dependency, which will help keep the right suspend/resume ordering.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

This make sense.

> +               link = device_link_add(range->gc->parent, pctldev->dev,
> +                                      DL_FLAG_AUTOREMOVE_CONSUMER);

What about parentless GPIO chips now again?
The parent field is optional, sad to say (yes I wish I could just
fix it all).

> +                       device_link_remove(range->gc->parent, pctldev->dev);

And here again.

Yours,
Linus Walleij
