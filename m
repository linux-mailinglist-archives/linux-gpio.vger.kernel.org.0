Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5D93730F7F
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jun 2023 08:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244113AbjFOGjL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jun 2023 02:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjFOGi2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jun 2023 02:38:28 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE712703
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 23:37:45 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-56ce6bbe274so15962327b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jun 2023 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686811064; x=1689403064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfSAP75c8BRbiAnbossLsBuxKYsjVxL/JddFCFxX1b0=;
        b=vvz0l+KtCZ1D2llkS5sfMQ5BvaO/Fa66wezJqcxDM+y91D5grzVsHSgn/usMzXLB5D
         GPlnHVZwawaF54MEJSP3m72H7BZrgijB7VH+5/aQ0++Pkb7AHuRkPgR8uzZ9t8X0QsAT
         DvMi3LfWLir5yZs9rbh9N5Oj/WW2aI8/7ouq5Ic621f3gCrqfpgrGX6rM+CHqVhaIQa3
         EENGa1b+3XK8OC46YgUSJLNN5MholYFhgn2DXJ2aEDE4jnOCdfxBdkT1pPQszCzj3lPb
         ufRf4cMQ1VlXkqydpmw0qJVQhF+4MYhPMyJWTY0CkbDAte7iABT/IinvU50gzbtK54d8
         Icrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686811064; x=1689403064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfSAP75c8BRbiAnbossLsBuxKYsjVxL/JddFCFxX1b0=;
        b=kpYGfkCKqQWMZDxvjVhRvquHvIRXBDQbwnUFK26NNsni5Idk2Z9wwNLL47IdOpoM2R
         zdMDTmwaPtkwAyU/qhDm35TiHOWC2I0Xqc/KkA7Ge6S3eH53CGtdXNei+ySMkRBfo5aL
         ynqPwp94G9b6BGRizUln2d1BHrcjmlL7W1jr/p/XXbBLkGrqqkoBtWPy2ZvBja/lgqED
         Z+LZYcLj1pg6EcKqDWz1FEmBGcVYudie1AztQ9NpF+8cY5zEx3RpnQbk8/31KgGp8fBW
         vrJWIj28bJ+ELQWtG0rr8FnZaZZpspAgiHmEqnnQoCtSNEgBmhyqhmVQmweMOY16lYge
         KRmQ==
X-Gm-Message-State: AC+VfDwzCMzpKmDl4CvMHMYrU+5fr22hWkLvIedeFCq5Xhzhhnbn4EGB
        9m4ig+h+MLDpPIYbNhrQ3kRGv0TWqkNHib1GS0P9yw==
X-Google-Smtp-Source: ACHHUZ6ow3TEtT7YEh1X69yMhzmk1YKltyWl8f91ptCScpkvtEI3tKD6Xk89xzQD/xdAy4ZRSH9XwHebthiUbado1Sc=
X-Received: by 2002:a25:ad61:0:b0:bc5:4f79:a7c5 with SMTP id
 l33-20020a25ad61000000b00bc54f79a7c5mr3777336ybe.26.1686811064370; Wed, 14
 Jun 2023 23:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230614231446.3687-1-andriy.shevchenko@linux.intel.com> <20230614231446.3687-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230614231446.3687-4-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Jun 2023 08:37:33 +0200
Message-ID: <CACRpkdbv=9YX145=oH88bLS4d=J1xYWc_NGEN=KW0duJ38tUVg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] gpio: aggregator: Set up a parser of delay line parameters
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 15, 2023 at 1:14=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The aggregator mode can also handle properties of the platform,
> that do not belong to the GPIO controller itself. One of such
> a property is a signal delay line. Set up a parser to support it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I guess this is one of those instances where we actually need some OF-speci=
fic
code for parsing the special case, and other HW descriptions will need
other special code. It's fine for non-trivial stuff I think.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
