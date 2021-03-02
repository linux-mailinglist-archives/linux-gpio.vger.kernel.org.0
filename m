Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C7932AD1F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381750AbhCBVXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384758AbhCBQKk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 11:10:40 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E59C061356
        for <linux-gpio@vger.kernel.org>; Tue,  2 Mar 2021 08:09:34 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id u4so32141123lfs.0
        for <linux-gpio@vger.kernel.org>; Tue, 02 Mar 2021 08:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cACSwzPT9Tad/UgCbDi2G+cU13fcnP499kD2jiD09qs=;
        b=NJEiwMLgHFNNJlVEd6adJjw4zF5BqE8QNvPbKlU2qcF5nTbpvSfDqBcSIuLL2KrUG6
         o4ZRMnW5m5wifSfjNQCh/iV5R+WDo020X3Va3Y8ITQgT8aY0KjjMv93nxbBrMzWeQwvr
         MV/yt9UmqPHGnd1769eSqMi/PH2vZuoeJEYufm2h62VWUqAa0i5521oYCBx7oIar/YS9
         zeNA/8Ui0uVsSrNy8cMBB3ZT35D3bMnig3CWx5MuyCzQ0UlNDG/TjQ5OrQTbN8aYq+pT
         yNgOA9VdMye8b1idb0bhysNzSimNMKDFKCGWkCanMgcDb7V+qWvA1qNJsc/12iLfhR+H
         CNmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cACSwzPT9Tad/UgCbDi2G+cU13fcnP499kD2jiD09qs=;
        b=Wit3rOiMbZlVblQnXDOv9CHen/uSHdKZsY5ISsT3QTGHTxsfq9GrVnCh10o7PZXV/G
         ROrVVl+uXFMBNoDlFYT2Esdn3GRRVwyF4eHz8Z9UbrZyMJxVCU8wc9A5YOerVxC5W9/t
         0CsgTeKRByqgQdYFOSggA9QOm4XhTcdLAZvwcxoCD+NhsccN4pxZzWn2JYSYGpvTJ23R
         oR84pdD8/CpFD+faPIBvUuLvGhdd5Go1LAcF8Q8aBFpYYBd3c9+FL2eJ6ZX00r9AtmUS
         9yGsYZp3gb8XzuMnZkJIe6Wyt9bEqo/e3gXIg/wPhNNgOB6ZLmQ6OYnA/J0m9S8qFQqD
         AufA==
X-Gm-Message-State: AOAM533r5Kgp7yeKy6hJKEi5f0oZfmE2AZ17UQzzXcrsxkU669k5wVb+
        InpoocjgsYNW2caKfSXsZZfYh5EWmXJmlJNtEPPLJmMsWsSPaA==
X-Google-Smtp-Source: ABdhPJydOO1OZgkTglTXFR9GH+FnIBDVeX/ZEwc/b8GDNcDcujJOMYreC/Hdjimh7pS7t4PRVV+TgNPXC3wo4iruuGE=
X-Received: by 2002:a19:6b13:: with SMTP id d19mr12469725lfa.291.1614701373147;
 Tue, 02 Mar 2021 08:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com> <20210301165932.62352-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210301165932.62352-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Mar 2021 17:09:21 +0100
Message-ID: <CACRpkdYsqF_Z4NpfxRCcTb5F2gZ1tLgVr0qALBfVm=LyfQWwiA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: aggregator: Replace custom get_arg() with a
 generic next_arg()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 6:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> cmdline library provides next_arg() helper to traverse over parameters
> and their values given in command line. Replace custom approach in the driver
> by it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Wow how nice!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
