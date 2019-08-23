Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133569A903
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733014AbfHWHiu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:38:50 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36478 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731748AbfHWHit (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:38:49 -0400
Received: by mail-lf1-f66.google.com with SMTP id r5so933891lfc.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lz2W/Er+vhSnNSGXtvI+raF02sxjt0QdGmNNXiXbeZ8=;
        b=xSbUP94itBW5D+EIP6J+VeADRYAq49B6u3tO5t95hiQ3LqFqEQ+LFuJEBkPwIvl6NJ
         rdHJD228PuvuWY4ayKaABZy0R7ZgUsv1KoJKe1+B4yBMntOltSIwBMnp0zedzqrv87zL
         FyQiEkp4NI1BU+dGZ0yLr0aX/BmREJwiUiVaQP7m7hDwK2klVCy6+CigyrmqkaynwxUX
         i9hJB5OCNPeM/9T9HUThretRY6cbh94rGzMPh3Hx8QHO9Re1SquQiiwQO2kbIgauukEr
         DUTZbK0uzXVvytwctPYRyQDuMKG6qUb+FWGnnGyZvGsYO7gI58znr1Ne4ZP01V0cDmVx
         f3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lz2W/Er+vhSnNSGXtvI+raF02sxjt0QdGmNNXiXbeZ8=;
        b=lYzfehQtdtZM8JovQq1cG1tBcaLoev07XBI1OW+r6OI1guFM/Z9tmXQCWJldZyPSd8
         6qs4+6oKS0AawdRjEZWK4bthxwKDDH9J18+vYzoT3NZ1r0ZBNnPwJhYcJf5w51ogGSKZ
         Ug4wIEIp6pIJpSgG7eZ/nT2+7mvx4a8PQtoM7jftq4PLPNZgLEy2kTiJ13CsVeJl5u4J
         1VT5a531uhT6LdldeqnZa22jXcduGWDw05Inhn8Vz7gNpW3bDh39v5TWLbEOSxDLYM9H
         UiJ0h3JihuPHvs8vGYPJ4BPZIPNOJfapdm/TAZ42JTVS3uHI/jyC0A/IrvMQxhxpjd4S
         pr6A==
X-Gm-Message-State: APjAAAXY51wtzQzzklSD8/aQwEcoRH8w/Yr4DKvp7do2XV8l1dH/QIhB
        wGOhfarLQuH+CJlGxhmfrpdu+023PghIyZ0h9XE/Xg==
X-Google-Smtp-Source: APXvYqwn8sOli89h3xpwI0gsI6dJyFeTKTHshx0YK3OmzA9sFUzjhWgRf+UO3GE1WNBwItHvNrorYCww02wff3Qgq/U=
X-Received: by 2002:a19:e006:: with SMTP id x6mr1813674lfg.165.1566545928179;
 Fri, 23 Aug 2019 00:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190808101628.36782-1-hui.song_1@nxp.com> <20190808101628.36782-3-hui.song_1@nxp.com>
In-Reply-To: <20190808101628.36782-3-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:38:37 +0200
Message-ID: <CACRpkdajLb3Spsq4SvRCEJVQcABK+QnNyZi5C3ciTvirjcHF-Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] gpio: mpc8xxx: add ls1088a platform special function
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 12:26 PM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> ls1028a and ls1088a platform share common special function.
> The gpio hardware what they use is the same version.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Patch applied.

Yours,
Linus Walleij
