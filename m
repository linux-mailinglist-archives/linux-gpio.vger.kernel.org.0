Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3FF4448C8
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 20:10:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhKCTNX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 15:13:23 -0400
Received: from smtpcmd0756.aruba.it ([62.149.156.56]:41745 "EHLO
        smtpcmd0756.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbhKCTNW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 15:13:22 -0400
Received: from [192.168.153.129] ([146.241.216.221])
        by Aruba Outgoing Smtp  with ESMTPSA
        id iLehmQUVD4n4riLehmFuEJ; Wed, 03 Nov 2021 20:10:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1635966644; bh=0/31yxmO9a/oC0P8HSIAOi7F4D8XhUglntlI8cyweIg=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=JHt8XzSjYLi1rWyUyi2ykyjLwTWrBHdvKgItGaNHY9vgQDx4CIXQIBALXxgxMWPRM
         oGtbjIF7McsY1X/k1uP2Acdeqw2BIas+OYupr81C2Dcca7XMa2Vp0Sp0FJTrwpcsSX
         gFRfNMSc4dWtlo/n9+z2VXPjPRkCSC59N3R0G8+8JwmsfgviQHXTaF7kvRBJuWubei
         hx+F0V/WiqGSUyEdMZ1mqAWtMsH7ZhpC7rP9NDKtvKOajBIDiWHDZJL7lyTxdyUfDg
         n4sufjnQVMtJZjMUz4pfih0uAXT2MavO/91P0GGzNZ/d33kaReBHi5j6jAzzW4d6FZ
         +cACDqCxUK6YQ==
Subject: Re: [PATCH v2 11/13] mmc: sdhci-esdhc-imx: Add sdhc support for
 i.MXRT series
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Jesse Taube <mr.bossman075@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Abel Vesa <abel.vesa@nxp.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-serial@vger.kernel.org
References: <20211102225701.98944-1-Mr.Bossman075@gmail.com>
 <20211102225701.98944-12-Mr.Bossman075@gmail.com>
 <CAOMZO5AxMXxDkNDqGJDhtepqSUxGRCWO+L=c67O==4fx66M7XQ@mail.gmail.com>
 <c1610093-95ae-68d3-57ae-93b1bc9715d7@gmail.com>
 <5ebe48f5-7b9c-be99-d50c-65a056084b96@benettiengineering.com>
 <CAOMZO5DHCYaxzSASKq6Bk8ALkiQeVjPOHOyk-pKYepJFJk6oFQ@mail.gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <78cba8ec-72b0-89b8-d6e3-09ecea19ca7b@benettiengineering.com>
Date:   Wed, 3 Nov 2021 20:10:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DHCYaxzSASKq6Bk8ALkiQeVjPOHOyk-pKYepJFJk6oFQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF6/WWjL7PJeZTTfz9UiWozyugqncNHx9tTkfwkkeDbnl31INXrmdyJqCSDLjNgQNAiX+KEFaL/glNmQk4hLNz+e91vJZFmZ3NF5I4POniLdU+133jcp
 XzXAVa/DOc7iJ7Umt9dQCiK70yv+dPSCm6DyvEHh3sPzUmjoblvN2rbQedLd/KRav15zduP3h7pa3TBT7GXnqFDja1xM10FZDIRnNyWpakY0+K6IpWr9CtRp
 RbGD2bB0eWYl2pgQ6oK7rgqwkfBiXt6WBqx32YZalbWMiwFTgFZXYFX2bhI4iGNXtHbYX6M7a2P6awc9yt+RpNOC46ceA2OSF2GD2nNLCCA85tkJbOLpIuW+
 2qJ4tYuOUeifsY8fJ1OAWVgvpme4hq+Jn9KOnjeL9hMJkqLhKlMoFBWG4ZFAjx6P+T/WjW84919f5FBekomjfNlXPtI2bx8LowHcHVMxxtgWKrIy8/HCjQse
 hMtGvQbiPuqHqMSGKMU0Q3721Q7hTJXFuObQDrhcRED7Kw6KTtE+Aczv5xnK+GZFMBgayrKg+SPoimBROvDme87huk7quiukeu+sSdj2ldoS4sJzD14db2fG
 fUZGCElF1aWolDYn3zDRnuI9aNLyzS3y1bYpg51QmCdVikiJpSb9nuEDd32x1YmU5g6bp8wj6JvNaeEdLN+hZ8C98TiPIvfIAQlyjNyu4rl6AtSJkRa0xbkl
 Oqwe2dhAY8fi/AdyGAOTkGT9EcPX6i/VjPEh3HGAOLI7lQRyq0Do61LOcfvBUvIvN4UdwfKqBwD9s9EPIMQEYbN3mTdK+1FUVYNZBAwyyypuvn/FOjtDyP2H
 JMyFerHaBWkngEyHrqz25mjCOQMODTDTsNvvVliBq93lDPsgK3mJEl0Habe+NGvFA2p8EJtf0FwLgL0DRkJHzdhMV88ocFN+5a1+J0RrGZr4w1tABUN/5cm1
 WudLVrZSILp4LPugdLhbdtWqzTVqLr7Z5bwjuyY0ykWP1Okhj8x8edAs9QHPcNhSXogZq6iiuo5o1gC6xSOGhsYvQsVxL3miS8s3fPyG/QjEvDLLBWrnRyF1
 0glwqRkuoJSHoK/FA3aAdIQ9Aeg2lDGEs3pbsWIwLor0bSAzNFFlUwrWmx7Z5ykPs8sZoNMAWTJRAnNPRjzG87S0dPFSboLuLSo=
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Fabio, Jesse, Rob, All,

On 11/3/21 6:51 PM, Fabio Estevam wrote:
> Hi Giulio,
> 
> On Tue, Nov 2, 2021 at 8:30 PM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
> 
>> If we add every SoC we will end up having a long list for every device
>> driver. At the moment it would be 7 parts:
>> 1) imxrt1020
>> 2) imxrt1024
>> .
>> .
>> .
>> 7) imxrt1170
>>
>> Is it ok anyway?
> 
> As this patch adds the support for imxrt1050, I would go with
> "fsl,imxrt1050-usdhc" for now.
> 

Ok, then it's the same as pointed by Rob for lpuart[1]; @Jesse: we will 
do the same for all peripherals(more or less) since it seems there are 
little differences in the i.MXRT family.

[1]: 
https://lore.kernel.org/lkml/D0A3E11F-FEDE-4B2D-90AB-63DFC245A935@benettiengineering.com/T/

Thanks a lot
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
