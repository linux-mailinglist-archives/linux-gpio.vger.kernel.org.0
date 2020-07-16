Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E932224CE
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jul 2020 16:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgGPODd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jul 2020 10:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728853AbgGPODd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2020 10:03:33 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B07DC061755
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 07:03:32 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h22so7251786lji.9
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2020 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMVUtBja2SNgNlakfMOQ89lMDwiyOZMYueQ7OmzeKOc=;
        b=s70NSuWYsBJZnUt1zfuwVLReLbh69acoUniM01qHMZ2j12NIRrmmyS4Vsa9luwKwkG
         YIRZoaaafmMHDfyfDzP6+5do+UjVCwxFA1lwXa+uSClUc6cpdsNMJG9Lgj2X43N8YEXg
         zH2bCgqu1L6CyZ5F1AtBgYqpIj84cutxHCq3Es/S0yVzsgVNaMls6GdM/AYfiVsMe9e7
         EjbYa+X4EfRBQe0kZeeyL9anmUirYJi2Ze1NrRliRLtZxw/x/qad8wjlWR6xs8CXhvmw
         ci2jfJ7/D3oArgAhYfpVqMJye++UoLPPMb8HP7o67g3reuTyc27gWYQQjmC2LvXJKfEu
         JG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMVUtBja2SNgNlakfMOQ89lMDwiyOZMYueQ7OmzeKOc=;
        b=Ywqk9IzT/EJyC2ty9iA7DCiUUgsYPlFgGnTcMteTTYpzxiMGFFZJg0j0hiIyJ2wZm0
         U3WQJi9LEvquB11m5Z7aOQrPwn8wSStM7yoYkLVbEuEt2Ix8yfH6HSGsAJr526D+qvXm
         6g5tIcQbSDa1RS3b7ikPHvP2J81U/xS86dT41PbqR6iy8rXX6cFSDivNtr8BVheKROC0
         j0NVo/qrFeB4zDWLBRLX7FnmDkh2tVOpVZQ/1/+HovoFgLUDE1iGctHI7UhXcwTdsEHO
         Xn2pQNtBZ3KrYi9Pb7hnNZlSQnfiTq3zmuSp/pQjOBwMxQbgnb9w/m21pnWDeS03YnV0
         KOTw==
X-Gm-Message-State: AOAM5336J5eBAN3vuqah0FeBVmVWAtHFRDxVrHHNKFA7PEwLQotQwxVQ
        c81zisgIJ1YzrVyfNB3gwvXlCOjLr0SFcWyXrL+1NFQnAE0=
X-Google-Smtp-Source: ABdhPJyGR+lfdX0ArBMfAZ1+XQfx5mFzLRS97WrtmtBm3jFw4kXFlOFiS0FfAH6u+pxFbh/gBOiMIWWYW9aJ51rn6zk=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr2214470ljj.283.1594908209643;
 Thu, 16 Jul 2020 07:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200716124244.50797-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200716124244.50797-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 16:03:18 +0200
Message-ID: <CACRpkdbaus7etT4dUr_iAitpfbW-EEedW4Zj0HEN3xysZ6ab1w@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: intel: Add Intel Emmitsburg pin controller support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 2:42 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This driver adds pinctrl/GPIO support for Intel Emmitsburg PCH. The
> GPIO controller is based on the next generation GPIO hardware but still
> compatible with the one supported by the Intel core pinctrl/GPIO driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

FWIW:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Obviously Mika's review is more important than mine anyway.

Yours,
Linus Walleij
