Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A514820679
	for <lists+linux-gpio@lfdr.de>; Thu, 16 May 2019 14:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbfEPLz7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 May 2019 07:55:59 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36924 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbfEPLz7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 May 2019 07:55:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id q17so2422951lfo.4
        for <linux-gpio@vger.kernel.org>; Thu, 16 May 2019 04:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hO177V5YstoHgCwjJTd6QkNHj63uQ+DjBf4IdD4xe9U=;
        b=CUsyorl2ruAim6PW7M+EDIOkom4xJQXASAd8/umQpC24MPSnfKP1z/6sQVViheAjF0
         5EF6lw9qAc4E/11MOWdtZ2lMTogd4pz+rY65IAbvn5hJKCxL+SiUDPTXK282GvCmqoI2
         a+kpWjK+OlweLcp2FOnLoidRq0bCigIVTWoEXSiQCceK1hoY3IjV2kvY8FS2763FKYOx
         mmYRyQFEUN5P1zjdQKTaqL8RPcrTsLQCqiE5d2NcP9FjR/q3Qg+hsPXIOx8QdjBN+7uz
         t98bs17n0trMpRKcS3QNHg3KgD1RrGZIoEeGHYD36OZfMEBNLCuJ/AEhMCzHStHnMDah
         2jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hO177V5YstoHgCwjJTd6QkNHj63uQ+DjBf4IdD4xe9U=;
        b=jIFAmjCw7aTEGKQtnNwjI2a7Wpscb1TL+3DysW6vnyH0jCNRtMFoQ/hoy8sV1gDQVt
         vyJRqWo1qUfiRNlD1jv0rb24M1uchPRtzsxPQP05Alac110pzsrklhwa8Q4TaT09f8nL
         3seKnA8nW19uBCu6oZCitvguQ2IXEIoLk+iT0wBWhDkHOSwDvR0Fm/ml9NXMKYYuKzL3
         Zvgi1v1+mgzJhtaL5HIGzXJDLvLHAfEuvGNt3BuUnHXB5uC2FCwMwWWm11ky5dlrDzgO
         YgTz0Em5lyR5rtEAD9fRH69mlAjR4FKoljGmlunkZACPFPUnGD0BNbdDePf6qN6tBi1d
         OWcA==
X-Gm-Message-State: APjAAAWVdjSxOuDwgRE8D7titATqy+r4/nXz8Y6KifLLDAEjmNKyHgw7
        /B/DMUpXswEHi+AGu5VpzbbrYKsuRAh82iqAwAOlZXbc
X-Google-Smtp-Source: APXvYqyZ8YtOPeMszJlq1lN+VhvgOvRHSsqzsCTDLezRY/k3Tb/Z9ZQ2wRmo8YDVATi18dFWIID2WHYRpAKSQEcvW8I=
X-Received: by 2002:a19:cd82:: with SMTP id d124mr11861237lfg.8.1558007757283;
 Thu, 16 May 2019 04:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190508073331.27475-1-drinkcat@chromium.org>
In-Reply-To: <20190508073331.27475-1-drinkcat@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 May 2019 13:55:46 +0200
Message-ID: <CACRpkdZb73vNyepcfjzEGAopc7BBxde_N1wxn7PSJ3aGC0=Gig@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: mediatek: mt8183: Add support for wake sources
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chuanjia Liu <Chuanjia.Liu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 8, 2019 at 9:33 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> This adds support for wake sources in pinctrl-mtk-common-v2, and
> pinctrl-mt8183. Without this patch, all interrupts that are left
> enabled on suspend act as wake sources (and wake sources without
> interrupt enabled do not).
>
> Changes since v1:
>  - Move changes from mtk-common-v2 to mtk-pinctrl-paris, as
>    recommended by Sean, to keep better separation between eint
>    and pinctrl-common features.
>
> Nicolas Boichat (2):
>   pinctrl: mediatek: Add pm_ops to pinctrl-paris
>   pinctrl: mediatek: mt8183: Add mtk_pinctrl_paris_pm_ops

All seems to look fair to me, but I need some official ACK from
Sean on these.

I see there is some discussion on a related patch set which
also has two patches so I am a but confused how mature the
two patch sets are? Are they at all related?

Yours,
Linus Walleij
