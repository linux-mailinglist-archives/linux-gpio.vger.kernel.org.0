Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287FF48FA0B
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 01:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbiAPAvm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 19:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbiAPAvm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 19:51:42 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A4FC061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:51:41 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id t4-20020a05683022e400b00591aaf48277so14979821otc.13
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 16:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BWwpkuH+ootvcKK/i61Jt0GFRxZ9xsjstBXvGEQMZG8=;
        b=LyYnJmCduKdl8Yzwbm2Mi7Ofkx958PxNJjqPtBs/TunC+tziVwOPC3BT0fUHTOvYfc
         hQ9BBje+aaLk6S53oAG9fYLLspkuZuLiNoiP7ighx/9/Z9jJDXL8W4T6vu1i0fhSXHrM
         nYx2dRyZOOhWN9UiwmKCQOFwEvvsQh51TF16nkXvXBkYuPm12s5zjJj/skRuDUTRNfrH
         yB6F3UpRLe48vv0H/ybqpnb6dwp+KQ0nERWofseeyqrzKljkfp6KD5GjBqQOrJAI9Mcm
         HnKjpRC3IVLuQR7pnQP9iTXBooO0UVWPWNETK3HmU1DDZosBUjbhxah1Rad2GYBGyRaZ
         bqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BWwpkuH+ootvcKK/i61Jt0GFRxZ9xsjstBXvGEQMZG8=;
        b=0up2siEMZwV8AOLSH3PCv0luMiK3kcycg2ONcEuXXOni7n5FeuC2/w7ECRt/CM5N10
         +PjV/IRBTER1wTrSZpdzp+X/qDrtkBdjNjDTySTGmwxoGnlGB/wqUVlUyar0W7YBEV1W
         R4nooEUptE3wwFhjXdFPZqX6kmhnIJlIwbQKhyUqAWKEDVTc98GpV5Y3iCdezGj15PHt
         q/Fxz/nCBPgJEXUt5N/jy5092+BfWd40kXslfn1v4Q6vlH4d3e/+7BcGi7fwYYfeLqUH
         Q5C356GtSepWmyirTUC3ei9m6U8w6se2m1Zz0RSmxhxyXJl+ZiVERzd+zmm+GCdjmjoq
         TGjw==
X-Gm-Message-State: AOAM532K7K6dpYgnljA3Sd0/UNmRO3sWxTY/hJESLOwIfOm8d272BE9j
        UwT1yTYYgNBDfjQCM/LVkJGZnHJD8D0RmWLmUmHvqA==
X-Google-Smtp-Source: ABdhPJxhYSHh7PHp/omZzXaR2sDQoRQSkpAcXxWYu7yPG+yTw2waahpbae0AFcirrAAdgOsL+ughlORyMFbKuDmopZw=
X-Received: by 2002:a9d:a42:: with SMTP id 60mr12023248otg.179.1642294301197;
 Sat, 15 Jan 2022 16:51:41 -0800 (PST)
MIME-Version: 1.0
References: <20211216162206.8027-1-zajec5@gmail.com> <20211216162206.8027-4-zajec5@gmail.com>
 <Yd2jcfXqqKHK/NaG@archlinux-ax161> <24a1e92e-51ab-ded5-1a43-682950af1fe9@gmail.com>
In-Reply-To: <24a1e92e-51ab-ded5-1a43-682950af1fe9@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 01:51:29 +0100
Message-ID: <CACRpkdYCpbE6Yuxd8Z97-WV5Mi2MSBppi7KidCAB18uoLK+8JQ@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] pinctrl: add one more "const" for generic function groups
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 11, 2022 at 5:51 PM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:

> > Looks like something like the third patch of the series is needed for
> > the Thunderbay driver, which it appears was in development at the same
> > time as this series.
>
> Correct, this driver didn't exist in Linus's tree when I developed my cha=
nges.
>
> Too bad thunderbay copies that old & complex logic that I just fixed in t=
he keembay driver. I'll have to redo my changes for the thunderbay now.
>
> I don't agree with the idea of reverting my patchset and working on V3 th=
ough. It's a relatively simple thing we need to fix, it just be just a foll=
ow-up commit.

Yeah this kind of things happens, we just deal with it throughout the -rc:s
no big deal. Release candidates exist for a reason. Let's make a fixup patc=
h.

Yours,
Linus Walleij
