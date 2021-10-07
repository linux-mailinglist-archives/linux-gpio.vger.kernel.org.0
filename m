Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF228425B69
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Oct 2021 21:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233903AbhJGTQm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Oct 2021 15:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233889AbhJGTQm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Oct 2021 15:16:42 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E9BC061570
        for <linux-gpio@vger.kernel.org>; Thu,  7 Oct 2021 12:14:48 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g8so27000845edt.7
        for <linux-gpio@vger.kernel.org>; Thu, 07 Oct 2021 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=es7Lqt+oZlj235bOVkjIDlCKh4wi3M7l3uCVxF0IKpM=;
        b=bENYO2Dngd0++rUcEYwO0qagMm1BD4M6p+MvZO5M6ZrJ3JjmDeYEU2L/WLw6GPyHW7
         zTB47D73l9nJbua7DRAUSsT71ftQGSnCl4YbllJ7yfqfWwpPviyadsITMqCGLCos/gV2
         PAgH1pyDZI7Z8gyRCzUH3Qm1nk4/Vk7i91oNa95LfnvhuwTKz9WXBKXKPmwlCl7VDG0D
         4iHTefHGj7BV8tWOgBM/FMraUoG3ZI3dOKPM72bqUZflSh+9xDiujcchyoqye0nuD1qB
         4LRJHfg/J7tp/hPaFnVaqFWxwTs/RBCtGXq5M3wvckTxQNPV5gPBhNvS/W6O7Cv/Pw5O
         ZMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=es7Lqt+oZlj235bOVkjIDlCKh4wi3M7l3uCVxF0IKpM=;
        b=KJivX6IH+VlINeAOAj0ifjsaTPVLxj2Lg5X5xlb3toBA5C0nd63TGzmKwR6z36+KWN
         Xay8fF6Jv9AEct+1gBteBqq7k0dldABqPlFYJjILeb3NLPqSy52POySmnik0cKoB4eX4
         Z0qr3Ntgh5LAw6DX6BA5/K2Za+kvza9WumTuSB1V2Sd4BFjPKyYY90eKYoHHkiQOWZFV
         GmOD/Y7HfIVI2HrW77I5h/PIbXnqhQ2LDlbL3yCTo3xrZUd3f7RXbfutSjDAprZNQi7Q
         zQfH3/EIcvC0RWIdxwiubu7wYLTpZpa07alCni50QiZgOn6RBmNIbk5cSYBkaKr6W2AQ
         wA2A==
X-Gm-Message-State: AOAM531p5FmNehLDLFHgW4f78t22j5T2yTaGUklKZDR9NlEYFXUW+qqU
        6KMRo9DKm0RoI+hSYmDMqp6aJERTO8q/AFMoGCS+mudxYHw=
X-Google-Smtp-Source: ABdhPJygTKQarmFVhWU1a2aB9pFIiKNd13uNAYjVEt5zr+ubFPzCuxICxjtmEJLK2wrkdyqShhPigALSxV4eDhBQXQg=
X-Received: by 2002:a50:8d51:: with SMTP id t17mr8605631edt.205.1633634086548;
 Thu, 07 Oct 2021 12:14:46 -0700 (PDT)
MIME-Version: 1.0
References: <BN8PR17MB3025D723599B15E5AFB208DAA1A29@BN8PR17MB3025.namprd17.prod.outlook.com>
 <CAMRc=Mewmbqo+y++j4iFEn36NMW3xL7AG9Vd+pLt6-PLE3cn0Q@mail.gmail.com> <BN8PR17MB302555D87D065ED3D19AB340A1A49@BN8PR17MB3025.namprd17.prod.outlook.com>
In-Reply-To: <BN8PR17MB302555D87D065ED3D19AB340A1A49@BN8PR17MB3025.namprd17.prod.outlook.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 7 Oct 2021 21:14:35 +0200
Message-ID: <CAMRc=McBQiOjPdJpd3RFR-EirgKHGhR+ae9V22O8nJVreT8ROA@mail.gmail.com>
Subject: Re: GPIO Bulk Request Problem
To:     Kenneth Sloat <ksloat@designlinxhs.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 24, 2021 at 2:25 PM Kenneth Sloat <ksloat@designlinxhs.com> wro=
te:
>
> Hi Bart,
>
> On Wed, Sep 22, 2021 at 6:27 PM Kenneth Sloat <ksloat@designlinxhs.com> w=
rote:
> >>
> >> Hello,
> >>
> >> I am using libgpiod v1.4.1 and am having trouble using a bulk request =
of gpio lines as outputs from a chip. I am using the C++ bindings. I have c=
onfirmed that I can individually request lines and set them as expected. Ho=
wever, if I use the bulk request, while I get the expected number of lines =
(and defaulted value is set correctly), iterating through them (with array =
operator in this case) and trying to set the values is not working as expec=
ted. I find that for every index/position, line 0 is the one being toggled.
> >>
> >> A simple example is below:
> >>
> >>     gpiod::chip *mychip;
> >>
> >>     mychip =3D new gpiod::chip("1");
>
> > Why would you need to allocate it with new?
>
> It's just how I chose to throw the example together.
>
> >>
> >>     gpiod::line_bulk lines =3D mychip->get_all_lines();
> >>     lines.request({std::string("gpio-test"),
> >>         gpiod::line_request::DIRECTION_OUTPUT, 0});
> >>
> >>     for (unsigned int i =3D 0; i < lines.size(); i++) {
> >>         printf("Set line %d\n", i);
> >>         lines[i].set_value(1);
> >>         usleep(1000 * 1000);
> >>         printf("Clear line %d\n", i);
> >>         lines[i].set_value(0);
> >>         usleep(1000 * 1000);
> >>         printf("\n");
> >>     }
> >>
> >>     return 0;
> >>
> >> Not sure if this is a usage problem on my part or an actual issue.
> >>
>
> > I'll see if I can confirm the behavior here but it looks like a bug ind=
eed.
>
> > Bart
>
> Thanks Bart. If you use individual requests to the GPIOs as outputs first=
, use can still use the index operator (or iterator) on a line_bulk object =
to individually set the LEDs. It doesn't work when you only use the request=
 through this object though:
>     gpiod::line_bulk lines =3D mychip->get_all_lines();
>         lines.request(......
>
> > Thanks
> >
> > Sincerely,
> > Ken Sloat
>
> Thanks
>
> Sincerely,
> Ken Sloat

So I took a look at this and unfortunately you hit one of the major
issues with libgpiod v1 and something that will be thoroughly
addressed in v2. When you make a bulk request, all the lines share a
single file descriptor. That means that any ioctl() operates on sets
of lines rather than single lines. The only fix for that would be to
force requesting every line on its own. Unfortunately the only "fix"
to your problem is to always use the bulk object. Otherwise the single
line cannot know it's being used separately.

In v2 we're addressing it by associating a request explicitly with a
set of lines (can be a single line) and never allowing this kind of
situation.

Sorry for the inconvenience - I didn't know any better at the time.

Bart
