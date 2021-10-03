Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26ED42044E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 00:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbhJCWZd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Oct 2021 18:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbhJCWZb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Oct 2021 18:25:31 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E40FC061787
        for <linux-gpio@vger.kernel.org>; Sun,  3 Oct 2021 15:23:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b20so63909829lfv.3
        for <linux-gpio@vger.kernel.org>; Sun, 03 Oct 2021 15:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O/FxwEf/ljL+I4K8aO0+PoKOHCdArWeMASBh/CyW6KI=;
        b=qfEM6cF2OLMJ53NY12A502/ixv0G/JjWTBwhzz6Vs80kkkAQIwV4j3WjIHq5h83E/u
         gALIQ93uVr1UJCCJ7pO04EtYFUNvZq2YdqSXywDUODnWpCI6pOzB/VfhUt94H5QcAxWG
         TRL3VFh9QmlcuPxI36TjKgl1MINdLQlBv+TO42mDQBbz30Or59QJ4vcHNzWhvRvsRjTu
         NIPkbbtmf9Q87owKeVnz4wl7eOlzG9FRiVPadol+T23718Gc19uRPN4tWUXNbLn+l3GZ
         4w/x1gohDsTd2UfvH/EpaE1MojnqUZwx8cb+QttCiwl47rD14tQ56JMgDal2iHEuuZkD
         bJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O/FxwEf/ljL+I4K8aO0+PoKOHCdArWeMASBh/CyW6KI=;
        b=wpcSNxyl2N/5gSoecPysyAWtkU/iDr0SfNXAP6rUZBILjlVUuZlZa6hZ3w8GBFPC51
         HR6GcEb6uBH5raRLgHfgf9ZLUHS767/KRH6xY3yzOOc5JXS8D1YL0XPwAFVxQt2WrZvI
         ZCR2nFjHelZ1MYIyTFYrC+IvbKt2lsrkVYeH+4bXR39t3KFCkup2w8vQNGPOUpt2p/D/
         LSGbaiEx/isjw4XIONv9ltgWxnmo3RUKYHKnxyVGL+845AHF/FUuZBrvB7TFqLGTRrcr
         b7H9J0dGNmXlKIY+rQJPAoQkrp+7A7lfgLW7BTk0vINTinmZUuL7p2n6fF0S7y5NawcJ
         xozg==
X-Gm-Message-State: AOAM530L1U6p1WAww11ZEXvPGlCnTdhkgowX3m+JE0VMy1uIP/1IoDsX
        iAxW/ZvMzwflme5FD5QR9TAEgNm7QBVUOcV9Cw0HMQ==
X-Google-Smtp-Source: ABdhPJzEqjAKixPW3TyeCjj5pMRCXmNyWQBDT5fjYz1jQ20kea+SLwzvxYP/nVXSJ65JOfP1FUjILreDtm+FXVHhHn8=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr9206931lff.95.1633299821672;
 Sun, 03 Oct 2021 15:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211001191209.29988-1-joey.gouly@arm.com> <20211001191209.29988-3-joey.gouly@arm.com>
In-Reply-To: <20211001191209.29988-3-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Oct 2021 00:23:30 +0200
Message-ID: <CACRpkdafohAh8xdEgHGpJbZes8mMGjkmeYcz0=QgmGtSA2i2uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add apple,npins property to apple,pinctrl
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 9:12 PM Joey Gouly <joey.gouly@arm.com> wrote:

> This property is used to describe the total number of pins on this
> particular pinctrl hardware block.
>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>

Fair enough!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +  apple,npins
> +    maxItems: 1

Add some smallish description like "the number of pins in this pin
controller instance" when you resend, but no big deal.

Yours,
Linus Walleij
