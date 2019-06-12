Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC3C141D3F
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 09:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407241AbfFLHLf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 03:11:35 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37404 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405024AbfFLHLe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 03:11:34 -0400
Received: by mail-lf1-f65.google.com with SMTP id d11so3385325lfb.4
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1KcMuzl2j9UlUMV+5bVICTUXl/nZCKqZLShOlWK6AIs=;
        b=Aw/L4d8YErCBnWXwJfO00otZf3wDQGfZunv7P0vOQbVNoN7eMd3CVXEDRcX+z6n9Tk
         /2euh4O9JfNrPHL31l92kA1LyI+Hf8IwF0mgT+eM06OcpGEZyrMz7ZOzPXbsEHQc1m/g
         K4znn/UpX6u53bnerzHi6Xm0JOGOda+gBMZAvNGVRyDlVF7mXggr8DA0Do3O3uA/qhMb
         u4JFf9yQixYhq8vpIkQEncJBgDhdJMQ7FH3ULz61HsO+U9tQk8rEnolE01nRQrKg/92F
         DLMEdej/O6VZCTO6Q8UQ6ZTf4eeWDcd8p4MF/ztFLRW+/jn7f9O65II2rDLFUMfQu84b
         SxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1KcMuzl2j9UlUMV+5bVICTUXl/nZCKqZLShOlWK6AIs=;
        b=jCwI9MN8sgSMkXtHGvePwDGH5sjAi//Rany07xib4v3T5kwcXFEHZU5aYAyMT7ctaz
         7X/Uu+aqhgDn9oSkVgQztKwQWbOnXE+vQ+oTAY3vfr30SjxlftkYOVsM8mYrvDgdq634
         fYXcavHpVsY8Bpm8bxHqTqIISjMPEAri/1hiP8oEvBrQS64Pc/oGhvSij5vvi+nGdoQ3
         33vGU9BwN4JPNwEXkAPNgH1T9uLogrzuikq/xKELyEv/m9QJGGn7N3Anait4mAOcdWSK
         w8O5pRu4unLUL0Qoci8EVIFf5y3ws3rOTVpiuqMZvNi5nDn38b6OtHu08Afg0yeVvKi4
         PD6A==
X-Gm-Message-State: APjAAAUPsi5Ne3yV/8gM3x/92py3rfj3Yg70SfqIlAWPSPxVY9Q3okZK
        Lg0Lbjn+L1Hcn2KyEkIDz6WvGS0hcnkTHuhrFrOKBeDV9JE=
X-Google-Smtp-Source: APXvYqxk29thQQE/BHKwINb4uefI2UckUUiQ3q2QTbipO6HIND/PFkyMs94HDPXUOnV0M1Ddkg6jgfptNouBMVw9dIU=
X-Received: by 2002:ac2:50c4:: with SMTP id h4mr27109977lfm.61.1560323492832;
 Wed, 12 Jun 2019 00:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190609150953.6432-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190609150953.6432-1-yamada.masahiro@socionext.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:11:21 +0200
Message-ID: <CACRpkdaSM4y_CEJH-MWx_7BqSP6PpTwQ21ZG++wfAT29RPcBHg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: remove unused pin_is_valid()
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 5:10 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This function was used by pin_request() to pointlessly double-check
> the pin validity, and it was the only user ever.
>
> Since commit d2f6a1c6fb0e ("pinctrl: remove double pin validity
> check."), no one has ever used it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Good catch!
Patch applied.

Yours,
Linus Walleij
