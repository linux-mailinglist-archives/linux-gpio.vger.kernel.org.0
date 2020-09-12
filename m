Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636332679E4
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 13:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgILLOu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 07:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgILLOt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 07:14:49 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D308C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:14:49 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x69so8482034lff.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6he4OS7k5pGAIC3h9rh8AvAP2KOK50OeKGEjAijQDM4=;
        b=u3H/BPqcd3QdmssyOdY/iVQWIj5r0CXrCJXQx1ahBt8oaD32GvBFR9V/bV3UpEoHEY
         rdSv/q2sEyG2KilRVRqOzYBNXsGEgd33rsl1l8wmLMA7YKPr7FTzPXCcr0lzlGJUuTYy
         9YCMhdSGzsw8WxVHor0/ESnyYzzdmGPWzKQ61/4bVoia9uWG6CLJ7tiVcnialJueQ49h
         yKlmzd4GmAqjiduDt8mkAdipv8CVfeQCl7KZiCEy4x21GX4Xin/mpyeNz73dX7R8DbKp
         ekOSkj1FDp+yE14ly+uiq9n2IvH58JPkXxD29cQZqCsTUkwj+p8VWnMOioj7GtRHIDsI
         FYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6he4OS7k5pGAIC3h9rh8AvAP2KOK50OeKGEjAijQDM4=;
        b=r91IPilX/dAvPPWNDrpwYnAFSEMwWcF02IUOcMZoIPQvnT6MzycWkO0ExCY2aY9qFd
         vR607v2s72zdailUsdPuRTQrKnII+NjRMpSI+Fact5FBKtaIz6VwvfBbpHExf6U2HAGC
         lOH/Li9OkuxrTWqSTH0Kd5P24NgduRptozuWRunvl33df5CdIYBn8omEJKKlDSlU4YfR
         0lMMv0K3WlJ6dteOoDkeXTyv/nyDQtYbm/ZUkHh3j6YCyklWUXrqPWhkYWIaHg//3BVC
         pLDr1suOrsZ2739Wt8Xpi8G547Fm0NHe6uULKEHU0MFkZv4nWivel/5qULGWB7ZVO1Oz
         jlbg==
X-Gm-Message-State: AOAM533lS8bT4WSC7CAh7xU+jwRMFIAOeIyC70VLWXfNRea+PGfC59Lk
        I7NDZkqnltiHsq8jsOrMMfgFvCoUzLshKELORjUkcgWciUc=
X-Google-Smtp-Source: ABdhPJz7rMsHAXxOz0LNuey3gF4iy+FsOI8nU4v32/mMPq50gFeHddRQuT6gL6swhgvellesJD4Wkw4uw8+aWohVrRg=
X-Received: by 2002:a19:6419:: with SMTP id y25mr1583932lfb.333.1599909287851;
 Sat, 12 Sep 2020 04:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200904155240.4877-1-brgl@bgdev.pl>
In-Reply-To: <20200904155240.4877-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 13:14:37 +0200
Message-ID: <CACRpkdYM0_Z+spLdsC5yD5qxoJJjQ7aT4ZzrDFVSS+qHcWsOkg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v5.9-rc4
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 4, 2020 at 5:52 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Hi Linus,
>
> please pull the following two fixes for v5.9.

Pulled in, sorry for my slowness while I stuck my head into the ARM
kernel last week.

Yours,
Linus Walleij
