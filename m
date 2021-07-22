Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206073D2CDF
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 21:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhGVS6B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 14:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhGVS56 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jul 2021 14:57:58 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909E9C061575
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jul 2021 12:38:32 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id l26so8205517eda.10
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jul 2021 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nwJVtqa+jC0PRTajEzYaH2usHWDezYM4NEn3a7paVp8=;
        b=pUnfSKAEtLQw2eeK2kqbhIFmCSPqYzGImXWCJd8Z91lrLNOQQtVpyI6yGeHBVEqcj2
         iRGr9rp2AG+fWP3o2qG/Lp7L44y2iUG2dSyOv5ItUnIa+ZUmihOXIzxrg0XSSAzOlQ/u
         lvvhr1IxdSoH6z36SDKCMtMP+vDzt/LgumSyw+vGQN3H1JUAlOHQRWHrt4qbDr/jwat0
         bcRW/6r6sGIV+1UtkMNWUmRvKqZVncJnYpYr4kyrmH7kOznhk1IIIeXeKK20mpvYEb9R
         1LfZfxRtP99LIj2c3HBsJ3/hBxtM5TI1caqkiu4OC1PBKycWSPc+c20K/nxj9r0An12H
         NPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nwJVtqa+jC0PRTajEzYaH2usHWDezYM4NEn3a7paVp8=;
        b=TPE//NtyMesibGZBUcC1iqrw94JFO/mNFuRD35KSBOgEJvI3nkeE0gIWIYuI4oB0Cj
         SWwLjtIT0pjy8pb37Z8QmXMhQMcT8PGES1jofXxwMjA9z3RqJ3iYc8EA1IgXUAAywHUh
         Uzb0Mp9pXpFBWmJP+1APnm30UDp0x0UdUPKweZPN5/4K2zRbOan3aNXB1EMbu8a63LsP
         /jYCxIEQRJXdH+itZkt8dRg+DlEIaS38nB8WzZBeS3TFdxPw6twYDcznOdOXhkCMfFGO
         N01u+rtaVYShzhPL+CqyDirU1KAfiXBEmDVYcWPDMSn8X41XWwauW04Nu+XxDbaZHIXA
         CK0g==
X-Gm-Message-State: AOAM531m7zrKy5UM4buTteOXpfzHq7G/KeITq9GpmZRZFiwsTFDAJQxr
        z7spySFMgtEe/VYIRsN5PEG17Gihd6RG6p1qtKHmfw==
X-Google-Smtp-Source: ABdhPJzPyE3FS16hgA7EYbam7IG6F1zNpJtYrH9HFLNDm+rPmDVFP69BEnzwENwRSkvASrzJGMQPoR+8o6LwLoNwDxo=
X-Received: by 2002:a05:6402:3489:: with SMTP id v9mr1426829edc.124.1626982711174;
 Thu, 22 Jul 2021 12:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210715201001.23726-1-brgl@bgdev.pl> <20210715201001.23726-4-brgl@bgdev.pl>
 <20210715221803.GA16338@cephalopod> <CAMRc=Md0DWKBT0BJGdKDdhTN0gG3Jc4Mf71xUnYqqhxRPheR7Q@mail.gmail.com>
 <CAMRc=MdjjX0z=9hwvbE9mcx8J7twhb-j6yFFJqpqdZB1vfkHEg@mail.gmail.com>
 <CAMRc=MegRa=zde8i7UivLDrSS8sKabDNdHcovE=PnP=N9i+kqg@mail.gmail.com> <CAFhCfDZ-O31ZivvkUvOin+7T7STCBr4wdfwmAnXuHgGSYTB7qA@mail.gmail.com>
In-Reply-To: <CAFhCfDZ-O31ZivvkUvOin+7T7STCBr4wdfwmAnXuHgGSYTB7qA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 22 Jul 2021 21:38:20 +0200
Message-ID: <CAMRc=McY3J4TpVt738n-zVOL=RK+Y2Lq=fhf5QARU1NAbvXcPQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
To:     Jack Winch <sunt.un.morcov@gmail.com>
Cc:     Ben Hutchings <ben.hutchings@essensium.com>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 22, 2021 at 12:49 PM Jack Winch <sunt.un.morcov@gmail.com> wrote:
>
> Hello Bartosz et al.,
>
> Apologies for blowing hot and cold with regard to my contributions and
> responses on this mailing list.  The last nine months have been an
> incredibly busy time.
>
> I would recommend using enum classes, as this offers better type
> safety.  Best practice is to avoid the use of unscoped enums within
> C++, especially of the anonymous variety.  There is now a set of ISO
> C++ Core Guidelines (see
> https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#main)
> which offer sage advice for developing C++ software.  Just be aware
> that one-size doesn't fit all and trying to maintain shared library
> ABI compatibility would be considered an edge case which affects the
> applicability of some guidance.  In time, maybe someone will
> explicitly state which guidelines are exempt in a situation similar to
> our own (i.e., providing ABI stable C++ interfaces to shared libraries
> for major revisions).
>
> ABI compatibility issues can be avoided by using one of the fixed
> width integer types introduced in C++11 (e.g., std::uint8_t) as the
> underlying type of the scoped enum class.
>
> I would personally avoid adding the 'get_' prefix to 'getter' methods
> of classes, although this choice is almost entirely aesthetical in
> nature.
>
> My advice would be to remove all anonymous unscoped enum definitions
> from class definitions, instead defining them as scoped enum classes
> using a suitable fixed-width integer type (i.e., std::uint8_t) outside
> the dependent classes.  Then, within the definitions of dependent
> classes, you can define publicly scoped type aliases for these enum
> class types (using the suffix '_type' for these aliases, as is
> commonly seen with other C++ libraries).  See my rough example below
> for illustrative purposes only.  This is a familiar approach and will
> rectify your current issue with naming collisions.
>
> namespace gpiod {
>
> enum class direction : std::uint8_t {
>     INPUT = 1,
>     OUTPUT
> };
>
> class line_info {
> public:
>     using direction_type = ::gpiod::direction;
>
>     direction_type direction () const {
>         return _m_direction;
>     }
>
> private:
>     direction_type _m_direction;
> };
>
> }
>
> If time permits, I'll do a proper review of your changes (however, I
> emigrate in less than a week, so I'm still rather busy at the moment).
>
> Best,
> Jack

Oh, nice, wish you all the best!

Is there any disadvantage to declaring the scoped class enums as
subtypes within the concerned classes?

I was thinking of:

class line_info
{
public
    class direction
    {
        INPUT = 1,
        OUTPUT,
    };

    direction get_direction(void) const;
};

I also don't like get_<property> style methods but IMO

direction get_direction(void) const;

is better than

direction_type direction(void) const;

Thanks for the link, I'll try to find some time to read it.

Bartosz
