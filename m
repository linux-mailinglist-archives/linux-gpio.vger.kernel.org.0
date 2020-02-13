Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88E0B15C53B
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2020 16:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388151AbgBMPyS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Feb 2020 10:54:18 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45039 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387635AbgBMPyR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Feb 2020 10:54:17 -0500
Received: by mail-wr1-f65.google.com with SMTP id m16so7274257wrx.11
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2020 07:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BncL0+XD43RhxS89iRgODSVbvs7SMtr+UstAFU48Su0=;
        b=gy+gwxeqTOksSrRrjnTNb3ooArrrBq/WJqL2vuteprKqijh6HcJ5Eii/2Bj7ABgQxZ
         V5fweqnHLTMgJtX2vj5uBNW265L7AIbR2+zEOQEeZCDD33AwiWT2j+I8vzgBHiAhVifi
         KRcUHQYZdKuL3aQ1U/udIIbDSSSOiDXeUVaoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BncL0+XD43RhxS89iRgODSVbvs7SMtr+UstAFU48Su0=;
        b=DnNMmOdO035hj1fvNGEVKe8ELAlPwDxMXXzPEu+PebQtlydPc2l8af2O87gvaqnKNR
         p4fnxjlFF1jHiP6XTV2FIT+bzOYBl6aMfQg78kH/t+Emv9PEpNmIDl+ZtAOHeaWJqqRc
         A4/XGMj9AXBK81gUFUATsskswPZlCn4Wv6tpBJMGhfd8MHlBo3Pb5BTQiqxtv11u0THZ
         2GU2CHqPD8l1otFbpUIaTjFT8fv2AZE4G919V0C6jlxjXCUCLBOXsC9nQWPV99B0BcuX
         V1f28OPszVFPcUz/XOkKgGPWkLWBliqf4V4cXikuo+5i3FbijmhrEU0IJ1wGvUyuh+AY
         La4Q==
X-Gm-Message-State: APjAAAUDjA17bJdHeFcrS5qHl5IisW9by+ZDR0IlDE3vlJc19VcjKa2M
        5GpEdHVe461QU8GHEBwcwyRCQP5+/5mDHPlbtJm84A==
X-Google-Smtp-Source: APXvYqzqlhfTv3u6j/of0GU1h8UocABGOozIc4x6AqtA+5+X784yM3rvl4U9lh/7hs2hMWYofh+E1Afe7RpyRN9Cs5c=
X-Received: by 2002:adf:e692:: with SMTP id r18mr22518034wrm.413.1581609255837;
 Thu, 13 Feb 2020 07:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20200213025930.27943-1-jaedon.shin@gmail.com> <6ba4bb21-034b-93f0-d4b7-13ac7c5a925d@gmail.com>
 <44052F86-D0DD-4FDD-A62B-09280E956405@gmail.com>
In-Reply-To: <44052F86-D0DD-4FDD-A62B-09280E956405@gmail.com>
From:   Jim Quinlan <james.quinlan@broadcom.com>
Date:   Thu, 13 Feb 2020 10:54:04 -0500
Message-ID: <CA+-6iNyjXnz4tYk4edupbhsjvyh==MA0bJ+311k_wBcDHQHJ9g@mail.gmail.com>
Subject: Re: [PATCH 0/3] PCI: brcmstb: Add Broadcom STB support
To:     Jaedon Shin <jaedon.shin@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        bcm-kernel-feedback-list@broadcom.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 13, 2020 at 12:15 AM Jaedon Shin <jaedon.shin@gmail.com> wrote:
>
>
> > 2020. 2. 13. =EC=98=A4=ED=9B=84 12:54, Florian Fainelli <f.fainelli@gma=
il.com> =EC=9E=91=EC=84=B1:
> >
> > +Jim,
> >
> > On 2/12/2020 6:59 PM, Jaedon Shin wrote:
> >> This series enables the ARM based Broadcom STB SoCs and supports GPIO
> >> based regulators for its power supplies. and this has an improvement o=
n
> >> devm_ APIS.
> >
> > Which ARM-based SoCs did you try this on? We still have an issue with
> > the multiple dma-ranges that must be handled to support 7445 with memor=
y
> > in the extension regions as well as 7278 and 7216.
>
>
> I'm using BCM72604 which has only one memc. and device is Qualcomm Athero=
s
> QCA6174 Wi-Fi module.
>
You apparently have a simple enough memory configuration such that the
current upstream driver will work.  But this will not work for a
7445-based chip or other BCM7xxx chips that either have a memory
region extension or a non-zero system memory offset.

IIRC, similar regulator code was submitted before as part of the
complete driver that could handle our curious DMA situation, but was
rejected because someone objected to us using a  generic list of
regulators without specific explanation for each in the device tree
documentations.  I hope you have better luck :-)

Thanks,
Jim
> >
> > See comments in specific patches.
> >
> >>
> >> Jaedon Shin (3):
> >>  PCI: brcmstb: Enable ARCH_BRCMSTB
> >>  PCI: brcmstb: Add regulator support
> >>  PCI: brcmstb: Drop clk_put when probe fails and remove
> >>
> >> .../bindings/pci/brcm,stb-pcie.yaml           |  8 +-
> >> drivers/gpio/gpio-brcmstb.c                   | 13 +++-
> >> drivers/pci/controller/Kconfig                |  2 +-
> >> drivers/pci/controller/pcie-brcmstb.c         | 78 ++++++++++++++++++-
> >> 4 files changed, 97 insertions(+), 4 deletions(-)
> >>
> >
> > --
> > Florian
>
