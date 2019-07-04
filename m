Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7D2B5F3FD
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2019 09:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfGDHlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Jul 2019 03:41:42 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40344 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfGDHlm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jul 2019 03:41:42 -0400
Received: by mail-lj1-f196.google.com with SMTP id a21so5172019ljh.7
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jul 2019 00:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JtSGWtPnsqSX1qy+qOE/bF3OjtUMWO0hzBLVZbI64kA=;
        b=Gl0uZAl2rLycKWXswdE0hKAGnsELyqL2erOHGwEGn4LGDS69O/NYTzdXwx82qF6Mto
         y+D5vAOBcYpiLzMNWlmakK71/25Q4lpoytjb/TbodJbl3Xs/FfdF3tvWM8+JGDY4nrmz
         wW1QaHkN/H66xlJgGit1sPMJnTC66WcauYmUsUyEJo7LoQjMpX08T8MRjlP3hltZWzVD
         S/cjA0JbKcAJnMyXKlmgiLxwDZozXFVD28SFoDHXHAYybPffSh6o+MWL8NQOiyd5uFa6
         BrBnx07Xbb/KrXbEXW29rIP9T8XozdThfHEgiEwRtNqyJoPwK6finaLlN1m8VB/egY0J
         iqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JtSGWtPnsqSX1qy+qOE/bF3OjtUMWO0hzBLVZbI64kA=;
        b=IwVWLgBPnOGcdsUEPSQvOF0pWBwiMp/ma/JPvNp3R3yUo9FOnweDl3wbq66ccFsH5m
         aLBC8ik66Quybu+Sg3gXIsQU+/yH/sLgQHIeKzA0U9U54/KE2rihOan6ok3Z9h32p0Vk
         ksVWV50kcG97RjOdXx7riaV0Iinw+V0aCXYcGlMr3ZAOiJJU+fS7PzZnqraFcXo86bQZ
         l2kl0S233oA86EQXxIqEyyybHDryIAz/j5PbPkc60PVAXiRSglaxLlIvj6CeC5P/Z1Fo
         bdvDvQTVhQIk3ntYK/K9AIsFz7dmeS4mRxVWufcA7NVKwsTofFuaNOfrDvJjqTN7jDTc
         XRZg==
X-Gm-Message-State: APjAAAX3U9ny5EItuy0exNns5CNtu0ql7govsGnWVi/bhMUywQ/bhqem
        M2qXoSnLISCEkDwB0OmE+wdcxERVT3x+qwtizjx8tQ==
X-Google-Smtp-Source: APXvYqxqI0SxqTCpnza6dJ3zLkQg0tGMx6p/W/BX79omMIjAQPchR7Hv2qy4lpBM6NGQKfImevFJRrvpmxEERxYge1g=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr24150394ljm.69.1562226100168;
 Thu, 04 Jul 2019 00:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190702223248.31934-1-martin.blumenstingl@googlemail.com> <20190702223248.31934-4-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190702223248.31934-4-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Jul 2019 09:41:28 +0200
Message-ID: <CACRpkdZDicvUNg6P5m1t4G4-7yX77sfdU_spGb19tRoNzVMsfw@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: stp-xway: get rid of the #include
 <lantiq_soc.h> dependency
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     John Crispin <blogic@openwrt.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dev@kresin.me,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 12:33 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> Use the xway_stp_{r,w}32 helpers in xway_stp_w32_mask instead of relying
> on ltq_{r,w}32 from the architecture specific <lantiq_soc.h>.
> This will allow the driver to be compile-tested on all architectures
> that support MMIO.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Patch applied.

Yours,
Linus Walleij
