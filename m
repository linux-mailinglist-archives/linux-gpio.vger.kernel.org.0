Return-Path: <linux-gpio+bounces-37091-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBa9DtGNC2p2JQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37091-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:08:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B038E574493
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 00:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3D6F30387AC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 22:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5503A63F2;
	Mon, 18 May 2026 22:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfwVRnxd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5084939EF0B
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 22:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142087; cv=none; b=mfszCGA9PsgfCsD9CthpfL8/7M+NiIJ0hLegkWhc3M5yZgoW54iafsvGHCQqANbQxJrA8qquF2OVHtg+2Rlb44JH6y1pHNVto2BzyEZmY5XEbgPDKRbw7wv64+Uwzxyme4bEgOpES2fqvANAbIAV8sSUeZ7ZYHDgSLxHQzNZUrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142087; c=relaxed/simple;
	bh=ZeHrTM95+S1Ac1kBGowZn208fl0ne8C3fh5bhdKFRT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoY7/kJUG+8Bv0q4/JKUeLZCg3iBgVsgOVrc2LffBhS/xOO0lrBoYrhLWO4duFsNghOBDmfQYX/JQ0ySg45rguNJY3kNyEA/gqnRM2Xlhcd0G2io21eIc/Camp2je2vv4FpmmN0+4H19UZf00stAeazjMqRWqtxmk0IibHWFZNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfwVRnxd; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1309f4ee97fso3102930c88.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142085; x=1779746885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4h7adFpT3DzT6y9igk6xVmIBKDtCJtpJ+ZzZ67vZi7A=;
        b=mfwVRnxd5nfIAlLNtjmxWz27II4bazTCZPMM0hj9bYIs2DVQ4Ew9VCu/vZqKJwwCL9
         85F51FTGz7j+zNGbJ+CX6lmy79F5k3StTZ5XS5rj86dzNem3Gh0Vy0KxnQjNh+E6q0pz
         0ZUBAhIh7hOvpzzI40la6tt39l0ISp1+3XUKzc4bgU+tykk8kJL4fqRpityIWiCj/XX1
         GieHhXOWLSqi+Moq7bLTBfAaIf1+S4GLKmlzOwZejJPtEFNFYQag8uXFSCGT/3P5tDxG
         jFX5G+73x9J8VRHAQuX3VGTa/BUBipJIsr95Q7ZySUJt/IUvm+feYIFDrHq4IJbDJpyW
         AV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142085; x=1779746885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h7adFpT3DzT6y9igk6xVmIBKDtCJtpJ+ZzZ67vZi7A=;
        b=QTm9qTm9yL7JgLhbzcPVGzJlnzf5UpJaxWacFO/Q29XhbQ9q8Njni9RO12mKO9zxlK
         YsYsF8nDr4mWLGd8f3ow7EZI3WQPMKjqVrUw6XVdXBL74SSkErOmXsXKSiD4ZlCb0Iff
         7xeQFS90ueSez/OVe0uGGguycgr5/jqBFyo7R62yFxYbis0hI8AOtTkGikEVmMpxX4w3
         LzrIiXNcoJD2q0fHYbtK6ohvjhGpTzjQ9HVJixVZ0lkInrocW1wE6GGfKWc+0/4Q/fYA
         RElXHc0YjuIUNL5wdC8oCQbEax6Wbz5IBYuBcLHCWOcvReGQDobjdOte9Q7FhhOejjrG
         Sqdg==
X-Forwarded-Encrypted: i=1; AFNElJ+2vEbjTfnFGfum9iF+Rp8OA8IGrh+ZdHiVALXsa0cteWgNtD6ITXEcr4hlVNkc31YCDx6eMDK2tlWh@vger.kernel.org
X-Gm-Message-State: AOJu0YxipFv/jpQCmrJaqbGywXU5OSRwlyScCJ98a0Bw4biXdVbE8FdY
	YIx51brjaXY1r2cT/WniqEWTGos2WkXJanPe1IkLQB8gIc/S8MVvaZdO
