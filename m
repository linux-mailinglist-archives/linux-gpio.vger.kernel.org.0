Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC791682ED
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 17:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbgBUQNE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 11:13:04 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45526 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729260AbgBUQNE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 11:13:04 -0500
Received: by mail-lj1-f195.google.com with SMTP id e18so2712439ljn.12
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LqTxue78m0VGtZxl2013S2ddlAIfciqoVst56iF7SGs=;
        b=BvOCY4WqvKvSmbgZTbzrZE34qr4LqSZ43ORPgG6FiaueJHCu06j2vI/i4JmgeO0n7v
         Rbc1u6pnDAuBjtYyd7Nox+Oh9KUmMWJuAZnfXeaXqgabNrQ324jbS5Bkb9BDWWkQ9nuf
         Xybhnbw9C03wwI5svyClubx5PE2EFuvtMMSyd5nvcyUpMolfbLHgSTWPdtHfTEMsszWh
         WvW8HCo9EHW7FZ6o69Lh3YBJhepdESVmYcApE1j07CUs73iEnPQPgddW/ASD01W8k+3o
         uIov3ZG0emYKmHEo9CdEaDqVA79Iy8r5CaB6o7YxuzLi6GvPewcHcNNIA1QMKVf0+x6E
         drmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LqTxue78m0VGtZxl2013S2ddlAIfciqoVst56iF7SGs=;
        b=a5dCMVb/bwXA5HpMKtVKO/5/t6MqObwTIblriKHS7zu4il7OHqixTiw26obmhd5CuA
         bqBHEaIePzk2LJQmGK53KbUHztY+Ktaw+HqO7G4llIeCbac+j87AOhnul26Hemu2aaTK
         vDGZsQS+4wQlfqeurf5N/h3N3o2JVqRmIXZL5h8CJOTVWvMxdKhoSOjIQytxR7wGLz9w
         A8WxWw2LwWrW/RlbDLiOYbxbXRRhYEJc04JFRHaNTnOfXKxHmleLqlicauVL7hm1okfr
         FvvH58kSOfuVS+PCbeOb0xKwrV95BQt6Zyt/ssHoV3W5ZxBwrxa2qPjupxO2kckzOZ+Y
         c0TQ==
X-Gm-Message-State: APjAAAWQIzBz2yFQ8SkjUzjs7Dxo+MarvZ7ZVzDrz2aB4qYJ7O7eTpwR
        bhyGjWPiRQrmoaaRGnvb3zR86SBMd1igzUJ0nb7h7w==
X-Google-Smtp-Source: APXvYqx1fG7Lz4lhwSO2oqygCFLqCAUK7qlx2swfnXZlid8cl7yxcjFZKc5d8xBtqEe+Hg9BDPxLjIE2diqSC+Ew0Lw=
X-Received: by 2002:a2e:7d0c:: with SMTP id y12mr23401405ljc.39.1582301580775;
 Fri, 21 Feb 2020 08:13:00 -0800 (PST)
MIME-Version: 1.0
References: <20200218055247.74s2xa7veqx2do34@kili.mountain>
In-Reply-To: <20200218055247.74s2xa7veqx2do34@kili.mountain>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 17:12:49 +0100
Message-ID: <CACRpkdZeFrmA=ZwSNxY0=J6BpASkTrZLVQXBoenZKXFRS3xJPA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix some off by one bugs
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sean Wang <sean.wang@kernel.org>,
        Light Hsieh <light.hsieh@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 6:55 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> These comparisons should be >= instead of > to prevent accessing one
> element beyond the end of the hw->soc->pins[] array.
>
> Fixes: 3de7deefce69 ("pinctrl: mediatek: Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied as a non-critical fix with Matthias' Review tag.

Yours,
Linus Walleij
