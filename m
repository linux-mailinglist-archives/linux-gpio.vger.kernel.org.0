Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0920833118D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 16:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhCHPA3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 10:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbhCHPAD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 10:00:03 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D106C06174A
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 07:00:03 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id d13so15211160edp.4
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 07:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ekCZMHXgwaHxgHpJfRzLgVCiXSCvlL3z1p/Dj8xOMM=;
        b=qzhaVpe3MtPhdiVp0l3jqha8NzCFpAiM8aeUsjJRxS3L5KENy1c8yfkqZtl1p/2MT+
         b2EUtJdpmiZhSML+RIf+lvwpn9EBZxhfN4L/tC/oPHXVHobrzttURJ5Jnh2fCS3sdbGN
         MRu3iRKcbzq1ROqBQwhbWBTMo4ROam6nUZYAs4apKfOzFfjlS7jDV6eLKRAxkLcw+xkC
         Y+ze82nFTjLEz6h7cPkOUhz05GUDg7SE0j9nXPLV4jJpm3jjiJARp5f3iE0Z98Z2Wk59
         1xSmzLDQkg+RQx6FglT7/MEB46zg4tvsWqQwFEZo3h+yV3prOGV9Rd9NzoiIZcfAdUXF
         utkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ekCZMHXgwaHxgHpJfRzLgVCiXSCvlL3z1p/Dj8xOMM=;
        b=R+ojtrJqfZ2Qq1wGaY+Ki3zD2+lz0tFsmK2BK941iM0XH+FJUmNoPRRnui+Q8nddYr
         J0/JDwrHcR6SVfv+ZtXvTgmyo67JK8G2JkhGVN+zb12h7ijK0dtwrFKZUflMBTurD/W3
         Cefsa0ok56gN/FV0BIR2Og/a2YGIo17BjluqAMPsbpBwMk9YboJB2ecOeyX18Y7v/Cn/
         iKZ6FtK/h57ahhppPMT/OWnRX6IlbHamS/swP/XMzo7HtFtw1lDKaMW5sEmo5xxNLJNr
         uLio2r0bqHtw8qtCu1PZbf3kSWbNy8ZAEAr5Yto2hHghGwGq/24T8bQZMmCh1omg17vz
         qOwA==
X-Gm-Message-State: AOAM533DySG0UsHeuFyHfqld3ilflnIQ+0+yZ03fnlt9dj5Xa/2tvBUV
        zHfw3ZbnIDvpYs7foSCr3axkPyp6aqrNkACh4o6Pfw==
X-Google-Smtp-Source: ABdhPJxWWk0qilC95RD9gboXObt6v0+Il8uPSlHzJv/u+Uw9jw61553R8rteYXGSKA6iSHJn6QAj39EybIrta2ysEa4=
X-Received: by 2002:a05:6402:35c8:: with SMTP id z8mr22547852edc.341.1615215601861;
 Mon, 08 Mar 2021 07:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20210219223910.1831-1-luca@lucaceresoli.net>
In-Reply-To: <20210219223910.1831-1-luca@lucaceresoli.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Mar 2021 15:59:49 +0100
Message-ID: <CAMpxmJVzShDO7b1i_KiTdu9DGexNmgR2oA241H9=mht0iYMBqg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mfd: lp87565: fix typo in define names
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 19, 2021 at 11:39 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> "GOIO" should be "GPIO" here.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---

For GPIO part:

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
