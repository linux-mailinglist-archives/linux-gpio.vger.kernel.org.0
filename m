Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B593B273EDD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 11:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgIVJvE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 05:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIVJvD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 05:51:03 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAC7C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 02:51:03 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id j11so22004053ejk.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2020 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bQvtQGp/KLFnOLWRiqixFEpZAYTNPr5oScyrlQ2lzEE=;
        b=gITCHOxwcSAAjU4PnfdGZe3rwfIVDR1qijRZJNtrZIA1InVYlvJYzUqxNBSnK1X6hQ
         M/RwWjL2dyy4WUKoNQKxAmkluClAPweuDuIAz5RGRNpyOqShf009zsMqwXn8Rgdj/Rux
         q41yQdLuEoSTVTqFdHLboC9HgOuHw7zoGGQYGEtjwizZHBygu60Ta0k5GLK+iH5Sbhmz
         ZHs1kdtRPBOKWnOAw+2GgEwfDPlgCtMD+1Fr/V2+PBlGX/br98FPwMp4zZHn1PvpOYFl
         iQSqyIq+wpbC7mgsH8ZTGW/ClWv7OUKv5P2pMQYlAgqd/PuCPLzwfGr1zJDi1yYdj+Jc
         6ZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bQvtQGp/KLFnOLWRiqixFEpZAYTNPr5oScyrlQ2lzEE=;
        b=Phr94cFDAUE4LdWyPPSSkgdmrP8/D1AttXN5ca2AIOdaoXGnslck07AWdEuR6LnfvA
         angO0XHKuFnFMwa8Z60y8D6s3gfiOhnaoVuE9HG8PDgm1Qq8oVQ4NJ2OPlZ+ZDe3AglJ
         /iDoK7tVF+slOURlvCdM9IMhhLcCa5fO0zUiGSNmJIUVM9BfJoUO31Da54+pqbo4neR+
         m3gAylvVrWEHYS/D1y1DFkq/rh2gDwN71mzxaxYqzdYT/DsLSkiyWH7Spxt7UAxuToQd
         1tGEriI7ZVq7K2Fh1HghN4WMewfml211MMerl0gIUZrgLUPBvtDGEcs8sX9fUF5g78Es
         zmzQ==
X-Gm-Message-State: AOAM532lrCXnhWkrv1vmhOhqeSZmBmDMmSWFoH3723ReVW31OTSrT+hJ
        3Jx44U7SBgepz18QEvBGzHulOIjSm4GwcU9U/Zbblg==
X-Google-Smtp-Source: ABdhPJzaBEcyCGW7WNUhuR8Tr7ShGD6abB/Jtu00c5ucwh99NpYGEHAN/AgbDOEWtR0GofHwARgZG2Hzcya5vK/+3SE=
X-Received: by 2002:a17:906:11d2:: with SMTP id o18mr3838714eja.420.1600768262126;
 Tue, 22 Sep 2020 02:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-5-warthog618@gmail.com>
 <CAK8P3a1o4fp=-gU=SpwR540Xw+oySJ_ESkG+YXZJsDV-N6UF5w@mail.gmail.com>
In-Reply-To: <CAK8P3a1o4fp=-gU=SpwR540Xw+oySJ_ESkG+YXZJsDV-N6UF5w@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 22 Sep 2020 11:50:51 +0200
Message-ID: <CAMpxmJVsBYY0w5BCyYaRDGR-cQD7o4VkJRatc0Ww5wXRA+3bhA@mail.gmail.com>
Subject: Re: [PATCH v9 04/20] gpio: uapi: define uAPI v2
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 9:41 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Sep 22, 2020 at 4:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> > +/**
> > + * struct gpio_v2_line_attribute - a configurable attribute of a line
> > + * @id: attribute identifier with value from &enum gpio_v2_line_attr_id
> > + * @padding: reserved for future use and must be zero filled
> > + * @flags: if id is GPIO_V2_LINE_ATTR_ID_FLAGS, the flags for the GPIO
> > + * line, with values from enum gpio_v2_line_flag, such as
> > + * GPIO_V2_LINE_FLAG_ACTIVE_LOW, GPIO_V2_LINE_FLAG_OUTPUT etc, OR:ed
> > + * together.  This overrides the default flags contained in the &struct
> > + * gpio_v2_line_config for the associated line.
> > + * @values: if id is GPIO_V2_LINE_ATTR_ID_OUTPUT_VALUES, a bitmap
> > + * containing the values to which the lines will be set, with each bit
> > + * number corresponding to the index into &struct
> > + * gpio_v2_line_request.offsets.
> > + * @debounce_period_us: if id is GPIO_V2_LINE_ATTR_ID_DEBOUNCE, the desired
> > + * debounce period, in microseconds
> > + */
> > +struct gpio_v2_line_attribute {
> > +       __u32 id;
> > +       __u32 padding;
> > +       union {
> > +               __aligned_u64 flags;
> > +               __aligned_u64 values;
> > +               __u32 debounce_period_us;
> > +       };
> > +};
>
> Having different-sized members in the union makes it hard for
> something like strace to print the contents. How about just making
> them all __aligned_u64 even when 32 bits are sufficient?
>

Ah yes, adding support for GPIO ioctl()'s to strace has been on my
TODO list for 3 years now. :(

> > +struct gpio_v2_line_request {
> > +       __u32 offsets[GPIO_V2_LINES_MAX];
> > +       char consumer[GPIO_MAX_NAME_SIZE];
> > +       struct gpio_v2_line_config config;
> > +       __u32 num_lines;
> > +       __u32 event_buffer_size;
> > +       /* Pad to fill implicit padding and reserve space for future use. */
> > +       __u32 padding[5];
> > +       __s32 fd;
> > +};
>
> > +struct gpio_v2_line_info {
> > +       char name[GPIO_MAX_NAME_SIZE];
> > +       char consumer[GPIO_MAX_NAME_SIZE];
> > +       __u32 offset;
> > +       __u32 num_attrs;
> > +       __aligned_u64 flags;
> > +       struct gpio_v2_line_attribute attrs[GPIO_V2_LINE_NUM_ATTRS_MAX];
> > +       /* Space reserved for future use. */
> > +       __u32 padding[4];
> > +};
>
> These are both several hundred bytes long, requiring a lot of data
> to be copied to the stack and take up space there. I see this is not
> actually much different for the v1 API, but I wonder if there has been
> any analysis of whether this has a noticeable effect on application
> runtime.
>

The main difference between this and V1 is that we can now pass
arguments for flags as defined in struct gpio_v2_line_attribute. I
haven't measured the impact but first: this is not a hot path
(retrieving line info is not done a lot like reading line events or
setting/getting values), and second: this structure is 280 bytes long
which is still less than a page so we should not face more context
switches than with a smaller structure, right?

Bartosz
