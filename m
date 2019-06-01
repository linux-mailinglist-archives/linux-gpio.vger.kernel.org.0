Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADC8B32034
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 19:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfFARol (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 13:44:41 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37397 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbfFARol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 13:44:41 -0400
Received: by mail-lf1-f67.google.com with SMTP id m15so10445483lfh.4
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jun 2019 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=19BA31i5trcVG0iExuaBgIWsHZ5o1qSn5nq4u3sMUZ0=;
        b=CWJCdoQvmYppqIwGxNQ56CW/rG/WRxA9vbqyJD/45MJEQGyXGhQIFRWphYZSzdu60Z
         TaNKjHMLUkVRusle1wRuXshEtFqk4u+7gLO5F2X37xNe335qN6ydcTFBtjp4WX41vrsb
         TJcOs621jsrgvWScBTc77KyStbiVxYSxfpO5VrxsPDfWnwHK08OtpP1n/JBy83sNytle
         pZQjWrFtvBacyq3yBCDx67WFbTAmIxP7zjCRSoXLeX/6QGsEYJf5XvGGj2qgK15JgNPB
         tE6UT84NHyXmIC6gRDdXmGdMhXR9iJkuzywNtsr+w0qfXAXtJ8NHa4B4L4ifo0vMMiIT
         XKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=19BA31i5trcVG0iExuaBgIWsHZ5o1qSn5nq4u3sMUZ0=;
        b=OaZEzeTNaSHCuNqgSpww3fp2hVjTvjvcFSXemTHOM2jxpq5uusEAw30mP97IxC74o/
         veSakX6CHVnT1r4Rhzot1s0iMbzhgvKKEPK/8SVsF0olJmn9VDs0Mt50gB+KQqlfSP7G
         Tt0AhcPUAsn1EvX20PAYrRSTuZ91WN/fpqJjnw9uE+mvNlsvx4Mg6F2tcV4Irek4Qfd7
         UV6Rbxnz/J4Ofs8xp6EYBgs/pDDar5bD6RRrNd0UgnuVac8jq8sF1saHy1EP5//OpdBB
         nzi33++XWhG2mUUubqe2HLiTFltU0T22sKhUb41iyrxZISxt35AjQrIRnw3kXYCmOvn+
         be9Q==
X-Gm-Message-State: APjAAAXf+2O9QlNqBfoCGjVe0fO8UCmWzuEH0lAjsXxTub4mqjUlJXKu
        8wvYiDmqstB1uyEZ7Buqvlpoj/M6lbaajJDiqiSsNg==
X-Google-Smtp-Source: APXvYqy21uDuDi2B6fWM6ZKQYs7NA0XB3bUhxRM3FJqBmsm7UAxYO8wSl7Aab26iAsUg9e9Bnqipq/CrQLqa5fCO83s=
X-Received: by 2002:ac2:5382:: with SMTP id g2mr9016431lfh.92.1559411079951;
 Sat, 01 Jun 2019 10:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190521090306.28113-1-brgl@bgdev.pl> <CAMRc=MdJoO602kLfP_Hw9-0pB25CeUMxfqBUYhC7CB3Aw+5O4A@mail.gmail.com>
In-Reply-To: <CAMRc=MdJoO602kLfP_Hw9-0pB25CeUMxfqBUYhC7CB3Aw+5O4A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 Jun 2019 19:44:28 +0200
Message-ID: <CACRpkdYaeD4=T=uux_tKwJpgKzyRcZnKFW2EwhNPzpkHNe3-QQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: max732x: use i2c_new_dummy_device()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 5:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> wt., 21 maj 2019 o 11:03 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82=
(a):
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We now have a resource managed version of i2c_new_dummy_device() that
> > also returns an actual error code instead of a NULL-pointer. Use it
> > in the max732x GPIO driver and simplify code in the process.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
>
> If there are no objections I'll apply it by the end of this week.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Just include it in some pull request to me!

Yours,
Linus Walleij
