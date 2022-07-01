Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2D756333E
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 14:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237141AbiGAMKj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 08:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237150AbiGAMK1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 08:10:27 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B15D84EEC
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 05:10:24 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id o19so3724634ybg.2
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6mEFvvbQ5FO5DJuw0wmITRR2BFAm3D/RvM0LciCgMdY=;
        b=cuFR3myeBFtMMXh2U6NMeev8I8vf5YNld71q1WVg1zA/+q6YMqKpHXV0sNbuz83OSi
         JY5ZvyVPBsv9lJMfh8TiE88iTKc2AhxWnOyR+31kMPnb+tD/6iU6kFNGJL2HiVRbvtZc
         VkpUOO5hLhjyRgof30JE3cKhlZzhSP60DUeLIFO9xeWRwwt4AsJMonwUHIMWBeNDeZLt
         Lc5owOf/x+DYS6cUdhVUCQ8vwINohyU5ixynkvBhCAPZzlX+2oQeGPQg3ELGxMqWNNzi
         cXLjdN692k4T8j0ECC0aLxg8eW4RaM/BLEBNlFg4Ivn0+ig4YEFKiC33wFDjVih7CBMa
         6JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6mEFvvbQ5FO5DJuw0wmITRR2BFAm3D/RvM0LciCgMdY=;
        b=lhmjsC/92cPKK1WO5EKykwYpa0nvJbWPeJk6zg1OTTaCVZu73kldJS39nJF/g3GGA7
         oTj5ihHw9jlDR1i6iFLRUk16+F19AbJl/i98ThuIBXWwn1vEcmtvISTBGZtdVDiakJTe
         2hJRB+VIuu5N+2JNO554rkTLIon9ARIKVNLgH0kBpIuAWDC2ZLlntU+ugnNqw3N4HQkE
         X4iL+qOkGxUGoCX1OS/553rQlys89rkKlkWsrwtpi0YB6LI1VVSysuHyFpAZNITcjAfS
         yT9GD27H6cndUk8ycau+32a8NA3gs/MpU9XmFUOH9NL0Lsfp63dPmhkscaxoWwbXV01f
         o1RQ==
X-Gm-Message-State: AJIora/ArJmkkP4QmOSjONmFcNPAWsaTRD1ijI38qeRBTYetoFRhT6vW
        csG5Kq5E9GWDOygk76PIE7+NshBcgtj0Wveho8BPHLcUTco=
X-Google-Smtp-Source: AGRyM1tSVfrRhCL9crWDRf/Ai6zU5F5bdPTEWjafD4Z+8xNkDRWttp/yM2Qa5voAvHZomDR30NJlV306jfS0HxOZhqY=
X-Received: by 2002:a25:cac5:0:b0:66d:2c32:8593 with SMTP id
 a188-20020a25cac5000000b0066d2c328593mr14952319ybg.626.1656677422338; Fri, 01
 Jul 2022 05:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220701120111.779348-1-linus.walleij@linaro.org>
In-Reply-To: <20220701120111.779348-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Jul 2022 14:10:11 +0200
Message-ID: <CACRpkdZbBRGcf4bn5CYWZuKZDWjWwwB8_LKprOroiD-ni9_tYQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: davinci: Delete DM644x board files
To:     Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>,
        Matt Porter <mporter@konsulko.com>
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

On Fri, Jul 1, 2022 at 2:03 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The interest of maintaining the DaVinci DM644x board files seems
> very low. Patches to convert the EVM board to use GPIO descriptors
> has not been reviewed, tested or merged for several merge
> windows in a row, see link below.
>
> When I look in the logs for the board files I see nothing but
> generic kernel maintenance and no testing on real hardware for
> years.
>
> I conclude the DM644x board files are unused and can be deleted.
>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: Matt Porter <mporter@konsulko.com>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20220507124536.171930-1-linus.walleij@linaro.org/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I realized Kevin Hilman wrote the original support code and might have
this board in his test farm in the shed so paging Kevin too.

Yours,
Linus Walleij
