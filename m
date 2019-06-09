Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46B93A687
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Jun 2019 16:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbfFIOx4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 9 Jun 2019 10:53:56 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37553 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727500AbfFIOx4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 9 Jun 2019 10:53:56 -0400
Received: by mail-lf1-f68.google.com with SMTP id m15so4879615lfh.4
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2019 07:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MU+WyG1TNeU0wHpSgq4qa0v7PmW/GjVZf4FGn3dLePA=;
        b=S2hhrEwnLrxZ19kIxNfe07/0PGlroLlmWeZ9yAhw8zzAll+czOobfpLnWQkvdpyUH9
         rd1s16S0Q0IKggD9pllTNCPoJcLhr3W5fZR03/b/oXSmhP0f7jJVgyYwTjNJulLM1xg+
         NoeRnPaZ2SoPPRjj3sOkTZrj+EpNRT3b1AaNvZyqFXUqwO9oidtzjABATvXE9fLH03YX
         8qL+7tsYI+t+wwyXN0SThW/fSnOXpW/0goe61nHrIT2wLKQlxnFp8snQTDsF6wbREjw3
         bYFmbJlu3k4XaUJQUbK2IRLfrB3KqnK7y1jVn+LC9XFHgFa9iLNXwMoSBqnpwvP3FM6l
         TUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MU+WyG1TNeU0wHpSgq4qa0v7PmW/GjVZf4FGn3dLePA=;
        b=a5j4xWs3Pj7y89Xwcjd8ynzNHhVrMzH0Bl115lpmkewCigEEkp+0uhvt8IGjd+Da9b
         4h4807ReX2xyOomENUnuBkcuDhfHbtEprYav2+uq03DHqs4TDKdtpzLhzRkwhgtu7cTq
         HevZJIVhUQZcWNtcms8OG+NoT3zeIRDOkXhsnZSsrQHhORgnMe8rcsv70lrJ8tObGnNi
         JpGcXV2E718yf/mdSII3/nD6esxf6UPwboYzvWbZ/nwVV43I8fR9Y4q/0XloZAjQ1I2V
         vLUPwhGkXj32YPrMfYcTtWgi+1I5+EX8UxMz6NCB41pz11vvKYCDu/ovLz9GNfjqlFgG
         oevg==
X-Gm-Message-State: APjAAAVG2EvsMJJ4ugIjqX8UobtJCDuEAdu/Pwvv1+wSNbhOuDb2Ih8Y
        m/FkN6T5V3b/041nv7xuxDvueymPrHPITGgk+pZJkA==
X-Google-Smtp-Source: APXvYqwlidGfg5rHLR8MpVmRrgDqJeNGuuQj25IrHXF9OTZsqnr04f3gGacriT/TP/hbmUYhm5ANmiweypSJWOgGtcs=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr31483477lfh.92.1560092034835;
 Sun, 09 Jun 2019 07:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190609144313.4842-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190609144313.4842-1-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 9 Jun 2019 16:53:48 +0200
Message-ID: <CACRpkdab=A_kRBaNER54azChP276uWt8ccW7736H2G7F+1A0cA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add include guard to pinctrl-state.h
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 4:43 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
