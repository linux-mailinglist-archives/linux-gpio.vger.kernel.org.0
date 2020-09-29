Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1414327C8CE
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 14:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731866AbgI2MFA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 08:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731860AbgI2ME6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:04:58 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1AFC0613D0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:04:58 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p15so14593064ejm.7
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XuEHP21dhMBh5T4WXO9Xuu69AATfQ0zf7NJ5Z9eebL4=;
        b=wueAy6HOAcQyM2KhegOErfUpHxD3ely0mqmCcGRxYnv3LowQpHQRGXzC6yDv0wkNb0
         q/2L+bZxK2En+oYdP4J/VWWKl8wZrbIWNov3utIVNEkmeyiqR2Zfiu3/KysFtIrl9kHG
         NobTiJSZKFQ+c9ivq+xh2OC4JdKJnV69ciBMS8lZGV1csYb1uGJWIH2RWSMYKMw/sLVv
         fhBlEFeu6iO9KS+6RWx43LwE0GC59Su6pD6RHyNpeAoI2UzfHYyUc2mqv1GYjVVq+RW0
         rEGEy9sugD7TRBKcyGXGQHBwlHP0NrfzO/KYAH6NjJ+2XAQzINGCTrM5OgPtod+o4TPM
         Jopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XuEHP21dhMBh5T4WXO9Xuu69AATfQ0zf7NJ5Z9eebL4=;
        b=m5Z3PwRYxM6TnugmmLy5nGl7xnFRucFc2l23vuge7WFdpctNpV60PMAgEyKGJQp2BF
         /8m4TmMRLNQqK6RY67+2R0bmqCrCHPsJ87YAkyY+Pv3sMtiiNCz+Ha4CPy/e8HTqfPgv
         r/1ffuKRLQb6+hkQ8CZDGUyXI02YcLaurqFNsayjUav5lig/gQzT3xn1pZRGllAD1B2U
         aBX47OAHGASjz/J/r1ZI2pqSxBSIegOvjWTAg1yEolamXOTLw+9EWHEQQxngwJw3lDzn
         FjcaudQUdZeibwdB9kfjRw48kgw3f8we0mHOIA+R1uM2n6mkgIhDof1W8HNR2ri6kFcG
         1VWg==
X-Gm-Message-State: AOAM532cbwK7GP2B5ouaAurGnKQMJGKfXcrJiQY821/gd94zbCGEU+uX
        uu1khLq0H4dehvQxn+NraNSsNCOZkDwQcPKQze4Fjg==
X-Google-Smtp-Source: ABdhPJz7awWKdkxeqGhj84kwINNLUBgCSDG/lRgEu5OC3wXnNTaiMCnWTwxOEKPk82plp2jM6wXgrPtvn8DqUzUc2Vo=
X-Received: by 2002:a17:906:311a:: with SMTP id 26mr3426532ejx.226.1601381096838;
 Tue, 29 Sep 2020 05:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200928184515.7345-1-krzk@kernel.org>
In-Reply-To: <20200928184515.7345-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:04:46 +0200
Message-ID: <CACRpkdZ9vbsFTsT4A+BH=8x++Uc4EujnMd9DTMvRfQ7QPnLU2w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,pfc: align example GPIO hog
 name with dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 28, 2020 at 8:45 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The convention for node names is to use hyphens, not underscores.
> dtschema expects GPIO hogs to end with 'hog' suffix.  Adjust the example
> DTS in the binding.  No changes to binding itself.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Patch applied!

Yours,
Linus Walleij
