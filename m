Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDF110480D
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 02:27:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfKUB1j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 20:27:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725819AbfKUB1j (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Nov 2019 20:27:39 -0500
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A7B920898;
        Thu, 21 Nov 2019 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574299658;
        bh=R22Op0DeOX2LBrbP7cckMdDgBWRoMNkNLhX1uIRD5F0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wE2IQ5OAY/1KErp65KA9zmFBjOLSjmEtUmphJIXe1FjaHxf1TQj7dlkU0XrQyFa7y
         nrgue+jE0nOxEOBQc0eymSqqMe9BbPZ8ZIuXHNwVvOrVF5fSgLkc2Jcf58FHiQDnEy
         yIAACPiyW+z66nBGhD+t86wNZXC+zUEsABeuG7H0=
Received: by mail-lj1-f176.google.com with SMTP id d5so1292059ljl.4;
        Wed, 20 Nov 2019 17:27:38 -0800 (PST)
X-Gm-Message-State: APjAAAUDxLsErrAcWOq2melSLhtoVrT4HFEXQP0L+ChKxyZ9VG94bFcP
        EYXIjvuNBWkjotgdZMa6Hf7mf0liSaYj2bHzIgU=
X-Google-Smtp-Source: APXvYqzzC4/Fcn5mZhi9416C655teQ+R71jRODP7JGvSHDRSKX27QQZKpiWfBMhadkypvz5QsSQ19ELC6H8QXJSBa5o=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr4599321ljj.85.1574299656479;
 Wed, 20 Nov 2019 17:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20191120134019.14333-1-krzk@kernel.org> <279930f8-7463-555a-2dce-7c50fec8067e@pengutronix.de>
In-Reply-To: <279930f8-7463-555a-2dce-7c50fec8067e@pengutronix.de>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 21 Nov 2019 09:27:24 +0800
X-Gmail-Original-Message-ID: <CAJKOXPc6C5WE0mV4=YRGBkKxLb_CWYKGAK=v43NjJW8MY8FMEQ@mail.gmail.com>
Message-ID: <CAJKOXPc6C5WE0mV4=YRGBkKxLb_CWYKGAK=v43NjJW8MY8FMEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix Kconfig indentation
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 20 Nov 2019 at 22:15, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> Hello Krzysztof,
>
> On 11/20/19 2:40 PM, Krzysztof Kozlowski wrote:
> > Adjust indentation from spaces to tab (+optional two spaces) as in
> > coding style with command like:
> >       $ sed -e 's/^        /\t/' -i */Kconfig
>
> >  config PINCTRL_ARTPEC6
> > -        bool "Axis ARTPEC-6 pin controller driver"
> > +     bool "Axis ARTPEC-6 pin controller driver"
>
> Here you replace spaces for tabs before the prompt type.
>
> >  config PINCTRL_SM8150
> >         tristate "Qualcomm Technologies Inc SM8150 pin controller driver"
>
> Here you leave the spaces before intact.
>
> Intentional?

No, not intentional. Thanks for pointing it out. I made the sed
patterns precise - 8 spaces -> tab, and there you have 7 spaces
(ugh!). I'll send a follow up.

Best regards,
Krzysztof
