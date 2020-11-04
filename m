Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030C72A6702
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbgKDPDM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgKDPDM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:03:12 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619F0C0613D3;
        Wed,  4 Nov 2020 07:03:10 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id l28so27494957lfp.10;
        Wed, 04 Nov 2020 07:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gjWP17IJO7VBo6R8hUOdy+1jqM/u8FrFgqOf3bq/Ssc=;
        b=ClLCMlLV4agLsqlq9876Lswawyy0LlctbGl5UdQggm7P9tz5gve6ro4bS1SDN2l36s
         sHb/O3E7JituQ67Abmigh1bMcPadmnmJlwhAUA6+bySaX4JT7yrzitDwoGQoSOm24RvH
         1lVlOsBytBXO64sZ5iPAjiM+WdI3/XYFHk5/pTK6+ta4Wyc0EJCGx4V0Xi3WWz+vKr6e
         aeEMMiog7uZjC3fQlgQrpEbtxa9lzaP0KqNnwHOq5KPQK9XnWQ+IBnhy3ySO6sMOdmE5
         KzDAx3mNwI2+szB0xE0o/ycLY3xH3xkNUM+LITJKQOFOxveHApifVu9ABoWJLs3ooC2L
         IJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gjWP17IJO7VBo6R8hUOdy+1jqM/u8FrFgqOf3bq/Ssc=;
        b=iSp8nl+xVsCbN73vCj0xxgybrLMrDzEN0UVA9jOeWyivF5It9HMNFOF+rOh99p2A0L
         i7z58iUwVskvqZIq6mDR4bHmrCwze5TltjAYqvCnP6xKu0uARF8pVsLPIN3OvHcCYoiT
         +TO1cck+7MfO2+fEExYLPJyvWmxpBwTHxLHG3/IlrDfYRf0H2ZxZTxdpflxi59g3+1hE
         4EBfXuAPCsEovKA1E+Vgdzp71SjhPab2uPt45fFIeHp5hgn+OnMEKur4AAqeIMU6/uB6
         HR/MIY0EUdACGrfXAZP+ZXoWrvEFSPS4cXORiAQM4FJOUddpgelWdEBAQRXJHyeNmJfP
         DNuQ==
X-Gm-Message-State: AOAM53333AvI7O167i5PJo7PoxXmT8a0gwUsy+pLDb+1jq0i8vhPsKDb
        bmTdYcVSSlg9aXoiw0nKPUe+sa7vTWc=
X-Google-Smtp-Source: ABdhPJwJ8A3eIiAPZEhfRhohkACkpIWiuyPBbu0ksy9XDFnhv9iszkLTTjI1rmMULXuzlc0ICQ3txw==
X-Received: by 2002:ac2:59de:: with SMTP id x30mr9218249lfn.19.1604502188732;
        Wed, 04 Nov 2020 07:03:08 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.googlemail.com with ESMTPSA id d26sm541500ljj.102.2020.11.04.07.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 07:03:08 -0800 (PST)
Subject: Re: [PATCH v1 2/2] gpio: tegra: Use raw_spinlock
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201104132624.17168-1-digetx@gmail.com>
 <20201104132624.17168-2-digetx@gmail.com>
 <CAHp75VeJrQCxaCR+6u79=k=EP7y=LpEsytp6MWQ+UGz+oFXP6A@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <274bca60-6a8f-773b-aff1-2a897376a6b1@gmail.com>
Date:   Wed, 4 Nov 2020 18:03:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeJrQCxaCR+6u79=k=EP7y=LpEsytp6MWQ+UGz+oFXP6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

04.11.2020 17:47, Andy Shevchenko пишет:
> On Wed, Nov 4, 2020 at 3:27 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Use raw_spinlock in order to fix spurious messages about invalid context
>> when spinlock debugging is enabled. This happens because there is a legit
>> nested raw_spinlock->spinlock locking which debug code can't recognize and
>> handle.
> 
> This sounds like papering over a problem that exists somewhere else.
> 
> What I would rather make as a selling point is that raw spin locks are
> necessary to be in the RT kernel for IRQ chips.

This should be a well-known problem because other GPIO drivers also have
it.

For example this one:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20201104&id=023892ec80f0efcffe22045e92bb89f3f1480f2d

Although, looking at it again, I think there is no real need to change
the dbc_lock since it doesn't relate to the IRQ. Perhaps this could be
improved in a v2.
