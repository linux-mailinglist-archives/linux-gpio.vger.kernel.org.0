Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9233516EC2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 13:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbiEBLWb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 07:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243190AbiEBLWa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 07:22:30 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A069DF63
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 04:19:01 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id p4so16313202edx.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HkHb9zDzaQCh7icuTIrBW1dLzBtZj3gG9lMpTgSrSE4=;
        b=yqitAepL/r7UgctBxOUq2kCCbQqEQvIwdOiY8s3pSmTs6ORlW41oYP2FWA7dfxvzb+
         jL/viL3ecqJ26Fuc6oLYfD8+WhGMwM/ABX2edufGwRlrUfG2cQUWxUrsRwzcvzzVXcDk
         sIw9Sv9yjknXSHSnPYnAgnzoI6OuKqGCCkb0hzYI7P+VMZH5o0GvJcJ0lPOhJx6Hz3GA
         Aw+KSSOe917yRmBHbzDjfhYkFueOBCZhqYxLZwvtnUu0V05e2ZxqULfphKrbYjChXjU3
         W3NOqmCKvb/iGzBOOBfag2KPQ/9p95eMAogvsIJhL5WfaAmou9TRL5ZfaCaZowDMvODr
         tHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HkHb9zDzaQCh7icuTIrBW1dLzBtZj3gG9lMpTgSrSE4=;
        b=qd5uXEdIIWfGMyRp4eCpgYjdm3e1Rtd+IjADGjIwYIHciSHaANigjQQt7GhIcGQuPM
         TdtoQ3IrolJe1FepPlhXvzRxELbK0yHxZliJESh9CBZ0T6TwL6nH83l2maokjuAz0FLu
         U8NoW6MpTnrZtRtrat4CAheO+HnEljmdjbM5UqPJ7SS2dqdJ6Ig6Nw7Zv8xmMp6BHmqe
         4EVPyUMLHTnLCHioFztvC5lO013C+ek+1A7ColBtdzl4qiUu5XG99UwXrd5r2tAQHILY
         X+jcOjiwS5hbmaSqagbZsBtYSP2NQ/4rSn7l1u+nxfgraWkQH2m6D74GfYMrg/bt6fJv
         CZcQ==
X-Gm-Message-State: AOAM533nVR7fI7vVcTDCu1mX1DyMv7+M+P/GenunIM3FDF7+SmO/T4ii
        e5GjU102R7+2e2O7vw4BtP98R8v/6sou/n8FPJ/jkQ==
X-Google-Smtp-Source: ABdhPJwBrdywMt5x3Ze2ZxcFXXgrCbDZxAOQm3OTuht5rGWTVnQ9/gIhZUySEPXpta7fcDmFxIYbg84nCTDMxM6xgCk=
X-Received: by 2002:aa7:c49a:0:b0:425:d526:98ad with SMTP id
 m26-20020aa7c49a000000b00425d52698admr12673123edq.352.1651490339736; Mon, 02
 May 2022 04:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220427144620.9105-1-pmalgujar@marvell.com> <20220427144620.9105-2-pmalgujar@marvell.com>
In-Reply-To: <20220427144620.9105-2-pmalgujar@marvell.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 2 May 2022 13:18:49 +0200
Message-ID: <CAMRc=Mf91eMF7D6CRtA8-HQ7pdtP343WUGhLG4qti_9zJF4ELQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] gpio: thunderx: avoid potential deadlock
To:     Piyush Malgujar <pmalgujar@marvell.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Richter <rric@kernel.org>, cchavva@marvell.com,
        wsadowski@marvell.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 27, 2022 at 4:46 PM Piyush Malgujar <pmalgujar@marvell.com> wrote:
>
> Using irqsave/irqrestore locking variants to avoid any deadlock.
>

I see you'll be resending this anyway so would you mind providing an
example of a deadlock that is possible with no-irqsave variants?
Thanks.

Bart

> Signed-off-by: Piyush Malgujar <pmalgujar@marvell.com>
> ---
