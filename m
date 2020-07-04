Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBEA2144C0
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2020 12:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgGDKGO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 4 Jul 2020 06:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGDKGO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 4 Jul 2020 06:06:14 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2A02C061794;
        Sat,  4 Jul 2020 03:06:13 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x8so12604770plm.10;
        Sat, 04 Jul 2020 03:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CA8jAzkc8W5El34ezuF44fIuAEbcJFUBVCL/rlG7C0M=;
        b=FcLVCw4FDMn8+9cPs40rfEdiHmHpyUrZ5rjyFIT/4NUjnkjjRRA5Z7AfESSDcdzVOb
         jwE5vkKOjCVfXlKplFBGLTB3G4eqMu4uNjNgiqZ+6AKifwOPVYyU+7orXvgv4QVmUd8n
         Je6AhuNHB9Mv8/oXIUato5MeYXJTtgnHXagOlUGLnkaoECk9yz/OqLk+IcXpebscE8R1
         UE5Wr9FyE0x5/Pr5ysnx4ObDJW7EL1g/S2h4iTthKe9BYTKjXghPz/zMSh6LKlulWREb
         Rty1UgYzXvjN9M2Bo/cI78kH3RNdH8dSrlGY7V9DTlEE+IEs1l+SbHGTOSCo4pLJ2LCX
         sMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CA8jAzkc8W5El34ezuF44fIuAEbcJFUBVCL/rlG7C0M=;
        b=SbEGJuf/lvkgAmpdVR8ygkhHk8C8Q48V5NeR5GarpAWJj91f0swYjO3p24US0Tmh5f
         e1B9btW/V9eBq6G+E6J9zh6fcfEuHgVVgmjHOpfktNTE7iRwq5KQ5wza7eUCQDA6YGbM
         WhKmteQGaD6ln8h3c0gF2HpkHt1SYvz39Dhxefy4KAD83F1f0cHYChVH/MkY5G4HFUc7
         DcamRVEMznCkdsif0PlVn/r4Locd7RqcOXpQYs6lTvz6HEVL+B4PRf0bDqLcKFndoSgZ
         sLXXqSlVJbAj4zERGEAOzNZXT+6FSX/uOn4JDORA+GTZkGgXLam+DwmMOek1smcWN1GA
         aRrA==
X-Gm-Message-State: AOAM530NWN4RFyJR/bUE/LArzP9W9NRqUXQnprT+1KF/oQAjoJ6XIPs9
        zFTQRFyLvSZ1QFlq+miv93XCtLETUKKG9jAcp9g=
X-Google-Smtp-Source: ABdhPJwfX1XWacFTmLH/1p+BTilyHqJnHseXKrJymRf5BL7HBdBVc4qJVCGYQ7RSvfL7M5C2p2USQkIZQgh/lDfnR0g=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr16435838pjb.181.1593857173428;
 Sat, 04 Jul 2020 03:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200702121722.1121468-1-mans0n@gorani.run> <CAHp75VdSWxcAQzWryKoMfzh8xM_2ZRF6Uk+8pveGhmt=prOAVg@mail.gmail.com>
 <f7a1960b-97b8-4a09-20bf-452e29307257@gorani.run>
In-Reply-To: <f7a1960b-97b8-4a09-20bf-452e29307257@gorani.run>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 4 Jul 2020 13:05:57 +0300
Message-ID: <CAHp75VfJi2a4pBu_3qE=nsRZ=5udSNZ6gsKct6sB51WPvQAA3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michael Walle <michael@walle.cc>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 3, 2020 at 3:13 AM Sungbo Eo <mans0n@gorani.run> wrote:
> On 2020-07-02 21:36, Andy Shevchenko wrote:
> >> +       gpio->chip.ngpio = i2c_match_id(pca9570_id_table, client)->driver_data;
> >
> > Oh, avoid direct access to the table like this. And you may simply use
> > device_get_match_data().
>
> I'm not sure if it really does the same thing, but I'll try following
> your suggestion.

It's an agnostic way to get it from fwnode enumerated devices. Since
you are using ->probe_new() the driver should rely on fwnode, that's
why the OF table has to have driver data be defined.

-- 
With Best Regards,
Andy Shevchenko
