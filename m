Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9A01BDB85
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 14:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgD2MMj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 08:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726669AbgD2MMi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 08:12:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669CDC03C1AE
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:12:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id a21so2300583ljj.11
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2020 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+vmsu/fwPs4oBXZNMxWYLe7MCK2oXBROz7k2oW8iuVU=;
        b=zwlAAJ9nJlMD2a5IChrfCW2OFWh0NNBeo2TJZRkCy2uyh37eWiMVFQ72IPC7DcpMxx
         fQRcjYZJ5JKxaU8fs/knzvbTgYG0HoF02FuSesWF09CKEwzf14V+pyXM5eCxyLv3anxY
         crZSju5V3kzYc0GRbRYi1qiyuQsAWQzWRlTo34hgoCWWxVhBrUFMRVcKHsuapJABo4T4
         xIZ2EeNzKCB6GucCqqcPeNVhHwtCx8SA93ToNo19jWk/BnOmKuwq/sw2FBlvsQNcZASw
         O5IK8Ldupd2KxPbf8XLp7bV72eGzyjxKqRPaSuN/8adAJuqQj6KEb3bs31YGhRgRgZx+
         tfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+vmsu/fwPs4oBXZNMxWYLe7MCK2oXBROz7k2oW8iuVU=;
        b=G5prSrK51K/0jvXHVvZrZsO92a9UAyVZbwJPkXV6N8BxBaYf03D83qICLYwygCdv9k
         VQF+bVcpaHh9VZ0Azl5bMqf49jct2OtORw+Lxz99/VgrNwN9poDUatsz9oTcfpSKl3pd
         7jB0HvSf+splefIkWVsekcO3iazZPzKhE/GUXaA2l3TZ25hsmCNT9kwDybG5zYLmtCg6
         sa16pqmDN1AWVDzpR3vmHT/YjbwtszJbkRe2qZKCArVUNx48Xv76ywrw7A+cCWtoTRQo
         TGnuOns+Q+2hUxaRlPL7Dw9YPnox0dTD1byT5V9Q6poRQd/0jAJe/gkFhXF/oFxES3en
         GntQ==
X-Gm-Message-State: AGi0PubNvU4mwJFpvBGFewoWOVMmv0tg7v+mZii1PahB0xQU/d5k2JHv
        pjBIPnMBysMIvFayJkm1naCZmW+aK/yXuZOup1tfwKSpyGg=
X-Google-Smtp-Source: APiQypJadb433yUV+3CvSyHkcenoW49EI2HbqVsg3NYeo//Kqhy39vGkteTUQQYPvvWVEtHeYRVPW0nafRpsIBBtHdU=
X-Received: by 2002:a05:651c:32e:: with SMTP id b14mr20911578ljp.277.1588162356793;
 Wed, 29 Apr 2020 05:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200428195651.6793-1-mani@kernel.org> <20200428195651.6793-3-mani@kernel.org>
In-Reply-To: <20200428195651.6793-3-mani@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 29 Apr 2020 14:12:24 +0200
Message-ID: <CACRpkdZ3b-VLvxN06H_4cDOtUEQTVbe=Zw+NA=YjssMzK2d2sQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
To:     mani@kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 9:57 PM <mani@kernel.org> wrote:

> From: Manivannan Sadhasivam <mani@kernel.org>
>
> Add gpiochip support for Maxlinear/Exar USB to serial converter
> for controlling the available gpios.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>

That's a nice and clean GPIO driver.

I would change this:

   port_priv->gc.label = "xr_gpios";

to something that is device-unique, like "xr-gpios-<serial number>"
which makes it easy to locate the GPIOs on a specific serial converter
for lab use. However the USB serial maintainers know better what
to use here. Whatever makes a USB-to-serial unique from a TTY
point of view is probably fine with me too.

My idea is that people might want to know which USB cable
this is sitting on, so I have this USB cable and from this label
I can always figure out which GPIO device it is.

Either way, it is not a super-big issue so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Is this a off-the-shelf product that can be bought or is it mainly
integrated on boards?

I'm asking because I'm looking for a neat USB-to-serial adapter
with some GPIOs (2 is enough) that can be used for reset and
power cycling of lab boards using one simple piece of equipment.

Yours,
Linus Walleij
