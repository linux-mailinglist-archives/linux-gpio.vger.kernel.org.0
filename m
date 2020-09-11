Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F7826626C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Sep 2020 17:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgIKPqP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Sep 2020 11:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIKPqK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Sep 2020 11:46:10 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 636C8C061757
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 08:46:10 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id ay8so10433610edb.8
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2020 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t9M9z6vChanjz3FW7RZAfgR0ZrN28VaGqBzBMt/OWzM=;
        b=tPVjcR0fMGpKYgJjUFFwSB4cJY6BZybNF4DP5J+DZHZLxRUyoHwaFkLVh51aJA2nwI
         vLdahestZjmnzgn2rGO5FquuXbqClxmwuIjWPTqODOef4a5dE+YMbbqaZWKRn6e8b+Co
         03b8DXGIFwLjGxcyA2E3QbtARE9rc+szQpsQFXcN14A6DC4AtOHPKHsAL+WFDVbm3ihD
         kQeJ32LdFRahRcoxEVYvY+poMi75A1jkYNMCo0zKW1OVb3gwEYsC8Uv2uc7GiRIv9Adl
         rrvRd6hGU4uDpbiGKtzSPzffm9Ld1abgC8Q9RO1w64EH3r8HSYx4NvwsV27/PUNFaldT
         MOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t9M9z6vChanjz3FW7RZAfgR0ZrN28VaGqBzBMt/OWzM=;
        b=g/eyA0ouOEAKAtWiqUbPW8NGGQ1qBLFM/rR/XYECq/vYifmlVTPib5V6Q/4Oo8uK29
         n9oL6uJiho1wVLagqOjB8dC6YMOqY/G8ORNk4FzDxijTIZePklj2Bh8IjUxvW97/HYnK
         YnliaU3rKYVVLEviyYafAxb3y6Fii6x3Wf6kL1eVSWhNt6xQhZLiWpAA4vqNVgbb/9yE
         sgOTNNUzvghbqREECsoAGqk+2oVJpWsLPeNa3CM0W8YKlRjaq/GGK+fmxd+ouCDca/tz
         s5SX+iAQQm/r5mb3sizPHYQJj20qbG7d2+TLvOpRdPBtGYxutoTMjwi1KNszog87Pls9
         0Mzw==
X-Gm-Message-State: AOAM533UC9yiJFmI1VPhxwdl/hJEPimM8NKdbWZS9YEUhHbAjIiVzHQH
        u3yH8t2rUuyedyLkqEdc8kboySWGCRKLXp3cURug2Zom1ik=
X-Google-Smtp-Source: ABdhPJwG25y8VIWIWqR4CT1cq3yKOlJyB7/ajzCHjnVxiO1PFdjMOzrEIXG7gFa7G4WXumFcjC6svBmzUqAUj6ZISCc=
X-Received: by 2002:a50:f687:: with SMTP id d7mr2813469edn.353.1599839169146;
 Fri, 11 Sep 2020 08:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com> <20200910101935.47140-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200910101935.47140-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 11 Sep 2020 17:45:58 +0200
Message-ID: <CAMpxmJUftmDdqahm7HbMhgYCwcLhMrLFoFAuQ_5RTfGzu-LrNw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: convert to use DEFINE_SEQ_ATTRIBUTE macro
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 10, 2020 at 12:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use DEFINE_SEQ_ATTRIBUTE macro to simplify the code.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Queued for next, thanks!

Bartosz
