Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32EC37D74E3
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Oct 2023 21:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjJYTzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Oct 2023 15:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjJYTzb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Oct 2023 15:55:31 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223ED12A
        for <linux-gpio@vger.kernel.org>; Wed, 25 Oct 2023 12:55:27 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3b40d5ea323so62577b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 25 Oct 2023 12:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698263726; x=1698868526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVfs2vQPn6075GttomjikJbq1FdZzRDZ6l0gLyS0UXY=;
        b=L3Fa/njmA3EkAUK3JY7DH7uHw2sSPrYxfEyF/V65uSeMOKZkWRZjv3UKRLz5chXKxb
         dmnBtR280sROIOiQt4947zEw+k52NUU7MKrRymeF+gdoTZf7GV85OcKgsRcshr+D6BTU
         KDkLjYzzazwjF0bBC7ofq5h37rho4lme7SuyF9b34RthaGs3QcqIfiE6xxZ2XTAZzoL6
         VN8jEBXAdrJhz5Lc+WlO8gRAVimyQEwC01vo685MZ0ZGin7nkjTEHEUkRQ+722u2feQK
         7gJSuoG9WHIyUdcC+HJSgqk0KC/KlqoPfj1aPjvOxwVd4/Pw0hFL5XDDI/I/lsePHJI0
         tnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698263726; x=1698868526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVfs2vQPn6075GttomjikJbq1FdZzRDZ6l0gLyS0UXY=;
        b=VugE2sg/F+3Bn2EjWLHWUIOQA2tHG0Ft28WISy8rkrQ2gA8AqWVCMteWmGPFbvv5Mz
         ZQiAqdIY2Cw0QA4DQ5p20g1rog3qcIc9i2GUUXWlB0/uFIerVFZMUm0SNo6IHav2SamO
         r4OM5pllr+ZubJsHGE0FsAhSx1SdnkENoV5bjMKaZMS9LrlBjSKfHU1F6osaCBH3WuHZ
         qv+qr0/nfZ135u1TLN/6kasB9g5jxrJAjOXLFY/R3IuUUEGIYRp1IQEvw90gVy4uImEE
         BYkISCllPK5EKYDS7r7r8tMmQZVRXm9iC6TvaoQC3KWg0COmtSAJztaHqWS7bZFOMMc7
         NlrQ==
X-Gm-Message-State: AOJu0Yx1ocOAh8e2wSYG79RMx0tFKrBZ3lNrHJkBYakrcSdla2VuOkl3
        1zjLgmrRKQghfswBvXHu+rkzEJdOakxXtzfXwhg6Sg==
X-Google-Smtp-Source: AGHT+IE5aFGh12IgD6465G/P90VCx3AJDx5zrTXXimxuEuhvkas9UEy1EiU1Xj52N1div6ehkYg4X+nOL8OdN0SShD8=
X-Received: by 2002:a05:6808:1586:b0:3ae:5c48:6f41 with SMTP id
 t6-20020a056808158600b003ae5c486f41mr20419217oiw.28.1698263726480; Wed, 25
 Oct 2023 12:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231025184259.250588-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231025184259.250588-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Oct 2023 21:55:15 +0200
Message-ID: <CACRpkda+qSzAQggm0_MhhvK-D+f_V77O3=u=03zEOWWVTV_TJQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: mmio: Make driver agnostic
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 25, 2023 at 8:50=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Driver uses so far some OF APIs when generic fwnode ones can be used.
> Replace these APIs accordingly. Note, this will help to clean up OF
> headers even more.

Clean, elegant and does exactly what we want.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
