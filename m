Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6733241E38
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 09:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408497AbfFLHuI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 03:50:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44441 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408492AbfFLHuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 03:50:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id k18so14193551ljc.11
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IEaEkHGgpzdEriV3OpBUDcZF+KYsAf8LOl6nPBOdL0I=;
        b=MxOgXdPvNtfxAeQKrsT6Hhks3ZJt5BbhJTAVPBRxH2NTM0bwdeOB3XxaszrRVJ8l9+
         VWsL6ISsBFvP+YlNVumKlbdeBsd+Vq8pbeA033UZIughCukKYSKF8MrVmIYZHq53An+P
         l0wBipa1xKndvyvg0c7UF5i8yf5YpBtkZsSqPn6GdysoNn+e6HfsSyT7R3Hc9FyYmUms
         lAHjkrVnZoVr8d3Iy/SeNcpqx4mJBq4WV5Ncbd+DHQQxYYu4ww6iSaeJ6VxbaIXPibCu
         4QTq+nY14JrmffPXRcD6eoSD80Fu329m6RZWZEYnYUjyQx9jBka1uKNwyHZ2UB1vbM93
         gdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IEaEkHGgpzdEriV3OpBUDcZF+KYsAf8LOl6nPBOdL0I=;
        b=I7HhoUgaQQlBPsg8pyOJ2/LJsEc0Atg0cnHofrp+J4wkVS8lPNp1ji5m3Ue92D++qX
         TADsgu/DH7SUwCJLJx+nC1c5ZaJsTEM8mzrr0NU3Xu0/EKSmX5+a1E/HAUUDZrdeOIM7
         BeXMzCjJtVl4mWAOGxIqTuyApyVH5UbQJgXS0sxYF8/+HafphqgIczzwwdDfTfzn8Az/
         mApa0z6K2vRQyiAqwKc+TPsyqzJtO/Nz0QHInWi1L60fgyWfi05jQRySjgkU2PrTDeYx
         QjvpFQ3lMo1xLKUyZ3IQYTbFluuKFh/hr8KsWJYCsM4M1OVYDqLvYgIfb/krbVojOeKb
         /YXQ==
X-Gm-Message-State: APjAAAV6gPGEMTqKfuxDdG/dOEnfGEVofefvKqUxOIMzediZZkHwemw5
        rIAvA4LY3xfh7jD3e4CwbzSo2Kir/YFzRpl9wKs/0A==
X-Google-Smtp-Source: APXvYqzzh0lP2GP0zIA0B/CjEu8rHnPuiyl2/5JjJotWd+XukV1gNSf6KSOn2KcSDsb1T6tKaT1WrBmGn5bHZWiacxo=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr33630569lje.46.1560325806228;
 Wed, 12 Jun 2019 00:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190610170523.26554-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190610170523.26554-1-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:49:54 +0200
Message-ID: <CACRpkdboUO1iEipXTvhy2x6bxuVJuwxd5FduMdk-KtK3f8FeaA@mail.gmail.com>
Subject: Re: [PATCH 0/1] gpio: of: prepare for switching stmmac to GPIO descriptors
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, netdev <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:05 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This is a preparation patch which is needed before we can switch stmmac
> to GPIO descriptors. stmmac has a custom "snps,reset-active-low"
> property because it has ignored the GPIO flags including the polarity.
>
> Add the parsing to gpiolib-of so we can port stmmac over to GPIO
> descriptors.
>
> This patch is split from my series at [0].
>
> Linus W.: please create an immutable branch as discussed so I can send
> the stmmac patches to the net-next tree (which will then have to pull
> in your immutable branch).

Thanks Martin!
I have applied the patch and created an immutable branch:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
ib-snps-reset-gpio

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-snps-reset-gpio

Please refer to this so the network maintainer can pull it in.

It is based on v5.2-rc1

Yours,
Linus Walleij
