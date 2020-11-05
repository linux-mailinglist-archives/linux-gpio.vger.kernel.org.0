Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136042A815F
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 15:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730754AbgKEOtg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 09:49:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731013AbgKEOtf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 09:49:35 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A31C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 06:49:34 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id a25so27578ljn.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 06:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dHzekswEkQyFOdxnEjm4V1ra9RA/uoTTFkn33TAI5dM=;
        b=Rf/Yy42+WxmKDyK5sPWxC8MGnQA+f4e6StN9w1GL0pHEikSBv8GL4P5s//Wt+qeiw1
         P50jg+C2DTKzIVHmHoY8+gB6zAaIbUatIOlIeF2Q1uoqAbVjYpE6dRBK2OcSC0B0EWcX
         OntJ6fEBZ+nSp+IL2ne/i7xuTLNm95VoYbaXgPI5swJvhzmvG5MNd5DCLI4HBuRHA4zK
         hj1BmhrjkN4auRqOgrJfh3ORe7CElM139fV7qkCsPbKScQ9ojBEVT4ZYOoi/gQa6+9zq
         lb/qGCIZQWX/a2R4+jC3BaVVb42OBg1HIcW9BoQoIGzqov4CO/3k6h1ZlijPvwJijABO
         cRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dHzekswEkQyFOdxnEjm4V1ra9RA/uoTTFkn33TAI5dM=;
        b=FWZjCIwdhvpM+/w/tI2dQ1jvnfsHmXVYzazP5KyYNjhTas5iX4RCyW0CL0D+Jf5vrK
         nUHerUdbWblFgKVPuD79azhk4uqdS5uMnFVOM/deZQwBm/aOugnuIAMrIJkXHKlwKwoT
         u9VPibCUfNnlv39YWtCqfuh7d0Wao1C9Rtwdv2n/Kz7LOY+HWzue0G1HzwUfla2DcW/o
         2xOLz7r2WRCNmkL0hZLYK3Nr3PxIH2P8v7N5+hZTFn/aUU51ToN0jEOwLoadUIhXtWaJ
         DBReCv8F2JOtT/ebULxvKv0fGBQgffzB06OeP7PlmvgEL9RchA/HqrPMfgi2z8l7XtQU
         K9EQ==
X-Gm-Message-State: AOAM532OWHUv9OS+7rhaRyULQxQwaHgCSNWqSQ/OR1fyCsb8mIjmhhpz
        QooxCR67GXGlnQwChhOvB9OhEpXo7qt73pMyi1ZOtA==
X-Google-Smtp-Source: ABdhPJw9vNCKM2k0UVuvheKT2DF4rHIlytZI5hM2ozJe4LqEPMbmzZf53wrUAwRslhZpP7zI7/UTCUBa/Uay3Bzd3O4=
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr940681lji.338.1604587772695;
 Thu, 05 Nov 2020 06:49:32 -0800 (PST)
MIME-Version: 1.0
References: <CAHp75Veqdv8JnASmmsnv9AmrktByWH3R7Z36wLMyjJh0VffExw@mail.gmail.com>
 <CACRpkdaAryt0PdbMQ-LMjJ=LNvmNVSHrjHfPn15uJo7WALpNEQ@mail.gmail.com>
 <CAHp75VfdRfROFwa+wsL6rW7v5=E+qYrE+rwy7zBP2YkZsgjdgQ@mail.gmail.com>
 <CACRpkdYjHERoO-rzoXa77VCjDrF0N+3q+q_MXOstMEkk3Y2CnA@mail.gmail.com>
 <CAAVeFuLRWsxeZW=0jWyXb7N=o1n53F6n1Wwd0t=dUSppk9-xrQ@mail.gmail.com>
 <CAHp75Ve=_2Ye7K6rY8sLhpYh7DF9fqVbS7c2OVSWDZi3XYBbzw@mail.gmail.com>
 <CAHp75VdnNi-wWeRnOCLYi+K-x0sKz4s2=OqtHdkZJWQw4-d8wQ@mail.gmail.com> <CAAVeFu+YtiZ69btLyiZvPwXJYo+KW6T9SyhrJvd_4L=qJqJhpA@mail.gmail.com>
In-Reply-To: <CAAVeFu+YtiZ69btLyiZvPwXJYo+KW6T9SyhrJvd_4L=qJqJhpA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 15:49:21 +0100
Message-ID: <CACRpkdbK=AAPQNGaDkHwS1o7xopZkj-7cwJGtFB2N9=q=sLjDw@mail.gmail.com>
Subject: Re: Is consumer documentation correct?
To:     Alexandre Courbot <gnurou@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Alexandre,

long time no C! :D

On Fri, Oct 30, 2020 at 3:36 PM Alexandre Courbot <gnurou@gmail.com> wrote:

> So yeah the documentation (which I have written as far as I can
> remember) looks a bit clumsy at best and I probably should amend it a
> bit. Now I don't want to give the impression that these functions
> should be used as they absolutely should not. :)

Yes pretty please with sugar on top can you send a patch to clear
this up once and for all so I don't have to!

FYI when it comes to GPIO descriptor refactoring we are churning
along with it, my tentative plan is to finish it before I retire.
I still have ~22 years until regular retirement age in Sweden so
I think I might be able to pull it off!
If you would feel an urge to jump in and help out here is the TODO:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO

Thanks in advance,
Linus Walleij
