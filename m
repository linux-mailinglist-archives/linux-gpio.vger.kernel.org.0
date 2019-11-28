Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51FAE10C6A6
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 11:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfK1K3S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 05:29:18 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35848 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfK1K3R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 05:29:17 -0500
Received: by mail-oi1-f195.google.com with SMTP id c16so752858oic.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 02:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VAHmih53L4RRjRHpAabe0Ndmf/iybqABavviaTOsnZM=;
        b=z8PXuIRr6+FzNv5Vb56lPRJLayKJSuFiDDfnhAAm4JtvULmVhsUj/SBuecT4oOs6z2
         kf1UDQ1xgRIhqTb7KawKWtCTiyp3pRI0ykT7KaQSvRLInRlJxFSvsQxIc1mwkXGBoY1f
         VJa5gIXly5lEYifaIo3HmjtHFirHILh8GftcP9+OgOoQFwBHvotDPGSVN+7FUdeAkCvg
         vXhX+fsCWZUmyP7MShgphlKmiqPKX8r/1ACQKteEcRMar8daESURGzTJBwc6sxgYvM+H
         FsDu8OwCHTrH3YTzAeObt7tf4MCGTFqHEMk0ptGNxqitc/ZglrcrCLe7pqMOFl68LWnP
         o0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VAHmih53L4RRjRHpAabe0Ndmf/iybqABavviaTOsnZM=;
        b=X4YWcS9UAQ00eSHXyu0UAkwjjLDn9zFpybr6Nn1qnBlCB8WUmQmAzF2DFqAsZ3cD4X
         kTeO9c6cRlC+CPflF2m9KaOGK1jkcuphUSIqAE8Di8PJ7xA6reLuJn2cvBuXzSS1HvzL
         Lz9Q/ximtvW/m+xE3QPqnGJrWqjNypfuaIisnsDvlvcVu00O68gGmbzkP/zLflaWtm3w
         hfnqUcGRHRq2EZhbJB9LzVcPr+1wUGiUHChzTzXMt8RmrnJIG1dD6OvQWMOQO6LgO4K6
         Slok5bNiFuG7eEA9fx8GATSrsKtzjvYAL8NKPpfiGY/1A/1Lq7Asi+7PaAg87TgLLHjO
         3WRg==
X-Gm-Message-State: APjAAAXHJHOIVpeEPYOjoCI7jLQFKo+IdJyDTDh0o5fcGiyaZ1vQTJi3
        DXyhBYFnaI0rGfnbPO3dZeKyd2sI4pxDsmnCidKXKYrq
X-Google-Smtp-Source: APXvYqwFHEAc/FnfmwWsB/1dp5+zLuGYFlNrVCpjCS6uurlcW0XiXWK0aavOS/e4NrBO1Maxs8fgodcYhaNoklx9I/Q=
X-Received: by 2002:a05:6808:498:: with SMTP id z24mr8143580oid.114.1574936956471;
 Thu, 28 Nov 2019 02:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20191125143157.26154-1-warthog618@gmail.com> <20191125143157.26154-4-warthog618@gmail.com>
