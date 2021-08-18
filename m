Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC99F3F0EAD
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 01:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234889AbhHRXiV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Aug 2021 19:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbhHRXiV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Aug 2021 19:38:21 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CABC061764
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 16:37:46 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g13so8327867lfj.12
        for <linux-gpio@vger.kernel.org>; Wed, 18 Aug 2021 16:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhIy9znc3R8woK0Yh7F5fhaRRY/b4r09z95kantGp8k=;
        b=FAqmndSysaYMKv2k/Pyn7x9vHZIivco6iQoVrwvorawqJeWA9tQL7JnBsCMSVmty7T
         94Wc1dg257KjAz7v9Kpzx5JSi55gxpMnI0qV5vv1FQnxTnjY1eUiru0RDozdmDfBkJdz
         lDS+y/nRRraZ4UmagC9hDeu/faE4sOqxE5d2LX4Q2Z83lThYsY7Z7Ao41JA/+OJKQrst
         qKoMN8Pi2yU6wnD1+UXa3T7OO9k7U6WHFoBlIZ7+ASZeOqK9QVr9mSebI3xc1Wq2V2SV
         JGrnbLc1+IiCmtNx22ZSaig75ywBThanKqC8UDOaxD6Y05hpCs6pOm8wzFgp2DvFjjW7
         SWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhIy9znc3R8woK0Yh7F5fhaRRY/b4r09z95kantGp8k=;
        b=LqsBDvsqqKvCAzEKf41i4ZCLECyRzY/7JBgd06RVmt+kezNR2h+XVkeadoXgum3EQq
         xvlgmuvtMFBwk7dWLYlybDx7TUnRzAGdsvnq8k55zA+iNy8DFvhCTOsp1sGL13ZPPJz7
         jZkTpeQcoZ4MLfJ8trwKOzQFKcUyXGxf0qNm6VWrfG92enEpSg3meG49DPKJ5uN6IyI/
         si9Yycy8c/G3ZC0BhDNdzW5zcjtyFkvX7ZK724PP0Nan1K2lyMa+eKRNJFgssMC3lgnp
         jdN0bNfqUzFXNWnqvn4VvpFdSQLvm3AUw9VzdRNdg117twBLcj9MCQ/7xKuBQnbfWdFc
         3Ffw==
X-Gm-Message-State: AOAM532E6IhM1LIqxReKsUm/RwFkYpdZ8MBnbjamPRhU2043daw8G91a
        KdedVTbs2beSzzDBrbQF8jdIDL8JsUZRUmTbffVAUg==
X-Google-Smtp-Source: ABdhPJxFuwdipfU8mB3bkgwXWO5+wtIESz6BPxgGvCF6DejBFdyr9qxRYbgcxPe0FYC4XcON3bjyXaLoS2nwu6Hz1Ak=
X-Received: by 2002:a05:6512:3e26:: with SMTP id i38mr8422086lfv.29.1629329864245;
 Wed, 18 Aug 2021 16:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <1629265999-33358-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <447d7205-f562-72c2-8317-031cd733d60c@xilinx.com>
In-Reply-To: <447d7205-f562-72c2-8317-031cd733d60c@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Aug 2021 01:37:33 +0200
Message-ID: <CACRpkdadQujzApH_XKhe5LD46S4GUseXKQ_mV4Jv7eaA5u1yUg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-zynq: Add warning for not to use 'io-standard'
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 18, 2021 at 8:00 AM Michal Simek <michal.simek@xilinx.com> wrote:

> Linus: would be good to know how long we should keep the support for
> this deprecated dt property.

We use the "noone hears the tree fall in an empty forest"-metric.
If no user suffers, we can drop it. Determining that requires some
kind of reasoning about when that happens, and then the maintainer
of the driver decides.

Yours,
Linus Walleij
