Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD7281006D0
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Nov 2019 14:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbfKRNvz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Nov 2019 08:51:55 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40290 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726739AbfKRNvy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Nov 2019 08:51:54 -0500
Received: by mail-oi1-f195.google.com with SMTP id d22so8390565oic.7
        for <linux-gpio@vger.kernel.org>; Mon, 18 Nov 2019 05:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xDWgXHdE8gRlajU7D0XMvNQyFkmd96RBvQrzvRsOepo=;
        b=Krsy8i+IQ7x0+/Qg5VZIK3mKk0tcAqbpa0Fu9agWJA719IayDft97MsYctnnzWOG66
         86SfTFR0Gjt3TWvgZ/cOM5L7imi2xxeZ6pO935wZ8fDMaCznozrh4/UFg9VnvFPxz3Ig
         84q+My+1tWOCvdsm3ra/UOuP7NuDR+7Pgz7SAeZ70MgvDKThCdkw4CF7rQg9q5oWsR/9
         hBXxAOFFEdDDtxkYJEHnkkxV5MYuK1LdTUgJ55hw19mnDe7fIhRBrbVEg85MJ1HjROf/
         nqb/292axYxSki07F2PzJN5qIR9kaaAu0tJxfSNYKyJkWvWjSvk/MEzO/fQpx5ygqhMP
         Ug/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xDWgXHdE8gRlajU7D0XMvNQyFkmd96RBvQrzvRsOepo=;
        b=Eb1oPUr/C7Lu0OsAmQ2/cPuqSkeH5uX/sD2jvTUXuW/NkstoVuX5ehdqohL9grWL0I
         43avgBvWoJM1eZasfOURlMuCwaeCWgcPnkk9esY798QvrMIcQ2FYacZyq/Aelg1DZySW
         fr0oEnl9QIzyzeTvNDsp5BwyIsRnW8GPetw1GUBG+NlKo383lwe0fR8BtoLO63jaxdDT
         aV0bcClyIpXqjhiUYyTPvMNWwuQoYV7l/Xhey2nzJqGk+Sh4mzPv8U80DplcwweBylDm
         MMjIAhtAJZ8TathN0MWIIYs5u8FhS0SPYtjdmVSU0z8CKR5t3vp2XkIvsPygHu/k05T+
         Kpww==
X-Gm-Message-State: APjAAAU7B9s20HhM6bCDsYJtlIhYTHW7GqUws1BL6NhkHWt6vJLeETPc
        d/8uNA+BkULXtmXBNI2tahZQo1NUicqgRxaEpFUAAg==
X-Google-Smtp-Source: APXvYqxjbJ4uiZYz7H1r5gbjTjobgvI7yegveANlV3CZiTdRY8y7bjCkONDifpn/TsR2QYtYa+DIDUk0XSoiudghwNI=
X-Received: by 2002:a05:6808:498:: with SMTP id z24mr20380786oid.114.1574085113409;
 Mon, 18 Nov 2019 05:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20191115144355.975-1-warthog618@gmail.com> <20191115144355.975-7-warthog618@gmail.com>
In-Reply-To: <20191115144355.975-7-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 18 Nov 2019 14:51:42 +0100
Message-ID: <CAMpxmJUeWMt1AWn7H1BOegW+Tc2MJB7YPS1TpouSFg+qAwRDsA@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 06/19] bindings: cxx: initialise bitset with
 integer instead of string
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 15 lis 2019 o 15:44 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a)=
:
>
> Initialising bitsets with string is inefficient and confusing.
> Initialise them with the corresponding int instead.
>

I'm not a native English speaker, of course, so correcting you on
spelling may be risky but I generally try to stick to American
spelling so "initialise" looks somehow wrong to me. :) Anyway, this is
just the commit message, so never mind that.

> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/cxx/line_bulk.cpp | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
> index 8369930..c708c8b 100644
> --- a/bindings/cxx/line_bulk.cpp
> +++ b/bindings/cxx/line_bulk.cpp
> @@ -11,9 +11,9 @@
>
>  namespace gpiod {
>
> -const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW("001");
> -const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE("010");
> -const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN("100");
> +const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
> +const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
> +const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
>
>  namespace {
>
> --
> 2.24.0
>
