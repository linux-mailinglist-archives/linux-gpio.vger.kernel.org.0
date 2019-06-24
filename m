Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 465C15095C
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jun 2019 13:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729528AbfFXLBL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jun 2019 07:01:11 -0400
Received: from mout.web.de ([212.227.15.3]:37073 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727732AbfFXLBL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jun 2019 07:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1561374051;
        bh=668PFCKfgNnHFeA3Jh+s9CPdAlSdTM8Gfho9n45xMts=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=UhqVSdSGox9TOE0cf50tk62bApsr53B0sjMh2mp/sTkuSi07IS4HioBiuhAECcxQY
         UPG8IMFzsz6kBA8l4QIUcFLQBbvTDhKCQRMXBkyVpFrExhAyp4Uu8TWsl4vLvl2O9a
         0gq7r+UDgGis6f1XU2tBezorm/Xsbih2DRwihOQA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.148.79]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MEIQq-1hlwHy3my8-00FS7g; Mon, 24
 Jun 2019 13:00:51 +0200
Subject: Re: drivers: Adjust scope for CONFIG_HAS_IOMEM before
 devm_platform_ioremap_resource()
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        kernel-janitors@vger.kernel.org
Cc:     Enrico Weigelt <lkml@metux.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190221162627.3476-1-brgl@bgdev.pl>
 <9efcbce2-4d49-7197-a3d8-0e83850892d5@web.de>
 <CAMpxmJX-wXQ-ff1RWkPmJBWSsP_v2MjZrA3fhj3HQX0_zM0eZA@mail.gmail.com>
 <39ae399a-c606-c6de-f84d-35e39d0410c0@metux.net>
 <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Openpgp: preference=signencrypt
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <258fa411-43a7-14dc-95c2-6a3b336b3871@web.de>
Date:   Mon, 24 Jun 2019 13:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAMRc=McepqowJNi6ay6x9KKoHOC8aCxP_ob12SgbsnJU_sKQng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:hioMROpffmLYsNGFghPiaV+NHLzv+F39HKdpxRH8ZecBZjAxHxb
 al+hJENq68XQ1kZCe1zH4U0bzleYvtFUCqyWETMTGuom/t0SchTV8ICQY2sTwlO3SCeIs+2
 qODnO5U+on1vKjYDMAv8cpn+LYKqaVn/r8zQCjnTchgPp+7SZPmL9FT/Tf6aILl16M2B+RW
 C5ZvP0wwLIgxvoLLEFy/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wuAcCm+e9/o=:izzphoXgZUllcux4KTpLEG
 rWztScDVk3UQtDA6bDjeo08PFWBpfy76+bpWK5/zwLk+/kljOlm/Gvdj6I2LTp3ML9A1R6qR5
 MrWmaZI8za9zhrR/q2xFjXouQVL2PDFfs2VCJTn/d+F/XzvvD1gBib8M5PHqgx56WDTUh7i5W
 o8GyJl8RDT/ICA36wUbAjA1KbAEPeIOpvpYQXLMU/eWJpOdgWuTicGl36YBTyp+HL61gtKZWR
 nOUji5ol+wIplr71E3MXXnD7PVGNTy/720OxjSRFPNY3SMen8tECzU8aw/CXD5ENYfCM9jJk7
 F0sA4523MTc7BXNE8OyWX+bqWmZD+ToBL4SZD444Bjj7A+bRPdZPagJJJE+aPP0WkUiStLm/r
 dL+u4Tq6/rAV6bmEzzHdwOvOf92sdxPEHBIn8bu0i8oRZwnuuv6b3PIi/OwaIxqOPN1TttOVy
 Wwrl9EKJiDFWcve2h0lusN6vAGeKqxfjGleN485C2TtX6TX7oc65HDuPVbkeLyqFpk4foYfF1
 j6On0m5YjjOCO/3lo2E8L/iGj5862MlD27POv2WGhJtCNOXeUwC/1CXai3/iW65tbvdXfwmQP
 NvTiox14PtoLhlXMS/S4AuHpiK1S2br0F7MlBtCMXc2ZZXIB1YqyeIN9093M1zYrXqfHvAs+l
 kH5DvrM6VUayta1wKZuA0aQ2HzzUqxGqyufqrBNKyNySkZqG2ekr3giFt0yaKKBD8UvyOuxFO
 VWBX09obyE875Ybw82iWvD76s6iVmx2Hkv6IJO8vg8MQZtcXvIk/Zg3fN4lCjV7iLPfbwVlxz
 R7fd4+kqgNibxqPw51RePQ7+g7/W5Jz2bB7n10EAh+rQNKoyEa8v5THBlpA/ms/r5ya4Uy48t
 H/ZM2WzN2x0EW5UC+AEBPLSFbY73a2tRCEgAmq4bN2l4qkDF5ayFAvRb1mF0JKjRZTcIOFmLd
 MTdfAj2If3+yN9SjTTaxw9F1m6J17akDkY0rCnqqlJMKaCD/m2Fc5
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> In its current form it makes the code even less readable.

This can be your development opinion.


> The #ifdef should actually be one line lower

I suggested that the conditional compilation can contain also a blank line
together with a comment block.


> and touch the comment instead of the EXPORT_SYMBOL() related to a different function.

I find that this macro call was kept unchanged.

Regards,
Markus
