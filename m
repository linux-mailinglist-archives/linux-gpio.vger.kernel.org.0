Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B620273F34
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 12:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgIVKHP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 06:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIVKHP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 06:07:15 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A98C061755;
        Tue, 22 Sep 2020 03:07:14 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id b17so1214285pji.1;
        Tue, 22 Sep 2020 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XQCTCDED3kLyFk7oxR7SLh9rQyU4Xn0x1JeTlZw7/YU=;
        b=iFFyR8+8QveEQxQa1NxO3YTMorPx7i2WTUBL1sMmU5YczvKheyJOEYhFMyQPibmml0
         3ZXlCuVqEupLXoWHxoiDNOwxfcrYT8ag2iWy0Nes/k/a7nml/4+fedAoNB/JRkx5ZWFT
         HcNQwOaAUk8udgkoAqt4yH5mY8vwT35nD1IdgLekLwTgRMLSwvR1MZ+JNdWEfTbFSWcq
         MGqRAKR9y6SZYpj392gGpUJ7jUInG6UwqYyyT2092CGzsTte6o7y8lCR2Ex8mXa1Udux
         U091PTo4tUx3YoNxBdeHd0DMy0OZ23aYzkCGyLzqp2F1baY7dkE40DuyQ36fE8s+qDgc
         kx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XQCTCDED3kLyFk7oxR7SLh9rQyU4Xn0x1JeTlZw7/YU=;
        b=EgHz/l2ocmkimefIDefw9LN+B2XUbbHBOO/NJG4NG4e1CtbPJ8r0Yc7MxhT8utE5qI
         AKP4dnitoKIPHARLtVurZDd8hWCxjohFCTfV7Wy9zEXz33vIc8gau2t+LjDX4MlNbukS
         XlU3WPLIxAQw9PEPgAHqoKmX+EShP0KEG74QzkX62PiwcVeVroPvi7IS6tzDVZNyng/W
         KzatXjpTYCzc3RA5fA9hY8xqIAUL0whAXRr5bVviUSJJINO0O50bUHmMz9dtUOggv1gl
         NBD1hCSYbV0iq3RSCuH6R5KVpiNBU0eAwXnRCVwxmIXRdIIoJMFEEG6mr2wFky5acrEy
         hN8A==
X-Gm-Message-State: AOAM533bG63OpOFcvE/jVPY/zZBDoUdd90yaBXbUvrAJihqXAecwJwY1
        geTkEsUnBTjFYDnro9Gd67g=
X-Google-Smtp-Source: ABdhPJzqZMnLiXRYLA8U3cnfjpLrBrRRtX6+/y6HmfOHsQqdiaZHU+8gT5ZziXuR8b+OGDMHgh3MMg==
X-Received: by 2002:a17:90a:ed88:: with SMTP id k8mr3020248pjy.232.1600769234267;
        Tue, 22 Sep 2020 03:07:14 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id a18sm13705073pgw.50.2020.09.22.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 03:07:13 -0700 (PDT)
Date:   Tue, 22 Sep 2020 18:07:08 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v9 04/20] gpio: uapi: define uAPI v2
Message-ID: <20200922100708.GB493023@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-5-warthog618@gmail.com>
 <CAK8P3a1o4fp=-gU=SpwR540Xw+oySJ_ESkG+YXZJsDV-N6UF5w@mail.gmail.com>
 <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 11:50:51AM +0200, Bartosz Golaszewski wrote:
> On Tue, Sep 22, 2020 at 9:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Sep 22, 2020 at 4:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > +/**
> > > + * struct gpio_v2_line_attribute - a configurable attribute of a line
> > > + * @id: attribute identifier with value from &enum gpio_v2_line_attr_id
> > > + * @padding: reserved for future use and must be zero filled
> > > + * @flags: if id is GPIO_V2_LINE_ATTR_ID_FLAGS, the flags for the GPIO
> > > + * line, with values from enum gpio_v2_line_flag, such as
> > > + * GPIO_V2_LINE_FLAG_ACTIVE_LOW, GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed
> > > + * together.  This overrides the default flags contained in the &struct
> > > + * gpio_v2_line_config for the associated line.
> > > + * @values: if id is GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES, a bitmap
> > > + * containing the values to which the lines will be set, with each bit
> > > + * number corresponding to the index into &struct
> > > + * gpio_v2_line_request.offsets.
> > > + * @debounce_period_us: if id is GPIO_V2_LINE_ATTR_ID_DEBOUNCE, the desired
> > > + * debounce period, in microseconds
> > > + */
> > > +struct gpio_v2_line_attribute {
> > > +       __u32 id;
> > > +       __u32 padding;
> > > +       union {
> > > +               __aligned_u64 flags;
> > > +               __aligned_u64 values;
> > > +               __u32 debounce_period_us;
> > > +       };
> > > +};
> >
> > Having different-sized members in the union makes it hard for
> > something like strace to print the contents. How about just making
> > them all __aligned_u64 even when 32 bits are sufficient?
> >
> 
> Ah yes, adding support for GPIO ioctl()'s to strace has been on my
> TODO list for 3 years now. :(
> 

Great - you beat me to it - I was going to ask if we could fix strace
;-).  If it can be taught the id/union semantics I'd rather do that,
so we could then also format the 64-bit values appropriately.
e.g. flags and values are both bitmaps but the bits are interpreted
very differently.

Cheers,
Kent.

