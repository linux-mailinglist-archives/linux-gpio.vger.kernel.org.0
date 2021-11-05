Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05773445CFA
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 01:16:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbhKEAT1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 20:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbhKEAT0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 20:19:26 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F6FC061205
        for <linux-gpio@vger.kernel.org>; Thu,  4 Nov 2021 17:16:47 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id m14so26507597edd.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Nov 2021 17:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hW9j4fRXjsypK2LBZZotu05pU22OkQcuc/ncvw3x6RI=;
        b=pbIJjLoXkL+canYdkoXsZCKefEFoq5u/2hu4PbFu0Z9ulwm6TbIKZS+7llSC6UkqPT
         fAGdAVF6yuqhnjlUtumqpTgwaLZ05FTlUmuly04laT8N6TIDlkZocXSWC4iP4AqRF/Uf
         lMagwJa1i/DnzdIoXkkVKMX1YN1vJN27FrebxqykazSNJm3hWbKtB1eHHDaRnM/BH/1Z
         VK7oMhV4/NQCNjWyrLI8AXwH/Ye8iY2RHuyCrVreO6oFFozIGopvZgvGTGYi5zg/RNDz
         731xqF16tC5AT8TzfC2lxTEjpWPd72lIWjIpTY9j/JbD6ttGUyne/jfGQrHTlhITQujj
         31aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hW9j4fRXjsypK2LBZZotu05pU22OkQcuc/ncvw3x6RI=;
        b=0kBsUDMLP8h2Yo++9SSpCb42TTb+p1s2u37zR7s4rtMvx6RJO4L4Q6SJDmMdI+e0La
         DgukST7ZQ8fp1ZCDphQ2xnXD2C7eyzbHzpIOHOKEnCu9c6/Uxg5l3fOuUHsyRA/EDLDk
         FQSL0PFVyFmL2W0w3tvvcePXCvEwEaL3AStPh2D49Y97dst+WJdvCPZFZueoSqFu9rKT
         kkF6ISKsJS04h0i8UY37DlLWfIYhkMUnK1FaA47R3W0M+L9hRyhSKSgawqF3uEq9Rroj
         yvyCb5g0NZSihFkva8F2w+YumCkUxLnyCXym2vXsxOFW6wHxaj9m+fe2xDNiaVGzeWub
         JUgA==
X-Gm-Message-State: AOAM530RExiP9rzqcMmJ4Si3G1FyNAaUtiEYCrSiCmztxMbxM53iw18u
        XHGuCY06vHHplxT2TjXC4pzKHmx6smAMLalaF2vrjQ==
X-Google-Smtp-Source: ABdhPJz8yDJeZ8Q0sgfBTWu3SvmDy7lzOQpVKbpjk+LSezMt+JHLrZz0I/msEWacixVpHsKXSMOg6bcbbeR3bcnzBbw=
X-Received: by 2002:a17:906:a3c4:: with SMTP id ca4mr64932317ejb.529.1636071406508;
 Thu, 04 Nov 2021 17:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211025015156.33133-1-brad@pensando.io> <20211025015156.33133-3-brad@pensando.io>
 <YXnG10suyQYqYv5T@robh.at.kernel.org>
In-Reply-To: <YXnG10suyQYqYv5T@robh.at.kernel.org>
From:   Brad Larson <brad@pensando.io>
Date:   Thu, 4 Nov 2021 17:16:35 -0700
Message-ID: <CAK9rFny1wHxuRa0uZkmsSoNncYV4V-6wsHdo10QXZnrYYmGtUQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] dt-bindings: Add vendor prefix for Pensando Systems
To:     Rob Herring <robh@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 27, 2021 at 2:38 PM Rob Herring <robh@kernel.org> wrote:
>
> On Sun, Oct 24, 2021 at 06:51:47PM -0700, Brad Larson wrote:
> > Add vendor prefix for Pensando Systems: https://pensando.io
>
> This should be before patch 1.

ack, will order this way for re-spin of the patch set.

Thanks
Brad
