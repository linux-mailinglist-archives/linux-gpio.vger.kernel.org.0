Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB7621C0F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2019 18:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbfEQQ4W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 May 2019 12:56:22 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41354 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfEQQ4W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 May 2019 12:56:22 -0400
Received: by mail-lf1-f68.google.com with SMTP id d8so5812927lfb.8;
        Fri, 17 May 2019 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9KNE3fFrhBMbpw6CB84d/cuOTgsPDrXbc4lzxvxznkQ=;
        b=hquZa7JtJMvlCdHRojaV+TZVDrxlzn4Gc8M13v9S64cRsCeonc0VNddiPYeGptvhTf
         QXdYsjuc5cONkunjjC/PvQT800vdS52RIn32F89g/pzucWHQhnNmVKIF6h+SQp/ROXI/
         Dp66tBncI/qoRP1G3f4swX2glflObf+PCQlQ7v/QiX5rH9tjfibZmYC4mMUCjDlDpfCO
         QmChoJ1/4Tqg7AqGrbaOL3KUy689OgPvcK8/hI31SzrZhxwNingnd8OXp0no2aoa4KLC
         kj7n95mqIHA28/DcM4cBlAE/n2WQ2RxciBP5Fe+yifG4oWz8CdKQkx7kQzxzpe4YQOhv
         qd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9KNE3fFrhBMbpw6CB84d/cuOTgsPDrXbc4lzxvxznkQ=;
        b=TbtXssbegEC4fjbCmyI1+C1YaSE/3ou6UtKSXN0N6K3cJWDR95VOKtDL2OUUF6CSjj
         bgh73q8gDrCbSll1BVFNrPdPX/RhT+SQ7OTt8mBKaz4SJTXv2xr0NA5YDcFNwLLG2Uts
         hJFkhgGFDFSRgIl4N55Mza2hyrVX7xZ2Lgx9ZggEdzxDWs33f2Dl3SRYxScVVOehLQJy
         /R85UQhigbgmEfhH7YsxXLMXCAimfcFCVzN2O5AhqsDB7tCNSvj3jnHQlno+SmUibEa0
         ZOJNEcAKMJ/fJVk3xvh7WpMwBNFveDalqLjre9KJU9LxXtkgf4WFVkv/cAnKbrXdedeV
         54Gw==
X-Gm-Message-State: APjAAAVmFxln+XlYeHClC4lxQwFF25U+1E0UH7LSmzhfJA40JKRf8Ofv
        zdozq59NjPcNt9svWREeEnitRcBv
X-Google-Smtp-Source: APXvYqw86J0vbCPBjCkeEeQmSKdfzU+5b6cIvEchr7LpbgK6813mL6a0JVbDAMDfDVrqpa0+VU3bCw==
X-Received: by 2002:ac2:494b:: with SMTP id o11mr28503290lfi.9.1558112180247;
        Fri, 17 May 2019 09:56:20 -0700 (PDT)
Received: from [192.168.1.16] (blb109.neoplus.adsl.tpnet.pl. [83.28.195.109])
        by smtp.gmail.com with ESMTPSA id d18sm1685107lfl.95.2019.05.17.09.56.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:56:19 -0700 (PDT)
Subject: Re: [PATCH 0/2] Fix LED GPIO trigger behavior
To:     Kun Yi <kunyi@google.com>, linux-leds@vger.kernel.org
Cc:     pavel@ucw.cz, dmurphy@ti.com, u.kleine-koenig@pengutronix.de,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <20190516214209.139726-1-kunyi@google.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <87d5d4a6-857b-b362-baaf-3a004ee51d49@gmail.com>
Date:   Fri, 17 May 2019 18:56:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516214209.139726-1-kunyi@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Cc Linus Walleij and leds-gpio@vger.kernel.org.

On 5/16/19 11:42 PM, Kun Yi wrote:
> *** BLURB HERE ***
> Hello there,
> 
> I recently tested ledtrig-gpio on an embedded controller and one of the
> issues I had involve not requesting the user input pin as GPIO.
> 
> In many embedded systems, a pin could be muxed as several functions, and
> requesting the pin as GPIO is necessary to let pinmux select the pin as
> a GPIO instead of, say an I2C pin. I'd like to learn whether it is appropriate
> to assume user of ledtrig-gpio really intends to use GPIOs and not some
> weird pins that are used as other functions.
> 
> Kun Yi (2):
>    ledtrig-gpio: Request user input pin as GPIO
>    ledtrig-gpio: 0 is a valid GPIO number
> 
>   drivers/leds/trigger/ledtrig-gpio.c | 35 ++++++++++++++++++++---------
>   1 file changed, 24 insertions(+), 11 deletions(-)
> 

-- 
Best regards,
Jacek Anaszewski
