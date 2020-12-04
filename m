Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1990C2CEA7B
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Dec 2020 10:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgLDJGx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Dec 2020 04:06:53 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:37821 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgLDJGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2020 04:06:52 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 982AD22FB3;
        Fri,  4 Dec 2020 10:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1607072770;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UkNJaPluVvv+Tgikv99K04Dg3690ZJDLlH87exn6LzY=;
        b=JW5j1Xw1BL9NmJQmZ4uE36/eh60zijRhhyEQJRwX0zz2jRUxEhkuOEELk0hupoOHt4Hxtr
        UBvJ0dJBhNv9hnLNBl/tFYM7ZpkcmpjnR13T/z5nYHWtul/6s+zXfaTg3wUdiZkM0+lrD+
        2zpJ+iCfUh94Sasx1TxTFOg7UAB83CU=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 04 Dec 2020 10:06:10 +0100
From:   Michael Walle <michael@walle.cc>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Wang <jasowang@redhat.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers: gpio: add virtio-gpio guest driver
In-Reply-To: <8ab347b9-8b1a-f49f-d194-f98284fa6099@metux.net>
References: <20201127183003.2849-1-info@metux.net>
 <CAMpxmJXJLTzM20xLCoM4spjibXbA-FfdPmOBp1QcV+9cScNNMw@mail.gmail.com>
 <f14c0197-b346-7af5-9dd0-9b8018baaeaf@metux.net>
 <b287f185d554b5a87b82ea8ca79cb5a2@walle.cc>
 <8ab347b9-8b1a-f49f-d194-f98284fa6099@metux.net>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <0dde3c67e0e895b8ce70de910a285fd8@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2020-12-04 09:28, schrieb Enrico Weigelt, metux IT consult:
> On 03.12.20 23:35, Michael Walle wrote:
>> Am 2020-12-03 20:00, schrieb Enrico Weigelt, metux IT consult:
>>> On 02.12.20 15:15, Bartosz Golaszewski wrote:
>>>>> +               bufwalk = name_buffer;
>>>>> +
>>>>> +               while (idx < priv->num_gpios &&
>>>>> +                      bufwalk < (name_buffer+cf.names_size)) {
>>>>> +                       gpio_names[idx] = (strlen(bufwalk) ? 
>>>>> bufwalk
>>>>> : NULL);
>>>>> +                       bufwalk += strlen(bufwalk)+1;
>>>>> +                       idx++;
>>>> 
>>>> 
>>>> Something's wrong with indentation here.
>>> 
>>> i dont think so: the "bufwalk ..." line belongs to the while 
>>> expression
>>> and is right under the "idx", as it should be. I didn't want to break 
>>> up
>>> at the "<" operator. shall i do this instead ?
>> 
>> Or don't break the lines at all. Both lines don't add up to more than
>> 100 chars,
>> right?
> 
> IIRC checkpatch complains at 80 chars. Has that been changed ?

yes,
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144

-michael
