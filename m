Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B54BC6EA5BE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Apr 2023 10:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjDUIWh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Apr 2023 04:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbjDUIWf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Apr 2023 04:22:35 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13589524B
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 01:22:20 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54fae5e9ec7so15404037b3.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Apr 2023 01:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682065339; x=1684657339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjIeZlv8joDcavXmMJA/iStM74uHyiEJmIh+dhbFJlc=;
        b=e1lxKiomhiq6OgUkdsTDqyimhA+XbZC7icXSpwyRCCujy9ScACnc+JtJ3FRqMrin5Q
         CY3kKtJ4ZfDp0aBXVUk9jk0YpAL2YW+x4ibY8fl0obD8XYbrhVwRheuOVqpTk7wZUC3d
         Q8jrdvcZFb3UXICR19ZTYLZ1jS7FAzgQxV+hz1gELQ6YaR3tuv3qlasFctHU5JI0RiRQ
         WuvubI4zNX+2aQZ9HzRdhnzY0Y1BZBbsBQ68BqkuZe8JOYKG0IV/NkMrafJZYEUvTGT3
         1u7XH8JyNjyrELYMaYX2vZKtaJbPmJzqEieA4UBsl/Fx+bCDeaf/xiOWKqmAjwX8gv2P
         CSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682065339; x=1684657339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JjIeZlv8joDcavXmMJA/iStM74uHyiEJmIh+dhbFJlc=;
        b=MDFgzvPQGH3eHXhbbgtzKcC9Dqq3ZTnFYlQJrGXbHxi8RuDKRffnDNQPHWryeqDP1p
         9Tg8Pq92VcAbe5mESL6ZNvtIp2xRvM01QIC+73707rjs87RAOL590S+LFXvGvwZqSN5u
         IuB+MzObJ8XxYY11vD7PTgfDKkfCH58tQFKii2l2Ou16tRVqkBqRE8dB2KUibxr6CtrM
         jIDmVhByEDWKt6DOLcal2ReSwUaHnzNXQB8NerMtz8LRu6Ewc6uPVo5pwJTS9zcSkW3R
         OBK5gUvK+948oZBb5YZZtdrGk6l7+xHSdJtx21VsMOD4age9B4vFfgt0EAdQD148x37i
         yCiA==
X-Gm-Message-State: AAQBX9fUROUZPQyKjLo6iYcW5sHIN2Z4CM/R7gSSdwRdzd9ibQfSrasC
        vY6FAOeZdN1AajKFjPkTK/WMmFe0lRQj0ocBFRnssA==
X-Google-Smtp-Source: AKy350ZKyNH8DHkFCPe+gfcXAXquLBtjdaQT/IE6wEIIMckQ9JzCDAhZi4XyD1IAPSWM97Zw9juf2VS2SyEvKkSClxE=
X-Received: by 2002:a81:bf49:0:b0:54f:c2ee:54a8 with SMTP id
 s9-20020a81bf49000000b0054fc2ee54a8mr1134764ywk.41.1682065338953; Fri, 21 Apr
 2023 01:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185049.3782842-1-j.neuschaefer@gmx.net>
In-Reply-To: <20230412185049.3782842-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Apr 2023 10:22:07 +0200
Message-ID: <CACRpkdZTYW9ze5VbCZodYUgcsTW4FiZMyxSKBhf3fg3s7DYm3w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: wpcm450: select MFD_SYSCON
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 12, 2023 at 8:50=E2=80=AFPM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> The pinctrl-wpcm450 driver relies on MFD_SYSCON functionality in order
> to find some of its MMIO registers. Select MFD_SYSCON from
> PINCTRL_WPCM450 to ensure that it's enabled.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied!

Yours,
Linus Walleij
