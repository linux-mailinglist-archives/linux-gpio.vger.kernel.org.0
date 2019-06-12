Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE5C41DA9
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 09:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731441AbfFLH0C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 03:26:02 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42838 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405552AbfFLH0A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 03:26:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so14126361lje.9
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 00:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=msM4dgHT7OChSN8YMEnC/hlz7O4CQA3Qt/8x5kRoeWA=;
        b=b/xNVmBGr774Ie44vkdUYzW5g96u3La3k0A9SkL3ZCvZkJF98mYXDQ6oP9LRZh7Wp/
         2vvQhSHA3r4OQBrQ7F92Mofp94Op3kqIQEKS8O+hSDMP2fnYaKO61aP1PbwJcYdaNkud
         Uyg/uruiDUcv2DAYwC7O9pg8remPu1Uh3BpmwKar4uCP4Sp2HYDx1JVC3VEx1wjMqJNo
         bRXEiIeSR30mKPOoa8C77KYigxq3DHc3oCTvWo7Qzb1rVN30/VnNJ2zgp/VN1Is2rgqC
         Y+sDCDqKg9uQcSI7N022tg6lqvie69RffAY9o34iLiLGyXRl91cmjVEhOhil7iISNP/k
         aFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=msM4dgHT7OChSN8YMEnC/hlz7O4CQA3Qt/8x5kRoeWA=;
        b=YtJ6yHMD11yX+DVEfRONl/YSWLK15bSrDZPYGkW3csRhugX+e/3ISjVQoeRQJ8g9TB
         2/2axuknO9otTEqQrl1ZkdDrFI/9vMFm4UGCin71gtJjgHfRPVs3EWAb2pcKLY67JxPB
         KDe4wcl7rOIgjflY/EiM2ubwmqHI5TtOgDs307Zr+9Tfna2ced9lzZoF+bIPa0BC2y6S
         hT5mD0zq3OHoTFu1muJrVWja2F6+oGxCkHuS700Wvq+wwNoeGoGknhaw8PaRst8GppFL
         qiF3k3Yct2IClbOtMZHWs1mNX2s1k2QmPD5GXXzjY8bh551Fp9S1z1iPTf5o8A7Y1Fxh
         ti/A==
X-Gm-Message-State: APjAAAXDbOL6cJwarZMmJLOJ4+BuDgCKYqBeM4BQcrmTzdLnLrqYdfvH
        3fzPYkTMfiYSR0S0e42TgH2H1LNB4GKpKkw6ah/+/Q==
X-Google-Smtp-Source: APXvYqx5YwbEg0avWvoTtMnv22p8ShuveFC0J0UpmFk2uYfKnJ2tkg9tfFI9Py8uT6FyJuuL+H4KmQND6QpZjMGZBTE=
X-Received: by 2002:a2e:7508:: with SMTP id q8mr26602026ljc.165.1560324358738;
 Wed, 12 Jun 2019 00:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190610084213.1052-1-lee.jones@linaro.org> <20190610084213.1052-3-lee.jones@linaro.org>
In-Reply-To: <20190610084213.1052-3-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 09:25:47 +0200
Message-ID: <CACRpkdaXHC6dfOMMOj-a8o1zCzqqZoeQLEEAZ=XpPWKN_nf=9w@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] pinctrl: msm: Add ability for drivers to supply a
 reserved GPIO list
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Jeffrey Hugo <jlhugo@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 10:42 AM Lee Jones <lee.jones@linaro.org> wrote:

> When booting MSM based platforms with Device Tree or some ACPI
> implementations, it is possible to provide a list of reserved pins
> via the 'gpio-reserved-ranges' and 'gpios' properties respectively.
> However some ACPI tables are not populated with this information,
> thus it has to come from a knowledgable device driver instead.
>
> Here we provide the MSM common driver with additional support to
> parse this informtion and correctly populate the widely used
> 'valid_mask'.
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

I have queued patches 3 and 4 in the pin control tree on an
immutable branch with Bjorn's ACKs:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
ib-qcom-acpi

I have also merge this to pinctrl's devel branch for next.

Yours,
Linus Walleij
