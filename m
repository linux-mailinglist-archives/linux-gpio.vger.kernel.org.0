Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11CE641457A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 11:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbhIVJrp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 05:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234453AbhIVJro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Sep 2021 05:47:44 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16324C061574
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:46:15 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id a10so7265087qka.12
        for <linux-gpio@vger.kernel.org>; Wed, 22 Sep 2021 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x4q1zxIuVhedHp6MaKOmCNyuAc8NXI5z0ykLN2TcSPw=;
        b=d3h8EJ+7mUYPJ8Z7QMYRNGyR4gJ7Rsu9S4NOQ0Q+n+DBQw03lIIG5Jp0IGuCAD4/Az
         XYnXKP0NPP6I53EEQUAwILRM+a2Kl8f9Y1Skwe4A/nSTkehhxTebRxXCe54AQ4AmJsWe
         A+uKFm0sMneN9XFHAUhlKbGXXKrkFQiwdJmdNm059wmUiVG+WOi8QeL1E6aZqSw2gC8v
         FHsAuvXa8ZYPbXOSeot+JJlvB7xCKDbJf79nN/JD5MbgW1JKnQ34LZoB+w9VTwMxv9PI
         K6vp48mtaE1pqsl/61aSwfnnfmWHGlmbFqojpoigPT5feXoTd2exKQ7uixFNNF3QajKV
         Zk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x4q1zxIuVhedHp6MaKOmCNyuAc8NXI5z0ykLN2TcSPw=;
        b=rZNowuUzkTGg7+bKU0kTuRejcnT/FnF29WGnfekpwVuHTJgvhzACb0xqo+kIi2o9BP
         vBFCjwqn+1jyWXIvabqbRbb8CFGCXMqcOcfy0Rb9wBSlefcs39OgfttSeT40AxejPzPx
         pUTVrSsvjdBGQ+tb1iX4zDQ/iCEr0F8fdMXaqlMSDW0n99KatCau51uFpOnQoMn4chez
         C1lPDVJDSoRoLsPdnsM3NbwXxT6kfAiHlaq+8/YMrmJPbx1+nZ/IZIfbAHPvlWxDlAXZ
         sJ4eKrp5aINKjQveLvoN+5oymPMTbCOGOhMlY9Kj1v5o7HWOKlIl8aqTiP9vIC9HRv/+
         ZNYg==
X-Gm-Message-State: AOAM531wgIFIVlGROPCCQ0otVXWXYYYRnhTxWdpw7dASH2IdHot8BamN
        TYGnRxRqHd97BPp0AwQAb0RWZd+pqVuMLd4o/SMLSg==
X-Google-Smtp-Source: ABdhPJwuJo+CQrlxjfmYaZEDq/Kd/ZVERj4tt1Le63TAlWMISPWNd2Vc1plyXiv3nR0JB7c4tQXS1ZRo8CWVaazxQW0=
X-Received: by 2002:a5b:783:: with SMTP id b3mr40177499ybq.328.1632303974160;
 Wed, 22 Sep 2021 02:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210913224926.1260726-1-heiko@sntech.de> <20210913224926.1260726-3-heiko@sntech.de>
In-Reply-To: <20210913224926.1260726-3-heiko@sntech.de>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:46:03 +0200
Message-ID: <CAMpxmJWbdb+v6An6b-cYOJEbkCRC0=Khw4VjH4T=9_V+9j3Xmg@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio/rockchip: fix get_direction value handling
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 14, 2021 at 12:49 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> The function uses the newly introduced rockchip_gpio_readl_bit()
> which directly returns the actual value of the requeste bit.
> So using the existing bit-wise check for the bit inside the value
> will always return 0.
>
> Fix this by dropping the bit manipulation on the result.
>
> Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Queued for fixes. Thanks!

Bart
