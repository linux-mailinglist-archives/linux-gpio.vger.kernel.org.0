Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB3C1741DE
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2020 23:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgB1WPz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Feb 2020 17:15:55 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40546 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgB1WPy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Feb 2020 17:15:54 -0500
Received: by mail-lj1-f196.google.com with SMTP id 143so5022133ljj.7
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2020 14:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhEGO5xzz687O7OpJrPZZtUZ34aFCbyFQZbIi5eRnOg=;
        b=RhrZUQB/n4/xhEDYKZ9dObLNzVyQMv93Zmb96K9ZrPnb/piy9b8arXRmKY4RUJcI1H
         UuMsHTFAKAD4UxmEkfEKlM0BY7ZGByBu5rtbWHBo1jL3pak+eixpPiXuw7EJi900hbxs
         u0dsTloY948pjhat8Kf0o9aquRYTZe/cb/lVKFnOfuJvhtYT4QZMSnXHLBaSDPTdfMdx
         AhFmIDcfkff/hWi12MKwuyMS0Ab2+Oja1qDbu1w6LoJ1rheGZJeN1N1BTKJFXX4Rp04d
         A5MRyCKvvjQg7VePnAWCuciYr9WB36nv5h+tN40F/qMmyAfDKMTgkSnj/HobJ0ydE44M
         vqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhEGO5xzz687O7OpJrPZZtUZ34aFCbyFQZbIi5eRnOg=;
        b=WI/S0pHS8LaBaWp7HVEoCsOCaT1JYBePNyPuIDsZROkq4hI/y/e8ObOa2/locCTiIS
         HwuV1rbbwaci22xdD5PWNcB/HNIwA/Aiu71U91Lpjs93EhqMoElpanV2IZIuusfDc/8q
         qJnK85hLVi735UH80PzLeBuxPF+sbhZN0dl/pRoaWmtyi3PTtJfp/DQ9EOsyJkrhPYe+
         FoxqTPM5JRQoz5W+tXtXMriJTG4x+FImBmPK5qpw3H4qTZkNub2Rd2JuZ/WM3TfXEs9F
         o8Dw6Zwq7ruYe33MpCAI8a30nFhc73Yo5kWbUda1aVNzETY3rONWdLV6MgXQFRA7l6DE
         /5EQ==
X-Gm-Message-State: ANhLgQ2YB9Ehz25Jo7v20D7fCUsJRCweul3lB249dBfY9cYm/iS8sfK8
        Fhj2m1zQUSe3a6sh+kQZBn63gSxOCOtH2AwkuY0HZQ==
X-Google-Smtp-Source: ADFU+vumXbpYRw8pi5KZznuwB2DpEkpHep4+FFPY+f32ZJX7gumByIl0+yGYcQjfYmqBjEmuN5lRRQlCJxgL1XIa+gc=
X-Received: by 2002:a05:651c:216:: with SMTP id y22mr4331743ljn.277.1582928151417;
 Fri, 28 Feb 2020 14:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20200221154837.18845-1-brgl@bgdev.pl> <20200221154837.18845-3-brgl@bgdev.pl>
In-Reply-To: <20200221154837.18845-3-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Feb 2020 23:15:40 +0100
Message-ID: <CACRpkdZQCtF9YimCD7U7b207XNEyR-mvNntcqCSRgORsHuUfZQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] gpiolib: provide VALIDATE_DESC_PTR() macro
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 21, 2020 at 4:48 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We're about to add a public GPIO function that takes a descriptor as
> argument and returns a pointer. Add a corresponding macro wrapping the
> validate_desc() function that returns an ERR_PTR() on error.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
(I expect to get this back as a pull request or something later.)

Yours,
Linus Walleij
