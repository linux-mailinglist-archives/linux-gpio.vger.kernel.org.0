Return-Path: <linux-gpio+bounces-31100-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI8wGhVheGmbpgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31100-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 07:54:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D490876
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 07:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6D57300DDC0
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 06:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6774832BF52;
	Tue, 27 Jan 2026 06:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLY61W84"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA81232BF5D
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 06:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769496833; cv=none; b=lgw8A3MMDQaZepZMiMslXkVlY7OhO5m6BRvnNnTVpFrpGyG+c2xPV09uZkUoH8Pzi5izwX/vV1U/wCY70aqPwF+Bg6P48ibWEFn+lIdHEVOp2LYsO1YQ+By2H5pgbg6mOUHp2Wbuy3sFVM3L8n/T6xc6rgPGZflBNLGJabP7xBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769496833; c=relaxed/simple;
	bh=rlH4pMRx4YCccUgiMnKNvSggZ8+Ar2o50DnD5yIzFPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jt0aZHIj3Xsi47L5BEHrtK2yk7EEgoowupYFLUKIQNuSS7FK/3svMofGhPeJDTYEQ+Jbtyyq8cL15H38QRib1nGaXoFGCZVQaTpiVHO/E3fnL6zFacYIwcmLaGDwIeIX6ss//0ZxYBxS4w95ClO0ZsKyBekZ+Bf/BsboJ3dL16s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLY61W84; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso47605251fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 22:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769496830; x=1770101630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/M/tHXyYAIsXBAFgOBZW1gAQGfQie22hy7Z7epuhM8=;
        b=iLY61W84iKJmXatnNbC8EcP4/2Zms3I7VnPOlRFGLspZG6tjIHetaZkPRLpQs6R3FK
         fZ6oo93NJoBUrKnky26dghrPGwmR74hzf9OpsmjXZFbejdWBpYOjTVF3RQ7duOsV7Ubo
         bxLgeItAWHbgC26IYY5a+DiLhhroBvBzZ89bRbBA45s77RHDEO5gBUNkqJBBQG1Tni6d
         O9i+yUPtI0V1Aaz5MCqxLIoXroQ83+kpoz51r7GFYPPZL1o3c5QJs3IsquW6NXFxNsC0
         URSFjd1OmDXNP4q6f1537NY5jehcMhd52zOLy+n0iP2zv0s/4y5KOmNWbx4FirevlY0M
         TrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769496830; x=1770101630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/M/tHXyYAIsXBAFgOBZW1gAQGfQie22hy7Z7epuhM8=;
        b=NhUA6slMsQNAmkFZh0OvINNfStxrTYDnSa/msSrit5T2XREoXE/GvndJWdDCZXPEC5
         bbrZYY29EaonGpRBImDVRs7HcdGdPnxJXfvho6i6PReboXvO/OwwkerWwY9WolxB+Hpj
         zBXtaNCaRNp6fNmSwb0kk0owtoAcJLq7tFmwc/on9OC3uG0IIa/HZYchOTaG8XyPrpIU
         tE3r3vfQC5T8i8KTK1Hj8lqBznQVCqkawhKHyOZxuSXD79xOUHI1GS/B10jMNiA4xh8Y
         RX+8A41KNTD03TL6X6tD5e+jU56Xor8GU4LGXMDiPgXIIq/81JufqCkOdHGGP06p9rfr
         mtzA==
X-Gm-Message-State: AOJu0YyBYq2n6v0Xfw9fZ5cMith9Z8vNHBJuD23wE/xA/NlhctH++jS7
	ZCvj02rI7pNNeb/sX/UHn29A/mrbeg9j2XXaDgQ4DK5ZE2Pf2X5EBnzB
X-Gm-Gg: AZuq6aKoTzBTO540dEgQKci2xUoCCXvwK5Kw6I2HpW35sGEGEdMNGaJrsBkCO4vZ/Bl
	ZclpDLu6ov7bxAk75LcGwNIv6Nxcno5TCI51asHGfe+C5Psm29anXUE+uQqsEsSWWhYPTum/Gcm
	a/7UlOuNAp1WRxkO4sKaIPQa1+elXjMVq/fabT4WBTs7P8oqzbPYY3yeaPKr7ajkEHDIq+Z0pIT
	9YSI/GxnIW6WY3BqqovE8SyIl/WicfaIh10Mjg6aEiWhNjQHJyh7z0ot48MS7o/EURQ+TvfL09L
	QidCe4UZirHHfGNe9HC5wjk1u8xOIlYRyOi5d5GfwF0Rye8kiS0IokIFoie1aqzQwRKvmzKVPH2
	dA5pBO/7tQS75jFUQkGkbMk+OoVWZHsnYhlLqzhS766XGVJiML4V8KO5blah3e/VR/AQoEej/gq
	tl13k8QK6nXuTiDdl1LfHrqI54SelpnaAk281kPVcRiaWnYbAxXy/rHvLx7SFp8bpZgxqS
X-Received: by 2002:a2e:be8a:0:b0:385:f235:51c5 with SMTP id 38308e7fff4ca-3861c94c519mr2569401fa.35.1769496829413;
        Mon, 26 Jan 2026 22:53:49 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1704desm29359291fa.23.2026.01.26.22.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 22:53:48 -0800 (PST)
Message-ID: <33097246-9724-4e9f-a06d-efab2bb001cb@gmail.com>
Date: Tue, 27 Jan 2026 08:53:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpiolib: introduce
 devm_fwnode_gpiod_get_optional() wrapper
To: Michael Tretter <m.tretter@pengutronix.de>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de,
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
References: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-0-ec34f8e35077@pengutronix.de>
 <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-1-ec34f8e35077@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260126-gpio-devm_fwnode_gpiod_get_optional-v2-1-ec34f8e35077@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31100-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B65D490876
X-Rspamd-Action: no action

On 26/01/2026 16:27, Michael Tretter wrote:
> From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> 
> The helper makes it easier to handle optional GPIOs and simplifies the
> error handling code.
> 
> Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

FWIW:
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
   -- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

