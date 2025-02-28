Return-Path: <linux-gpio+bounces-16802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD71A49807
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 12:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 934DF3A771A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 11:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C996260A4B;
	Fri, 28 Feb 2025 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLuL/WIl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FDD26039D;
	Fri, 28 Feb 2025 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740740537; cv=none; b=AadR+k0RjRBnHHnWMzTLZgM9RecPWzw5s4QPlU0q5MEFXjg6HAX9o43ASkPxLty18fyiLdRG/khOaCx9FlUPeBDMrv7BNi1TjpynSO1bi9Q74EPkJjCXNoylox2LZ0AfPC1N9xqNNrltkWFs2E63QnmuaY7PUjEElvwIqnLTjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740740537; c=relaxed/simple;
	bh=GKbfTVVBzFS05bQYVRz8cUh9rUzCJxDRjO1p1JsKzLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uT1l89pmhdS7YXiiUZInFv0Hc/eExBG/UWqVeGHpjbYUkN8yaQxuo5R5NHH2K5jyozKVlVv+rB2VR+Oo1OwaQn61ry7RPoCxuQRR+SkVYFcA33j0LiYz2qb7hgRtibVNLOlp4J+bCR5EaHxbdYILn/42OpnLkqt7LiuQQ9INhio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLuL/WIl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30b83290b7bso22409541fa.1;
        Fri, 28 Feb 2025 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740740533; x=1741345333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLRv3eG3zdusORbtebi07X/GcqJtVtkbojLCzySdZrc=;
        b=gLuL/WIlh9Xjb68IlrsyXelmTnW5Fo9PzAQLlgrqPFh7bnxpSpWIn3Q7ZfalsGKt+4
         HTB7sA5msu6stK8twjZL/7rZJFPwkHgg3fyWBX+fP8xKRblQz/Fg3Z0vtvd1vo/2e+3C
         YyHcLks/Ebsx3C+Ash85pagGdKenHQLDCvVHIg4S1OKBly6yWh2QWWp51cW0hlEbkEBf
         LATk9InaYYgnXWonbuxOJodIOSgnzLcwq6kbbNys0STBfMRV9GbI23FQUufYdsds+Eiv
         avNjZ6FLhhfJ+PSCOSXXq+jKyf5F/LYZE71GnT+i4Ca5uiN5B1ZX14NXbQP2zduJgJ+l
         PGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740740533; x=1741345333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLRv3eG3zdusORbtebi07X/GcqJtVtkbojLCzySdZrc=;
        b=ZROQozNd9Opd2sYBLPrM3cRKIlzzuJQK57ve673sl3PP613T/KkhGPNhCSNZBWdxZo
         SwUJFOp8I39ofFO4aHGPQLwYaCSTkzxR9BWH/97ienrEkEvz7xj/OF1xX2cxRpoafUnP
         EFHefp0f1b1YcNlWE6ka8gAw7pJhSdNt0C44OPFf/HDhhXKQmNcV2ynyJ6uvB8abp6fu
         WiB5ccYooXJk7SKZ+8pqHgkLb9jrTPx+5UGSEuhkqk8j3nFGtUtz2gjiKTu7rECtb3++
         DbLUwlQMt/R2P6ooCcXjXsRu8pDDpuIZJ6IA/C1Pc14soSl7hB+YCth83NZXRlAGMCyE
         uXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZRIusoMNgY5iBTC5zKa/n/7vh97Ipv32CXnEL16LmMA7oTHRooDt2eJgtPOZ/fbXZRL+ydSExKB/z@vger.kernel.org, AJvYcCVKw4880cTn+INLfnYUifEkdK5xwViV5pBAEF1uIDPzOPJldAIXZRVBAm+J/bOvWtDMeYjcWWUQYUMNk0Dm@vger.kernel.org
X-Gm-Message-State: AOJu0YyYpcc57dukYuyr6V8PJ1JIeJeHZcMPjLFwiYIcJRGmA07HR8T0
	OSI4WguIh2m3lBHYU8SiGlVfVUuT85XpTBzV4nNHkbotMMniQshA
