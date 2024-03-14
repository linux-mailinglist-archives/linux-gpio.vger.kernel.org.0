Return-Path: <linux-gpio+bounces-4328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7587BE9B
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 15:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D75D1F23799
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Mar 2024 14:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7F16AFAC;
	Thu, 14 Mar 2024 14:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Bm2kzMFt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7226CDD7
	for <linux-gpio@vger.kernel.org>; Thu, 14 Mar 2024 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710425469; cv=none; b=pTFspEMMD9EzBnb0tapfwpfX3h4r8EaMXuozbjBEedfsjiVFi0RS6a0Q+b6/o2TpWEW4gtPZCsVAUBh2Idqm58jymwhO30K6D53IHLL5GSSQ4ZA9dnmY+euu5GgNW4fmOXG9lrFTLyMAFBBvSHPsk14jWZORFuO62lr6RKSlPBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710425469; c=relaxed/simple;
	bh=EP0L4/as9nxE0lKi4we9oY73zQPhQ4YRmDCQOtvHWlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfXHLz/V0wd7DWqPAA3pUjJTSFqhiO2ECoFyBtnXaulCkyeAKYQl2r58oYk8FnMVLThbF23S7RwM4t3y71rxsU8IDdQg0BqZrdCZB9upE5tj+6JekgdU/fjobtUH2uz9Hi+E1Ze2cnDYcYmGsCmuhlKRMoYdrXr+2bRoMy+H35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Bm2kzMFt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d24a727f78so11626971fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 14 Mar 2024 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710425464; x=1711030264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jPZL+farhsuUuOhDhbQjn1BkC3HvW75LXDKYJuhfZE=;
        b=Bm2kzMFtkeX5MsH0cZFT1Q6A91s6nnffNUuMonwpsHo6jcvtCAvqk+bTZW6iTjmVIz
         I3A8JU08wzPAze+v/oN0To2oa0OHdHvwi4M3gU2Qs4Sl2U12PW2Jkq3zaYbKlneTnn8Z
         T0hoVFwatRr180E2bvXHB+btWsYYE2g0iSzYHGdUkgol5MyruDu/PRXwUFC6n+GImhCU
         uwnMZOqGe7TzvWPd6iBY0p4xV1N3LMG9350qit7ZA4fv2PW1P/6H3tRPEC/F3oaPDPVL
         TAvkgH6v64z96b1GOcRZeBf8j20cDbl0IjYamJkMzolNdDl/z035Ir3XAzTr1qHZbtzu
         8R9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425464; x=1711030264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jPZL+farhsuUuOhDhbQjn1BkC3HvW75LXDKYJuhfZE=;
        b=wCxOegLk2PtO7FAnTMj4GBdfSHq+Xrp8sv0OJ1NH1mgXScyi+1bJuy02yLwC/dLB6Y
         lu+QKeWsTAFsfxw+AYHovlaSjXIinfnpOWJQtx2DMEEEskPqv6uCowb4T+znLkecsy+G
         Qv9p8whhUQnf+v6bjELgxpHWTH8iTidf7VfLOC3Xu0MluqLvZ9yER066Mo/AtWi5ura4
         SgVi0GP4ZojcpLv7CjgI8d7IFk4CMNQnQG+h2vifbCaf54WQSbtBBBy/7t4BvQZ7VRYr
         sXN15v2wt1R8IBkfWXS3OJI+Xl8ypPTDHuJSRsMUadJ1kCCyxp3ypHB1h18pP3B7qulI
         Dgsg==
X-Forwarded-Encrypted: i=1; AJvYcCVqLW87exSBYzDOZ0J2UwC9w/kdPcSLocotmrzVeGRgpybOGnFQ2LVFTV//5dU+Yum9qxRhLtZaApxn4/iNh1iXusLs5TC2b7WIzw==
X-Gm-Message-State: AOJu0Yz09hdVvtgMqKixofqxHeX3r+l4TkAzVGoYIuSTvITgW2rzDugR
	GkDzDDDr1vlJz58Sg3xgpf+EfetQzoxQUHjb1e7lUSJ6k6l8WReAh6JshS7PvVE=
X-Google-Smtp-Source: AGHT+IHVfiIeAXikc9Ks7N3k/GJ46m7UIH56BHraaOQrJfI3Qn0+cQH3BrQvR/CW4f5cmuQuvMQYqg==
X-Received: by 2002:a2e:a716:0:b0:2d4:727c:94bf with SMTP id s22-20020a2ea716000000b002d4727c94bfmr1206970lje.31.1710425463910;
        Thu, 14 Mar 2024 07:11:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id c19-20020aa7d613000000b005686037bc12sm749129edr.29.2024.03.14.07.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:11:03 -0700 (PDT)
Message-ID: <da48838c-5043-4fff-99aa-2f75f0755609@tuxon.dev>
Date: Thu, 14 Mar 2024 16:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Execute atomically the interrupt
 configuration
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240307112452.74220-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWwbfem71Q9FE40jqHM2pXWJW9u+w-+NKy3OffFkzu5SQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWwbfem71Q9FE40jqHM2pXWJW9u+w-+NKy3OffFkzu5SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 14.03.2024 15:21, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> Thanks for your patch!
> 
> On Thu, Mar 7, 2024 at 12:25 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Lockdep detects a possible deadlock as listed below. This is because it
>> detects the IA55 interrupt controller .irq_eoi() API is called from
>> interrupt context while configuration-specific API (e.g., .irq_enable())
>> could be called from process context on resume path (by calling
>> rzg2l_gpio_irq_restore()). To avoid this, protect the call of
>> rzg2l_gpio_irq_enable() with spin_lock_irqsave()/spin_unlock_irqrestore().
>> With this the same approach that is available in __setup_irq() is mimicked
>> to pinctrl IRQ resume function.
> 
> You mean __setup_irq() in kernel/irq/manage.c?

Yes!

> That one uses the raw spinlock methods?

Yes! Would you prefer to have raw spinlock here, too?

Thank you,
Claudiu Beznea

> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -2063,8 +2063,17 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>>                         continue;
>>                 }
>>
>> -               if (!irqd_irq_disabled(data))
>> +               if (!irqd_irq_disabled(data)) {
>> +                       unsigned long flags;
>> +
>> +                       /*
>> +                        * This has to be atomically executed to protect against a concurrent
>> +                        * interrupt.
>> +                        */
>> +                       spin_lock_irqsave(&pctrl->lock, flags);
>>                         rzg2l_gpio_irq_enable(data);
>> +                       spin_unlock_irqrestore(&pctrl->lock, flags);
>> +               }
>>         }
>>  }
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

