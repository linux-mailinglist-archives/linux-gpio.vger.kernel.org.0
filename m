Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED75B0AF4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbfILJId (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:08:33 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44632 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730398AbfILJId (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:08:33 -0400
Received: by mail-lj1-f193.google.com with SMTP id u14so22823699ljj.11
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7J4PbmeH1oWO8W8ZajC7YRPfKxbxslCKwg9jxg+VhI=;
        b=wjZ7oJl201ebYkz2a4f5nJBzDw39KWVo2OQLkQ1zXvGCiTSdowLq/j7ziMwP1Rfjrs
         uV7gzQlNFSDiiryzutStPQMBshx949FbzlxiVoQdxywBka36pLfree0FoDtqHieqXZ9h
         LSgcUGWnPCzn38RtRhs/XPWLl0gNsZKoEPpWaZcCYDw3x1qSEcrPoXL0OXhYHOZ/VJCD
         o81eT3EXtrpPzrvnW31ZLOH9xKRQTKq2SpnvdemuVseN+LY2LrjlyZCHaSdpM+Nkqi8r
         dSpTP/SLeNoIUByjYSm41gQDDZcdiwBVHX+C01i1dKIRxJsM+9fV3vd+AvYEZc6zq6Lh
         pjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7J4PbmeH1oWO8W8ZajC7YRPfKxbxslCKwg9jxg+VhI=;
        b=Mk51PL2VVkorTkJjpBLDnpTpyFoVlSyQRFUy71YRXy7gAp+52LFBeJn0W/R+mtuU7a
         +i2UDXzu1hfuvgGbjiz49VUp+jcENqHvKbBV5wyGp71VpT+EvVYpU9Dmi8JALxrfwjbf
         y4comO9bZ3jCnnoFEFh8zQsW5zK4QYa7S7MlqxMEI+jxWTu6RCuA8PRltgInzqSxY2ay
         6BYgL97/vQvsMxVpXNOevPa4ArkzLxbTP21blHhV9SjzhYhkGWwG3D2q0Mp4//vWESZN
         M0FgbDqKUr351Tij3G9G4QFku4MWXMTU/uSz/jL3Y/P8L8heRM6QGIkx/poctf6ZVTqB
         l5Yw==
X-Gm-Message-State: APjAAAWtpUvI6A22E89Dm3EcKibPV8byyaioZhr+WS+QChPjEvtc4/AO
        wm9FQrFKHq8COSc+gmcWQacGQNH7wO/y2di//iYFEg==
X-Google-Smtp-Source: APXvYqycdCEjJhtO9F1hYvDSmgwKHe8g+Qx//eIozwl50NSf3M2ESWqUNchgPo7jVeCOMW93J0H7u9GmmXC1JnhgtLc=
X-Received: by 2002:a2e:8056:: with SMTP id p22mr20790479ljg.69.1568279311270;
 Thu, 12 Sep 2019 02:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190910141529.21030-1-geert+renesas@glider.be>
In-Reply-To: <20190910141529.21030-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:08:18 +0100
Message-ID: <CACRpkdZ=NVVEwk=V8z4--t0Yjf0bqKrjKn0e8d7hKn_1-3xW0w@mail.gmail.com>
Subject: Re: [PATCH] gpio: htc-egpio: Remove unused exported htc_egpio_get_wakeup_irq()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Paul Parsons <lost.distance@yahoo.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 10, 2019 at 3:15 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> This function was never used upstream, and is a relic of the original
> handhelds.org code the htc-egpio driver was based on.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
