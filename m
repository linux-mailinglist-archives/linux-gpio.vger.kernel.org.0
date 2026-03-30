Return-Path: <linux-gpio+bounces-34419-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CasG6VBymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34419-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:25:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6B35823F
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05D76302C762
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E8E3AF67E;
	Mon, 30 Mar 2026 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCvWz3A1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778EF38946E
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862437; cv=none; b=oHkUL2N4FJg6OpqjiN1l+fIUFk5EX8hICa3+bTzWHGQUktT9sB6Y/88W0+aHT/HBNZSDJ6ycupQibTR24z5KsMxs0SK6uwOpCcdbXXfDjr2Y+euuL4nlcK01ugKmlS9ZIpzhJkkXeeRl5NmtIvnkqJuZBGZUxvLFiqJoTyMVh/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862437; c=relaxed/simple;
	bh=1U1/g7PpN4KMsVeJgAgw9ob4Mjdy0kRLLKET3QusWxw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pd0GXKBoD2Wc4AB/E/MfHvi+5EcbucMeax4Cs0D3WsfikYsb915RRcEw1yplB7YZJWWEFxrh8r4fm+OD5Kqf8HNLLF6XeBrfc706GnHJHDavTBOU6hDppg9hlWFNxSU5dHdcbTh9+oBypU05vUEmeBroqaVSvAVknNJ4ni386w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uCvWz3A1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4B8C4CEF7
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774862437;
	bh=1U1/g7PpN4KMsVeJgAgw9ob4Mjdy0kRLLKET3QusWxw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=uCvWz3A1qWJyLEc0P7WuCInSlG3q2/vVd8beLJwDPmmrxKi0b/qFzUy9N2SysgVBr
	 sMjd4Uuh4pb5n0vo/sOOb7MzXHHkShyO6zhiGBWrkPes7Jq5b3sUqs+DLou1ZdqSK/
	 OvWNw/0BscM+LdbbOfWNdTwNl4GNW+LQXPwsSGDfnkHxuKLiBc3uV8yg7yU2C7jrTK
	 ZOQugReeiGg78nKSM5KDpF06aM1i1yqmO3BxmTyTl8YPfz5YfFSh1/vnUnjKF7knzx
	 l8Zydsy8iQ46Mgyo2UZ1wQTkKMvRdjaU8wNl1mV7A9kujbtAZ0a0JnVih96g4RDAlW
	 8qUPJMzTmUWWA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38a23dd61c1so35601271fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:20:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNau+YUVW0bFxVoOf7Ysb5E9QiG14zJN47eDjiXTi26sa3CaEzzJCYtDtKkGE8f7v6rMjqPs7GnGF2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CyJop7t43KxfoQaV4C6nm7/P0qWU8MgPzM2HkFeM/Z95ABJi
	sCMvgp7FkfzcpnJTWN/rmax8huwEJ8q8GczR0LtD3/wNZybCtg2o7/lJTiRm/XrUwp4D12JiIKS
	Bocd7F4og36igkaaWW00B3JJ0nCg4b18riP5SWfgLVw==
X-Received: by 2002:a05:651c:547:b0:38a:2c09:b44c with SMTP id
 38308e7fff4ca-38c74049c21mr39181381fa.32.1774862435854; Mon, 30 Mar 2026
 02:20:35 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:20:33 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:20:33 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260329-ti-ads7950-facelift-v4-4-c568c508c49a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com> <20260329-ti-ads7950-facelift-v4-4-c568c508c49a@gmail.com>
Date: Mon, 30 Mar 2026 05:20:33 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdP-fvm4WWgFdHabCnVbc=rV943YhwrCHaCH9VCo_ZJJg@mail.gmail.com>
X-Gm-Features: AQROBzDQ2GawSvoUv_rLisVsLjdiQFdqDtvU2A_IBJM_GCdGbamknWhgOpii-uE
Message-ID: <CAMRc=MdP-fvm4WWgFdHabCnVbc=rV943YhwrCHaCH9VCo_ZJJg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] iio: adc: ti-ads7950: complete conversion to using
 managed resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34419-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DBC6B35823F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 00:47:09 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> All resources that the driver needs have managed API now. Switch to
> using them to make code clearer and drop ti_ads7950_remove().
>
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> -

[snip]

> -static void ti_ads7950_remove(struct spi_device *spi)
> -{
> -	struct iio_dev *indio_dev = spi_get_drvdata(spi);
> -	struct ti_ads7950_state *st = iio_priv(indio_dev);
> -
> -	gpiochip_remove(&st->chip);
> -	iio_device_unregister(indio_dev);
> -	iio_triggered_buffer_cleanup(indio_dev);
> -	mutex_destroy(&st->slock);

That's a functional change, there's no corresponding conversion to using
devm_mutex_init().

Bart

