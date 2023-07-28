Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DDD7676C3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jul 2023 22:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjG1UJt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jul 2023 16:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjG1UJs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jul 2023 16:09:48 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33D2423B
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 13:09:47 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d0b597e7ac1so2357854276.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jul 2023 13:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690574987; x=1691179787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ypcj8O+X/OFMkfjHhQc10V2pJgPwGGRi5rjXK1oaPh0=;
        b=Pfe4VOX7iBBXY6jB9a6N1NKHb4uagxUEc9y5lUZsPnrNELa6gMNcjRg4HE4LYXguWP
         e3/JlgUIwLgHiEbPi28bOwxObbDMT56OLz70lC27cuZxOuTbWuwySavSK2iM5qkm4VB2
         86NDOm2EL5xIpc4geShiUONBBzvNKKO4Q5CpdF18eGzOWgR37h+Ehn+VJEDgnvI2bdN+
         qRALnj5jXfjqt4JBpnmss/BDc8xRV0O8OleBLLUKvd/cGCtVXvr2TqS2vsKAEWi55yAI
         A4RrYVY798TBtM7Qb8GffiW5Os2VYAGdbFnQEGcB+Yt7+XQtRCDY0XN1k7yatuQ8o31r
         CAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690574987; x=1691179787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ypcj8O+X/OFMkfjHhQc10V2pJgPwGGRi5rjXK1oaPh0=;
        b=IbWsUskd9cGS+AXyA9tMqW+FbSLvQSJJ5lOn34m3KB03s24mNlhxVdHB7mSqR/MRDz
         0bbhUGSf9uzroppIcW11EUYexe7zwjKND1BHnMzyoZjn7RlfbPv1r73peVxJWleIw/GQ
         7z+kNl9kP2g/wOdU3WzreOu8AoOB1Khoyaor7HnkaLh9IMVtMQozeYoAXC4p5Xk2bN6r
         URFJrz7uRkx7v3pkP6nNAWuPe4dc9ZAR0cedEOw7fYiuGYNbyzuDv8fcuSynVOgmjxjw
         ncBbLi5cX0S1Yci1C1YmJpKFdf1u9BNfHSX/DGAonKDS1XlG5Lwv2lVKjlEXJTcRytUq
         1UQg==
X-Gm-Message-State: ABy/qLYBtCVHttQgRv9C3PYyWfvKWVxf+JGn3tTQjRtD1QS2W3d/bUdd
        EwvgOZWLdD/1CJ/JAiCVOfJ7zW8sZOxJcBNCb6Z33sPix9DLsEWW
X-Google-Smtp-Source: APBJJlGhROr0BN5fEQehQ/pF+xHP1sCS8d9UM3c8rFBJiNy8IcTQoSw5OWpWC1a96/UHYkcxqOcdKACc0fCTWfAGako=
X-Received: by 2002:a05:6902:545:b0:d06:f99e:6345 with SMTP id
 z5-20020a056902054500b00d06f99e6345mr2624723ybs.22.1690574986940; Fri, 28 Jul
 2023 13:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230719202253.13469-1-s.shtylyov@omp.ru>
In-Reply-To: <20230719202253.13469-1-s.shtylyov@omp.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Jul 2023 22:09:35 +0200
Message-ID: <CACRpkdaj+8aZJqPJhiLu9zkB69iidixmRuSzvzenwDmknJg_9w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Handle errors returned by radix_tree_insert() within drivers/pinctrl/
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-gpio@vger.kernel.org, lvc-patches@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2023 at 10:23=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru=
> wrote:

> The code in drivers/pinctrl/ doesn't check the results of radix_tree_inse=
rt()
> calls, although it could propagate the errors from the callers upstream.
> (Linus Walleij said he has copied the radix tree code from kernel/irq/,
> where the functions calling radix_tree_insert() are *void* themselves.)

The fix is spot on.
Patches applied!

Yours,
Linus Walleij
