Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C393767E082
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 10:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbjA0Jlt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 04:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbjA0Jls (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 04:41:48 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF82B1706
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:41:45 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id t2so2172733vkk.9
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 01:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LCOqg4DoN3/78012+SQDld1G7CIytb3VVvE2O1Vqglc=;
        b=t9OQu/T932AYESKUD+oN4Y/brcxXvJQiiTma/CmMwrIXSHoRWs8bOcQ0x0j3458npr
         ucrh9goLg29QAg7pfj0ypM5FTnPuB/9c4xErbIppLgHowwuN1orhIiiPbVPYfR3qHGz0
         Z6woTw8KVKTjR7XGMNkA0zMTwdp+9sxUxSnWaUU6XUuyk9qr11LVXOiDYlDtIMgSuvt6
         /MhsMrP97yKn5K7IDddsKeMp6292AtKLpDzjtfd2AhhYfXr4t0Yyl79VazQ0KihWtbhO
         K4OKHDIfL5oCMUn/cQ9QGTSpW98jWAVrWljI2nAeDSzOGWTTiUikaaWxvKiRrpVGqjO5
         1WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCOqg4DoN3/78012+SQDld1G7CIytb3VVvE2O1Vqglc=;
        b=WlOEnQXbrsRooh8IlOqtCx2AvhQykM+x8R+14Zza1XkZhUJ/BXACdXNN5fzrZlzDYX
         V1DOLdRv5HPt01zvEjJ/NusnZ/Q8i84Eiwz13vkS3GdfEBJEqyxRZsjx0/nad9GQJUEs
         vr8BGG06ldppi17gm6ilqpOXhwr9RdfSDU7v5eaQwBH5ukZOceTsrKO4LifEiF2hVjXj
         i2jAE+Nvuv8wkzGWl9ystTMsUdwMf8w4o5H9Ui4dpsNmWDweeWMuTM2ydpKd5jk3DxvY
         ZwgT8WdOcqO/SJXVt2URZdHYaNaBZyC2zBcdE7+ie1a3PkoR0Bd5jQT8wP53x5WW0PQy
         8pQA==
X-Gm-Message-State: AFqh2kqjzGXZrLnndD9hcVV0HMJPH7VE9xf3EUk3eldehYMKqXuv2hhU
        waZvKF99xPydbxVLjjG0OOi2Nc1bGVOGTgqktN4QlQ==
X-Google-Smtp-Source: AMrXdXvNo2uSrVR5WNuP7JJMpWsj1hpiuWSKbKZ8E4xqddeFiftOPDN3HYp2lfjVUrNJ0lnFzqKJNKEp1cfJLPP2pDY=
X-Received: by 2002:a05:6122:201b:b0:3db:138f:3502 with SMTP id
 l27-20020a056122201b00b003db138f3502mr5747921vkd.28.1674812504837; Fri, 27
 Jan 2023 01:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20230126132801.2042371-1-arnd@kernel.org> <20230126132801.2042371-2-arnd@kernel.org>
In-Reply-To: <20230126132801.2042371-2-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 27 Jan 2023 10:41:34 +0100
Message-ID: <CAMRc=MdfKYmB8giYVppDTuExuDJi8_GT+KP2KVDjakjMAgkefg@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: remove empty asm/gpio.h files
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 26, 2023 at 2:28 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm and sh versions of this file are identical to the generic
> versions and can just be removed.
>
> The drivers that actually use the sh3 specific version also include
> cpu/gpio.h directly, with the exception of magicpanelr2, which is
> easily fixed. This leaves coldfire as the only gpio driver
> that needs something custom for gpiolib.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
