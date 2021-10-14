Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE3A42D974
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 14:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhJNMsc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Oct 2021 08:48:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:53924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhJNMsb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 14 Oct 2021 08:48:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A6D260C49;
        Thu, 14 Oct 2021 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634215586;
        bh=XbSRCH8PSEwEGv16RGZ3qTyIO0oHwkvF7BoEkM58F4U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GdSq9XsvyTQmqXKd3Ssaim1lnll2uBFlNEqF1D3/OsbsYOojgFlx/TRfSfeUDepM3
         4Myzw9aNL2srK2wBlQ/dRl15BeH8ehSmf64yBxWWgXFNtDl1yv+trAQHY3Tg1fRk8v
         1CzqZs6IvzU/Sm8UQjGBw8SHHxfrNtyfr8lmx/QK/JXiXAZQq/BWuc9pUE3B8HF3Fa
         xqXD1aiPn6MImF8P7tKmX4QP2P7xoLiAcviL5iAvXXPZ4qSsUnDIDJ/JrUB9vGXZHg
         53j2xu98vlkoq8U9UrSVJN5JZOtv0eKUzHFI6BSuI98evflCPN3Q4wi/Q1oYyq3B2D
         OO2jKt+9Hj8vg==
Received: by mail-ed1-f46.google.com with SMTP id ec8so23805486edb.6;
        Thu, 14 Oct 2021 05:46:26 -0700 (PDT)
X-Gm-Message-State: AOAM530q2sYS3oTs8lY7t1Bg8aHc5yZwekYGmOHWwvbpXJKFV4DE306z
        xP1chESRF8BoxEvBd/7feqZbXI9s+2BQtPYYVA==
X-Google-Smtp-Source: ABdhPJxckYEhRUOh622IWcX2ltVSYroafWoIFCPByyFwbACExBb1A1o94FlwmqlA+hE13l9617JKTwNkRyh6l34NmWQ=
X-Received: by 2002:a05:6402:27d3:: with SMTP id c19mr8295232ede.70.1634215584892;
 Thu, 14 Oct 2021 05:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211007144019.7461-1-jbx6244@gmail.com> <1633661172.660863.1409603.nullmailer@robh.at.kernel.org>
 <CACRpkdYArdPwEVf_5pwsROKPjbnVAtU3mf9v1z6WXGPoBb=SZg@mail.gmail.com>
In-Reply-To: <CACRpkdYArdPwEVf_5pwsROKPjbnVAtU3mf9v1z6WXGPoBb=SZg@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 14 Oct 2021 07:46:13 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLKizR0tPrmxzM0cGFjj8dzARuU45gkvYn-giZ0SNXCaw@mail.gmail.com>
Message-ID: <CAL_JsqLKizR0tPrmxzM0cGFjj8dzARuU45gkvYn-giZ0SNXCaw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: convert rockchip,pinctrl.txt
 to YAML
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Jonker <jbx6244@gmail.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 13, 2021 at 5:32 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 8, 2021 at 4:46 AM Rob Herring <robh@kernel.org> wrote:
>
> > On Thu, 07 Oct 2021 16:40:17 +0200, Johan Jonker wrote:
> > > Convert rockchip,pinctrl.txt to YAML
> > >
> > > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> > > ---
> > >
> > > Changed V3:
> (...)
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
>
> Rob can you tell me how you like me to handle this?
> Do we merge the nice new bindings and deal with the
> aftermath or do we need to fix the DTS files in the same
> patch series?

Did the next paragraph not answer that? Added back:

> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.

So no requirement to fix the dtb warnings immediately nor create any
merge dependency.

Rob
