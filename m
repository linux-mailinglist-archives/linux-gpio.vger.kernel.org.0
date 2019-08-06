Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3299D833E7
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Aug 2019 16:25:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730489AbfHFOZ5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Aug 2019 10:25:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728756AbfHFOZ5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 6 Aug 2019 10:25:57 -0400
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 54D9E2173C;
        Tue,  6 Aug 2019 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565101556;
        bh=hxvRGDEpNBm3mZPFFZ9scjz7nw9+tfcB69glm76Zj6k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LAR1NOD9DK3tAJ2JkBf7vEicPIWD0xoAsrAY+BabPQk//OwFZlnFZkvh+TTlIzRPg
         sVdl6HCU5R05RZzEZkshV9i0qJEpuvmd08ej8da/jvRo9VAnwsc7rae8PedWVNvVQ8
         PA3itgfOxe8MmtT80ZJR5MRIVKAk5q7wWB93BvqU=
Received: by mail-lj1-f169.google.com with SMTP id i21so3162341ljj.3;
        Tue, 06 Aug 2019 07:25:56 -0700 (PDT)
X-Gm-Message-State: APjAAAX5guONvCSvKxuwBFXVaiPsCMxQrQJHqsPjrXX+v2kU6PXaYk9L
        qxX3KInHa8VdeMCnLnPb97pb25C+1rGw2cT3U7Y=
X-Google-Smtp-Source: APXvYqyR8xEsJE+MjEuvjOfu2HXgOcDbLzDQyXavm7a5+iFv4M54shHtw9bwzRKTalHYnjKzVT1tmRDtUKw9aVqqweQ=
X-Received: by 2002:a2e:3008:: with SMTP id w8mr1964469ljw.13.1565101554494;
 Tue, 06 Aug 2019 07:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190805162710.7789-1-krzk@kernel.org> <CACRpkda8P522pkxctZbf2Ut13V6Rzx=mSYsRuHv0BvPyF6q1gA@mail.gmail.com>
In-Reply-To: <CACRpkda8P522pkxctZbf2Ut13V6Rzx=mSYsRuHv0BvPyF6q1gA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 6 Aug 2019 16:25:43 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfuu1bgLL9oOf=7hrz-QvXBcJjJVMwqN2oRUv7hnB5Jyg@mail.gmail.com>
Message-ID: <CAJKOXPfuu1bgLL9oOf=7hrz-QvXBcJjJVMwqN2oRUv7hnB5Jyg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: samsung: Fix device node refcount leaks in
 Exynos wakeup controller init
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>, notify@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 6 Aug 2019 at 16:15, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Aug 5, 2019 at 6:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > In exynos_eint_wkup_init() the for_each_child_of_node() loop is used
> > with a break to find a matching child node.  Although each iteration of
> > for_each_child_of_node puts the previous node, but early exit from loop
> > misses it.  This leads to leak of device node.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> I assume you're collecting these for a pull request to me
> at some later point, all look good to me.

Yes, I'll take these and one more patch from lists and send them to you.

Best regards,
Krzysztof
