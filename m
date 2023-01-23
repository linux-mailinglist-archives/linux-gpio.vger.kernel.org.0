Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E2D677B5A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 13:45:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231787AbjAWMpb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 07:45:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbjAWMpY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 07:45:24 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CBA23C6E
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 04:45:19 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 66so14573174yba.4
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qZeqC6hMijQb+v8aFEsJPSFBMni+i6OfkD47OxpG6sY=;
        b=c3wDKoYQdNB0NxFQfDaceN4wf8wCexn25f2Sz56/QMCeECpqV2vDMZf7JqCREAEFtB
         xHH11RAs+z7Mqmi7d8usWeQOeD/orB2BA44NHhxftddr4sbn2sA+buYD2iqOzHHonCtv
         g6AeJBSm3ovdTyHO5KMt0e2Bg+TjNvjstorTYDHS2rsI08Q4CzO/3i3vrnJEt4alqKHs
         NiCmM9248cb0UgspKcVL6vNlcpFOZKFtK9uNj87i4strLbvAnDKyI1RVHwlhjVy5j4Ei
         TEYNC/Qh/aGlFgO3jXoQ7YdeVbRDkHMdtfYe12KGzNPjP0+jVNIKqUhHuXGtYCXJBcJM
         g4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZeqC6hMijQb+v8aFEsJPSFBMni+i6OfkD47OxpG6sY=;
        b=Ao4BJWfMLi9vm2G7KlI7igpD/zoycaHgBEeP3tDJrHeNeTb47YBxeuQxrGxpooXlvm
         MNKy7LXY8X9EMkgE5h7I4WuphhudWqcFbTBfDtJIC1PzA0hDI7pkOhQbYWTexKBttbyl
         JvPDr0TyerIJXDp6oL8Kj4s5pD9cdtWaR9/JXJkI4ah1HY02+IsOR2E338f8/ssho4rp
         QWiNaGehTZhG7PhzPNL2gbPpQxVwWl6dNqVthELE+huhv8i47tgU+PEjxyzwNhQG3BsT
         Fi9W7P6L9WahP8BcyKSbwxiVUjp95xtezY6OU8/bywJo6IbNWosG/eiC4MO8/84GsZfp
         OweA==
X-Gm-Message-State: AFqh2kp3FtATaIafBhQ8WT7XhKO1Odn743J5qcDOriXOEGyKkeDmibgg
        2MHk4ygQEgpmY0vCfLebqmY8YVzWm2tUQsTQ8PG+dPfNAE+7PGYi
X-Google-Smtp-Source: AMrXdXtetYFT/WUpd8mjuQ2tQ4mrbGloVtEw593hKh1I0Dm0/E7sNfijUdXFqYNfsl/3vCH5lMJyrxVnjRcR5lAz1CM=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr3009165ybp.130.1674477918299; Mon, 23
 Jan 2023 04:45:18 -0800 (PST)
MIME-Version: 1.0
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Jan 2023 13:45:07 +0100
Message-ID: <CACRpkdb6yMqTkrJOg+K46RZ1478-gbxh6=tw4bzWmd--5nj_Bw@mail.gmail.com>
Subject: gpio: making <linux/gpio.h> consumer-only
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

please have a look at this branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=gpiochip-no-driver-h

Last week this built successfully for the first time, I've been fixing
stuff on this branch for several years (yeah ... grit).

The remaining few patches are mostly due to maintainers not
paying much attention.

I was thinking to just ask you to pull it in if I don't get any more
replies to the patches in a few days.

It's a neat thing to get rid of <linux/gpio/driver.h> from <linux/gpio.h>
so I don't wanna wait for v6.4 if I don't have to.

What do you think?

Yours,
Linus Walleij
