Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202FF678045
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jan 2023 16:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbjAWPpv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 10:45:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbjAWPpu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 10:45:50 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00953E386
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 07:45:49 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id d66so13295546vsd.9
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jan 2023 07:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vMPCyKcy4NrBdUPtNr0oa3rxm1OSD9ZPJA/Iqf7nzY=;
        b=yafLnDWRQVVxn6v5UpQbPK5wZXzbyJNWxw1qbIJF/fA7PF+X6soFkpUVLECocRX1Oo
         6VEqAZbN/V/+dx3Kf21wug2Irh52MqFjqyyXCotE2jBbu+s2T8yTufYpn0ccldBX05Zp
         2wzp8SpWyLgwfHAN7vf0phVPcnwN2luD6/BXi2Pz9SuRgmCnJsi2/VZxDszGnbRnP9Cz
         +sXRMPnsiR3xdsqPjidyDS4VwpAeC09Ktw1HK6+fLGeig94AO2TK2FBhPysF65LPi8Ok
         byjl2T6AgKxiN5SurXAcNmwkkjZ9vhf2h1HzXkLiSQI2VH0+zpL3aynZ5oGBVU+JSfNm
         K7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vMPCyKcy4NrBdUPtNr0oa3rxm1OSD9ZPJA/Iqf7nzY=;
        b=atlGgfRg1L9KXJVWdcn26Dkl/l+SBuXqf6AucPOz7Q469lR6B2VeKGWCT7+MyYabZa
         b4u9cQIXdZB96SDQ0+L7kYA0F731IX3zWLQzA15HD0h1NoT6RC4Qdba2kocQYuKy1avR
         w020FRdD1c9UqwDbL2GobDlh0c4bS2+5iSVFPsp5ma3A4HxxBNZo3aQF2y5Oj3d5c2bB
         eUqTkKxnh+gX8RGwKr9bT1tOoAKIBT9aJ4YuEXoEMxP+tReuNeVCP9Xh2Bn67zyL1zG4
         i1UmPRY9Sw1fFJwSUmNTlZWixYhcJbpm8Ru75/l+qITgB/7Qz2CywfTgIrO2VSYUf7W0
         dEZg==
X-Gm-Message-State: AFqh2koBbkQKpd4BLbHEEbWybtS9iy3x8s0kzKydcl9XYexkfQhDoNgL
        Tk5mnlZ79xIq88EZKBdK1CBbJma+xqQ5CdT6+CIrjA==
X-Google-Smtp-Source: AMrXdXsyF0W9cBV0sfjDUY9xGupl2wPp31Bet6QW96bQUOo9cTVUw51t7US2agfIq6OBxEm/DHgAB5jlRt8F8xchLbg=
X-Received: by 2002:a67:f282:0:b0:3ce:88b3:d7da with SMTP id
 m2-20020a67f282000000b003ce88b3d7damr3348962vsk.62.1674488749105; Mon, 23 Jan
 2023 07:45:49 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdb6yMqTkrJOg+K46RZ1478-gbxh6=tw4bzWmd--5nj_Bw@mail.gmail.com>
In-Reply-To: <CACRpkdb6yMqTkrJOg+K46RZ1478-gbxh6=tw4bzWmd--5nj_Bw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 23 Jan 2023 16:45:38 +0100
Message-ID: <CAMRc=MfszzKi8a8-UTFbi49_=mbas7_HvguV-0+aJn6NDM0FgQ@mail.gmail.com>
Subject: Re: gpio: making <linux/gpio.h> consumer-only
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 23, 2023 at 1:45 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Bartosz,
>
> please have a look at this branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=gpiochip-no-driver-h
>
> Last week this built successfully for the first time, I've been fixing
> stuff on this branch for several years (yeah ... grit).
>
> The remaining few patches are mostly due to maintainers not
> paying much attention.
>
> I was thinking to just ask you to pull it in if I don't get any more
> replies to the patches in a few days.
>
> It's a neat thing to get rid of <linux/gpio/driver.h> from <linux/gpio.h>
> so I don't wanna wait for v6.4 if I don't have to.
>
> What do you think?
>

I assume you had sent and resent those patches and they're just being
ignored? If there's history to prove that on the list, then sure, just
send a PR!

Thanks for doing this.

Bartosz
