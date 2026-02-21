Return-Path: <linux-gpio+bounces-31989-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P+NIHXpmWlnXQMAu9opvQ
	(envelope-from <linux-gpio+bounces-31989-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:20:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4716D5AE
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 18:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A764307F075
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Feb 2026 17:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0113A25524C;
	Sat, 21 Feb 2026 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="djUMbE/T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F302B9460
	for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771694447; cv=none; b=Au2rZZC6tZjIsgu0Xo9CfEUNeeEXlQdity5EewO3PNpb15kyOpc5hwxW3basSOmCW5rErqjbMFoAJZZRZ7fK1fgyLaifsOCU6a8E6hD2MWtqjF2SkDKM+TqRwyelJLi/oCxSPgFf3zZmcXYKzc00lrZRCQnjnD4KAek2frMaGOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771694447; c=relaxed/simple;
	bh=XR1dfhSVli1Pid5SiGZLLVjDw59pUdaRkrY0seSKhbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fB7ZXPDXISb/6fCWAqtVRH12MNuiw+9EgEyuZJzBYSXTTXrgAbpsBnLa/FO2P8Y3XY37V2zsx5qdN96xjgC5UnB4xS3648JQ+QV9v3ozwaIQEeEcVtI/i9AGSxYyFLxbl8iYFI6NCcsGQh0B1u1zuPD0LMlwJ036W7qfQp1aXpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=djUMbE/T; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-463ba60966aso946744b6e.1
        for <linux-gpio@vger.kernel.org>; Sat, 21 Feb 2026 09:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771694445; x=1772299245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1EwBHrT2F5QUtAJqsFuE4k23yzqTehZiQCEqa4Nn1M=;
        b=djUMbE/TVh4H9VWSalEa3NJUaGoKYJdYa1AE2mH+P01K5wy6Kj2Xx5bsQSOr5vorY1
         /UYdvezmio1+o4D0ye66j4fsNlvcpNlBVlhdPL6jsc5WPKV40jjdsHprkvWF1Ma8JH5B
         xmeRqjvXlF3nsTiUCk0tWaBhj2lsVi1OR+TYOtozGDkKjkoxt53rkwEJhPy1dNP9pEta
         /iHQj71HfWot2dyiDzp1JOQMdKDrHRPrZkqZ4R1xy5dkB9t6R9Km57gSog2rGWTRP5pN
         nj8qXUFXCPmrJU5kjQkdWQTz3ORKfjSbQrR0eDPQ7HplH318mXnSUp/l2J1BTEq9zDRM
         6bDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771694445; x=1772299245;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1EwBHrT2F5QUtAJqsFuE4k23yzqTehZiQCEqa4Nn1M=;
        b=RZnEAHifbXjr9A1tqGL+SjfWv01/4BEczT2fUzCy3xTb5dnBj/l3DHF85q4wwE5Vjk
         MkfTvL2Q22S6rh4MPIkdxV9QLNo5L2PG+mBUscVanck/joBwadcMnimDrrA1Qf0hMsEE
         NyblLBHKemOEgPigRUC4CaT7Ll4O2piTgt/RNZshtkCrX7i2166CsNLoGD2O9g3jgNZM
         g59TWU6v0tv4xPRsKpTHlTwKVipiiSyiiWGD6nqRgR/uoyR/epUeQppSH9D4dq20JHmO
         j5JEs1rPTDUtUyxud507v6L/KAjrB0EZ2D63L4ZK4xxcCvxfxsAykS/ABZESykeACQD6
         Uzuw==
X-Forwarded-Encrypted: i=1; AJvYcCVMcymozcDOmh+DkzlNdkluGoTca27TTks69r/Kbjsd3c9zEZssLbqRYYcghN8bMogHOH6bOwTT4ZSM@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPu4C+it1ww3CWOD6mfJA8FLXIJjyqFqgglrsfX81dSbrOb9y
	1aSdm3zf+rfplqQraVZfg7RTO05cYoKlKNDSUaPRHuwRQvf17+JUNkGcOxkuUgZ0XF4=
X-Gm-Gg: AZuq6aLBO46qp4Txm3F20RrSYggNizCYOP0IqeFbbS20WK83Z9shPoxJ1OlvXQURbrU
	/CYskpfRZeuMtGGOMs66uBsRxxCDaB9bGAO5sPFnIlKcyIY7GBeIWRtJ3aLoLPZdFJ0iv1X1mCn
	HaQFx5yFbpSZfNLKWAeQ7F7j7E3CuuVkHPlWLZN6DVFI1lmliWx/QnXynXrdGDENvhom2gMivcg
	BQlz/0WvQT7yy5CSCkCwLWubqlJLLJV4fmKrLEelZ5wyWS0qFzv6o0C0GltGZuXzlHX5/g4dsQV
	zazoQe60IhedOV71tusIGE1JXeWUhb+3m8KBPCG6PhGOrS4MOVZr1rWnDorWBKB4gaiHKVH5cu8
	2h70vKg/unk3VGoLZNKpmT2G1If2cvpIDSbhy3xJs9c6KcvtG8IDgwEn60D3CBnUTCMXtAcHgoX
	AwEMJtNVSHWUnEBl5OXfzuyAMocqcHzQ71O/m5/CXO83OtLGT9cjTPJ2Bw2eFSRmo7pg65Sg==
X-Received: by 2002:a05:6808:6507:b0:45e:a749:81ed with SMTP id 5614622812f47-4644619a0fdmr1930872b6e.25.1771694444784;
        Sat, 21 Feb 2026 09:20:44 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:611:96af:f385:64bf? ([2600:8803:e7e4:500:611:96af:f385:64bf])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a17aea2sm1847935b6e.12.2026.02.21.09.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 09:20:43 -0800 (PST)
Message-ID: <b36307f9-c4b6-4242-9cf1-838799a926ea@baylibre.com>
Date: Sat, 21 Feb 2026 11:20:42 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] iio: adc: ti-ads7950: switch to using guard()
 notation
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-4-dmitry.torokhov@gmail.com>
 <aZbBGomQi0l84An_@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aZbBGomQi0l84An_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31989-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[intel.com,gmail.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 94E4716D5AE
X-Rspamd-Action: no action

On 2/19/26 1:51 AM, Andy Shevchenko wrote:
> On Wed, Feb 18, 2026 at 06:29:27PM -0800, Dmitry Torokhov wrote:
>> guard() notation allows early returns when encountering errors, making
> 
> guard()()
> 
> // strictly speaking
> 
>> control flow more obvious. Use it.
> 
> I like the change, but...
> 
>> Also variables that now only hold error codes (or 0) are renamed to
>> "error" to make their purpose clearer.

Normally I would not give my opinion on this, but since I wrote the driver
originally, I will say please don't rename. I prefer to always use "ret".

> 
> ...this does not belong to the patch. If you wish to rename, better doing
> it separately. This, in particular, adds undesired churn in the change making
> it unclear.
> 



