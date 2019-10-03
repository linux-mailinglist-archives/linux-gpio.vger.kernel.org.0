Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39E2C9EEA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2019 14:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfJCMyh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Oct 2019 08:54:37 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41518 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730208AbfJCMyg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 08:54:36 -0400
Received: by mail-lf1-f68.google.com with SMTP id r2so1744334lfn.8
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vsh1XlcqiCbV/88Hqb8SdUEhr0I4PfdhVYwP9WbaWkc=;
        b=HDnbvcVK0V61vUTZJgZ1ltT+xAb7sL8Eq9t4zdVEeMYUnUxdGezi6uaNdah1XaWkHW
         FbCVERnF3VQR3C5cP8nidxlTwVoA68xsuqnUCbQtbfbrrdulerIxyrrfXfU4R6qKdsMN
         3W/PA57dXkYb2xwQpzzKuIWYcqWJ3u6RZRDz9H4PyQZ4ovpIvPT1Em27gtDUZ6PT5gMW
         5uNJeip80oUeyDfp35poDXbSEI0kRX1Jy/Ct0L3oubqvhieRWGHXx1AK01GDeKF08zKK
         6DcMck0p2dAJ72r6WXNmwali2eFZF430J4rLAuYJPDLnDkBhvQWidZiAlaSc90PhsCjj
         tiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vsh1XlcqiCbV/88Hqb8SdUEhr0I4PfdhVYwP9WbaWkc=;
        b=L3qyUwtkFCmDxSgr3hiL/VT2z3352rdIvaPSNaxVT8N5WPJWgekXgXtk+aGqS3ocv2
         sHF8fXxwaLH8WGUiu5bnF+GfeQE8pwyWHJ9fOrNiEvWOL/FAQTrWDN5x7VASd8fVYDN6
         UXPTD72x+zYDK55jS8zuTqeaWW+w6TO9nocmtp9SppH7A1UZJJ2hEgQksoysbZTDxPuq
         R4QN7vf/CVAQBPddbBh3HnYscbMcluPUdQGA5lXrIPzPpncdmG6GzVhqmO2XbxJz6Msz
         nrNHV/5st4dPJE/Lz9hZLAL/deFGpP0Iw3xQFObm1vmF/QBcnkBxNZHbFoC8i+PuopSU
         Ahlw==
X-Gm-Message-State: APjAAAVq1dK/4ucXaq0y+FW2ultmzXo55B5JejaGv9UaFPqRjuE0VLnl
        gIkObKSB97X+DrYATrEugOyk6ZSzjJpoVt4oN/hxk3qgwzQ=
X-Google-Smtp-Source: APXvYqyU0/XkmTAMfgX7X2G6a1zIl0KzjJAR0ocDPRzs/WhQvO+9c7gr7UN9bMALbMJAx7kliOdpxbteMul42ZmbKXY=
X-Received: by 2002:a19:117:: with SMTP id 23mr5753856lfb.115.1570107272881;
 Thu, 03 Oct 2019 05:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191002124206.22928-1-will@kernel.org>
In-Reply-To: <20191002124206.22928-1-will@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 14:54:21 +0200
Message-ID: <CACRpkdYFzrUT9YE3VvRdWpx-n9szyvoOnEBM7GWLZAv8t1drww@mail.gmail.com>
Subject: Re: [RESEND PATCH] pinctrl: devicetree: Avoid taking direct reference
 to device name string
To:     Will Deacon <will@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 2, 2019 at 2:42 PM Will Deacon <will@kernel.org> wrote:

> When populating the pinctrl mapping table entries for a device, the
> 'dev_name' field for each entry is initialised to point directly at the
> string returned by 'dev_name()' for the device and subsequently used by
> 'create_pinctrl()' when looking up the mappings for the device being
> probed.
>
> This is unreliable in the presence of calls to 'dev_set_name()', which may
> reallocate the device name string leaving the pinctrl mappings with a
> dangling reference. This then leads to a use-after-free every time the
> name is dereferenced by a device probe:
>
>   | BUG: KASAN: invalid-access in strcmp+0x20/0x64
>   | Read of size 1 at addr 13ffffc153494b00 by task modprobe/590
>   | Pointer tag: [13], memory tag: [fe]
>   |
>   | Call trace:
>   |  __kasan_report+0x16c/0x1dc
>   |  kasan_report+0x10/0x18
>   |  check_memory_region
>   |  __hwasan_load1_noabort+0x4c/0x54
>   |  strcmp+0x20/0x64
>   |  create_pinctrl+0x18c/0x7f4
>   |  pinctrl_get+0x90/0x114
>   |  devm_pinctrl_get+0x44/0x98
>   |  pinctrl_bind_pins+0x5c/0x450
>   |  really_probe+0x1c8/0x9a4
>   |  driver_probe_device+0x120/0x1d8
>
> Follow the example of sysfs, and duplicate the device name string before
> stashing it away in the pinctrl mapping entries.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Reported-by: Elena Petrova <lenaptr@google.com>
> Tested-by: Elena Petrova <lenaptr@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Patch applied, sorry for not getting back to you earlier.

The fact that dev_set_name() is reallocating the name is a bit
scary, it doesn't feel super-stable, but I suppose there is some
particularly good reason for it.

I guess the look-up table still refers to the struct device *
directly so pin control functionality will work, but the pin controller
device name down in /sys/kernel/debug/pinctrl
is going to be bogus, am I right? Like the name given there
will be whatever the name was before the call to dev_set_name().

Yours,
Lnus Walleij
