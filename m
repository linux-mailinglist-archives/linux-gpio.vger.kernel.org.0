Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8003D4D0CD6
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Mar 2022 01:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244128AbiCHAiz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Mar 2022 19:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242055AbiCHAix (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Mar 2022 19:38:53 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A5B3123A
        for <linux-gpio@vger.kernel.org>; Mon,  7 Mar 2022 16:37:58 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2d6d0cb5da4so184261377b3.10
        for <linux-gpio@vger.kernel.org>; Mon, 07 Mar 2022 16:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=b8Tbovb+t2CGb+kXP3pUSj8fiuHuDrdZMLqUpQIxygM=;
        b=HbUIDUFOzDsYDlpUnQenUvsMudKG8it+7upcP9hljKcoPhal3um/QBLWGJ9fXkZ3Y/
         ds/9fMP6A4QxTPPFGV18EXDz/hVqMUycdwD4cFacqPThXse0w7kEZE4lvSMbFdMr4fsF
         wsZlqMEa9mQ2/Q7xixHacTeuiP4DIdGvCMb5WMsM55Oipz9J+q+7ibKFPyMXFWIIkJIg
         tCBX4iOJED5RJNj4yfmVvWiRBmq6W3DCv7wv7VC6KTcubpK2LqVhDuNS3HjJWyXSauFh
         yPoqwV3q/f3F8j90P84lhAsMVMhe5YgwE+dgF2YOzyJuflCMs+w7kPteb2NtWRYa9Ham
         kVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=b8Tbovb+t2CGb+kXP3pUSj8fiuHuDrdZMLqUpQIxygM=;
        b=piWShp1CfPn9pwOOT380dwyaaC42KXEmrc96pY6PljVjmMNbGUwt9DDkmY+3JMjsr1
         lPUmThZ6WO2DMKX2uL7DzxpFiNbzBcGco0Pt0KUOphOng26b94OZOBCpgyI+ZsVd4qRG
         TmlK73Wu34VlGnx8fT9AldmgZ09Q0ZmPyhMH8qhgTEWokrnXKjComh71bmtOgs6MTpkZ
         pQ1/C1ugvjjRAIU8+PnWOj6Rd77cRpH7PzqRLSnN289YnPW9YITn0AbK0jYjRRndB+h6
         B0TzShsp9zH8DHGmXesQKjd8jJBn/NPsRK+Djn993FdTUM2CF9QQ/4IVv7cgTzkBKa67
         BM+w==
X-Gm-Message-State: AOAM533HwH4QZNJi587DAzQXYn5NHDJI0up5u9DCUs67Z/mBl/3Jnoui
        /nvSFCw3Q5Iazu0S96aY87/uK2wM9JVC0q5i/nQebs2vU2TdOA==
X-Google-Smtp-Source: ABdhPJy6daK6R+be0NCVMFVLxKV2Rt/DDG1+PBaCAkK5YHYlNvEL/j4HBbtjQ71ATYcdtOlgglulFpS3IndG9C1g8Kk=
X-Received: by 2002:a81:1182:0:b0:2dc:4e58:da41 with SMTP id
 124-20020a811182000000b002dc4e58da41mr10922205ywr.268.1646699877147; Mon, 07
 Mar 2022 16:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20220127235442.416019-1-linus.walleij@linaro.org>
In-Reply-To: <20220127235442.416019-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Mar 2022 01:37:46 +0100
Message-ID: <CACRpkdZ0BhviaOqo9J+PwVf9dVU0hSKuvdJOn4sLuW5_BzOdxg@mail.gmail.com>
Subject: Re: [PATCH] gpio: ixp4xx: Detect special machines by compatible
To:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

On Fri, Jan 28, 2022 at 12:56 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> There are some special clock amendments for two machines
> formerly detected by their machine_is() boardfile macro.
>
> They are now migrated to device tree so use
> of_machine_is_compatible() instead.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Bartosz, could you merge this? I can make quick changes
if needed. I guess it may have been forgotten.

Yours,
Linus Walleij
