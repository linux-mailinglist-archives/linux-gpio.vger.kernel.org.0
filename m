Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF73505EA5
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 21:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbiDRTqx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Apr 2022 15:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347734AbiDRTqt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Apr 2022 15:46:49 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAC624BE7
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 12:44:09 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y20so8558661eju.7
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 12:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+cYNkWxoDWY7WQLvOQe6NjPNNtvEEXkUmWTaaS1X/k=;
        b=kG4UIjnTl1nk9f9dgsx5xtDBQ68QqSLMqmSNUj5J/+bIH9Hw2cC6uyT3ONdxJCTkaG
         gn5Ec2MnuUfhPzNB0u5k8faAwdcdIldcYbj8ewy70yz1d/t66YTZgEV115uug5gt6yp5
         7lJ1cqiChMLFUaUA+3cp4k7+dNwkQ7xkaP3BYSHOIVrmXthc2rJOASzeh0re1S5T8Hmy
         NdPoZTcPi1JmFLz6jt6p7ymdyXoERz/UGuHTjd21qRvr//5yEvGpiX/YFpbVuhar8z3V
         BFQZ73Ka37VMn/eD3ORuPhQ+1qmX1cY/7gEBOD8cSBa1OKuV5uLTBmXFHvkZyvssZqOV
         IT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+cYNkWxoDWY7WQLvOQe6NjPNNtvEEXkUmWTaaS1X/k=;
        b=zpXkxnGHQSkkDpBNL1BQhi/ebnMSnGcpu4WS1vJEnX0ulP36Rd/gvRDr5EmDMEUq33
         x2ScefQET18XLF1zdxhfQ1opeFNGAXk6VX9vZq7mxfy9YfUEHKaEZkjWyu8VdamJX+eH
         jQi6TPtKOZzABeaEB8Am4aVklwyJZZYJ3x0Ms7zTAkyfnfB1mR2XVY3F9LC5lfxYO0Ai
         eejkHSpMforzlfhG7iq4SqSvUWzaAmiflZRjENWpAoIJIODN0WR8Qn76sUOXs14DXcIq
         oCkyvEfvaGgyrDA9LhQ90modNh121tapnPk2tqB3mlG8BipFRbu8pWiGwnMhBjSuLVIP
         wWLw==
X-Gm-Message-State: AOAM5300wo8e0DVD3+tdKrmh2j1WM+uNtvgafAyQFANyQBOfHdQoZ84A
        f7y8zsJ+BUeFb8b/OWfMuq/YQaQWorlKyUHmT+wM/dGh0DMw+Ku4
X-Google-Smtp-Source: ABdhPJxQS8d3T2yNC8S/Lr+f72Mrg6sxcX3zd71Imvw9s2Yyzkx6nS3/IYEC+AP4yyq8iLd5ik1QddjCPs5TpD3ZUX0=
X-Received: by 2002:a17:906:d7a2:b0:6e8:9a34:c954 with SMTP id
 pk2-20020a170906d7a200b006e89a34c954mr10178060ejb.697.1650311047913; Mon, 18
 Apr 2022 12:44:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220406205156.2332627-1-linus.walleij@linaro.org>
In-Reply-To: <20220406205156.2332627-1-linus.walleij@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 18 Apr 2022 21:43:57 +0200
Message-ID: <CAMRc=McoCiwkd3Rk2tWkc7i3kfxfJysLwETWTw1WKFOv9Efh8g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: ixp4xx: Detect special machines by compatible
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 6, 2022 at 10:54 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> There are some special clock amendments for two machines
> formerly detected by their machine_is() boardfile macro.
>
> They are now migrated to device tree so use
> of_machine_is_compatible() instead.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied, thanks!

Bart
