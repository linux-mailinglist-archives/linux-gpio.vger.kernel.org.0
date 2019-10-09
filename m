Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5790D1353
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 17:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731452AbfJIP4g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 11:56:36 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34654 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731386AbfJIP4f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 11:56:35 -0400
Received: by mail-io1-f66.google.com with SMTP id q1so6169691ion.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 08:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GR7o+eNv7kgPh73rD0jcP7s45ZbT2IaZxj8AG/R3lzc=;
        b=nOqZwm/7/zZzaDTqxPXbyLSExdhAILBrrRtJo0fQgkXMIj8WBD4J6RXKB3YqJvCzgx
         B1T/geuLORsCaG6e1vgLngUvtVLtc99Tl12f5/rfP1X3duezvGVSihyGSMRNdbTDzPAy
         nHc9UYhF9pLVFTfvKj86+vWPJ7I93f5mtDOcpcRBkB1KlL8N+PWqWz/wJVaxZkrigY+H
         5EIGw5an00k7Z7Ztcn8kg42pupzivNjYh4j8Ptxv9sRV2Uj1sgHxMfye4N4CIC7dlEUA
         idudR1x4+6tjMrOoh9Xf88pUqZQb8QhSq9qDdsq+MVnUXKUOxgdZ65rh2yUlZEKCizqw
         xBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GR7o+eNv7kgPh73rD0jcP7s45ZbT2IaZxj8AG/R3lzc=;
        b=LkVs9LTm67AnT2WpzXHXEWMBqG7DnJSZx7YInvJT3HHiAOjb1h+E2ylhp9Sznl+31l
         OTTOQiN2WX4oJjwk/zupQcPmqJXKANROE8BfkMGtmV0Nl39v1wMtM1rdZTby/LOVtq9z
         TmET+75e7C7xLD7JyqyEbsfbIu2e6QstFUqb0UAmEFOTNNyMSA6bK9ow5fCmo8TKqE8U
         EHPfuorUVnjB8bPRIZNTioHnIiDUQfw85769pVr7BxOVqjM58lPAeHSXohBd6LmWmY52
         giqbj1OtKMbzWYK5pYWuSv/ZgZmlze+LBT9CZxpD1kqh2mbTWU3ZoQdTaSP/sLrVycL5
         6JSw==
X-Gm-Message-State: APjAAAWQzmj4d5dO6H0dmZ4Nb6R9aypfMeRCw767DSScsH4TFs3WiAlA
        0/9lfFfhYqdwEuDokuNTjXPR2KHXzxFNsT027z2GMA==
X-Google-Smtp-Source: APXvYqxgAkxzqC0IPQXoHEpD8vmzlbHn99plXWS1c0GxaTIn1KnSOIO9azzcxuKAIRubMki48EIKgdIGfhHZ17Y9utk=
X-Received: by 2002:a5d:93c7:: with SMTP id j7mr4214414ioo.167.1570636594293;
 Wed, 09 Oct 2019 08:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191009131901.16782-1-drew@pdp7.com>
