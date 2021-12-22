Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773CD47CB4F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Dec 2021 03:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238614AbhLVCQd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Dec 2021 21:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbhLVCQc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Dec 2021 21:16:32 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9039BC061574
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:16:32 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id t19so1708415oij.1
        for <linux-gpio@vger.kernel.org>; Tue, 21 Dec 2021 18:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TjvSc6Zc+phiwllv9IBUiUWQ+4eYlzKIjbFvpbNL+r0=;
        b=W+tvuM/1MFvZJZ9ZafbDYJu8HqtyQA3TB2JNiXiRXlaYEY4alQSki7xDIF/FvRMHOf
         lZWRjnaMueYhqE7/1bk6mDTjMlRmQZK/C2GLYaaHUhIuKFarJdVLqJYADJ4wU3mgU9/U
         TfmfIobvYOFKcm6LEfXy7EyUMWMXsjOEpJ+6712KkGOuzcJV4Grw4N4vviZ97Fd3ubEy
         j7LTyp4hQqWazdagNLbVQxQ7ov6OBxfo4+lZiYylI8NWSigwxdVHHWLghvCY1vQ+TSM5
         lRjqj3br36pUrWkgQCgOMEP6aNi3PSZtd0kHed7uqn3vffZLmJrV25lUMGg8PSVZUmmW
         TbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TjvSc6Zc+phiwllv9IBUiUWQ+4eYlzKIjbFvpbNL+r0=;
        b=SmBywkfVjBXNwauAsn5Xz/DZboeBQsDvwJfWQXZm36dm1iOWC/uY+7HWNpFRymreT8
         z5y8XzHRbO13M5t46DUrbtLxlxEqFWcjwqG52Z3uN7Jk5LkBDsVu8b4Fa6miJD/f+RSY
         DEl42/qogKpBhqfKL4uxuze3dVN8oB2MNCmQHOyA56C1VIqzGRbKiYtmaCZDLGQqO0jg
         68KncWAn5FA13XBlL2G3s6HIRy/Zr54bRGA0PD/I9fywobGOjVYhMyfrtN2PWPa1URiS
         +VJ20990qbhLsjSM5Wl0uhbTFf/YJJ2echstHMMDULPGfASUJnnyM3SBpjFeDuyuOT7U
         78WQ==
X-Gm-Message-State: AOAM5313bXC563pcBC3S/OA4WvnXIM1hrxkzms2hqmHOBRcaSgFgQj4Z
        zzQ5gXr88kTzbYMmf+Ii1OXs/C7In8EZ4ifi40j32w==
X-Google-Smtp-Source: ABdhPJxcTE0tRvTBllqs3cr0F9sO0zZeXMvsl/bZflqBg+hsNfi88xkWkosuNmr2F7f9aKL6ThDkerca0MXJcliVCvc=
X-Received: by 2002:aca:5a87:: with SMTP id o129mr728405oib.114.1640139391889;
 Tue, 21 Dec 2021 18:16:31 -0800 (PST)
MIME-Version: 1.0
References: <20211220062406.108789-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20211220062406.108789-1-yang.lee@linux.alibaba.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 22 Dec 2021 03:16:20 +0100
Message-ID: <CACRpkdbfJY=NKgZ3GcNG9QqrFpCkQpXMmLcWJ20EcPuQ6WfVdA@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: starfive: remove unneeded semicolon
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     kernel@esmil.dk, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>,
        SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 20, 2021 at 7:24 AM Yang Li <yang.lee@linux.alibaba.com> wrote:

> Eliminate the following coccicheck warning:
> ./drivers/pinctrl/pinctrl-starfive.c:1029:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

This patch is not in the pinctrl tree, I guess it is in the SoC
tree and need to be applied there.

Yours,
Linus Walleij
