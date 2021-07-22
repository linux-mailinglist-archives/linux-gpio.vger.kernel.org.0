Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBA83D2246
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 12:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhGVKIc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Jul 2021 06:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhGVKIc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jul 2021 06:08:32 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA4AC061575
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jul 2021 03:49:06 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id a23-20020a05600c2257b0290236ec98bebaso2693896wmm.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jul 2021 03:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jzT40Is7RsmmV/mbwZcKkzzddQgJMDg9D44JSvQ79iY=;
        b=pDzKortj6n3pS3IWeyLUCFMc3H0HtGZ+SzCncqI2KQQVSJ5Op7PcNfX6dXNhKDnt7U
         B3wMYe+toQDTtaEHG2XdpSdOkTaudnOQZMBw+IM9KE+jJITg8hNIx2UgX566k6UOCxCj
         KNedDsoW25iTJZPTu9LCYshjpPdbtLXNC8uaYmuCvKOnU4nlht+JTZ178k9Kr2CULwEQ
         C3waOb9gFzjvT3TwD04UEqdQXXp2VjxyCoeMwrYh5WImbSXGgivpAZCVV7fDaTBcal0c
         EuiyIoOuGfhNsmfW7pzjBqrF+/h5F1S4sQnWKFp5/4JejuKG6NniJjo00yq3HMUBJQnx
         Jr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jzT40Is7RsmmV/mbwZcKkzzddQgJMDg9D44JSvQ79iY=;
        b=tCbOx/GewNS+H6CU0APWavqQJjj+NrtYASGUWcV2VmkkC8j5hrWA/2JJR2JwcopRu8
         hKB7y6SDQWG7lhRqiQaWrQ1aQxwjPrSb8fDU4RveQqHfHkFGeqdRqxbNx83gf4CYoaOl
         eaYJRXAsicZUxDudP5yrL2p0eiNIObp097vQ8GfsZgCyHhNabtr73aU5g0noND2luN7u
         JcMJlhtgfJ0hVjHlVLVMgyvcUshx76bBzfj2yIrZKEvhzwtMkeXROKo+4/0+BnTjsnKt
         vHRpBJ8YEjK38ZvyAhQbrYUfgJvpjjz7bJ4w+2IwCyGfC1gCpD4WT0IsFs70pioi+DOm
         ABEg==
X-Gm-Message-State: AOAM530Ou75kkN9QT4f/a+rzVzIw6z4BizEQ8ALQuz94WzpMNDVG3dty
        cMGIh+eM4taTlXlArbaQLCTpq5MUtOS81q1WseM=
X-Google-Smtp-Source: ABdhPJyrkqQBWFiQSXRQ/0jjHHvy2KnMjaFCjJrmuNj5RoBHpw9YrocgzBxrQChpNCEzlps0FxXg74RszNZMoZjGIOg=
X-Received: by 2002:a1c:1f47:: with SMTP id f68mr42188991wmf.58.1626950945209;
 Thu, 22 Jul 2021 03:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210715201001.23726-1-brgl@bgdev.pl> <20210715201001.23726-4-brgl@bgdev.pl>
 <20210715221803.GA16338@cephalopod> <CAMRc=Md0DWKBT0BJGdKDdhTN0gG3Jc4Mf71xUnYqqhxRPheR7Q@mail.gmail.com>
 <CAMRc=MdjjX0z=9hwvbE9mcx8J7twhb-j6yFFJqpqdZB1vfkHEg@mail.gmail.com> <CAMRc=MegRa=zde8i7UivLDrSS8sKabDNdHcovE=PnP=N9i+kqg@mail.gmail.com>
In-Reply-To: <CAMRc=MegRa=zde8i7UivLDrSS8sKabDNdHcovE=PnP=N9i+kqg@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Thu, 22 Jul 2021 11:48:54 +0100
Message-ID: <CAFhCfDZ-O31ZivvkUvOin+7T7STCBr4wdfwmAnXuHgGSYTB7qA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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

Hello Bartosz et al.,

Apologies for blowing hot and cold with regard to my contributions and
responses on this mailing list.  The last nine months have been an
incredibly busy time.

I would recommend using enum classes, as this offers better type
safety.  Best practice is to avoid the use of unscoped enums within
C++, especially of the anonymous variety.  There is now a set of ISO
C++ Core Guidelines (see
https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#main)
which offer sage advice for developing C++ software.  Just be aware
that one-size doesn't fit all and trying to maintain shared library
ABI compatibility would be considered an edge case which affects the
applicability of some guidance.  In time, maybe someone will
explicitly state which guidelines are exempt in a situation similar to
our own (i.e., providing ABI stable C++ interfaces to shared libraries
for major revisions).

ABI compatibility issues can be avoided by using one of the fixed
width integer types introduced in C++11 (e.g., std::uint8_t) as the
underlying type of the scoped enum class.

I would personally avoid adding the 'get_' prefix to 'getter' methods
of classes, although this choice is almost entirely aesthetical in
nature.

My advice would be to remove all anonymous unscoped enum definitions
from class definitions, instead defining them as scoped enum classes
using a suitable fixed-width integer type (i.e., std::uint8_t) outside
the dependent classes.  Then, within the definitions of dependent
classes, you can define publicly scoped type aliases for these enum
class types (using the suffix '_type' for these aliases, as is
commonly seen with other C++ libraries).  See my rough example below
for illustrative purposes only.  This is a familiar approach and will
rectify your current issue with naming collisions.

namespace gpiod {

enum class direction : std::uint8_t {
    INPUT = 1,
    OUTPUT
};

class line_info {
public:
    using direction_type = ::gpiod::direction;

    direction_type direction () const {
        return _m_direction;
    }

private:
    direction_type _m_direction;
};

}

If time permits, I'll do a proper review of your changes (however, I
emigrate in less than a week, so I'm still rather busy at the moment).

Best,
Jack
