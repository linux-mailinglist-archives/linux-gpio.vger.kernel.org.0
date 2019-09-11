Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63041AFA1A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 12:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfIKKNv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 06:13:51 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46904 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726724AbfIKKNv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 06:13:51 -0400
Received: by mail-lj1-f194.google.com with SMTP id e17so19388947ljf.13
        for <linux-gpio@vger.kernel.org>; Wed, 11 Sep 2019 03:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aCnVGzJ1aayFY2KVyD1Mv7oUSY3ckiY/y1eytoodkhs=;
        b=IsmloQ3qh+w0RxxWI9INZ9WRb+/A5095NFWDlOU0ojKcniCg3x8EawwhTpdwT1nI3v
         LWk8BbA4ERR32ph5dS97WZauymFdmjDcgntluwX6FCCKLbzZdAqN7tjZru61pYKlNRSV
         QYyHm/3HKhdeo+cTZaEaE87uLdzYHPpP3PD8Kid71nN1CyD+Me+ORjfm5oWjxJQ+zwlL
         y1TUbT5IxbD0E4ySpZNyKclMiNdDEVSz4nNLYlirjrjnYQNE2KKMLQsl62ayYl2m74Ju
         ATAllJQxj3IB0o1IYMuC84V5aUBxTRhsNK++jZHUBqWMNK/OxiN931IpoTJv/NAb47f3
         hIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aCnVGzJ1aayFY2KVyD1Mv7oUSY3ckiY/y1eytoodkhs=;
        b=kKenvAb+nyydkDt3RptLFqYauFj3yqjmOv0A+fSMl7JfPqfp2Zu9bJot3EiFYbZnTq
         sGZc/doBGTyy945Fe9dF4H8S2dvzjWZG3D8QWG/1D2cfDGAovmcvUyuxdm0SSW4TWSfj
         5o5m8ctC2ndBze7D4zXoEWFKrbqpr7B39jp0ywyTcP0XeKWsVIv6JbhwIkxG8HJLdLmE
         KQOhrVrl6EmpkaYR8Z9SlYXD863hdhYj8JCh+Z7Y4NgU8PVL1hR3IG0Bbs9VRgiqVogY
         h1gHSGaJrVl5HZp/9SvK2MlAH3pSK0u9VVJWJatT7EszRs3a4pf7prcfyLWdZ3n+3/nO
         QtIQ==
X-Gm-Message-State: APjAAAU5QTTzZ/63UsETheOZbYcTvpKjo9OhMoMyP6BdwMjIGU3xh/sg
        CzqOkYKKpxX7tCdtscjgtY0gjds0kRLYZ2q9u+FTPA==
X-Google-Smtp-Source: APXvYqwuhpQk3V/zZTpDpM2cpbb8dbSgHN/jIKUQd/PGzomP3IPupkj6DtiQG9j+nks1pOHj0dx1JhhwudEsWNFOZbI=
X-Received: by 2002:a2e:654a:: with SMTP id z71mr22911168ljb.37.1568196829591;
 Wed, 11 Sep 2019 03:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190906063737.15428-1-rashmica.g@gmail.com>
In-Reply-To: <20190906063737.15428-1-rashmica.g@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Sep 2019 11:13:38 +0100
Message-ID: <CACRpkdbmusuLNfzcxxnYk=Up7UT3GMdLU4R+WnS86oTV9PNcWw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] gpio: Add in ast2600 details to Aspeed driver
To:     Rashmica Gupta <rashmica.g@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 6, 2019 at 7:37 AM Rashmica Gupta <rashmica.g@gmail.com> wrote:

> The ast2600 is a new generation of SoC from ASPEED. Similarly to the
> ast2400 and ast2500, it has a GPIO controller for it's 3.3V GPIO pins.
> Additionally, it has a GPIO controller for 1.8V GPIO pins.
>
> As the register names for both controllers are the same and the 36 1.8V
> GPIOs and the first 36 of the 3.3V GPIOs are all bidirectional, we can
> use the same configuration struct and use the ngpio property to
> differentiate between the two sets of GPIOs.
>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>

Patch applied.

Yours,
Linus Walleij
