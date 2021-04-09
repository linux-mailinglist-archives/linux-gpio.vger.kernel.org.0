Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D8D35993B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 11:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhDIJal (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 05:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbhDIJal (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 05:30:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4F8C061760
        for <linux-gpio@vger.kernel.org>; Fri,  9 Apr 2021 02:30:27 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so2620151wmj.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Apr 2021 02:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gwj+s9/MPNGp8MyMcCfWHYTaJSXA15w26uCI/hDpxBM=;
        b=mCgAQow5OJ0Sz5LtItrljl/dRuo0GhxDgW8vOV20Cns3k7Je7i7ezOpUuhKhis0AWa
         7h6b/tTSjVNsgfj2H+YfLGrL6aMLqqHa1rWbhUGUTmCgjgIwfbwrHlMJ1bruahwDta94
         0y5rZheWJkn2BkdZpX40R2fLjNqjexiA61O9LHdmy5/LFcVR2NB8uWRCOki9ZrNzZwld
         boN8RsPkEgJKkjIrBhhgZ8EvN30mAGvS5P2DeK33HvhpdC6pVbK4xIor5r4Djs+IcaEy
         79LQ/mbvcpFI7kzLaLUUjq7NiYBd6M9qWOEsJUZMPmQ1zZ5EU49xHjCkJJ5doXa7hUVT
         Rq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gwj+s9/MPNGp8MyMcCfWHYTaJSXA15w26uCI/hDpxBM=;
        b=CZtcuQpG5e0I1cqjO7OOIUxFyiQeE9vPTgjJdOVoUd96pkBRsA0dBgiwmBeqB4WkLG
         0ZsJvvlZsF56wLwAggOeNfGo4kusuggzW5ulUinz7ihtmd29FWKgN+RKS626RoG8Y/CS
         PIpKr9jX44NFKGyHebfle5KkhSQrWikvGm3kHChwrxQ4kmeXnURoRLc80IG0J8gF8TUr
         THoDj5hg/G7FJ+vVjm9wHTic0ay+zEHmHZDxO4RHKS2tkkyts8PyPnt/7b8mZLzkUUvJ
         quNB0uDVZnNvIyzAM0a/nJGzO6QgOmLugia1/+rzBw1Y4oVe7gk1K0UDTds53s92j+vY
         5xtA==
X-Gm-Message-State: AOAM533JQTAb2smOcAhqtn4ND0doYEabeLVnK5GtLgH2DKkuXzCE3oR1
        cDA0ZFZbnCUDuCmBnQmj5LVBibF5Fos4JghzTZA+cA==
X-Google-Smtp-Source: ABdhPJxY/dbUau5gJK6sjVl79ezv4EXih8jmN1JP2io5GiR4irv6U1mhos/W8Q5QZ8IeGUfVz8paN0/3nF50HsgvJ44=
X-Received: by 2002:a1c:1b86:: with SMTP id b128mr12990048wmb.22.1617960625778;
 Fri, 09 Apr 2021 02:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210408155334.12919-1-barneygoette@gmail.com>
In-Reply-To: <20210408155334.12919-1-barneygoette@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 9 Apr 2021 11:30:14 +0200
Message-ID: <CAMpxmJVHJt4p7KVwqQHoWu+WbS8pUm8VDuj0NeWzzzwubRwGhg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: gpio-104-dio-48e: Fixed coding style issues (revised)
To:     Barney Goette <barneygoette@gmail.com>
Cc:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 8, 2021 at 5:54 PM Barney Goette <barneygoette@gmail.com> wrote:
>
> Fixed multiple bare uses of 'unsigned' without 'int'.
> Fixed space around "*" operator.
> Fixed function parameter alignment to opening parenthesis.
> Reported by checkpatch.
>
> Signed-off-by: Barney Goette <barneygoette@gmail.com>
> Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---

Changed the commit message to `gpio: 104-dio-48e: Fix coding style
issues` and applied, thanks!

Bartosz
