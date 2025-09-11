Return-Path: <linux-gpio+bounces-25985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B236B53CB5
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 21:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2755D5C0F95
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 19:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FBD26B2D7;
	Thu, 11 Sep 2025 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYbqvfh0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770FE255F5E
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757620245; cv=none; b=WGZszLSooKv/xwT9YSW0G6qnMkYY1pUhaZY1b4P1CFwTfS349/pEW1MY4VhZVwaKlaTwWH4ywvFyXImB3DDz6j/fjpWLzyHAmyteKnubh2EQJGiEpjEKT4W8muKtM2MXCP7lkoCAUKoIW5MyTIK0i5Jg2qMfb/CaK6v957rSOjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757620245; c=relaxed/simple;
	bh=kjGxb0dqWe7yMsPMZAV2sViKlRrgFATmcxKdL62xjMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvc8Ud7dqQutYvKiBJyMD5hZDhILkTRNbsAapInFKlLuSkrL8YECHjXwgaJnWUmQ6FfCy3kobIGzfIcHrayhJGyowMN0ZsS3NGT5/zxQLHEAbQp5SsJ1p5/5DKZrG5UH87QA9RMTvm+fKB3O2euBsLckcylOn7ih6xMDd8LA1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYbqvfh0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24456ce0b96so13745215ad.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757620244; x=1758225044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=lYbqvfh0apVRXMw+txPj0wP76djiX9rgjxr4pMffpBBxgjA9QIxYKQvqPyWx8yFLYP
         8l/q3pWkuetePejx6oo+sURwayCHPh2fzsURenVJ14vSn2gFHhPb9MxOx66joJjW/AXm
         VVfnH8vC1kA7mDA2GGoaNyVgUbrQ/jUj17cTeAAEM8lqP4aYRAAZbJrLF1svu21pFe4I
         0ESLc0Pp/rY3tMipO/Wl7U37HbTdplJnH43xex4KBq+yB4vbnhBzRyGmLyOFQNFzKGUp
         i/rDcGTgEuyoH3u3E0YJ8eZWS72evKAgxCUJTw2wigD0TXH/sSyAc7ibOsNwXc0QwcWs
         58XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757620244; x=1758225044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=CbJIXwFEejC2R4bWyU1Aeb2U3p9Me5NNw7oHBt9cUpwsUOGZ0mrv1LfMQIjb4bXIYz
         9wbf7o4cAOMWmk3q7ipEMYdmmPAdZWBap7KDtU2RkeVkgEtkGrC3S4Uz3dAxtt+FhBbJ
         15PWxh33qmHXRaDqPIg2MVI5ukJGlI/Z9xhQpVyGNVFyygcdugS8qP6KmG3BVvfoNrv3
         gyEBZwgXlGOYrFeak7a0ZgYH8DROCyA8nCaLm7rM48tiqqZutl2mSZQvYsc2pqJzacLt
         8xNPsqKKhLtzVzVuyN+MY9MMlFDJIipGrvr0SwQgmjBw7O/snmAzpakJNrUtKtoEck88
         MuRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZZIKvzTfuF1QvO6jfH72Vrtb17Atb0fzpcsiTOOjxELXETRsON0EbvPReJHOr8UdSxdb/Yr+NxNae@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0Z8CLqM7/tmfY6LtIKKOxgF6gnyZK+CKLCDhB+HIQyB6u/dH7
	MhR0F928Chj6ow76QnjFGjNjzq57/Y1ZmY9zVWrzXri/FcQDY7leycU3
X-Gm-Gg: ASbGncvLSafsJ73poF+rHz3K1FIpJ3ofnqJI2O9k5n4elrrhkk2zQcptsy+uMO6qAwK
	TrAD13uRclGF/tsFDQ/xCVT242rxMYvgaHdbRGALtpgqy0uimw9feNAUo61raKUm/oYkW+12J/s
	9SfqHJs1x78blWb+QTSd+e5LbmoSRBh7H4rmadc23VZwziW2i/TMM8mOawfUmFxz+DAx3Q4jCao
	xqsBIF43m1SjAzPbB8mXv1avqZ+yuQWK0EX5T7HPaBznymUpVFXmRFKW1N9xfJkEGp1Jq0fq7Qv
	KlHPKpke0kJ0qg8tqh2+ih7aelQ869zdUTZmtD1vRzAXcvdREhyOI7L/VRwD0ymLWlIvb13eiZs
	dbWQnklO77lswtHn62GqalOCfBfpoMO55h240GBY1Zi4RJxs4
X-Google-Smtp-Source: AGHT+IGM3HY9cYe0k8sf5GxMMVgG9l2ykvqk4n7ayiGGr2GhLio6Ij8ygJsJDwHZ88T4ZvBeMdpxjA==
X-Received: by 2002:a17:902:d506:b0:25c:9084:4172 with SMTP id d9443c01a7336-25c908466d3mr25755745ad.14.1757620243626;
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Received: from [10.69.47.143] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc53bcsm26957775ad.28.2025.09.11.12.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Message-ID: <cfe7bc19-763f-4e92-b1ae-355c661bcc19@gmail.com>
Date: Thu, 11 Sep 2025 12:50:47 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
 <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
 <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/2025 12:56 AM, Bartosz Golaszewski wrote:
> On Thu, Sep 11, 2025 at 2:11 AM Doug Berger <opendmb@gmail.com> wrote:
>>
>>>
>>> @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>>>                 * be retained from S5 cold boot
>>>                 */
>>>                need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
>>> -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
>>> +             gpio_generic_write_reg(&bank->chip,
>>> +                                    reg_base + GIO_MASK(bank->id), 0);
>>>
>>>                err = gpiochip_add_data(gc, bank);
>>>                if (err) {
>>>
>> I suppose I'm OK with all of this, but I'm just curious about the longer
>> term plans for the member accesses. Is there an intent to have helpers
>> for things like?:
>> chip.gc.offset
>> chip.gc.ngpio
> 
> I don't think so. It would require an enormous effort and these fields
> in struct gpio_chip are pretty stable so there's no real reason for
> it.
> 
> Bart
Ok, so assuming struct gpio_chip is sticking around long term that makes 
sense to me.

Thanks!

Acked-by: Doug Berger <opendmb@gmail.com>

