Return-Path: <linux-gpio+bounces-31049-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPm2LD8Vd2mHbwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31049-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 08:18:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947284C5F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 08:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39B8D300616C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 07:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73F029A9FE;
	Mon, 26 Jan 2026 07:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/kIT2/n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B542727FC
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769411900; cv=none; b=P2wc4Sps7hnpllxUXOqVMFdFQuj9iYZmarqFjOthrFclwkqE/Udk5Xb8DiFAstxMQ/vMEnV4bJB8+jNkVtq8/8L6nBAVv3jyDLR6KzCCUjUufyPNqkmQiyG/22Pt1fp4QlurhcFDmb4ev8Oj4u37ozkglnSxCfgbcaZTtGagEMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769411900; c=relaxed/simple;
	bh=2d3VkKVprOn0POoG1tj2e+fSBF9FWtRC5BfmHhTAXk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6ERFV7/Zogv8IcFUG7zs+irQrbyXE3fzuzSzzPAqSui9OkfP2IsfFpKVZ7khb5nDQ91Yrg6Ge0lvWlEU/Jbmc8FFB+mfZR+psOqEHNKJ3+UczzK6spDY+Kf3FGvJstwbwev29ra+oFKQoKWKzpmiVJhoLNJK7bRR5Xrr3Go5Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/kIT2/n; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59b6f267721so3858865e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jan 2026 23:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769411897; x=1770016697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WArHawLJ3St1I6FiQL7ZHtliCGZBvM1AiNAbRVhYV8=;
        b=Q/kIT2/nwXfVGqDnbI3yUhlXJ0y4DD5n3xSFsvyTJx2uROVNePQCLwwZQ5jHsFYE5j
         AEKtStWWOBVLJqthFM1pke+UNkgjafRM24+7Zpt1vfp0SZmuHqsZvZXEMkl5BlAEFFY4
         PDsNJ0zjUJ5ZH4SzAg2wbQq3RLLfpMlSIdI+yE3qfHbmCLvl/HwVmIXq7hlItI/4+ljf
         F92ys7a/ID9/eq2ghpRLjb82r3/YEMHtkNWcyGs9fG9DWvctGlNrflwbns0Ennj/ZQFn
         SqxJBjP6aDVi5Qf3e652+1fkC9AF/vpvk9QtNoUgs8ZkOHW22/FtwwGMbFQwB9i9Kl4p
         Kppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769411897; x=1770016697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WArHawLJ3St1I6FiQL7ZHtliCGZBvM1AiNAbRVhYV8=;
        b=rVv3gSjRElB+jVBbr5bNH0M07+zqBqDxrRFRLcUeEsYCX2RrStpXavB9uHDxb9v3i2
         ezRmwvPMpuIyEnTXpc3jEtgnfgbUY35BjT0TtrABE2UdC7/fX4hgnUHFgPLID0Vjc61S
         sYnwcJ0b87V9xcE/DI1hDZMJStOEZiJdQTEKhJI2IsB0ceob9yt+F55ESEmn7hfBtMmz
         4uM/cGbPLv0LJQK2M06qTmjUdKbslHV1gaPC2ucYKP96yoYpVMfXZvoKgOSrQkXqTJvy
         xaccofEW0lYWHFqvxjlHzlJUh5+DCJD7QQx6Rl0emDb7kHI1F7BLBM5Zpqhb3NdF2Wa+
         l+1A==
X-Gm-Message-State: AOJu0YwSBA89LCsRDq18Gwxwfx95X0uhoAHLTk/cRx+VQlXn+arhnLkj
	XCt5uB0dpa7NCdYjff1zuzJMi524eEkILt9LIOkY0uMW3zMWqKaGmBT7
X-Gm-Gg: AZuq6aLOqRo/uKiGDHVXns6xLYfrZPXebJw0L+rtc9qU7lyUEVVVPIZJbvBV7gHGBYx
	dUlCwq4wlAUwfJ73vANh2pGE/tm3lYdXTEtM64fu0IRnqgpP6lBf+N9EAj6cdNPEQgClSMYwANP
	aN3N8hSZwxTuwCcsPucERuOuoVUBJkZYMpkR04cQ12r+/DqfTRFsQ4qP49w06tfy7smmpGw+gb+
	a0LMhYNyac2L+NBGPE6JO+uZxuU1HbjBZ2mYbX6DfSM4+tcbrjzWHr12mBNrMcORUjwkLmXmwPM
	L5gYBc0VuxML3mkZM6hHguzxc7LN59pu47P5D3+5KAfqL6zvkypUd7DApGlMy7UPdM5cpPqVdLP
	fmYvVNJ6/WcAEY5CpxOnj90Tr7AsXK4WZVMihlZGipVMmtgnRKLubvMGIw+66htMwzwJBY+N8q6
	QzLGogxZpSCuk24oZgrTPu7zE2946Lj1WpA7wV8kboC0m/Wos82goFA4vIcZ498KmZSafp
X-Received: by 2002:a05:6512:1385:b0:59d:e747:eb32 with SMTP id 2adb3069b0e04-59df33a8d73mr1082603e87.0.1769411897300;
        Sun, 25 Jan 2026 23:18:17 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918991sm2435877e87.48.2026.01.25.23.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 23:18:16 -0800 (PST)
Message-ID: <2e749319-704e-4d65-af56-f97c4a84de23@gmail.com>
Date: Mon, 26 Jan 2026 09:18:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: bd71815: switch to
 devm_fwnode_gpiod_get_optional
To: Michael Tretter <m.tretter@pengutronix.de>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-2-fb49905452a6@pengutronix.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-2-fb49905452a6@pengutronix.de>
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
	TAGGED_FROM(0.00)[bounces-31049-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1947284C5F
X-Rspamd-Action: no action

On 23/01/2026 11:51, Michael Tretter wrote:
> Use the devm_fwnode_gpiod_get_optional variant to simplify the error
> handling code.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Thanks!

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

