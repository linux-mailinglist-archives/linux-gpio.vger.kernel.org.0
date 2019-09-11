Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36DD7AFE04
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 15:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfIKNsP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 09:48:15 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43673 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfIKNsP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 09:48:15 -0400
Received: by mail-lf1-f65.google.com with SMTP id u3so1388257lfl.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S2FkzxTJQZdA1aRgr3g7IfWgwqRJ3678xnPBx6m4Fms=;
        b=CruhKYJ8uhTQJdaRfo2tyzYvg9E6mmNU5ANaIq7eKbkALix6+pkrNYYb1t3wDveFEB
         7lc7oEHFw+3quiJbkIMPHjxdfP+5NMe5SIouivEfceOJali8i759pEUADxaZrIH0RDh9
         PWzvmsrz2Zbaohm3XHRPoRPP6GboKe4XAB0Ipqq32wcAZae7kjrolvThM3ssdlJIjSGk
         CuZprMrpqDPpOtirA3qmQSmWA2KsVTt4QHIH5X9hW25QmI1PFj1bVBDDAcspjg8csjsj
         I7/FmmPZscKqLnfldovfwi22iVbGPTejdTnukUMmzIJiys02XHfOT2ufgycq4yvtJdXo
         +OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S2FkzxTJQZdA1aRgr3g7IfWgwqRJ3678xnPBx6m4Fms=;
        b=miqxlHdOmec+94Q3V9wx8T25Pn5GqB8jJpDLOKK5s8e9Ps/dcH7BAw3CE2/8hoUF/b
         Pq32ilXPkL4WNrrEWG35UtHa0AZULWp0SsUdFgxs01U4f8hkQWQmVMNfy99woS1PRU7v
         0cxa+tR6VE7Ih2h18ywqLVkKYds/SJsJ5Jq0OH1jRdlTHzX1xR7buFPCB2ts4bkHfMVK
         gM09XNjGX+xynzi6X6qIhIX350eKsu7FF3CfvlzII/pmxoIoNs5xVuwkcsbTuvshZFoK
         PJTCw53aSXzu4m5LzT047ZhhxkUltcTVhnCPgokOtbzOu6RE0vSaps26YaXPahpDx/D+
         i/Cw==
X-Gm-Message-State: APjAAAVq1x+hADhRnKdr+yw5U5wqCUWM99j+GiIGDiyToonPi1YjK/J1
        jmxJUUfxquPIP3PWbI+lqLYWqUkvGRaL540Vy96ERw==
X-Google-Smtp-Source: APXvYqxx39JIRa1vOCzPEEklvsJZB8Fu3qWvJg8QQa1U8FjndIfq7kjWGZ3O2VEZhadsF1jneYjTpoIdzWzLSyG3Bfk=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr24617653lfp.61.1568209691759;
 Wed, 11 Sep 2019 06:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190906084539.21838-1-geert+renesas@glider.be> <20190906084539.21838-5-geert+renesas@glider.be>
In-Reply-To: <20190906084539.21838-5-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 14:48:00 +0100
Message-ID: <CACRpkdan2XJZBCJHykhEQXipNK0x5F9ssg3TJPZKrwTGsDzkSA@mail.gmail.com>
Subject: Re: [PATCH 4/4] gpio: devres: Switch to EXPORT_SYMBOL_GPL()
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 9:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Change all exported symbols for managed GPIO functions from
> EXPORT_SYMBOL() to EXPORT_SYMBOL_GPL(), like is used for their
> non-managed counterparts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
