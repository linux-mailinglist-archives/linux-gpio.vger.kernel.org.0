Return-Path: <linux-gpio+bounces-39788-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2M16M1VWUGrrwwIAu9opvQ
	(envelope-from <linux-gpio+bounces-39788-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 04:17:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 680607369F7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 04:17:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=d6O8wvXV;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39788-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39788-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 801FD303AAA8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 02:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFBC291C10;
	Fri, 10 Jul 2026 02:16:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C8223328;
	Fri, 10 Jul 2026 02:16:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783649817; cv=none; b=CJhleytvv8rp9c2mpsg55ANaMDWbOEDU3fPaK9xbA9PBX8senVcxID7bdUKuyla3k3+BsbGltoVlB0e6DxV1fErSUBGHe2cy5tVW7lEO61Rn8sBUqnoY+PZQcX0GLoxvWnxFcLbFL8RkrFXyhoBWe8WUQE3P/PsHad/SN5TyS+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783649817; c=relaxed/simple;
	bh=D/dN7LGqtP9647f0RQhBpO302dnD/skTciVXeHx//Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMIlMP52FctXDcobf+V5mRfvVsOuhDIyElQgEIMni//rp2zezyjH2ZUkSOSljck30x5gWJ4nQg1pk8XnoMQXLY/Mz/fAs+a6uGr3cQq+baaMVSn+HgRysQVTCn2b2DrX6yoy/WpG7RGoogWAEz1zsc20SRTGZyEd/SQLUlpD/jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6O8wvXV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3DA1F000E9;
	Fri, 10 Jul 2026 02:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783649815;
	bh=IGrOD0HuFaYY0Hyc+KEXUarnR1BmY8m/LQ1T4cO+tPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=d6O8wvXVU7uKNVVmrYKrHopvGZb29W5jTvjU/HPyWEOPtx3icE6BVSG+S6rGWofdj
	 qqj2l2Z8KXUHmaOAEZeQbD34Vd76o3npxQSmOBdk4/gyNbn8gJDhqdlxyq33xYodAY
	 Hhf6IQKcs/964iHDVlNj71ONwyZNfHv/nViRpHftfNCDDuUFBO8bxGZ1hzEmIf+DGv
	 84NBASMFkZ4yjHhxjOT1UVT47NgL/NxBlFSjgVO/RYdgGdptaFMAP7yq8tTcgDenp3
	 mNwLZ3Qgr8wLe7BB5hj2fQHTTXZ8AWehSk3lZmT+rzWpth8ds5QFcRa2Fs3vpDb1jZ
	 DwWEQ0r7yzrYg==
Date: Fri, 10 Jul 2026 03:16:49 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, <linux@analog.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <jananisunil.dev@gmail.com>
Subject: Re: [PATCH 6/6] Documentation: iio: Add AD7768 Documentation
Message-ID: <20260710031649.48311368@jic23-huawei>
In-Reply-To: <20260709-ad7768-driver-v1-6-44e1194fd96a@analog.com>
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
	<20260709-ad7768-driver-v1-6-44e1194fd96a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39788-lists,linux-gpio=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:janani.sunil@analog.com,m:nuno.sa@analog.com,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:olivier.moysan@foss.st.com,m:p.zabel@pengutronix.de,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@analog.com,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:jananisunil.dev@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:jananisunildev@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[analog.com,baylibre.com,kernel.org,foss.st.com,pengutronix.de,lwn.net,linuxfoundation.org,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,analog.com:url,analog.com:email,jic23-huawei:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 680607369F7

On Thu, 9 Jul 2026 10:50:17 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add driver documentation for AD7768
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  Documentation/iio/ad7768.rst | 207 +++++++++++++++++++++++++++++++++++++++++++
>  Documentation/iio/index.rst  |   1 +
>  MAINTAINERS                  |   1 +
>  3 files changed, 209 insertions(+)
> 
> diff --git a/Documentation/iio/ad7768.rst b/Documentation/iio/ad7768.rst
> new file mode 100644
> index 000000000000..438e33d4f375
> --- /dev/null
> +++ b/Documentation/iio/ad7768.rst
> @@ -0,0 +1,207 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=============
> +AD7768 driver
> +=============
> +
> +ADC driver for Analog Devices Inc. AD7768 and AD7768-4 devices. The module name
> +is ``ad7768``.
> +
> +Supported devices
> +=================
> +
> +The following chips are supported by this driver:
> +
> +* `AD7768 <https://www.analog.com/en/products/ad7768.html>`_ - 8-channel, 24-bit simultaneous sampling ADC
> +* `AD7768-4 <https://www.analog.com/en/products/ad7768-4.html>`_ - 4-channel, 24-bit simultaneous sampling ADC

Too long. Wrap those.  In general keep to 80 chars for docs
unless you are breaking up some thing greppable like a file name.


> +
> +Supported features
> +==================
> +
> +Power modes
> +-----------
> +
> +The AD7768 family supports three configurable power and performance modes:
> +
> +* **Low power mode** - Optimized for lowest power consumption
> +* **Median mode** - Balanced power and performance
> +* **Fast mode** - Highest performance with maximum sampling rates
> +
> +The power mode affects the available sampling frequencies and power consumption.
> +Set via the ``adi,power-mode`` device tree property.

Control it from the sampling frequency probably as David suggested.

> +
> +Per-channel calibration
> +-----------------------
> +
> ++---------------------------------------+--------------------------------------------------------------+
> +| Attribute                             | Description                                                  |
> ++=======================================+==============================================================+
> +| ``in_voltage<N>_calibbias``           | Channel offset calibration value                             |
> ++---------------------------------------+--------------------------------------------------------------+
> +| ``in_voltage<N>_calibscale``          | Channel gain calibration value                               |
> ++---------------------------------------+--------------------------------------------------------------+
> +| ``in_voltage<N>_phase``               | Channel phase calibration value.                             |
Be consistent on .

Also does this mean the phase offset is a tweak, or do we know the scaling?

> ++---------------------------------------+--------------------------------------------------------------+
> +

