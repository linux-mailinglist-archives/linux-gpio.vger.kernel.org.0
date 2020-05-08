Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A05501CBAC5
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 00:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgEHWer (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 May 2020 18:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726843AbgEHWeq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 May 2020 18:34:46 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C26C061A0C
        for <linux-gpio@vger.kernel.org>; Fri,  8 May 2020 15:34:46 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a21so3314584ljb.9
        for <linux-gpio@vger.kernel.org>; Fri, 08 May 2020 15:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BXwbWaHXMtb8aBEDEibSiOBVYwNW7SPw/Ax2lzczNs8=;
        b=Qii0m1KDqgMTZAEfPBuv5upZmPTjwDVGpQVNeBRr5tjK2vq0rm/bWI/fdqrRMe68A6
         7WftQXv9fRiogg4svXJYLeoXZ/B8TTR0x3mMCJFcunLCyK+N/+eewX91sZrw/uVCJIea
         dvvosWt2jO98SLDkkzvcKL3cc8jaHyOKBPCrwx6U09j9O+cOWWXZ6OVFtpuPK+a6vM9g
         Gxf+qJQ0PLqAFuNTXKmc/i81K0rMvg1/454x1jbrRgdmB0UJ6Q6KXPdM/KJQrhckDeRp
         FUYnsPgDEfjoYxh42+P70hrJBX/Rzv3Uug7HHoK5lcAzC5NFHW8NUhRNJVIdf5btcsEt
         FElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BXwbWaHXMtb8aBEDEibSiOBVYwNW7SPw/Ax2lzczNs8=;
        b=P2fU+kiUe2udSpAs5iU/H6SNlMlkHh84Vc7swGT79TZJY7aW+9AYSfU21jWN8ifF//
         NaIO7UKISnzQTJlwNtyUnwXreQ3mh3ek1u5Fg8qCR2NEKUzMLQUsB6yuFzeRIKoUPWJ7
         3WVfdlj0Qd1FH+UgNYlMyCpLN67bllfThu7pZ9z6YS/NFQPFewvGauDUa6mmaTym69Bv
         CrCK0+5rTOX4eI/kBre+tzMTOqgoruOqg7ElgyFZIv+PP49CQLZ1+GsRLxNfgOkQ+c5R
         3CovURRZ7BgtTsAXEzwC17XQnCSDJ3qC4UU3mtg+jJ6dFswBHR8UVZ1rWU+zX2I5ow3B
         O9eg==
X-Gm-Message-State: AOAM530GQhqgHj58fLlusld+fPyUf7LMa18as9kr28qCE5837dUqvuZG
        0nTG7RsYlOWtDSwKtXNljioJvzKXQHZwwe2kzXqKzg==
X-Google-Smtp-Source: ABdhPJyqdy8GVt242YW9aRv0VDsu2KW/zyvl1R0dzJZGYXaywhb25l9p5qI2mp4n0+hwrOagsZygnypxTny8fKlhri0=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr2996899ljq.125.1588977284548;
 Fri, 08 May 2020 15:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200505164559.2143-1-brgl@bgdev.pl>
In-Reply-To: <20200505164559.2143-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 9 May 2020 00:34:33 +0200
Message-ID: <CACRpkdYVtaEKsdWOZz7t3bEQyPpQ8UXksOqOUXMuvC=-A7LXHA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.8-rc1 (part 1)
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 5, 2020 at 6:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> please pull the following batch of updates for v5.8 I picked up into
> my tree.

Pulled in to my devel branch, thanks a ton!

Yours,
Linus Walleij
