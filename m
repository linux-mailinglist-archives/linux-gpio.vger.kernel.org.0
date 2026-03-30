Return-Path: <linux-gpio+bounces-34417-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB2RDc9Bymky7AUAu9opvQ
	(envelope-from <linux-gpio+bounces-34417-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:26:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32759358291
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 11:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98408301EA14
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 09:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C9D36E496;
	Mon, 30 Mar 2026 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jj4jR+BV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F86388365
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862237; cv=none; b=VkVc15jCYiAWqA3sqqcjrXYbIWbZah7BHkM+D+CIwbtg1mrcbBrHTsVLSv6BU14VIl57C6uoUVPZcBiCebaQkDVpiGOHNGLDqik8ejLrjJQmO1Cy7nKVZEz3Agf4kGyLgRy9Umy8A9LIRImJ+w0CEFacumqO6dC2aXN/ozmNuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862237; c=relaxed/simple;
	bh=SdCVxK7C2zh1JDJWOU/6rtO/fWRu3N4eOLYV1KOj4Ng=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFu9lcGJtt5xzU/5Zrj85Bm2OUSqTn8/iRcKH5UxmHjpV9Q3mVUqjMK1Sb5E+kN29EPQZqUPitjlItWT6D7IQ9XoOls71fYzKXx1Jt5bCf2N+LXaEpBQouCEbI/MSpFMf5f8gfjR18PtNvd7r6vZzsvFH7ztkgVanNERZ3Dme/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jj4jR+BV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7546C2BCB1
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 09:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774862237;
	bh=SdCVxK7C2zh1JDJWOU/6rtO/fWRu3N4eOLYV1KOj4Ng=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jj4jR+BVInguFoTV7MtnOASydpFYpl/Xx6Y63sgGGTUDFNq91lZwWDZZCQB5JDMK2
	 qKl3tqKbL+CIucruvIbuy8y3iY51Ool+p0dBIHsMjWcw1Kl+bDciDjGYDxoz5V0XcM
	 C96otm3hH7GchS3eET3oWHdp0vC5HnJIfE6SfCSiEoJGcnyI2BBK19Rrs0Swxowz8d
	 lUqb0TWIckR7pRRBRFzEpaOsoqaBcUA1Ko3el/PiWeAcSkZ893qpPPNQL07E/q7++t
	 fLPnTsaw5nKHZgxdSbFfUc+22FRjfhO6X2yTBsUugMjpj4zoVe138DSVnfG2z9WCFV
	 K1MwIPGoXgnkQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59dea72099eso5189544e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 02:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEz5xeD/FXS6VPqGsegziK3EDG5KgY4gVe9X4UtW2XTlOogK5tXrF856vcjrmRfHknBGdc1I2HDxoK@vger.kernel.org
X-Gm-Message-State: AOJu0YyTW6CKLE43PkStdZ7wxVCzidJdDwSE7pbeYqMG24GvMuMaItli
	YFC3shjdp2sU/tXRebVxCdJeiDXJoy5KY6EZnj3EI6O8qKaXx8MVgHUJDLgzwbHUstInyrSWcqH
	mp3X7D50c77A2rSv1t34VMc08WR8HNJOvlE5s9QTapQ==
X-Received: by 2002:a05:6512:6d1:b0:5a2:836a:ca47 with SMTP id
 2adb3069b0e04-5a2ab91c8c5mr4317077e87.20.1774862236403; Mon, 30 Mar 2026
 02:17:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:17:15 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 05:17:15 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260329-ti-ads7950-facelift-v4-3-c568c508c49a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com> <20260329-ti-ads7950-facelift-v4-3-c568c508c49a@gmail.com>
Date: Mon, 30 Mar 2026 05:17:15 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfzMMQjFOyH2pmiZFhxWKT66_4e33Ft-czAkOuQOBN-kQ@mail.gmail.com>
X-Gm-Features: AQROBzBQgmOrpeKQUmgv6XRJpHzET1v9zV_A_IU2sFR7N2AClUW4J5UDE5PsDRc
Message-ID: <CAMRc=MfzMMQjFOyH2pmiZFhxWKT66_4e33Ft-czAkOuQOBN-kQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] iio: adc: ti-ads7950: switch to using devm_regulator_get_enable_read_voltage()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34417-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:email,qualcomm.com:email];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 32759358291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 00:47:08 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> The regulator is enabled for the entire time the driver is bound to the
> device, and we only need to access it to fetch voltage, which can be
> done at probe time.
>
> Switch to using devm_regulator_get_enable_read_voltage() which

These multi-function helpers are getting out of control. :)

> simplifies probing and unbinding code.
>
> Suggested-by: David Lechner <dlechner@baylibre.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

