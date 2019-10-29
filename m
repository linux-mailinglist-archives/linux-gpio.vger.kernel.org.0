Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E6BE8B35
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 15:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389245AbfJ2OwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 10:52:00 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:34382 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbfJ2OwA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 10:52:00 -0400
Received: by mail-vs1-f67.google.com with SMTP id f8so2772702vsg.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2019 07:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AghPO3C3rEgGBPotZ+vICco1DWQsd2uHdndQrS4Mhmg=;
        b=Hwng/1iREMu58SnENh22U3wjGobxllv5Tqdl4SLxKt2rJHJMiSBnFDHk0tk8PRXMfc
         Mlmj3c4mAJ+7d58g5EbhSontzBbJAUktNUENdEfVlLgpoFhjxBt+oRDVCNMZLh78ImpF
         5/1Mu84pLONjy3utBV6gpZ1tNFmoUgr4QV6/NshuMd+VqPjHdERr52EmJwCzO9lVP9DD
         XV7l8eSunjesHvuWBwX9Xyk00bdIjSaD1mP7kdDLOqE/0Ffk01zex7aFEn8amOJZTYD3
         Pl85KuEPuIhkiasQ1yQuSw8WFIVc8uI3/QnKLBZk/hZRhXOrRGAnwcJfaBTrb+3IDB07
         JWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AghPO3C3rEgGBPotZ+vICco1DWQsd2uHdndQrS4Mhmg=;
        b=WPbPbxIWEiKPnY+QT/Pg14pxV/ybkjhpRTMPbq51vcAUXTo0jUFy7fgv4b6XqBdnRz
         q3cWoYnx6BgwYENHLv1za+jDk40WFzOILuxxHbge6dA8m8mTY4UkZ65fSYlqeYtGLARe
         U7OdiFkmCavnk0KCBJuSliZSHM0k/J2vB1+0U8a2eztTpRpVNBYf+rsyrgub+g12HAM0
         YrDb8qF0g1KFGsZ/Lomd9bIGWHVsbIdUgmluB/TRoD8re5kkCBy7rLuLK23Tx7ckjJOv
         XxT/IYc79vlVewHws6r1l9VrxMCbMS1A623qudId3SaB+CwxHY7+QQ0HCkPgeIpzZiWZ
         8PXg==
X-Gm-Message-State: APjAAAUCQNNLz3rEWyXiRGjg8Z9KaaX/lJazJb8yLiYWGV8D0EFxCsgV
        epBjxT4LfJE06IFoFHDE86FHpGEgYblEvJO9zj9gEA==
X-Google-Smtp-Source: APXvYqxy+qA6VE5Nq1a9sMm7sQY0Vmiq6oTH38qQ4sCv5Md8fk8HW1K0XuZUl3bbruZa1JoQJbbOkNNLqDYASp6pmRE=
X-Received: by 2002:a05:6102:2436:: with SMTP id l22mr1897257vsi.93.1572360718925;
 Tue, 29 Oct 2019 07:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191028200555.27524-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20191028200555.27524-1-chris.packham@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Oct 2019 15:51:47 +0100
Message-ID: <CACRpkdbJhXxAXTBnTUxj7AkOBv1wBphCD6bJ5Vta4FT78x=--w@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: gpio: brcm: Add bindings for xgs-iproc
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 28, 2019 at 9:06 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:

> This GPIO controller is present on a number of Broadcom switch ASICs
> with integrated SoCs. It is similar to the nsp-gpio and iproc-gpio
> blocks but different enough to require a separate driver.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>
> Notes:
>     Changes in v5:
>     - correct $id line following rename
>     - add reviewed-by from Rob

Patch applied.

Yours,
Linus Walleij
