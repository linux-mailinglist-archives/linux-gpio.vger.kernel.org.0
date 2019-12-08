Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1DA116439
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2019 00:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfLHX4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Dec 2019 18:56:45 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40850 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbfLHX4p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Dec 2019 18:56:45 -0500
Received: by mail-lf1-f68.google.com with SMTP id y5so9245160lfy.7
        for <linux-gpio@vger.kernel.org>; Sun, 08 Dec 2019 15:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G98iQ4Xz1596icAZ7mOyKIsOKgGjMdou0zMqC7TfbVs=;
        b=jaP0lKZzSBuq07uSKcJFRDfXUKQo0AVQBIHNFxx6la3qlyWukiqyuu2b6k7WWBtXiv
         qLv7E+qDTwIVVCnnG6ulWj81HpEdvl7f293zntRt7i5Ot0JCQVBmVT1L+6Q33vFuaVBq
         yHdGD6CSTwhkz5aCKq7TnyjRx9DqfNsgs++asIuoRnh64zevQ0vN+s7EMipU+pV1KnGT
         XdU9fQHfPDYviHFTnT7Z5lxfyOFRgoa6ZqUVeT39nXcwX6cZbc+roGLBIYzexWndx1mI
         dHMyfjt7nJD6xm8zGieTR0RFmq9RaKBFGVmtasmpup6ApzmcKv/a2ZDrEFW14AlUWc76
         0Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G98iQ4Xz1596icAZ7mOyKIsOKgGjMdou0zMqC7TfbVs=;
        b=IU4HUK8tWEjAU2z7mBaR+NMelMysU1H5LOa06P2EFn14QVMWHQqo0OvU0FpORTKahc
         QNUvnN15tJunYA+ujo4Cmbj3K9fuiTzz+tqD+SnlVbRTllFjIoO7KPjMAdAlDae2VKTX
         mVUQFC26rjeqrGtGkDgbH0IL9jNdcwZO6CYdbF9MB3rhYIVEHqDljN7krWvW8y1LouNN
         632CxONlhwUvljA6sKSKQydqD5BqKXezxQ7RINSnizolh540PHT6rpMaiXjF+6Rxae8l
         JVav9SflCHEgSMDuw3P8KUruZvsP+0UF3PlHEWb5edkGmDd3J2gU0EvOQbwhtyQIOIvM
         d7Qw==
X-Gm-Message-State: APjAAAXRuMvJNqZUFzLC/R/owj2YvHKPTaI0KfHICBU+/2ZEZoVYvbVQ
        YtZPuZFUUvcWfR+l/CQDhSCAhi0ZHoNBgSX+LV20xzIb4E0=
X-Google-Smtp-Source: APXvYqzVoNkq9pkmph0v2+xPiSjUlmLk/6GbSB0ueTQeLYHC7/MGvlWBMQmYVy24nsYfZn2LZ0YjErbZUliuhlouYrE=
X-Received: by 2002:a19:c648:: with SMTP id w69mr9095069lff.44.1575849403347;
 Sun, 08 Dec 2019 15:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20191206170821.29711-1-ulf.hansson@linaro.org> <20191206170821.29711-9-ulf.hansson@linaro.org>
In-Reply-To: <20191206170821.29711-9-ulf.hansson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 9 Dec 2019 00:56:31 +0100
Message-ID: <CACRpkdZAUH9+f6zS1sxVSLDdUnynEhbB7XqBETzcM2S122kwtA@mail.gmail.com>
Subject: Re: [PATCH 8/9] mmc: jz4740: Convert to pinctrl_select_default_state()
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 6, 2019 at 6:08 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:

> Let's move away from using pinctrl_pm_select_default_state() as it's
> scheduled for removal and use pinctrl_select_default_state() instead.
>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
