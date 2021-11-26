Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B58D45E3F6
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 02:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357289AbhKZB0G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 20:26:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237270AbhKZBYF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 20:24:05 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DAF3C061574
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:20:00 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso11712063otf.12
        for <linux-gpio@vger.kernel.org>; Thu, 25 Nov 2021 17:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zILAUlaIV7aJ9HFemhTNtCeWWoQYbbBLgLgu6h13jJk=;
        b=Ne84rEXT6LgY8hLs1tsqHhAGKAzOdSYdH9m/Bn9AsTcVFUb9Bl/IZHYD9Y75k4VcDV
         3xyZWkm7j9D66lId/n/wpI5mu8L8/kGcL9VFdibeEy5GJNFTDECCbob6yMKykFv8Jhbz
         xe5/Abf3IUGBI4hSABwG4KfZCYQNa0gJyiaEqvgsgLaQEJFlrrlrpZnPCMJh8NcwWeUc
         O5KiPKRhDc2Zb1UYxeMMahrVmyeeZDePSuLWU2bLnGMc57CCe0NZrEfoVTv9OVeI+iXP
         VLEFNhoUkY/n8GS0td7nOcD5iyYKHwn9qStfCzZi6c05q2pWmBp4A4RC6DI800uaVMia
         /neA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zILAUlaIV7aJ9HFemhTNtCeWWoQYbbBLgLgu6h13jJk=;
        b=I8FSDywE/34HKO04axMFHLFXUF60LFxl3QbhEo7egE5NHqCZZCAzTPtBbroA/toJ48
         k2LEjEErnDEq+ncGY/yPqWGaUOLN0c30nzd20Ig5Xrqb94IorRCoLIcRmGgX2cg+gtsb
         alT/IUfIx6Aa+mQ41NelwJai4ifr/pbidLZbbIBR8nnGID/h5bYuyVYMOslr0Dq12V80
         oFJGFJQ5Wfy4OaIq5veIIVWiYV6QVR/D3YRz6flMSmFDDCELX0ZtMJhpgFvdVqpRBp97
         ytlzGp7h4fizB7khtL+B7AVf7dmseFw+YuR91KdWkUr70XvSa4+sKuxSSreolcdCGqG+
         ecGw==
X-Gm-Message-State: AOAM533m/VKmioruJkt1wWmszXGVern4tiAC3J6WQVfEREJ1dhctl+QQ
        wa63MEWDXzQDvVqR26YgSnkPmNK6oCxusjr7EB6F0QJ1LSw=
X-Google-Smtp-Source: ABdhPJxojQc96RItplcp2VCiVFKzTqltdfg//P6PiEk+RYErk3zmLvkafoq7gdusGDFuVF3QKLtkPoxug/1AkUykhMs=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr26012881otg.179.1637889599621;
 Thu, 25 Nov 2021 17:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20211125110738.41028-1-nbd@nbd.name> <20211125110738.41028-12-nbd@nbd.name>
In-Reply-To: <20211125110738.41028-12-nbd@nbd.name>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 26 Nov 2021 02:19:48 +0100
Message-ID: <CACRpkdYVqk0JzVipvg_2oqg86A2enba_GyhPgXPxdKp-brxTGw@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] dt-bindings: arm: airoha: Add binding for Airoha
 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>
Cc:     linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        John Crispin <john@phrozen.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Felix,

thanks for your patch!

On Thu, Nov 25, 2021 at 12:24 PM Felix Fietkau <nbd@nbd.name> wrote:

> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs
>
> Signed-off-by: John Crispin <john@phrozen.org>

(...)

> +  reg:
> +    maxItems: 4

Can we write some short description on what the four different regs
are?

With that fixed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
