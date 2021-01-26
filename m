Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36872304257
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389836AbhAZPXl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392729AbhAZPXf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 10:23:35 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56435C061D7F;
        Tue, 26 Jan 2021 07:22:53 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id a12so15080201lfb.1;
        Tue, 26 Jan 2021 07:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+mBnR3VXkaRy9N4OGkkdcyJa4ZmDlJBBt01ZGkJAXs=;
        b=AfwqIi885h0UWkW29YOZV5Lde+xpkHcW9kNV2bCWZOTzbUWT/sbstMW4AA2/xl3kfk
         0efaE9AMlSPbt16b0+3qPIbzOLjmiiKU/bGGgIPkLnTdHFf2st+6I3CPYhzoKvVKKfYF
         3Oopufis/JRKY11nnrUQdYQ8CKyfQaQKhSKbhKnM6rSS/1g9kNu8Fe0Kd3sfoEDDCtI9
         rFvSd/Y/ghtLUXIX7TB5gm1b5yzHpiPhWP8FEckt3U6OMu0ZZGMdslPtWIpDi/5/FtLp
         U72I7i/Wc2BpALP11ajlxoe5/p/QipOqqaVtp0B6+B/JXRgPHVlz0niF0kIfDAwcz73I
         WnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+mBnR3VXkaRy9N4OGkkdcyJa4ZmDlJBBt01ZGkJAXs=;
        b=BFkSrltMgt1Za8AWPlCUNk1Y0Qz9mfNsk/PrOTZfdWIoLlybIqaIkmSXvS60Kwbg9T
         88dig5jffd5GXzJD+6lBlmjE29G6JvzQoM4M6TAPeuhdiP8Ggxp8UN/qrFOho2BNgeKD
         m8fS/awVCo09IBD3Mc9lXlrSIMMSJn1o8q2h23/BbVCh/85Rw0JsK1vzjDn1/Ffyhf6z
         seNsAFiJ5DoTnQ81393S4NB7wICJbpCKxEwqjhkFevQNpp7XCHWXSkuFPbuQb2JXVNTw
         eZ29wLFXDYHpsAKM1i4/UPNTp/Gcn0Ijku0YJzaK64xost8x0zWqunh1cMLcr1ZSthor
         NhuQ==
X-Gm-Message-State: AOAM530Rp3B1IltF61qiVGOBOVGyl1tJP4k95YnT1iOMv5iWj9griskT
        1D/djOVzYhFn3QAgFq7p/TM28ubo62FTAy3XzMM=
X-Google-Smtp-Source: ABdhPJxmhAGVYKyYPou5zTitgoNIUKx4ylZWLEkZUUua5BVLo1gqz/4FfNng1wXXktSOawRGZGtUoRVXKmh3ahMaRO8=
X-Received: by 2002:a19:7ecf:: with SMTP id z198mr2752766lfc.650.1611674571883;
 Tue, 26 Jan 2021 07:22:51 -0800 (PST)
MIME-Version: 1.0
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
In-Reply-To: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Tue, 26 Jan 2021 16:22:40 +0100
Message-ID: <CAMeQTsbGBrTvfkz6BStwL240Kz-dbrQVKtXbYkRtbD3OoUKCcg@mail.gmail.com>
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 1:37 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi guys,
>
> This is first part of Intel MID outdated platforms removal. It's collected into
> immutable branch with a given tag, please pull to yours subsystems.

Hi Andy,
Do you plan on eventually removing X86_INTEL_MID completely? If so,
then I should probably start looking at removing the corresponding
parts in GMA500.

Thanks
Patrik
