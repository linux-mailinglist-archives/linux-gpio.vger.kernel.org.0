Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04F1E54F2F2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 10:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381026AbiFQI3R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 04:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381019AbiFQI3R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 04:29:17 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCBA5689AA
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jun 2022 01:29:15 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-31780ad7535so9497147b3.8
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jun 2022 01:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NvDM6ePOB9255+QdACBJ4Cuqc1YOqX9BqNlnS6cgqOM=;
        b=drT2VwI/KZewVo8KT9/kXdTMbfdvv+NSGSELVGv4eiapATLknTm+j85k43io+ibKTF
         JEmJIcVb/sQlJiPCNzOJ9mVT9mlCp60slBUKsP5Efp1s0GHuqXq2V+9Jsr75NZuEtU68
         Wp23cWN398Y+eUq5UTdvu1FVjoeGZNF1qd5hnW/zhP+AI4HqG4wMED1j3CA5hTRdwfqY
         ozrKK4bKivojAC7rBcvH20NaRrHiljUkGUiHEBspGkYSbRHfJYDgQ70/aVXO4uE/OrMF
         2OY5lkXETqjvhi3wMs208J7cpdqp3mJfUSJ8Ga6/5PIltL3Xnhx4KI6xxpmV2Odk6W4c
         qubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NvDM6ePOB9255+QdACBJ4Cuqc1YOqX9BqNlnS6cgqOM=;
        b=E84UlSr5ITZMrYsmNiY7dOzTNzqC3nI1BuTUObJtVwPkGI8IyNwOn9OCpTWU93JmS/
         r8zeJXaxIcHhrhpt6OaZs364QAIZYV1+ZjX6Kls1j321zCoUhfiZFpcChkv4fk0Riruu
         iF8MhR2pukCpElTZof2UoHh1YWp/Ss40KgskTjV5uT4s4U+cutcfVqoN9WHrLNkrq9//
         sZKLx6RYFjkK6lOGEvm/wfd8OmmmcWY0PyefaHfqsXPW9jhCANLq9Ry1znjPuXYzO3ct
         7evQRdFc4lAKGBt0YYZXw5ydv1SeDV+/xk5SLbxqHfCsAMc359SSqizd61Qi8eBic+ti
         boLw==
X-Gm-Message-State: AJIora/tdb5CEm3CIu/r142ZcnkcPB7vLoo6mTl0zLJPuf+FMEGUs6r1
        GtSBb2YEdvlnADa30Pw0BeAKjbnUiCvXRlWuXStgHw==
X-Google-Smtp-Source: AGRyM1sXLogUpwJPjF1dzAojDC/KQZrNZsdk08Hdr7n8V4gMaf4+MazYkz+tgTepMChNzJTrpNtYtPlHQWaBnkTF1Ac=
X-Received: by 2002:a0d:e8c8:0:b0:317:6df2:304e with SMTP id
 r191-20020a0de8c8000000b003176df2304emr7783879ywe.118.1655454555028; Fri, 17
 Jun 2022 01:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220616013747.126051-1-frank@zago.net> <20220616013747.126051-3-frank@zago.net>
In-Reply-To: <20220616013747.126051-3-frank@zago.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jun 2022 10:29:03 +0200
Message-ID: <CACRpkdZ-X_3vqcyRUH5-KM=mkGF3C87fMMPGxVWmVyYHtCCS0g@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] gpio: ch341: add GPIO MFD cell driver for the CH341
To:     frank zago <frank@zago.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 16, 2022 at 3:38 AM frank zago <frank@zago.net> wrote:

> The GPIO interface offers 16 GPIOs. 6 are read/write, and 10 are
> read-only.
>
> Signed-off-by: frank zago <frank@zago.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please preserve my ACK on subsequent postings, USB changes does
not concern me, I trust Johan to review those for you.

Yours,
Linus Walleij
