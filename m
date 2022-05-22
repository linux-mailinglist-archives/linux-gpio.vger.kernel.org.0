Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45299530600
	for <lists+linux-gpio@lfdr.de>; Sun, 22 May 2022 22:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240716AbiEVUzU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 May 2022 16:55:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbiEVUzS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 May 2022 16:55:18 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3522FE40
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 13:55:17 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-2fee010f509so129151237b3.11
        for <linux-gpio@vger.kernel.org>; Sun, 22 May 2022 13:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2FbNMMnGaE3qBG0BhDyGq8TVivgQc5shaNcGmHRs6aE=;
        b=PnGMxvwE299+lakx5W0rOShAtVYZrsgmKHobT8yF5RPIDcMqFiEgIbgKnJQY+oSy2T
         9Bx1oaraocC5GqGxmiY3MuOOjOjWe5p00KcoD134/bS3DhG5FOnLyqLmpuJOU9blsaen
         /50kH/3IpVCOicSG40U5eOB4PUtBdYHB1iK4EXmCQGM4YU/R5aEUJmlyZths18HVEO4B
         IIAEpZEd8Z9sX8xdu4YWSnS9s5lI8ciw9dWa7PAnRWpErm7fZyAhV2LEMKy8Zhn46OH4
         v7O96+OmHf9A1JZGsqMh2Cjo+epb82D38V+Ru4CMIz9rRR8LdHFzKaguqWcNRtd2gNVG
         3cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2FbNMMnGaE3qBG0BhDyGq8TVivgQc5shaNcGmHRs6aE=;
        b=YR3jhmm4wEw/OHPH1JAf4PaXIoVflx+xVt4o7WRHWnkp9LUCdme71y57VzCP2pU+a5
         O9scQa79pqTEkTpId7NYoR5DGVqLHv/abwEYDi9B2gWGWRWkhh+5DCUPPsYZq4UTC+aB
         +c1uzraCn7ebpJOFb7lUXvU3HRfJndaoBnoc7w2XIDoZ0d63Du56Sv78Hh0Nl2vDuw2/
         8wl3YeObJUOKtBlr9C51IifVyxkvo6pvBiAnByM8wqMqdeOvHyfnxuIywf6fKVx312Fg
         r9sCIJ2A941epsD4XFbwICGrYBKUptxLsuSA9GMsh+sKPPdMJeTsK+QJuuTSDWMU55oN
         E2Hw==
X-Gm-Message-State: AOAM531V0HEduqIOTTc84NgcZ/QpPUIHaA4K4Pbvuy49tCqCvoYIenI0
        r+iWCLyk9TbzxK1XB6szRFc98eyVaWFppUPD4WtQXw==
X-Google-Smtp-Source: ABdhPJwK7JXpO0ml5qqwX26Ei/TQQiEVacdm5O2SbOtLxc9ZVu3WqzxOtQFi3zAsp7bWtwr/l4JVOQkMFVzib2FR8nw=
X-Received: by 2002:a0d:f743:0:b0:2fe:e466:a482 with SMTP id
 h64-20020a0df743000000b002fee466a482mr21039060ywf.151.1653252916370; Sun, 22
 May 2022 13:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <Yoe27fT4S5Z3Xvka@smile.fi.intel.com>
In-Reply-To: <Yoe27fT4S5Z3Xvka@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 22 May 2022 22:55:05 +0200
Message-ID: <CACRpkdYGXAqjGhC9oHbsAunqv7wLjJnukHg19Fd0gdcwkNW1tA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.19-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 20, 2022 at 5:42 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Last minute fixes to avoid a warning message to fix IRQ chips.
> Please pull for v5.19-rc1.

Pulled in as clearly useful to have in v5.19-rc1!

Yours,
Linus Walleij
