Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D341ABA7F
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 09:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440704AbgDPH4m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 03:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440654AbgDPH4g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 03:56:36 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2C5C0610D5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:56:35 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q22so6814328ljg.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMPtB/qA9n4HSaCSGb/6f9EwCAFkZ6rP/1whAbdIn9g=;
        b=kvsM8/LkXMpyV2rwPs8DlvQWEgGy38v1FnW5pfXAehq+Qe5XtkljcYiGpvhAx61cA7
         Ca9wfZkTyOhlDDuWu21855wvXMz1kl8tQOqPwhJK9bCgZZfOU3scVNpV2PohAs8IjV10
         7gH1ZHuxS628yADfWX4rIyWvRCTP0F9i8ZXdfKGnODvzJo02vaXJ8U0FLsdT4tXqYjnC
         6pe9REbPR8Y8xROdwKcOkPtD/XFd69zFRgI9ZunqJGQEClo6pMCZ3HSQq2hXm8bF76HW
         jmkUnP9Gul+08o74+R8Nl/jxtOjLHHTBE6wtTjx2W2baZx8Uv1d+WrlSTPzDa7/dQv0c
         61Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMPtB/qA9n4HSaCSGb/6f9EwCAFkZ6rP/1whAbdIn9g=;
        b=WyEokhaem9hWzh97cqMKN74GeKHCQdcg37cRCSn4gjQiR4o91sCj4ZsdKPrcQ9Nm1Y
         Yc/jg2/gv+uVxT1gNHd3ju7gRID3kGq7fbiOELgaTi2+x7fFioUyc+f/hbb14gJZRCXY
         ezAw66WzV5xLc/mFuIuYro6CX7PB4VdRD3hCxdxkTxN+6yqpfqjTIDzv9crYR+gAeDL/
         dhGwV7YjSFMSlaTWkFMhlMSPw/PXgBYQGtC5aNE3D7Lp+bsHkv2snQnJF5iNJVRsAVPE
         PLXmmxEEPD/BP0HXpWiMEU4IkIMZwxB6TYNvdC+37sxob/o6SmFL5N6igLLx4guo3gnA
         pOIg==
X-Gm-Message-State: AGi0PuZBE3QN6zluGiadwYwKaQKfdI+GopDhg3cGbO9P3yj0DGupPj0v
        6XqAvHrKqbmfHpEAGrwrUpminvc+QQzFQXtX5C8VNi6B
X-Google-Smtp-Source: APiQypJcmQRDFwooP+VIrqUkTrQ++SnGSWcitvwwWR2ZjguUj/BI4ZlkDGD8/57sEAr+kX5uCQw8BvzROFjLhAmc+Qw=
X-Received: by 2002:a2e:9ad9:: with SMTP id p25mr5771834ljj.39.1587023794382;
 Thu, 16 Apr 2020 00:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <1585554986-26521-1-git-send-email-dingxiang@cmss.chinamobile.com>
In-Reply-To: <1585554986-26521-1-git-send-email-dingxiang@cmss.chinamobile.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 09:56:23 +0200
Message-ID: <CACRpkdbAZJ8F04iAQqBv-ag7WWPLaKw0Tq0RB4ygPommWpZb0A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik:remove unneeded variable
To:     Ding Xiang <dingxiang@cmss.chinamobile.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 30, 2020 at 9:59 AM Ding Xiang
<dingxiang@cmss.chinamobile.com> wrote:

> ret is unneeded, just return 0.
>
> Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>

Patch applied.

Yours,
Linus Walleij
