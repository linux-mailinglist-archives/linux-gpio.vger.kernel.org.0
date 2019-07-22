Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8127A6F95D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 08:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfGVGPE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jul 2019 02:15:04 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39775 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfGVGPD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Jul 2019 02:15:03 -0400
Received: by mail-io1-f67.google.com with SMTP id f4so71435144ioh.6
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jul 2019 23:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kX0BwYLOwNUlNgHxpx7CjmRWqoQEUjzIqeh8o3Pqthw=;
        b=PX/sutwSVjl/2Y3XTd4qqCfz05CLsbLY0nZ9nsfREhOtpGDWV7OZi60HWK+i5wXiyt
         yWpIG/ejlfDzC7yXMcJqIE3kCoWyHWuI3U96AV61BnGtvvshy6pllCmEC87xYMFnTQ3B
         I5tejJqQtT3M1lOcpN736GYOLowq8z9RlN/4hK+1Xde9OSmNm75kBJ6Q3j0gxM2LT6ms
         8taFE80ygibQHdlwOLZH8suTJjVI5L5lfl6FOu2jMjIna/hSiE7ZRl8qpBYDRF0Gef3P
         8QHhtH+EJudycoTb4AYf+OUwjHEKpU0Wm05ipWWP6p7VFSMXOHhBg6uSHFQ6RJU1VKRd
         HpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kX0BwYLOwNUlNgHxpx7CjmRWqoQEUjzIqeh8o3Pqthw=;
        b=aCRGFb3jn00QeHKS8LEzbeTNazEVonA8bkqdeyL9QHSD1c10De9c1YJ849QKyICsUh
         kWGHxS71XBPOOSDzgxwXvR9+H9psRpXB2VqvHHPv9IurRul7xuAiPGGmiX0EUMK5Pn41
         /vGIHaRXGtFvK70KfZ2B66y24HOvq80GQaasl/mXAupf1GwvG0iu2JPJREUKoeHVzs4+
         +fogjEzybzhoFWwGUWVFTIOGSzpnkQOtlPEl6TElXsSlGg9vlGMyIAkmwoWy+NlHeaMp
         vVGFsxuKSfYRoV1yMAFVl3pL9/sUTvAvQqXIzsxs9Z1i+n6tExzGc3AD+W4M61lk2syk
         Pdow==
X-Gm-Message-State: APjAAAXtllZB9BQfgTN+TPR5A1V0fH5FkPRzBTq6ivIU1k+GrFJuhJ0Z
        h8oXszzpgghlB7331t6FASSxOTqcV4nreYpeO1E=
X-Google-Smtp-Source: APXvYqzc/MqOnPkc6Erbr3xhLWJvVo8HVczLWBKMYcQnIGByIRIh/0GfUKYy/vZd+Z/uSeZ5HC7s7y1JYvOoMbLSM6g=
X-Received: by 2002:a02:37d6:: with SMTP id r205mr69512569jar.57.1563776102949;
 Sun, 21 Jul 2019 23:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190708082343.30726-1-brgl@bgdev.pl> <CACRpkdb5xKHZja0mkd-wZJ+YHZpGJaDrkA0dv60MNYKXFcPK4w@mail.gmail.com>
 <CAMRc=MfB9R70QDqtjG5a5Roq1roeL78Ss5noytrY-7P=tY1OHA@mail.gmail.com>
 <CACRpkdaiZgK1EoaUxDtbm_GJHVjZU56e_qBQ-OF0mmwb5W8+tg@mail.gmail.com>
 <CAMpxmJWDTkhuWhfSJ-fkJ6r+7a3kErXafQ_sJLVgMf=cA=1+aQ@mail.gmail.com> <CACRpkdYkp0OnyEiUX_VQF_nu5JumkupdsX9fG4rWCf0apNtX5A@mail.gmail.com>
In-Reply-To: <CACRpkdYkp0OnyEiUX_VQF_nu5JumkupdsX9fG4rWCf0apNtX5A@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 22 Jul 2019 08:14:52 +0200
Message-ID: <CAMRc=MchP-nAnYL8rq1k6QUF8DBoayZKB95xh-YL-5gB6GQC1g@mail.gmail.com>
Subject: Re: [PATCH] gpio: don't WARN() on NULL descs if gpiolib is disabled
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Claus H . Stovgaard" <cst@phaseone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 20 lip 2019 o 21:45 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Sat, Jul 20, 2019 at 8:03 PM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
>
> > I'll apply it to my local tree and send it for v5.3-rc2.
>
> OK! Do you see it as bug fix so it should go in the rcs?
>
> It pretty much needs to be a regression to go in there,
> because this stub stuff blew up in my face before :/
>
> Thanks,
> Linus

It causes a warning every time someone writes to an at24 EEPROM
without GPIOLIB selected. To me it sounds like a bug that should go
into stable. Let me know if I'm wrong in thinking that, then I'll send
it for v5.4.

Bart
