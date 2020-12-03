Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8D42CE1DD
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Dec 2020 23:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731935AbgLCWfo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Dec 2020 17:35:44 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:33655 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387629AbgLCWfo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Dec 2020 17:35:44 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 8C7D422EE3;
        Thu,  3 Dec 2020 23:35:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1607034902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ApfT7BqS8VKiR7VF/My//B2mRx4iTy2qjCIfLunfdUw=;
        b=efhjip1akBRMhoA4AZ1iYwiyRFfTJ2jJZXPUNttZ+SWLTGrw1BybFcWmKR9LYhPYB3BxZq
        PKcwhY0GcDIueAwovbzzjFXM3v3ToOSQ23lRvauplrzDcC04LtmYZMeEV7IXXBOoeuJ0to
        +1YObOy0QhiBdvpqOUv8GPFrVarMmV8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Dec 2020 23:35:02 +0100
From:   Michael Walle <michael@walle.cc>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
In-Reply-To: <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
References: <20201127183003.2849-1-info@metux.net>
 <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
 <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2020-12-03 20:00, schrieb Enrico Weigelt, metux IT consult:
> On 02.12.20 15:15, Bartosz Golaszewski wrote:
>>> +               bufwalk = name_buffer;
>>> +
>>> +               while (idx < priv->num_gpios &&
>>> +                      bufwalk < (name_buffer+cf.names_size)) {
>>> +                       gpio_names[idx] = (strlen(bufwalk) ? bufwalk 
>>> : NULL);
>>> +                       bufwalk += strlen(bufwalk)+1;
>>> +                       idx++;
>> 
>> 
>> Something's wrong with indentation here.
> 
> i dont think so: the "bufwalk ..." line belongs to the while expression
> and is right under the "idx", as it should be. I didn't want to break 
> up
> at the "<" operator. shall i do this instead ?

Or don't break the lines at all. Both lines don't add up to more than 
100 chars,
right?

-michael
