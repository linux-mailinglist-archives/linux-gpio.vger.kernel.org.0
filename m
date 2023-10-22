Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137927D2565
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Oct 2023 20:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbjJVSnP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 22 Oct 2023 14:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjJVSnO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 22 Oct 2023 14:43:14 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E044E0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Oct 2023 11:43:12 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-49ab0641e77so1094692e0c.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Oct 2023 11:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1698000192; x=1698604992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFBzhBHfJGAdxrzBo65ARLhrUEXHoWpeGGwEKhF39R8=;
        b=yUDJLBPrBLg8ySZcpNFifsb5/zrHoB30ge+tJMqxtiBcTmsHM6p9kx1JRWpdnWNRfD
         fzqt08U3veKl2FA8BldhHj9PL2XJH+3JnEjqRCIUZ/6nVFhB+J36gb2fRSFrgrIzcVsv
         k+8qWek01jd00dUiQul3vGuDu4IDxKRQU6EwXO7LKlqF2UbZw5yHw0KjiV9lLqK4LSSv
         xzZGOlI2mmk8JAXyAiEp9m9i7CgYJgk/PFFNc83K6Jb5WGDgnn4SuopddoHEddmvB0t/
         h7E/Y6VdT8YfKTd2PQ3yTRfMVpBR6ISS2RR+24yR7zVhrU4d8x9wVR7l4KKnXgzqOBrV
         cy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698000192; x=1698604992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFBzhBHfJGAdxrzBo65ARLhrUEXHoWpeGGwEKhF39R8=;
        b=XATrFetzGbF+qPPtUgRs+f7L/xOMrpd8tz6ofwtxHAtfEgIm55LWVirItJWGsX2vs7
         +EsX7pu97CRVMl9deO2pDJsOpPNZPL5pgXhACGxO4n/brAz7oGreXMJcpBmHo5UcHP2y
         C1CzNsJaPdxLyJw6UpkNPLiZ/1qybEpy2TwTX5y7NrnGQYL/8U6nsXGuaPd2gXkM/oIv
         3t2eJjpA3UeHkK4dtF2lyoY1porhxxGmduE6MzC/87V1thMBw6eMVfK5CP4cSpCoYYr1
         TZ+lFEYA2yonnwY1fHxkizQcXj6W4SqNrls30VE+Mxclj26PsZwq7X2Ygv1x9CyQOLgk
         wTUA==
X-Gm-Message-State: AOJu0YwmOGNZ+YG283chUAl7b87MdckwgEBv0laxZ9YEHkargGOeYKPq
        AHnzf0wuqaspxkcIz2tdGKf8SvL6IJrwQNMAwb6dv6YoGFDhmC1D
X-Google-Smtp-Source: AGHT+IGiZKxzKxcabuTtjw9YgtwMX4YfPKb1BC7tx2cMURaMOAYnK+6uOptvRh9ClEI8Hk0rSt471/51wbmQo8a0AY0=
X-Received: by 2002:a05:6102:160d:b0:452:6b50:1e7e with SMTP id
 cu13-20020a056102160d00b004526b501e7emr5749208vsb.35.1698000191741; Sun, 22
 Oct 2023 11:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231021183925.22831-1-brgl@bgdev.pl> <CAHk-=wiOJO8nfcDeUMwYXPQHLtTnngSDd4ieUWegW1Aru8TbnQ@mail.gmail.com>
 <CAMRc=Mc-oz4e4d9pJbvki3kGgMj1DzSS1EDKcycswJKCNAbqOQ@mail.gmail.com> <CAHk-=wiVNOFP1dzKdCqXvoery5p8QoBB5THiJUMbZ1TxJb7FhQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiVNOFP1dzKdCqXvoery5p8QoBB5THiJUMbZ1TxJb7FhQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 22 Oct 2023 20:43:00 +0200
Message-ID: <CAMRc=MezGuMdd=H_vdSmdm++YDm59gB6TK2HbqDQypqDOSjj8A@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: fixes for v6.6-rc7
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 22, 2023 at 4:32=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, 22 Oct 2023 at 06:12, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > I have diff.algorithm =3D patience in my gitconfig. Typically this
> > results in better diffs but not this time for some reason.
>
> Yeah, that picks a really odd diff in this case.
>
> May I actually suggest the 'histogram' diff algorithm to you? It's
> kind of a "smarter patience" version, and at least for me it's been
> the best of the choices.
>
> Of course, there's always going to be some odd case where for one
> reason or another one of the diff algorithms does better than the
> others, but histogram does seem to result in good diffs most of the
> time.
>

Sure, I'll use it from now on.

Thanks,
Bartosz
