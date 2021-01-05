Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98AE12EB3B7
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 20:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbhAETwn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 14:52:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbhAETwn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 14:52:43 -0500
Received: from kelvin.aketzu.net (kelvin.aketzu.net [IPv6:2a04:3540:1000:310:284f:63ff:fefd:69b4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA07C061574
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 11:52:02 -0800 (PST)
Received: by kelvin.aketzu.net (Postfix, from userid 1000)
        id 336F146179; Tue,  5 Jan 2021 21:52:00 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aketzu.net; s=202002;
        t=1609876320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hFxOv3OUCqso8kwMAQtGvY6CFeXLRdXc94oaar7k/1s=;
        b=Jb8oo48AmInSiierq7bBcmjEq6Oe677KQLXGYqk1QVJLo6dV9AzXkd4uKyJ99J/jnVISFw
        4TP6av/xKfn8LHmZIKh0XYJFkgVklS0BOLIyt5RgmfbrciQCiIFOeJeeqlW8XyQHimOZi8
        m92K5v3F9BJXC/3HRl6oRGor1bhXgbE=
Date:   Tue, 5 Jan 2021 21:52:00 +0200
From:   Anssi Kolehmainen <anssi@aketzu.net>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod] AC_FUNC_MALLOC cross-compile failure
Message-ID: <X/TDYJYMRo7hEAoR@kelvin.aketzu.net>
References: <X/RzBqyV4hCdmrBy@kelvin.aketzu.net>
 <CAHp75VeuMfA4ojn7xDEKx6zbn7VZzYrcHMtjnC6_-j-wJhY=+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHp75VeuMfA4ojn7xDEKx6zbn7VZzYrcHMtjnC6_-j-wJhY=+w@mail.gmail.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=aketzu.net;
        s=202002; t=1609876320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hFxOv3OUCqso8kwMAQtGvY6CFeXLRdXc94oaar7k/1s=;
        b=XLRptRD6eu29d7ViirPQPUke/W/sK8vTSDyur+YliSM5jfV8PG0km0m1bBsSvF6+12ihO9
        JM89L95Y8piSw8+zf+hw5FzKInJmuMPH8bPqQOqR8EPO1BgKSV0l3Q/C3gvjGkVE9e97jx
        bQCFqwvGk76QW8ZHgjOSiS7PX6VCn98=
ARC-Seal: i=1; s=202002; d=aketzu.net; t=1609876320; a=rsa-sha256;
        cv=none;
        b=ZX5hhuwvYG3FY92kAiU+g9VyNw0gBy40rIeoslGMmxBZctWh0DOzWibtgzlfuge8H6LRvA
        PQGV9hBTkJjXjrjEA67qrgDG3pj1uwPQ1hi9cK+9wWbJUg068cm6bdfZ8rnbYGMp55WY7b
        fDt1YdjzSmb+Pq2tFpMBPAnTiGI/4FE=
ARC-Authentication-Results: i=1;
        kelvin.aketzu.net;
        none
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 05, 2021 at 07:24:46PM +0200, Andy Shevchenko wrote:
>On Tue, Jan 5, 2021 at 4:17 PM Anssi Kolehmainen <anssi@aketzu.net> wrote:
>>
>> When libgpiod is cross-compiled it will use rpl_malloc instead malloc which then
>> causes linking failure at later stage.
>>
>> This happens because AC_FUNC_MALLOC wants to execute malloc() in a live system
>> and thus cannot be run at cross-compilation time. libgpiod should just do
>> AC_CHECK_FUNC instead.
>
>Which version of aufotools you tried? (2.69?)
>Btw, have you tried autotools-2.70?

I have autoconf 2.69 from Debian testing.

Quick testing with 2.70 looks good.
Apparently fixed in 7fbb55372 in May 2012... And 2.69 is from April 2012.

I don't know which kind of facepalm would be suitable for this.

-- 
Anssi Kolehmainen
