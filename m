Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F03509351
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 01:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383061AbiDTXHR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 19:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383058AbiDTXHQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 19:07:16 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5581EC58
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 16:04:28 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2eafabbc80aso34448597b3.11
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 16:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FpEREu4SeXLkngfAouq9cgXQg3g799UvWzvJuLUJPhA=;
        b=NpfBl1JjpPzahZy++ENXUKPXbNVlfYpe5U2cmewY1Ry8JYEZMexFoqnTWEn/2GBPRk
         oXajgHV6HhDCFe6G7hNqA1fGOfZRVIyfl1T26XJgpRr2zDAD5Dd3U82faM1HRsbMB1wF
         aYwTmv5lHGxLEVILkYNe/9XiflvpqQD4gLsJVXselEpLWSH5P6mH1ldqZ+T+GPGsAhqF
         VDntvRllhyhcfPUB0GMyLzGpM5SAIZC928c4HQips6II2RZvovBt4vmakyW86WqaK5sj
         jd06Zybomj8NxLybtBAlvbMoNNZHq5nvGdU0jiwYJrCKFLysgs5rJp+JKcT4iplQfksZ
         l9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FpEREu4SeXLkngfAouq9cgXQg3g799UvWzvJuLUJPhA=;
        b=jFL1DvARt6nbSXWHGhodtehvuvKpfX1qJJS6iykPPAtvgQltkd9Sb+H0++j5GVjFmw
         6nOAxmmmMQAI8U3nAM5R/sIIqR5E65qLx53zYWJ46QmNNYO+2kFMsIrQ8AfILhtUmd71
         20GIyXxXLh0Kq5+k9q+ICHJW3uQFNRbABm0ITBrUIMnD5yJfRssNMREdelsQjwsnLE06
         O5eywmVxIQnbRQd1YgrLKZGJORXCfVNUI67s+IiFUv2OK5ymaIR3LjsLxx1hCzaKcLBR
         pnExPsoitZ11OSzCa/fUzEX3hsTsC++2PcdGI/4CqHcqQhPkQpoXW+8C4xNAo1miO7Xo
         PWTQ==
X-Gm-Message-State: AOAM5311a0MsuwFkhmG417fPn8Slmdm9Xqxm6ji0AGcXb6uj7uD5olaf
        ShazyyE2p26NaaPJNM43VdFxq5QdgOt5O74b8BBkTaHbpj8=
X-Google-Smtp-Source: ABdhPJwsExULrcGo+zB6QCeXOvGyyhhZONGahcox/I8dMPcIDaw+fNvTnfI0grkCX9NGGPUxkAaaipRC/LQyn5maIAw=
X-Received: by 2002:a0d:e813:0:b0:2ec:1e83:e5f0 with SMTP id
 r19-20020a0de813000000b002ec1e83e5f0mr24226692ywe.151.1650495868004; Wed, 20
 Apr 2022 16:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649533972.git.sander@svanheule.net> <8d4e0848f233c2c1b98aa141741c61d95cd3843f.1649533972.git.sander@svanheule.net>
In-Reply-To: <8d4e0848f233c2c1b98aa141741c61d95cd3843f.1649533972.git.sander@svanheule.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 01:04:16 +0200
Message-ID: <CACRpkdbSdDAKiFAsHBosdVDpBhWW-Keoq+t8GJ5LsyWjOZwp_g@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] gpio: realtek-otto: Support per-cpu interrupts
To:     Sander Vanheule <sander@svanheule.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bert Vermeulen <bert@biot.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 9, 2022 at 9:56 PM Sander Vanheule <sander@svanheule.net> wrote:

> On SoCs with multiple cores, it is possible that the GPIO interrupt
> controller supports assigning specific pins to one or more cores.
>
> IRQ balancing can be performed on a line-by-line basis if the parent
> interrupt is routed to all available cores, which is the default upon
> initialisation.
>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>

That sounds complicated.

Sounds like something the IRQ maintainer (Marc Z) should
have a quick look at.

Yours,
Linus Walleij
