Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA67C7A19E1
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Sep 2023 11:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233143AbjIOJDz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Sep 2023 05:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbjIOJDz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Sep 2023 05:03:55 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9157E49F1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 02:02:18 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d8165e3b209so3462611276.1
        for <linux-gpio@vger.kernel.org>; Fri, 15 Sep 2023 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694768532; x=1695373332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYhuR58x0PfWp746xuq3bl6Wnhj1B6G4ZyoH5DkvAmk=;
        b=cIRQXFXUYUlp7ECWE+6fj5e2i7UmAVv1JRey8nIvLDcDmETZ7Y5X1eG1p9KooDc8T/
         k5cXaKRLpQQEyLd1cinaPmuljSCnFuTulPJvJtOGmleGYYADnPdm4oIDKX6/q3CtNCM/
         IrvhdebisdkQt2JcmH0vEMUnb9f0TcD3wGDs2y/cEhqKJnYjHDlSTwYs3xYE3qTm0mk/
         ggYi4ybWfu5twZzmTKwLHDrp66UGyGv2E6vO9EMWWkTIN4KD/xfyQxfpu0PYKecVdHkW
         tnMtvV4t3aYcA2Ffz9/UB8IM9BvBu2r1fRYtDHbETulUEDsWNRJmYybB8FWHIVgE1f25
         CNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694768532; x=1695373332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYhuR58x0PfWp746xuq3bl6Wnhj1B6G4ZyoH5DkvAmk=;
        b=TvIgT74OBp+HOLObFGvQ6ugAjyGr714fX97e1gJiWjvyKGotyQiZhU3IIXUiH2csqA
         svL/0Hjg17G0y1Pqk245vld6h2s/9hhvIQYUBvIuWWUXYLnJwPXuT9sBMU36BdN0xXme
         pX5NaEmDhs5T+CBWcag7L9U4hsqRXkhKo9smpFFQ0OlO/OzKxNo9iGc6KVHZa2PEqFwz
         vlaiMt53oCKb5KhqHI/t04/34xcAou4VYPtlS9Tontf99sfpZ7PgDLWBJPAl7gQtWHC4
         JvBjonCoDAe4NvRuFcnU/vig/pasNL/2yl8tkPR3vkar53zeIwN+lzpVOGbCnxYfqxLB
         7oJw==
X-Gm-Message-State: AOJu0Yxiuc55CB/JSnDpiVWSHVZbMrMZ0AK8njLZditeFUC/sLiFojHv
        IR/IGti5OVgJTbk8jW0K9w23ebh9dgpJ7qXfPB5wSw==
X-Google-Smtp-Source: AGHT+IG5PlShkx8XUQaH04ChTdxjlTUZHDSyYhtXGqNxvmL4QyV4L8VamjlX4xQtVG1x/DUlfzOCVJsHwm17BQNpPwM=
X-Received: by 2002:a25:f61f:0:b0:d81:41e9:6cf5 with SMTP id
 t31-20020a25f61f000000b00d8141e96cf5mr4312903ybd.27.1694768532590; Fri, 15
 Sep 2023 02:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230915031123.14515-1-larry.lai@yunjingtech.com> <20230915031123.14515-3-larry.lai@yunjingtech.com>
In-Reply-To: <20230915031123.14515-3-larry.lai@yunjingtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 15 Sep 2023 11:02:01 +0200
Message-ID: <CACRpkdbi0bS0yiJ9ac6Z44os0w6FyKm+UsvbgQEYzYKymjww-w@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] pinctrl: Add support pin control for UP board CPLD/FPGA
To:     "larry.lai" <larry.lai@yunjingtech.com>
Cc:     lee@kernel.org, andriy.shevchenko@linux.intel.com, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, GaryWang@aaeon.com.tw,
        musa.lin@yunjingtech.com, jack.chang@yunjingtech.com,
        noah.hung@yunjingtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 15, 2023 at 5:12=E2=80=AFAM larry.lai <larry.lai@yunjingtech.co=
m> wrote:

> The UP Squared board <http://www.upboard.com> implements certain
> features (pin control) through an on-board FPGA.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Gary Wang <garywang@aaeon.com.tw>
> Signed-off-by: larry.lai <larry.lai@yunjingtech.com>

This v6 overall looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can the patch be merged on its own?

> +#include "core.h"
> +#include "intel/pinctrl-intel.h"

Didn't notice this before. But if Andy is OK with it, I'm
OK with it, I guess there is a reason? Perhaps it warrants
a comment explaining why you do this?

Valid reasons:
- You are using Intel-specific HW features also found in this
   FPGA

Invalid reasons:
- Using nifty macros or helpers, then either make them generic
  or (if they are small) duplicate them.

If it was that thing I asked Andy to keep locally because I didn't
agree with its generic usefulness, maybe I should be told to
reconsider.

Yours,
Linus Walleij
