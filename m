Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A23711404E2
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 09:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgAQII4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 03:08:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35360 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgAQII4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 03:08:56 -0500
Received: by mail-lj1-f195.google.com with SMTP id j1so25485927lja.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 00:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EY3MDI5ciUTutsW9nonI2UHL7I986Z5xdSY4jNUrHHw=;
        b=fulSRY8oeM3Gq4+0fsk5tldm6ztl7J9O8ivgWIom6Wvq/T7Ae4FdXNHkDgV2CJcL+T
         2N5RCIvGVV5X3ypU0r0jeC8t3Gfupp9leH5VJ5LgsBX+DEPH58kV0zJSKTgPwy/Kr/MK
         Pkcl9UOpIb87ebKGXANKSLE1uZkhtnovUC9tOwAPVQ2lyoT9Uhm0MPmZWuU0Fp/JJQcR
         KbUbkLApLO+rZxLl2GLv5qhF9lvCTL3ECnb19bIwvSpvQpzDBkfgc2VNGA0W8kye9SCZ
         5lQB8hrmqXXbvsrG6BpgFNhWvKM0ve3uMXTLR5fkg/FgDSKnhoP7u/USJEkM/66lWafl
         RtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EY3MDI5ciUTutsW9nonI2UHL7I986Z5xdSY4jNUrHHw=;
        b=i5xRbvFYDCJRiaz6DOfAar/JNlNmubRVhA10u9kZVVz9eB0qhRqxu35BX7vImEsFRr
         WWpVg3aHgQcxAIWfgH76rEED0zn4S0IOL6aXEHWTUg2VwcpAdBrhDwPMgcUb9ekGGxfc
         Zs6YEEPLn4NzzTxJsKY/xSJKqPs0bgND2Jz8gq2/jnH3rFT8orvOit784Z12eqKDXumV
         oQwjOifxoieRA6HltZyt/ayljwxOuvmWNZTV4wytW1if1W9NDtFcqOgDHoPI5cDlOcE+
         GE2roohmXVRXS7rntp6yuq+OKilWbzwdEx7sl2Y0errQmZB0RIH3TwyUU4/l+yBFfuVv
         naeQ==
X-Gm-Message-State: APjAAAUJ+En1W90OVrvWD+KhBHXTS3lpev2ze0l+Xw2aKpSAnaZioqRq
        2N9grSck6J9m3dz4HC1+uHglgcjVQ4yzbK+vbvt8BLMYknhCfg==
X-Google-Smtp-Source: APXvYqxIb6G5NbLrv17U+WPUebltCB0+YJ6A/4NyhxmiAXJmr48YKWkCnPYUnrJz9sij/hdz9rdCGiDXpqZj8Vgc0mI=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr4807219ljg.199.1579248534014;
 Fri, 17 Jan 2020 00:08:54 -0800 (PST)
MIME-Version: 1.0
References: <20200109111902.GA47863@black.fi.intel.com>
In-Reply-To: <20200109111902.GA47863@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jan 2020 09:08:42 +0100
Message-ID: <CACRpkdbAOTsjAHNv-RE+DQACysd_zX=yVWKdprxE7gubWF-Z4g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.5-3
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 9, 2020 at 12:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> One patch for current (v5.5!) cycle.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:
>
>   Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git tags/intel-pinctrl-v5.5-3
>
> for you to fetch changes up to 9608ea6c6613ced75b2c41703d99f44e6f8849f1:

Pulled into my fixes branch, thanks!

> Linus, this is material for v5.5 (this) release cycle.
> Do we need to do anything about this PR to be applied soon?

Not any more than reminding me when I get too much to do :D

I'll get it upstream ASAP.

Yours,
Linus Walleij
