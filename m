Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9202E3AC747
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jun 2021 11:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhFRJVf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Jun 2021 05:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhFRJVf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Jun 2021 05:21:35 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F99DC06175F
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:19:26 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a1so15236664lfr.12
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jun 2021 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AAudbYmuixSdlEgXtjKJv0n2NcjoWuD1MrQFLPSc52g=;
        b=i5C8dewr2f/tyRhM9g5NxNnNcLNh9mMG/vKU/sMKnAyotQrldYYYfyz0s5IkGQnoGL
         /uRsxQlk3Ah/cVYMiYnk4kCafdM9wn+Rb3rZFs/86/mdLXkrmkSqLiQ3Jp96Rh4p4kDZ
         38yNqvYQ5i6Bjy5RvbYFbqh5yh6RT9EwbrHe5+8U4dEgDuMawkPuE7dNxL8xxk6G5+sA
         iiiH/FBXmF7Bx0mqoMrM4ew9OM+Ip5Np2YlDM0zKqj7vPyA02qqZyTHRw0n1VU0cB38L
         BDYQQX1L6c7k5sXhk+nhs93TCkjMflnYm27BckfqF4Nd66P1PZSh6He+ZrezuQfrsEUM
         6Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AAudbYmuixSdlEgXtjKJv0n2NcjoWuD1MrQFLPSc52g=;
        b=amdqUpVcJ76tqxJqhr5vjW3V3aogu9iL+qEC47/xfznGzFDeSuiYPI6iB5H7eyVAyv
         W/IP9ULPcnL2mAqktIGPdHS4eIVFmxMHI5PCSq2Tj8RFM+ETu+m7S9+ACKDYkA/9vGcA
         BRUjzK7U40tvZeUW82LM8FFu0ee7nRllwvcx/MsHzFbklMYo06CrbTLyLhswY0sHkhN7
         UAJWr6EqaeadV00qkgqed88ToLzDvinWPVovm4/d4H75SpxWYzyLAu/pap6gQ1y0C4Ve
         Mekq1pnOroXxfTKzyMk76Pkt+zUhpJ4xccO7+msC6RNaHFioGxMUEensFg/pu1yg6s3k
         7qOg==
X-Gm-Message-State: AOAM530+xxG78lzGvViEnnJ3S4MBCpCAKgguV1S27ouJmmdMnuGOeeT2
        6TYXwEieIEh4fyNm+JR37NqAsUY5bGHoQjjsmK2VNg==
X-Google-Smtp-Source: ABdhPJyzppoZc/IBYS2rQQaDKbwIyHNTpyTWkBDrYq/52o4RilfCa7qvcb9XAiDEC/mZ1JHawXGnjMOHWXjJyfJW1rA=
X-Received: by 2002:a05:6512:20c9:: with SMTP id u9mr2406202lfr.291.1624007964644;
 Fri, 18 Jun 2021 02:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210606191940.29312-1-andy.shevchenko@gmail.com>
In-Reply-To: <20210606191940.29312-1-andy.shevchenko@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 18 Jun 2021 11:19:13 +0200
Message-ID: <CACRpkdYH2dCUg7xchRs-37ywDXiWmna5CxkBufgZgYUihAZCZg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: microchip-sgpio: Put fwnode in error case
 during ->probe()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 6, 2021 at 9:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> device_for_each_child_node() bumps a reference counting of a returned variable.
> We have to balance it whenever we return to the caller.
>
> Fixes: 7e5ea974e61c ("pinctrl: pinctrl-microchip-sgpio: Add pinctrl driver for Microsemi Serial GPIO")
> Cc: Lars Povlsen <lars.povlsen@microchip.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied for fixes, I got a bit snowed under because of
patch-spot activity.

Yours,
Linus Walleij
