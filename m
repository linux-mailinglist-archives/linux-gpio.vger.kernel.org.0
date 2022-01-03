Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41BD482FB3
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 10:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbiACJ4p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 04:56:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiACJ4p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 04:56:45 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00D23C061761
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 01:56:45 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id j21so133710671edt.9
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 01:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZYmLW1iCugZWDafFfjWBpnrR+V72rU1sXDxZFERWSRE=;
        b=fVQLeDoqKsQsGrdu/XIQatReeKlByUvi43fIYrDTkgEnyhMZYvQKyuJKZjglj9HMG2
         S73A67TU7uE/i2si5ueH1bMkInifnhCg8bcT8ivd5iqap3tak9lzVXwsUKyJHW0HzPzS
         nnip41Htoag3X+/zAsFdnB7KFew+ZmxCX38Uw8n4reqwYpU20xGn9B1VDqLIeSc4UOmv
         MZYMjzFonmhU5yaijJeLuQoLZ6AvW6xG65UfKtoiDVYkVQYROW039mt+NRNzakvbx/iV
         uEeUP4fRxm5LFmIqp+0TcqmYrxXDE+KsOiblGKzOOupe7zI3fthFRtwV9OJMoYwiH5Bw
         2LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZYmLW1iCugZWDafFfjWBpnrR+V72rU1sXDxZFERWSRE=;
        b=i4990yg6a8P8wVIILGC3dPkBWkMJrL5niaF94N61zZf83049xHkYESl+YaO/AzQ3al
         HsuFizVfKFcU/XO1kMqV5sPe5t3NLyER78CAWZIn061QiImJJlyJb6+pqAyO/3De/H2A
         k/+zR1ujTVxTZVQwtGGtQXYbWMWbCmZwg+O6ZyZCiwzNQ/gzKC5vpUUokKvc36AbEv2s
         qVWlJplkptETHP2SW47AskPuF6OCVLcDeSo7rA341K4cqpgpKU8k6B8lC29KY0VGTtd7
         lxmmz1JrxgQjMZnCumWOcnaAPdtIyZZ1nubHfQQWNhSYRjr5hW31/gU6ZJB95VGq0WeM
         v4mQ==
X-Gm-Message-State: AOAM531wZGMRgAVq8HCvooaP8Xkn+mqogeTBCaTmcTimOSO4nU23K1Bf
        B/9EVCLc1MaoPC2wU7eQHlsHh55oOgqLFSYk2pRazA==
X-Google-Smtp-Source: ABdhPJxbx52Adux3G4VWzQsgGjJtaUsAH+IcJISTybeXzp891Xr1xUR5KkAx0GFW5npSUBhAg3bKSuavaTuUq0HarbM=
X-Received: by 2002:a17:907:6093:: with SMTP id ht19mr36512360ejc.286.1641203803504;
 Mon, 03 Jan 2022 01:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20220102020811.8013-1-gregory.0xf0@gmail.com>
In-Reply-To: <20220102020811.8013-1-gregory.0xf0@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Jan 2022 10:56:32 +0100
Message-ID: <CAMRc=Md7L07uvorfaFPt2bEHnQqqO7ZKY8WfdcMO__6XoRZLEQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update gpio-brcmstb maintainers
To:     Gregory Fong <gregory.0xf0@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Doug Berger <opendmb@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 2, 2022 at 3:08 AM Gregory Fong <gregory.0xf0@gmail.com> wrote:
>
> Add Doug and Florian as maintainers for gpio-brcmstb, and remove myself.
>
> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ea5655a29c3..674cfd8b43d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3804,7 +3804,8 @@ S:        Supported
>  F:     drivers/net/wireless/broadcom/brcm80211/
>
>  BROADCOM BRCMSTB GPIO DRIVER
> -M:     Gregory Fong <gregory.0xf0@gmail.com>
> +M:     Doug Berger <opendmb@gmail.com>
> +M:     Florian Fainelli <f.fainelli@gmail.com>
>  L:     bcm-kernel-feedback-list@broadcom.com
>  S:     Supported
>  F:     Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
> --
> 2.25.1
>

Queued, thanks!

Bart
