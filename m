Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5AA2CEA29
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 09:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729042AbgLDIuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 03:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726471AbgLDIuR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 03:50:17 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B11C061A51
        for <linux-gpio@vger.kernel.org>; Fri,  4 Dec 2020 00:49:37 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id y7so5685572lji.8
        for <linux-gpio@vger.kernel.org>; Fri, 04 Dec 2020 00:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+M8zrbq6b1p8wlcXRVRPmBvCI2nb4z2DmdAj80G4yJY=;
        b=WdmUpBTMYIcMJSRVU1JOBuE7mf8hr8esrydhOy1Gzs7dnJja0RYck18VDWqZXWf4IQ
         6/QMs6QEHr70cEserUggAYNtEGvQSuz7OlFWn/h+jeLt9hg8tvwTCy7Osa+eu2fOHPAD
         nzPdWZnUKff8WxA5zaUASm031d28dSHlU4KRf5mwuoJBCd709azWoydVuKvsTGFryQHC
         /9GivUVguITQIGsbnrX5uXJvMnCR+MeMUZllGz/xa2dCFKBDqgznuz107Mn/3gr1aSXp
         whVJs3HWyQN8GuSCMzWvm/5kkpB0wppQ3FrBCY4mZACUP2ocEj0MaCJ8bTqvux+gzOOG
         D6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+M8zrbq6b1p8wlcXRVRPmBvCI2nb4z2DmdAj80G4yJY=;
        b=MpP97oIM6q839SH5nZ7e9Fp7ODcGXN/xW1EsC+QYeIcrmqwaKyX1m0yAl6+EsA9Ydr
         bpAdE1Gf9EA24bSG11nsiUkM74KqFBSYyn1RMtNWopXQTWs1WXjYYr3TTe6JmKyoFYSm
         8cgEggxz+ph1DkhYkGOA37Bsdl2w41TuYjsVnmdZkp3o3MZxxwDxEnJlNZlncLTJ4xRN
         dH1blYJWBcCgbqYoKzwZd46Cgk/nn20w7AgfWg0VigA/t/837X1cpENF3WV4WQmskyvd
         /vDQRfsTUNS9x0bLO6V6RAGXYeFJfX4z81/cIvVXOVPU9x6EEeNe7y8mIo7tij3FmMjJ
         4hmQ==
X-Gm-Message-State: AOAM533Kv/zRG4LR+Q7WBRZV2Vf9RHHA5OcizIvLjPRn3wXMNo2i4yWL
        zUCFmrLXUB6Jkcr6/cdUnHGIgiyUPeFsxc0HJlO76g==
X-Google-Smtp-Source: ABdhPJxqn4nKKGnNWQ8ZGC/Q2XERh1TtexNG5hJfal8ZUnxdUO5LOaSCB57gt9jbaaXkbFoYOCBibJQ5/e5byYO5UGE=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr2861001ljb.286.1607071775878;
 Fri, 04 Dec 2020 00:49:35 -0800 (PST)
MIME-Version: 1.0
References: <20201122092548.61979-1-gnurou@gmail.com>
In-Reply-To: <20201122092548.61979-1-gnurou@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Dec 2020 09:49:25 +0100
Message-ID: <CACRpkdZzBxJMJknDL+bt8bGBSBCOO4mT3cbU+RDWL2W5Fpp5Zw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: fix typo and unclear legacy API section
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 22, 2020 at 10:26 AM Alexandre Courbot <gnurou@gmail.com> wrote:

> The "Interacting With the Legacy GPIO Subsystem" of the documentation
> was unclear at best, and even included a sentence that seems to say the
> opposite of what it should say about the lifetime of the return value of
> the conversion functions.
>
> Try to clarify things a bit and hopefully make that section more
> readable.
>
> Signed-off-by: Alexandre Courbot <gnurou@gmail.com>

Patch applied!

Thanks for fixing this up and thanks to Andy for coordinating with
the fine folks over at StackOverflow. I added the BugLink and
Andy's Reported-by.

Yours,
Linus Walleij
