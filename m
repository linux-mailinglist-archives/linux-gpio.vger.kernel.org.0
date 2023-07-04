Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428AA746CEC
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jul 2023 11:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbjGDJL4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jul 2023 05:11:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbjGDJLz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jul 2023 05:11:55 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A14FEA
        for <linux-gpio@vger.kernel.org>; Tue,  4 Jul 2023 02:11:53 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-579dfae6855so36667277b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Jul 2023 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688461912; x=1691053912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r37X64MkxE2953+nhgmVZSnQSf+m5XeSlLa0brc2dAY=;
        b=Hx/g88ElX/Kct0Oy36/KaEGVCIotyUj5L99gcUNRYKqofPwIM/ZB3QyqfIedV8lmTN
         9VIMiYDxyl3wItImuVqVYe50uvNifb3GFAhHQVxLRzhhCuF4piMZcOf+Cl4yNPtbgvH5
         fd14FkfdxvtboKKfxvb847yLg7XVjEgDxQkXtUKEDILN6C0h6m/IE3+YW5Ay2RNOSGPS
         W88L0EcYBrbztf6U4cnYynpha8DrFW9NAJ3IwOXyNCSwu7evkKx7p4cr4ou88xeZ0+OD
         pme3S+xJ8B7l7ZXZG4j5hWZaVF4Go1xTiKv456+GGbefInmn5U1gVgcXBNIJrYMLUqOq
         ZDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688461912; x=1691053912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r37X64MkxE2953+nhgmVZSnQSf+m5XeSlLa0brc2dAY=;
        b=iJlnGh13yLslu5OZtKYHZfqDPIZ7jqjnAytqQQLWA0+bNmwpV+qwmjosm6201C/wzW
         rIqdmobjERmDjM3Iukb1idj6orXMItjmgewE7uD4TeBKxG3Gc5qcJGgEm4+oPWIBLicu
         D7hCI3/VlNChArJ2zjcCEjn7YxNRMyrtdJciHVIFGCKwQHvwJTqG1B+R0sPpIi9T592I
         xQrfZ7C48vJ8/HngbjtV+4lb6mTbywel8Ig/rtX9VO1hmJtowZMLib9DHaW92GyMualH
         F6hnbpjcKayxe0GTkrBCFprs/0dStzK0kGFv7rQdqOkDJ9Fwy6bquvMiMVMBBLXlCBtL
         5keg==
X-Gm-Message-State: ABy/qLYa+h4QxH9iDRno6sPldhlXEp8bmrF4Ro4MPYAqwvWCouc4x6ls
        k1VBHoLDkMi6LPM99uu8tPvoBL5blREyClVlPqpLPw==
X-Google-Smtp-Source: APBJJlHcnv/nKMQJPCeCeIg0yBEb03QMd6LqU0leNGr8Zuxowp+WgPrAEmz1kAOu4naw9cbKn17JcmpvnO2n2/NJGxU=
X-Received: by 2002:a25:fc15:0:b0:ba8:2e05:3e9c with SMTP id
 v21-20020a25fc15000000b00ba82e053e9cmr11654496ybd.24.1688461912722; Tue, 04
 Jul 2023 02:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230703142308.5772-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230703142308.5772-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jul 2023 11:11:41 +0200
Message-ID: <CACRpkdat-z3K4GxGXYMYtv1NAWbGY2K3DvutY+y1V5Bkyy7=UA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpiolib: Avoid modifying GPIO chip fwnode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
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

On Mon, Jul 3, 2023 at 4:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Ideally the GPIO chip data structure has to be constant.
> In real life it's not true, but we can make it closer to
> that. Hence the series.

The series looks completely reasonable to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