X-Gm-Gg: Acq92OFw3D0hDCGiPvRNi6xZ8fTmSn5yMrktg1Myt04Ovj5jHP/Nt5QyNKYVik4ze22
	rCwT1t1p0ZWk6UvukLx70XigwLP3X/mC1b4A3amv0lkspmHi6EmiWXcRVwch+Wh24VjuetoTHxO
	0W5Z46JIoan/EPzOiPv6pWGsl3VDOB+1AbghrbsmAQCSwR6QLZ0RPTYt2zSV9cYJiXBWuJRjwNk
	IvW7sJk7aSS/abNimAoWsi2MEBuuN3qG6ETlVPcplBUW0ldLZ7kQjDTQqBhnMJsaoQs8UARPKC7
	We0jopaLaWE9d6S+PQrLrqjKAs6Bw28LeSykCo6jI7kcezEOyMVwqVwnGCqV1Vfws5Lqs2WHdoF
	BBcPXflYyLbGCEOykZlYc4j+7Sk9fyFqWcjS4QOXcoAYsi3yWf9m3pijSfjx4Q2Ilj3cDmQJv+k
	UfUZLpXGFiguV1ItrLDuySX4YdQY5AJMkATEkzGHM1mvX7ScugaIUpvGPdL0+/APSrralIiDqE
X-Received: by 2002:a05:7300:5726:b0:2d9:bc8d:f62a with SMTP id 5a478bee46e88-3039868cd4fmr7172595eec.16.1779142085307;
        Mon, 18 May 2026 15:08:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e6a9sm14601361eec.2.2026.05.18.15.08.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:08:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6ec6270c-595e-49b2-8465-31b5019de87c@roeck-us.net>
Date: Mon, 18 May 2026 15:08:03 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] hwmon: (pmbus/adm1266) GPIO accessor fixes
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-37091-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nexthop.ai:email]
X-Rspamd-Queue-Id: B038E574493
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 5/16/26 16:18, Abdurrahman Hussain wrote:
> Five pre-existing bugs in the adm1266 GPIO path that all landed when
> GPIO support was first added (commit d98dfad35c38).  Each is
> reachable any time userspace queries an ADM1266 GPIO/PDIO line via
> the gpiolib char-dev or sysfs interfaces, or reads
> debugfs/gpio-<chip>.
> 
> Patch 1 caps the PDIO scan loop in adm1266_gpio_get_multiple() at
> ADM1266_PDIO_NR (16) instead of ADM1266_PDIO_STATUS (0xE9 = 233, a
> PMBus command code that ended up in the bound by mistake).  As
> written, the scan walks find_next_bit() up to bit 242 across a
> 25-bit caller mask, reading out of bounds and -- if any of that
> incidental memory contains a set bit -- driving a corresponding
> out-of-bounds write to the caller's bits array.
> 
> Patch 2 drops a redundant "*bits = 0" reset that sits between the
> GPIO and PDIO halves of adm1266_gpio_get_multiple().  As written,
> the GPIO bits the first loop populates are immediately discarded
> before the PDIO loop runs, so any caller asking for a mix of GPIO
> and PDIO lines sees the GPIO half always reported as 0.
> 
> Patch 3 adds the missing "ret < 2" length check after the three
> i2c_smbus_read_block_data() calls in adm1266_gpio_get() and
> adm1266_gpio_get_multiple().  A device returning a 0- or 1-byte
> response would otherwise compose pin status from uninitialised
> stack memory and leak it to userspace via gpiolib.
> 
> Patch 4 moves adm1266_config_gpio() past pmbus_do_probe() in
> adm1266_probe() so the gpio_chip isn't registered (and reachable
> from userspace) until the PMBus state the GPIO accessors depend
> on is initialised.  This is a prerequisite for patch 5.
> 
> Patch 5 takes pmbus_lock at the top of adm1266_gpio_get(),
> adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
> GPIO PMBus reads can't land between a PAGE write and the paged
> read pmbus_core does in another thread.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko reported a number of additional problems. As far as I can
see those are real. Would you mind fixing those issues as well
as part of this series ?

Thanks,
Guenter


