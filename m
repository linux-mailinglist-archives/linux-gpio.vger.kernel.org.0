Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0152C176E47
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2020 06:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgCCFCi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Mar 2020 00:02:38 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33452 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgCCFCi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2020 00:02:38 -0500
Received: by mail-qk1-f195.google.com with SMTP id p62so2235741qkb.0;
        Mon, 02 Mar 2020 21:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X9bTTlF35r5TSl8dSQRie4Vik/3Afhj4BHnWJcWZbf4=;
        b=PWZJA+zjpoYUP2LOlITnrD310E8NitwFdIGN1cCPCUAS+yE6avNdew3/gl1tzkhpdQ
         9XxooyQ0U1ZPqqCAQTvCdHBLrbuDlv3/DO95ZvJ4lzJ4vk8bQbEtmP2JxucK7uKCfyYk
         Ze+a4kSgBtvu1Zt19GhmJxUlS+bi1jTRYcemRR0/mgUXm/56V8Zghuj6XQYwYGdT82Xt
         wiH5XIYwDu0pO7PLx9w7JSfLz/a+p7MzPVM+uOFU9VGUARZgTfYppBVY8+NtCGTk34Z/
         5UFiz2QADhT1HQ3L/zm6kHfpVO5UJHbT+KMhpXdx+miJVCJv3wqXXw5rA0+yQorYX33T
         FDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X9bTTlF35r5TSl8dSQRie4Vik/3Afhj4BHnWJcWZbf4=;
        b=icnWMr+TTY1/k3BRkjBGe4KLMUKICfsfdxJghG+0V2HXRmqALLI/+SzYOuGYy6sL9d
         1i/md+VKCy/rWgqdvlwSUC2XEIe0W9+0eDLv65ueV+71znXcdgoZCa5SV3RClmkEX1WR
         TD2D08KdYo/COjrwbv7X/Cuyxf1Pt2D9bfjXtD7QT400J+TB2WoqGYesgITZ6bLsOe+p
         sNzy/qOeSPE9NSjf5495IsL5uBTiGX4ytmGgk3aHViGZTeFL381l0zcXSlOajxuzfCoJ
         Vp++nbSFnZ8Dk6+OF8vZWQ/ZCZYvdMG9V8uRlH2W4cIf+xASOrs21ZdhNmZvU+ViMrIb
         LtBQ==
X-Gm-Message-State: ANhLgQ2vrIJgrWsr97U4UrX00z8wsCL1v9d9H2Z0xCvRw+MIlTOmGB+q
        JAsF68FIyfw5PpZpUVModdlBebYb/SDSIodqwQY=
X-Google-Smtp-Source: ADFU+vtmfsvJPV4oJnePyQzSlf/c1avXq5UwA1q9S5iiVzQ6AEoQD4B52gFb86s8xLQaEyUmnnVn66jiAsS3sjqE6VE=
X-Received: by 2002:ae9:e104:: with SMTP id g4mr2412992qkm.133.1583211757281;
 Mon, 02 Mar 2020 21:02:37 -0800 (PST)
MIME-Version: 1.0
References: <eeb12d7843fb06f80e19f98eb25711231c3b610f.1583205650.git.baolin.wang7@gmail.com>
 <3271ce73-7165-c545-43e7-93d85a7c3680@infradead.org>
In-Reply-To: <3271ce73-7165-c545-43e7-93d85a7c3680@infradead.org>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Tue, 3 Mar 2020 13:02:25 +0800
Message-ID: <CADBw62p3pKjLQivxZs9HtTnvey=qsU=piG-OkX8Vzfm5FiMWqA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: Fix the kconfig warning
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 3, 2020 at 12:45 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 3/2/20 7:32 PM, Baolin Wang wrote:
> > On X86 plaform, if the CONFIG_OF is not selected, and set the
> > CONFIG_SPRD_SC9860 as 'm', that will cause below waring:
> >
> > WARNING: unmet direct dependencies detected for PINCTRL_SPRD
> >   Depends on [n]: PINCTRL [=y] && OF [=n] && (ARCH_SPRD || COMPILE_TEST [=y])
> >   Selected by [m]:
> >   - PINCTRL_SPRD_SC9860 [=m] && PINCTRL [=y]
> >
> > Thus move the configuration dependency under CONFIG_PINCTRL_SPRD_SC9860
> > to fix the warning.
> >
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
>
> Works for me.  Thanks.
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks for your reporting and testing.
