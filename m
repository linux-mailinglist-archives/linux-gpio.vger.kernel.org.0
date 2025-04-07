Return-Path: <linux-gpio+bounces-18374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFFCA7E3EE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 17:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9C1F16F34C
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D941A1FDA62;
	Mon,  7 Apr 2025 15:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXdQ+RsL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91901FC7D1;
	Mon,  7 Apr 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038680; cv=none; b=Xhk5W3LNY3FT5V/Y71kOVrzJ9kgbmQXRLsuIj5AlL8aQKGAWuRpN2JBaa6y/VB1t1zJg0aliUKa8XH5eVsGtL7ztrObDe0mUMMaK5hHBXiGvN4EUaePVjMTnxzmPrg4v3Tvt6wf83/JGyf1WBp2ioBMYNrdlHcOlOS+lg74u7fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038680; c=relaxed/simple;
	bh=atOz65VaErisH3J5XXHhaVi19GkeVMbRupRNj5Z1mmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXJk96z3LCfwHL/xgS0ZWthg41xPqOXHiCMZTX9UU/8Y9pFIlstzO0x08PIkFIa0/rEp1sYKZStWsF7A4scZklw6UshW5k/bdQ1PcHZgWq4m2PjnR6FLhH96iF0oFyH+Q9Kax6qTcw+bLZalVkSFxaQzkXvj7K2GuT+7gtAlV0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXdQ+RsL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so703330866b.0;
        Mon, 07 Apr 2025 08:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744038676; x=1744643476; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPKVLxrmgP1kLAt/KTla7WBRyna1u1Y2t95TcZMV9/s=;
        b=PXdQ+RsL42KeoiCwM7WLfhOz4UiXNswhWV0hSuC1dqQSNsmxf6XCOnxflRMxDHy+Mu
         8J40YY2ocOMrJ28O8GyA4fzfgW69nUnBd+ktU8m7h7zqpvlwQ30g6XgHcAhcn+G0DhW4
         d54gEdh6AHamSnN/VwAdPK6FYAzScgSnuIJc2OQMWfNStqM1BtT5tXo4qxKNlh2KdWu7
         Uwj7dd8PgA1pcPnUJITX/t/KnRmAou0iLm1ns66BWbCa202pUz8FUelpPLfi4/CGe3Yk
         LBLYJJJLyKcN+aWTKC/IbLcNutufN5OydMQiG509SgQQDk5xSgWVxRVeXrXOrWt4NNqL
         sBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038676; x=1744643476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPKVLxrmgP1kLAt/KTla7WBRyna1u1Y2t95TcZMV9/s=;
        b=hfLqxELm4AkKbwKfYDX1BvkO8MpobQKqQx6chILkPGMmNaMml3Nw2A2w5PXyWfZVFV
         8M/9phKRl6JIULJco9seB+4TfayC8VJS6zGvA3O/rqfWqlixgUA8Hd6qqOc7P7nFKVOT
         UHPL5LrIAvkMenZrj7sWfzs/uUI7fnlaLTUNx43kPX6FT6cgV4jBUIoE6AcsHwqBmbAH
         YsL892QApM1178rZPNGLbHiBmK6IhQlB5fFp7QlNEmluYgyUCbCwQ49re3yYhIKh4VZO
         BoYm3Rnw0bbFYb/QqwsVeP8HxCPlemguTubUcvLSXsnwGscBRZukFjIZMud7EkwC/0Wn
         pGCg==
X-Forwarded-Encrypted: i=1; AJvYcCVZtBDefWP+CT3+nHuZc3/gsKjcyHaTB27RroOenZNVKHROznmeV0sRsgjn1a7tVhU8AwJsB+0HbSbz@vger.kernel.org, AJvYcCWFMfxtEXIhOvzNNL2HcwDVz3RDS/CSM7cKHystuGmr2brKVwbVVxHsOz5N6LpnATv9IqzJssKp@vger.kernel.org, AJvYcCXJqTvhS4iN1SlmaE6t1mVCj9TfDJ1O7duy9+ITB0A3F7wjih6rcZ9Vvy7V2+xVognCygGwXk2VCL+Ez6e1@vger.kernel.org
X-Gm-Message-State: AOJu0YzYcN74DSqTT3izAHRgmpfyi+C17Cx2N1hGV2vT1IZFcSKpBRK7
	a3fHjwvXSmwnYcL0Yxvffav5neRqz97r698idAxMe2VfP97RkySN
