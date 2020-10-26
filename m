Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99DC42990B3
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 16:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783188AbgJZPM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 11:12:29 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:36221 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783163AbgJZPM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 11:12:29 -0400
Received: by mail-il1-f196.google.com with SMTP id p10so8642060ile.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wn1ODQUaxVz1ad1Y9cz/kf+wv6QR59qf6Q855hVnhZs=;
        b=rQ8P15tnMTbGMdpFOn3ewdM6ZfdIu1Jb5yO5IQGY3uRW4mPBShCktDrATL3Yv4ku5C
         QS0N4JAqWV2rNxMQ44x46HjY0g8r3ZkDFoOAfpf6g3IJ1KWt+dbBpmtX4WpJ8qwpacx7
         3r+rnkQtxx+U5/SMjpJkUwH+OHKP3ov9T/xFWwRWedYuXAceasJmqzjyx/whs1MRQRHm
         M8ySpQFR9EC09fN6YkPqTiuFGi3UHrryFpYvMEzjrWkX6eHygHCSpJkuPjnxim1VJ2HV
         bAqShOllAPcSrHWUY/+wsNHrLKKAV6X0htVD2UcdYqy5WKlQ6R8lg2cdpqsXRxD/XPX9
         hvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wn1ODQUaxVz1ad1Y9cz/kf+wv6QR59qf6Q855hVnhZs=;
        b=Gp9ZNOxmc/1DZYPReKz14Zns7f+3sTcITICemCrgbnhwzqopssA13XplpqVLBxBgW9
         H1qRDBbKXuj96BcCb1HTGYE+QVm5GKNufPFv3t0v/PVLFra3mtZxMFogVue7rxXHpTih
         YjVDxqVNwPxFCG2T1ewZbT7g9HNwNfnVLmMpwYRZCNJ33vZrn88W3mqMG4fpaPnInklu
         5B5g4y07E3x8vLPZIVaALI6ba98NKbTWkgxXfb1dR8WJ6FJvWTBXNs0GRAQAc7xFxrST
         r8blGm2iqpHU2nxWvXMJesnJu65LDn59c13qO0HfqRDkWPmQBWFdm6ZpXYIRE8urWrm8
         ZK2w==
X-Gm-Message-State: AOAM533XREPHg/7tQpODIk4AZ/OSw6c19PE7WL9GeV2MICp60FGj07Ng
        Yw8uuntOQUUflL0weXz2U6ZEf+w8F3ARESCs2YmLNA==
X-Google-Smtp-Source: ABdhPJwUZ4IeEnagKBwA9F2Ec6HxpMHX8vnBcpTHVTiiWlvyZ/OEyO1SOFob+K6PjiKVmxNrdpuPx0dnwRMBTEdVWIk=
X-Received: by 2002:a05:6e02:df0:: with SMTP id m16mr11038058ilj.220.1603725148519;
 Mon, 26 Oct 2020 08:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <20201026141839.28536-8-brgl@bgdev.pl>
 <CAHp75VeUuZ1Qock+n_9ee4ESD4-kfYyy1AwPA8PJXmWaYNdsvA@mail.gmail.com>
In-Reply-To: <CAHp75VeUuZ1Qock+n_9ee4ESD4-kfYyy1AwPA8PJXmWaYNdsvA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Oct 2020 16:12:17 +0100
Message-ID: <CAMRc=MekeB=ik_+J7e7U9wicdaHG7PPdMDtP=X8hBQRRrrOE7A@mail.gmail.com>
Subject: Re: [PATCH 7/7] gpio: exar: use devm action for freeing the IDA and
 drop remove()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 4:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > We can simplify the error path in probe() and drop remove() entirely if
> > we provide a devm action for freeing the device ID.
>
> Always the same question to IDR/IDA users:
> does it guarantee that when the driver is gone the IDR/IDA resources are freed?
>
> (It's not directly related to this patch, though)
>

Yes because there's exactly one ida_free(id) per id = ida_alloc() here.

Bartosz
