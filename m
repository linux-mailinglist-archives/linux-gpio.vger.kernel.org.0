Return-Path: <linux-gpio+bounces-35093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDXjMVz33GlaYgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:02:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D73ECE70
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A5A73048565
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 13:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1923CE49E;
	Mon, 13 Apr 2026 13:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzsDuAZv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9468F3469F4
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 13:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776088683; cv=none; b=OfAezA7KuiZpNXqHpLwhA2JuEXiOILKd6Ie+xyXHCkosO5K86Jnl++jgKmfXoWj/8muqQ1GoENBzKN+xRL/f31oZNy296irM9b2IOR0x8ER1YXpMqyfPS0OV6+tuU2pTtR2NrDNgaycinewcNI5gjJK9OU8qytZqAI2h9kFZ8+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776088683; c=relaxed/simple;
	bh=NMQATW5vHvHegdbDDdeD0bCeKNot/Lqc9BFgmY5Zqyo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=atzHKxR2N+X53pWDYJb9mkxYLN719N2aXtfeYQ2SOjxpHT0qB4JSqQS5CMF8gIoeYbEk/0XR3LDtvjO8XahqYUbM9HpcBdcr6/zQ5qvtj4xgk+UwdxljSUj6SKQqNjly/NdejRoDUO0i9hX7eJzRoR77cSOlELCWluSQ2knPqa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzsDuAZv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b458ca2296so8735325ad.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 06:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776088682; x=1776693482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=;
        b=kzsDuAZvBmGYTZsh9XqETqTsmP10UZePgPJ3ohzbv/QeMmLBVMSMcwYh/KEqHdYesU
         lC7zdZlIZucLupvet44ExN2ld9a1qRjFDNMJuw7zR4TAtVhcvOYRBXuMkVhWRS7rVisL
         U6aSbFDfvQIR9tCzUJGNvJWfNx2bhOJjB+oZyvPXF5lXoI+ch7Chm/i5OmH3JADMwdNs
         0FD17TryPIuVl2jy3W6QW8YT6VyMRfCXsBrtekbzrDgYrejEt8iES2mfl6zMOjMmUvn/
         de/ThoNY+YsPqxcE4BiOEN86Aq4djfuhblzmKVjmkatAyhOnA+u84Pwh9TVgpXqpFXNb
         7cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776088682; x=1776693482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1Jred93a8Ywwo0WVeyu+LfFpcjBGBo395/UHFn8LPw=;
        b=ZZ8KXFPRNnpIrA+aeWEhF6MIqNBscA3/au/8CS6WY87K4pgfZ0jid6Dchxc2LV2l97
         wVbjMzCV/YY1VlMMiESTesRHT5Yxijj0wFrdBKsUWD9yoeTz0n9A7XQ9JPiAWfXu3Lpg
         sB62E1JOdtZ9aNbJVdRGTfZEPfUBxLqvSY9YfV4L5RUEFHxnY2cefpJNE0KGdL4ozs3+
         PGeO3eLXhHnSMbkApInrHKtEKjgkUBIbbAc1yAe7goQmT4Yy4uTw2VT20p6Q1bAJgTwS
         5GlrTf48Uae7QPjZP5VEgSaiwy4+Jkeg9OJkOsE/K3BAbRqXSsOyGhCe99z8PjKjnms5
         VIDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XsjfgSS1mNhF/wBKQFkepoNQEDuNYopubfUYl5LOn+lOoiVye24GXPHg7JyL8od43POqIBMC4E3yV@vger.kernel.org
X-Gm-Message-State: AOJu0YzIBFkXBlHdsQIxSpoebMGJwyL99IZohQ0jqqz19dOh6gg4eAum
	cPKDQiP4fGR7YdClgN8xPAKNzmWV8Wp5pM9P0ZawnEP50KmNbM83a5EH
X-Gm-Gg: AeBDieva3f5gU1ijze1XzQJGpa/raOk7N2u2FpZJzbU/fIOfRdAn5VZhkQFa3MWH9LZ
	W1AlU50ValSQOXe5wf2NCrDvwttgE16QiDzxV/xV3GftTxgWxEEJ4LjbPyou5I6LpcvLJFD484Q
	2rJcpJHjYhBazPYufEo4vGpKKgipL0tnpRgfWPgybGtDbQ8TW2mRORMlZXufuAOVPkKBzjLEYgG
	5UE7kgCgg35+5eXy7BYg/wexH9aFeZp6FZx4Jptv+u8TArCbmXwP9Pw6zWkEt49JsnI62jfl4wG
	qfTvRIKvw5HX6hPci9ISCgKVRfG8IXhEyenH1MQ9LFRlSPfe4JMTevv4asDLz/yC0Bwq1WlBDEv
	AttzJzn7IQoDBw2rNhxD5O3ciMypj5N+RGbb+oZJ/dXQF/aGxs5YgTp+/1r0C2QmYHTGYDUAAs3
	kPOnUB0IO6Ma/6cvBoRmD4QBBrjutfWiUor+c4VFYrlvR6KiKuyS01ve3+KOZ0ODivFRbXWL8Zx
	TfBFiyRU+cejw==
X-Received: by 2002:a17:903:284:b0:2b2:5822:7a70 with SMTP id d9443c01a7336-2b2d5a63d4dmr133027285ad.38.1776088681795;
        Mon, 13 Apr 2026 06:58:01 -0700 (PDT)
Received: from localhost.localdomain (61-230-3-9.dynamic-ip.hinet.net. [61.230.3.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f36351sm113068545ad.69.2026.04.13.06.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 06:58:01 -0700 (PDT)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: krzysztof.kozlowski@oss.qualcomm.com
Cc: afaerber@suse.de,
	andrew@codeconstruct.com.au,
	eleanor.lin@realtek.com,
	james.tai@realtek.com,
	joel@jms.id.au,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller drivers
Date: Mon, 13 Apr 2026 21:57:56 +0800
Message-Id: <20260413135756.8796-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
References: <e483acb6-af9d-4bc4-9aa6-c4841ff0a8dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35093-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor15x@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,qualcomm.com:email,realtek.com:email]
X-Rspamd-Queue-Id: 549D73ECE70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> On 13/04/2026 11:23, Yu-Chun Lin [林祐君] wrote:
>>> No dedicated maintainers are shown for Realtek SoC pin controllers, except
>>> pinctrl subsystem maintainer, which means reduced review and impression of
>>> abandoned drivers.  Pin controller drivers are essential part of an SoC, so in
>>> case of lack of dedicated entry at least cover it by the SoC platform
>>> maintainers.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>>
>>> This patch should go via Realtek SoC maintainers, not pinctrl.
>>> ---
>>>  MAINTAINERS | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 10d12b51b1f6..374ce55e4fb6 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3373,6 +3373,7 @@ F:
>>> Documentation/devicetree/bindings/arm/realtek.yaml
>>>  F:     arch/arm/boot/dts/realtek/
>>>  F:     arch/arm/mach-realtek/
>>>  F:     arch/arm64/boot/dts/realtek/
>>> +F:     drivers/pinctrl/realtek/
>>>
>>>  ARM/RISC-V/RENESAS ARCHITECTURE
>>>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> --
>>> 2.51.0
>> 
>> Acked-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>
> So James will pick it up?
>
> Best regards,
> Krzysztof

Sorry for the confusion. I'll pick up this patch and include it in a series
along with the maintainer updates and other DTS changes. I plan to submit
the series to soc@ during the v7.1-rc1 to v7.1-rc5 window.

Best regards,
Yu-Chun


