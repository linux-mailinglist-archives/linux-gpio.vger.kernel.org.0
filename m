Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE0AA1053F0
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 15:07:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfKUOHM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 09:07:12 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40011 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfKUOHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 09:07:12 -0500
Received: by mail-lf1-f68.google.com with SMTP id v24so2740547lfi.7
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 06:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yR25p077sY7XsyzIresfvdGtP0NxdR3Phye7bNz8IVg=;
        b=CZiWmy0lOMSUMBEQdMx/dvvcTVUjQGVBpXZnRc5cLrC8Lf17LWwPQF5Ue+KBC2ZTlc
         lvcS6VGR90NTZiSpEGqtGHSWTCLg3HmrBLdf9GnUJFMj0TqHaMmchIbXjE1Q5E433UoV
         6rb2NkCG8Tlfy7Yt3mK9qzGuvUCeouGYHj+GNiA1pg2ex7KkaonvntMMb9fb9CRb9izC
         YrNQ3xr4hXKDmMmtH90fs84Vayv6fmfCJ+//aDIo/Pc+dqwm16pW7arYu5hPHASTWnGl
         vDChdWc9A5DqBuR067SuXgY0OIgK4mwwq3R80N4EBorhGyOguLd5G7Km3cuykdCNwlO3
         RG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yR25p077sY7XsyzIresfvdGtP0NxdR3Phye7bNz8IVg=;
        b=LkAOXUOdp4oFtVHfewyg3mb6Q6EkbUejbzpRjqrh+dnPT3w71X7Yfe0aD9CvQ9NIuU
         n9Suv0zQvS4Y5M5OuuoKjpVBVOOgLBe8F9AJl5nPbB+6x4bwPmyTEiMIg50A5WuAhNqq
         jWDYv4Ce/uNM9LAArsXVvnKvBqMc3zKIJoVe5rI5OnH12lXV/4ilLyfS6kTqIKzOAIac
         86Xnnu5Mj1CHMwLLO9UmRv9mMo9uU6w2bVKGWDRGN38/cxdQF0kKCkCS+eD8ioa5yGRA
         0w8qPsaFQxUrDOfP1dxvFWxKbSLl7DNzzbzFCVM0O4t00NxhZfcqnGz+nr62MU9RQpIe
         UgRg==
X-Gm-Message-State: APjAAAW88kgJl9m+Zv0NmIHdaRyBFnPVcq85dplNKGWLuAo2XU8L1JHF
        /54hHX8PsnGLu9u7YDzKU7wLI1p9MXjl5TrMhWqFWQ==
X-Google-Smtp-Source: APXvYqx7y+O12Uu5ojAu8QNAvcacX/eJU7YDlJdyJO7nQwQjAJB69Xsu//F9QRhLjLh47IajvAAakFeD7WqmHGemTs4=
X-Received: by 2002:a19:7d02:: with SMTP id y2mr7406713lfc.86.1574345231034;
 Thu, 21 Nov 2019 06:07:11 -0800 (PST)
MIME-Version: 1.0
References: <1574306382-32516-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1574306382-32516-1-git-send-email-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 15:06:58 +0100
Message-ID: <CACRpkdaQCsSdZQrBkTQ_B-kz2jngkFoEgdYHW3uoPRwo=GcR7A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: Fix Kconfig indentation
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 4:19 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>         $ sed -e 's/^        /\t/' -i */Kconfig
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Changes since v1:
> 1. Fix also 7-space and tab+1 space indentation issues.

Patch applied, why not.

If it causes severe merge conflicts with other trees (I don't
know at this point) then I might have to take it out again,
so keep fingers crossed.

Yours,
Linus Walleij
