Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9777A276B27
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 09:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgIXHtE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 03:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727238AbgIXHtE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 03:49:04 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B87AC0613CE;
        Thu, 24 Sep 2020 00:49:04 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d9so1399386pfd.3;
        Thu, 24 Sep 2020 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XPzM39+YlbVqn7kqF0bQ9gb6FBFKUdITbrKPj5a26wE=;
        b=T4we/x0EblWKxz/qAtYuEdMjtFowP168D25PDLyb0WkaonVyfcasaE29DoJqPEbkj6
         4kNgpHvq5GzLpmYYjRThBllgc2I219+iZN5CmNRFcpI0cwKBsRJZJfrswtAAc68Vi0kf
         PnFXFBzoFxhcWh+g1fHQta7E3GhM77RcOgQ8YddQMcQIDGvjMar2tFeYbBvYXPVL7uR5
         2HP6PbtuKbKOrmeIRyOHrxTCmG7Zxpmaz84/Gq29SWKtcSARX7eZSRqxvvWw5SmJSl8H
         WMRpiTAHrCOlfDDOB7gWENsleZu2G2RWRxBr5QzuPGVWHUQ5wlwuDRqVJhP9vgUF+bC5
         vV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XPzM39+YlbVqn7kqF0bQ9gb6FBFKUdITbrKPj5a26wE=;
        b=Kh5L65r3MgiX4xR4RSZh9o0BELsK7mtm5ARo8pFmxatVTz9jZU4JRIe25MDhCMJHql
         2M5K4nTxxcDqxS1Pocjme01FHbsZF6f9ZMqt8FoW4pn47vCJOkZ/JHDqFEvhBJGH7fBS
         jh7X001zGxOSzidZ0mcc6LK3RbkyO0NBHs/Z76LYAkDFVpLYTxuxBx8PLsNOjzUHXVjj
         IGeHMIG9F1R1vghHw3D2i8D9OiS96u+W0UkrjTyNiDeCss4PkHzNsnYY0qyY9eU3DtYk
         AUEdt/uPsOqO5B4Pf49rxWjWR6afs3JsJAXbj1Q//JA6V6Ob/YbimHAn75JPZ7HK3tyM
         mYMA==
X-Gm-Message-State: AOAM532Zo2ZnXtCrMB2FzpKakxuEtLrZ3JAis+hc9hpZfZWUZp7Pzhtn
        FcKmQlCd5w+Ihr1naQHqu8k=
X-Google-Smtp-Source: ABdhPJwjnQx91bk5MoHsLq8fWpWa7HldsMAiYsAekT379YWDuLphjdI/vkxtLswQI/1KsQsbw+wlBg==
X-Received: by 2002:a63:4452:: with SMTP id t18mr2868436pgk.194.1600933743740;
        Thu, 24 Sep 2020 00:49:03 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id 31sm1917036pgs.59.2020.09.24.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:49:02 -0700 (PDT)
Date:   Thu, 24 Sep 2020 15:48:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 12/20] gpiolib: cdev: support setting debounce
Message-ID: <20200924074857.GB17562@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-13-warthog618@gmail.com>
 <CAHp75VchWpH0tH_RoewFwqk0vGfasArYTnf1dbeCiOdyqT-9MA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VchWpH0tH_RoewFwqk0vGfasArYTnf1dbeCiOdyqT-9MA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 07:27:37PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for setting debounce on a line via the GPIO uAPI.
