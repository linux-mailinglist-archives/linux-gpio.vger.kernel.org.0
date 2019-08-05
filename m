Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FD0817C0
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbfHELBb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:01:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41195 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728360AbfHELBb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:01:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id d24so78905200ljg.8
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fm/51dNbtT1AoRASq2ygNjUysJb63GrKj4DIaeO9Ghs=;
        b=Z8iG/NmUwQ9i+AFPGL0ddsR7h9HdoT1Ttt4aAmnHZDClf+igwc+gtbzhT1Nba6laaz
         4v+lLXov3kcW44IiefLKXkqGZ0yuj65ZaoQH1xsIDTxVVx6PdeRPrb0G23ULaT1s3B73
         FnbYivp3DueW6KWrElW2wZyrCEZNoE17ZGX+l0Xgqb+T6uyuMxBLjAVT1EhECFyykqMP
         4hMexKxJyF51cRbhjwTJUHNkSOY7XU+9Rtg3U6C8Ue+jfe9xi+seEkWqvxpg82U568yD
         yrwwkO3XsZ2ZcWNNAOyRt3Qkjym0FpXuwC2i0NE4N6FMY10+Xzi71jIhC5Lugb6EYXpJ
         H/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fm/51dNbtT1AoRASq2ygNjUysJb63GrKj4DIaeO9Ghs=;
        b=f40zT53uV6cM/iyCczenBpns85eeI5wd5VeSCQyxbs/XQcxtPo77XKzwy+d4kwtRZV
         iKU1Ej1wfr4Bk1dvsoDISGmb5u8kyZCntlKydK+r1O6InWrYtt+smDxJWpV1pddUWTj4
         x5NNiBk+wW0oVd/kv6dbMR4bA5ItqmOlkTSzSB+xqaVQGLbCXm6Eu1wFZ+UTjmNFr1of
         zXF3ZUqh2MGuZ5+wjKiM/HrEUqL3stGxfd+2QXWy0hAp+fsKB+nNTkZnlWzlnzPnbuyg
         t2Fz11hBlgk764D3ibVE7WnyTtPLdfp3l00TzQosfwFCoLExUkdnGyDxLiaGCkG/F1fc
         hENw==
X-Gm-Message-State: APjAAAULITb7bj5vtBUh8TW0VJbXdhyZxhx/fSKIClA3/OO7r7FuQFAd
        8rdq0HZxRPLGPotT+2K8y/Fs27WZmCIK0uUH19PQ+A==
X-Google-Smtp-Source: APXvYqztNgDE8wQq95uC5fqxtY6tG66NjiEC9RCu4ZI6X3zlaBRtnAgyXqI7tkIKROGOxKhKMeXnW2M6REnOxYZlfSY=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16524273ljs.54.1565002889640;
 Mon, 05 Aug 2019 04:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190729125838.6498-1-narmstrong@baylibre.com>
In-Reply-To: <20190729125838.6498-1-narmstrong@baylibre.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:01:18 +0200
Message-ID: <CACRpkdbssrCrs3n1tejA3iLnUvCbv95xt_ip1Y8gdCi1RkJgXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 29, 2019 at 2:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied.

Yours,
Linus Walleij
