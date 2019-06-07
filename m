Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C49539828
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 00:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbfFGWE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 18:04:26 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42784 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727933AbfFGWE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 18:04:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id y13so2685779lfh.9
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 15:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSGQwLEBuCK9zP7NpUSQEjWlt9syiyScK1Qv82y9zDY=;
        b=Rqrv2fw0OYkyZCGgpZZfV8pHIKnnDqeqwB/GSfmW0R1GWq17BPPCFxCOmyyKhSmTAC
         iJ+sTJVzs1dN0I5UydjVGQ/TqRBiXREqAbxKmvClzTTM48MzK67ENGlUmnLCepOJMIOw
         Z7nx0Vp+Bh+nyEcsbhQrrLRhtFtXmrRcFUrF0qok9m27CoHzyIS5dsfr8ZcX1kL5yBkG
         7aqg+uWDat7P7iT6MkrjKUrlMppj8gQPtNFAaujnmx3ebL2sKEbPHsIT+TPGjMXGefUi
         BWB2G69ZLk6Qc+TeqJcVwk54B4r6gqFueiRlVhZwcClRpV5B7PZa4B4PmArip/cFaRUz
         LquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSGQwLEBuCK9zP7NpUSQEjWlt9syiyScK1Qv82y9zDY=;
        b=poLRxSTZkym71gabmZgYIuDGGMdH9l8vKsenEfdBkpHOl65K2WUArMFLnlY52SAtSh
         ZRqIuJF3JnEeYnF+0iZSb1HJZ7oBXj+7YPV0X/7OEp0lD5PFcZ80lAltySVqYlzt+y4e
         UDUYCYYlOJzlPP+S3HXuOPdtE1RIHOORVVFuPJRrsjXhtMkhkm1WYIQK3oGLuU+8B1QF
         hkvJM6UGyOdZ6LybBQHBp+ueoMW/jR4jKuDvfkOElqkL2XykRyP06WaCIq9ZQxC1G/kR
         yHB4dcN9xQUojdJF5nhmkH2L8PPYCiwHgZWKmJvkJ5ZbICZj755u2PSc2miIts3H+FCC
         pW6w==
X-Gm-Message-State: APjAAAW4iqw7+sMbTAhh3DNGB+Bd5a8vxUJCWPUDvR2lpMCUzOP0pcZQ
        Lq0hyPW6VRTm3HBIv7VjRNQ65H4wKCol1V5PmNWhwA==
X-Google-Smtp-Source: APXvYqwVpDLv8iqMxP0olSZYnqLx5zmax/077YaDYBmmnV4PB62sxN/GRgbQx9K+fhcwLTxaiRy5bNBfMaxV6Y9CtKo=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr26914521lfn.165.1559945064357;
 Fri, 07 Jun 2019 15:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <9bb9ca6102e795dc2495d92b7b661779509adebc.1559651758.git.hns@goldelico.com>
In-Reply-To: <9bb9ca6102e795dc2495d92b7b661779509adebc.1559651758.git.hns@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 00:04:15 +0200
Message-ID: <CACRpkda6Hk1hE322KGC==0OFr5YZ+Qsvh6Dird_xjS5xop4bEw@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: hack to fix 24 bit gpio expanders
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 4, 2019 at 2:36 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> 24 bit expanders use REG_ADDR_AI in combination with register addressing. This
> conflicts with regmap which takes this bit as part of the register number,
> i.e. a second cache entry is defined for accessed with REG_ADDR_AI being
> set although on the chip it is the same register as with REG_ADDR_AI being
> cleared.
>
> The problem was introduced by
>
>         commit b32cecb46bdc ("gpio: pca953x: Extract the register address mangling to single function")
>
> but only became visible by
>
>         commit 8b9f9d4dc511 ("regmap: verify if register is writeable before writing operations")
>
> because before, the regmap size was effectively ignored and
> pca953x_writeable_register() did know to ignore REG_ADDR_AI. Still, there
> were two separate cache entries created.
>
> Since the use of REG_ADDR_AI seems to be static we can work around this
> issue by simply increasing the size of the regmap to cover the "virtual"
> registers with REG_ADDR_AI being set. This only means that half of the
> regmap buffer will be unused.
>
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch queued for fixes, let's think about better solutions going
forward.

Yours,
Linus Walleij
