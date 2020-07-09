Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2C7219EE1
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 13:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGILKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 07:10:38 -0400
Received: from mail-ej1-f42.google.com ([209.85.218.42]:37230 "EHLO
        mail-ej1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgGILKi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 07:10:38 -0400
Received: by mail-ej1-f42.google.com with SMTP id lx13so1845751ejb.4
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 04:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mcVXD+/awrEQMpSPgKyfuQLB09s2GbjJsLOsrpqUBAU=;
        b=ijqpV8F6PKl6YDPLJCqeOMk3jnxtGR5dXqKvYr1xdwvdNmtLW5YVOSibSdubWjV8Mc
         BGqgvX8RWFu1Yp3f8P8YZR5l9sMninvd4OP6Kqr2Rx2wiBHl6Gt6PPjV52hCoxG/LgC0
         o9UBTWkIKXnnp8OKl9rALAMi9EbYDoMmumYqk7OizT4l9gXud1FBi2Prt+lMkHuTIX2h
         512/RVqokEuFjX8sV44pcQKjjd7s9ojcofqXHDG0sr2D/Y8sdR7+Osohg36S4y9HNqpb
         PebjSv5FtbdbIXy79bG0knNR/yVZXe4xyGarAj2fG22ji8LC1vEzao/cxzhQLqXpN4LV
         WZIA==
X-Gm-Message-State: AOAM531jij6PjrSRFFIlncUdEF2yZBup7s9bf47Btu5bkD2z4QixMOiu
        OnUtqgXO9QNtjKvH8EB47tc=
X-Google-Smtp-Source: ABdhPJy/okWDcG3hU/IWGWmAiTzZWtz8coCwzqoUH8Tuaq5uxdxfb1ZC7UAi9FT9E3Gp4836E5QVLg==
X-Received: by 2002:a17:906:27c9:: with SMTP id k9mr54815495ejc.74.1594293036127;
        Thu, 09 Jul 2020 04:10:36 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id ay27sm1768846edb.81.2020.07.09.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:10:35 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
 <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
 <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
 <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com>
 <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
 <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com>
 <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
 <ca4dfb41-843c-d859-2128-c985aec97a99@redhat.com>
From:   Jiri Slaby <jirislaby@kernel.org>
Message-ID: <032ecb14-e8be-19cd-9150-91c633f28a2c@kernel.org>
Date:   Thu, 9 Jul 2020 13:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ca4dfb41-843c-d859-2128-c985aec97a99@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 09. 07. 20, 12:01, Hans de Goede wrote:
>> Any other idea what file/volume I should create in EFI fs?
> 
> No I'm afraid not. The ACPI subsystem will execute the DSDT's
> _INI method (line 21712 in the disassembled DSDT) pretty early on.
> 
> I think the best way to workaround this is to use a DSDT override
> where you set OSID=1 in that _INI method.

Yep, that indeed works.

> This is far from ideal, but so are the other options. Unfortunately
> this will not help any other users with the same device, but it at
> least should get it working for you.

If we only had sources of that BIOS (or at least binary)...

Now, I need to find a way how to persuade dracut to automatically pick
up the updated DSDT.

thanks,
-- 
js