In-Reply-To: <20191009131901.16782-1-drew@pdp7.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 9 Oct 2019 17:56:23 +0200
Message-ID: <CAMRc=Mf7CdnG_GBJY4+rhD5NGxqSFXCdBQbqC_xCAs_Bcy2o+g@mail.gmail.com>
Subject: Re: [PATCH] libgpoiod: add pull-up/pull-down flags for gpio lines
To:     Drew Fustini <drew@pdp7.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 9 pa=C5=BA 2019 o 15:22 Drew Fustini <drew@pdp7.com> napisa=C5=82=
(a):
>
> Add pull-up and pull-down flags to libgpiod now that libgpio in the kerne=
l
> supports these flags for linehandle_create() and lineevent_create().
>
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  bindings/cxx/gpiod.hpp        |  4 ++++
>  bindings/cxx/line_bulk.cpp    |  4 ++++
>  bindings/python/gpiodmodule.c | 14 ++++++++++++++
>  include/gpiod.h               |  4 ++++
>  lib/core.c                    |  8 ++++++++
>  5 files changed, 34 insertions(+)
>
> diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
> index 13b4d5b..0e53e89 100644
> --- a/bindings/cxx/gpiod.hpp
> +++ b/bindings/cxx/gpiod.hpp
> @@ -233,6 +233,10 @@ struct line_request
>         /**< The line is an open-source port. */
>         GPIOD_API static const ::std::bitset<32> FLAG_OPEN_DRAIN;
>         /**< The line is an open-drain port. */
> +       GPIOD_API static const ::std::bitset<32> FLAG_PULL_UP;
> +       /**< The line is has a configurable pull-up resistor */
> +       GPIOD_API static const ::std::bitset<32> FLAG_PULL_DOWN;
> +       /**< The line is has a configurable pull-down resistor */
>
>         ::std::string consumer;
>         /**< Consumer name to pass to the request. */
> diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
> index 8369930..7e583ba 100644
> --- a/bindings/cxx/line_bulk.cpp
> +++ b/bindings/cxx/line_bulk.cpp
> @@ -14,6 +14,8 @@ namespace gpiod {
>  const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW("001");
>  const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE("010");
>  const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN("100");
> +const ::std::bitset<32> line_request::FLAG_PULL_UP("101");
> +const ::std::bitset<32> line_request::FLAG_PULL_DOWN("111");
>
>  namespace {
>
> @@ -38,6 +40,8 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> re=
qflag_mapping =3D {
>         { line_request::FLAG_ACTIVE_LOW,        GPIOD_LINE_REQUEST_FLAG_A=
CTIVE_LOW, },
>         { line_request::FLAG_OPEN_DRAIN,        GPIOD_LINE_REQUEST_FLAG_O=
PEN_DRAIN, },
>         { line_request::FLAG_OPEN_SOURCE,       GPIOD_LINE_REQUEST_FLAG_O=
PEN_SOURCE, },
> +       { line_request::FLAG_PULL_UP,   GPIOD_LINE_REQUEST_FLAG_PULL_UP, =
},
> +       { line_request::FLAG_PULL_DOWN, GPIOD_LINE_REQUEST_FLAG_PULL_DOWN=
, },
>  };
>
>  } /* namespace */
> diff --git a/bindings/python/gpiodmodule.c b/bindings/python/gpiodmodule.=
c
> index 69edbbc..75f33ba 100644
> --- a/bindings/python/gpiodmodule.c
> +++ b/bindings/python/gpiodmodule.c
> @@ -60,6 +60,8 @@ enum {
>         gpiod_LINE_REQ_FLAG_OPEN_DRAIN          =3D GPIOD_BIT(0),
>         gpiod_LINE_REQ_FLAG_OPEN_SOURCE         =3D GPIOD_BIT(1),
>         gpiod_LINE_REQ_FLAG_ACTIVE_LOW          =3D GPIOD_BIT(2),
> +       gpiod_LINE_REQ_FLAG_PULL_UP             =3D GPIOD_BIT(3),
> +       gpiod_LINE_REQ_FLAG_PULL_DOWN           =3D GPIOD_BIT(4),
>  };
>
>  enum {
> @@ -1032,6 +1034,10 @@ static void gpiod_MakeRequestConfig(struct gpiod_l=
ine_request_config *conf,
>                 conf->flags |=3D GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE;
>         if (flags & gpiod_LINE_REQ_FLAG_ACTIVE_LOW)
>                 conf->flags |=3D GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW;
> +       if (flags & gpiod_LINE_REQ_FLAG_PULL_UP)
> +               conf->flags |=3D GPIOD_LINE_REQUEST_FLAG_PULL_UP;
> +       if (flags & gpiod_LINE_REQ_FLAG_PULL_DOWN)
> +               conf->flags |=3D GPIOD_LINE_REQUEST_FLAG_PULL_DOWN;
>  }
>
>  PyDoc_STRVAR(gpiod_LineBulk_request_doc,
> @@ -2396,6 +2402,14 @@ static gpiod_ModuleConst gpiod_ModuleConsts[] =3D =
{
>                 .name =3D "LINE_REQ_FLAG_ACTIVE_LOW",
>                 .value =3D gpiod_LINE_REQ_FLAG_ACTIVE_LOW,
>         },
> +       {
> +               .name =3D "LINE_REQ_FLAG_PULL_UP",
> +               .value =3D gpiod_LINE_REQ_FLAG_PULL_UP,
> +       },
> +       {
> +               .name =3D "LINE_REQ_FLAG_PULL_DOWN",
> +               .value =3D gpiod_LINE_REQ_FLAG_PULL_DOWN,
> +       },
>         { }
>  };
>
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 9860ea8..0fe8abd 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -792,6 +792,10 @@ enum {
>         /**< The line is an open-source port. */
>         GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW      =3D GPIOD_BIT(2),
>         /**< The active state of the line is low (high is the default). *=
/
> +       GPIOD_LINE_REQUEST_FLAG_PULL_UP =3D GPIOD_BIT(3),
> +       /**< The line can be configured for pull-up resistor */
> +       GPIOD_LINE_REQUEST_FLAG_PULL_DOWN       =3D GPIOD_BIT(4),
> +       /**< The line can be configured for pull-down resistor */
>  };
>
>  /**
> diff --git a/lib/core.c b/lib/core.c
> index a04514e..f13c752 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -494,6 +494,10 @@ static int line_request_values(struct gpiod_line_bul=
k *bulk,
>                 req.flags |=3D GPIOHANDLE_REQUEST_OPEN_SOURCE;
>         if (config->flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
>                 req.flags |=3D GPIOHANDLE_REQUEST_ACTIVE_LOW;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_UP)
> +               req.flags |=3D GPIOHANDLE_REQUEST_PULL_UP;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_DOWN)
> +               req.flags |=3D GPIOHANDLE_REQUEST_PULL_DOWN;
>
>         if (config->request_type =3D=3D GPIOD_LINE_REQUEST_DIRECTION_INPU=
T)
>                 req.flags |=3D GPIOHANDLE_REQUEST_INPUT;
> @@ -556,6 +560,10 @@ static int line_request_event_single(struct gpiod_li=
ne *line,
>                 req.handleflags |=3D GPIOHANDLE_REQUEST_OPEN_SOURCE;
>         if (config->flags & GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW)
>                 req.handleflags |=3D GPIOHANDLE_REQUEST_ACTIVE_LOW;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_UP)
> +               req.handleflags |=3D GPIOHANDLE_REQUEST_PULL_UP;
> +       if (config->flags & GPIOD_LINE_REQUEST_FLAG_PULL_DOWN)
> +               req.handleflags |=3D GPIOHANDLE_REQUEST_PULL_DOWN;
>
>         if (config->request_type =3D=3D GPIOD_LINE_REQUEST_EVENT_RISING_E=
DGE)
>                 req.eventflags |=3D GPIOEVENT_REQUEST_RISING_EDGE;
> --
> 2.20.1
>

Thanks Drew, this looks good, but it'll have to wait for the relevant
uAPI to be released in linux.

Bart
