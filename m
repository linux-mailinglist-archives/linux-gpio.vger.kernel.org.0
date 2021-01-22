Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5B2301057
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 23:54:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbhAVWyH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 17:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728943AbhAVWt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 17:49:56 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C8DC061786
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 14:49:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id q12so9725661lfo.12
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 14:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hFqxITJ/kjeDG2P1yWw2xgXqtJJ5NxGhm9klFI3NBC8=;
        b=KQHnomUVch64dE+lLq+W+ZLldPYPV9dXf0NMuNWCe4vYfRB5rsV6yA0IhuhfWySbin
         +zE8PCFBAhpKFv+rCsFi4JxKdyCJHlCPdp2Eczkwkap+W/FBKjLtoQUJP+cps0By+s8F
         jvZ7EVreZ1rMR9opYmFB/KZqNpZQjwX7NEl9HYQAGjv1rNeO6oQZAXsisPV4XRJsLKJH
         /es5XoIvKS7nfRk8uKUSSMH4qiW/8+BnclKRAILSpSgvVAESqfOYGhIbvBzyeIBZcnrZ
         gHuLjLRbAB2fvdEHK6vV5RGNoVOLKDu25a4BygEc16eLZ3zowgMBbJnlcr9kAg/BFDex
         Nq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hFqxITJ/kjeDG2P1yWw2xgXqtJJ5NxGhm9klFI3NBC8=;
        b=SNElBsTrq7tSmeT44UZB+l/kEvNuIKD7Zyxqkz8QRP8YpPJ34zo06fUNisNnrUOv+m
         oPi1it9DOi4O9jKd7TFdcwUwkL5n8k0sfDfa7xawo/7nDJE0fBurY7OnWEBE7R7JnzJn
         Prz1q8hwCXYtZr5Nu7P578lffeinpDz0hotnOUYzhVRgLkGPulcHpaag1bq2WTZxZfWP
         QKxZ4MbKyjEotuAqJ40IKDGCN+cOyVVZoR6I8jdUdvI/Y03tFEK2VAurhUaErvhNJCbL
         /UOX9mhMEiR43H4d2Usl85OQCPF9NtTQkfGF80GQgaIY0GztrO9R4PXoWUQ4JJ343llg
         XfrQ==
X-Gm-Message-State: AOAM5321ohrXlQWuwZGJ2Of9Vgz3QjwBH/4RbUa9kaw93auV2oeAG+j5
        2XciWIxaYfxa8xXTzafSlzMPzB3RyCpuEQV7XiUiNA==
X-Google-Smtp-Source: ABdhPJwAU+6Jqx1W24ybS/wG1g9yGkd/VdwBp0lvRWjc4qVAt7I7HgrVnDKDFipxsyfcynMdtoDSnEB24BY9L9kAkAg=
X-Received: by 2002:a19:495d:: with SMTP id l29mr742605lfj.465.1611355753600;
 Fri, 22 Jan 2021 14:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20210121141038.437564-1-warthog618@gmail.com>
In-Reply-To: <20210121141038.437564-1-warthog618@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 23:49:02 +0100
Message-ID: <CACRpkdbHYqxjC=GjVeE391Qq5szvtRbP4HAR5bx+XRuL1HmMew@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: clear debounce period if line set to output
To:     Kent Gibson <warthog618@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 21, 2021 at 3:11 PM Kent Gibson <warthog618@gmail.com> wrote:

> When set_config changes a line from input to output debounce is
> implicitly disabled, as debounce makes no sense for outputs, but the
> debounce period is not being cleared and is still reported in the
> line info.
>
> So clear the debounce period when the debouncer is stopped in
> edge_detector_stop().
>
> Fixed: 65cff7047640 ("gpiolib: cdev: support setting debounce")
> Signed-off-by: Kent Gibson <warthog618@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
