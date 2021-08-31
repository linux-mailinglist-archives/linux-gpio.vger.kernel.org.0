Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665DA3FCDD1
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Aug 2021 22:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240792AbhHaT21 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Aug 2021 15:28:27 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:38868 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240607AbhHaT20 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Aug 2021 15:28:26 -0400
Received: by mail-oi1-f180.google.com with SMTP id u25so567486oiv.5;
        Tue, 31 Aug 2021 12:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B18XCxdh5roXXYBkgIgsolQaF3/RyCT+RYjyoh97Brk=;
        b=p/K7gazXe3lixbGJQhpSlMMBsSaHaLL9r11KMAZPuYN6euzDBiqxKMoPvLu397c0Fx
         0Yjhxb7elnwVI+RgLm0KersY5tqv1Rn3KROfZfKxND20+0QCkXuP3JFfZxcVpMz1CZbY
         +V7xCMOeN4zKnCvltLRJLyV48jfcJzBAzL8N0BA5WtNoeaJy7OhTjINMYi78FGsiwEo9
         st42Pp1rtkSUYeb/kvshA/f4l7aYkJN3TnjEQgTErml7RKRAxGgG+QkQGadiLe3rE6Jk
         aYBMpz17HUCKL/FONrAzgqigRS4N3MR3OojosvZv9lJS6rsfW41gOdrgh9eoQD+doIMT
         k10g==
X-Gm-Message-State: AOAM532L1Ck3ANTACeGOZLg6bMaXtLx0U3s460Y6JEANYkSIwjxNqYhX
        3tvAg7MDFWyFsVd5Ezq+mjwbX5pO7g==
X-Google-Smtp-Source: ABdhPJyISGNvUkiwv/aZwGtTy7OmqleXpitzw8KMrZYdmigKN/S7wGPQvq/Drjnoa3iN8bG0Uc6OpA==
X-Received: by 2002:a54:4182:: with SMTP id 2mr4533320oiy.66.1630438050741;
        Tue, 31 Aug 2021 12:27:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o8sm3712041oiw.55.2021.08.31.12.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 12:27:30 -0700 (PDT)
Received: (nullmailer pid 515234 invoked by uid 1000);
        Tue, 31 Aug 2021 19:27:28 -0000
Date:   Tue, 31 Aug 2021 14:27:28 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org, John Crispin <john@phrozen.org>,
        Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [v2,05/12] dt-bindings: pinctrl: update bindings for MT7986 SoC
Message-ID: <YS6CoAxnarhqdTl+@robh.at.kernel.org>
References: <20210817074557.30953-1-sam.shih@mediatek.com>
 <20210817074557.30953-6-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817074557.30953-6-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 17, 2021 at 03:45:50PM +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver.
> The difference of pinctrl between mt7986a and mt7986b
> is that pin-41 to pin-65 do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v2 : deleted the redundant description of mt7986a/mt7986b
> 
> ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)

This is adding a lot to not be in schema format. I imagine this will 
need to be a separate file if the pin and function names are different 
for each SoC.

Rob
