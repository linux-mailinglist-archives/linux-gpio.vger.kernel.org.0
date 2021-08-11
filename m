Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9123E8BB8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 10:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhHKIZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 04:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233424AbhHKIZJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 04:25:09 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6059EC0613D5
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:24:46 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w1so3803398lfq.10
        for <linux-gpio@vger.kernel.org>; Wed, 11 Aug 2021 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVm6z+/Bdr1n5Fxa4kSmJVT5Ljn0y9dUOJYnV8Z4PAA=;
        b=npDtkwz0NnMywdciIG5W0LkfTTOnjggjeCnH3sgoLPN5Hccs4URBbWq0lmrVIjgkvq
         xbw1AbzO+nfE/1+yQfqze5oHl+jtYm8kIc0fIISaS/9tYulHcumxsocgP8gWH6N384vJ
         /wcpWMM9natlQocS/RkP4b+cv2u+VIoEG6se5sHXdymoQP6TbjNPWzqaYk1u1mIzV1m5
         k/VXeVLYNelL05P2GONZFDXEVKbEMZuK5Wdc/nVDbRe4k2XMzG2/KcI8HKBwvc/QK+7R
         Xaih6iEM4iWlhD2N2TbtPpV0Txi6EiQpWa5BMj7p3CWEQ5XAdC2r9qfcwTXEOKqm33+t
         m2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVm6z+/Bdr1n5Fxa4kSmJVT5Ljn0y9dUOJYnV8Z4PAA=;
        b=mTduMxmqYcp8WZKcKCsCt4QbH1l06cQz/VK8EDB+rDU8W3bpgH9SoWvt170mDrUy6z
         InIgIWsGrvmCff/7vhgAs0Rm4dFBJGuVSB7/Wvx/Ru5fkS0Zj4z1E59Tydcv5pC8UdMj
         uR8XjK5yrvpJxPQQNOlLoaU0TwjrbI0ibWt2wyJOgjWrv6NMe0jVUmnfhP3rcRySywlp
         Z+P0xYVzAQt+moKKsZXKAZdFbfurDF+aHzF43y0Gm+nLT1OveCeROuuBUSbokmLDUPSm
         ng8QpzsnhhtEJuRmci0sfbFqMVRUPi8ilsl4WhYIelr3zKg9scqb8iKEWJs6KmV+sEhD
         UDDQ==
X-Gm-Message-State: AOAM531F1gEkgf+NcMxBCzSkga7ygj+JS0X7yC8dWZe4B7zlYbzjxFKs
        exAig9ndi6Rr6kqh4D+DuBjIH+R7HMI2+49SWuS2dA==
X-Google-Smtp-Source: ABdhPJw4NdVqOP8gfyXv+14MvH9T3lyPveKwazy7JVk+5XTR/vz5E6tNfn4zvYKymCGWRbOp10vWB0/n7S2SBJmBe0Y=
X-Received: by 2002:a05:6512:132a:: with SMTP id x42mr24116051lfu.291.1628670284748;
 Wed, 11 Aug 2021 01:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210717174836.14776-1-paul@crapouillou.net>
In-Reply-To: <20210717174836.14776-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Aug 2021 10:24:33 +0200
Message-ID: <CACRpkdakKpyb375DY+D5BgS6NK4c_LoLRmQ_hh-F8KQpR_wtvg@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: ingenic: Fix incorrect pull up/down info
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 17, 2021 at 7:48 PM Paul Cercueil <paul@crapouillou.net> wrote:

> Fix the pull up/down info for both the JZ4760 and JZ4770 SoCs, as the
> previous values sometimes contradicted what's written in the programming
> manual.
>
> Fixes: b5c23aa46537 ("pinctrl: add a pinctrl driver for the Ingenic jz47xx SoCs")
> Cc: <stable@vger.kernel.org> # v4.12
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Patch applied!

Yours,
Linus Walleij
