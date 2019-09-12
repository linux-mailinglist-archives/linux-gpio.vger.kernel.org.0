Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBDA1B0B3B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 11:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730218AbfILJVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 05:21:51 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:39386 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730083AbfILJVu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 05:21:50 -0400
Received: by mail-lf1-f47.google.com with SMTP id u26so1017369lfg.6
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cWbAmMUJiY4SaUXIYl1Pgpjy5EqqAYfJcgipoXnRTYE=;
        b=AdeQBBjy6CL4VP/0PlsP6CszN1UMsI32sHf9+jhrLCw9n+HVEKlEbvGqTY021gpHvV
         pyfLTPZ8qa3WJ969gKBL9quwpznQFuIJsMvOiAmk+nGsfWqxn5xfRIhPA0vnyma/IxDd
         kZO1BcdnNJjN/wGSNNND/aCfOd2cMGpiq97ol7SVvnxXZ2hFSgKWMYI9th0BQlsbsnsy
         vIBpUI1WuXg6gnYHakgGbqH7zH0sBB6BjvBPN77lpPQrmb+thij5zFwcLKoFXvpJUnKB
         MAVMuG7O8tBqxAdxHVK6Vn82GFAk5B0qFUVybzxm2IlkMVaMvQNAfB7uDS2HI7dbE/vM
         l0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cWbAmMUJiY4SaUXIYl1Pgpjy5EqqAYfJcgipoXnRTYE=;
        b=HlnrgZeemn0uaZdfgcom3B808yU7ZUY95sk16wyrZD+uC0cd8uuE8ZdBXW7VzFXC/V
         nsAmXuZ2ewcqr57n672UB98rAXO3a6iMO+UMfwcWH1xrnoguZhxB4fPTNlU/7UXlra1M
         SGTOOQtZUwWkjlLwO5K4K85aWbFAh8q47syvVXWoEGw8n/xu8wwbeyN0lAxNe9lHCsFl
         qkffEJ4OaLsYbSdBi8KhZ5BioCdusM6SeVrVLZDuT+BOy/cRHwmplBf9B0qhItaRBqXg
         dzhU2u055pyvfgYYwUkAT7nl3Im9F8EhPFKMTj0Ym1zoisQlmJcblXDbi7KpElAmBuf0
         Ficg==
X-Gm-Message-State: APjAAAXKwfVflpMzHtuE9OzOpiHU/dfs2aiO1o4UMuZQGHEFnTsuUwxU
        TyNTiWfuwJLqAdJyJn9W/ppguaFVoVDwpHtn5Et7Jw==
X-Google-Smtp-Source: APXvYqy8wCgVEJmrY9znr0K+2GgttgH/5CMv7j/yFWMaCet7QyhGODz5XCya6F+CNCIqXd1oVc6o6Qx/zcl3krZnuU4=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr27193881lfa.141.1568280108846;
 Thu, 12 Sep 2019 02:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net>
In-Reply-To: <1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:21:37 +0100
Message-ID: <CACRpkdY=Jema8LmeF_k47gQsdxTHPi5sVCYM3ihe47=bw6K4cQ@mail.gmail.com>
Subject: Re: [BUG] wrong pinning definition or uart_c in pinctrl-meson-gxbb.c
To:     Otto Meier <gf435@gmx.net>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 10, 2019 at 5:01 PM Otto Meier <gf435@gmx.net> wrote:

> Hi i tried to use the uart_C of the the odroid-c2.
>
> I enabled it in the dts file. During boot it crashed when the
> the sdcard slot is addressed.
>
> After long search in the net i found this:
>
> https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856
>
> After changing the pin definitions accordingly erverything works.
> Uart_c is functioning and sdcard ist working.
>
>
> Fixes: 6db0f3a8a04e46 ("pinctrl: amlogic: gxbb: add more UART pins")
> Signed-off-by: Otto Meiergf435@gmx.net

Looks like a simple fix to me, Martin could you take a look?

Yours,
Linus Walleij
