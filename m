Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10ECA3896E2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 May 2021 21:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhESTnh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 May 2021 15:43:37 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:44087 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhESTng (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 May 2021 15:43:36 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id BD39D22178;
        Wed, 19 May 2021 21:42:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621453332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o4jBnun2LSkXDmFiIlCKYTFr+oT+1PQC4hYSvDF/i3w=;
        b=edWurywZjdeWJTnNg9V7vpsyUR7RzqcRH28dfvryzJ20dy/kY2UELkS+jhTiU+gGn8TDOl
        fbD5SU21m3zjoeNh7/nY7sI+TQ1wHT1jPJNzYoAGOnjGYLlI03Rlq1WOygzHVFIisUirdf
        VYdud+aU8VdMHf3ousvOf8uZvS0UBjg=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 19 May 2021 21:42:11 +0200
From:   Michael Walle <michael@walle.cc>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Lee Jones <lee.jones@linaro.org>, robh+dt@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, jdelvare@suse.com,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>,
        jmp@epiphyte.org, Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH 1/6] mfd: Add Delta TN48M CPLD driver
In-Reply-To: <CA+HBbNHCnpg9qCzZbT9KVNqX-daC68iaJKNdyEf7do3w98miWw@mail.gmail.com>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <af4923ef1ed0693fcd67d7986348b164@walle.cc>
 <CA+HBbNHCnpg9qCzZbT9KVNqX-daC68iaJKNdyEf7do3w98miWw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0f28cabf858154842819935000f32bc2@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Am 2021-05-19 13:53, schrieb Robert Marko:
> On Thu, May 6, 2021 at 6:34 PM Michael Walle <michael@walle.cc> wrote:
>> Am 2021-04-30 14:35, schrieb Robert Marko:
>> > Delta TN48M switches have a Lattice CPLD that serves
>> > multiple purposes including being a GPIO expander.
>> > So lets add the MFD core driver for it.
>> 
>> Did you have a look at mfd/simple-mfd-i2c.c?
> 
> Yes, that was my first idea but we have a requirement to expose CPLD
> information via debugfs as there are userspace applications using it.
> And simple-mfd-i2c does not allow us to do so.

Mh, last time Lee wasn't very fond of having a driver that just 
populates
sub-drivers while doing almost nothing itself. See
https://lore.kernel.org/lkml/20200605065709.GD3714@dell/

That being said, I'd also like to expose our CPLD version, but until now
haven't found a good solution.

-michael