X-Gm-Gg: ASbGncvk22PFrX8VET0p4c1cQZhuij+Sct5Gm0ivthzry6yj3cY9cJYOaOS+NybQHwj
	Wjd4ya7Gda0960h3GQ48YNAmmPSKPTPHIek+/uaQzRnhmVFcc7G+T+anQf0yq1XIJNSD2xtutTD
	mlHQyD3bcu6ERM9HtSMRSwUdRoNbuJUOX8W9cmYI10FQUDrKL1VHiDNzVu7uygaD1GMfI3dm0z1
	hcI0LVn+knbHCKHVweOLaDJ8dJ4dQ1l+OiY1AbhpZwCSLdlzyWmHQes0seeIzo4kNdXbRaRQr0t
	X9wYeCUDHjPqE+xgprqYyZiRUC9Yd1/JlMpMRoBQ8dUDO0A++v0dBz8w4u6sVTCxaMsmX0ZDLiu
	twKcdc0rHYuemDPN9/fULjQ==
X-Google-Smtp-Source: AGHT+IET4HXyrwU13Xc3O+Aq3s6wZlJ6wf/2HEKDuJEKTqVCzohJNdvokOuZ1PSon3sqjKjmWvIx+g==
X-Received: by 2002:a17:906:e208:b0:ac7:ee99:2eb2 with SMTP id a640c23a62f3a-ac7ee993526mr709458866b.16.1744038675760;
        Mon, 07 Apr 2025 08:11:15 -0700 (PDT)
Received: from ?IPV6:2001:b07:aac:705d:5ff7:9a9f:a241:b899? ([2001:b07:aac:705d:5ff7:9a9f:a241:b899])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f660sm749255966b.89.2025.04.07.08.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 08:11:15 -0700 (PDT)
Message-ID: <02cab60d-9748-4227-a4aa-33373ea0be38@gmail.com>
Date: Mon, 7 Apr 2025 17:11:14 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] gpio: pca953x: fix IRQ storm on system wake up
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Francesco Dolcini <francesco@dolcini.it>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 stable@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20250326173838.4617-1-francesco@dolcini.it>
 <174368202234.27533.1000100252310062471.b4-ty@linaro.org>
 <Z-6TGnGUEd4JkANQ@black.fi.intel.com>
 <CAMRc=Me15MyNJiU9E-E2R9yHZ4XaS=zAuETvzKFh8=K0B4rKPw@mail.gmail.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <CAMRc=Me15MyNJiU9E-E2R9yHZ4XaS=zAuETvzKFh8=K0B4rKPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 15:56, Bartosz Golaszewski wrote:
> On Thu, Apr 3, 2025 at 3:54 PM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>>
>> +Cc: Geert
>>
>> On Thu, Apr 03, 2025 at 02:07:05PM +0200, Bartosz Golaszewski wrote:
>>> On Wed, 26 Mar 2025 18:38:38 +0100, Francesco Dolcini wrote:
>>
>>>> If an input changes state during wake-up and is used as an interrupt
>>>> source, the IRQ handler reads the volatile input register to clear the
>>>> interrupt mask and deassert the IRQ line. However, the IRQ handler is
>>>> triggered before access to the register is granted, causing the read
>>>> operation to fail.
>>>>
>>>> As a result, the IRQ handler enters a loop, repeatedly printing the
>>>> "failed reading register" message, until `pca953x_resume` is eventually
>>>> called, which restores the driver context and enables access to
>>>> registers.
>>
>> [...]
>>
>>> Applied, thanks!
>>
>> Won't this regress as it happens the last time [1]?
>>
>> [1]: https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com/
>>
> 
> Ah, good catch. I'm wondering what the right fix here is but don't
> really have any ideas at the moment. Any hints are appreciated.
> 
> For now, I'm dropping it.
> 
> Bart

I’ve found another possible solution: disable the PCA953x IRQ in
pca953x_suspend() and re-enable it in pca953x_resume().
This would prevent the ISR from being triggered while the regmap is in
cache-only mode.
The wake-up capability is preserved, since an IRQ can still wake the system
even when disabled with disable_irq(), as long as it has wake enabled.

This should avoid introducing regressions and still handle Geert’s use case
properly.

Andy, Bart, Geert - what do you think?

