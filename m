Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA6B63F269
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Dec 2022 15:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiLAOOO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Dec 2022 09:14:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231414AbiLAOON (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 09:14:13 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C52AC1A1
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 06:14:09 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s8so2673462lfc.8
        for <linux-gpio@vger.kernel.org>; Thu, 01 Dec 2022 06:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=03vjQd7Kvpm2Il5S+crg2SRfXFsHiGIxeUvBAe5B0eE=;
        b=reO/Wq4P5pT9rRVlRZzQ50yZpyMt03KawM5w6DT5GC7MECmMe5ELTQ0c2hN/O/EFIe
         /irRtvaMbRn3fHzRFI5M/G47jCffnpGnWY55+9XENxTPN+mIdfaC0ezP7EkJ99EIX1zS
         pXC4lvM7x2JlhqgYpgPQ5+T58/m7fNyL7YDahPlQCqkZupeFGDVykg77X/lb3MzYy7fy
         Yb2DCw4W5xiwlWTY/YuBK/SDRj3jfPisKUv8BtSxQKx5cytE3a/rCNM8jEmrsh8zEooO
         RgpFIGwJjEQzLUUHr0xkUgOWKo3aUancBGfPJMvSmccCf8PjknJXR+BcN3FmtVN776ZL
         7/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03vjQd7Kvpm2Il5S+crg2SRfXFsHiGIxeUvBAe5B0eE=;
        b=kDkuQTDcGasTwKDdqNyzNMe5MIJ+zEjxWZNuh6T/7PdhATtcdcUn3ly0if9gZHbgl9
         JUWZRWsfUJJNfU+F9h+/eyiRlewzUMVxMQxNu8jgI7Ihczbnpo+LNB4r1GYeEawSnp+c
         vc6EoKFf/DJqNRAZ0mekNlohA0+QDwL1wEFEIy/by0H1Z51reoaFBqlaaEsHlD2iWrRA
         wUcBUgzibUN0ZxmrtB30K8fSIVjEs/v1g7PcGMmIAFdqz9prUT2ajL1XjGb0MVsVpqXD
         L4rSVyrmBK9WyRRS6YK1LNf7BbhD2zhlSCb1Gwk6mQ3xDW538XaOv5fVxed+mF24kDjf
         qdig==
X-Gm-Message-State: ANoB5pmQx8vQtsL2ta3VMULxVDocxEeAYvyhw0EoV+WthJMC27MylgIY
        bxc5NDE4wb7zgZlXnTD4w4snIKLmEUoEfr8LrFjq1A==
X-Google-Smtp-Source: AA0mqf4mtkqHFM1auobpdA+4106PJm/e4eyouGzDlTHgHJmxdX7q9XFRSv3bn15E0o21TISdJHVtajVKQOzM1BDmyyc=
X-Received: by 2002:a05:6512:3d14:b0:4aa:7eed:f70c with SMTP id
 d20-20020a0565123d1400b004aa7eedf70cmr17954804lfv.630.1669904048270; Thu, 01
 Dec 2022 06:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20221201125928.3031325-1-brgl@bgdev.pl> <CAMRc=MfGi52s+LcTrBnBPDV91SbC4vf1prrLUpzQ_KZQQZGBuQ@mail.gmail.com>
 <Y4izMVZBhXGj1jbj@smile.fi.intel.com>
In-Reply-To: <Y4izMVZBhXGj1jbj@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Dec 2022 15:13:55 +0100
Message-ID: <CAMRc=MedXBgh+JnTL0qUOrhKJ+w0vcVZTk-k2TKJzdbk_TNtVQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] gpiolib: don't allow user-space to crash the
 kernel with hot-unplugs
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 1, 2022 at 2:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 01, 2022 at 02:00:06PM +0100, Bartosz Golaszewski wrote:
> > On Thu, Dec 1, 2022 at 1:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> ...
>
> > I know Kent and Linus left their review tags already, I will add them
> > when applying.
>
> I guess it's good enough, go ahead with it.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Can you leave your Reviewed-by here too?

Bart
