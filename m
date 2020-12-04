Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56D802CE933
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 09:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgLDIHx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 03:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgLDIHx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 03:07:53 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D59C061A4F
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 00:07:12 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id s9so5546211ljo.11
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 00:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yX8j4Zc6r/G3qEMx5P335vQOgY7XxWfI8gCDr2DAO3c=;
        b=jOjb14vbi/ICQVDR+N5WlNELy+GMtxUHXHl63d4T9jWbwhs3ydZftkYWMXcjYh3iIv
         zz4dCH5cwlou55Gp0mpTqSj4rgZltncqEtjV9SbkkoYe9/N4fq32oxhTVLlAGd8BKdUs
         UR0V9LbEWqw0w7Zwu4HeOo6vzCTR3nlAWSwlHIx1lbW0MjINrHxYxBN7XXHf2js3MN91
         u9mtvJZ+cTt+D0gE+eb+pQmN92QJ1cQ4rokNzZ70P5MYhz3Ff+UvRBE1e+LATNFo8aFR
         lykS5c7Kgbkmq0snVKFdMB3Kg8/Yw943yTJgYek7MzzSMFuJRE3NJlizh8Lqzn5kDp3k
         z0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yX8j4Zc6r/G3qEMx5P335vQOgY7XxWfI8gCDr2DAO3c=;
        b=UeAgSA6+R2EdJGkfBfccHtTOACAPs4VVlcJ3s5ekf261hK2XnzUwy8wr9j4c/Uz2o7
         SoVyg/c+vtSOtmSqJqa/k7RHsluLG7LLoE4pXtt1pOdJLvbTNqNUYLXfCfmHN+tPQTFF
         mVsqSt5D1mHWzxI72JBbYs8Wrz+Y6CDglKhwwFfMXsI5igVk7r2cl+kwOyp4S+VxmdR3
         Ttul8BTXJ2Km4t0oK/iU+PWVifruPdYjagbqTh3S5mKkHnC/xipjgjVpHHp0mW3md5Y0
         3yWqMhxXkxo/kqUvi8AZ187jqu9O9Lil5UOvyZX+6Tt/DIcWUM+cVjjy5wH9rDaMzSdA
         tMTA==
X-Gm-Message-State: AOAM530+lFyxRjbvIcEVHuxO8qpEgjwSQw8EUnDhQq3zapC9x3MYz4N3
        ctZRMFJmH9O+ekX//+5LESwnhBBgKi9h0JcK2bjnu7D0a1WLtg==
X-Google-Smtp-Source: ABdhPJyujIvA+3fbQ3u8na7bGvEvTitc/TtlhppiehVaP7Ddj81M94noixPJVvbspU0gwxZBNHJR1TblG5npcdIqJqw=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr2839981ljy.293.1607069231260;
 Fri, 04 Dec 2020 00:07:11 -0800 (PST)
MIME-Version: 1.0
References: <24505deb08d050eb4ce38f186f4037d7541ea217.1605722628.git.cristian.ciocaltea@gmail.com>
In-Reply-To: <24505deb08d050eb4ce38f186f4037d7541ea217.1605722628.git.cristian.ciocaltea@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 09:07:00 +0100
Message-ID: <CACRpkdY-7bCC5-yGQB+vhLX7ZRB4irH_3u7KcfKmN0QiiXpHwA@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: actions: pinctrl-s500: Constify s500_padinfo[]
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 18, 2020 at 7:10 PM Cristian Ciocaltea
<cristian.ciocaltea@gmail.com> wrote:

> s500_padinfo[] is never modified and should be made 'const' to allow
> the compiler to optimize code generation, i.e. put it in the text
> section instead of the data section.
>
> Before:
>    text    data     bss     dec     hex filename
>   12503    5088       0   17591    44b7 drivers/pinctrl/actions/pinctrl-s500.o
>
> After:
>    text    data     bss     dec     hex filename
>   14435    3156       0   17591    44b7 drivers/pinctrl/actions/pinctrl-s500.o
>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>

Patch applied.

Yours,
Linus Walleij
