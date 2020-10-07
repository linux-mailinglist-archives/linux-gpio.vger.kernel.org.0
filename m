Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1BF285BC0
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 11:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgJGJR4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 05:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgJGJRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 05:17:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB1BC0613D4
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 02:17:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id 133so1255679ljj.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8uGh7FwCQVsEaQRU10K3At5FG2/9JxC6uGho+Uy5WLc=;
        b=ZMS9/cveuDXMSwvbiHVUdNS/sgKoK13pgzqeUFPU59/WIF9oXdaca+YvED7s3BfwzW
         9UuBhNQoTOQPd9LrtPqbQUCI5PDAXN0pOGjko8yChPSAdQ1yjmpCxf+4yLx0E84c0Gi+
         WwvhbqXrKCuLurT50RFhcAH6nlljW06Q+QCKzerzY9+cfMVPygmYKdIuohTS3WZRN1NZ
         FXCYzQ70GGKpk1N1JboJQ0CFkVSBlZSn1xFIVeqDWPBwXaZx3QX1OQFdFAdwEGkURHPs
         +cvrcW2BbRJWPD6ck611GV7NU1QoaLRP+0+AaYZELuUHw7WnkeaPvAjfcwp5R5oegfSQ
         xePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8uGh7FwCQVsEaQRU10K3At5FG2/9JxC6uGho+Uy5WLc=;
        b=M+0ObGM6VfKQTMvvoGwixK0c2n56WeOB/2Vm30mY9CriOzKYgucEWIPTwpAhdgfOMM
         FBZ4WTWGl1+Frj6Ftgxm3nPBH+bXbYUJt/GJ0JfyhH1Cs4nQ/J39FZqm9rIWD4WlldWo
         MWqSdrfhNQIrTzX9KyyMvmB8eC36AEiZaOrTn70noxThYQ+rj1D1SIgEMH8hynUzvhge
         BtARZGvhFqdNkpL9NGabtZ4lZdnQqny7hrZ9jC3iLAJ4JSDbUjknC5Ighe6SMK4pY9JS
         ZP4iWZDQSx5VHQtN0PlDHNZ6+6VCwlCVjZ+spqMtcQAu6tIFaOjytB8r2p2IvqtUmQ/F
         peEg==
X-Gm-Message-State: AOAM531LD7Qb9cv4D1XmTi6GfquAZuS1GuW9OfONv3sCUflhFtysuRET
        loULqs/B/yhajvhluRHX4ADlBXZr+2PH/G+mjve6+Q==
X-Google-Smtp-Source: ABdhPJxjuQXpk5FIl/0qqksgxzAprDeL1Wj2TwDzK3bXwtDKVnpHw6xmqCKyi5kIfQtVHeDXLKfAkFV7IEjJ2ME0TSI=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr767730lji.338.1602062272121;
 Wed, 07 Oct 2020 02:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201004162908.3216898-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20201004162908.3216898-1-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 11:17:41 +0200
Message-ID: <CACRpkdZdAs_FK8NU+KE5hZBVTZ-fBRDi7=zn0PqxZhPJR+zxwA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] GPIO support on the Etron EJ168/EJ188/EJ198 xHCI controllers
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-usb <linux-usb@vger.kernel.org>
Cc:     linux-pci <linux-pci@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, systemchip@etron.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 4, 2020 at 8:00 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> The goal of this series to add support for the GPIO controller on the
> Etron EJ168/EJ188/EJ198 controllers.

This overall is a fine driver, but have you considered the option of just
implementing the GPIO chip in drivers/usb/host/xhci-pci.c?

There are several USB serial adapters that have a GPIO chip
embedded and we just add the GPIO chip into the serial driver.
I have done the same with some networking switches. It is
perfectly fine for drivers outside of drivers/gpio to occasionally
define a minor GPIO chip if GPIO is not their primary function.

Please consider simply activating the XHCI driver and make it
instantiate a GPIO chip if it happens to be an
EJ168/EJ188/EJ198 controller.

Yours,
Linus Walleij
