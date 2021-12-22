Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4FD47CDBB
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 08:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243117AbhLVH4a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Dec 2021 02:56:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243114AbhLVH43 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Dec 2021 02:56:29 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7540C06173F
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 23:56:28 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id bm14so5277885edb.5
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 23:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sb0ay+kl0pJXaWyi8F5Q59vUzHY3JJy0J9Q9Sl4k/Vs=;
        b=3p6e6VMkYFdwmTWd6/iVc/jL4aXQ48e5tzJF93pB2nQdXYj5jsX8SqIfwvhRiKUOav
         CDPbx6w9s33QFrquAeA8QauECrdo0EZFhS2D+D6Pooc2iDxzRW9hrn6qx3KuSMvZu5uU
         EWt4G8yNpeUQwMXajBD5McDg9ixGeqW1xycyIHvK0ZoaAOiZI/5wqGBrWZ1RQ8gOYF3I
         Od4GRxnaGI61LxxW67zQV4Q+21pxFabLN7BUjENvy8XiJaiaeM/AgQ04n43T9PLIGPtH
         3UjDIEVyd69P4C7lHgR4ELfME2jVKkcMYLmg0TIOsuiiJqjz25Wmuj6ncs9V6+VJZ30L
         Z7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sb0ay+kl0pJXaWyi8F5Q59vUzHY3JJy0J9Q9Sl4k/Vs=;
        b=XgLZvJxduD/Fo8OQFv3zPiTii9KbE3LlrhUZ8g/vHNPVuY97TyyYvMzqijAPf+KSVL
         BStBEQb/n3ciYhBQ4G+VOLl/a7tEWnQ6DKQxBJ8YLdW3q5B1mws4RaWOXUhI4G1kUe1E
         EjYUfZk5GisN/dFIFYC86/K0sUANkfEP+He9BuzAxQL7IRVw8Vh/cZCW9DLFxDZnQUwf
         mjmKzHaKEZTHH63mbRTmJY+kr1maejR2XdSD+R+8ZVFpnn9sIWH6DRgGtH87qXnW+Mhw
         wbnAw09wlhpgdmPYdJ29Y86k0e7mZfPtymqecLlWxWDi0/xoOu0tvOxwTtvvmas6gAnO
         axRg==
X-Gm-Message-State: AOAM533kyesMHncI3Jd1ZaoC1kNWVlRzromK8UHjlx5kufL7lwCHj43y
        Mqud2IE1yYruAHLv1+/zQFl5dhu3LFGwLZMaV+eGrg==
X-Google-Smtp-Source: ABdhPJwEFfl4Har97114AUPMOYWp/x1fsGdhXAjMy7AGuNjRDUzVsD0H+tOgPc788M9iBabjwcXPsdmW+vvkcoiOgTA=
X-Received: by 2002:a05:6402:2813:: with SMTP id h19mr1762161ede.365.1640159787531;
 Tue, 21 Dec 2021 23:56:27 -0800 (PST)
MIME-Version: 1.0
References: <20211217112345.14029-1-nbd@nbd.name> <20211217112345.14029-14-nbd@nbd.name>
In-Reply-To: <20211217112345.14029-14-nbd@nbd.name>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Dec 2021 08:56:16 +0100
Message-ID: <CAMRc=Mdm8-f4eqD6zTp-OaAz5972qTdRrzjidP+9tm+536yaEQ@mail.gmail.com>
Subject: Re: [PATCH v7 13/14] gpio: Add support for Airoha EN7523 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        John Crispin <john@phrozen.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 17, 2021 at 12:25 PM Felix Fietkau <nbd@nbd.name> wrote:
>
> From: John Crispin <john@phrozen.org>
>
> Airoha's GPIO controller on their ARM EN7523 SoCs consists of two banks of 32
> GPIOs. Each instance in DT is for a single bank.
>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