X-Gm-Gg: ASbGnctK+rIwQrLaB9syii8Ve6vZmZwtoElNgUQoun5OcZ5vvxdWEDku/tsSsfSNysk
	4DwSSCGAdSzklLoGx/51doL6c2XvkNkzCm3o1S06NmJSCfvbWGNMgXGmQzQYKNYCI64wJoOatN7
	clFcU3qG11xlLPpPH9fNR7Q74L6ZrWVhgZhLtgYEpypr6+8l8ypWhZlNv7b+aAHwzfnVbc5L5lZ
	NfjE7/MLI1fFwzDNEyhD+fXS+ZVraPdfntQse8C5qgC8sKqdSpIqdxnIAqO0GY73xwZgKJL63IA
	/8IBfL2SNnvGuCCfQ0VedXwNM47CyDVDquR1tsEsEogw9+fFp3Na8MkwQWBF8uM1k05PYSfYUuT
	wcwBqPi8=
X-Google-Smtp-Source: AGHT+IFH+FPUG+e6rr/M/QAjKf9NADr9X83JGVNVPFvJDBZrfa49fctGrXZj1+DOchP+ubpHxQWhwg==
X-Received: by 2002:a05:6512:683:b0:545:b28:2f94 with SMTP id 2adb3069b0e04-5494c329096mr1098906e87.25.1740740532940;
        Fri, 28 Feb 2025 03:02:12 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549570fc8fbsm42417e87.80.2025.02.28.03.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 03:02:11 -0800 (PST)
Message-ID: <f9fdc656-27c8-4243-9a54-3add4d4722c8@gmail.com>
Date: Fri, 28 Feb 2025 13:02:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: Document the 'valid_mask' being internal
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <Z71qphikHPGB0Yuv@mva-rohm>
 <CACRpkdYOGeDaDUuQQUGwvFNNk7ZuFjkXSMPXL3BJ=4jGEGPkoQ@mail.gmail.com>
 <ce0d802d-6bad-4028-bb57-18bddba5632d@gmail.com>
 <CACRpkdZtWLGAn0K+xENY+RF6CsWPn0m7R--W9EaH+xTKazALFg@mail.gmail.com>
 <8979f8d4-8768-40b0-a3a7-6638ddb626cd@gmail.com>
 <CACRpkdasQZ26cEv7CCSu75MJH=Pn8a45XQvZmNt4MB=hzTSa6A@mail.gmail.com>
 <CAMuHMdVLqS0=OXBMPAct9bkNWcRHTEN49v0uUiZdK8M-hmRKxw@mail.gmail.com>
 <TY3PR01MB11346EC54C8672C4D28F931F686CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <TY3PR01MB11346EC54C8672C4D28F931F686CC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi dee Ho peeps (Biju, Geert, Linus and all)

On 28/02/2025 12:28, Biju Das wrote:
> Hi Geert,
> 
>> -----Original Message-----
>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>> On Fri, 28 Feb 2025 at 09:07, Linus Walleij <linus.walleij@linaro.org> wrote:
>>> On Wed, Feb 26, 2025 at 12:42 PM Matti Vaittinen
>>> <mazziesaccount@gmail.com> wrote:
>>>> On 26/02/2025 12:18, Linus Walleij wrote:


> I agree, when the code is mainlined at that time set_multiple() has some draw backs and hence
> the check is added to take care of GPIO holes.

If I don't read it wrong, rcar GPIO supports some input enabling "en 
masse" during the probe. It seems to me the gpio_rcar_enable_inputs() 
does also need the valid GPIOs information - I suppose some of the GPIOs 
may have been masked in the device-tree, and those shouldn't be enabled.

It feels counter productive to hide the valid_mask - and do some 
device-tree parsing in the driver(s) which may need it.

I suppose we can still hide the valid_mask in struct gpio_device as 
suggested - but then we should probably create a getter for it in the 
gpiolib.

Or does someone see a way around needing the valid_mask in the 
gpio_rcar_enable_inputs() ?

Have a nice weekend!

Yours,
	-- Matti


