Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46122183343
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgCLOgr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:36:47 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36660 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727450AbgCLOgr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:36:47 -0400
Received: by mail-qk1-f194.google.com with SMTP id u25so6537305qkk.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Mar 2020 07:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pDY8xeaqVT16OVqXjF+yX34JfO0w5VqAE9l+u7irw8k=;
        b=YfOKPY4/iOX9Q9D4X/p6nAEZCn/Z0A5y6Rln3atF7K0qlP3aXneadOvx5f/8zZZtMN
         bYiiCeXH51hPlBzI/7hsC1bFYWWUyzp/QnqDjHP3eDXHFLCb+4OIYJjawyx7vacLFsYt
         I8gfOkQeRRYK1ZsSXwB39fFhFQGMJIqsV+Mnssbl/FKxsbqp+KPZaaxe3V4X5Jp75fH8
         PI8OfhEgzOBoQuUkrEexo2MuFq24Gld2USGJQsGgV8JDfdHphefO3Vt4m2hqrbqFKzHx
         9wzinGd2PZ+8+jHN0wmCs3Ggum25fHjqLM1yH1aXoSGs9YMp0wwKI2ZHGQlf6Zv4fRZ6
         xcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pDY8xeaqVT16OVqXjF+yX34JfO0w5VqAE9l+u7irw8k=;
        b=W9aWNeDAvSfRuZJQdfyZi2TrkqVnESi6iOV7h91s/PebnONdTj7KF85NyLL94jtm2d
         +O1mFQzlyNclGpOhIu8Hkf015U7ysufBeaIsvl1YrMO10xq3m2Z6+A7ChTEfr8nDhMDi
         3FfyJ+BcdhmUiKhF8/lRj000vFGPdJIau6LdDTe1sE09qi7Vo8fdJRhJ2TZ+b9Hqs40d
         qRdOtXT7bjlStEOoS+C7v9Fyd4HpAPnr1954WUZ/ov7jht37YTU7d+ATUHEqSl8i56h0
         keU5XqXsrwwL3MAPVEXIX0a8+jKiAcZWMWbT6k4UkdjvbjB7NpQx66PTduV81wLEU7n2
         IznQ==
X-Gm-Message-State: ANhLgQ0PLfU2KelzrY4zDqQyse4OGOIpoaq0qnL2WvtUG4vRORh0DBAy
        Din392FqOkkVoPqhTWL4v/9WGD3aKloVRhsA4NrFPA==
X-Google-Smtp-Source: ADFU+vta/F4GC4v5YWObbXQ/e2bdQG4kRWcWHvfhT/l/rSyfIxC9+FmFkvA1SmG6C1ow9rx3x5ItKmWC94sTc0imGwQ=
X-Received: by 2002:a05:620a:2117:: with SMTP id l23mr7812945qkl.323.1584023804704;
 Thu, 12 Mar 2020 07:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200312094008.1833929-1-gabravier@gmail.com> <CAMpxmJUUth5w8tvZp8mFV-FDz0YivmRWAqsOQSTdze1xagMX8A@mail.gmail.com>
 <38cbabe3-151b-1fd6-9d36-f27e9c9aa414@gmail.com> <CAMpxmJVSPA9CQBGULyk69KaP42oMdKGg883z0FeFC_mSA5w2xA@mail.gmail.com>
 <55db9307-9a20-239e-127c-ea043600248d@gmail.com>
In-Reply-To: <55db9307-9a20-239e-127c-ea043600248d@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 12 Mar 2020 15:36:33 +0100
Message-ID: <CAMpxmJXUa7rk51XXvLjgueD9i1k98A+5gLx9WowChRb64k1mPQ@mail.gmail.com>
Subject: Re: [PATCH] gpio-hammer: Avoid potential overflow in main
To:     Gabriel Ravier <gabravier@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 12 mar 2020 o 15:33 Gabriel Ravier <gabravier@gmail.com> napisa=C5=82=
(a):
>
> Ah, seems like I didn't read the guide to getting code into the kernel
> thoroughly enough. Should I send the patch yet again just with a v2 in
> the subject header or is there no need to bother with that ?
>

Please do so that patchwork picks it up. Also: please don't top-post
on LKML ie. respond below others' text.

Bart
