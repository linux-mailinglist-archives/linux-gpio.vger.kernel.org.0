Return-Path: <linux-gpio+bounces-34367-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDBOFulFyWkAxAUAu9opvQ
	(envelope-from <linux-gpio+bounces-34367-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 17:31:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A6935298F
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 17:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B2803004DE7
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 15:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1012131CA4E;
	Sun, 29 Mar 2026 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsdCsXHx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7726FA6F
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798309; cv=none; b=Ty/r9WbVUnYxPSNvKialxkTWPewRBd+k2Nj/QAh9XMLYGXzFlhV6GALw6tF7xPRZB3bkszQDpSjKpVzjoI89UlgbNK6TWhvTJ+3+9NtedjziTaEKxsr/W61I8AQcWb+70CQTgsb2m/D5FkYN16SrrMpjUqS/4QcTFp19HmyTPPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798309; c=relaxed/simple;
	bh=au2eKM8u7aYrDUz5dztDboQXIdUsEbqGrxHSvOHJykw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sU5JaBpA+M7JbzQYY3JEKgOtkQBgcPLuAy6HJCFWPsmhNLXNMHU920UTrfqE50aADgMMnoXP9EX0UVANTIPQ918Jqa3EEvHkNMcuCSKRkAbqvevPRU+2ha6QWayRAogRySGMaiT6eFsqzTLTJZRorQSR6ZylXmiy9FjvijGPzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsdCsXHx; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12a74039dc6so2774057c88.0
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774798308; x=1775403108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lbC14XtI3H5l+g6ZcwMwWY/fzzcIo7U44X14GI38NY0=;
        b=GsdCsXHx4pwdN5Idmy/anGLDS5S12R4ZATfmUOvWtYKW0DL3tXfJ81tQm4OB8RQTvi
         lveg4ibvK2zNWmWgkzYT/bC7Oz1d47L6xvR/khMQtYemp41uyBOUUynWqILvPDmO2ekp
         STSf+lHLEjgmv60ffQlELBa3ljhcIhFkpFKUB4FNLUwZSOEfbBOtk+MbkwEU9HonjKCQ
         eCl3tJNSBzztmZftGnvjbPantFqjwIouMOD7ogUZ6JERL4I3U0yX+Xanx9I9LqrQ0yd1
         GDm0r5yOs184fB1Q68O4GPK3b0Q9l1N9HFedaWVBsKlao8TkD6ZPRBuf+MmuN/1QtVLM
         Azhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774798308; x=1775403108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbC14XtI3H5l+g6ZcwMwWY/fzzcIo7U44X14GI38NY0=;
        b=DvqOY6tSTsJ5rZReuynDGGeN7B6HjucsunF2Txfb6BuAHv37n/+HasBZciFYPwXa8n
         8hNP5J6Ens67hS3/RteIx4ca8tuG8RML3tOgbvTkCkjBgjIHsBxGCDHz2Cmttn6RWVsu
         IdBj7T9T3nF8/tJQmae6PB9uPlT1MhQPWB8cTn+5SJX6RpxBl19N9chfzrRhbgErJYk4
         ugd09DzJeLIlwB/NMHo6xA/0C75OsYW3JecC7tVY4gN/xcom/aOTRMk02VrrlQbnhf60
         08qLFi0uqre1JXWFHE02L55+i8/7erGTrfN1gp+m1jl4wyJRjWioiks2pFi+Jepk86df
         WbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoR47T6ArjqYl6vVB/gaJnwxZWDqM8Wm25hmJC9TVSGzmG6WFU+zUYi647GkrehubriZNJlET6oOE1@vger.kernel.org
X-Gm-Message-State: AOJu0YwhU7+bzws8DGx01gU45TK78ai87HO8eBOJdty3KdCproMI6l5r
	aDox72u6/iT3ME4E3+ZpRfg38C6dx72GJui1lyOO2ijcfvfwWmgXKzWu
X-Gm-Gg: ATEYQzyOWmkxmtw3CQy3fqlFNAMAF7XNluPQ/78hEJgqgafj8fs0+Hhx31jduwis2+G
	bSU5E5NLQ/QgIxNtWK2wbDCMDdm1b6ZDJ12nxNHE/sQdtng+Lchs9TKq+Yp/t8FjwCVnil76y6G
	5RxSxCRNBTJOv1+0t2ThqGOyGcxOjj4wMbyLkUJppi3gNFyim2SrlKXtlZKD/q1Bf+1/24VjyC5
	z+uR4ofa+9o++ZCjcpq1B072rqVLpEhCbqc9UYlkI3gm3yeFdXcMnZrniZCKK9ucP0MXvJQJzQZ
	w3fLDV4nRsm5WrBbhYtucAoEuzrmoR/yUBlzUyuZnOLlZr65E2JETslwHoJYI6MEV6Prkb4Nypw
	2/PM3Zr3Zi2UsU2p+szXgPcfDkSVlbJqLIzXU2rL4lAjJlSH0UFAFuSgQgC+yVHLaF+hG4T86vp
	YLGyzbbbvAK1c3wzI13COR9VhFkr/pBkCKsoba/fsG3Rux70aJ7cHrgtlYMx8f+yMZbBrK9CoW
X-Received: by 2002:a05:7022:20c:b0:119:e56b:98be with SMTP id a92af1059eb24-12ab28ff327mr4858192c88.37.1774798307626;
        Sun, 29 Mar 2026 08:31:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97ca83bsm4812631c88.2.2026.03.29.08.31.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 08:31:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <72b9d96c-59c7-429e-b422-ffec702342e7@roeck-us.net>
Date: Sun, 29 Mar 2026 08:31:45 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] hwmon: add NXP MC33978/MC34978 driver
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
References: <20260329090601.532477-1-o.rempel@pengutronix.de>
 <20260329090601.532477-6-o.rempel@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260329090601.532477-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34367-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email]
X-Rspamd-Queue-Id: E7A6935298F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 02:06, Oleksij Rempel wrote:
> Add hardware monitoring support for the NXP MC33978/MC34978 Multiple
> Switch Detection Interface (MSDI).
> 
> The hardware utilizes a clear-on-read FAULT register, but physical
> faults remain asserted as long as the underlying condition exists. This
> asserts a global FAULT_STAT bit on the SPI bus. To handle this without
> trapping the CPU in an interrupt storm, this driver implements the
> following architecture:
> - Requests a rising-edge nested IRQ (IRQF_TRIGGER_RISING) from the MFD
>    core to catch the initial 0 -> 1 transition of the global fault state.
> - Caches hwmon-specific alarm bits and calculates state edges (XOR) to
>    isolate alarm transitions from system integrity faults.
> - Implements a 1Hz delayed workqueue that polls the hardware as long as
>    any alarm is active. This compensates for the edge-triggered IRQ by
>    discovering secondary faults that occur without a rising edge, and
>    detecting when the hardware clears.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Acked-by: Guenter Roeck <linux@roeck-us.net>


