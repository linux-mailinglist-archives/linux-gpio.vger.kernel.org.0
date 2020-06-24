Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E6207562
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 16:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391127AbgFXON4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 10:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388395AbgFXONz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 10:13:55 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2035AC061573
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:13:55 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id p7so1087757qvl.4
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RKz3cdJXe2hoM5GIr6id15i/IZKe76FR3EXbaf6TXp4=;
        b=poono5pq6vhzbjvFd1OHrtxuikcrummcCc9v5GctMBp+PBK+7qT4Ah+iRf7eEmqxAo
         kyKRtRFGZcOpcEaJTzBCgMCNyx9vTN63XF3B5HeEUeah5Pc3bmj6Wwd7vBu4pjMlORv8
         vLc9wcXyue/fRjof9G4UbxEBkDsaG7i4TSQQdhkNN4fZGDN9qtV79HsbGjk6pMHB9aHm
         6YkdDuvB8qEN3smb8RHmwmyui58Azd/wuGnjgJi79zqlioBBBsKjTvE9CydYqpN1RC11
         ojjjRKfB4yh6PYC/udhxXDkilYPjZtPLTP4rxJAMakk+6xW7qzCvBTg3ZkWjX22yIj5t
         3+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RKz3cdJXe2hoM5GIr6id15i/IZKe76FR3EXbaf6TXp4=;
        b=mhkBEeB+SC9igjz/dvpvsdnI3CCu+EV/poINyQkPThzLFG2L+cq3NfMw7yWqffN/0R
         1Te5SrgUIAh+G0tgZ5SC48AiQgackCR+7XJ8o9acKTMFIURpLXOBigSqwsw5c9wXnuYK
         TCMzEG418PjqLwvMhb2HUM1zCufsE/F6syDXg8ua9Gi03a5flUOgjM2wcCUp7wA9K/R+
         bgggnqB+PPM5jLtGOLJK8sN6bsCbKOtE1i9B7IPl79REQ2PbFL+4ZWPpdZm1DVlQKJbp
         PvCno8YIvfzPNDk0S7ihYaKC+/odvjVK9F9cE3nmFLlgpbAENOKOIJGCrEqI0qQLBAuO
         RKKQ==
X-Gm-Message-State: AOAM532qSKSKWpcDSINqGdzsE4fgA+S/ByccmCYVtXixnLt70Nvfy03m
        TR86Lkh/Vat4mM3qbNR//62g31Zs1dnV2rUGuT40uA==
X-Google-Smtp-Source: ABdhPJzjZVkc+0RLZRhtJ29bxW4+QyWZnwLuZLqaiYpbA6r0BirJY7A4w8Ts5NlMx7xoDMQDxDjJkTSV0PixXgvXrUk=
X-Received: by 2002:ad4:580e:: with SMTP id dd14mr14998492qvb.96.1593008034313;
 Wed, 24 Jun 2020 07:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200623040107.22270-1-warthog618@gmail.com> <20200623040107.22270-13-warthog618@gmail.com>
In-Reply-To: <20200623040107.22270-13-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 16:13:43 +0200
Message-ID: <CAMpxmJUu2g7qORShk8C2WpGyh2btcyZsRqrQwP1JwKAhUW+CCA@mail.gmail.com>
Subject: Re: [PATCH 12/22] gpio: uapi: define GPIO_MAX_NAME_SIZE for array sizes
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 23 cze 2020 o 06:02 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Replace constant array sizes with a macro constant to clarify the source
> of array sizes, provide a place to document any constraints on the size,
> and to simplify array sizing in userspace if constructing structs
> from their composite fields.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
