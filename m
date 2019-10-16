Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 691A2D9142
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 14:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbfJPMou (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 08:44:50 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:47101 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbfJPMou (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 08:44:50 -0400
Received: by mail-qk1-f194.google.com with SMTP id e66so2006174qkf.13
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4K7B+uLfKEBGyGYLI2L9ifLhMu932uDK9Ftu5vsTLNM=;
        b=TdEFBc1a1GhmOYAW2VtSm1o1gnQZkZwCc844SMM9XvDj5O96l/doIHiYscKqhjxk8c
         uunW6zvZyzSv90+FN0ByJ81MsiIQ+EdX1idYLnIEfIH29ecKHXYSLlWeO0rSBlRw30zJ
         xk43RxIDcXygry3uhKq1xbOt6FK7sHVII7pGy//MlKP4rMGy9xMxxjEdj/9VUV4RZPZx
         Yr/uPni/tyEG2zRjgof177N3oFQ4bX8meJn/QWXrdELUf0J8ypfwOa3ne05f1/BWGGMg
         WgQHfe13moWhf+DxVSs2o4pqtcK49LvS5YhXM0ILQv39atV1VQ088PQtUKIm821tofwL
         yYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4K7B+uLfKEBGyGYLI2L9ifLhMu932uDK9Ftu5vsTLNM=;
        b=mTCgZc01QQ7SACpQrHxB8tzAdSWMuuEowf3bgYLo9bs74d67ftg00w3ND+/W2m3gMo
         VnE+7qrwCDZ4VSflGEKG9EuwHmFEQIhthQFgC/CIZVWLpIYMbeeneCeMDs94B52/cOUp
         hWluoq1AROurcaw0oIvXD5ZHpsuxWsS46mVpJ7l9aPH00BqrRWEyA7j6Vb3SVoTn65NK
         OLYrK9h8tqtgOcUtbTXKAM4GjNWAo5+YJli6mOYxoWrN0jHukduIs1Uza58107ZFMoam
         /jh2yn/HybBO1AEafSN5Pab2a4NxVX73EWJSMyOk2fjluWVdl77Do67qJV4iOMUsvwfK
         dPYg==
X-Gm-Message-State: APjAAAWnk3RJgqP4QKKafuXmnEzTnE+T2TdrmkKUlROlNmYfS4mp5kQN
        u/QBQASb/ac1n56uQKtrBeS1ryYRG8xSddRrRwvc8g==
X-Google-Smtp-Source: APXvYqwTM8BkVjUwYymUoCEI4D83P7/A66wqA+dK+mNJipK7M/FV7PxzP6J1Gjw69MjqnyvjKRuCo11TD2KiTz+ravM=
X-Received: by 2002:a37:bf02:: with SMTP id p2mr41057686qkf.42.1571229889157;
 Wed, 16 Oct 2019 05:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191015091708.7934-1-jay.xu@rock-chips.com> <20191015091708.7934-2-jay.xu@rock-chips.com>
In-Reply-To: <20191015091708.7934-2-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 14:44:37 +0200
Message-ID: <CACRpkda+gVxBHU=UZTqfgasOYKpGJ4QSp07-TH-QrTQ7Urm5DA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: rockchip: add rk3308 SoC support
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 15, 2019 at 11:17 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> Add rk3308 SoC support to rockchip pinctrl.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

Patch applied.

Yours,
Linus Walleij
