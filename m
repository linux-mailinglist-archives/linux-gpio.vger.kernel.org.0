Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8AC44A5F9
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 05:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbhKIFBr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 00:01:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhKIFBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 00:01:47 -0500
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B1F0C061764
        for <linux-gpio@vger.kernel.org>; Mon,  8 Nov 2021 20:59:01 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id x1-20020a4aea01000000b002c296d82604so525477ood.9
        for <linux-gpio@vger.kernel.org>; Mon, 08 Nov 2021 20:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=irWfmlcyPuQHKKPir8OlxwwVnibLr6uWK7muZHmIMsk=;
        b=WzK18Y5A4egmuKvtBbizvoyHLqZQwgphFe0O19EbuiJRo0oG70FWWhAqECIkojaMTE
         LGei/ky0WwZacG7gqMOVuP6JrODhZG0ZvLRWrSl1p4XkO+hxU5UAlejPj2KacG1fLPBP
         AURwVMA7gLsyTMVWlEkcqjb2T0KilFe1jhZ4kXAO/tCscD2iZzmaN7LJz+web0hb/av/
         sXy9+WTDxPk9gzQW9iODIOP4T+mGKZZnWeYnlfwzLWcYbWGWZn3wmw/1GYD9qh1FjAMI
         vco1WzrmtuHAJaTFKzZ4GX4+Wazy1QgHkWe47k5aI/ouwH+EJxoTJddSpN4RMJzlY0O5
         X3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=irWfmlcyPuQHKKPir8OlxwwVnibLr6uWK7muZHmIMsk=;
        b=79XntHgbLVSwn5ysoFMz6YNaosk8gD1DlOjcHPQXzJyF/3G2KXGJxw72ZhhM4t934f
         I3rcCcOGnRR5HCAKeK5UwLlvM9iBFiYqYtRpVfY00zBt4X3zYP6xehlTnvfMZKJXnggy
         az4Mmjx0xxbUNXg7HS9ZGaD4M2QEKpS5XCe5dyttWG2umD67MMUTl0DuZ0uhR9D9nvKl
         g663dWiG9zYHQYy+knbGDF1PAZ6YZGzBqLHI/9eYRLAljxGW3Tpi1eoAPNS94rLZxN5D
         hUdi/4gUWV999IuYphOVgQ66Lyf3YNGKOFgNWgIleE2AXM7lbnnl/zuw/99Sx5BX4dwL
         RCgA==
X-Gm-Message-State: AOAM533L2T69Cjns+/+/sNZgzLpin0WI7KaXB6VX0uQ4/CiXY2bbj2A4
        miI9psqe44cVNncFEVQmGNFoMEbSP0RO9W89GupQSw==
X-Google-Smtp-Source: ABdhPJzA0fBJmolcF9ydwIK4LPh8g10cwPkTOJq8YZWFOGCxYdG35tZxSmMOA+s7P/3EH5wClIkzSAPkiWKZInwliPU=
X-Received: by 2002:a4a:5b85:: with SMTP id g127mr2368667oob.86.1636433941005;
 Mon, 08 Nov 2021 20:59:01 -0800 (PST)
MIME-Version: 1.0
References: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
In-Reply-To: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:58:49 +0100
Message-ID: <CACRpkdb6-Wa8KGnx9kD5zhPLBw1YDZQgfDPm35VJzNnt27d3Vw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Extend pinctrl-ocelot driver for lan966x
To:     Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        quentin.schulz@bootlin.com
Cc:     robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 29, 2021 at 11:27 AM Kavyasree Kotagiri
<kavyasree.kotagiri@microchip.com> wrote:

> This patch series extends pinctrl-ocelot driver to support also
> the lan966x.

Alexandre Belloni and Quentin Schultz worked on this
driver a lot, so paging them for feedback/review.

Yours,
Linus Walleij
