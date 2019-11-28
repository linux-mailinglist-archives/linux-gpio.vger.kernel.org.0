Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3110C6A9
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Nov 2019 11:29:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfK1K3h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Nov 2019 05:29:37 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44667 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfK1K3g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Nov 2019 05:29:36 -0500
Received: by mail-ot1-f68.google.com with SMTP id c19so21789560otr.11
        for <linux-gpio@vger.kernel.org>; Thu, 28 Nov 2019 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+G7oZZMj6ZOZMpeqAy8kOQBtK+zeWOqSdsYlUES+uM8=;
        b=i4I9RbJxt7qubAhVdHXGYfGE/p67RoXCsCDoPYSD8BfN3l+1tXUaXqls1E9bzUkw6T
         CoWT+JSGu1fmMGESs4eaj3sJRs69izxtBRoLnhqdmXOIb02jnQXXdZ0Tac3rf0CJeIk9
         gifavAsJ83wu03Czm4PI4/IEi6F4JheUJBq/8gliS/wmCgY8aAsgSHZbyaYRDr0rY8Nd
         Vx4aLsiyMfH0/a+86D+ZrelIgmJLmn+tuUXb4NQmLMszrPbd+3sXlPhbEo0uhBJDIe9F
         YGJfihwkCCt3mMn0s9pw6RByilfft6RPTh90n5s1+VSqfBOjcBcETQXav0brRE2MilRu
         X3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+G7oZZMj6ZOZMpeqAy8kOQBtK+zeWOqSdsYlUES+uM8=;
        b=p6pMmjKAMkHElENdUOe0dKsEQfDGCrbCZP4ZqmXWLrPEQDl34LBf/Q7Zr3i5L9fZ2R
         M7MOtYZqNlDSEDdouzH0/RVzPgvEZP1gkUICDrlyFUuf/HNvzoZZQZo+sTNv64c7uO1U
         xUrRzQ0nURTpRz8GVjOTJoY046KJgaBzxWwimRV2BKSKsz0zQe/UynQjPyxFzFXWy02B
         qh4MYWR4+vl/6yzE3bzcP2KKBD/x5LSOg2fydHuJUd9AIygenouZMB7r668sElUwKD/O
         FY6Ru/etNjAtO5Matsrl1nGPBE4lR1YvaLkc4lkXUaUuvlM7ostzQ5KSg7Iow//sZMAT
         D6iw==
X-Gm-Message-State: APjAAAVmtmM3/Aome6iHGvFSy9wvZKxdUd1+71nf1EDmVUFx+poTVxBL
        upyy92yn82InUeWRrlXJjUFDhV3XNxnd/sGDt3lRLrRy
X-Google-Smtp-Source: APXvYqw3BDYRKeZoc1aWDhKb2OMNZ4BsGfAhCh3Kc5X5eLF13sCm3x36acw527HOGvfNOzVCOzjIS0lV3iF+rpEOqOo=
X-Received: by 2002:a05:6830:453:: with SMTP id d19mr6787309otc.256.1574936975974;
 Thu, 28 Nov 2019 02:29:35 -0800 (PST)
MIME-Version: 1.0
References: <20191125143157.26154-1-warthog618@gmail.com> <20191125143157.26154-10-warthog618@gmail.com>
In-Reply-To: <20191125143157.26154-10-warthog618@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 28 Nov 2019 11:29:25 +0100
Message-ID: <CAMpxmJUCYBywL1yRa4j9zYkDg7A1YyS9=f69fJ9-yZbdYjPBRw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 09/14] bindings: cxx: add support for SET_CONFIG
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 25 lis 2019 o 15:33 Kent Gibson <warthog618@gmail.com> napisa=C5=82(a=
):
>
> Add methods to support setting line configuration.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  bindings/cxx/gpiod.hpp     | 55 +++++++++++++++++++++++++
>  bindings/cxx/line.cpp      | 37 +++++++++++++++++
>  bindings/cxx/line_bulk.cpp | 83 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 175 insertions(+)
>
> diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
> index 2b1a6ab..dcae431 100644
> --- a/bindings/cxx/gpiod.hpp
> +++ b/bindings/cxx/gpiod.hpp
> @@ -381,6 +381,32 @@ public:
>          */
>         GPIOD_API void set_value(int val) const;
>
> +       /**
> +        * @brief Set configuration of this line.
> +        * @param direction New direction.
> +        * @param flags Replacement flags.
> +        * @param value New value (0 or 1) - only matters for OUTPUT dire=
ction.
> +        */
> +       GPIOD_API void set_config(int direction, ::std::bitset<32> flags,
> +                       int value =3D 0) const;

Please align this with the opening bracket. Same elsewhere.



