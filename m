Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C956FC2C17
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2019 04:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731539AbfJACy3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Sep 2019 22:54:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45774 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbfJACy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Sep 2019 22:54:29 -0400
Received: by mail-pg1-f195.google.com with SMTP id q7so8562351pgi.12;
        Mon, 30 Sep 2019 19:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sxdXfiuNl2yFvJ36iDY38onydEuHSgA4zj8cf4BOews=;
        b=WvJzPJQ4MYk59SYfnZ7pFb5nQLIKzWCZoHIr570P6ZkrSfBi7YIQrtO7bVjG7iOzK9
         BBbTlJV9h1dsHl2dsEOZ5l8jcawQ2ktzMNogtNU14kUrJzxKKo1LwA/GIdcTJTVuZH3Z
         W1IGGYIzyyvMOXGW96LgoUgv6hP24vuuiOOKAn6+j+vR1vD5ydjA2/wa3pbRoTwrQp2S
         1YlEodj+7RI5QCpw1uaOyLAqkTlKggU21qOrC0oIJuGOvgmupfh7tMG1Qr1adBaUHCp7
         Cd0cpGr98ddYeeFpPl5nWq2/y4JPiYdMXoGR/7hfinHVKJ4wPcJQx1kuhQ8srAqHKIyj
         WZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sxdXfiuNl2yFvJ36iDY38onydEuHSgA4zj8cf4BOews=;
        b=O0y2O372+yDIKqm/70WTqa8r+B50Zzhpkrf7QJrD38jYvvuCxbyURkW7YWUyYKrTUm
         b/Uz1HBrCwuvPOcyl+6ZlNVSr7FONkkxLG9ueNo2X82gwLAUrpqNDMvaiWIeuOV8nqVL
         kWuArZiwNyPyRUOYzO2+aq2ALM2kyzPZ9UTFTNKWRkDa/MqnqsUmSrybPInEIS2Dem1E
         WCzp4iXXajfq/iYxd91e3SYX24Cj5j5xlIFNpiSyzjMjsWAGl3wyhp3gvnx2eiWa0lC4
         BrxN6mQYmAi1gah0i6xqdnDUoSiTmzvNHlIObCdO2T+Smg15XfGox219CZkrjdYrB33b
         TiKA==
X-Gm-Message-State: APjAAAWbqIGltwcdLbMFcRWK5Hi+9JmeEXwvhNCTpBEjrgTIc9k5FrZj
        hBA1AW1qu0HzlskPJVfFIa9tQMTg
X-Google-Smtp-Source: APXvYqziA8ujixxzDMRL/C5XU0l8zVQ8tUDosVuZXzauorvclA9c5mKPQjTamNyOJXRQJ+YAD+lh/Q==
X-Received: by 2002:a62:4dc5:: with SMTP id a188mr234181pfb.250.1569898468601;
        Mon, 30 Sep 2019 19:54:28 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id d76sm18347397pga.80.2019.09.30.19.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 19:54:28 -0700 (PDT)
Subject: Re: Problem sharing interrupts between gpioa and uart0 on Broadcom
 Hurricane 2 (iProc)
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "rayagonda.kokatanur@broadcom.com" <rayagonda.kokatanur@broadcom.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "li.jin@broadcom.com" <li.jin@broadcom.com>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <32c3d1dfe61a656e3250438d887e5ba91bd880d0.camel@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d72a965a-e4e1-ba5d-cd62-b31939e75e44@gmail.com>
Date:   Mon, 30 Sep 2019 19:54:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <32c3d1dfe61a656e3250438d887e5ba91bd880d0.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 9/30/2019 7:33 PM, Chris Packham wrote:
> Hi,
> 
> We have a platform using the BCM53344 integrated switch/CPU. This is
> part of the Hurricane 2 (technically Wolfhound) family of devices.
> 
> Currently we're using pieces of Broadcom's "iProc" SDK based on an out
> of date kernel and we'd very much like to be running as close to
> upstream as possible. The fact that the Ubiquiti UniFi Switch 8 is
> upstream gives me some hope.

FYI, I could not get enough information from the iProc SDK to port (or
not) the clock driver, so if nothing else, that is an area that may
require immediate work (though sometimes fixed-clocks would do just fine).

> 
> My current problem is the fact that the uart0 interrupt is shared with
> the Chip Common A gpio block. When I have and interrupt node on the
> gpio in the device tree I get an init exit at startup. If I remove the
> interrupt node the system will boot (except I don't get cascaded
> interrupts from the GPIOs).
> 
> Looking at the pinctrl-nsp-gpio.c it looks as though I might be able to
> make this work if I can convince the gpio code to return IRQ_HANDLED or
> IRQ_NONE but I'm struggling against the fact that the pinctrl-iproc-
> gpio.c defers it's interrupt handing to the gpio core.

Not sure I follow you here, what part is being handed to gpiolib? The
top interrupt handler under nsp_gpio_irq_handler() will try to do
exactly as you described. In fact, there are other iProc designs where
"gpio-a" and another interrupt, arch/arm/boot/dts/bcm-nsp.dtsi is one
such example and I never had problems with that part of NSP.

> 
> Is there any way I can get the gpio core to deal with the shared
> interrupt?
-- 
Florian
