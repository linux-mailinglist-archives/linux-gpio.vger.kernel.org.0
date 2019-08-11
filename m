Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05AC48938E
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Aug 2019 22:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbfHKUQr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Aug 2019 16:16:47 -0400
Received: from mout.gmx.net ([212.227.15.19]:35941 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbfHKUQr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 11 Aug 2019 16:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565554561;
        bh=3kJZz9MtM4IycBB5++CRUMsdjM9afoO5ssqFTHYDTFQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=UXBPE7/XqrRAQJosZXZlLVWzbY5+iktGlenikxjP6d5kbG4LtIcceRGDmeMtsxHpj
         H91t3tHpP0BzF3oK6z6COXMM3nrLqnauC3sQmJ4UFf7dn/QUQf1MY9AnLb5Dn88Dzl
         b3fH517p75+i7L3gys2iMMkikbENQjP8KDSi/ER4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.162] ([37.4.249.106]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mFi-1iQdvp1KVY-0136ib; Sun, 11
 Aug 2019 22:16:01 +0200
Subject: Re: [PATCH 12/18] pinctrl: bcm2835: Add support for BCM2711 pull-up
 functionality
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
References: <1563776607-8368-1-git-send-email-wahrenst@gmx.net>
 <1563776607-8368-3-git-send-email-wahrenst@gmx.net>
 <CACRpkdabfiDbGmAQciAUSThY-KfTsVq3tHz0bBszs2j_ej18Nw@mail.gmail.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <63f17284-5551-9492-9eff-f8a4c003196b@gmx.net>
Date:   Sun, 11 Aug 2019 22:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdabfiDbGmAQciAUSThY-KfTsVq3tHz0bBszs2j_ej18Nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:kZQhLC+37knN7koeRxivgD7Ex21z780f90KQ0PFrFGVPzmYdpRh
 LkUk2Pvie/qP/eKtJHdAn0Caz9G36mzXlHyrIVRYq8Ge873TNFqbKIcSHpQeYNpqOGmP5+o
 AwOi8ZCa07SigQsn1tEt2xUIn/XE8eST/8GMGtikC18Hp4TPpdNtE6Y4qoPbgiv0aRo+YDw
 dG7y6LYdG5wb9t52Qagig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oAouFmHG4m8=:kyRzVeiVXqBUjn6tANbtBm
 RuOaSaOUzu9sEKFtiH/qSW6h6diBq0jYWh/0zCvnj1LaY1KttoLdpLDoDaG4VYlafhj8/dBrJ
 F1VI1gmaUgPNJ+sLuWEWhsgwvoUF7qj1a9cLQhq3b9Y2/MGi38fw/2LM9QS2Hcue7eLgCeGyW
 h1pDyo1nixPO5dGvEYgaNjVG+zt7fQUmyUj5pdwRPTi9fHMWVgJxwtZPNZrndvdWnCJfhKmeK
 LxirIOPw9oxXGdeHvPYZObW7ohWj5Fro4FNDWYAzgvJV2oUpqOaFod5Hza7QEJwBO4Y2xEUPj
 JUOftzV7PfrD2Y20E96dJ2MKVKvy9fs1Lx93QPbJZMoUtE91necmAHJ0QJa+E24+1lHd583cv
 VuGqY2Hqc3HG6FI6mD/De/jfHB0kXK8WfGxSFd34uvSiZ22l7suHyVf+FTALmdl0eeqoyRxoj
 W/h1ICQKbFOcxcIcp1QCP6S2q6avv3eAWvn4kMeVHFqKB8rIbvxtT+6BWckPNFbFvuDO2VHdo
 HSQJvVVLnLK8in7WFbbpKFKnAQHKUnIa5Q0iWvjYNy3ZbXZer/XUFhmvkxy7wME05OdJuZ7Oh
 SL6b3icqj22YlqbIe/kaQsblJp/nzY/8eYaKDEJY22r3pIrbnFtIxAu82tF4A2GqwxlH0v1NC
 ziI3pQUMxx64UyddKzyWc2p4uEfIebO3v3AKsTDf3UCpa8yJo1wcF7/jcr4DsMjGzmWGo1SY4
 M5aJoYCIk/9Ui4i27CNnMyE0bTv+RpfhEEMM5KKnv+N6LHnmXQeDahHu8cT9a2auXttljYxjT
 r/iWX7uWUzgs4+hUZOXJ8IyLu0KozkdfR4/pptaPnURjCUyUrm00SFSvsEcKDW2mhw3SsvxbU
 KGhfRqZz1hG8NN3oAy4ShETA9ra3Whz0q1O+Fo6GHlfTcOm0myviYPu6Nc5SBQdJENdf2QZp0
 NctdCQApVfVv4vzU4xY/zmMSuYmPuSxoURhthic+3SLGpLzBUwx0XY2//aPOg+OHeY54MQqmE
 DlMJ7LsTFTqCT8oc445kRnUDEafPv6rO57Xx1QLG3/aVgBtEjmliRaj+DBBnyXVIAM6eSdt12
 itKCyfJrMGCKyE8z2JCDcPemUylk3P+dETNN8GrDiawSw2loqti61ctVc797hLioo3gWU+1hi
 bIpDg=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 05.08.19 um 11:38 schrieb Linus Walleij:
> On Mon, Jul 22, 2019 at 8:24 AM Stefan Wahren <wahrenst@gmx.net> wrote:
>
>> The BCM2711 has a new way of selecting the pull-up/pull-down setting
>> for a GPIO pin. The registers used for the BCM2835, GP_PUD and
>> GP_PUDCLKn0, are no longer connected. A new set of registers,
>> GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
>> a new compatible string "brcm,bcm2711-gpio" and the kernel
>> driver will use it to select which method is used to select
>> pull-up/pull-down.
>>
>> This patch based on a patch by Al Cooper which was intended for the
>> BCM7211. This is a bugfixed and improved version.
>>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Patch applied.
Thanks
>
> I think I complained about some other version of this patch, this one
> looks entirely acceptable.
>
> Can we get rid of custom pull settings etc from the upstream device
> trees so we don't set bad examples? I have a strong urge to
> throw in a pr_warn() about any use of it.

Ironically, my pre-RFC version tried to convert all BCM2835 pinmux
settings to generic ones. Unfortunately it seems that i made a mistake,
because it didn't work as expected. Since we stumpled above more and
more other issues (not relevant to pinctrl) during upstream review, i
decided to start with legacy pull-up support, so we can fix this later
in the devicetree for both platforms (currently BCM2711 uses most of the
old BCM2835 pinmuxes including the legacy stuff). So yes my plan is to
fix this soon.

Stefan

>
> Yours,
> Linus Walleij
