Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915972679FE
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 13:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgILLgC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 07:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgILLgB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 07:36:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D138C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:36:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id y4so14609309ljk.8
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SBAW04TFeupQnNnmk4S53sUPFeF4xMX2LlDKsbafVOs=;
        b=BCnXsDJMLcQc9CcuNaCCCIMmCJzyhnZSkh/mGM80pc5h7kjwLzFc02Gl5HNLZRB+uM
         PhQGymJZiQ+jpALDJfuWlqAcaUwgkjMIX6UGZgFgWwSKkOJ1UlDm0n6Ko4W8dIQz2NU8
         oA2f6N/6Xx/2HvykpwRb1EJqSyjZfeyVEPur48xDgHpt0HJF/KLThDrB96CjHLky2LRE
         +sTE4ZLjtQFHxlT7eG/xfW9odl5rSWFDpU08+YxmXa4nKZhdCspl+x1rFTKDuLhP7Xen
         tYElwWFquIBqudVzwXLg7VxPMiGR3XYtgE0Hc/KH9x98xVtT2T+4nVd9S9kYO9qY7M9e
         H6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SBAW04TFeupQnNnmk4S53sUPFeF4xMX2LlDKsbafVOs=;
        b=Up137Ytz/QUvi/LbWvoEcP50qQ0iF9C76kuw5eGUWSZtHayvU5bXEiN3xtgXksswem
         ZyjW8yGis3L9sCPpjbQG+0Lt0V01QfqjDaK0aWl3HjQXL7p8ECgLQ4OAyjhFQyiFDYNl
         HWiOerWM7IXEwH3hw+vwXxkOJSMfPkUk6fF7+72JzeaAjSQRRhdp8SAcageyXkjZuFNp
         7afuXEzS+1pWffNfW8+2ZOUottZCGIHZKPbkEonOyCBX6eW7VkTQuSipP5Cti9y+Yyjp
         nDUluuKUbthDwW+k3l26k7VUnHLCprVW75ctqMOovZ6uXuVUgl2nbT/v+yDIcPzNa8Fx
         FhXw==
X-Gm-Message-State: AOAM530UM/wYw7PC8QbFCXojeYhqLFM4j9rJ5dEqSfXJqoW9ZYUympWY
        GrjIaX9N4KPExW1LmSFVdJHrAUzKE7YOwqovFLfENQ==
X-Google-Smtp-Source: ABdhPJw7hWpd8Ek3ujyUQxMfSlqeXcNu01/Q9l69PHtaPxgqJnbDpy0a6/0EAy6dkAGat1naP1BU8/wkwujt6f+oDdE=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr2477614ljg.100.1599910557737;
 Sat, 12 Sep 2020 04:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200831084753.7115-1-jay.xu@rock-chips.com> <20200907025927.9713-1-jay.xu@rock-chips.com>
In-Reply-To: <20200907025927.9713-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 13:35:46 +0200
Message-ID: <CACRpkdYHTWBU5hkAZ-E-ECMEjJTcPReQqGQ-yTVQq4hXS5Da7g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] rockchip-pinctrl fixes for GKI
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 7, 2020 at 4:59 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> These patches will fix some issues and modify for GKI.

I am sorry that responses and review is slow. The GKI thing is a bit
controversial leading to slowdowns in the community because it is
unclear how this should be dealt with in some cases.

> Heiko Stuebner (1):
>   pinctrl: rockchip: depend on OF

I already applied this patch separately.

> Jianqun Xu (4):
>   pinctrl: rockchip: make driver be tristate module
>   pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
>   pinctrl: rockchip: create irq mapping in gpio_to_irq
>   pinctrl: rockchip: populate platform device for rockchip gpio

Why have the big series of 13 patches from july been cut down to this?

I would prefer the "big" fix I even tried applying the old (13 patches)
series but it didn't work :(

We can apply this once they are reviewed, but I'd like the rest of the
13 patches as well I think.

Yours,
Linus Walleij