In-Reply-To: <20191125143157.26154-4-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Nov 2019 11:29:05 +0100
Message-ID: <CAMpxmJUV043DxspgRpb9oCt-1TE4JyicegO8ahgmtzNG50auug@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 03/14] bindings: cxx: add support for bias flags
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 lis 2019 o 15:32 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Add support for bias flags in line requests and returning the line bias
> setting via a bias accessor.
>
> Based on initial work by Drew Fustini <drew@pdp7.com>.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/cxx/gpiod.hpp     | 26 ++++++++++++++++++++++++++
>  bindings/cxx/line.cpp      | 19 +++++++++++++++++++
>  bindings/cxx/line_bulk.cpp |  6 ++++++
>  3 files changed, 51 insertions(+)
>
> diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
> index b5a9401..2b1a6ab 100644
> --- a/bindings/cxx/gpiod.hpp
> +++ b/bindings/cxx/gpiod.hpp
> @@ -233,6 +233,12 @@ struct line_request
>         /**< The line is an open-source port. */
>         GPIOD_API static const ::std::bitset<32> FLAG_OPEN_DRAIN;
>         /**< The line is an open-drain port. */
> +       GPIOD_API static const ::std::bitset<32> FLAG_BIAS_DISABLE;
> +       /**< The line has neither pull-up nor pull-down resistor enabled =
*/
> +       GPIOD_API static const ::std::bitset<32> FLAG_BIAS_PULL_DOWN;
> +       /**< The line has a configurable pull-down resistor enabled */
> +       GPIOD_API static const ::std::bitset<32> FLAG_BIAS_PULL_UP;
> +       /**< The line has a configurable pull-up resistor enabled */
>
>         ::std::string consumer;
>         /**< Consumer name to pass to the request. */
> @@ -320,6 +326,12 @@ public:
>          */
>         GPIOD_API int active_state(void) const;
>
> +       /**
> +        * @brief Get current bias of this line.
> +        * @return Current bias setting.
> +        */
> +       GPIOD_API int bias(void) const;
> +
>         /**
>          * @brief Check if this line is used by the kernel or other user =
space
>          *        process.
> @@ -456,6 +468,20 @@ public:
>                 /**< Line's active state is high. */
>         };
>
> +       /**
> +        * @brief Possible bias settings.
> +        */
> +       enum : int {
> +               BIAS_AS_IS =3D 1,
> +               /**< Line's bias state is unknown. */
> +               BIAS_DISABLE,
> +               /**< Line's internal bias is disabled. */
> +               BIAS_PULL_UP,
> +               /**< Line's internal pull-up bias is enabled. */
> +               BIAS_PULL_DOWN,
> +               /**< Line's internal pull-down bias is enabled. */
> +       };
> +
>  private:
>
>         line(::gpiod_line* line, const chip& owner);
> diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
> index df6eada..dd6bb6a 100644
> --- a/bindings/cxx/line.cpp
> +++ b/bindings/cxx/line.cpp
> @@ -67,6 +67,25 @@ int line::active_state(void) const
>         return active =3D=3D GPIOD_LINE_ACTIVE_STATE_HIGH ? ACTIVE_HIGH :=
 ACTIVE_LOW;
>  }
>
> +int line::bias(void) const
> +{
> +       this->throw_if_null();
> +
> +       int bias =3D ::gpiod_line_bias(this->_m_line);
> +
> +       switch (bias) {
> +       case GPIOD_LINE_BIAS_PULL_UP:
> +               return BIAS_PULL_UP;
> +       case GPIOD_LINE_BIAS_PULL_DOWN:
> +               return BIAS_PULL_DOWN;
> +       case GPIOD_LINE_BIAS_DISABLE:
> +               return BIAS_DISABLE;
> +       case GPIOD_LINE_BIAS_AS_IS:
> +       default:
> +               return BIAS_AS_IS;
> +       }

I think that for consistency with other mappings, this can be made
shorter by using std::map - please see line_bulk.cpp.

Bart


> +}
> +
>  bool line::is_used(void) const
>  {
>         this->throw_if_null();
> diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
> index c708c8b..5f1cac4 100644
> --- a/bindings/cxx/line_bulk.cpp
> +++ b/bindings/cxx/line_bulk.cpp
> @@ -14,6 +14,9 @@ namespace gpiod {
>  const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
>  const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
>  const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
> +const ::std::bitset<32> line_request::FLAG_BIAS_DISABLE(GPIOD_BIT(3));
> +const ::std::bitset<32> line_request::FLAG_BIAS_PULL_DOWN(GPIOD_BIT(4));
> +const ::std::bitset<32> line_request::FLAG_BIAS_PULL_UP(GPIOD_BIT(5));
>
>  namespace {
>
> @@ -38,6 +41,9 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> re=
qflag_mapping =3D {
>         { line_request::FLAG_ACTIVE_LOW,        GPIOD_LINE_REQUEST_FLAG_A=
CTIVE_LOW, },
>         { line_request::FLAG_OPEN_DRAIN,        GPIOD_LINE_REQUEST_FLAG_O=
PEN_DRAIN, },
>         { line_request::FLAG_OPEN_SOURCE,       GPIOD_LINE_REQUEST_FLAG_O=
PEN_SOURCE, },
> +       { line_request::FLAG_BIAS_DISABLE,      GPIOD_LINE_REQUEST_FLAG_B=
IAS_DISABLE, },
> +       { line_request::FLAG_BIAS_PULL_DOWN,    GPIOD_LINE_REQUEST_FLAG_B=
IAS_PULL_DOWN, },
> +       { line_request::FLAG_BIAS_PULL_UP,      GPIOD_LINE_REQUEST_FLAG_B=
IAS_PULL_UP, },
>  };
>
>  } /* namespace */
> --
> 2.24.0
>
