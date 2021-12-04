Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10722468874
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Dec 2021 00:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhLEACj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Dec 2021 19:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237309AbhLEABC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Dec 2021 19:01:02 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41840C061751
        for <linux-gpio@vger.kernel.org>; Sat,  4 Dec 2021 15:57:36 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id n104-20020a9d2071000000b005799790cf0bso8589942ota.5
        for <linux-gpio@vger.kernel.org>; Sat, 04 Dec 2021 15:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2Are/pOeo/9e+L+foVN7ZV/ID2TszqSQl2DcVZYr+s=;
        b=AQMbi/3cy1tKxN6gXp+JvWfHQTZgZn9dnnzs0J9GqbJYtAEbnB+XEj86F77+G/yE0A
         OGYY4N3MBdWan4gpG/UY4H/oWILmTCIPKchkgCyWCQhbmKS5XLuP/sd0+xZ8ZFJjKSUB
         /f+5kLqhlOAiIed0vF27tTt03HvKYBYY39Wbk9UqmyFmNHb15aUrv5jkecnjQvFCcfM1
         ek5MbLK41cw6AzXRGJa/qA7WxnRPQK8ZW4x95XtpTV0lNIvZITC4uKCupmcEYAvQ1a2N
         F46d32eDdS41pG86kXhe+Pe2EqdIUc/j6ZYcl3/qxXrUfD4HrUGK1usTGm/1/yxbqq5/
         FAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2Are/pOeo/9e+L+foVN7ZV/ID2TszqSQl2DcVZYr+s=;
        b=O/bAAgrXFTiXRGP38d8Ipvj9z4ANBAIBZ9ImxMJkk1neEeiMEFIKoYb6tx/pA6tSYK
         LqafNKGuoR4/7tpR9XLr43vI3cjNQ+aHj2DjImEDOIt90R3lgWh8k1qj4srI6EsnclDA
         RbBjZRnG/IxMeh8rOpYhhHdopEqaW1Jty7PPIKyvDTL/b5bJBOHQBuUkbfv9iNlxVi0M
         LqVk++XU08Tk64EAbEot6q2IdhPJinZg/kSUHaceZwDsyRNsxt07iZq6Z7PKVRjTRqPl
         ysAyyAGoHjKAM0Xqx2k3DctubxONnrpmUB8jI2DmXz7maI9K6+7kqrBuY/TO86DHg1QE
         Sbsw==
X-Gm-Message-State: AOAM530qeMhj0WsS7UoMMp5uhiwobcCIeAZNAaSS/YtHMOvbDaDFmqVy
        ENhyJhHEfWOL7TsZDpy5k+GSZGuDGPz403J0WP8zug==
X-Google-Smtp-Source: ABdhPJwTCZBbVyT5ZyFmeQQXcWw2Tcmz1VahQQn526w+qv7ID1nUKQ0NoVTLw1PQcnohuV19A3c7RmJyeu2D1TQ5JZ4=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr22103278otl.237.1638662255645;
 Sat, 04 Dec 2021 15:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20211129153330.37719-1-nbd@nbd.name> <20211129153330.37719-13-nbd@nbd.name>
 <CACRpkdacgoT-K4qZoBpMx8RiPcvOf=YmrTP36LKyizcQk+VyUQ@mail.gmail.com> <c42f4ea0-2879-01cf-1db8-ed39844959fc@nbd.name>
In-Reply-To: <c42f4ea0-2879-01cf-1db8-ed39844959fc@nbd.name>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 5 Dec 2021 00:57:24 +0100
Message-ID: <CACRpkdbekZsKvoMmCtDV2Ui=ZyZA3ymZJL459Y0WgD=-mNyd=w@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] gpio: Add support for Airoha EN7523 GPIO controller
To:     Felix Fietkau <nbd@nbd.name>
Cc:     linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, john@phrozen.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 2, 2021 at 6:59 PM Felix Fietkau <nbd@nbd.name> wrote:

> I just looked at the datasheet and the driver code again, and I think
> EN7523 is too strange for proper generic GPIO support.

Yup I see that John explained it to me in the past, no problem.
Let's do it like this then, but just drop select GPIO_GENERIC
from KConfig since it's not used.

With that oneliner change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
