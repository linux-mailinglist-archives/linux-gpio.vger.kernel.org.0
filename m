Return-Path: <linux-gpio+bounces-19922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8FAB33D2
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 11:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05E513A3C37
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 09:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FAC225A64C;
	Mon, 12 May 2025 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOJTGfaZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B9259C9B;
	Mon, 12 May 2025 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042726; cv=none; b=TR0wxEmRyeIwnuHTibGcw63rLuyV5AO+C23VcZUCr0gwECoZYgYMuYaudWaF2DZ1O2JEaPRAR8mYdtInWdzooIhN98tBmNoaGhdt9ZKRLegpMYI3A4uSiHjYbtezG6RQGzlnedkC4Ppyl97fihr6WT4zPg4yc+/UNfLiGv6sq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042726; c=relaxed/simple;
	bh=QrURaYvyMey9j8Ah8nwqiudi8hr/mopsV/q6yQieKoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWmRBdzIcLyg5MPPhl1hHBM4VbDd92ByiXVt5aK9dar4fjlm4RHx9Mm68u/dVFs6kzuD33/hGvLJgmpRRMuPfRlMnSLwRzkRdOXdUy7QyqVU2xmFKRu1cbhEA1UWTqdSe98jiPxXJxufZELUIUngIW6oA0DPKC2Bep+flISSr7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOJTGfaZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbf534f8dbso6485555a12.3;
        Mon, 12 May 2025 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747042722; x=1747647522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVMsGTd0ps1Z/3dVXGvd69ezteSaaUPQdb+zHJAT/xM=;
        b=gOJTGfaZXJqDf2Vz7zjCnr4Iktr33O5n/r625B8gW1mVT1mePKwB2so2sPAQkD/iGb
         Im9KtDAIuM2u16X90m8agf1tjeo6OnxCvSYM/spm0ARmq8C1FJfo71iqGnpvbnL+0+RJ
         RHWSCRWGD36PGL7VOE5wKzeVcprn+et+iokwUDnUHJw8CguBAOQBHEiSDLA/X1ng4SJ/
         3rGjigRzB8Sm1oe3Y7tXkX4pj5nakMGfMJYDLEtVU+XYil0OHJsaQFW6T+OTLUgRXFH8
         /YgjFpUm3sm1PQmD0MbVAXIsbGEeGvdcbjEwJNRDwXJVpXzR6Mtn73gWQUXgUpO3GYmW
         Mzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042722; x=1747647522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVMsGTd0ps1Z/3dVXGvd69ezteSaaUPQdb+zHJAT/xM=;
        b=lp58pNyFtgHLDeSQfugmAgahzvBL8nQAJXbjReO9O5w2OhblP1/OrlMLJO5GbtT1Ni
         SA2vbLDRME+nd9MZv0OMKSkVKSKoZeHRqVCTvBiLd31llnJaQhSsdV+QRFR0kZcO/RZz
         OssubuIBwgbEyx3PHtEYoxmmbe8rR3mTK1nxyCoGInX0Q37rrvRw3CC6wbCboT+nKKUV
         y9GG3t0w9mXHVdz/6R258O/T/vXpHwdbt0OTRD0H6hboUsCZQGo+NA4rabIyUbrxnTDo
         q15mTt02rTHUasQJsrHeyLzjTUEBpUNuLLvGO2Hn7HTDwOtc+UtjWwcCOTYmlpPtRPn4
         LFog==
X-Forwarded-Encrypted: i=1; AJvYcCU477D7HhCrmVYCGQ1ND8plkzlsqzsR1mKakG/MQYBgktIZ1LfzJTZbiCZJu/gToEv79sH9Ay27DMaq@vger.kernel.org, AJvYcCVuoj/GZcGaokBPyH31BDCeaCmgSBJGdT3lugRBY6KISN5NLXUcDV0s5RroAztW799EPIiqsF226aE96CY3@vger.kernel.org, AJvYcCXXtaRA7LTT2Hh4u+gmTF2Fd6cK26Jn14/9vw5kcwF/sU3zODXza5x47GYa3L1KQXK24UQD5PDa@vger.kernel.org
X-Gm-Message-State: AOJu0YwqPwgqkOWMrRJ85SsyKndWfQo/aNhrb4PlsCyNKTbsPtHmCtJs
	/XPw44kWj8TdscXU4yq3hObpVBae+eY4fvinAOgJRl1DmikrbMvJ
X-Gm-Gg: ASbGncsImbHBCA3eKwyS1pbd4PVcvXJeNKdq1l86KYp5KfYAJ0036xG0FSk4J1s+TPR
	fKjuD5Z8cQt8hQLe3Ndp9J99BTD5LofjZ0c7BVWi/aAuI7waoLOEj5hsIS7RkKuUbafnAfi8VFE
	gidi1AKhtejBijbiSA0vKwZnmi2i9a913qPMB324LedTnIMfuGKRv2pjMPF9ffP/TR0jIVWRRV+
	G1xwwLwW/z6nPj1xfi+ve6HRZFsLtUmT+yUSCajLRqPj/1G42gD+hfTx1xpMgDcNtOLVTeLLl/W
	QUy2QRG+zL8CTga672qFbNhs2MIBqLPH++MYG4MIel1OO0oFE7B85YnT3D4QYdbNk76xalSGi+0
	CLlrf6o+z0QuU4hv68xlMtmNY7dLA
X-Google-Smtp-Source: AGHT+IF/0/v0LWUs18exYJZd3FFOlQ4aE9hQv7CNPbrlE3nLUk0iVMefpdJD2woaSobWSuxAqtT4Lw==
X-Received: by 2002:a05:6402:35ca:b0:5f6:c5e3:faab with SMTP id 4fb4d7f45d1cf-5fca0730954mr10348538a12.1.1747042721642;
        Mon, 12 May 2025 02:38:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:aac:705d:a740:b0d5:9c77:3fc3? ([2001:b07:aac:705d:a740:b0d5:9c77:3fc3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fd1950e6dbsm2879742a12.80.2025.05.12.02.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:38:41 -0700 (PDT)
Message-ID: <10caddc8-7dc1-4579-9edb-4514efa540cd@gmail.com>
Date: Mon, 12 May 2025 11:38:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpio: pca953x: fix IRQ storm on system wake up
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
References: <20250509141828.57851-1-francesco@dolcini.it>
 <CAMuHMdXqRpuy8gsz+0a0xTp6VWfMD0=WWdS84jWvF31O9i4MZw@mail.gmail.com>
 <aCG-DZI4fexZGy2H@smile.fi.intel.com>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <aCG-DZI4fexZGy2H@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/05/2025 11:23, Andy Shevchenko wrote:
> On Mon, May 12, 2025 at 11:17:48AM +0200, Geert Uytterhoeven wrote:
>> On Fri, 9 May 2025 at 16:18, Francesco Dolcini <francesco@dolcini.it> wrote:
>>> An irq can be disabled with disable_irq() and still wake the system as
>>> long as the irq has wake enabled, so the wake-up functionality is
>>> preserved.
> 
> ...
> 
>> While this does not cause the regression seen on Salvator-XS with
>> the earlier approach[1], I expect this will break using a GPIO as a
>> wake-up source?
> 
> Good point! Have this code been checked for that kind of scenarios?
> 
>> [1] https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com
> 
Yes, I tested this specific scenario with its GPIOs as wake-up sources, and it
worked as expected. I already included the note in the commit message.

Kind regards,
Emanuele

