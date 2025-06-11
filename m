Return-Path: <linux-gpio+bounces-21415-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E8AD6006
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 22:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726E6189CD99
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 20:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F212BD5A7;
	Wed, 11 Jun 2025 20:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ehjIFapJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568B523C8A4
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 20:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749673616; cv=none; b=atMV8PWTmzYKmQMOBoAIzq16lByYrKreYKp3/PnCXJ2LNA8ESt7KnMqZKRFxAwnLIJHTiOP40w6cRCKUaejzi4NbsKCRE3VotCmUFG447KCASqrePWgApzSfajEOQ0V4JArSRwj2qad3pPJ+jwTh24hlkbn3kL4FFctYlnD1Cbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749673616; c=relaxed/simple;
	bh=4Nu0j98D6h/l9/aD/BI7DaWZwlDoKTZw120WkJ4+etI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzdpECSLcNPW6uKA2zapq4PleTyI4D1YhC4/9bBFKKKqApGGVjcyNZjLAZLn7q0mz0Mkzxwj+wwLHx+VMm8SZWzQM3IAxuPPTBG2xqDYc2lU8TfVGEJCBJxcEllVm8SsOnB81uqxfRybOIE1W0LSdm49yOW5koU7qfC5RCbSROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ehjIFapJ; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-735a9e65471so156165a34.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 13:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749673613; x=1750278413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clQc+ALpEbRfKWwmdYpg7fRgJck1oxl3hljPINdz/zY=;
        b=ehjIFapJ/TrzlhYOp+hzujH6+IJIwVdx/w/dSRLa1CAgiTHgNWHYKvQtb14YhkZ9MS
         JXhc+0AYGZ6M6QDw3ETTy9JC2cbVHtRlE/cUw2p7/Z5l0pK/4x/R8ai6BmbxPVa4gW5v
         AoKRaNjgtaStufNvQdksSu2mNqOC6KDWMK9jZPNgGK+QdNMgwC6wZmXpeI4OjJv5jr0z
         3AkR47vSa+ItP/oS9VEOQmncp+3ZY/FJvafCEuxkyBUnUtHB2qTWkD3ydNLmcO4j2lAR
         vVyBU0lJj7lJOjFQ4NNvuEOr8wKRCI1G5q3iUM9Vj9R9e1o1eYxKCvg5IfTpiCnVMIoi
         APcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749673613; x=1750278413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clQc+ALpEbRfKWwmdYpg7fRgJck1oxl3hljPINdz/zY=;
        b=CB0qV0Q46YyFO6h17ybeImnvkg0rTGqpmz39YBEOuAQAYcOtAx0Vu5M3zNn7k1HvW9
         Suq/2JkBOLSR6CxmfO1tDnO9zUw743FNv6LJ6ag8349/P0KsnQjsj9VidxcHNBV4Nzxa
         y6sDIFKVnpuCRc/kTSjs0JfBoxr8HVNzKlQcIlOGcvIZOUB0kKrb1sActAvDz2cd1myQ
         P9+Gq3WaSpjrrFv66xbckSVUrVwQb6xn1L0FBDcKiek0xAj48fx8IB+a6AKhN8078N1Q
         r+5WnPYScp3KP5XOUnISPC9SbejU82iWxcUbLAGSEH/Qriup01e5xY/C8FEuwEgZszde
         Bpag==
X-Forwarded-Encrypted: i=1; AJvYcCXnRkxxmKfoJzUA5HhXu1OKxnabwOd1wqNFYwmIFyTdSRpjkx+nn0JDyP1mc82h1YKKVsyQH8giUDsO@vger.kernel.org
X-Gm-Message-State: AOJu0YxknhAfSvTrrGRCi7n1hG3QVYEKqPz5cMaxu2zjtlrieKk99Q73
	cBPqfnhO8Q0eUzZXZOQ3FK4wW0zuNmSOR4+QApaQAclmt25JPzQL+NLLHYdPQHLCOHI=
X-Gm-Gg: ASbGncuk/5TQVei2ifqiwJI2fMj2F8DKyvd6KsOQIWz66XdTSvS2DzcD14DYQP5l2t/
	v5xViWdXCA43stSDwQ5sxJaoJNMFbxdz0y/P45DYHfGOTtALnbKDmzfQydhwGR7lOUBPF8Ply70
	1P1CdI7AkhyjSdVmleBZs3mX4ha9j9HXoChLHqGiuelU09gI7qSN39N7rEx4U642mUVT+6F9I5J
	sfZZ3RVJYkrt7hJuYIT5ktJsdKFoyLIq+9S4BLWIHGTStMU4/zOpMtdvCj0g50xdXSvmF1f2S/n
	uKSGZ66IT3y8VW4ZEjpkkHfjZjjRpfrs9NeOk8PCgtrVcRZ3EVhgDrNMO91OGwMwdlggchqoxmI
	KvUUV1MEvUpYcOKWLIos5ee53Hu/oyVLhIGnvkOg=
X-Google-Smtp-Source: AGHT+IHVTR6x7Iywr4DoILca74HC62mQNiOYdv89GViJJzcv39NMYjFI9UxLuEQSNiTRmXfbxbG8uQ==
X-Received: by 2002:a05:6870:3644:b0:2c2:4090:9e8 with SMTP id 586e51a60fabf-2ea96e8b67cmr2383236fac.22.1749673613362;
        Wed, 11 Jun 2025 13:26:53 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab8df2448sm1925fac.23.2025.06.11.13.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 13:26:51 -0700 (PDT)
Message-ID: <b4e3260d-ecf9-4a51-85c1-889d7741d287@baylibre.com>
Date: Wed, 11 Jun 2025 15:26:50 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] bus: ts-nbus: use bitmap_set_value8()
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com>
 <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250611-gpio-set-array-helper-v4-3-fb86a9b499ab@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/25 3:18 PM, David Lechner wrote:
> Use bitmap_set_value8() instead of accessing the bitmap directly.
> 
> Accessing the bitmap directly is not considered good practice. We now
> have a helper function that can be used instead, so let's use it.
> 
> The bitmap has to be zero-initialized now to avoid a compiler warning
> since bitmap_set_value8() does read/modify/write rather than just the
> write that this is replacing.
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> v4 changes:
> - Fix typo s/get/set/ in commit message
> - Zero-initialize the bitmap to avoid compiler warning
> ---
>  drivers/bus/ts-nbus.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
> index b4c9308caf0647a3261071d9527fffce77784af2..17540034e64a4e591ea61b0b4eef86a2081b02f5 100644
> --- a/drivers/bus/ts-nbus.c
> +++ b/drivers/bus/ts-nbus.c
> @@ -10,6 +10,7 @@
>   * TS-4600 SoM.
>   */
>  
> +#include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
> @@ -105,9 +106,9 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
>   */
>  static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
>  {
> -	DECLARE_BITMAP(values, 8);
> +	DECLARE_BITMAP(values, 8) = { };
>  
> -	values[0] = 0;
> +	bitmap_set_value8(values, byte, 0);

I got distracted by an appointment and forgot to compile test before
sending. :-(

byte is undefined here. Will send v5 soon.

>  
>  	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
>  	gpiod_set_value_cansleep(ts_nbus->csn, 0);
> @@ -149,9 +150,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
>   */
>  static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
>  {
> -	DECLARE_BITMAP(values, 8);
> +	DECLARE_BITMAP(values, 8) = { };
>  
> -	values[0] = byte;
> +	bitmap_set_value8(values, byte, 8);
>  
>  	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
>  }
> 


