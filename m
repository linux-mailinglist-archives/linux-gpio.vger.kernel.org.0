Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6136C50E9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Mar 2023 17:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbjCVQhy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Mar 2023 12:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjCVQhx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2023 12:37:53 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4836130E
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:37:51 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id e19so16715173vsu.4
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679503070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDwWxR2C8imvh8J9/5EbHiWJIV6of+hEInMJyXUJk6s=;
        b=ZMyOV1xjHRdSNEvZ2kyE4+WSV4dk1uc8qq9y9cXGL9a93XClfi3aT6DJdqEy/Ynj7r
         /MTUl/o05aeca/R8JHYomeNu0KYojtXB14gkBAhFG7ZC3R9vUXyWqy5ul8Xv53t0gGRp
         rUNbAY/kmcDpkGFKQV1byycV2Bdg4n+bOLzOmMB/cv3nBruvZYcjIOfAVpM/2k3LZNpV
         i0dEY51KoscLuex/zwihXLTXxEVkk1XEVb9HXPtJ/9swBLjLFaDCvk1neAS56nljzTQ1
         2dTtKZr4DJj5Jhsv1Uj8Fw45X+P8NH9FYRSD4jqZEw5nb5kTIKpQWXzlQ7Qg488i+Z+p
         IVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679503070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDwWxR2C8imvh8J9/5EbHiWJIV6of+hEInMJyXUJk6s=;
        b=MEirNt3ttZw5jwL0GQayc3RLCsACVvqs8El4DQvu/htRYtTTWAWEZZUjZ/9oeJPuRJ
         jDDj8FOZO2rhfvjTqYLp2v8Z5ezGqjsvCbpe+eWco2IgN36W70vISeM5anSDnRAAXKiK
         Zf67+bDe43gc07UqyLc17g2qhdovJ6Om/RsrJdtfjnqSanuJ0JZz3it4cOLvAXwsZwgV
         iFRgM9+a8vvkklVHvAlIUeQdACEfB6FzNIsYNeOEzyPbK74cfPii31QtkGUcZctQkeci
         IGlFet4U1SjBF92cMwv3k7EZZm74dFMJTDh+mbT2flPoTV5+EN3Gsyo2ZA0bBRQ3lJrd
         eaFw==
X-Gm-Message-State: AO0yUKWyIlTYFWOQEzdZCiT+Pm6+P5tpNtCT/00T7O6u8gCaeVZOHsOu
        Z3pnqGGBKQfapXNQzo+mtCvY/qpkB4OjzyNdVhjbqA==
X-Google-Smtp-Source: AK7set+bqP8uo5+tkUexX6+p9iJOvr9iT4N/iJBrltoYtpQrPaOJgVmgUu/p7sYrjZXgSMDYj1knt7/yFH2mIvShKSw=
X-Received: by 2002:a67:c38b:0:b0:411:b4c2:c6c0 with SMTP id
 s11-20020a67c38b000000b00411b4c2c6c0mr74966vsj.0.1679503069881; Wed, 22 Mar
 2023 09:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1677515341.git.william.gray@linaro.org> <16c8b165d84df82dd6f1230d14fb6ecf27b5363b.1677515341.git.william.gray@linaro.org>
In-Reply-To: <16c8b165d84df82dd6f1230d14fb6ecf27b5363b.1677515341.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 22 Mar 2023 17:37:39 +0100
Message-ID: <CAMRc=MfPp7=K244cz6xLPKr9C6mwvrG48-yp0EmPA9faHDqyjQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] gpio: pci-idio-16: Migrate to the regmap API
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linus.walleij@linaro.org, broonie@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 27, 2023 at 5:54=E2=80=AFPM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> The regmap API supports IO port accessors so we can take advantage of
> regmap abstractions rather than handling access to the device registers
> directly in the driver. Migrate the pci-idio-16 module to the new
> idio-16 library interface leveraging the gpio-regmap API.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> ---

This doesn't apply as Linus predicted with Linus' series in my for-next tre=
e.

Can you rebase and resend?

Bart
