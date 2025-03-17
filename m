Return-Path: <linux-gpio+bounces-17678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5EBA64E4F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 13:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D81CE7A8F25
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 12:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9E2238174;
	Mon, 17 Mar 2025 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1QvHrU7e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BE323815F
	for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213476; cv=none; b=K1csW3rJdW0EFzvmYzzuEJnqDGyLNOfeAJx1T168OsRpKdo0d3GM/vGxsXu7RK9hZhp+Yh3SsaidDmSTYOhCxt3lXf6+3HSgo7NLfRr215/qAH85KtIpgHPi7+PGiOpjKbJC2S8xsSbLMPO6eVwuNk4v0uoig/JmbyzueIezJAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213476; c=relaxed/simple;
	bh=rkx57oeapfLrwsTzh7bfXfL9+ooCnSJcupMTLnD1GBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcY0rpKn0I7H0U5aPNJ/xFBzbk58p02zKQHHUciIux3ZhUqJ5PZn1SauJEn75mF3bbBzAY4Cm3X2wtJTXwhNSWk2/MlmVBYMWhy5MkvsnXsYmfmXIjvQf3+/2Q7PWrGVahr9Nd2KzT5livwzQm0IdS2gXdt6saDA67usHe3Y2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1QvHrU7e; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-85b3f92c866so69006739f.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Mar 2025 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742213473; x=1742818273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0AefTr+b/KmSIHJ/y0w6HkDTitHcQhMEPmgA2zTVn0=;
        b=1QvHrU7eYH8AHOZlK+y2R5oRIGUnaHWQmS3KPE2PRs1VEi+TxJ2Z/qfgZELSL44E9Y
         5mWQclJYBtadX9lFWiv7gp0sRInkhk54xxtplSs8yUefs02vae5dV4ql+H7lZuHh+2Rh
         9ywAhFbgEKKwySQB5j5wm7FsrXrlrsGGKIMclP5x38HUzpqoxIw365WmvS2wGa7FXLNC
         qg5Lpv2hIeFdxvLbkICQCqkpRws4fUbRpg8IEqONsB5/jLX4bEsHKV9a5dmuM1OE6hAh
         gWu43yw2+oF89nck0RVVnsmU8lJhu+VsEkR+VuXxH+UowXC0Hu0BNL4srekyDVsUU8Fe
         eXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213473; x=1742818273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0AefTr+b/KmSIHJ/y0w6HkDTitHcQhMEPmgA2zTVn0=;
        b=MDVbZdyRNiVr6TFg9DSaYu61Ftokhu4vlRtZ9GI+vi/TjZtQ5rBqnKxSNqHSaJRzU3
         6yg8CJaoN84oDwoFTt7xypKLIwbcV8dUslnuhD+HEiF+Sxby1hYJuyHOX880casv3axq
         7vk+yOMqlaa4kK6wxeAIXj90JFFKP1ek2mt+5wAL93En/SCJeeZVhCAEKjNF6rmpw4px
         dPXZfy8QhuCWgjcOMLdDYluRUR6EN+g6fM3/D6na88uhkMyfMNvKsxOkA4/KJnc2Si+j
         kZ/4gWW7Gec+ASQF/+24fY8Md0kd81yacYKsKUul5VfllL5Pr5DrLch9o51BgVF9Yhte
         m33w==
X-Forwarded-Encrypted: i=1; AJvYcCUA/GfyPyVszdJsgzrg6/S4CTOnfL9yCGLnZ9huyaJ2wxpYAxghS+m7SYy3LrJVwY0u8f/mvkS9jTl2@vger.kernel.org
X-Gm-Message-State: AOJu0YxW11pAoZKpktwwpTj1cmBaOHEHJ4kYhDFAqS8KtWFNTjEi5dDS
	xG8X6f6feP2Ptq2LX07vrYDebEjTeFGul8FS0Az/IQObNWLunMzzy3/wETwpUgI=
X-Gm-Gg: ASbGnctUi7qv85JZU5cij8eLtLSgoz9Wpt8D3TTN7lGw5VZJBB37jJYQOg68jszOE/k
	bgvfT1a27GvGyAUij86rmQKYZvazQ4OWPWeijJfy8T2cIHiSfbYyP5cmbWuCtOUvKtBa3IbCO0L
	0+n5UOxYSoL3P9/5ayzblUl8t3un5zItaY3xAX4c4vydzb1/WYdgLbG1Rl+TLXWSwoRtuS7ky5A
	op+FcidTgmZ7ATag6RJmNjC4pi7k86zEE1Uy1wc7ficG1JMwKkacbCBVBL7NLEBu7I53K7cTb01
	cIMNGkoQxZijvGJcmPTQRUBeairlrXodagSOvqmS1jFHq8+g6rzGO+Xz83odNb5Lgxc6KVlXHqy
	btDENxiT6
X-Google-Smtp-Source: AGHT+IHihbZvdnYYDfqQYS9Hgz8z5Z3z4PweP7imJlwjMD1yaS93kmhWHJcx0wBiJ8Y5JrB0JR4bZA==
X-Received: by 2002:a05:6e02:3041:b0:3d4:6dd2:3989 with SMTP id e9e14a558f8ab-3d483a88a3emr151134105ab.20.1742213473560;
        Mon, 17 Mar 2025 05:11:13 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a666583sm26051995ab.16.2025.03.17.05.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:11:13 -0700 (PDT)
Message-ID: <26f931a0-602b-45a9-a533-b297033655ae@riscstar.com>
Date: Mon, 17 Mar 2025 07:11:11 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Geert Uytterhoeven <geert@linux-m68k.org>, Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/25 3:18 AM, Geert Uytterhoeven wrote:
> Hi Yixun,
> 
> Thanks for your patch, which is now commit 7ff4faba63571c51
> ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> 
> On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
>> Pinctrl is an essential driver for SpacemiT's SoC,
>> The uart driver requires it, same as sd card driver,
>> so let's enable it by default for this SoC.
>>
>> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
>> 'make defconfig' to select kernel configuration options.
>> This result in a broken uart driver where fail at probe()
>> stage due to no pins found.
> 
> Perhaps this is an issue with the uart driver?
> I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> few Renesas platforms where the pin control driver is not enabled by
> default, for saving memory), and the system booted fine into a Debian
> nfsroot.  Probe order of some devices did change, and "Trying to
> probe devices needed for running init" was printed.
> 
>> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
>> Reported-by: Alex Elder <elder@kernel.org>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Tested-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
>> --- a/drivers/pinctrl/spacemit/Kconfig
>> +++ b/drivers/pinctrl/spacemit/Kconfig
>> @@ -4,9 +4,10 @@
>>   #
>>
>>   config PINCTRL_SPACEMIT_K1
>> -       tristate "SpacemiT K1 SoC Pinctrl driver"
>> +       bool "SpacemiT K1 SoC Pinctrl driver"
>>          depends on ARCH_SPACEMIT || COMPILE_TEST
>>          depends on OF
>> +       default y
> 
> Ouch, fix sent...
> "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> y unconditionally"
> https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be

This is interesting; what you say was what was proposed in v1
of the patch series.

I did not understand COMPILE_TEST to be used the way you say,
but I think that just means you understood it better than I do.

I think the rule is that "depends on FOO || COMPILE_TEST" alone
is fine.  But if you are going to specify a default, it should
be "default FOO" and not "default y".

Thanks for pointing this out.  I'll go respond to your patch.

					-Alex

>>          select GENERIC_PINCTRL_GROUPS
>>          select GENERIC_PINMUX_FUNCTIONS
>>          select GENERIC_PINCONF
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


