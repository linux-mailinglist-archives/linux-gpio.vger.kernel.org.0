Return-Path: <linux-gpio+bounces-31850-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAvwMCXVlmmVowIAu9opvQ
	(envelope-from <linux-gpio+bounces-31850-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:17:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA815D444
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 10:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4822B3023315
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 09:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A2E33468F;
	Thu, 19 Feb 2026 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9UJUuw4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E59284896
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771492639; cv=none; b=S45QcT7WLflo+Pz9bmae5yCcWkc1YmDZpdeXHY9nvZr2fc8gt90Byj4ekhATu8SOicjU/bULtpiDNAa+3eTm1hi3mPkx6nPZvNu1YqfBGG6TR+UC0CxLqnlJxo34bQiPIvwYH9eyMEQp6/MKjUs2y4XSD9JdhbR36j030CSpVoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771492639; c=relaxed/simple;
	bh=bIaO7sT/jOo2ecU/DgrmjTLZO3gRq/QTqlqjIw9OIRE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpiW2jYFEdmORMkmu+obIHxJQq01kDQSGqGSm+scup3KmkqTxQx6U76z1ttWln9amupWkZ7Tnu/eb+3hzb3+lGtH337983K7nlyz/SJ9IA6NME6DTSPqfMAXvymbRdGFY7H0QMhcGWhfZGdGsG0mIFmcwjxukGevAJdLFRg7Ylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9UJUuw4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCAFC19424
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771492639;
	bh=bIaO7sT/jOo2ecU/DgrmjTLZO3gRq/QTqlqjIw9OIRE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=p9UJUuw4JTfbiUh5CeOG5DDqGrDK2U+zhaC+zZIo9e6Muae8NfyjL368GMMz3YuEI
	 0QJ8r+zd+zC6s4LP5BX4PlqHKq3lJd6PpsCz3D8r1QoIvlE3oLlFc3CG2s0Qc91ggT
	 oYp0I0s7I9CVO+bsYv7UtN0LhIwhipg6mBQtdtz97Ru4gWzfm8O7ic/JeiJuwGm861
	 Lle0xXSEfFH2XZzh+yOxLmIODecxc4onqHrS0D5C0lqjid0j7H/18aTuGTZFnT40u+
	 QzwI3Ds419XT/eSDNGgE8VXITV4dL9pX76L1qIXIihVl/sJoEF6yDtmctK9fiN6g/g
	 5caZvzgAMTbNQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38708180241so6175671fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 01:17:19 -0800 (PST)
X-Gm-Message-State: AOJu0YxhRlrTElnjDdaJrmLoCdwgETUAsyKgotgI1NbnVzM0RFu5/Wfa
	gGnKeOzMFnKfc0PF32PrWepsSH4dAK5Li19oNqcuKMTtFUW4fsycJGPWCJBhUYcLsHDIGMTcm4r
	x61bAzjiDbP9ZKv6zwRB9HzHessP/b13A+CMwc4DJrQ==
X-Received: by 2002:a05:651c:210a:b0:388:3d86:473 with SMTP id
 38308e7fff4ca-38846599ebcmr17316661fa.9.1771492637965; Thu, 19 Feb 2026
 01:17:17 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 01:17:16 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Feb 2026 01:17:16 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <48629460-701F-438F-8E1A-6F428C49FF6E@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-gpiolib-set-normalize-v1-1-f0d53a009db4@oss.qualcomm.com>
 <48629460-701F-438F-8E1A-6F428C49FF6E@gmail.com>
Date: Thu, 19 Feb 2026 01:17:16 -0800
X-Gmail-Original-Message-ID: <CAMRc=McZHgvNkvL2EWUCQOsZrDryctT4CxdfJGUUm977NvXQCg@mail.gmail.com>
X-Gm-Features: AaiRm52SM7OhOTUhS4wyPBcVypgErCQYWgqK7eIsQTvEfdjoDPUQWsUkaNX3pos
Message-ID: <CAMRc=McZHgvNkvL2EWUCQOsZrDryctT4CxdfJGUUm977NvXQCg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: normalize the return value of gc->set() on
 behalf of buggy drivers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31850-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22FA815D444
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 09:57:58 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On February 19, 2026 12:52:37 AM PST, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
>>Commit 86ef402d805d ("gpiolib: sanitize the return value of
>>gpio_chip::get()") started checking the return value of the .set()
>>callback in struct gpio_chip. Now - almost a year later - it turns out
>>that there are quite a few drivers in tree that can break with this
>>change. Partially revert it: normalize the return value in GPIO core but
>>also emit a warning.
>>
>>Cc: stable@vger.kernel.org
>>Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
>>Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>Closes: https://lore.kernel.org/all/aZSkqGTqMp_57qC7@google.com/
>>Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>---
>> drivers/gpio/gpiolib.c | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>>index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..9f7a1a1ebd8365fe933c989caf9e8c544fd9ba0f 100644
>>--- a/drivers/gpio/gpiolib.c
>>+++ b/drivers/gpio/gpiolib.c
>>@@ -2914,8 +2914,12 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
>> 		return -EOPNOTSUPP;
>>
>> 	ret = gc->set(gc, offset, value);
>>-	if (ret > 0)
>>-		ret = -EBADE;
>>+	if (ret > 0) {
>>+		gpiochip_warn(gc,
>>+			"invalid return value from gc->set(): %d, consider fixing the driver\n",
>>+			ret);
>>+		ret = !!ret;
>>+	}
>>
>> 	return ret;
>> }
>
> You want to patch gpiochip_get(). It could be that set() is similarly troublesome, but the report is about get() not working.
>

Gah! I shouldn't send patches before enough coffee. I don't think gpiochip_set()
need the same patching though, it would be very weird for anyone to return
anything else than 0 or -errno.

Thanks, I'll send a v2.

Bart

