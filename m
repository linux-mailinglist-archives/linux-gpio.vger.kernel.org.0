Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0622F482FC2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 11:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbiACKFk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 05:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232467AbiACKFj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 05:05:39 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB035C061785
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 02:05:38 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id w16so133979118edc.11
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 02:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zyqrhqFrOjKgAQ/NgiI6myye+ZTSj+oGpoQCEyxK7I8=;
        b=hh82xL5h3iuQi0w0UWmziHKDei2V7WmW8Q1scEW+3QAUMeU9NQzjI4tQbE7SdjFtf1
         jSJxTC6JXmJC30t8UiD4KSbWgFjgI5vzj/f4kgXCMMF1cXpyBUaEbmKaciHqvMxsbzsA
         s6srxiCjzdc1gKO+ggXM4XDCqtT2PwzGVzkb/jUr2J2ZhWo5kOfS2MJEdIdlgYONwV+r
         8UXM2kZvxf61JNCPztpCEKlCSclwA8LLCiKZq9s5TG2Hj+M4q7kIxpkcgP2mbBpk/j8b
         XueqCMflL2VGG7B2jaKdv/ucS5zBVJXPEWQ01p2ABMjOQzlW4lcBw20nefVTfWSS2F8G
         U11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zyqrhqFrOjKgAQ/NgiI6myye+ZTSj+oGpoQCEyxK7I8=;
        b=hGhhKgxQqbOWFmB4IBiBC1Dbg0PlElDIZFc4t6vqNscWAT7+jIAPwgmtXLu/ouHRlR
         gSnSdYYx++VFfy778I2XiPiLUMZEZkMabAcOJNycV4jvQyUVd7nPFv+iIuej+97XTWc+
         UWNbuOiGGBfocMdUJzCmYvfhCjY43G6cWFI1ffPcE2ES5gItTV9dSAavybjco02Zxpcb
         dz/aqsDoEiqodv8lMknaxK5t3VbACuYfITjiB9hdRc0fObhXkdU33pqCwNQ8tDt+iXTR
         Qfe2z6jzGS7hn8JGMI7HdT1tC5NrdBAz5Rye2nfdM15akoNbzGNCemr9kG/Z/gnViRF7
         Mh3Q==
X-Gm-Message-State: AOAM5337AJB54szgJj5z25kbLILykrn10fMyCxPUC6EfseUrQ89vzot9
        UIAGPElEpuochnOqWQE+L0ccW/vclqRjWrAkmtMZhA==
X-Google-Smtp-Source: ABdhPJz0LLpdg5ZlhYjWS1ccr4u0SOQqQpZlRsNizsQSMtlQ61aLAXVlFvutkF5sr+/qADHHxZmu4uWBVmQTZlrVwhI=
X-Received: by 2002:a50:9556:: with SMTP id v22mr43073644eda.69.1641204336956;
 Mon, 03 Jan 2022 02:05:36 -0800 (PST)
MIME-Version: 1.0
References: <20211223103809.12343-1-andriy.shevchenko@linux.intel.com> <20211223103809.12343-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211223103809.12343-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Jan 2022 11:05:26 +0100
Message-ID: <CAMRc=MfCu8Z-FLdyz8eAqjj+soARUk3zoL8jDFpe2VyLCd2r5Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: dwapb: Switch to use fwnode instead of of_node
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 23, 2021 at 11:38 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> GPIO library now accepts fwnode as a firmware node, so
> switch the driver to use it and hence rectify the ACPI
> case which uses software nodes.
>
> Note, in this case it's rather logical fix that doesn't
> affect functionality, thus no backporting required.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
