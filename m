Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87C92A7B80
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 11:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgKEKTd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 05:19:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKEKTd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 05:19:33 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB58C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 02:19:32 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id t13so968735ljk.12
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 02:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=w0EEFVjOuWxK9nYQDrAcYV1Cnr2py0ChKwIezfinNIY=;
        b=YMNtSYqUkKjGiQyMcKAvFjbBs8YNKWWCKOyP6sDszuTJExz8uIzzysv3+hW0DNX2Sq
         zl7sxld+4pvxrVflH4MiCFZcTUSYJQ8T/CTcPXKTHayDnO1VmfNv3ydH/UfcoeHKoAUU
         Y88qGDGZFgB4tALotgUJaHTL+jbA29iRrBIG1T06zBnAPqFi6uSeVBe+VZj/CuWdZT5j
         XHxmtl35UEA8NbfAdR46HfDVzJGgScobhRtU5Y0GvHAPRo5WxiC7F/Y4PVVc6Q0/kmQo
         pgT2StrllDh0aXwdz5q34zwS93sv+5Yh3rw75d8MhkokvBJ162kCy9eMqBNuYmod/bcT
         rhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=w0EEFVjOuWxK9nYQDrAcYV1Cnr2py0ChKwIezfinNIY=;
        b=kB4C/q2BFFwoGSD08ZgGztRhI3tCu23UF2yPH3sTV0MezTn6bYEVGwUlqgQfbJz/xO
         e48xXNeThzEN0gCqfW1Yhb8nM9/yz7fRspR4auA84fo3Iqq5mwc5d5kVvk3Qchr4G62e
         PUuAMu7N3JDhHqGhlp8BGW9Q8+Qe7VZglQ0IbfIbR45S5wOtiP0vqqVvJzABugGmOH77
         nsFjXRGf+45SHxw3ufgaNiEm3RJ0OAi8wSVN+sexojdZNhPJw6r/PDyFL9YNH+7eojIZ
         MztygKdcxw8MoKV/eUpna6B1G0/2IXDbDgnG1xYYbJpbJHL6J8m13UwOdlRT08CRHcSQ
         y3gQ==
X-Gm-Message-State: AOAM5332L53FJ7bvdfMRiFIncp/fzjsqzZ3e3GVY1YYAGxK2+TK/1txK
        YtxBK2V2zv6n3qiNUfHA/jbTDtUvZQsLkhCFBgdPij0Sg52ZXg==
X-Google-Smtp-Source: ABdhPJygAmSR5+kV3BV32ZVoVoRYI8JR9s6NmQUzqde+NXeHJTbul5TUGflhJOV115KGym9MEtW46Ja8JWEcMoR3LPY=
X-Received: by 2002:a05:651c:1050:: with SMTP id x16mr679768ljm.100.1604571571300;
 Thu, 05 Nov 2020 02:19:31 -0800 (PST)
MIME-Version: 1.0
References: <94d51b0caca505238cd74895c6ec2382@cpinternet.com>
In-Reply-To: <94d51b0caca505238cd74895c6ec2382@cpinternet.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 11:19:20 +0100
Message-ID: <CACRpkdYAoWOpory7UrTQ_enE9tpu+xTX+D0ii4FA3kcuDVc0ow@mail.gmail.com>
Subject: Fwd: [PATCH] Pin control: core.c Eliminate three compiler warnings
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Sorenson <csoren@isd.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Patch sent directly to me, applied.

Yours,
Linus Walleij

---------- Forwarded message ---------
From: Chris Sorenson <csoren@isd.net>
Date: Sun, Oct 25, 2020 at 5:56 AM
Subject: [PATCH] Pin control: core.c Eliminate three compiler warnings
To: <linus.walleij@linaro.org>


Eliminate three "declared but not used" compiler warnings by moving the
variable declarations into the #ifdef where they are actually used.

Signed-off-by: Chris Sorenson <csoren@isd.net>
--
drivers/pinctrl/core.c|6 +++---
1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3663d87f51a0..e5d742056b03 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1623,6 +1623,9 @@ static int pinctrl_pins_show(struct seq_file *s,
void *what)

                seq_printf(s, "pin %d (%s) ", pin, desc->name);

  #ifdef CONFIG_GPIOLIB
+               struct pinctrl_gpio_range *range;
+               unsigned int gpio_num;
+               struct gpio_chip *chip;
                gpio_num = 0;
                list_for_each_entry(range, &pctldev->gpio_ranges, node) {
                        if ((pin >= range->pin_base) &&
