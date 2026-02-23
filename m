Return-Path: <linux-gpio+bounces-32053-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLS6CuuDnGlwIwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32053-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:44:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E3B17A0CA
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 17:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4DE831DF7A1
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 16:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537E131D399;
	Mon, 23 Feb 2026 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q0gUVq3Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5E131AA9B
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 16:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864533; cv=none; b=iCLcfT4gfL4h798i8UrAv8skgXEkm9TwgGmmS7FDf26lHOemVDVBDx+drMazgMgUn6IVahK7JjTtDuglMLPjPGkAQ3GMdhrp06B4r3dPS9vJ1DQ9cDY410q6PVlf+1p2VrObTgK7KKY5Mpog1nb+t4SRuH7bz7szXoIjDHFtwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864533; c=relaxed/simple;
	bh=RzLJyJMrOZWEvU2orH9rSolHnyyv/uE4hcEajLE45eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTHA1u1ZXNOpMHx8WHeqI1BWShOqd7YfrqYYMewEkcjuCXylvREHnrBuyTvA5ue4ZDE4g/zSH7EQv2jmOay2TGOzS0lkZ6TYoW2c6oCzXUsiVEUYQmG+yLPMHqatx8AlL/ZZ6kZ1/4LQLRxmjQNU2bgA4jMvypvDaXZcNrcAvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q0gUVq3Q; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-662fc35291eso2549603eaf.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 08:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771864530; x=1772469330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qw0PtLgwjYOGFhAD47z9NDAK+061b5LRHPLtDWUE+V8=;
        b=q0gUVq3QK4NK18gn05kVZDfyz+6kJ0+DWcJmpNjcP7HFiZe6TZN/GPIdprujhuZP1x
         hs8GQy13rlKJzb4iNTzl+R2+u8+lGRuXe43hrcquBSWEO6TB+i9GaiZZjeaH/Jy4PcbP
         2KWUs7hH1AUXv0CfjDJlCV0lTPKa2Tlnka//kHQrj2huZ77y96BWkH+aWS4p/r+8VOUT
         80sG4Z5pp/mIgbH0H2iUxQ3z4xZCGVIod4xU+kKfdOr5ud/IslHY6EE27zI/lAXeCItX
         zNNLl5Hoik6fKMWvZ3SMij231hGSVkSxmXWgvbRw7RGGu9cDZBBqZ0ozK/YC1H0R0Q7p
         b5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864530; x=1772469330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qw0PtLgwjYOGFhAD47z9NDAK+061b5LRHPLtDWUE+V8=;
        b=GeHnS1K98fNfidt99nl7J/Ojt7FlwTMR5IcESytRg4xDgGqO9JMTaCcF/DdNwAxvM7
         FOb3uiWo4+qQT6wakAAp9gqXUkqDVPm/Bga+PpO019AV2mv9LNWRng6IGJscMQKrqJ9m
         JB2bcM9+ei7DP6v/nFvxYw4HYxqWB2XuCYBcaQ4g/PDp6WYwTCVLlPaFmS8wcKk0WtTN
         +bufliZs+BnJVSobTbNSFMfHvrfpZeWqYxEK17jVssWONF6SZHoTcqzIVYtKDjyNPtSx
         3lWHLf1LBkMsr3fCXSlh77/5Tu5GwjOFhcAr4fw0U8/N89KWmMEAFJVeWdDlhmGs8RsF
         e5JA==
X-Forwarded-Encrypted: i=1; AJvYcCVOAn/lrV1bqwW2oD6kZsZEnRhwVv+QgO/DZYyV5mYANJxr8vmdaRijIJdvlWFEc49LEfIZkQpwM+AZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwlkyEyFLzYQU583Dc4WErk1zL0QXpUQlvc8oea4f8em3xK8FnE
	z4+XIoZIwUPFFpPB1p+pBz9xZ4wDwlDIr19ymNQ/00i0nFUwWHbbdMpQ+bq6t/+P2Uc=
