Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 560CA77EE6
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jul 2019 11:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfG1J7j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 05:59:39 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34185 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfG1J7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 05:59:39 -0400
Received: by mail-lf1-f68.google.com with SMTP id b29so32723290lfq.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TT2iQ+fh+yLVfA5XCASIgHgqymw+iJWW639N0+0UQAE=;
        b=FRl0zJAKpwfKOlbX9Q5cPuWYSDRbmQE6DNbukn1h3ogrfsflueUFSgzjLc2SzfKJmR
         E+m+RKFJGXHGTQxCbHHEAUyvrMW/i27uOzMblM7E39IlLXNUZipq1sxXEr1Ao0deWM61
         TGd1Y3wy9ZkJPV1km0kHVQPpc60PiIcjgjN1kqdkGKmSX4gtr3WNxQ/oUIpud41n0A0z
         2WMIZKD+ZSBh3LQUlMhvfTu+Wqewi0XFx2CrquUtFg2bV6LD/CUto6RiC6XIFhhKnWrQ
         NXoh3Wji7vjpIauRm10bkwehuX0zeLTsL8XU3nQZMZkod6NRP4C6u/6Okl1ooGbx/yI9
         1Lcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TT2iQ+fh+yLVfA5XCASIgHgqymw+iJWW639N0+0UQAE=;
        b=oGO7FFEecqYeR3BQg3vaOxsUZb2dlLRbG21F4OeZBMJut2bVX8C4xh0T+F9DJObwsQ
         Ygx2D01aW2LkKz1rVqnvm5up0b2mPmIiXh28meA0lphqEuWkRUWDQccDQekyD4LdInis
         Tp3HQ/ovXnH+yG9v9paVEijlWvPM/c18ZMAKANDaUiWUtPAk3dtfowpVVpdJEPp1IlNi
         bMZR9e4VpTgjl6n3eYZeaV/IJiBrMsa2EeHTDsZ3R9a1IvJcRU//ESt/8YtjJ1hBRdWI
         FsrI4Hi/1B1XmWPp73cMJ2J5Dakz6NwLEKXJSJq1lwRfCmk8NgsgODA9F5Qr7+i/1bHE
         WgmA==
X-Gm-Message-State: APjAAAXXslYTmcttu50PNV9RPxVoylzBagxSdm/J73Qr/c59PDOWtMJB
        qitgr33l0vPTI+VefHdBCdjhbp7h+V03J4QezidhAg==
X-Google-Smtp-Source: APXvYqxkR2GcWRl3K2H831/69AeuP+bZxZIVeB/0pJPp/XlfvJyMah1IjsUVQhTN/o7bF6FNas2xCMlAk3GX6qDHTY0=
X-Received: by 2002:a19:6a01:: with SMTP id u1mr48506198lfu.141.1564307977519;
 Sun, 28 Jul 2019 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190628161419.26439-1-colin.king@canonical.com>
In-Reply-To: <20190628161419.26439-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 28 Jul 2019 11:59:26 +0200
Message-ID: <CACRpkdZvmbCkfCn=PqREp=v7bB7OaGG9+B8_PG5+nK_=CRWM8w@mail.gmail.com>
Subject: Re: [PATCH][next] gpio: bd70528: fix spelling misstake "debouce" -> "debounce"
To:     Colin King <colin.king@canonical.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 28, 2019 at 6:14 PM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_err message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
