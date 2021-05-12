Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9BD37B8EF
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 11:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhELJS7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 05:18:59 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:34805 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229968AbhELJS6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 May 2021 05:18:58 -0400
Received: from [185.56.157.72] (port=41428 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lgl01-0008BZ-OV; Wed, 12 May 2021 11:17:49 +0200
Subject: Re: [PATCH 1/3] mfd: lp87565: fix typo in define names
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210219223910.1831-1-luca@lucaceresoli.net>
 <20210308140440.GH4931@dell>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <365cc875-e1de-0a81-6163-007f574779d3@lucaceresoli.net>
Date:   Wed, 12 May 2021 11:17:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210308140440.GH4931@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 08/03/21 15:04, Lee Jones wrote:
> On Fri, 19 Feb 2021, Luca Ceresoli wrote:
> 
>> "GOIO" should be "GPIO" here.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> ---
>>  drivers/gpio/gpio-lp87565.c |  6 +++---
>>  include/linux/mfd/lp87565.h | 28 ++++++++++++++--------------
>>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

Gentle ping on patches 1 and 3. Both have at least an ack and are fairly
trivial. Both apply cleanly on current master.

Thanks.
-- 
Luca
