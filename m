Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E925C1867D2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 10:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgCPJ1o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 05:27:44 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:34569 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730025AbgCPJ1n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2020 05:27:43 -0400
Received: by mail-qt1-f193.google.com with SMTP id 10so374709qtp.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2020 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RuY79H+7PbCifVG/uPjWzJMnWAOcXE93nluGeC97EMs=;
        b=NQwXZAGu03zdP3PHdRmp0ZDmyZYt6KOo9nZXaolzS5dJp/KZV3AIzcp1HPWFvtUoDs
         YOnouRNvQHChmCnFju6kPIwelwubONI4YT9YxIT5XjCeLrpEsS1XvNTQVM+xlWV9KL0h
         +vA1lqOyDp1wAGBiAkL7c+KaeWNIT5zSD8DKpmMlOxKGfOJswVfiaEW8yhjIHAUYoL9C
         mP9LQF3MTYHN98Y9gBq/zhOEZC/y9YMl5CtMrAwI3wJLdIZkRKB/BZhiEuou0dwgkD77
         EnsQkk4GrxT1Lh7ixqkjYgNKHjQ4SlxgY132vlS1ecL4NJEh1qYFNcefM+8ii5nlnAKd
         lQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RuY79H+7PbCifVG/uPjWzJMnWAOcXE93nluGeC97EMs=;
        b=ESOQnqAC1jzgWWn8XpgPkyWZ0TT2WxrTsXw8KlF2LySvM7JirojdxATfhRDrUezL61
         6SUKRWq+CFqpQZ8V2ymRv2NqU1n5UdONJE9oakXbodZh7wbpZF3xt7WUijptl406caQn
         ENSWAUTsWxZTuVwk2Lr+Z5pHlg625sabUDpsDOsyTdf2cLRESwT1MD68YXipoPaJC8/3
         sn6F+8IjN+sIN4MTfNibDMX6G3HYKq0WTOjrBzOdvCl4xiKWr5RzoIpwrcXP2alBqQ8X
         RMxuFZnS7/hCJN3PD7pmlIo96z4YFi2pR8TmAB7WDwAumi2wMG5Hc+X9R1T6p9ZFPl2s
         sH6A==
X-Gm-Message-State: ANhLgQ3myMni+M3IhKotPOHPfxUgMQLAjanUEbT/YX6biW9uBTvH33a1
        uw1F36R+LviYkMkaaPd+cxoYRLgFF8gi+dfxzgmxug==
X-Google-Smtp-Source: ADFU+vsche6bnmQMkSeJA2+it0hy2TfSpmMQY4kJlZ8IEEangiOV4yZCTjryt0RDpjKC0GfFt3HGmNsLjEvKO7zcJGg=
X-Received: by 2002:aed:3c4b:: with SMTP id u11mr19797788qte.208.1584350862684;
 Mon, 16 Mar 2020 02:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200315121338.251362-1-gch981213@gmail.com> <20200315121338.251362-2-gch981213@gmail.com>
In-Reply-To: <20200315121338.251362-2-gch981213@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 16 Mar 2020 10:27:31 +0100
Message-ID: <CAMpxmJU4MOkk7n7OqkEiEbd68qu49ZWywWhx=CAxUFWUgSDsgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: mmio: introduce BGPIOF_NO_SET_ON_INPUT
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 15 mar 2020 o 13:14 Chuanhong Guo <gch981213@gmail.com> napisa=C5=
=82(a):
>
> Some gpio controllers ignores pin value writing when that pin is
> configured as input mode. As a result, bgpio_dir_out should set
> pin to output before configuring pin values or gpio pin values
> can't be set up properly.
> Introduce two variants of bgpio_dir_out: bgpio_dir_out_val_first
> and bgpio_dir_out_dir_first, and assign direction_output according
> to a new flag: BGPIOF_NO_SET_ON_INPUT.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Patch applied with Rene's and Sergio's tags.

Bartosz
