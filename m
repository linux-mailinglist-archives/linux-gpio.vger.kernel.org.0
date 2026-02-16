Return-Path: <linux-gpio+bounces-31719-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBt3Jik3k2mV2gEAu9opvQ
	(envelope-from <linux-gpio+bounces-31719-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 16:26:33 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D914588A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 16:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43BA6305C8DA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Feb 2026 15:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B360C31B836;
	Mon, 16 Feb 2026 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="N1JPJslE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFD331B122
	for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 15:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771254977; cv=none; b=IPitvQdqb2iMl8UgDkZH6XquI31Ar9n0hSdonpztECtzjn86luEFi46cx05ger1ttAQfbSRDuQyOiGHr5gZXEgL3CQP90eE/CsyrRETq30xkz5ArO/9+xRGf7Y+hElGfZhYlRi1DcgHybPjJhrR/33wu/MMKPuVdTlvfgq9hlEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771254977; c=relaxed/simple;
	bh=f4Logej1L+CzuBAypJoEuuuaglA2vSlCPvzN1DbVJcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNV7x5BYD8seOWrNdVLBoH1tWK/MMGEYRQUOznmBGg5XfvQw4YNhLQ45CW8zZHUJKGfTknlZibrtW0tDYomw/dDzEdl7l+MdM0x1cd7oxcXFkmUyqPWTsaZOUAe2I1UNlOkpOo/Xyvy23rHNEwRa885vw7Ovqn2WBdeozcH6ODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=N1JPJslE; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-45effa36208so2277579b6e.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Feb 2026 07:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771254974; x=1771859774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DZVm/+63BJbSSxBRYswngMqRYOXZRHNvxOGyJzxgGTo=;
        b=N1JPJslEJ/at+AJ+ERc6UxdozOBxaQERet2Xa5A4AMKgJyB1rZF09IawkrIztWTYM4
         W1I9iPePLeoMRJ2LEA940w/eW2DKy37Lqm4H3trxEfIhjXbpT7bIGAyB9TfTps2P6y3D
         9QiRK5YPDsUcQKyrw4CqU4xMEsGUZlXQ68m91DjB0a5gGP2MZlI0L2tzqMxWpzfBRZwH
         L80EmlipU83t3cXu8sTqCiyMp2gfJ6seLaIud2tn67WDSvKeZ3DpJ8ZbDCr82b38SPPZ
         VNHRtY6CPUbr46I54Tt8jIt6Wq/fwLHVLIHo1XI/VQ0PW3zY8NqR61qRVZjPxwfthM+8
         rHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771254974; x=1771859774;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZVm/+63BJbSSxBRYswngMqRYOXZRHNvxOGyJzxgGTo=;
        b=o+I8IXwa5OpDVjBksfJJcoNy0QcaVp4UBCp2cKA5qRyj6K9YA2bpqHjaG3eUOO1MD9
         OAQqpjnEawwNEOiXRGngdzX0yGPTbfSyueH1YEdZTCjYlp6DEuQkDM9AyfdDLGc8l0mD
         vS2b4Szd5h6fFvjn3hdEbsMX2YVmDpJU1HvhZgvUZ5xQ4ehWZEGNe8DzxYZl8pvImPPA
         /AR3Pnb529jH0dNYqbuJsJ9+0I+K9c1PUx1NITiwyqlqhm9l/fDiROUnWVF1wUyc+WPz
         43SYyMPopPKAiUM0EhiccBhnEIBL+x1/OnkNaXW89wJTilPpVaN9Af8hJHugR+Vce0hh
         UhKA==
X-Gm-Message-State: AOJu0YyJSMQ+ECiwD6ANy6xi9Uk2AUMbHCmlEM8HDPEB52VeNBtKgpcg
	M6NwxPiVR1d508OGTxxPiYDxhk92D1bJKnvuOXRFuPhqAMxufVojbXzFFh5ajIM01c565AnIiwp
	tQkb+
X-Gm-Gg: AZuq6aID7pVKI3GMWdR5KO2rcj76WpfaY/gUaWsKXH9qY8T1SAVHTjc6eO+D+9sfHYa
	5/IK093yZJXUoKA/2Pz/t0NEzFP+eidO0GfU2LaxEx+Rp/s2vUeHr+NfkPnJhEkLrJ0aoGnzXHp
	0/0feO5lHYdxroyjcLRyQqzLE90+mEPFZ/ViJN7Wcw+l8AMSPGO9+ttCY8PTx4bkUXJkBu+GysN
	UNGZtrKdiIcWrQtYgKsgW7Zh44w2c2NvmSTVdEzHw1AhiVW6Nk2Bjc4lz/yVK+Q4gzvnV2gL7ED
	D+YaFfOG5HHP1/xslwpI0sVIEO3yAUE0O1sUiElSPZJcaVUXSJJeDupr9xLmgwCvrJgW9gbQBZ/
	BTtBwUCRMqVDvgcr6JglCGYssL77L1pePMi/9CiEbL598GnwCq5CfPxdiwkAQaOI+FFPjEUxqq3
	pizR8pMSoCxGeVtqgL2skgZ042JddnR/iRQsibvaDpteU0oCEFlncTz/D5FxTYPJSLjbnBwVni
X-Received: by 2002:a05:6808:c2de:b0:45e:a7af:e8ec with SMTP id 5614622812f47-4639f22b345mr5851315b6e.49.1771254974060;
        Mon, 16 Feb 2026 07:16:14 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:2d75:8cf2:6289:6a96? ([2600:8803:e7e4:500:2d75:8cf2:6289:6a96])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a77200fbsm12789215a34.27.2026.02.16.07.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 07:16:13 -0800 (PST)
Message-ID: <3f763c4e-e57e-4282-80c9-7cbda8bb6926@baylibre.com>
Date: Mon, 16 Feb 2026 09:16:12 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [libgpiod][PATCH] dbus: add -c option to gpiocli-get/set commands
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
References: <20260214003402.3851492-1-dlechner@baylibre.com>
 <CAMRc=Mf7LNW+3u9j97VwLpmXGgZAKZuqNiYNYUS7wd4oxsndeQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAMRc=Mf7LNW+3u9j97VwLpmXGgZAKZuqNiYNYUS7wd4oxsndeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31719-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: E43D914588A
X-Rspamd-Action: no action

On 2/16/26 4:30 AM, Bartosz Golaszewski wrote:
> On Sat, Feb 14, 2026 at 1:34 AM David Lechner <dlechner@baylibre.com> wrote:
>>
>> Add the -c/--chip option to gpiocli-get/set to allow users to specify a
>> chip and line number instead of a line name. This is useful when a line
>> does not have a name.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
> 
> Hi David!
> 
> I did not accidentally omit the --chip option in gpiocli
> get/set/monitor. GetValues/SetValues are methods of the Request
> interface, not Chip. User can request lines with a chip specified but
> getting/setting values happens on the object implementing the Request
> interface. You can check what requests are currently managed with
> `gpiocli requests` and use the -r/--request to restrict the scope to a
> particular one.
> 
> In other words, I don't think the client needs this.
> 
> Bartosz

OK. It just seems strange that the get/set commands have the offset and
name options too if the intention is to only use the request name and
not the line name or chip and offset specifiers.