> > Where debounce is not supported by hardware, a software debounce is
> > provided.
> >
> > The implementation of the software debouncer waits for the line to be
> > stable for the debounce period before determining if a level change,
> > and a corresponding edge event, has occurred.  This provides maximum
> > protection against glitches, but also introduces a debounce_period
> > latency to edge events.
> >
> > The software debouncer is integrated with the edge detection as it
> > utilises the line interrupt, and integration is simpler than getting
> > the two to interwork.  Where software debounce AND edge detection is
> > required, the debouncer provides both.
> 
> 
> > +static unsigned int debounced_value(struct line *line)
> > +{
> > +       unsigned int value;
> > +
> > +       /*
> > +        * minor race - debouncer may be stopped here, so edge_detector_stop
> 
> () ?
> 
> > +        * must leave the value unchanged so the following will read the level
> > +        * from when the debouncer was last running.
> > +        */
> > +       value = READ_ONCE(line->level);
> > +
> 
> > +       if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
> > +               value = !value;
> 
> I'm not sure what this means in terms of unsingned int to be returned.
> 
> > +       return value;
> 
> Shouldn't we rather return 0/1 guaranteed?
> 
> Perhaps
> 
>  if (active_low)
>   return !value;
> 
> return !!value;
> 
> ?
> 

Or just make the return value a bool?

[snip]
> > +
> > +static void debounce_work_func(struct work_struct *work)
> > +{
> > +       struct gpio_v2_line_event le;
> > +       struct line *line = container_of(work, struct line, work.work);
> > +       struct linereq *lr;
> > +       int level;
> > +
> > +       level = gpiod_get_raw_value_cansleep(line->desc);
> > +       if (level < 0) {
> > +               pr_debug_ratelimited("debouncer failed to read line value\n");
> > +               return;
> > +       }
> > +
> > +       if (READ_ONCE(line->level) == level)
> > +               return;
> > +
> > +       WRITE_ONCE(line->level, level);
> > +
> > +       /* -- edge detection -- */
> > +       if (!line->eflags)
> > +               return;
> 
> > +       /* switch from physical level to logical - if they differ */
> > +       if (test_bit(FLAG_ACTIVE_LOW, &line->desc->flags))
> > +               level = !level;
> 
> Seems to me a good candidate to have
> 
> static inline bool convert_with_active_low_respected(desc, value)
> {
>   if (active_low)
>    return !value;
>  return !!value;
> }
> 

Not sure it is worth the effort - it would only be used twice - here
and in debounced_value() - which is only a couple of lines itself.

[snip]
> > +
> > +static int debounce_setup(struct line *line,
> > +                         unsigned int debounce_period_us)
> > +{
> > +       unsigned long irqflags;
> > +       int ret, level, irq;
> > +
> > +       /* try hardware */
> > +       ret = gpiod_set_debounce(line->desc, debounce_period_us);
> > +       if (!ret) {
> > +               WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
> > +               return ret;
> > +       }
> > +       if (ret != -ENOTSUPP)
> > +               return ret;
> > +
> > +       if (debounce_period_us) {
> > +               /* setup software debounce */
> > +               level = gpiod_get_raw_value_cansleep(line->desc);
> > +               if (level < 0)
> > +                       return level;
> > +
> > +               irq = gpiod_to_irq(line->desc);
> > +               if (irq <= 0)
> 
> Same question about return code...
> 

Same answer...

[snip]

> >                 return 0;
> >
> > -       edge_detector_stop(line);
> > +       /* sw debounced and still will be...*/
> 
> > +       if ((debounce_period_us != 0) && READ_ONCE(line->sw_debounced)) {
> 
> '(  != 0)' are redundant. But I think you want to show that it's not
> boolean and we compare to 0...
> 

Yeah, I guess I thought that was clearer, though I use the bare form
just below as well, and the bare form seems clear enough to me now, so
will change it for v10.

Cheers,
Kent.

> > +               line->eflags = eflags;
> > +               WRITE_ONCE(line->desc->debounce_period_us, debounce_period_us);
> > +               return 0;
> > +       }
> > +
> > +       /* reconfiguring edge detection or sw debounce being disabled */
> > +       if ((line->irq && !READ_ONCE(line->sw_debounced)) ||
> > +           (!debounce_period_us && READ_ONCE(line->sw_debounced)))
> > +               edge_detector_stop(line);
> >
