Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF3994DFA
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2019 21:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbfHST1K (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Aug 2019 15:27:10 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:50963 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbfHST1J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Aug 2019 15:27:09 -0400
Received: from [192.168.1.162] ([37.4.249.106]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MLi4c-1hi7vk2652-00HePR; Mon, 19 Aug 2019 21:27:04 +0200
Subject: Re: [PATCH v3] gpiolib: Take MUX usage into account
To:     Ramon Fried <ramon.fried@linux.intel.com>,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190814110035.13451-1-ramon.fried@linux.intel.com>
From:   Stefan Wahren <stefan.wahren@i2se.com>
Openpgp: preference=signencrypt
Autocrypt: addr=stefan.wahren@i2se.com; keydata=
 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 AQ==
Message-ID: <5e5c9003-b25a-b81f-cac8-9c33a2f1cd04@i2se.com>
Date:   Mon, 19 Aug 2019 21:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814110035.13451-1-ramon.fried@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:pgoqZzmuMfBn8cnM8rtk60omos+FwRN8mhDg5uwdNPYLNFK5+Sz
 7tvQvnoBuz9zpb1lWesQdpkPfW5oI5xHeLsE4Eo89YS5hQz3+HjPz46CDge10OitKf1/wDa
 cNLRB7qo+DNM/RUbnvBb9Ri0a9MqpBtlSsV4wVhRwiFn/82S7Lu2l5PpWgbcZnCJBL+edVu
 Ho1fBlRiqCDE2O767mNNg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uh6rUzE80uI=:qBo41oufmASZ34eJIXP40n
 gyTfk9t0WeCzd6pRipG1Fc3z8d9l5joFeXUiCBN50w8fctXUdeGAteTIPEHYWILdEHTPgaYQm
 ifJ2C73pw28HZC1KNDdAIkyXU+6ksGUn/16yugkGhXnLNEFKBExFixIWqbbQvV9QSGAR4/HEI
 nExry2ahJUFOztMy9qNT3vDptTr5jd3bDDTI4Wx0Kg0bwPWdvNOu0OTKGghz8V0zdoXFf1eas
 kAdmFvwNDJhaWcdQ3Av2LGTxc7bo/q73xlCcpObGIuuSmuxjDeZ9xzep1aqUrSJnYcViwFA6O
 5zpX4OmEG5K7fjMUUPzCCDHuK+ySCbwxNmaMwKxGtrIUs0kN1v1cuRqXBeKnmUgGhLpqchriY
 rxkvUaboacW7UyfxqwuNPZSeKqOnmb0YHHeNb0yrh98Qi94ogQT6Lj+DAJx7SY+P9QdQSkTEM
 aAQ6XzDfkzBAcu+9KHwIskgdYQGFq5rf4TaJX1/rx1DbMTcRQEjJVmSd4BQ0ZCTBgg7paodIV
 DumAfW2CENmI1Nheu84/lhUwyuE+mN6dyn3nX0CJ6O0b0OPpIpMdx9yMZgSxOyytA4NerCfkQ
 X9O/yDuapZy+66/IjWM/exCFFtgnusjOaPJDo2Ds0CUhLJbx+rkhO4c9GolqflEwXA29nSZFD
 nfK9po2ipn+n2UkhKOMMFlLJdlYivQTlA4IIcGDKAB45MzAPI7t8Ca1/tWwWVaWIzNd4L+UgU
 CHJuU2mtvtE9ga2IyOazXWlB3N4rTyNEN03kNkBrhlLcK+9zKEXai0enjJA=
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 14.08.19 um 13:00 schrieb Ramon Fried:
> From: Stefan Wahren <stefan.wahren@i2se.com>
>
> The user space like gpioinfo only see the GPIO usage but not the
> MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to know which
> pin is free/safe to use. So take the MUX usage of strict pinmux controllers
> into account to get a more realistic view for ioctl GPIO_GET_LINEINFO_IOCTL.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Tested-by: Ramon Fried <rfried.dev@gmail.com>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
