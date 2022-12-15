Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3111E64DBED
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Dec 2022 14:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiLONIM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Dec 2022 08:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiLONIL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Dec 2022 08:08:11 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED4A2BB15
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 05:08:10 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id d128so3363148ybf.10
        for <linux-gpio@vger.kernel.org>; Thu, 15 Dec 2022 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V04G7+A68ZQglwDMc6Q+KsDFckYTIGAgJUXUPvtGlho=;
        b=j04kNvtJyiuHSMEKnq91X8GpPcC65XLbqL/hvJ56XIW8hirk9LKOznjXtfrzgNxo66
         8s6hUyb1jp9SzwfbUSkuEFdugWCjDT2aDNP5Yfl59eroNh37/1egS5Y6nziXZX7gr2DR
         5S6v1DqUgjX3R8HQg8CxpywPZnFwv+loVkp+7TcCqvTwE6zAzwye7XvcFiW5iwDxvaEE
         w+CXq2SPskNsKA2WmXGpa2kXvPgYj4Tlz71IgwaP0E/5dexdiAmRpSAKDARWytsw+2Uo
         kat7AW8MiboGFUUEeJSYdsUeTIPR9LhVnETrjDkhg9z7EoOaHp3M4HVexT77Ps9yRCag
         Cc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V04G7+A68ZQglwDMc6Q+KsDFckYTIGAgJUXUPvtGlho=;
        b=XD/bvaMoWbSSNl62uw8jCL1G3skLrcPn3bezuCLmKcYwlEzoaQSO6vH3iYIJ26q0lL
         cilTgN3HstjtoS4ifSjD7bN3oiMNUuqeaSG80f3kaIPiJoIkwWiNyahcWqGv/4LWoWDX
         3nP50UNFe4Luj4pK7/rI9VR/J44p42AVtBs9VgEi6vEey/XyiGTsMnXc/e5+JpMuKoTn
         oC9Ezho3BvP6cdWtU0D/OtOE0pPKMPrVGdrPXKbjzSSa5VsCuLuYcRMezJB8XJg6q6cm
         HPSkWRa9nA03QNp+cdaw4hc+kuYXpgO537yEN3Y1CsvE/Z11StyIuWJqbeLKf6LZMnYk
         o4Yw==
X-Gm-Message-State: ANoB5pmVkSJZ01It8PqHRselspX9s5UMehhNISBdZ2dNniqi3YfIWw+0
        iAB92vfdEUIqdIjosOKQFExQXT3Gh0UrWdiueqc33g==
X-Google-Smtp-Source: AA0mqf5tl7uGp+ARujPJmmWZ2D+OjGQ3o9II5Ojsas5TFIZM6/6f8USt95zXRrxg5929BEB5JKzQoQjfQr8RDzP7aQg=
X-Received: by 2002:a25:cc0b:0:b0:6f3:f978:efaf with SMTP id
 l11-20020a25cc0b000000b006f3f978efafmr57662275ybf.596.1671109690049; Thu, 15
 Dec 2022 05:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20221213135227.14398-1-johan+linaro@kernel.org>
In-Reply-To: <20221213135227.14398-1-johan+linaro@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Dec 2022 14:07:58 +0100
Message-ID: <CACRpkdacNE=dqoHc2_tzaSRTC0Uk=cqbeqFLAGijd=YUJH78jg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use irq_domain_alloc_irqs()
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Tue, Dec 13, 2022 at 2:52 PM Johan Hovold <johan+linaro@kernel.org> wrote:

> Use the irq_domain_alloc_irqs() wrapper instead of the full
> __irq_domain_alloc_irqs() interface, which was only intended for some
> legacy (x86) use cases.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Also semantically identical as can be seen from <linux/irqdomain.h>
I don't know what I was thinking.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
