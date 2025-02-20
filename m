Return-Path: <linux-gpio+bounces-16335-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC7DA3E225
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 18:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54E6217A62A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 17:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC32212D69;
	Thu, 20 Feb 2025 17:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0dHwAlgy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6E21D5AB8
	for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071811; cv=none; b=b4/yQeU8xSQPp1ccA9iIEZ1YVUx6pg5KOr169XLwZlsm2nH4QKm2eJ9snwS72J8pT3kblu9hEc9RpPlCYMPns7qIUw65BqabJX+m5cXks56N4aiV6axd/3Na57XtfaPzlkNi7viej5vmJ3O5Y9w6AA3C+kB0DpxWpntiWTnIfi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071811; c=relaxed/simple;
	bh=244XeKEKX+5A8ehxHdeeLmwJwhJA1rgjh3BsIfR/8tM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVn80J7Z0QHDrtc6eGiwZjxK4DMKNfhxza9TOHTj9vCLM52qnYtCr7j9DtmVqIDfS17Xng19vFy4EuA9bxqbEzYhot4TLyJKLg+8/4R9G0dm++w8NuvPH89wPo8xwJTjvFMF/0mqJCuvxjWDllRpreSdAR+j0cwY0NuQpDzaj78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0dHwAlgy; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3f4890596so657442b6e.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2025 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740071808; x=1740676608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcApaWVKSxQSIvLEEHhnSoFMNHumzt0nl4dOj28dnl0=;
        b=0dHwAlgykdXsqX1wYLYwXt2Ts6SA+KR2AVFl1WMrJgrYcqwb03g2FGq+gIlg79FlGl
         HxGhNcYVONWq8D+2KmxIXUuurbEKtF5vSXt6rNUzHDenwAPnne5yVzPmYKFhRUestJUt
         lnTuxe3XS4a+qI4UZdD/MqPZ/iSKemhkEga8k3sBjRsqEnrXSginVeTCQyBWYKjIrR1w
         9m01GH1SD5LP5gObtGkv2JLIRP8g7Rttsrfda6eFuGk8j720J9T5rKunXb0SrEsRTrB5
         PrpiTOkYk14eJuJrhMuJlOrg/UI8dDwO3e6bepwWbwqQZ92UqXDPipJ2wzSQTSeT1onq
         5YJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071808; x=1740676608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QcApaWVKSxQSIvLEEHhnSoFMNHumzt0nl4dOj28dnl0=;
        b=kmRGv+AsdqexVvnHovtA/v2a6JNb8iHfFroO80319OHZJnUEhOB5k6Wd14MuJzfeNl
         mZ46U86amhouTTq6YcDDijQamoYnmRCpzxfW92nPVI489oOR05RvJ2qpQVR1VffZfDdS
         +y7EOu5HzPSo35GN4AQMxXPT913WD8CwZPLAi3Kx8C/+eTi+sI9gp+ZygFSNUyxRhJri
         I4974j9gsppWmW8fn9xC8gpIgKgXYvFwiygXmFvdFLcN8ONv+6KvUcxPtCKOnxXjb2qc
         u0dqUQeTxvPqWiB5RR+y7guikpoW/Fza+hZodHfiZvqaop4aVPEPnbq6amG07Jybt5Aj
         JwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+HTnz9/vZY07jW9dWILE9L3q4DbqXq4Dz2Kzy9Aq1kR18ilvtXfxabnselGjsgv1Pm6qMejq7w55@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs6dAsoQ/D2eO7itjISFa3Rs4O6aYktoQLH47k7uw4EjGSfCwi
	NaMd1XrhWdQ9BiPGUpJzCtgJ0aUzutkWQJRXiZXRolkZycTwI5TvzisqKLqcAhA=
X-Gm-Gg: ASbGncuGEJTvpZSrRneXf0hiSV/PGCUsGngI+ed5jbNaIhtsAMWIK8ZYFLkbDUqH7k5
	8usUnm+9n9n9APspkVouMG6+hw2aIsMr3yRZtfPVR0LBAT2p8wN0YGVM5O7g/nuXm25L4R9FGXI
	BsZcP6I2HPJ8/JRE2fKPo8+f475IIVCiar7mhwW30o4T3owg94HyslGxKCCyWjLSd0pHM7ePU2y
	7SVXv/JEuyBiLKKf6S957n5nYdsM3iDXhmpP/b8NSdBqdh8xGiHPGT+2PN1EOFh8frSV9RutICC
	KcqZ4BmUg4SD1oPnY9r60+nBovCm7eChEQZBb5fjlNe2v8LxPY9N
X-Google-Smtp-Source: AGHT+IFQ4fpht1GK2L64Lff/K3FzPWt1QsXeXeofzfatOKhBNQXj463x1jUtS3u3WnZ5Fb1+N2LaOQ==
X-Received: by 2002:a05:6808:3996:b0:3f4:205c:d9aa with SMTP id 5614622812f47-3f424701c1dmr163494b6e.21.1740071808115;
        Thu, 20 Feb 2025 09:16:48 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f3da962049sm5144033b6e.21.2025.02.20.09.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 09:16:46 -0800 (PST)
Message-ID: <37dc5907-b04f-4879-8271-68e36a6a2924@baylibre.com>
Date: Thu, 20 Feb 2025 11:16:44 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] bus: ts-nbus: use bitmap_get_value8()
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Simon Horman <horms@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-sound@vger.kernel.org
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
 <20250210-gpio-set-array-helper-v3-5-d6a673674da8@baylibre.com>
 <20250220101742.GR1615191@kernel.org>
 <CAHp75Vch7QKyT8Fbya3u=YrPR8z-2-mbWXjHyOwZ-fqcBjjm0A@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAHp75Vch7QKyT8Fbya3u=YrPR8z-2-mbWXjHyOwZ-fqcBjjm0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/20/25 6:06 AM, Andy Shevchenko wrote:
> On Thu, Feb 20, 2025 at 12:17 PM Simon Horman <horms@kernel.org> wrote:
>> On Mon, Feb 10, 2025 at 04:33:31PM -0600, David Lechner wrote:
> 
> ...
> 
>> But when compiling with GCC 14.2.0 I see warnings that values
>> is used uninitialised - bitmap_set_value8() appears to rely on
>> it being so.
> 
>> In file included from drivers/bus/ts-nbus.c:13:
>> In function ‘bitmap_write’,
>>     inlined from ‘ts_nbus_reset_bus’ at drivers/bus/ts-nbus.c:111:2:
>> ./include/linux/bitmap.h:818:12: error: ‘values’ is used uninitialized [-Werror=uninitialized]
>>   818 |         map[index] &= (fit ? (~(mask << offset)) : ~BITMAP_FIRST_WORD_MASK(start));
>>       |         ~~~^~~~~~~
> 
> Heh, the compiler is dumb. Even if it's not initialised we do not care.
> 
> ...
> 
> Wondering if the bitmap_write() will work better...
> 

It is already using that:

#define bitmap_set_value8(map, value, start)		\
	bitmap_write(map, value, start, BITS_PER_BYTE)

