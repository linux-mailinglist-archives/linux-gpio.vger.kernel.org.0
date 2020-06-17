Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCE71FD12D
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 17:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgFQPkt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Jun 2020 11:40:49 -0400
Received: from mail.ionscale.com ([88.99.12.52]:41024 "EHLO mail.ionscale.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgFQPks (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 17 Jun 2020 11:40:48 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by mail.ionscale.com (Postfix) with ESMTP id 1EE90344598;
        Wed, 17 Jun 2020 17:40:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionscale.com;
        s=201902; t=1592408446;
        bh=t/9tjY9CD1mTAfaBXj00jlv8dFLtoGZUKbU2aXTAlgc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kLZ/lCdXt/h28zBco3YUXo3bAvylZsFfAtgeVcnbAZf76pmq19XRSnqmJ9du1KZTN
         6DrnRETYnUrSeuRgcB41WjBrnKHiOCPJDvY17g/qGJyfOiAFVNAdt4cX1/F2TP9f1k
         PP4+VcB2/gRGleGJfjefp3iAbdMWxyITKnxKAHupc/vjD5XAGLIwlZpCgUkN0GyD62
         5JUQcMuGqIqfxzxPNwz1gk+JzUaicBAjFaa0IxygswZf0wnFfOCqXgb0SfIRfugA2G
         5CExaFij60pgZohw+oTkt4xWG88bBy/oUbquZUzcvvtFw8d03ZWCdzylyNUZ5J/hAg
         55Aj2eyviKwJQ==
X-Virus-Scanned: Debian amavisd-new at mail.esenta.de
Received: from mail.ionscale.com ([127.0.0.1])
        by localhost (mail.ionscale.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eukPsNkeW-F1; Wed, 17 Jun 2020 17:40:44 +0200 (CEST)
Received: from [192.168.179.22] (xdsl-212-8-140-212.nc.de [212.8.140.212])
        by mail.ionscale.com (Postfix) with ESMTPSA id 2C4BC343413;
        Wed, 17 Jun 2020 17:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionscale.com;
        s=201902; t=1592408444;
        bh=t/9tjY9CD1mTAfaBXj00jlv8dFLtoGZUKbU2aXTAlgc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mLhzqfi8mt3xZa84/KvI35ZIT9giGUf5kqpJvpJ0IqSkcT6diZO615RawHlKdv413
         uWW+nng3dMSTC/TmdLmckwh6nIsYk20z+fJjh0JR2Qu5LutBjLtiUQhQjoORC5hPmz
         QbdlvkIyclF6LEsm2gTGwWKOC4ZNPwRaaOQkVVbBNsKAJF+ogiw5IICB2HTAfCS8wd
         S9PsO96CFEPNUKBeNMzbc5Jtdy9li/O7D6AcaMcKy9n5l+3Wv5DzLzCULa5M7j+e2E
         3WS9HQmdc91UlVvwzW/nL4IPVXRKS/GPorSdXRZatn35jmmabPw4DDNwapGhx1Df0v
         nBYC7NkaAq9Vw==
Subject: Re: [libgpiod] reading multiple lines after edge event
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
References: <a21e051a-805b-4c26-6f47-99f1654f222b@ionscale.com>
 <20200617015717.GA16394@sol>
From:   Gerrit Wyen <ml@ionscale.com>
Message-ID: <2a50a3b7-c970-24b6-c77e-64e1362646f3@ionscale.com>
Date:   Wed, 17 Jun 2020 17:40:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617015717.GA16394@sol>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 17.06.20 um 03:57 schrieb Kent Gibson:
> On Mon, Jun 15, 2020 at 09:39:45PM +0200, Gerrit Wyen wrote:
>> Hi,
>>
>> can someone explain the following behavior and whether it is a bug?
>>
>> When reading two lines at once via get_values() in response to an edge event
>> I only receive the correct value for the first line (second line is high
>> during the test but always reported as low).
>> See example code below:
>>
>> lines.request({
>>   “gpiotest”, ::gpiod::line_request::EVENT_BOTH_EDGES,
>>   0,
>> });
>>
>> auto events = lines.event_wait(::std::chrono::seconds(10));
>> if (events) {
>>   auto values = lines.get_values();
>>   for (auto& it: values) {
>>     ::std::cout << it;
>>     }
>>   }
>>
>> However reading the same lines via get_value() one by one after the event
>> works correctly. Like so:
>>
>> for (auto& it: lines) { ::std::cout << it.get_value(); }
>>
>>
>> Also, when reading them without waiting for the event with
>> line_request::DIRECTION_INPUT  the correct values are returned by
>> get_values() as well as by get_value().
>>
>> This behavior was tested on multiple different devices.
>>
>>
> 
> I have written some test cases and can confirm that behaviour
> with libgpiod v1.5.
> 
> When you request the lines with DIRECTION_INPUT, libgpiod is using a
> linehandle (which works), but with EVENT_BOTH_EDGES it is using
> a collection of linevents (which doesn't).
> 
> I would consider that a bug - linehandles (lines without edge detection)
> and lineevents (lines with edge detection) are treated differently
> in the GPIO uAPI and libgpiod should be hiding that from you - and is
> failing to do that.
> 
> The issue here is that the underlying function that retrieves the values,
> gpiod_line_get_value_bulk, assumes it is dealing with a linehandle
> that can be read in bulk by the kernel, not a collection of lineevents
> that must be read individually, so it is only getting the value of the
> first line in the set.  It should be getting the event lines
> individually, as you are, and collecting those values into the response.
> 
> Until there is a fix, the workaround is to read the event lines
> individually - as you have already discovered.
> 
> Cheers,
> Kent.
>

Thanks a lot for the quick response.
I applied your patch and it fixed the issue.

best regards,
Gerrit
