Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC43834FAB1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 09:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbhCaHrS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 03:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbhCaHqx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 03:46:53 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F6CCC06174A
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 00:46:52 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id j2so20212396ybj.8
        for <linux-gpio@vger.kernel.org>; Wed, 31 Mar 2021 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2rFGf1esbHz4egss6iFrdkmprUibXom4Lehtgfz/t8=;
        b=wNvvmcd2vLBOYVXCdJKdJUCUXRM8rxSdk/0zIxhgHqPRvEUr6QlOyjw7UZB1wvnPn6
         P+IdPHsA9Ff/oSA1KlyYqMXiJF26Nx9r9LsNIOsD//AzqFnMSBdy02TZGFmHJBfb5scJ
         RQnlHQGPgVVKWBRxFfx8W5H+U+1NxHLjiOJLmISEYK9MdfrSpDgEXKAtWSq4fbuMV+bw
         TWWKP7n8EMLny7LOTCUx8rJ1CmR1x2qi9rXuxKKN5CtkeOjEzcESt52Fx0JCkpKdW9sw
         vjWs2pyIu//5CfRDv7Mvsn0Ze9053TmJZkKpJNK/tNx6n/edUYCQ2VVHMktOi4S959vT
         E0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2rFGf1esbHz4egss6iFrdkmprUibXom4Lehtgfz/t8=;
        b=HmeHYr0azNbkJ/NHVY69no8ugTbytWyiAyypSnwMpw9k8K5vgfK7ZpHh02GjRdQk1Q
         gZtmeVbY6rL/Tip+bMWeBGF2qcoVWbvrtWhmEpp7xTmOdK0fPCaxfqpfGoeBjbonL22W
         JYQdumFL3YCrVAN6dpe0IQAoYhSOVZzbR7iwE3yrQ8ps6y4vVXJa/1r/ByVX4cUYNewi
         b9ArjpLUup1WYZU0nP2JMV12/v8rUNqQRkPfMUmdHEp9TsOo5nhzNgl5EL+FcW7LwuNY
         n0qOzvV9o2C/BCAziwyqGpfOtwKMMNPdxn/8f3edoBiLy12ssW0lnfxTRQylh1xJrbmQ
         kyCA==
X-Gm-Message-State: AOAM530BIa5PGOS3yq2Eo/n5G247Ode6hWkhG9IVDFDFm3C48Lla3fj2
        v1oQJW+bMPr0CLk9NpYxGn7f/TXIEK3RkndBi1ephg==
X-Google-Smtp-Source: ABdhPJw8yT4SWhZQRGy/dMTE9DhMO6jmXXDpakMeL7dKWa4vIbjLEbTQCiEFgCzu57F+7Df9ui52v2KrxaBgx6/A80c=
X-Received: by 2002:a25:d2d3:: with SMTP id j202mr2870845ybg.157.1617176812042;
 Wed, 31 Mar 2021 00:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210329111648.7969-1-ada@thorsis.com> <20210329111648.7969-4-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-4-ada@thorsis.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 09:46:41 +0200
Message-ID: <CAMpxmJV06cvy=T-TQV2088ucsJrC0YEAZ1HFxkpU18vvpKqr_g@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs: kernel-parameters: Add gpio_mockup_named_lines
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 1:17 PM Alexander Dahl <ada@thorsis.com> wrote:
>
> Missing since introduced in the driver.
>
> Fixes: commit 8a68ea00a62e ("gpio: mockup: implement naming the lines")
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---

Applied, thanks!

Bartosz
