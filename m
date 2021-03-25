Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF68F348B06
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 09:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCYIDs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 04:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhCYIDP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 04:03:15 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF75C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:03:14 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q29so1189794lfb.4
        for <linux-gpio@vger.kernel.org>; Thu, 25 Mar 2021 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RUQQ17pfF98h7CsMopKhBpalX6SwViYZJyiCT0Dk6fk=;
        b=engkWQ7VAcLaLe+W/hLSlbhd27mHjU+Abo/v5CfcsmDbaEWOwBjQA9KsuBnRKc9A1p
         nfqTD2MdCPq10qveGeDsI5+OYOHJjzpa9HsUesPSdOI1YatKQYKIaJK9f4GgJmKRCXZp
         gleZYIEzE+zATlNgenryame7GnrkcNxLHDmkCrkUwePr6vwepgZfEBVzZDbh6j+SfJrj
         mgv49NUJx2IYYfN4fed5XGJrBLR7BO+BONb0zH7ZJ9Be6lA1U7QX7CMd55FjC+kfawK9
         u7WsWEahi1PS6VRhaRHE4PNEJIiz30AlhOD1teEfd6xgxrKJ6SP+bwhoPr2wlenmNgBh
         UHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUQQ17pfF98h7CsMopKhBpalX6SwViYZJyiCT0Dk6fk=;
        b=TJdKR0KziiISI8s247VV9EuhCAuN34eh6AEiRSk7ef0k5TOaccuDs7qI+qxWzo6MqF
         UW3nKj05YzrDimKCiZLYoYbagPqW2x535uxiLhaYsf+esmXfFfYE84GssdWX/c45BvHJ
         9Eu7TTAw16xmsrj22AdyQdLXo9US0QjSBZWhEla94dUtH9iyIHoiCMoe1J2kJ1kAfF7q
         0wh21ZhPA+UAXmXcik8rXPIWnj3XlkUojlwd8tuK6m5AqSTfSqh81aNy5+z3pvUfG6zr
         Wrh/pYs9ZUsTd/A51knhHxfehtJBv5DOYw2aaxpawFYGTd0zt+lcBeOsk0Is8uxuvU7w
         k5og==
X-Gm-Message-State: AOAM533ledB3aGBZq9Rqxf0HIXNbYm4z5VvTFaoToUuzEl3QS+MlaFTQ
        NKOX3bSQIUiz85eXEqp9555q3tKl3nZ03A05Hj0Hqw==
X-Google-Smtp-Source: ABdhPJwDfUh2m/FklwRPWs5IDoLHRwfoEvLvH70YnfgRuIL/9f344F4xGYJbD9HfvZUuGO5HcxBGYL1MR5lww1MI2Qo=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr4095968lfa.157.1616659393242;
 Thu, 25 Mar 2021 01:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210323221905.19529-1-rdunlap@infradead.org>
In-Reply-To: <20210323221905.19529-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 25 Mar 2021 09:03:02 +0100
Message-ID: <CACRpkdZjz2_BVWD3eD38jPy8Q5A0YO9AvkYhff7bM0_3aa0mew@mail.gmail.com>
Subject: Re: [PATCH] linux/gpio/driver.h: some edits for clarity
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 23, 2021 at 11:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix a few typos and some punctuation.
> Also, change CONFIG_OF to CONFIG_OF_GPIO in one comment.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
