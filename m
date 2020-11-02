Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BC02A2E8B
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Nov 2020 16:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgKBPng (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Nov 2020 10:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgKBPnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Nov 2020 10:43:35 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF88C061A47
        for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2020 07:43:35 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id j24so19449305ejc.11
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2020 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nS8GcWnRvgAze9eGONKgTm54dvXOecWjyagLlZce7Is=;
        b=GeZOTcELL0wHCC2LsYMp4AHDK/U4F0TpiMBx0TLSL9ySl4L4C8XcHcbUz5fZNLjniM
         TuvyR4acGxkL9PjF4zrWBiY258C6IcsF0J9LR6SowCpPKmCKno9m8GSu4pQU9/WnDZH7
         7UkFNkQaU4R7nVWteNdPvBIJxPPgU8WHblr0zM6zQdwUqyKaEmqLaDFu3SLFEdkz8070
         +tw2ItP8FRhBWa/R+2tqWgkisP8VzJCQvEhMDs6cgObDq+FQOIe0RTsRoPUGJizua2af
         DerEr/5gFY6bKe9hU6ejx4bsKfOsV8bd9SlGakYbkn/eCz8qeemmHfgRz2JwvgXFT4AO
         tsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nS8GcWnRvgAze9eGONKgTm54dvXOecWjyagLlZce7Is=;
        b=srYPqI47GHEQDwXHt/KN1+byzh/T/hmf9tcKA6ueng84Alk1v+O4GtlOU3n1vVa5dQ
         N0qM5Q1HWO7M0jByTYzE6/xSaH94Mrfvcte77p9sTFpnWgCq/oWtMdw6ip7BRqSJIPm+
         CwywyueDkZVyS490b77KtoFE2CvlUyOD5GEhlGxI61NyuNYMiw2J4pKStqZw57BtP0lT
         wFtVb+JxHBDO2fmQIU6zZsBCyIvZQL5MWnWE8CVrM3mRO4GQaF2XC1M3Ry+IjdtqxZsj
         n0rAJiAlGt63dosYQ9w7MBr2dVjzacmoHdiqRGyAC6k1CQPxt9RE7Hq1Zek/icBQqZ7v
         5tmw==
X-Gm-Message-State: AOAM5317Hy5eNO1FPSigbZfdIvKet7uMYgOG9iAu3INYxfYi7p6XyDGY
        jVPi9itixSrovLA8VsgZmlxcz7HWfGrd2uhznyuy4g==
X-Google-Smtp-Source: ABdhPJyfQCPRUI5fZkO4PkZURO7NzoV9R0m8AUPk0K6Fot5LT+TZuLggUEPGTEcOXrVbpzMXVwNY7147yllEhTQsoPY=
X-Received: by 2002:a17:906:1c84:: with SMTP id g4mr2189231ejh.155.1604331814011;
 Mon, 02 Nov 2020 07:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20201102152037.963-1-brgl@bgdev.pl> <20201102152037.963-2-brgl@bgdev.pl>
 <20201102154101.GO27442@casper.infradead.org>
In-Reply-To: <20201102154101.GO27442@casper.infradead.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 2 Nov 2020 16:43:22 +0100
Message-ID: <CAMpxmJUOb+tR25_h0R1kq7K0d=4DpmutW_V6UggL-+u8u3271g@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] mm: slab: provide krealloc_array()
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-drm <dri-devel@lists.freedesktop.org>,
        linaro-mm-sig@lists.linaro.org,
        LKML <linux-kernel@vger.kernel.org>, linux-edac@vger.kernel.org,
        linux-gpio <linux-gpio@vger.kernel.org>, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        netdev <netdev@vger.kernel.org>, linux-mm@kvack.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 2, 2020 at 4:41 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Nov 02, 2020 at 04:20:30PM +0100, Bartosz Golaszewski wrote:
> > +Chunks allocated with `kmalloc` can be resized with `krealloc`. Similarly
> > +to `kmalloc_array`: a helper for resising arrays is provided in the form of
> > +`krealloc_array`.
>
> Is there any reason you chose to `do_this` instead of do_this()?  The
> automarkup script turns do_this() into a nice link to the documentation
> which you're adding below.
>

No, I just didn't know better. Thanks for bringing this to my attention.

> Typo 'resising' resizing.

Will fix in the next iteration.

Bartosz
