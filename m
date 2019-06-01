Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37C9832036
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfFARpS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:45:18 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42551 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFARpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:45:17 -0400
Received: by mail-lj1-f196.google.com with SMTP id t28so1436041lje.9
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EXOx4KeIoy5u65m3f547Wl3OoIYqly6wuZi2P/gW0Wc=;
        b=FZN3yOrjC7gc03SymAGLotKrHQQ5pLQb+K7hPid9q5fzyQTYusfDMW5FgO25wUHYiL
         tBpYzXVoVd52OeHbPKWOaSQ770OS7SUSeWlsef4vM3GjNfViB51vEXmyYBzWMknDKfWg
         DLjdJWF7oqsetqurvgep+9tFmWKmbOKjMa+KPDueJozFDtQx/NE/xvyGA8Vgr2KdjXLg
         R+CVky81pEdVcOYByBFrnLCJinRY9UYfruK8T2wyHQTW6e4bbQYWr8FU5MTQnpEUmzm/
         I13XvGE7ABq8xR17lI9Zkf3M6uNvrWNWTp+bq9YoxUu87/4nhphSC7ejK9gSi/oGQ5xB
         pTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EXOx4KeIoy5u65m3f547Wl3OoIYqly6wuZi2P/gW0Wc=;
        b=FbAAEr6YJd9BV6qHbv27oByBmXWpvT6QYwuD8lFWh6JcfD/pTaQoZUFbnDRn6kwBQ2
         mVU+LP9M1VnxZmPoeeVy4WFkf32dsqfNPWgE2mUUl2UmMNRD4PJOTCJ9eRsUf10uf3e2
         Gy5w7GbTLCZ5HVJ2eZ8GBoIrR875mg/w9xnXnyew3H0YYKie6nKp1lyL1CKrVQna2aNh
         cxOc/0MXZN/I7MV4SJiqa2E1DozrX/xtMMUnmoFR3+v+a3328uAkqobdNoHynzTG6z1+
         MWiHqj7Ul21DYRaDIiRw95MvdsD0R3kjPQjuzD67xRLkaWgkAXMyRpIWurt2G3ZO48Kn
         +CQA==
X-Gm-Message-State: APjAAAUHDYsk61tuw+MXwItSVj/18rpbyM39XIi9ccTAk1YFGvdR8zMf
        cME83Vcz6FG6PXrdZUcH5uJeDUST91fi+xJplwiOUw==
X-Google-Smtp-Source: APXvYqzp4Po5ITkze/xPUJmMmbWc1bBXkKwp5O48dzl+OgvTFaArTL+3EiM1BRgEUeF2q1BFoRt5CfExhv7Ft+/C2os=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr3598541ljk.104.1559411115745;
 Sat, 01 Jun 2019 10:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090306.28113-1-brgl@bgdev.pl> <20190521090306.28113-2-brgl@bgdev.pl>
In-Reply-To: <20190521090306.28113-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:45:04 +0200
Message-ID: <CACRpkdYNSgVTLijca53kn6Ve1bje2U0TrVyvLAOU0Z=upv3R4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: max732x: use devm_gpiochip_add_data()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 21, 2019 at 11:03 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We can simplify the code a bit with a resource managed variant of
> gpiochip_add_data().
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
