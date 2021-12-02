Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABFA5466094
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Dec 2021 10:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbhLBJon (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 04:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbhLBJom (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 04:44:42 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CE5C061757
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 01:41:19 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id w23so54630749uao.5
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 01:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/5wglHuW6DrlN2Cy/H7j8MygLggIIOiU+dBSXCAUz94=;
        b=bM9zFMo4dLwzRQow5Hu02nWkyOEDx02ddKOHKaQWKKR61bdQU2tJSYcrt1NlLcag4J
         rQ4dh03kLtmediV/qaN76jrpfAz0micE1Wr8sxzPdgygR7+NFhTR7P4XT/eAql290t2D
         zfFbEiFx7eGMLBLHOW6kVETeS/0EPAyHpvrMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/5wglHuW6DrlN2Cy/H7j8MygLggIIOiU+dBSXCAUz94=;
        b=dPhqu10+rL4BPtaZF8MI/sLBy/dBdMQzBM5iUJubZNslDu+pKBhwEHPHu52wiaVKFs
         rILp5p5lbAe2q0Um0Go26+Tbi7H3lw4ja+oEYJdRX3uZr0PfInfQHQNH0HRA+x+W5V96
         MqjrWA4UtJyo1vIY1NwuLIcnbvjE97YROkyQfkNHAS68x8ZeNt4dMOle5+zaPHt64Pkz
         Zl4K5D4+L3cQI07GCA1SFO8xsWjJxe0Q7uz9DP5PJa3sO0Y3QbpPhZkzish1n/PyGVEH
         8WzCBqaHzkL5P0iman8ZB17cONFXBgqoLSFjF3uXlb/UmDvAv348ifJlMeaRpXrXIfJK
         wMbw==
X-Gm-Message-State: AOAM531pvkvbCiGoe3IqX8iWz9ClqPn2WIVS2vu6Oib4EwU1YsVoyZV1
        /1cmyUNo3mGEuIXtkWYBH+1yPb3yKF1i8borINhgxA==
X-Google-Smtp-Source: ABdhPJwxbYQZwwV9ssvtvJI98cH3l7XJM7RHj+boVjaTmFCzwAqO3kC7kHXsARqZHiJeUUi0Eobq4nb1neZDfWqTlis=
X-Received: by 2002:a05:6102:389:: with SMTP id m9mr14024314vsq.43.1638438079011;
 Thu, 02 Dec 2021 01:41:19 -0800 (PST)
MIME-Version: 1.0
References: <20210923065500.2284347-1-daniel@0x0f.com> <20210923065500.2284347-8-daniel@0x0f.com>
 <20211130185558.GD30113@duo.ucw.cz>
In-Reply-To: <20211130185558.GD30113@duo.ucw.cz>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 2 Dec 2021 18:44:11 +0900
Message-ID: <CAFr9PX=TFBGSbZV+hHB4SO5LLmxPXHGXub4RTR36g6yDi5o0kg@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] ARM: dts: mstar: unitv2: Wire up LEDs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     DTML <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Pavel,

On Wed, 1 Dec 2021 at 03:56, Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > Add the red and white leds present on the unitv2.
>
> Thanks for cc-ing me.
>
> > @@ -18,6 +20,18 @@ aliases {
> >       chosen {
> >               stdout-path = "serial0:115200n8";
> >       };
> > +
> > +     leds {
> > +             compatible = "gpio-leds";
> > +             led-white {
> > +                     gpios = <&gpio SSD20XD_GPIO_GPIO0 GPIO_ACTIVE_LOW>;
> > +                     linux,default-trigger = "activity";
> > +             };
> > +             led-red {
> > +                     gpios = <&gpio SSD20XD_GPIO_GPIO1 GPIO_ACTIVE_LOW>;
> > +                     linux,default-trigger = "heartbeat";
> > +             };
> > +     };
>
> How do these look in userspace (ls /sys/class/leds)?

From what I remember the above results in /sys/class/leds/red and
/sys/class/leds/white.
I'll check though. Is there something wrong with that? :)

>Should the first one be disk-activity?

Good question. My personal preference was for some sort of load
indicator as it helped me when debugging. That's why I have heartbeat
and activity. An "I'm alive signal" and some indication of how much is
going on.
I'm not sure if disk-activity is too useful with these devices as they
usually have everything in a very small rootfs and don't do lots of
disk io because they have pretty small SPI NAND flash for local
storage. Also there isn't anything in mainline that'll trigger the
disk-activity trigger at the moment.
As "activity" isn't documented in the bindings and I don't think I got
an answer from Rob about it, maybe I'll just drop the trigger for now.

Cheers,

Daniel
