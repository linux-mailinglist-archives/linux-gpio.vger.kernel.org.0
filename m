Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE5410E9BB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2019 12:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfLBLpB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Dec 2019 06:45:01 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37509 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727381AbfLBLpB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Dec 2019 06:45:01 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so3470443lfc.4
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2019 03:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9dbeOa/yZiXLwAKhqVdLm2n/zVETLaeGOMkXijhyOxI=;
        b=JLrik/Q57hkA2pLMTsCgFgbbXQCV50ILFodTufcKAu1zVJThyK0XovKHqlm3wjIFXo
         thgwxcec57cupokH5vqIRP6Afm0WjEpc8qBe4nJwWGCNznGEyDTdlFrWzt3OQTWUtu7B
         9ojKBJ/a48Jp/wQ+CQoM8wncSSs9mNnuHZ41QHW7sAbD1bWBUOfgQH8nXdwsrzD82tOh
         +IJzbYXg/z1w5aY7ZGrLvj9474omGAyq7H6tFWkuH4FUM5PHsVMnE5lVUh/cwKaJl5tf
         /hhm7GuvMk6MXuDzwMfDqLgev32ArbhFfgAw6Pg0WZ76yLzTdJvlrpcRC1xyT7XWfzk0
         QIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9dbeOa/yZiXLwAKhqVdLm2n/zVETLaeGOMkXijhyOxI=;
        b=JvGtEWejb9RoxAgHII0cSx1XXsLlv0ZqX8f6Y1tT68EsVJ/kTM5iQAsFDUDDuppUjU
         8Wpbg0NkxhMeSO/fSv+SefwpVExy8eCH6NnaNDK1dP+KqIYh3+Pdji0P8V9Z+cAp8skU
         zWD5iojdPphVUCLLK4r8qm8ctL7TFYVQdI2WCOvr/WB0dnvnU+KjzTT0vFWVf/aLZ+HS
         bNDEVx7w8KyIl7pn5Y+04NhzySSKKRlvEN2tNRYRv75W+N2xPOQWqM1N/fgHDsY3AXRw
         FdQnOGXRpUDjb3DN8yqVoB7OcqRd6aY5Tp5h53nf9+p5N/hQ/g+7vBWEYvW0myPr9bYy
         7WKA==
X-Gm-Message-State: APjAAAV7/epVJVkE3rezqU0HA5yg07VcjIubn4TfesIqHHDt1G7VfGMc
        b7P4AlwED8zdKyEUQS3lSS4wdLZiNkI1fFNG3KcKdw==
X-Google-Smtp-Source: APXvYqyoHJVudY4Th9gkUkwA7ZvcT7SMc/yaucVRZjkFgzCxhl/qzF5ng9XGEy78xknVHWJ5WXqV+foidMFPzNGJqww=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr41600526lfi.93.1575287099487;
 Mon, 02 Dec 2019 03:44:59 -0800 (PST)
MIME-Version: 1.0
References: <20191129172537.31410-1-m.felsch@pengutronix.de>
In-Reply-To: <20191129172537.31410-1-m.felsch@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Dec 2019 12:44:48 +0100
Message-ID: <CACRpkdaSmwORgetv7aZjtgk+2OchcvQR4SBjdWQ4KsRMHuUvSg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] DA9062 PMIC features
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 29, 2019 at 6:25 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> this series address all comments made on [1]. Patch "gpio: add support
> to get local gpio number" is splitted into:
>  - "gpio: treewide rename gpio_chip_hwgpio to gpiod_to_offset"
>  - "gpio: make gpiod_to_offset() available for other users"
> Please check the discussion [1] for more information. You need to apply
> [2] to test the new features.

I am very happy with the shape of patches (1) and (2).

I can apply these on an immutable branch and merge into the
GPIO tree at v5.5-rc1 and offer to other subsystem maintainers
to pull in so they can merge the rest of the patch series on
top.

Alternatively I can merge all the patches into the GPIO tree.

I suppose this is not so much of a MFD business at this
point so whatever the regulator maintainer prefers I suppose?

Yours,
Linus Walleij
