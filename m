Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F7E2D94BE
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439592AbgLNJMk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:12:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439585AbgLNJMg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:12:36 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51689C0613D3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:11:56 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id o13so5131348lfr.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3c3B4jvN7kEXAo7mrGFZLnN9AG7JaK5tlblUs67Gc2Q=;
        b=VQZYA/KPSdZhAC/0a7gHg/uhHQXBKlAoRmc+YIS78xz3xeM3dzvvbFEFwhwdgtjl33
         nxyF72B6XRWLHt61qo1g79bls3eWhYm2QRa0ERnaSytnpKrCIF/LnZhBDmeTUF8VFCX3
         tqpDFZH/+3OgZfNVhlVwTQh8mIIHAHUDjyVillugYk0zF6leZ2qaVVvCutvyijIKXyGV
         LnmspAK+fgdCb8E7g4iB6KVKd8/G5bVsgb6QmK330TLqVvIUvTVS5JaApuSGrLxo394n
         9NS2x+0aHzBlW1rvh6MuhIRsuxnFRvg2ZqpZRgZos6p9R+aUqgo1zr7Cn/Lvnzjysoyp
         FX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3c3B4jvN7kEXAo7mrGFZLnN9AG7JaK5tlblUs67Gc2Q=;
        b=oUhXe6lGtcBoM5u6PHZfKKchVpMteAaGbhkyfh9V2BAypcBRiDMG1QlPXNpKTcqT1P
         yfChppOn/iUfyJii/AA9FzdPNMicUmvub6fvMX3K68/5Ka8DXT0tTXzfEwx0YJtRZc2d
         CW++qyZRWTalVp6dmQn8Vxwq5Q+MnOJ6zYJfr0lW0FCZc9lPiZ2xX60RYtk0KUHmIJDg
         00W9K3Sqf7GKJQ0hf/evcCwi5zLud1vipowVhM1Fv+AIlO5/YZFnmy4xfX9X2bdmTEkL
         fKWyfmU1fA4ZchOjn6W+UAKuWevjUtBFrXJd8PCAV0GytskApN7CT1MjDrYFBosWCcpY
         +wBQ==
X-Gm-Message-State: AOAM5306a0q4NAHfVINd1tvJiAbH0mKvZ23O5VqERm88U03RfxEq/B0Y
        69qy8Xj/byBudixS0eHJH6zDZwwKta6v1ntoZI8XrA==
X-Google-Smtp-Source: ABdhPJx4mvGSnAulzpG7cr1odo2sol3BUseDWpJyTH+nCqCjd2QfcYAMQZ1rFDZPSwHMc2oN1JZjXTNzTgeIvZALP0Q=
X-Received: by 2002:a05:6512:3238:: with SMTP id f24mr9388449lfe.29.1607937114798;
 Mon, 14 Dec 2020 01:11:54 -0800 (PST)
MIME-Version: 1.0
References: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com> <1607934255-52544-3-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1607934255-52544-3-git-send-email-luojiaxing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 10:11:44 +0100
Message-ID: <CACRpkdaj4yZ0MAh9J_uN5+1MTH37fQiDGnj0O9UTeZYazEzZpw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MAINTAINERS: Add maintainer for HiSilicon GPIO driver
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Garry <john.garry@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 9:24 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:

> Here add maintainer information for HiSilicon GPIO driver.
>
> Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>

Patch applied!

Yours,
Linus Walleij
