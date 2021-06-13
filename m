Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86803A5B1D
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jun 2021 01:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhFMX7m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Jun 2021 19:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbhFMX7l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Jun 2021 19:59:41 -0400
Received: from mxout017.mail.hostpoint.ch (mxout017.mail.hostpoint.ch [IPv6:2a00:d70:0:e::317])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07032C061574;
        Sun, 13 Jun 2021 16:57:37 -0700 (PDT)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
        by mxout017.mail.hostpoint.ch with esmtp (Exim 4.94.2 (FreeBSD))
        (envelope-from <code@reto-schneider.ch>)
        id 1lsZyv-0002J6-6t; Mon, 14 Jun 2021 01:57:33 +0200
Received: from [2a02:168:6182:1:d747:8127:5b7a:4266]
        by asmtp013.mail.hostpoint.ch with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2 (FreeBSD))
        (envelope-from <code@reto-schneider.ch>)
        id 1lsZyv-000Hc5-4Q; Mon, 14 Jun 2021 01:57:33 +0200
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From:   Reto Schneider <code@reto-schneider.ch>
Subject: Re: [PATCH v1] gpio: mt7621: Assign base field in gpio_chip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>, Stefan Roese <sr@denx.de>,
        Reto Schneider <reto.schneider@husqvarnagroup.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210613120608.1527394-1-code@reto-schneider.ch>
 <CAHp75Vc5LRRLc-1A5W4BVQ3QQx-+4Y5CUjG3ksosVdPEecEyqA@mail.gmail.com>
 <db862b9d-2003-08f4-6856-26fb4870caff@reto-schneider.ch>
 <CACRpkdbSv0h6hB_yR+_ZC3vxSUOkaa94EzCArSaSC=nvc5AT3g@mail.gmail.com>
Message-ID: <04f4dda6-b16b-7862-0e88-daefc6d0110f@reto-schneider.ch>
Date:   Mon, 14 Jun 2021 01:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbSv0h6hB_yR+_ZC3vxSUOkaa94EzCArSaSC=nvc5AT3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 14.06.21 01:24, Linus Walleij wrote:
> Hm isn't OpenWrt switched to the mainline driver?

They did, and people are now seeing this "issue" too [1]. Which got me 
to post my "fix" [2] and then trying to upstream it here. :)

Kind regards,
Reto

[1] https://lists.openwrt.org/pipermail/openwrt-devel/2020-May/028926.html
[2] https://lists.openwrt.org/pipermail/openwrt-devel/2021-June/035497.html
