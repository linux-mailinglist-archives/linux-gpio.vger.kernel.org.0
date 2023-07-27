Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A348764932
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jul 2023 09:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbjG0Hpa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jul 2023 03:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233510AbjG0HpC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jul 2023 03:45:02 -0400
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 466344C18
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 00:38:38 -0700 (PDT)
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7996fe1c31bso310725241.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jul 2023 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690443517; x=1691048317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YezJM6QigbMLfWDq6Ji6Z3kKcAg+8CPzufotpDvjcDA=;
        b=TMQ+uPAdsQmo9/pRW14sajYuaSbWMCkqe24VSUXW0kWWE2PLvlAvOBzQGNGvWjkUfA
         PUmqfA2gWTUN3aq8kVxpY/A8SrXJqf76BI38GGq1VXRAkVZS8n5obfq4mbYCBs5Se9GB
         xmG62LW86Kl8C3N7ZNXYAuxR6U/Up9Pg56M4oMTkc5kHjDYCKxQI8JmMHP/KpUbBmRJc
         xEKllr9Q5IiH/0pahxL/pb2BPXyHrDTHGp5g4q9XcF/Vo2Kj1Cr5EiT9gPVVleO9tLlI
         issGuDKN6ZgbMM8K/AOR2my7iM3gNAof3dcsejni04MEq3iLkf/5UynJ3mzhYCFLeae5
         pBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690443517; x=1691048317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YezJM6QigbMLfWDq6Ji6Z3kKcAg+8CPzufotpDvjcDA=;
        b=dBmxQN9VQwvXKBKRzAYjqp8cicG15QDm+xsIdTCnltKrROmVrFJJ6xl8X6/ik5UFko
         Ouyu0WkA50CQ60n7Cs+zwc+5OdjO8Q/z3TGihSeCRYnaaZv75YrNg0BeHsr1kXg6VZmR
         Tcf7bm+oaU0NY8SV5u7GnigdG5wTm/XxJKpLeF+HDz1NA4YIo4ZM02lZX//NuOm3lXds
         OYooY2aAOkG/wRDxc1wxe2qCTRH9c1fIr3WRH34elP2Ih4lyTl72dhJOhF97ZkDNYwfu
         /eIQk76rnP+8anQ2n/abO9wIVedoeasuOu8MHa6++My5HxmzK55yi0WotwM01IhJjtxM
         /1iQ==
X-Gm-Message-State: ABy/qLaou97Ws+ToBrQGPiDBaTYnB36noYcyJ1c16LDEW4R9gEkuGh1q
        Kjnquxa63d6Qz3u7tFh2MEEJMVTfpG22I8sNKpb+ng==
X-Google-Smtp-Source: APBJJlEXy8Q8c456cOAFy3RbYWkxG8bvpQFQTUxlvpfjZETzJ8DISfDLLurz7qpmWlWJRf8Gnl5sK6NbY2maWVpluIw=
X-Received: by 2002:a67:eacf:0:b0:447:6947:24dc with SMTP id
 s15-20020a67eacf000000b00447694724dcmr46934vso.9.1690443517392; Thu, 27 Jul
 2023 00:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689878150.git.william.gray@linaro.org> <9b159da19bb78df21c1dc24161188c9b8452720a.1689878150.git.william.gray@linaro.org>
In-Reply-To: <9b159da19bb78df21c1dc24161188c9b8452720a.1689878150.git.william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 27 Jul 2023 09:38:26 +0200
Message-ID: <CAMRc=MeNyoAkVJJeXTC1crYt+QOCEjoPbwCnfSu3mECk+ugp8w@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] gpio: 104-dio-48e: Add Counter/Timer support
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 20, 2023 at 8:50=E2=80=AFPM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> The 104-DIO-48E features an 8254 Counter/Timer chip providing three
> counter/timers which can be used for frequency measurement, frequency
> output, pulse width modulation, pulse width measurement, event count,
> etc. The counter/timers use the same addresses as PPI 0 (addresses 0x0
> to 0x3), so a raw_spinlock_t is used to synchronize operations between
> the two regmap mappings to prevent clobbering.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> ---

Applied, thanks!

Bart
