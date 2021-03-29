Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCC7034CE24
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 12:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232676AbhC2KsB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 06:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbhC2Kre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 06:47:34 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D092EC061574;
        Mon, 29 Mar 2021 03:47:33 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id v10so9130820pgs.12;
        Mon, 29 Mar 2021 03:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=efW0R7xutPE11DBN9SEnqyt0zcFDSwQ/E5/CXYn94wc=;
        b=jPQsgKEHQ54eLWy6kIy7wl774HD78Yf7Uu148O2sQGcjnSPcNidouj546G8YPuZ2IE
         jlyDUPDwM3WJU/73kMgBQQHdWDDfGXVQ9+AsSgwrJq+ISqD75xZ1g98PoaO+akx4N1S5
         TjC2qfVV7dtr9clYzL+R0vEsyG5R4YtuXdVVV4lcc+OnHy+wq+Fp+oQvxNpSCCt8Tr5Z
         ATtVJrY7I5p7CYa8HqHEwBfUb6TTuxICAQ4IsB1mfOSPGG5BWJYet0B2s6HzWJ7xnjJB
         fllboH1x672YqaBjLozbbsIev2AGse7RUwKpsU3Kf1MRUxBMHlxRN9KStyuPEVLzaATm
         SgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=efW0R7xutPE11DBN9SEnqyt0zcFDSwQ/E5/CXYn94wc=;
        b=JC2UMXPVsSBIkN3Zu4ljav48Vpkh2SJNBAbXcdIAItUYingYJxMovP64qVxVz+u5SK
         Jh2QPhuk1ZerodSEnyN9RPY/iohGQfBQvKlREpSnkmvxlunTu5m52P+Lm8tODJj6gpld
         Vloqkd7Dxx6az/0YOtaMDdT+kEC8UG1p/8A1Mcgwi3pOBmoXwkQNMBUayYPcub8vXKuQ
         vdsNFDDOEUbvuV0JigJRE9lNqYsn6BbJ+foeZLXN4QZUeyrqXdnzynjJu3F8l0OPsLNt
         WTyZaYIyFY/IQGJyuCloxOQQ0LG+344pNv3kzvInXbSCGOzihygvJaT7utT3x9SgVWJ/
         gDYQ==
X-Gm-Message-State: AOAM531Ada6i3NK70haD4nE+L10zAUUhWDaj489Yvp0RfaCflZvDI2nE
        FUEsqvQssRkSD+CO9pGrPBxOB8vUn4nqH9Zk+2c=
X-Google-Smtp-Source: ABdhPJxMpWibj/NiiDckZKIUVfWdqK2DbteamjvUT/Dj9Gzk+zF1ZnHWE70UXL5z3KO3CrN27HHdjwpoUKj/lzYf01U=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr25140695pff.73.1617014853376; Mon, 29
 Mar 2021 03:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 13:47:17 +0300
Message-ID: <CAHp75Vcms=dAXcACraU4BHENee6j+CTwQtMVtURdnMHVAmTXkw@mail.gmail.com>
Subject: Re: [PATCH Resend 0/6] Mediatek pinctrl patch on mt8195
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        sean.wang@kernel.org, srv_heupstream <srv_heupstream@mediatek.com>,
        hui.liu@mediatek.com, Eddie Huang <eddie.huang@mediatek.com>,
        jg_poxu@mediatek.com, biao.huang@mediatek.com,
        hongzhou.yang@mediatek.com, erin.lo@mediatek.com,
        Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com,
        Sj Huang <sj.huang@mediatek.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 11:09 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
>
> This series includes 6 patches:
> 1.add pinctrl file on mt8195.
> 2.add pinctrl binding document on mt8195.
> 3.add pinctrl device node on mt8195.
> 4.add pinctrl driver on MT8195.
> 5.add pinctrl drive for I2C related pins on MT8195.
> 6.add pinctrl rsel setting on MT8195.

You submitted the same version of the series twice, but it confuses people.
Now you have to properly send the series only one time with the
correct version added and changelog explains the changes done between
the versions.


-- 
With Best Regards,
Andy Shevchenko
