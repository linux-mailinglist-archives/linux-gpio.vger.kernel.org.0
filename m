Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B06B4254D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 14:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbfFLMPD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 08:15:03 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39160 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727511AbfFLMPD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 08:15:03 -0400
Received: by mail-lf1-f66.google.com with SMTP id p24so11903680lfo.6
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FFYjM9wk0Lz17ea9speLpvagwR++tad6Xn0EKWjFYrA=;
        b=iz8jnCndeBkvP3p4bBUYrvrE0G6l+fnUrY4oU5MyfPxGojrx49R4TMU+njNn/7WkR1
         KudRDNq6DwntOfaunGUQ2Ggo7LykQcAuySfJlCxT5juyhc3dBfB+pQf/5I311Unb61Ak
         xDOd9SDmEBkAmthWSazEjw2aPFlUj9sFiYGMQb7c8R64IJKhJyDC763gJmHYUQHB2JEY
         ObuDuPWxggur9qaAQOWrQNqbA61Jj83r369UjaHpdkGB+xj6tC2Oo2lQDj2219vXZZjC
         WYTaixMFeNHwjcNo5OjrrHcq5pLGSx47JLd9HuGnPjcAo+4RnkSXgfEjH6OYMEiNgoEx
         ztdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FFYjM9wk0Lz17ea9speLpvagwR++tad6Xn0EKWjFYrA=;
        b=pL6Q1gG+YyAMYwUR84NhhtFFYnd1CkR+6BKtEtUj8OCfUJFrobm8H3+h7/da+bjPpl
         MiTsjM3t+JKvx5ZOND8VRov8xho+xPO79XO4GnAg46TUZL6Z8jG9ZjLdSCMjdEm2xbxl
         1WuoU8002ZOczXhoad3dGPip3MFuziucfFXXGgOgAgeJy7sui+zJml1I1ovOHlKcuU7N
         Xcbh2XGSgIl500hEdZFGP+7sub23AxqeVwaU4+a5LkLXBiFBdwAORYqXCbntcDdbGLaX
         MF4ETEOU2D/AIM6iaQu3e+LVfB4BEXKis0IaQLXLl9GFRQo/Zbd2YLWe69TZiyYA3rC5
         pm7g==
X-Gm-Message-State: APjAAAWQkKmrCHkiI9L9gbqE+sIvVlaqY5hYc2Y8oXK+WY2XP6YYmanV
        HNMye3d83d4NQOklpQT9uKxPDDzJB2kadQyhO9QkbyOs
X-Google-Smtp-Source: APXvYqwy0mZMiBNpW/oi3ASfqSMigvHqJvRnpIQvSh4m+n3Y5mdNL+QhoJDfGK8Ag45DTi2N8BZsC58UGSuJHBOr+eI=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr27964836lfm.61.1560341701722;
 Wed, 12 Jun 2019 05:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190611140940.14357-1-icenowy@aosc.io>
In-Reply-To: <20190611140940.14357-1-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 14:14:50 +0200
Message-ID: <CACRpkdbSo=oKh94GxmLX_FrhCuoZJyY27WeV8KJjBW6gTUrh=g@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Support for Allwinner V3/S3L and Sochip S3
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 11, 2019 at 4:10 PM Icenowy Zheng <icenowy@aosc.io> wrote:

>   dt-bindings: pinctrl: add missing compatible string for V3s
>   dt-bindings: pinctrl: add compatible string for Allwinner V3 pinctrl

I applied these two so we get down the depth of the patch stack.

Waiting for a v3 on the pinctrl patch.

Yours,
Linus Walleij
