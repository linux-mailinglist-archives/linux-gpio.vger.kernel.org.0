Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3618E8CE99
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 10:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfHNIhp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 04:37:45 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:45793 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfHNIhp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Aug 2019 04:37:45 -0400
Received: by mail-lf1-f67.google.com with SMTP id a30so15674153lfk.12
        for <linux-gpio@vger.kernel.org>; Wed, 14 Aug 2019 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0/8qhJzuA14Z0o/UaQQ9Jx+RYJnVGOa+QQmQVMYAPzM=;
        b=QV+U/fenEcCjSEG0QSzlBLuoRSVI4cBEn0Ykg4LrOTEExE/RflEjbl/NTXRTTCqmDx
         Snt9H06cZhPMG51ElGpW1D+gsdMNPMexk4iXCZHCaAB5Kr4PZzSE+AODcZf8E8xNZ/lF
         yEburGCwf9Uo8aiYXrHRau6Ovv3q+L9xa7x2lcMJG+NZ2BG1Vr1QoCeu9/40Clt5gsS7
         +rDwh1tpvybKy2RLJb/qMZz+qyg3ACH/b56OaUyIeGqi9XU/CVq7yVYYxHRMjvBMw84U
         QJ9giNzNMA+mW+NMheAnED5QyrjSZnqgoGsBgy/PIjxzK1Ux0Uuce1iAGxwh9K8keI45
         zQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0/8qhJzuA14Z0o/UaQQ9Jx+RYJnVGOa+QQmQVMYAPzM=;
        b=sOteBDJsO61/lqf8JrMWGt+y0gpwj09HwlcdHSYKoA5OLZROsIincsAA968+jnSMVH
         fKUHUpm+xrk7mAoXrX/UeK8nTwzlhjRzacjhPiu4QpZD2O9x/EzbOEnrpyk+7MZdwqTI
         /iD1Tp+TZSgP38r9hfkGx7D0tzK3p6AoNzCqmZ3fx/6odDqjrF2Uyeg7kwBAFCZJoFBk
         CwN5HpcAzHtICMF6DdXJRJ8IJdAdbY1hjJxCGxyFmeLwzjrYEvqwl6XU823/DVEETgWZ
         ygx24dglKpL8LW7/r0590aD8gQ8p1PdkW+xFVtKdWNneNR7DNWmvT6OIt/xWAF6Z7Cjh
         upZA==
X-Gm-Message-State: APjAAAVUuTaVG3ckkQGreQo5EBvoK5VTDjzrG5/4AjzobpFByjK7rzgP
        A6qbbY9z321Qr72DPA/cfqCla1ZBRn85Pqt/wFyoPA==
X-Google-Smtp-Source: APXvYqzuCYojAfiXAPvTDLrml8KYkUgNITseExrtZKAQZ8ls42svnqmjg+DPkV4F1JtxjuNW2Hom3xWLDV3sofdB4z4=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr22877948lfq.152.1565771863180;
 Wed, 14 Aug 2019 01:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190809131804.20352-1-linus.walleij@linaro.org> <95B402CC-A698-42FE-9D3E-D4B05997ED3E@global.cadence.com>
In-Reply-To: <95B402CC-A698-42FE-9D3E-D4B05997ED3E@global.cadence.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Aug 2019 10:37:31 +0200
Message-ID: <CACRpkda5SDpDsUnif-FnE6keQLYJnW4fo18AybKG8T4vww6+4Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: cadence: Pass irqchip when adding gpiochip
To:     Jan Kotas <jank@cadence.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 12, 2019 at 11:53 AM Jan Kotas <jank@cadence.com> wrote:
> > On 9 Aug 2019, at 15:18, Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip. For more info see
> > drivers/gpio/TODO.
> >
> > For chained irqchips this is a pretty straight-forward
> > conversion.
> >
> > Cc: Jan Kotas <jank@cadence.com>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Hi Jan, it'd be great if you could test/review this
> > patch.
>
> Everything seems to be OK in my tests.

Thanks, recorded as Tested-by and applied!

Yours,
Linus Walleij