> +
> +       /**
> +        * @brief Set configuration flags of this line.
> +        * @param flags Replacement flags.
> +        */
> +       GPIOD_API void set_flags(::std::bitset<32> flags) const;
> +
> +       /**
> +        * @brief Change the direction this line to input.
> +        */
> +       GPIOD_API void set_direction_input() const;
> +
> +       /**
> +        * @brief Change the direction this lines to output.
> +        * @param value New value (0 or 1).
> +        */
> +       GPIOD_API void set_direction_output(int value =3D 0) const;
> +
>         /**
>          * @brief Wait for an event on this line.
>          * @param timeout Time to wait before returning if no event occur=
red.
> @@ -648,6 +674,35 @@ public:
>          */
>         GPIOD_API void set_values(const ::std::vector<int>& values) const=
;
>
> +       /**
> +        * @brief Set configuration of all lines held by this object.
> +        * @param direction New direction.
> +        * @param flags Replacement flags.
> +        * @param values Vector of values to set. Must be the same size a=
s the
> +        *        number of lines held by this line_bulk.
> +        *        Only relevant for output direction requests.
> +        */
> +       GPIOD_API void set_config(int direction, ::std::bitset<32> flags,
> +                       const ::std::vector<int> values =3D std::vector<i=
nt>()) const;
> +
> +       /**
> +        * @brief Set configuration flags of all lines held by this objec=
t.
> +        * @param flags Replacement flags.
> +        */
> +       GPIOD_API void set_flags(::std::bitset<32> flags) const;
> +
> +       /**
> +        * @brief Change the direction all lines held by this object to i=
nput.
> +        */
> +       GPIOD_API void set_direction_input() const;
> +
> +       /**
> +        * @brief Change the direction all lines held by this object to o=
utput.
> +        * @param values Vector of values to set. Must be the same size a=
s the
> +        *        number of lines held by this line_bulk.
> +        */
> +       GPIOD_API void set_direction_output(const ::std::vector<int>& val=
ues) const;
> +
>         /**
>          * @brief Poll the set of lines for line events.
>          * @param timeout Number of nanoseconds to wait before returning =
an
> diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
> index dd6bb6a..a688b5d 100644
> --- a/bindings/cxx/line.cpp
> +++ b/bindings/cxx/line.cpp
> @@ -158,6 +158,43 @@ void line::set_value(int val) const
>         bulk.set_values({ val });
>  }
>
> +void line::set_config(int direction, ::std::bitset<32> flags,
> +                       int value) const
> +{
> +       this->throw_if_null();
> +
> +       line_bulk bulk({ *this });
> +
> +       bulk.set_config(direction, flags, { value });
> +}
> +
> +void line::set_flags(::std::bitset<32> flags) const
> +{
> +       this->throw_if_null();
> +
> +       line_bulk bulk({ *this });
> +
> +       bulk.set_flags(flags);
> +}
> +
> +void line::set_direction_input() const
> +{
> +       this->throw_if_null();
> +
> +       line_bulk bulk({ *this });
> +
> +       bulk.set_direction_input();
> +}
> +
> +void line::set_direction_output(int value) const
> +{
> +       this->throw_if_null();
> +
> +       line_bulk bulk({ *this });
> +
> +       bulk.set_direction_output({ value });
> +}
> +
>  bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
>  {
>         this->throw_if_null();
> diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
> index 5f1cac4..b8f5eb7 100644
> --- a/bindings/cxx/line_bulk.cpp
> +++ b/bindings/cxx/line_bulk.cpp
> @@ -176,6 +176,89 @@ void line_bulk::set_values(const ::std::vector<int>&=
 values) const
>                                           "error setting GPIO line values=
");
>  }
>
> +void line_bulk::set_config(int direction, ::std::bitset<32> flags,
> +                          const ::std::vector<int> values) const
> +{
> +       this->throw_if_empty();
> +
> +       if (!values.empty() && this->_m_bulk.size() !=3D values.size())
> +               throw ::std::invalid_argument("the number of default valu=
es must correspond with the number of lines");
> +
> +       ::gpiod_line_bulk bulk;
> +       int rv, gflags;
> +
> +       gflags =3D 0;
> +
> +       for (auto& it: reqflag_mapping) {
> +               if ((it.first & flags).to_ulong())
> +                       gflags |=3D it.second;
> +       }
> +
> +       this->to_line_bulk(::std::addressof(bulk));
> +
> +       rv =3D ::gpiod_line_set_config_bulk(::std::addressof(bulk), direc=
tion,
> +                                         gflags, values.data());
> +       if (rv)
> +               throw ::std::system_error(errno, ::std::system_category()=
,
> +                                         "error setting GPIO line config=
");
> +}
> +
> +void line_bulk::set_flags(::std::bitset<32> flags) const
> +{
> +       this->throw_if_empty();
> +
> +       ::gpiod_line_bulk bulk;
> +       int rv, gflags;
> +
> +       this->to_line_bulk(::std::addressof(bulk));
> +
> +       gflags =3D 0;
> +
> +       for (auto& it: reqflag_mapping) {
> +               if ((it.first & flags).to_ulong())
> +                       gflags |=3D it.second;
> +       }
> +
> +       rv =3D ::gpiod_line_set_flags_bulk(::std::addressof(bulk), gflags=
);
> +       if (rv)
> +               throw ::std::system_error(errno, ::std::system_category()=
,
> +                                         "error setting GPIO line flags"=
);
> +}
> +
> +void line_bulk::set_direction_input() const
> +{
> +       this->throw_if_empty();
> +
> +       ::gpiod_line_bulk bulk;
> +       int rv;
> +
> +       this->to_line_bulk(::std::addressof(bulk));
> +
> +       rv =3D ::gpiod_line_set_direction_input_bulk(::std::addressof(bul=
k));
> +       if (rv)
> +               throw ::std::system_error(errno, ::std::system_category()=
,
> +                       "error setting GPIO line direction to input");
> +}
> +
> +void line_bulk::set_direction_output(const ::std::vector<int>& values) c=
onst
> +{
> +       this->throw_if_empty();
> +
> +       if (values.size() !=3D this->_m_bulk.size())
> +               throw ::std::invalid_argument("the size of values array m=
ust correspond with the number of lines");
> +
> +       ::gpiod_line_bulk bulk;
> +       int rv;
> +
> +       this->to_line_bulk(::std::addressof(bulk));
> +
> +       rv =3D ::gpiod_line_set_direction_output_bulk(::std::addressof(bu=
lk),
> +                                                   values.data());
> +       if (rv)
> +               throw ::std::system_error(errno, ::std::system_category()=
,
> +                       "error setting GPIO line direction to output");
> +}
> +
>  line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeou=
t) const
>  {
>         this->throw_if_empty();
> --
> 2.24.0
>
