Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A117951E36
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 00:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfFXW1L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 18:27:11 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44292 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfFXW1K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Jun 2019 18:27:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so11151144lfm.11
        for <linux-gpio@vger.kernel.org>; Mon, 24 Jun 2019 15:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D1Rlg1a8ZKYuDCntE03T6/myds69XNXDdwDRLbB08rM=;
        b=W0+65RFplxg7FJBqvGyEEYhcSSHIXtuCxUV3EOx4sCMAy1E/tGXaw619uogXQlf4/v
         arI1Noxe+VFGQcFPeo0uXk/yPQV0OsGTTtYL59YzaSLDKhfbrOPo3FfdUjbBaf1qF+A9
         DIdX+DjwBZkBuZaAqq4gEnBSJAtFoIHTnZ6ee50APMVKSU5ZaTmn1pi6zKdcUZz5brHa
         d2YLv81hdQWWEKw9g3wBqJkQrmvp9ht2bdfD+dHy017j/b2rLZZAnQ3kdl0aUS+tMo3R
         Q2bFou//IQURdOneN5ESjWah4+8ZpHc2+nGU3Z4Y2li3AX25x3PHqVMQGpG3GkaFQ5G0
         yYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1Rlg1a8ZKYuDCntE03T6/myds69XNXDdwDRLbB08rM=;
        b=tiCWyn2INWserSy1wrUzjSSJsyhfb7ueUjyYctR1oluSxNhUBBCRY5QXr4i8Qz25Qq
         5HJNinOy9aJ4ozsdtmpRjikb785Sv29Vrsuoz7miXpGzhR90xdjmqGAywKEQKLtzsn0I
         CiFGrx2uK8avrEFOgZTkzjuLt1qyOA0HxkHqgNRHyaZcgBwUg5sWxKEjVWuTnF+0f0q5
         IC+f2qCzAC2NZuPOICEgzOglCPIDUUWPGgCU1Gb0hBpfJs/n4IMeWwYuzQzzoqxEWaCA
         H8XHdKPzNF2YEwQOfZxD8nrMaO6G7DD4h+YLUVVd2ywH6Ga+pI6tz+ZzBKhr4BD5RpLR
         +7QA==
X-Gm-Message-State: APjAAAWqCXN9UO4QHpM9lGEAYPBdtTf6F0RrCcGxxweXZCqnUjSWqHLN
        7PJBxVFNxxDY4EzKuhUH4bU8vem4Cv2aSfqnc/ZsrQ==
X-Google-Smtp-Source: APXvYqzoxXxGolVXHsGr5DX1bR7Oc/15VXiuxkHWINNtUCFObv1LwJeDEVUzXneuF6ixTRhkIKr218mXmzBCHyIvfis=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr27237792lfc.60.1561415228788;
 Mon, 24 Jun 2019 15:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190621151725.20414-1-thierry.reding@gmail.com>
In-Reply-To: <20190621151725.20414-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 00:26:56 +0200
Message-ID: <CACRpkdY-07VEn1YU42Ris6mpw+hj4TJOWfgzykc57Ai8t+G_5A@mail.gmail.com>
Subject: Re: [PATCH v3] driver: core: Allow subsystems to continue deferring probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 21, 2019 at 5:17 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Some subsystems, such as pinctrl, allow continuing to defer probe
> indefinitely. This is useful for devices that depend on resources
> provided by devices that are only probed after the init stage.
>
> One example of this can be seen on Tegra, where the DPAUX hardware
> contains pinmuxing controls for pins that it shares with an I2C
> controller. The I2C controller is typically used for communication
> with a monitor over HDMI (DDC). However, other instances of the I2C
> controller are used to access system critical components, such as a
> PMIC. The I2C controller driver will therefore usually be a builtin
> driver, whereas the DPAUX driver is part of the display driver that
> is loaded from a module to avoid bloating the kernel image with all
> of the DRM/KMS subsystem.
>
> In this particular case the pins used by this I2C/DDC controller
> become accessible very late in the boot process. However, since the
> controller is only used in conjunction with display, that's not an
> issue.
>
> Unfortunately the driver core currently outputs a warning message
> when a device fails to get the pinctrl before the end of the init
> stage. That can be confusing for the user because it may sound like
> an unwanted error occurred, whereas it's really an expected and
> harmless situation.
>
> In order to eliminate this warning, this patch allows callers of the
> driver_deferred_probe_check_state() helper to specify that they want
> to continue deferring probe, regardless of whether we're past the
> init stage or not. All of the callers of that function are updated
> for the new signature, but only the pinctrl subsystem passes a true
> value in the new persist parameter if appropriate.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - add new function rather than extend the existing function with flags

I see you need something like this and I can't think of anything
better so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
