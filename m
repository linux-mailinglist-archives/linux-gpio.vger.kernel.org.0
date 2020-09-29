Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC90B27CF0C
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 15:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgI2NYO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 09:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbgI2NYO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 09:24:14 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B89FC061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:24:14 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n25so4011432ljj.4
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 06:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7eSG5cZEIOd/A+4BrL4UEKqq2k8Hd/t1lIcp4xkknrc=;
        b=OJQ+MA+BtVcRMYmObtQJPBGUjEMLobsACekdQ0RZNPWOJPw3jkllbyaW9p0Hb/JHeq
         ClkMp+tmki1MxGdGYXuamUtpfOmi+8K75g9DsdOny2CKk1QG/sRJMYmME2IGDapxRNjT
         9tFzsBIqPOr0dnkUOS3HC0lvJEJB37pM8cRLA5Ob81JfuhJijGWYQ4hYd3UO8Uzx5MYS
         i3P0itNNr7+yk6P1LFpuW6kmCvo9s6d8R01ikUzH67JdSwxicfGC7I5+BegZ78Vp2kMp
         ryU//3akbhh898IAxW5xPDlkWZJbQ4yOMguf6Se0h0OfSfi+yvXz8QaHY1b9chX+aV4m
         HmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7eSG5cZEIOd/A+4BrL4UEKqq2k8Hd/t1lIcp4xkknrc=;
        b=b/Vj9LDS+ERs8B5zqTmh1tCxhLSLmCTfYw+ojsQoFq/C20nx9I9mZOhHZ9+2oXJcvg
         6N/iAPYnxyosI8IoJd2atOJKa0k8jObDr5O2q1W339TK/Si7vsUu2zwCBLw8+NAsK9+I
         WAp+5/gwUrOp70cvokmTQmQO2rgxA0om/3MEwocFcC2oyWJntehr2gvNhTAHdQwPItCO
         5qlddPHj1KkKT7OMede2v/TeGsIKrUW5DQx+5NVnlBlHmfQZ6Q3PoY36mZpi1BTUJpPL
         rQsE5uIYKVUlMw0xS2K9is8l/NUYEnX7JKhZ8neypxIEUHxuz5q2d5DE/k5ZTL3hZolZ
         MStA==
X-Gm-Message-State: AOAM533FU8lWrfKua9jA7Uy6B8lFohNF0Si1emrC6DvHA4r7H33+/+2I
        wLmGxVuEsIpanPs2hwXK4b+olSHpLOx44RPU2TUzdmt0zTahmg==
X-Google-Smtp-Source: ABdhPJxVkoHqKx5ZAPIdT/IQ3DWBtE/Rx7Yf2R0ERbQTAKMEtrmfTyeSueKq1ilG7/C3HBy/eeK9bi21PJaHhZPpH54=
X-Received: by 2002:a05:651c:107b:: with SMTP id y27mr1080266ljm.338.1601385851901;
 Tue, 29 Sep 2020 06:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200929110306.40852-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:24:00 +0200
Message-ID: <CACRpkdYgHt6ajbLPfajQ8ZJn9=SHfRiDZV6gDbwAPB8XSQBpGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: tigerlake: Fix register offsets for TGL-H variant
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 1:03 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It appears that almost traditionally the H variants have some deviations
> in the register offsets in comparison to LP ones. This is the case for
> Intel Tiger Lake as well. Fix register offsets for TGL-H variant.
>
> Fixes: 653d96455e1e ("pinctrl: tigerlake: Add support for Tiger Lake-H")
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I could apply this one for fixes as you indicated in another thread,
does the other two patches depend on it?

Yours,
Linus Walleij