X-Gm-Gg: AZuq6aJTh5+QbTg4xyzF6hszJy0BGL/wAGjVWZ/dYHdKBpWXO8b/86yI16sUqGUlNLw
	osccQuR0TUtbUD2JmBKzCtAPA0ilZ/NObAaxqemDOgKee00wZjLkoNmuRDm/3R8JgFW54TAx580
	d8tYg8bXVDguOlvCl5bIQ4BL2MsO25Hop6cEfYfSoEf1BAS5i2KUBuPzOuDlVANtYdYT82y8uMz
	hAy5VUDDhnYwbpnaRsjfQnSCpo1dfgSTpWBCdBd0I0Y6R/XQQywSkiZHIPoSzXsuUO5YZoEqRAR
	zYDBcWO5ixQ3uN8hH9DGiEuCIztDeE8skY+5ytiFUm7kiP1sxz+MEH6zfT3F1yp+UJ4zu+olxZc
	ALHy3v615cJgufhI5KtVujB6nqgQD2nuTrKPD4tHqWqOGvAXkOCXHS3Rl9TA7SLc4LZ9xl1ZKuE
	CfQY6fMWepsappoz67QWY9AvjYnXfX
X-Received: by 2002:a05:6820:2912:b0:679:96f:3f11 with SMTP id 006d021491bc7-679c450663emr5290621eaf.64.1771864527664;
        Mon, 23 Feb 2026 08:35:27 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:e37:2309:3937:4469? ([2600:8803:e7e4:500:e37:2309:3937:4469])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cf9a388sm7837314fac.6.2026.02.23.08.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 08:35:26 -0800 (PST)
Message-ID: <b1470903-f703-4408-b009-a4bdbb9ca4cf@baylibre.com>
Date: Mon, 23 Feb 2026 10:35:25 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard()
 notation
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
 <aZbBGomQi0l84An_@smile.fi.intel.com>
 <b36307f9-c4b6-4242-9cf1-838799a926ea@baylibre.com>
 <aZt0IGNW2hddXvRZ@google.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aZt0IGNW2hddXvRZ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32053-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:mid]
X-Rspamd-Queue-Id: 81E3B17A0CA
X-Rspamd-Action: no action

On 2/22/26 3:31 PM, Dmitry Torokhov wrote:
> On Sat, Feb 21, 2026 at 11:20:42AM -0600, David Lechner wrote:
>> On 2/19/26 1:51 AM, Andy Shevchenko wrote:
>>> On Wed, Feb 18, 2026 at 06:29:27PM -0800, Dmitry Torokhov wrote:
>>>> guard() notation allows early returns when encountering errors, making
>>>
>>> guard()()
>>>
>>> // strictly speaking
>>>
>>>> control flow more obvious. Use it.
>>>
>>> I like the change, but...
>>>
>>>> Also variables that now only hold error codes (or 0) are renamed to
>>>> "error" to make their purpose clearer.
>>
>> Normally I would not give my opinion on this, but since I wrote the driver
>> originally, I will say please don't rename. I prefer to always use "ret".
> 
> I hope I can convince you otherwise.

I'm afraid not. "ret" is used > 35k times in IIO and err is used < 3k times
and error < 1k times. So I am really used to seeing only "ret" for errors and
"error" looks very unusual to my eyes because of this.

You mentioned valuing the common pattern in your other reply, so I hope
you can understand that this is what I value more here.

> 
> IMO "ret" or "retval" should be used when the returned value is intended
> to be used during normal operation. For cases where we only expect to
> have an error or 0 for success "error" or "err" is more appropriate.
> This allows you to write
> 
> 	error = do_action(...);
> 	if (error) {
> 		// handle error somehow, typically simply report.
> 	}
> 
> This also helps when reading the code as you know that there is usually
> no reason to care about the specific value in this variable (maybe
> except -EPROBE_DEFER).
> 
> I will push the conversion ret -> error to the very last patch so it can
> easily be dropped if I am unsuccessful in swaying your opinion.
> 
> Thanks.
> 

To give you fair warning, it will still be NAK from me.

