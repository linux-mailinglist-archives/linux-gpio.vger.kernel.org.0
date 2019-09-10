Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB1ACAE843
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 12:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388874AbfIJKfn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 06:35:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36912 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388708AbfIJKfl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 06:35:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id y5so5069363lji.4
        for <linux-gpio@vger.kernel.org>; Tue, 10 Sep 2019 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E17t9nsKObBUkkD0LBm1VvJsFUJUtomTh2F3C0pWBBg=;
        b=PxhAh1UA8/oxprqJ7vDTf4uNmw227REjjRYuMyrolLKKSoSEgnh4cKGRvvpCuVjjZb
         nTf7VTzl9FGS0WkPSHPqToRkOt3u2EibIaVFUW8xSBHs1O7BFylaxXmkkalSa4Dcv3kv
         GeRRA1HkVQnhC57raCgO4fm2Q0GBaeVgUUDJN6J4gkSDMaK8RRJOGehAOe2aP/7eT+CY
         yIh+DdshLaahOo1WDyvWvwyUT/vIZ4HZKeqFUhnDxTUBD7VRITghxXud1IRCNRvZTWwk
         fAzO9tOPqPBORXMLoL5lreJqxy3KytBYbFw+u4cND0CPJF1jE9kZyw01WLVi/pq0YY7G
         e8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E17t9nsKObBUkkD0LBm1VvJsFUJUtomTh2F3C0pWBBg=;
        b=FB67s7O70phDqo5lzD2hDGeIxcsxXpL/63mAvNaPQXuzVeHARBEdc0aFgnd77IMv/a
         unlYknoX/+hSbLDkH0ufUfboAWkQIWAjuSr5oW5292ZTfc1j7d5qRq7LHRS0r/vw4AMz
         zI/3J5UoHdj79GjFPE1LEK5Y8O8EIw2qQUv0hteIDmdsoWjrBwvJ7ZTPkXOzFTMRPCBa
         XUR3rJIiIT+2LFkdhPH+VTnTi8IWF0RhShZT7jG2/mMFuKHMGniSX8BKutpgLCbg1aaY
         pjKhuwYv5vRjzyY0bjxqyYbswWSP4lUDgj2GNpXT3S7EiwUnTOa/3tUeKVsiy8BbKNVp
         Q+4A==
X-Gm-Message-State: APjAAAVqHgMsQLp+YAtlO3Sh5SpfI+P8bzrWd5wwA1iihwQauYJn9tyR
        gtm0EX3cmnxGDNIgDlFYzdxSdrW/flZIh99ZQ0PdPQ==
X-Google-Smtp-Source: APXvYqwqbMlISNGBlmWQOwOUdX589aFpzFerGxuMZYnIj10DzE+NZDz4XIlI/VUYIt+UMAnE5LjH+X7ugc3++ZUFV/o=
X-Received: by 2002:a05:651c:1108:: with SMTP id d8mr11399051ljo.180.1568111737980;
 Tue, 10 Sep 2019 03:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190904172624.GA76617@dtor-ws>
In-Reply-To: <20190904172624.GA76617@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Sep 2019 11:35:26 +0100
Message-ID: <CACRpkdbc70pp=SwvxGTDq=-K3ofinQJuVVymFf8ere3_f_+qqA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: make acpi_can_fallback_to_crs() static
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 4, 2019 at 6:26 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> It is not used outside gpiolib-acpi.c module, so there is no need to
> export it.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
