Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2DA2ECDC6
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbhAGK2Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:28:24 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:47183 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726541AbhAGK2Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 05:28:24 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id CDBB3581F10;
        Thu,  7 Jan 2021 05:27:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 07 Jan 2021 05:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        to:cc:references:from:subject:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=X
        gj/I97/wjHFqvQLCUga9SEfpGNGvWYOpUvSqDwlGKw=; b=lsPbzT8iNHeD6MyzN
        VMOCR86cJmbWeaiEbAHmcEh2PkJ3dQOKNszI94re5RhvY5Dw0Cbdp+K1ivQ7Ywho
        FxWKDlFiR8BlLw7w0UEXWnELmeYu47TUidpMpAzMfxRVSuT7PmM9i+Gsn9YUZiTn
        QpJXd6yzq4cKWkT/FgXCcvj7WoWYGSB8BjnZJyUxweYTbaPK2QJDuV3YcGipqtd1
        uW6ZWP8vu6ZEaYG52MxoZVXMa/O8XQpvBtkL68+bX5ywBaoAKaKiHwwWiSisdQa6
        NaZMue5N8C9CQFJ3f4OG9MYG6TLEeFqkbUdpSiK5u/52G5JGR0E7CsFvUso20d92
        +P9Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Xgj/I97/wjHFqvQLCUga9SEfpGNGvWYOpUvSqDwlG
        Kw=; b=IinqHH8Hp+zXWXTXPhaFNDMR4nZeR9qqmwb4zxGJ+Xndfw+JlT5DqAY/c
        fFLPTKbjhSFfjFUvrQoqc6fwJ836+CWPwWG8+AHjl2DW8nozQ8OnYM+ZVnqtI47+
        B2CGOB59NgVII7quW7m9n4msX554Ndo3TdVo+RXsq1eNCwiGpdtNdkllsTHXidY8
        85vwOJUEC3uCJusVhrf8GhqHPy8hW/TV5OJzXOKBOWl7P6GDzIu6XdUxF/uFsqcz
        sUUnRgVaSJxMdW+b+meyZsAUJf9uR76HyLq+UgdVROx4ZJ9soYRuHjotYgw8X3XI
        G7sJ4fMyX1E3vTn/97IBenwIoRwZw==
X-ME-Sender: <xms:BOL2XwvLpbuwfmF0DYaN4nYaEAWt2Kj6gktHcwCPjsAErUBCMyesOw>
    <xme:BOL2X9dxHdoNEl8aWh7ZNkHk-jKLT9v8I63-5hF3ZTfoSYntQUOmbM6ZRRcn_p6TA
    YoQhtHmS2-hN-Sabw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegvddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepfeduhfegiefhffefleefhfffjeeuueehleeitefhkeehleehkeef
    heejvdegvdeunecuffhomhgrihhnpehtrhhushhtvggufhhirhhmfigrrhgvrdhorhhgne
    cukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:BOL2X7z6ZK77f05GWuSSInyjxz675s1tNvu6dVzjd50AMLojkOYPaw>
    <xmx:BOL2XzMWd2ytUQG_-SdNE_rnI8o6mzUbChBB8zolwatPGvhSO4Xovg>
    <xmx:BOL2Xw8K7hlpj82EkXeunQ0CTM-VUyxQXVO0_pYkRViDKIEOx0cjbw>
    <xmx:BeL2X7VWPM30rSlOZIuNCHHXYdYS3OddI433Et9vC6Ac4XFn2Yi0rg>
Received: from [70.135.148.151] (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9C6B8108005F;
        Thu,  7 Jan 2021 05:27:15 -0500 (EST)
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>
Cc:     =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
References: <20210103100007.32867-1-samuel@sholland.org>
 <20210103100007.32867-5-samuel@sholland.org>
 <a6c2eac4-7e98-ecb4-ee8a-d67a7f1b6871@arm.com>
 <20210106110643.agq3mjyhgvg3w4i6@gilmour>
 <CAGb2v64mcLogZax8vVJJxG9feBzmGc8VyazTvp7XkBAoLXw9JA@mail.gmail.com>
From:   Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC
 connection
Message-ID: <bc95a8d2-ebec-489c-10af-fd5a80ea1276@sholland.org>
Date:   Thu, 7 Jan 2021 04:27:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAGb2v64mcLogZax8vVJJxG9feBzmGc8VyazTvp7XkBAoLXw9JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 1/6/21 5:38 AM, Chen-Yu Tsai wrote:
> On Wed, Jan 6, 2021 at 7:06 PM Maxime Ripard <maxime@cerno.tech> wrote:
>>
>> On Mon, Jan 04, 2021 at 10:54:19AM +0000, André Przywara wrote:
>>> On 03/01/2021 10:00, Samuel Holland wrote:
>>>> On boards where the only peripheral connected to PL0/PL1 is an X-Powers
>>>> PMIC, configure the connection to use the RSB bus rather than the I2C
>>>> bus. Compared to the I2C controller that shares the pins, the RSB
>>>> controller allows a higher bus frequency, and it is more CPU-efficient.
>>>
>>> But is it really necessary to change the DTs for those boards in this
>>> way? It means those newer DTs now become incompatible with older
>>> kernels, and I don't know if those reasons above really justify this.
>>>
>>> I understand that we officially don't care about "newer DTs on older
>>> kernels", but do we really need to break this deliberately, for no
>>> pressing reasons?
>>>
>>> P.S. I am fine with supporting RSB on H6, and even using it on new DTs,
>>> just want to avoid breaking existing ones.
>>
>> Doing so would also introduce some inconsistencies, one more thing to
>> consider during reviews, and would require more testing effort.
>>
>> I'm not sure that stretching our - already fairly sparse - resources
>> thin would be very wise here, especially for something that we don't
>> have to do and for a setup that isn't really used that much.
> 
> As soon as some software component starts running RSB, (which I assume
> is what Samuel is planning to do in Crust?), there's a chance that it
> doesn't switch the chip back to I2C. And then Linux won't be able to
> access it.

Crust can handle either way via a config option, which currently
defaults to I2C for H6. It must use the same selection as Linux, not
only because of the PMIC mode, but also because of the pinctrl.

TF-A is already converted to use RSB[1], and it does switch the PMIC
back to I2C before handing off to U-Boot[2]. So new TF-A + old Linux is
fine. However, Linux currently does not switch the PMIC back. So the
most likely problem from this patch is that, with new Linux + old TF-A,
TF-A will be unable to power down the board or access regulators after
an SoC reset.

I expect there will be a TF-A release between now and when 5.12 hits
stable, but people tend not upgrade their U-Boot/TF-A very often.

We could solve this by having the Linux RSB driver switch all child
devices back to I2C in .shutdown, or by dropping this patch and only
using RSB for new boards (which would also address Andre's concern).

Cheers,
Samuel

[1]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7576
[2]: https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/7575

> So I'm for keeping things consistent and converting all users to RSB.
> 
> 
> ChenYu
> 

