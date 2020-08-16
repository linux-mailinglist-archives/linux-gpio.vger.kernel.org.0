Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F06F245840
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Aug 2020 16:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgHPO6I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Aug 2020 10:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgHPO6E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Aug 2020 10:58:04 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EBAC061786
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2020 07:58:03 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id f19so6106962qtp.2
        for <linux-gpio@vger.kernel.org>; Sun, 16 Aug 2020 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5JJqt1APXPHxbtVoU6OKZdS8Pw8Z7UXTRp846o51gBs=;
        b=16o+su7NJwI6TUCXIeseG3eoCdstKxdg/xp9hg5LxSCRLM0KuKRs5sFTgTnohECrBU
         X3YaXEBUUucPQ2XF602mJ8MgtUkuBGLDo/Z8ZHQRylzHvcvTmoZVlA5wDugnWaniZT4p
         Ej54DVgjZB5WQgPquRfZ7vayxaTpJO7dub5u8xV05SEPVxyi3cvGrrnIi2NlbjEoqGjo
         dtnJtBXG5eD28eajaod3WF8Z1ScJqIDk80jP8/3ILoVCmAQro8aaW/FCpIv6BfcB68nj
         oR00WuFuznFCSuDeU5SssNrfmdM1Ll39goEqnCcIL1N9RX/+1VTmCkUk9zwiaBOtwMWj
         sQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5JJqt1APXPHxbtVoU6OKZdS8Pw8Z7UXTRp846o51gBs=;
        b=RbMOQLnsXeVntK/FqPE95fwY0LJxSACZ9aWn2791OAdsW5CO1nwRo+w0VsJfehVIdK
         +dCI1kFjXAUA5dQfvT8IkO98q31ekBj0b2ZJyhtilv6aCm7JI9XoZs21KfIUgRxYVqmE
         4QoWSMHyTVKQyfo1qXHQZUSIpY2aw+ShlRVVAwUuuLdEx0slklF8Qdy8KWU+rRzgVcQa
         FwCcoX9yFDKz4IfsSB+6m9RqQREPCdg3Dyg/8R5BZy4Q0XCgL39GwCIl8j65byFS58QS
         AeAgMeLvhrnRdprooeBowNnn6bPpc6mKqPyqIhWjxUxzAjvybEvqHx/G780Y7v0CH30g
         uSuQ==
X-Gm-Message-State: AOAM533XV7WJP8dTD01RVYn1H+/nqhCn5p8Ged6iVpFDdMzAwIqwXMip
        OIUNRiBO6M2YgO4UtJEWHwwkbC3f2TPIwIROf9mD3Q==
X-Google-Smtp-Source: ABdhPJyAhemQhIGBpMloGbr4pTeOBWkIeCoRs1JtA0L7VE29Fib1JEaRqz6qVjX87rmsZ2nZKYBUIf7ndDlBQbKDOyg=
X-Received: by 2002:ac8:6952:: with SMTP id n18mr9620818qtr.27.1597589883110;
 Sun, 16 Aug 2020 07:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200814030257.135463-1-warthog618@gmail.com> <20200814030257.135463-12-warthog618@gmail.com>
In-Reply-To: <20200814030257.135463-12-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 16 Aug 2020 16:57:52 +0200
Message-ID: <CAMpxmJVFJBGDwLB3+8y9dk4pQkf=T+9igdMdAbvYnY8jT4df8Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/20] gpiolib: cdev: support GPIO_V2_LINE_SET_VALUES_IOCTL
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 14, 2020 at 5:04 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Just the same thing as with patch 10/20 regarding the
_locked/_unlocked suffix. I don't have other comments, looks good to
me.

Bart

[snip]
