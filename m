Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B4A2D2826
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 10:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgLHJvl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Dec 2020 04:51:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbgLHJvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2020 04:51:40 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B931C061749
        for <linux-gpio@vger.kernel.org>; Tue,  8 Dec 2020 01:50:54 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id bo9so23646230ejb.13
        for <linux-gpio@vger.kernel.org>; Tue, 08 Dec 2020 01:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10M18cVAuscOUxDbYGRHkvB3zRG0OEfv/jnc8FTzxqc=;
        b=0mvZiavMpbegbyJwQjflRyNIpoDJ73hHK7WJBJ6gAqNazVCc+Mcoe8fXxAWVSVTf5V
         nAXV3S2ckKzjmQfpQU0fSpm5md+DitG0bpxILVYKScJbgMVRlqUGwzN38sX7ie7cYOrI
         rCyaNr5URFjC6+hUj+XzaFgl3Kh7pbE6GRyEztzk+AiVUePpGr1meHD4KtScGfrzNt0B
         elBOLIDeg87fdA7m47w8EdIEFh+1MbTFwJbRw6jBsVekeSYzTHPdTetOMddPiSCQVxYj
         KpdxT8PgjspEftwMwB7RpnzgNW+szamL1h30h6cW2GHOlJnTMQQ6BIzxrYzyXyEyr/Tc
         QVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10M18cVAuscOUxDbYGRHkvB3zRG0OEfv/jnc8FTzxqc=;
        b=YSlPkgGdRZUQVC24ihvm8jP6eBVZflCsKP17U7KWMgF6yiS5mpIMdPV7y+h9YAvZ5N
         TCRSwX0gSBXWmDFJk16z6VLHHsuz6wX3yUvqgPWn9tXweV9YXC//8bXyf0VTPxZhFdB/
         ZHARweDy+BBunSiCWzCUOL2YT2UQ3V7widigxaEJxLygxotaKf0aDa8uphWuQxSFCBzz
         D7I3/gBh3Qdt6hnXml+XN0+FSJQ6J5s5ecVgNIv8916wOzy0bt572+4jTuPbOY6w6TWh
         dQFfZpuRlfJsIDWgtgiMEkMGPOfEJ3Dxw9noClS8L0NXFZ92LBUP4XrBrzlK61YNnTKp
         q+2A==
X-Gm-Message-State: AOAM531iVn/cU+++lVo71R3lGZi7TTkdS+FkJcsUyaqnrvELKmfwfDls
        tKWXNpRSB2McQ+HwtAbuix7fsjimcAMB9YmMaxDbB8YD3hQ=
X-Google-Smtp-Source: ABdhPJzNtD4WQ/Xm+ojAxbBmrEYphGTPDBm/F4wJmiTlnsWbAIPBGceR5zEP7TdKDCcbFi2JJuvGseVZknVEMMqe97Q=
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr21798676ejd.363.1607421053288;
 Tue, 08 Dec 2020 01:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20201207203816.18269-1-info@metux.net> <CAMpxmJWinRPUrmpcqsLaE62uAQpZ3Cb1ys3s7oHmeKM6rUUqQg@mail.gmail.com>
 <c839fa75-80ee-31e6-2ccb-87155281e1d4@metux.net>
In-Reply-To: <c839fa75-80ee-31e6-2ccb-87155281e1d4@metux.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 8 Dec 2020 10:50:42 +0100
Message-ID: <CAMpxmJX2RN7N8h+KeMpb6Zmj6Uh5sHEAWObK+kRVcB4H6XXbpg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers: gpio: put virtual gpio device into their own submenu
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 8, 2020 at 10:40 AM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 08.12.20 10:15, Bartosz Golaszewski wrote:
> > On Mon, Dec 7, 2020 at 9:38 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >>
> >> Since we already have a few virtual GPIO drivers, and more to come,
> >> this category deserves its own submenu.
> >>
> >> changes v2: fixed menu title (replaced "devices" by "drivers")
> >> changes v3: added patch changelog
> >
> > This should be below the --- under all tags because we don't want this
> > in the actual log that goes into git.
>
>
> Sorry, wasn't aware of that. Does git-am automatically cut it off ?
>

Yes, everything between the --- and the actual diff is dropped.

Bartosz
