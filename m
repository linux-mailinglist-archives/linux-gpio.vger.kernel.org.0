Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5888D34A7CD
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 14:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhCZNHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 09:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbhCZNG3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 09:06:29 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5181AC0613B1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 06:06:28 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id e14so8252761ejz.11
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kQ7vEmJBNdlZq7xKa6jjdWDxlAQREYJD8UvoKQSdeoU=;
        b=ovpYc2xb2p16qsKFkXT18YW5O5nnfesYoKYn1vcfgEcWTJgAFqLTQRmLIj8AwIiFpZ
         KNhy5LngNanfz+Bm/W3KB5FDKyDTM9ALvk69ATKSSqdRNZ81HUUMUqwIkX4iW1cTSIlW
         NjQNk4StuD2BYU2x74BcyBcwpGrRn2LnvH6yqqeKj9g9NhpmS4ZnoLF5IJjsCM5VznWQ
         eWXGok0eFvrfAJv3FABKfmcIi3Il4DveB4zvmvBc5p/V37vAP24dEk2lMIJO4pWbv054
         K41JUFdnweq2d5VclIzLk88dDdKRxVBYGYvM2S+r21X6O6p5SWHTjtyqA63+xVKR4nYl
         C0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kQ7vEmJBNdlZq7xKa6jjdWDxlAQREYJD8UvoKQSdeoU=;
        b=PQVUvRuFTycJM81n0CSEZqVLesjQaj+zcug5Dgjj/qR5cOTN6yLdBp6lEsqX5tMOjt
         jnC/GD6OzU0nZldVO8XmFd8ksv2tq8OiccYLmX5g9BhXxhxZrISRyiV9nXMkprlNt/5C
         KZ3kSP866UgvC4/DQoCKTZoUbgoM5E8VpEBIrNYPlRHGjqtUt9nUmCHcAOScad42v89t
         F+trm0tmxcKGmlwOgT0OA0mXWULNBt4Yg/wus5d72QULEP4EALxJU5baDp7tUQs84Y4r
         uoqw1b9GQ2gZ6+MaZJ7ByBcBMf2yriL/ee65KyhBWoB/sixKm93bhj1CG8PNsLC/OXG0
         Y+Eg==
X-Gm-Message-State: AOAM532mcCNLUhJIUiIww5q91p+Ms+qYOot1JqdTimSaJgiwDfFgcatX
        fyt0iRrhUB5CMcqRuWkL0EgM5lE1sDHn3/+EfO0nOQ==
X-Google-Smtp-Source: ABdhPJz0Ud0iyk0oPlbQW1nzA0UzRtKitl0NL4oIYBQIPnoAXtVflJthJLIiAZ3OEE9DOevs/R90VwtX7IhTl5bNFSE=
X-Received: by 2002:a17:907:76c7:: with SMTP id kf7mr15095901ejc.470.1616763986952;
 Fri, 26 Mar 2021 06:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221905.19529-1-rdunlap@infradead.org>
In-Reply-To: <20210323221905.19529-1-rdunlap@infradead.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 14:06:16 +0100
Message-ID: <CAMpxmJVL8zKHvvsTwQQTrSpEjxf4Zat5cevzsx580bPK1aWsug@mail.gmail.com>
Subject: Re: [PATCH] linux/gpio/driver.h: some edits for clarity
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 11:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix a few typos and some punctuation.
> Also, change CONFIG_OF to CONFIG_OF_GPIO in one comment.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> ---

Applied with a slightly improved commit message.

Bartosz
