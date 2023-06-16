Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4137331D8
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jun 2023 15:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344280AbjFPNGA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Jun 2023 09:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345253AbjFPNF6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Jun 2023 09:05:58 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3CA358E
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:05:57 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bc4f89f0f2fso580345276.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Jun 2023 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686920756; x=1689512756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCWwAxyqGz0dxVXdN4x1E9m1cKBoRvQl+WOQKo4Ngkc=;
        b=kJOkHT/9WI9ZhjEVBC5ffy4RKQ2e56uvILwN0NNAL8OZFh8vlcv4hO76ZKqOXUg1VD
         6626p7GXkfPAzGwIZ3XO/YyqAEys06yHkP6Fdif29Rrp0rSpY/l8aKiQl/To0Qt4tiHn
         KTRGxwqML7Nt6GSe3sf+lJvlkvpKjPLBHqbTfccv8nFH2cQF8soLCzeqAhFMwgXSWHhp
         h5lmRSCjEq1S3VDLAJtnvPOPC3O1k0V444yzFXjw10S4CGcAWN8O62rSmscbsUkF9rC0
         r8FUpjUMePa4N1z669hlarQLCGcmACZARuQ0xqKxZWkEZ9clovV3Sk8LXT/wcwyJIqbZ
         YKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686920756; x=1689512756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCWwAxyqGz0dxVXdN4x1E9m1cKBoRvQl+WOQKo4Ngkc=;
        b=Wp9TDtYK347yZAzj13b0rZoC1kGU1eylaq+uvU4Yi02xqHH2N3JJlyet9pSnZTGjTt
         ARAoskIRvoRHi3u2SnLeAD32ObveqDdnkcm/QuUk8QIWE+CYUvEQ47cLXPK6kdS1F6LG
         rPCB81hohm9hhyceZGdcnaUmaPYl2Lxu5dowZK7OViW62YW5qw6JmWCWphnfzVr6raek
         DRUoSXuVKHohpG+9Q/wSbDm8eXzebKswqwxaRxw5UsdQYetznnkik10rh5XtkoWcmfzL
         +cN4PaCIM1ctfPvmOZamZQTsvgZNw9nbnyng3YE63MO+9+dPQ98tD+R9m+u2aQh1emrP
         jp/g==
X-Gm-Message-State: AC+VfDwENFY9IQZ5J5nWJ7IKuhWmywh5pP8ZS4E2wQsViqMmfiPtzLwC
        D7G2ob4kyLhxD0Dsq6pbtlrB1xjjxr6727qzBET+bA==
X-Google-Smtp-Source: ACHHUZ5pOMIU5uT5Cgpg9V3UqjrChj1R0w733TwLwO709KQ5qp4fyYn+zFzkp1pMtnlcbM9Oht/0CMiGdpBdydbloLw=
X-Received: by 2002:a25:2fce:0:b0:bc8:cd2c:2fc with SMTP id
 v197-20020a252fce000000b00bc8cd2c02fcmr1786081ybv.24.1686920756233; Fri, 16
 Jun 2023 06:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230615164158.25406-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230615164158.25406-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Jun 2023 15:05:45 +0200
Message-ID: <CACRpkdbfeZggGckLzzGLycD8PxRejOX1Pk+qWZT0AKRSsqpMQg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: spear: Remove unused of_gpio.h inclusion
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org
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

On Thu, Jun 15, 2023 at 6:42=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is not and shouldn't be used in the drivers. Remove it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
