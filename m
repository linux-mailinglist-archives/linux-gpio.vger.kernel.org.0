Return-Path: <linux-gpio+bounces-31720-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECYrJj0+k2kg2wEAu9opvQ
	(envelope-from <linux-gpio+bounces-31720-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 16:56:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6144145D53
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 16:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36C4A3007AF6
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 15:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD29B331A46;
	Mon, 16 Feb 2026 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Z/Nx0+Bs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2356A31B812
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 15:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257239; cv=none; b=g4Ijnym0BhHs0oDihrfIR6dNO4wzYkuEH+F+iNjExgr6Um7TXUYJ1TF5EKscXT9EEbSelf4BCEyI0R2DaZclfgc2yytPyz51C93fl3VtZyHv69G6wPGtg8LzQ/MK49ZMzMO9rdXLn9cFYHSxvhiSEl2mR0HpadU9djxTv75DHeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257239; c=relaxed/simple;
	bh=la3xITIUAOvZiO/DrjMvQJOdluQRQ4SVP/WfXBDuGgY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GrmfVaYxecT905O0OfysTiKk92Ta8gnKFSh+LJAz+BGRROTNWCHs9DFd7n6+Q7a9A4vKWIK24XHIUaWffwd0e4Z5tx/bzAFXZlyqdKFxvGIDUYvh3a4kXHNOcPjYcyXvXSMwwQQCow3erPKAmg4wh1OmPBEEhhzN+2DuNDlayGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Z/Nx0+Bs; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d4d8712b40so640031a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 07:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771257236; x=1771862036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/3SW0Eh2u+ceUTFWgIdhBtNIWETMAKknVFe62aogJ8=;
        b=Z/Nx0+BsCMFLDCNZTUjzwHR4GSvnji1wCHbcXoLJOjQD8/Z5ws44wqqU+PIm2vVHQ5
         jHMv6slC4hx6rryRiHv0wnbgdGbSDWhaO8bBqL9RbDef0oxDsgi21agNlaJVEJOTo1R0
         ezRyWr6asypve/qP2/3Dpe3XXY5K0b7a9ZBZnkJCsmctiUTPG/+4j98KTpLtzoZOaAii
         kmx2nVABI2mUwXhn6RbkLCNEUhVH3JDnb/OPr1krsNzw14ShP2I4LwYQVc9B4cZVg4fj
         UCasn6a0IFry5h1h4+RI1zFzzJzmanQWXWTHt29DKvARU6CMuJj8ubCyoycCXcoOxaPg
         6zvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257236; x=1771862036;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/3SW0Eh2u+ceUTFWgIdhBtNIWETMAKknVFe62aogJ8=;
        b=iF1WmXok/DbwAuU1eVCpPTTpfQlc0zcdrJPpVNX5cAByPyYYqe1y9AKbUWeOFMX0RD
         NThyjyjeaEzrPa20+6dhWhfGIZqvRNoVUrHNo+zWG6/6rUN+yVTTZzRSWCy0L150X7h0
         QT5fNm+iI/6L33HOZAwBwuyCK2sJPL1AzJLN56NlCd/yc5E1PYDBEZT9maUdlbjAgf52
         6lagaybAJSaXVXD8SxYJuL0Uhji3b1BrnFei0SgOFhveDIOQ6yadzDug+AS0vLs6GU7+
         9+0mBYNKFwl5uwZNU/0xZVIhO2OUrGkl5tc2gKuSvqoJ7Cpyv//XODSA93f6VqSoNHNI
         RjCQ==
X-Gm-Message-State: AOJu0YyCF+/anr5k4VfW6HvEEGEQvAj8ohAuUkVkt306avQLVPY0lYw+
	m2FY3Pa/XqPsQHrOLRjr4Y/MQPaXCHvrnVSAEoxgbM8WriBOPJ3nuL1O6IlOcnCxglo=
X-Gm-Gg: AZuq6aIU7TAn/Q6nDhHlsvFACNUtHmbK/i/Bnsa40p+S9ZEd964NMVTArR7M2emwGVX
	eCS08EXzwQkybZ7QF0k2DqkeGBZWHAb4FLC9KfksWO/4nptZV/TsoqVamJCHRhKsJfp8iRaTbHL
	AUMgV+xVIZ90SZ/qwpqsO4XnDGW1hRwGAukxNBPe8Fe9Tnut/GBBtRS011YSc/8afVrdN3hBSP8
	mVcVSIqZ+fAyhGgfKBhoTvxSPcZS+Va/BkM2y4lV3DePDuWZdBYbOlABBtcf198+vbRUXoDO2ab
	wIx9DUd4BYSDJLOPQsmFabtzZGQitJ4Xvp7nBK8CC+V1ZrzByVz6h34BIiaH6TbRAHIobMsteSx
	1cCp+xi8ECn4rNSVuTZn3BP4FZgfr1wcSgaufkhzK3Gdp7FgyOt+tPppOtGHZ9WL88+zZTziaWH
	eb+X4aefyoodEmGQvXg8rNEuO5VXTmbzJHfR0h9f6183d4Iryhp/WTIzv0OwnvxH201m5RPIrVZ
	dYW0E0qzDA=
X-Received: by 2002:a05:6830:25c1:b0:7c7:69c8:2ce with SMTP id 46e09a7af769-7d4d0c2ce14mr5109003a34.27.1771257236086;
        Mon, 16 Feb 2026 07:53:56 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:2d75:8cf2:6289:6a96? ([2600:8803:e7e4:500:2d75:8cf2:6289:6a96])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4cfecfd7dsm6581922a34.8.2026.02.16.07.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:53:55 -0800 (PST)
Message-ID: <3a32c32a-5f4b-4f7f-a7d0-c5b708be780c@baylibre.com>
Date: Mon, 16 Feb 2026 09:53:55 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [libgpiod][PATCH] dbus: add -c option to gpiocli-get/set commands
From: David Lechner <dlechner@baylibre.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
References: <20260214003402.3851492-1-dlechner@baylibre.com>
 <CAMRc=Mf7LNW+3u9j97VwLpmXGgZAKZuqNiYNYUS7wd4oxsndeQ@mail.gmail.com>
 <3f763c4e-e57e-4282-80c9-7cbda8bb6926@baylibre.com>
Content-Language: en-US
In-Reply-To: <3f763c4e-e57e-4282-80c9-7cbda8bb6926@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31720-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[baylibre.com];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: D6144145D53
X-Rspamd-Action: no action

On 2/16/26 9:16 AM, David Lechner wrote:
> On 2/16/26 4:30 AM, Bartosz Golaszewski wrote:
>> On Sat, Feb 14, 2026 at 1:34 AM David Lechner <dlechner@baylibre.com> wrote:
>>>
>>> Add the -c/--chip option to gpiocli-get/set to allow users to specify a
>>> chip and line number instead of a line name. This is useful when a line
>>> does not have a name.
>>>
>>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>>> ---
>>
>> Hi David!
>>
>> I did not accidentally omit the --chip option in gpiocli
>> get/set/monitor. GetValues/SetValues are methods of the Request
>> interface, not Chip. User can request lines with a chip specified but
>> getting/setting values happens on the object implementing the Request
>> interface. You can check what requests are currently managed with
>> `gpiocli requests` and use the -r/--request to restrict the scope to a
>> particular one.
>>
>> In other words, I don't think the client needs this.
>>
>> Bartosz
> 
> OK. It just seems strange that the get/set commands have the offset and
> name options too if the intention is to only use the request name and
> not the line name or chip and offset specifiers.

I shouldn't reply to emails first thing in the morning. :-p

Now that my brain is working better, I get it that the offset/name
are needed because the request itself can contain multiple lines
and this is how the lines are identified in the request.

And if you need lines from two different chips in a single request,
then you need to do the gpio-aggregator thing to make them look like
they are all on a single chip.


