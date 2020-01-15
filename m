Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCE813C1AE
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 13:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAOMvy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 07:51:54 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41864 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726552AbgAOMvy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 07:51:54 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so18418241ljc.8
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 04:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsr/oi2XrIAmmbP163wTd/MCf3p12+DUNarrq/kg9sg=;
        b=xrzSeApfEb6DAeNeLYgX7j/LWntJQinaR4oIz/1UnnXu31QZuRkQ52mokkML3w8Th9
         JVP9mym3jJOxZFbTcKpBGqRYr07Rpg9oPhhSDckVL4EsjgxxDh3/hXwjCGteoDMIefKA
         pGfIEuCLB/Df5dpac286FNC1PHf+NkSl4HINYNkXJoeMO1uHTz3tJDmGOEgQK7sWlVFT
         ZK1UkQu6k8Soyq9q4i3Tp0N1aKP6UvvuGZA1nesiRI8PNDriNECKpTDTkV+Fu4NA2NXU
         fRjEYbkMP1JDI+CdFPuSoCJYALL41ulOLRNW6lpUezYXwr3DYKnTfd5SOPcPXzBJFDnV
         cl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsr/oi2XrIAmmbP163wTd/MCf3p12+DUNarrq/kg9sg=;
        b=UKduhTX4Rd64FcRbyp3h9ned/D7bXClWiEQqm5hYdmqFKfGq3o6ezo1whmbRogsEDT
         c4GjYBi3lSh/EPPHWKwO7gHN62emXe4aqLEGIjn/uiEzJ83my3+X3IWhWQEEYozMOgj2
         9G+KHezUWCdy7ysoCXaZ5PC3FB2RXypKtNMhkAk3CzdUYgxO7wanXnr2gx5bJOuRF0d0
         0JGHl6y2C03Ud+V9oYKIpZMKu5dNDOgBErDR0ytysC2Zka6qoyAo1pVamijGon6ajBwt
         9wAeDuw0dkB2oxPhC2zv8iF2ahnV68mMXeGMDIgoidkJsKFryY52LgY1y59IfQNodkmj
         0ogw==
X-Gm-Message-State: APjAAAVaxKICb+iIClPtpDpcpfdP/ATXjR+hcostKDnBIEIeK14dwJ/7
        z6SXX12diqGokHFSTtqdinC20B/79hdK4uJcj1zsJBKMYGY=
X-Google-Smtp-Source: APXvYqyPLiNMYFjq+10C4y9GPJ4omzojNt3A/uO0N7XjKPjzPb413C4mDt6k4ydemhY/RqaqtsTUqp4qjoKTT9DRbqA=
X-Received: by 2002:a05:651c:111c:: with SMTP id d28mr1762433ljo.32.1579092712068;
 Wed, 15 Jan 2020 04:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20200109094001.24343-1-jay.xu@rock-chips.com> <20200113011616.19791-1-jay.xu@rock-chips.com>
In-Reply-To: <20200113011616.19791-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 13:51:40 +0100
Message-ID: <CACRpkdY_EHQbF4rRyGwoxEk8LeWfmRzmCd=8=SY95LPXMHYOmw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl/rockchip: splite soc data to separated driver
To:     Jianqun Xu <jay.xu@rock-chips.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     David Wu <david.wu@rock-chips.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 13, 2020 at 2:16 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> * Decrease codes of pinctrl-rockchip.c from 4,000 lines to 2000 by
> separating soc data to a new file.
>
> * Move rockchip pinctrl related struct definations to a head file.
>
> * Keep legency pinctrl-rockchip.c under driver/pinctrl but not to
> compile it, conveniently for reviewers.
>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

This patch looks good, two things are missing:

- Review from Heiko

- A change to MAINTAINERS so that the file pattern still
  matches

Should someone from Rockchip also sign up as comaintainer
for this driver by the way? (Though the people at Rockchip
posting patches for this seem to change a bit.)

Yours,
Linus Walleij
