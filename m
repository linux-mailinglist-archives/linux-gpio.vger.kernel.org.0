Return-Path: <linux-gpio+bounces-34010-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHjGIV8UwWnkQQQAu9opvQ
	(envelope-from <linux-gpio+bounces-34010-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:22:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30D2EFEF5
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 11:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 143F6301E78C
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 10:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B282138645A;
	Mon, 23 Mar 2026 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym3E1WEs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E54035F169
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261253; cv=none; b=sumq5s/e2kLSFm6wf2DWmZHgUJWaxJgfbKJnaKos6xAD0OhT0QLsclbAwha08Kndr9Fm7MOxR6VApnP4XWJPMVKNi2c60iEb3GGGkl6+TsDuLeFR1jm2+KuQC2ex3ndNX2FzTt2Pg1axh6twYfIf8d8D+jKYoA7APD7cmlZERWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261253; c=relaxed/simple;
	bh=Oe5UeypWpfgsYp1wLj1DA0+qruK9L/Xc9BhBftn7bnI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VLapGk+IQIsII4+gSjLe5JyauozOj2l3HZORVM0sp6kU4Ibkj1BkFi71zFb5O1sJ840YJQyIRObMFiDhrmAPjPI6F1N76Nwsq4v1PgTojVg3A86/UoN+ZnEVMfoVKjJYV69i1EKXDzu1EtLpSI4vFWK41xhJfpfAGtQEmWEsUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym3E1WEs; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48538c5956bso36907505e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 03:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261247; x=1774866047; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RVfXFDSVP1vLDhk1KVILOy0EiIZntidzuJw+74rAjUQ=;
        b=Ym3E1WEsTHVyV0I/a65OlFveXypyEEMmwTwUuawcC/OifKdZXdjHm+kitvPQom3/oK
         3Pnsupkumv/Xr5CqTZJI+WQeHe1LaxRvNIrLWvKKFhj/vE67wd4ILIH7K+i7AFVtpFLs
         aitVdt6qS1Y103K/SFPlKpgpjIuvHYViyDi02gSt9SOW3gVvNwpacvNoCj+kGnKxoNGj
         9tamGX1GUWpHnx/vJsIrQmrni+i6yvqHDLj+c8UA9bAFlznhJO8pSs3I9KW8S/4ADH1h
         L/xMug+ICcVsznt2prL242fqsfBDXrJ0DyCKmFTAwmOEsJod2DDpok34ZniBbPUNR8he
         JFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261247; x=1774866047;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVfXFDSVP1vLDhk1KVILOy0EiIZntidzuJw+74rAjUQ=;
        b=m52MudhAMeETAFNaR0uh3FD58D4GpDI4syQBCfmEClKx1zT3jWqQFI7WP1fnm1Vc1K
         9GssAe875KBG44BUYZxEqk69PL2YqKkjx+MYAAEzRu9PpDpdwEDJhB2j6OSUG3T+7nN+
         goDPT4w7GPJt/IyGYo26QqthJu1Yq6H4BdG7j9+cdK2OEdNxdem6qRWpnLJ8or1VaFSH
         mAwW6pTm1wDCDJTAlW/SBpgto21gLEjY/y/oI5vw6xc3gGhGGY9NdHnUsIfytpERJC+X
         NuK0YjF6uJwO8AvSBWczdzVG9OGAIxTdLyWX+jK0ODwclINGix9luZznWApQohgLO0tn
         FTHA==
X-Gm-Message-State: AOJu0YwIjBeEm7m6BT4CA38XORzAwyqUuV+ECHp1lO17NV0BBrYVtXyR
	Usjw5gU3QeRvbFUnCjHsYgw6TrxllXsQ4zH0jKZgx8lLxAtw2KGHBJQY
X-Gm-Gg: ATEYQzwdb1PDkD6WxE9VV+l3/Xi5eIPznsKcvj5e3RoTZfZSbpFinyPgan5Mhs8EHmH
	+ezaYfuPaktvl3PtsTE/s5hkmIgAMQ6Qj5HzmEvo++RIGSVLI2xF59zN9zU9wJZgEPHe3EA5u5n
	logcuDs48E2KpSqCiV78PIac/nMI7iXEyrrtCXkbCOQhwkr/VyPwRXT9T7xeHlZZPEHMWLOiZxv
	BKbBLBJ35s1SYX7zxAjEZl3i3mTzwGh+VzodF8g8pe/kwxdTBYYB64u6jyMJYPAyevaf8vsP12T
	Ua5ydV6oCnKAdetmEJEI0sdLnxexKSFvY/HCVBn+7RbAadLxnU4R2/QIZ59No8SWbynEXH00ROH
	ngIkavfERtuRkuc7lz8lr6WYtomObFj6t2hV/HwhOurppwYkhIX9wp8ABCF+IG30V6RXbvMM4up
	AebPpJLeEzmee9FkIP7qQciDZUsv1Tadg=
X-Received: by 2002:a05:600c:3105:b0:485:3c11:de84 with SMTP id 5b1f17b1804b1-486fe8f08cbmr169317645e9.14.1774261245970;
        Mon, 23 Mar 2026 03:20:45 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7d6c54sm623642425e9.4.2026.03.23.03.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:20:45 -0700 (PDT)
Message-ID: <f3bb0c7417352e2057e1fa34d3dc737ff1fd5083.camel@gmail.com>
Subject: Re: [PATCH v7 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	 <skhan@linuxfoundation.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Date: Mon, 23 Mar 2026 10:21:31 +0000
In-Reply-To: <69e4e158-bd91-4df6-906c-a64f10408ae9@roeck-us.net>
References: <20260314-ltc4283-support-v7-0-1cda48e93802@analog.com>
	 <20260314-ltc4283-support-v7-2-1cda48e93802@analog.com>
	 <69e4e158-bd91-4df6-906c-a64f10408ae9@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34010-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,analog.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F30D2EFEF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-17 at 18:17 -0700, Guenter Roeck wrote:
> On Sat, Mar 14, 2026 at 10:52:20AM +0000, Nuno S=C3=A1 wrote:
> > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > Support the LTC4283 Hot Swap Controller. The device features programmab=
le
> > current limit with foldback and independently adjustable inrush current=
 to
> > optimize the MOSFET safe operating area (SOA). The SOA timer limits MOS=
FET
> > temperature rise for reliable protection against overstresses.
> >=20
> > An I2C interface and onboard ADC allow monitoring of board current,
> > voltage, power, energy, and fault status.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > ---
> > =C2=A0Documentation/hwmon/index.rst=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0Documentation/hwmon/ltc4283.rst |=C2=A0 266 ++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
> > =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 +
> > =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0drivers/hwmon/ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1787 +++++++++++++++++++++++++++++++++++++++
> > =C2=A06 files changed, 2068 insertions(+)
> >=20
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.=
rst
> > index 559c32344cd38a9b5bf01a0b7570213f5ae1ab8b..eab95152abee0ae87acd9d0=
1dab005200d80e924 100644
> > --- a/Documentation/hwmon/index.rst
> > +++ b/Documentation/hwmon/index.rst
> > @@ -144,6 +144,7 @@ Hardware Monitoring Kernel Drivers
> > =C2=A0=C2=A0=C2=A0 ltc4260
> > =C2=A0=C2=A0=C2=A0 ltc4261
> > =C2=A0=C2=A0=C2=A0 ltc4282
> > +=C2=A0=C2=A0 ltc4283
> > =C2=A0=C2=A0=C2=A0 ltc4286
> > =C2=A0=C2=A0=C2=A0 macsmc-hwmon
> > =C2=A0=C2=A0=C2=A0 max127
> > diff --git a/Documentation/hwmon/ltc4283.rst b/Documentation/hwmon/ltc4=
283.rst
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ba88445e45f4c2918a3c7f9=
9a4b54efe69d4d048
> > --- /dev/null
> > +++ b/Documentation/hwmon/ltc4283.rst
> > @@ -0,0 +1,266 @@
> > +.. SPDX-License-Identifier: GPL-2.0-only
> > +
> > +Kernel drivers ltc4283
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Supported chips:
> > +
> > +=C2=A0 * Analog Devices LTC4283
> > +
> > +=C2=A0=C2=A0=C2=A0 Prefix: 'ltc4283'
> > +
> > +=C2=A0=C2=A0=C2=A0 Addresses scanned: -
> > +
> > +=C2=A0=C2=A0=C2=A0 Datasheet:
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://www.analog.com/medi=
a/en/technical-documentation/data-sheets/ltc4283.pdf
> > +
> > +Author: Nuno S=C3=A1 <nuno.sa@analog.com>
> > +
> > +Description
> > +___________
> > +
> > +The LTC4283 negative voltage hot swap controller drives an external N-=
channel
> > +MOSFET to allow a board to be safely inserted and removed from a live =
backplane.
> > +The device features programmable current limit with foldback and indep=
endently
> > +adjustable inrush current to optimize the MOSFET safe operating area (=
SOA). The
> > +SOA timer limits MOSFET temperature rise for reliable protection again=
st
> > +overstresses. An I2C interface and onboard gear-shift ADC allow monito=
ring of
> > +board current, voltage, power, energy, and fault status.=C2=A0 Additio=
nal features
> > +respond to input UV/OV, interrupt the host when a fault has occurred, =
notify
> > +when output power is good, detect insertion of a board, turn off the M=
OSFET
> > +if an external supply monitor fails to indicate power good within a ti=
meout
> > +period, and auto-reboot after a programmable delay following a host co=
mmanded
> > +turn-off.
> > +
> > +Sysfs entries
> > +_____________
> > +
> > +The following attributes are supported. Limits are read-write and all =
the other
> > +attributes are read-only. Note that the VADIOx channels might not be a=
vailable
> > +if the ADIO pins are used as GPIOs (naturally also affects the respect=
ive
> > +differential channels).
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +in0_lcrit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Critic=
al Undervoltage alarm
> > +in0_crit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C=
ritical Overvoltage alarm
> > +in0_label		Channel label (VIN)
> > +
> > +in1_input		Output voltage (mV).
> > +in1_min			Undervoltage threshold
> > +in1_max			Overvoltage threshold
> > +in1_lowest		Lowest measured voltage
> > +in1_highest		Highest measured voltage
> > +in1_reset_history	Write 1 to reset history.
> > +in1_min_alarm		Undervoltage alarm
> > +in1_max_alarm		Overvoltage alarm
> > +in1_label		Channel label (VPWR)
> > +
> > +in2_input		Output voltage (mV).
> > +in2_min			Undervoltage threshold
> > +in2_max			Overvoltage threshold
> > +in2_lowest		Lowest measured voltage
> > +in2_highest		Highest measured voltage
> > +in2_reset_history	Write 1 to reset history.
> > +in2_min_alarm		Undervoltage alarm
> > +in2_max_alarm		Overvoltage alarm
> > +in2_enable		Enable/Disable monitoring.
> > +in2_label		Channel label (VADI1)
> > +
> > +in3_input		Output voltage (mV).
> > +in3_min			Undervoltage threshold
> > +in3_max			Overvoltage threshold
> > +in3_lowest		Lowest measured voltage
> > +in3_highest		Highest measured voltage
> > +in3_reset_history	Write 1 to reset history.
> > +in3_min_alarm		Undervoltage alarm
> > +in3_max_alarm		Overvoltage alarm
> > +in3_enable		Enable/Disable monitoring.
> > +in3_label		Channel label (VADI2)
> > +
> > +in4_input		Output voltage (mV).
> > +in4_min			Undervoltage threshold
> > +in4_max			Overvoltage threshold
> > +in4_lowest		Lowest measured voltage
> > +in4_highest		Highest measured voltage
> > +in4_reset_history	Write 1 to reset history.
> > +in4_min_alarm		Undervoltage alarm
> > +in4_max_alarm		Overvoltage alarm
> > +in4_enable		Enable/Disable monitoring.
> > +in4_label		Channel label (VADI3)
> > +
> > +in5_input		Output voltage (mV).
> > +in5_min			Undervoltage threshold
> > +in5_max			Overvoltage threshold
> > +in5_lowest		Lowest measured voltage
> > +in5_highest		Highest measured voltage
> > +in5_reset_history	Write 1 to reset history.
> > +in5_min_alarm		Undervoltage alarm
> > +in5_max_alarm		Overvoltage alarm
> > +in5_enable		Enable/Disable monitoring.
> > +in5_label		Channel label (VADI4)
> > +
> > +in6_input		Output voltage (mV).
> > +in6_min			Undervoltage threshold
> > +in6_max			Overvoltage threshold
> > +in6_lowest		Lowest measured voltage
> > +in6_highest		Highest measured voltage
> > +in6_reset_history	Write 1 to reset history.
> > +in6_min_alarm		Undervoltage alarm
> > +in6_max_alarm		Overvoltage alarm
> > +in6_enable		Enable/Disable monitoring.
> > +in6_label		Channel label (VADIO1)
> > +
> > +in7_input		Output voltage (mV).
> > +in7_min			Undervoltage threshold
> > +in7_max			Overvoltage threshold
> > +in7_lowest		Lowest measured voltage
> > +in7_highest		Highest measured voltage
> > +in7_reset_history	Write 1 to reset history.
> > +in7_min_alarm		Undervoltage alarm
> > +in7_max_alarm		Overvoltage alarm
> > +in7_enable		Enable/Disable monitoring.
> > +in7_label		Channel label (VADIO2)
> > +
> > +in8_input		Output voltage (mV).
> > +in8_min			Undervoltage threshold
> > +in8_max			Overvoltage threshold
> > +in8_lowest		Lowest measured voltage
> > +in8_highest		Highest measured voltage
> > +in8_reset_history	Write 1 to reset history.
> > +in8_min_alarm		Undervoltage alarm
> > +in8_max_alarm		Overvoltage alarm
> > +in8_enable		Enable/Disable monitoring.
> > +in8_label		Channel label (VADIO3)
> > +
> > +in9_input		Output voltage (mV).
> > +in9_min			Undervoltage threshold
> > +in9_max			Overvoltage threshold
> > +in9_lowest		Lowest measured voltage
> > +in9_highest		Highest measured voltage
> > +in9_reset_history	Write 1 to reset history.
> > +in9_min_alarm		Undervoltage alarm
> > +in9_max_alarm		Overvoltage alarm
> > +in9_enable		Enable/Disable monitoring.
> > +in9_label		Channel label (VADIO4)
> > +
> > +in10_input		Output voltage (mV).
> > +in10_min		Undervoltage threshold
> > +in10_max		Overvoltage threshold
> > +in10_lowest		Lowest measured voltage
> > +in10_highest		Highest measured voltage
> > +in10_reset_history	Write 1 to reset history.
> > +in10_min_alarm		Undervoltage alarm
> > +in10_max_alarm		Overvoltage alarm
> > +in10_enable		Enable/Disable monitoring.
> > +in10_label		Channel label (DRNS)
> > +
> > +in11_input		Output voltage (mV).
> > +in11_min		Undervoltage threshold
> > +in11_max		Overvoltage threshold
> > +in11_lowest		Lowest measured voltage
> > +in11_highest		Highest measured voltage
> > +in11_reset_history	Write 1 to reset history.
> > +			Also clears fet bad and short fault logs.
> > +in11_min_alarm		Undervoltage alarm
> > +in11_max_alarm		Overvoltage alarm
> > +in11_enable		Enable/Disable monitoring
> > +in11_fault		Failure in the MOSFET. Either bad or shorted FET.
> > +in11_label		Channel label (DRAIN)
> > +
> > +in12_input		Output voltage (mV).
> > +in12_min		Undervoltage threshold
> > +in12_max		Overvoltage threshold
> > +in12_lowest		Lowest measured voltage
> > +in12_highest		Highest measured voltage
> > +in12_reset_history	Write 1 to reset history.
> > +in12_min_alarm		Undervoltage alarm
> > +in12_max_alarm		Overvoltage alarm
> > +in12_enable		Enable/Disable monitoring.
> > +in12_label		Channel label (ADIN2-ADIN1)
> > +
> > +in13_input		Output voltage (mV).
> > +in13_min		Undervoltage threshold
> > +in13_max		Overvoltage threshold
> > +in13_lowest		Lowest measured voltage
> > +in13_highest		Highest measured voltage
> > +in13_reset_history	Write 1 to reset history.
> > +in13_min_alarm		Undervoltage alarm
> > +in13_max_alarm		Overvoltage alarm
> > +in13_enable		Enable/Disable monitoring.
> > +in13_label		Channel label (ADIN4-ADIN3)
> > +
> > +in14_input		Output voltage (mV).
> > +in14_min		Undervoltage threshold
> > +in14_max		Overvoltage threshold
> > +in14_lowest		Lowest measured voltage
> > +in14_highest		Highest measured voltage
> > +in14_reset_history	Write 1 to reset history.
> > +in14_min_alarm		Undervoltage alarm
> > +in14_max_alarm		Overvoltage alarm
> > +in14_enable		Enable/Disable monitoring.
> > +in14_label		Channel label (ADIO2-ADIO1)
> > +
> > +in15_input		Output voltage (mV).
> > +in15_min		Undervoltage threshold
> > +in15_max		Overvoltage threshold
> > +in15_lowest		Lowest measured voltage
> > +in15_highest		Highest measured voltage
> > +in15_reset_history	Write 1 to reset history.
> > +in15_min_alarm		Undervoltage alarm
> > +in15_max_alarm		Overvoltage alarm
> > +in15_enable		Enable/Disable monitoring.
> > +in15_label		Channel label (ADIO4-ADIO3)
> > +
> > +curr1_input		Sense current (mA)
> > +curr1_min		Undercurrent threshold
> > +curr1_max		Overcurrent threshold
> > +curr1_lowest		Lowest measured current
> > +curr1_highest		Highest measured current
> > +curr1_reset_history	Write 1 to reset curr1 history.
> > +			Also clears overcurrent fault logs.
> > +curr1_min_alarm		Undercurrent alarm
> > +curr1_max_alarm		Overcurrent alarm
> > +curr1_crit_alarm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Critical Ov=
ercurrent alarm
> > +curr1_label		Channel label (ISENSE)
> > +
> > +power1_input		Power (in uW)
> > +power1_min		Low power threshold
> > +power1_max		High power threshold
> > +power1_input_lowest	Historical minimum power use
> > +power1_input_highest	Historical maximum power use
> > +power1_reset_history	Write 1 to reset power1 history.
> > +			Also clears power fault logs.
> > +power1_min_alarm	Low power alarm
> > +power1_max_alarm	High power alarm
> > +power1_label		Channel label (Power)
> > +
> > +energy1_input		Measured energy over time (in microJoule)
> > +energy1_enable		Enable/Disable Energy accumulation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +DebugFs entries
> > +_______________
> > +
> > +The chip also has a fault log register where failures can be logged. H=
ence,
> > +as these are logging events, we give access to them in debugfs. Note t=
hat
> > +even if some failure is detected in these logs, it does necessarily me=
an
> > +that the failure is still present. As mentioned in the proper Sysfs en=
tries,
> > +these logs can be cleared by writing in the proper reset_history attri=
bute.
> > +
> > +.. warning:: The debugfs interface is subject to change without notice
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 and is only available when the kernel is compiled with
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ``CONFIG_DEBUG_FS`` defined.
> > +
> > +``/sys/kernel/debug/i2c/i2c-[X]/[X]-addr/``
> > +contains the following attributes:
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +power1_failed_fault_log		Set to 1 by a power1 fault occurring.
> > +power1_good_input_fault_log	Set to 1 by a power1 good input fault occu=
rring at PGIO3.
> > +in11_fet_short_fault_log	Set to 1 when a FET-short fault occurs.
> > +in11_fet_bad_fault_log		Set to 1 when a FET-BAD fault occurs.
> > +in0_lcrit_fault_log		Set to 1 by a VIN undervoltage fault occurring.
> > +in0_crit_fault_log		Set to 1 by a VIN overvoltage fault occurring.
> > +curr1_crit_fault_log		Set to 1 by an overcurrent fault occurring.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=C2=A0	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 13ae2f3db449e5fd3a7d0fbac92aabdc01734ba9..38d22cf622b7982e157b19e=
3ecbf30a80dfbb04d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15146,6 +15146,7 @@ M:	Nuno S=C3=A1 <nuno.sa@analog.com>
> > =C2=A0L:	linux-hwmon@vger.kernel.org
> > =C2=A0S:	Supported
> > =C2=A0F:	Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> > +F:	drivers/hwmon/ltc4283.c
> > =C2=A0
> > =C2=A0LTC4286 HARDWARE MONITOR DRIVER
> > =C2=A0M:	Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index fb77baeeba27b9ec51142040beccc953df0a1e3e..99ab14726d6b559a2f8bc2a=
f5b79ecd9d0b80b87 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1157,6 +1157,18 @@ config SENSORS_LTC4282
> > =C2=A0	=C2=A0 This driver can also be built as a module. If so, the mod=
ule will
> > =C2=A0	=C2=A0 be called ltc4282.
> > =C2=A0
> > +config SENSORS_LTC4283
> > +	tristate "Analog Devices LTC4283"
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	select AUXILIARY_BUS
> > +	help
> > +	=C2=A0 If you say yes here you get support for Analog Devices LTC4283
> > +	=C2=A0 Negative Voltage Hot Swap Controller I2C interface.
> > +
> > +	=C2=A0 This driver can also be built as a module. If so, the module w=
ill
> > +	=C2=A0 be called ltc4283.
> > +
> > =C2=A0config SENSORS_LTQ_CPUTEMP
> > =C2=A0	bool "Lantiq cpu temperature sensor driver"
> > =C2=A0	depends on SOC_XWAY
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index 556e86d277b195d8c98798012f0069c78a2f37dc..cb77938dbe07ddb0c2db69f=
27ade2794139c2d01 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -147,6 +147,7 @@ obj-$(CONFIG_SENSORS_LTC4245)	+=3D ltc4245.o
> > =C2=A0obj-$(CONFIG_SENSORS_LTC4260)	+=3D ltc4260.o
> > =C2=A0obj-$(CONFIG_SENSORS_LTC4261)	+=3D ltc4261.o
> > =C2=A0obj-$(CONFIG_SENSORS_LTC4282)	+=3D ltc4282.o
> > +obj-$(CONFIG_SENSORS_LTC4283)	+=3D ltc4283.o
> > =C2=A0obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) +=3D ltq-cputemp.o
> > =C2=A0obj-$(CONFIG_SENSORS_MACSMC_HWMON)	+=3D macsmc-hwmon.o
> > =C2=A0obj-$(CONFIG_SENSORS_MAX1111)	+=3D max1111.o
> > diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..2066ff5d568fbaa75c66d1f=
75087f7eb8cfe83a2
> > --- /dev/null
> > +++ b/drivers/hwmon/ltc4283.c
> > @@ -0,0 +1,1787 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Analog Devices LTC4283 I2C Negative Voltage Hot Swap Controller (HW=
MON)
> > + *
> > + * Copyright 2025 Analog Devices Inc.
> > + */
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/bitops.h>
> > +#include <linux/bits.h>
> > +
> > +#include <linux/debugfs.h>
> > +#include <linux/device.h>
> > +#include <linux/device/devres.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/i2c.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/minmax.h>
> > +#include <linux/module.h>
> > +
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/overflow.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +#include <linux/unaligned.h>
> > +#include <linux/units.h>
> > +
> > +#define LTC4283_SYSTEM_STATUS		0x00
> > +#define LTC4283_FAULT_STATUS		0x03
> > +#define=C2=A0=C2=A0 LTC4283_OV_MASK		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_UV_MASK		BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_OC_MASK		BIT(2)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_MASK		BIT(3)
> > +#define=C2=A0=C2=A0 LTC4283_FET_SHORT_MASK	BIT(6)
> > +#define LTC4283_FAULT_LOG		0x04
> > +#define=C2=A0=C2=A0 LTC4283_OV_FAULT_MASK		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_UV_FAULT_MASK		BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_OC_FAULT_MASK		BIT(2)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_FAULT_MASK	BIT(3)
> > +#define=C2=A0=C2=A0 LTC4283_PGI_FAULT_MASK	BIT(4)
> > +#define=C2=A0=C2=A0 LTC4283_PWR_FAIL_FAULT_MASK	BIT(5)
> > +#define=C2=A0=C2=A0 LTC4283_FET_SHORT_FAULT_MASK	BIT(6)
> > +#define LTC4283_ADC_ALM_LOG_1		0x05
> > +#define=C2=A0=C2=A0 LTC4283_POWER_LOW_ALM		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_POWER_HIGH_ALM	BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_SENSE_LOW_ALM		BIT(4)
> > +#define=C2=A0=C2=A0 LTC4283_SENSE_HIGH_ALM	BIT(5)
> > +#define LTC4283_ADC_ALM_LOG_2		0x06
> > +#define LTC4283_ADC_ALM_LOG_3		0x07
> > +#define LTC4283_ADC_ALM_LOG_4		0x08
> > +#define LTC4283_ADC_ALM_LOG_5		0x09
> > +#define LTC4283_CONTROL_1		0x0a
> > +#define=C2=A0=C2=A0 LTC4283_RW_PAGE_MASK		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_PIGIO2_ACLB_MASK	BIT(2)
> > +#define=C2=A0=C2=A0 LTC4283_PWRGD_RST_CTRL_MASK	BIT(3)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_OFF_MASK	BIT(4)
> > +#define=C2=A0=C2=A0 LTC4283_THERM_TMR_MASK	BIT(5)
> > +#define=C2=A0=C2=A0 LTC4283_DVDT_MASK		BIT(6)
> > +#define LTC4283_CONTROL_2		0x0b
> > +#define=C2=A0=C2=A0 LTC4283_OV_RETRY_MASK		BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_UV_RETRY_MASK		BIT(1)
> > +#define=C2=A0=C2=A0 LTC4283_OC_RETRY_MASK		GENMASK(3, 2)
> > +#define=C2=A0=C2=A0 LTC4283_FET_BAD_RETRY_MASK	GENMASK(5, 4)
> > +#define=C2=A0=C2=A0 LTC4283_EXT_FAULT_RETRY_MASK	BIT(7)
> > +#define LTC4283_RESERVED_OC		0x0c
> > +#define LTC4283_CONFIG_1		0x0d
> > +#define=C2=A0=C2=A0 LTC4283_FB_MASK		GENMASK(3, 2)
> > +#define=C2=A0=C2=A0 LTC4283_ILIM_MASK		GENMASK(7, 4)
> > +#define LTC4283_CONFIG_2		0x0e
> > +#define=C2=A0=C2=A0 LTC4283_COOLING_DL_MASK	GENMASK(3, 1)
> > +#define=C2=A0=C2=A0 LTC4283_FTBD_DL_MASK		GENMASK(5, 4)
> > +#define LTC4283_CONFIG_3		0x0f
> > +#define=C2=A0=C2=A0 LTC4283_VPWR_DRNS_MASK	BIT(6)
> > +#define=C2=A0=C2=A0 LTC4283_EXTFLT_TURN_OFF_MASK	BIT(7)
> > +#define LTC4283_PGIO_CONFIG		0x10
> > +#define=C2=A0=C2=A0 LTC4283_PGIO1_CFG_MASK	GENMASK(1, 0)
> > +#define=C2=A0=C2=A0 LTC4283_PGIO2_CFG_MASK	GENMASK(3, 2)
> > +#define=C2=A0=C2=A0 LTC4283_PGIO3_CFG_MASK	GENMASK(5, 4)
> > +#define=C2=A0=C2=A0 LTC4283_PGIO4_CFG_MASK	GENMASK(7, 6)
> > +#define LTC4283_PGIO_CONFIG_2		0x11
> > +#define=C2=A0=C2=A0 LTC4283_ADC_MASK		GENMASK(2, 0)
> > +#define LTC4283_ADC_SELECT(c)		(0x13 + (c) / 8)
> > +#define=C2=A0=C2=A0 LTC4283_ADC_SELECT_MASK(c)	BIT((c) % 8)
> > +#define LTC4283_SENSE_MIN_TH		0x1b
> > +#define LTC4283_SENSE_MAX_TH		0x1c
> > +#define LTC4283_VPWR_MIN_TH		0x1d
> > +#define LTC4283_VPWR_MAX_TH		0x1e
> > +#define LTC4283_POWER_MIN_TH		0x1f
> > +#define LTC4283_POWER_MAX_TH		0x20
> > +#define LTC4283_ADC_2_MIN_TH(c)		(0x21 + (c) * 2)
> > +#define LTC4283_ADC_2_MAX_TH(c)		(0x22 + (c) * 2)
> > +#define LTC4283_ADC_2_MIN_TH_DIFF(c)	(0x39 + (c) * 2)
> > +#define LTC4283_ADC_2_MAX_TH_DIFF(c)	(0x3a + (c) * 2)
> > +#define LTC4283_SENSE			0x41
> > +#define LTC4283_SENSE_MIN		0x42
> > +#define LTC4283_SENSE_MAX		0x43
> > +#define LTC4283_VPWR			0x44
> > +#define LTC4283_VPWR_MIN		0x45
> > +#define LTC4283_VPWR_MAX		0x46
> > +#define LTC4283_POWER			0x47
> > +#define LTC4283_POWER_MIN		0x48
> > +#define LTC4283_POWER_MAX		0x49
> > +#define LTC4283_RESERVED_68		0x68
> > +#define LTC4283_RESERVED_6D		0x6D
> > +/* get channels from ADC 2 */
> > +#define LTC4283_ADC_2(c)		(0x4a + (c) * 3)
> > +#define LTC4283_ADC_2_MIN(c)		(0x4b + (c) * 3)
> > +#define LTC4283_ADC_2_MAX(c)		(0x4c + (c) * 3)
> > +#define LTC4283_ADC_2_DIFF(c)		(0x6e + (c) * 3)
> > +#define LTC4283_ADC_2_MIN_DIFF(c)	(0x6f + (c) * 3)
> > +#define LTC4283_ADC_2_MAX_DIFF(c)	(0x70 + (c) * 3)
> > +#define LTC4283_ENERGY			0x7a
> > +#define LTC4283_METER_CONTROL		0x84
> > +#define=C2=A0=C2=A0 LTC4283_INTEGRATE_I_MASK	BIT(0)
> > +#define=C2=A0=C2=A0 LTC4283_METER_HALT_MASK	BIT(6)
> > +#define LTC4283_RESERVED_86		0x86
> > +#define LTC4283_RESERVED_8F		0x8F
> > +#define LTC4283_FAULT_LOG_CTRL		0x90
> > +#define=C2=A0=C2=A0 LTC4283_FAULT_LOG_EN_MASK	BIT(7)
> > +#define LTC4283_RESERVED_91		0x91
> > +#define LTC4283_RESERVED_A1		0xA1
> > +#define LTC4283_RESERVED_A3		0xA3
> > +#define LTC4283_RESERVED_AC		0xAC
> > +#define LTC4283_POWER_PLAY_MSB		0xE7
> > +#define LTC4283_POWER_PLAY_LSB		0xE8
> > +#define LTC4283_RESERVED_F1		0xF1
> > +#define LTC4283_RESERVED_FF		0xFF
> > +
> > +/* also applies for differential channels */
> > +#define LTC4283_ADC1_FS_uV		32768
> > +#define LTC4283_ADC2_FS_mV		2048
> > +#define LTC4283_TCONV_uS		64103
> > +#define LTC4283_VILIM_MIN_uV		15000
> > +#define LTC4283_VILIM_MAX_uV		30000
> > +#define LTC4283_VILIM_RANGE	\
> > +	(LTC4283_VILIM_MAX_uV - LTC4283_VILIM_MIN_uV + 1)
> > +
> > +#define LTC4283_PGIO_FUNC_GPIO		2
> > +#define LTC4283_PGIO2_FUNC_ACLB		3
> > +
> > +/* voltage channels */
> > +enum {
> > +	LTC4283_CHAN_VIN,
> > +	LTC4283_CHAN_VPWR,
> > +	LTC4283_CHAN_ADI_1,
> > +	LTC4283_CHAN_ADI_2,
> > +	LTC4283_CHAN_ADI_3,
> > +	LTC4283_CHAN_ADI_4,
> > +	LTC4283_CHAN_ADIO_1,
> > +	LTC4283_CHAN_ADIO_2,
> > +	LTC4283_CHAN_ADIO_3,
> > +	LTC4283_CHAN_ADIO_4,
> > +	LTC4283_CHAN_DRNS,
> > +	LTC4283_CHAN_DRAIN,
> > +	/* differential channels */
> > +	LTC4283_CHAN_ADIN12,
> > +	LTC4283_CHAN_ADIN34,
> > +	LTC4283_CHAN_ADIO12,
> > +	LTC4283_CHAN_ADIO34,
> > +	LTC4283_CHAN_MAX
> > +};
> > +
> > +/* Just for ease of use on the regmap=C2=A0 */
> > +#define LTC4283_ADIO34_MAX \
> > +	LTC4283_ADC_2_MAX_DIFF(LTC4283_CHAN_ADIO34 - LTC4283_CHAN_ADIN12)
> > +
> > +struct ltc4283_hwmon {
> > +	struct regmap *map;
> > +	struct i2c_client *client;
> > +	unsigned long gpio_mask;
> > +	unsigned long ch_enable_mask;
> > +	/* in microwatt */
> > +	long power_max;
> > +	/* in millivolt */
> > +	u32 vsense_max;
> > +	/* in tenths of microohm*/
> > +	u32 rsense;
> > +	bool energy_en;
> > +	bool ext_fault;
> > +};
> > +
> > +static int ltc4283_read_voltage_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> > +{
> > +	unsigned int __raw;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &__raw);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(__raw * fs, BIT(16));
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_voltage_byte(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 reg, u32 fs, long *val)
> > +{
> > +	int ret;
> > +	u32 in;
> > +
> > +	ret =3D regmap_read(st->map, reg, &in);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(in * fs, BIT(8));
> > +	return 0;
> > +}
> > +
> > +static u32 ltc4283_in_reg(u32 attr, u32 channel)
> > +{
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRA=
IN)
> > +			return LTC4283_ADC_2(channel - LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	case hwmon_in_highest:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MAX;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRA=
IN)
> > +			return LTC4283_ADC_2_MAX(channel - LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MAX_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	case hwmon_in_lowest:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MIN;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRA=
IN)
> > +			return LTC4283_ADC_2_MIN(channel - LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MIN_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	case hwmon_in_max:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MAX_TH;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRA=
IN)
> > +			return LTC4283_ADC_2_MAX_TH(channel - LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MAX_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	default:
> > +		if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +			return LTC4283_VPWR_MIN_TH;
> > +		if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRA=
IN)
> > +			return LTC4283_ADC_2_MIN_TH(channel - LTC4283_CHAN_ADI_1);
> > +		return LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	}
> > +}
> > +
> > +static int ltc4283_read_in_vals(const struct ltc4283_hwmon *st,
> > +				u32 attr, u32 channel, long *val)
> > +{
> > +	u32 reg =3D ltc4283_in_reg(attr, channel);
> > +	int ret;
> > +
> > +	if (channel < LTC4283_CHAN_ADIN12) {
> > +		if (attr !=3D hwmon_in_max && attr !=3D hwmon_in_min)
> > +			return ltc4283_read_voltage_word(st, reg,
> > +							 LTC4283_ADC2_FS_mV,
> > +							 val);
> > +
> > +		return ltc4283_read_voltage_byte(st, reg,
> > +						 LTC4283_ADC2_FS_mV, val);
> > +	}
> > +
> > +	if (attr !=3D hwmon_in_max && attr !=3D hwmon_in_min)
> > +		ret =3D ltc4283_read_voltage_word(st, reg,
> > +						LTC4283_ADC1_FS_uV, val);
> > +	else
> > +		ret =3D ltc4283_read_voltage_byte(st, reg,
> > +						LTC4283_ADC1_FS_uV, val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST(*val, MILLI);
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 mask, long *val)
> > +{
> > +	u32 alarm;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &alarm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D !!(alarm & mask);
> > +
> > +	/* If not status/fault logs, clear the alarm after reading it. */
> > +	if (reg !=3D LTC4283_FAULT_STATUS && reg !=3D LTC4283_FAULT_LOG)
> > +		return regmap_clear_bits(st->map, reg, mask);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel=
,
> > +				 bool max_alm, long *val)
> > +{
> > +	if (channel =3D=3D LTC4283_VPWR)
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 BIT(2 + max_alm), val);
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_ADI_=
4) {
> > +		u32 bit =3D (channel - LTC4283_CHAN_ADI_1) * 2;
> > +		/*
> > +		 * Lower channels go to higher bits. We also want to go +1 down
> > +		 * in the min_alarm case.
> > +		 */
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> > +					=C2=A0 BIT(7 - bit - !max_alm), val);
> > +	}
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADIO_1 && channel <=3D LTC4283_CHAN_ADI=
O_4) {
> > +		u32 bit =3D (channel - LTC4283_CHAN_ADIO_1) * 2;
> > +
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> > +					=C2=A0 BIT(7 - bit - !max_alm), val);
> > +	}
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADIN12 && channel <=3D LTC4283_CHAN_ADI=
N34) {
> > +		u32 bit =3D (channel - LTC4283_CHAN_ADIN12) * 2;
> > +
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> > +					=C2=A0 BIT(7 - bit - !max_alm), val);
> > +	}
> > +
> > +	if (channel =3D=3D LTC4283_CHAN_DRNS)
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> > +					=C2=A0 BIT(6 + max_alm), val);
> > +
> > +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm)=
,
> > +				=C2=A0 val);
> > +}
> > +
> > +static int ltc4283_read_in(struct ltc4283_hwmon *st, u32 attr, u32 cha=
nnel,
> > +			=C2=A0=C2=A0 long *val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +		if (!test_bit(channel, &st->ch_enable_mask))
> > +			return -ENODATA;
> > +
> > +		return ltc4283_read_in_vals(st, attr, channel, val);
> > +	case hwmon_in_highest:
> > +	case hwmon_in_lowest:
> > +	case hwmon_in_max:
> > +	case hwmon_in_min:
> > +		return ltc4283_read_in_vals(st, attr, channel, val);
> > +	case hwmon_in_max_alarm:
> > +		return ltc4283_read_in_alarm(st, channel, true, val);
> > +	case hwmon_in_min_alarm:
> > +		return ltc4283_read_in_alarm(st, channel, false, val);
> > +	case hwmon_in_crit_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_OV_MASK, val);
> > +	case hwmon_in_lcrit_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_UV_MASK, val);
> > +	case hwmon_in_fault:
> > +		/*
> > +		 * We report failure if we detect either a fer_bad or a
> > +		 * fet_short in the status register.
> > +		 */
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_FET_BAD_MASK | LTC4283_FET_SHORT_MASK, val);
> > +	case hwmon_in_enable:
> > +		*val =3D test_bit(channel, &st->ch_enable_mask);
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_current_word(const struct ltc4283_hwmon *st, u=
32 reg,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> > +	unsigned int __raw;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &__raw);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(__raw * temp,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT_ULL(16) * st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_current_byte(const struct ltc4283_hwmon *st, u=
32 reg,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * DECA * MILLI;
> > +	u32 curr;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &curr);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST_ULL(curr * temp, BIT(8) * st->rsense);
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_curr(struct ltc4283_hwmon *st, u32 attr, long =
*val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_curr_input:
> > +		return ltc4283_read_current_word(st, LTC4283_SENSE, val);
> > +	case hwmon_curr_highest:
> > +		return ltc4283_read_current_word(st, LTC4283_SENSE_MAX, val);
> > +	case hwmon_curr_lowest:
> > +		return ltc4283_read_current_word(st, LTC4283_SENSE_MIN, val);
> > +	case hwmon_curr_max:
> > +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MAX_TH, val);
> > +	case hwmon_curr_min:
> > +		return ltc4283_read_current_byte(st, LTC4283_SENSE_MIN_TH, val);
> > +	case hwmon_curr_max_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_SENSE_HIGH_ALM, val);
> > +	case hwmon_curr_min_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_SENSE_LOW_ALM, val);
> > +	case hwmon_curr_crit_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_FAULT_STATUS,
> > +					=C2=A0 LTC4283_OC_MASK, val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MI=
LLI;
> > +	unsigned int __raw;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &__raw);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Power is given by:
> > +	 *=C2=A0=C2=A0=C2=A0=C2=A0 P =3D CODE(16b) * 32.768mV * 2.048V / (2^1=
6 * Rsense)
> > +	 */
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->rsen=
se);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_power_byte(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long *val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MI=
LLI;
> > +	u32 power;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, reg, &power);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D DIV_ROUND_CLOSEST_ULL(power * temp, BIT(8) * st->rsense);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read_power(struct ltc4283_hwmon *st, u32 attr, long=
 *val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_input:
> > +		return ltc4283_read_power_word(st, LTC4283_POWER, val);
> > +	case hwmon_power_input_highest:
> > +		return ltc4283_read_power_word(st, LTC4283_POWER_MAX, val);
> > +	case hwmon_power_input_lowest:
> > +		return ltc4283_read_power_word(st, LTC4283_POWER_MIN, val);
> > +	case hwmon_power_max_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_POWER_HIGH_ALM, val);
> > +	case hwmon_power_min_alarm:
> > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > +					=C2=A0 LTC4283_POWER_LOW_ALM, val);
> > +	case hwmon_power_max:
> > +		return ltc4283_read_power_byte(st, LTC4283_POWER_MAX_TH, val);
> > +	case hwmon_power_min:
> > +		return ltc4283_read_power_byte(st, LTC4283_POWER_MIN_TH, val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_read_energy(struct ltc4283_hwmon *st, u32 attr, s64=
 *val)
> > +{
> > +	u64 temp =3D LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV, energy, temp_2;
> > +	u8 raw[8] =3D {};
> > +	int ret;
> > +
> > +	if (!st->energy_en)
> > +		return -ENODATA;
> > +
> > +	ret =3D i2c_smbus_read_i2c_block_data(st->client, LTC4283_ENERGY, 6, =
raw);
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret !=3D 6)
> > +		return -EIO;
> > +
> > +	energy =3D get_unaligned_be64(raw) >> 16;
> > +
> > +	/*
> > +	 * The formula for energy is given by:
> > +	 *	E =3D CODE(48b) * 32.768mV * 2.048V * Tconv / 2^24 * Rsense
> > +	 *
> > +	 * As Rsense can have tenths of micro-ohm resolution, we need to
> > +	 * multiply by DECA to get microjoule.
> > +	 */
> > +	if (check_mul_overflow(temp * LTC4283_TCONV_uS, energy, &temp_2)) {
> > +		/*
> > +		 * We multiply again by 1000 to make sure that we don't get 0
> > +		 * in the following division which could happen for big rsense
> > +		 * values. OTOH, we then divide energy first by 1000 so that
> > +		 * we do not overflow u64 again for very small rsense values.
> > +		 * We add 100 factor for proper conversion to microjoule.
> > +		 */
> > +		temp_2 =3D DIV64_U64_ROUND_CLOSEST(temp * LTC4283_TCONV_uS * MILLI,
> > +						 BIT_ULL(24) * st->rsense);
> > +		energy =3D DIV_ROUND_CLOSEST_ULL(energy, MILLI * CENTI) * temp_2;
> > +	} else {
> > +		/* Put rsense back into nanoohm so we get microjoule. */
> > +		energy =3D DIV64_U64_ROUND_CLOSEST(temp_2, BIT_ULL(24) * st->rsense =
* CENTI);
> > +	}
> > +
> > +	*val =3D energy;
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_read(struct device *dev, enum hwmon_sensor_types ty=
pe,
> > +			u32 attr, int channel, long *val)
> > +{
> > +	struct ltc4283_hwmon *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (type) {
> > +	case hwmon_in:
> > +		return ltc4283_read_in(st, attr, channel, val);
> > +	case hwmon_curr:
> > +		return ltc4283_read_curr(st, attr, val);
> > +	case hwmon_power:
> > +		return ltc4283_read_power(st, attr, val);
> > +	case hwmon_energy:
> > +		*val =3D st->energy_en;
> > +		return 0;
> > +	case hwmon_energy64:
> > +		return ltc4283_read_energy(st, attr, (s64 *)val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_write_power_byte(const struct ltc4283_hwmon *st, u3=
2 reg,
> > +				=C2=A0=C2=A0=C2=A0 long val)
> > +{
> > +	u64 temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MI=
LLI;
> > +	u32 __raw;
> > +
> > +	clamp_val(val, 0, st->power_max);
>=20
> Result of clamp_val() is ignored.
>=20
> > +	__raw =3D DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * st->rsense, temp=
);
> > +
> > +	return regmap_write(st->map, reg, __raw);
> > +}
> > +
> > +static int ltc4283_write_power_word(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0 u32 reg, long val)
> > +{
> > +	u64 temp =3D st->rsense * BIT_ULL(16), temp_2;
> > +	u16 __raw;
> > +
> > +	if (check_mul_overflow(val, temp, &temp_2)) {
> > +		temp =3D DIV_ROUND_CLOSEST_ULL(temp, DECA * MILLI);
> > +		__raw =3D DIV_ROUND_CLOSEST_ULL(temp * val, LTC4283_ADC1_FS_uV *
> > LTC4283_ADC2_FS_mV);
> > +	} else {
> > +		temp =3D (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI=
;
> > +		__raw =3D DIV64_U64_ROUND_CLOSEST(temp_2, temp);
> > +	}
> > +
> > +	return regmap_write(st->map, reg, __raw);
> > +}
> > +
> > +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ltc4283_write_power_word(st, LTC4283_POWER_MIN, st->power_max=
);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_write_power_word(st, LTC4283_POWER_MAX, 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Clear possible power faults. */
> > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
> > +}
> > +
> > +static int ltc4283_write_power(struct ltc4283_hwmon *st, u32 attr, lon=
g val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_max:
> > +		return ltc4283_write_power_byte(st, LTC4283_POWER_MAX_TH, val);
> > +	case hwmon_power_min:
> > +		return ltc4283_write_power_byte(st, LTC4283_POWER_MIN_TH, val);
> > +	case hwmon_power_reset_history:
> > +		return ltc4283_reset_power_hist(st);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_write_in_history(struct ltc4283_hwmon *st, u32 reg,
> > +				=C2=A0=C2=A0=C2=A0 long lowest, u32 fs)
> > +{
> > +	u32 __raw;
> > +	int ret;
> > +
> > +	__raw =3D DIV_ROUND_CLOSEST(BIT(16) * lowest, fs);
> > +	if (__raw =3D=3D BIT(16))
> > +		__raw =3D U16_MAX;
> > +
> > +	ret =3D regmap_write(st->map, reg, __raw);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return regmap_write(st->map, reg + 1, 0);
> > +}
> > +
> > +static int ltc4283_write_in_byte(const struct ltc4283_hwmon *st,
> > +				 u32 reg, u32 fs, long val)
> > +{
> > +	u32 __raw;
> > +
> > +	val =3D clamp_val(val, 0, fs);
> > +	__raw =3D DIV_ROUND_CLOSEST(val * BIT(8), fs);
> > +	if (__raw =3D=3D BIT(8))
> > +		__raw =3D U8_MAX;
> > +
> > +	return regmap_write(st->map, reg, __raw);
> > +}
> > +
> > +static int ltc4283_reset_in_hist(struct ltc4283_hwmon *st, u32 channel=
)
> > +{
> > +	u32 reg, fs;
> > +	int ret;
> > +
> > +	/*
> > +	 * Make sure to clear possible under/over voltage faults. Otherwise t=
he
> > +	 * chip won't latch on again.
> > +	 */
> > +	if (channel =3D=3D LTC4283_CHAN_VIN)
> > +		return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > +					 LTC4283_OV_FAULT_MASK | LTC4283_UV_FAULT_MASK);
> > +
> > +	if (channel =3D=3D LTC4283_CHAN_VPWR)
> > +		return ltc4283_write_in_history(st, LTC4283_VPWR_MIN,
> > +						LTC4283_ADC2_FS_mV,
> > +						LTC4283_ADC2_FS_mV);
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAI=
N) {
> > +		fs =3D LTC4283_ADC2_FS_mV;
> > +		reg =3D LTC4283_ADC_2_MIN(channel - LTC4283_CHAN_ADI_1);
> > +	} else {
> > +		fs =3D LTC4283_ADC1_FS_uV;
> > +		reg =3D LTC4283_ADC_2_MIN_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	}
> > +
> > +	ret =3D ltc4283_write_in_history(st, reg, fs, fs);
> > +	if (ret)
> > +		return ret;
> > +	if (channel !=3D LTC4283_CHAN_DRAIN)
> > +		return 0;
> > +
> > +	/* Then, let's also clear possible fet faults. Same as above. */
> > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > +				 LTC4283_FET_BAD_FAULT_MASK | LTC4283_FET_SHORT_FAULT_MASK);
> > +}
> > +
> > +static int ltc4283_write_in_en(struct ltc4283_hwmon *st, u32 channel, =
bool en)
> > +{
> > +	unsigned int bit, adc_idx =3D channel - LTC4283_CHAN_ADI_1;
> > +	unsigned int reg =3D LTC4283_ADC_SELECT(adc_idx);
> > +	int ret;
> > +
> > +	bit =3D LTC4283_ADC_SELECT_MASK(adc_idx);
> > +	if (channel > LTC4283_CHAN_DRAIN)
> > +		/* Account for two reserved fields after DRAIN. */
> > +		bit <<=3D 2;
> > +
> > +	if (en)
> > +		ret =3D regmap_set_bits(st->map, reg, bit);
> > +	else
> > +		ret =3D regmap_clear_bits(st->map, reg, bit);
> > +	if (ret)
> > +		return ret;
> > +
> > +	__assign_bit(channel, &st->ch_enable_mask, en);
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_write_minmax(struct ltc4283_hwmon *st, long val,
> > +				u32 channel, bool is_max)
> > +{
> > +	u32 reg;
> > +
> > +	if (channel =3D=3D LTC4283_CHAN_VPWR) {
> > +		if (is_max)
> > +			return ltc4283_write_in_byte(st, LTC4283_VPWR_MAX_TH,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV, val);
> > +
> > +		return ltc4283_write_in_byte(st, LTC4283_VPWR_MIN_TH,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV, val);
> > +	}
> > +
> > +	if (channel >=3D LTC4283_CHAN_ADI_1 && channel <=3D LTC4283_CHAN_DRAI=
N) {
> > +		if (is_max) {
> > +			reg =3D LTC4283_ADC_2_MAX_TH(channel - LTC4283_CHAN_ADI_1);
> > +			return ltc4283_write_in_byte(st, reg,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC2_FS_mV, val);
> > +		}
> > +
> > +		reg =3D LTC4283_ADC_2_MIN_TH(channel - LTC4283_CHAN_ADI_1);
> > +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC2_FS_mV, val);
> > +	}
> > +
> > +	if (is_max) {
> > +		reg =3D LTC4283_ADC_2_MAX_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +		return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 val * MILLI);
> > +	}
> > +
> > +	reg =3D LTC4283_ADC_2_MIN_TH_DIFF(channel - LTC4283_CHAN_ADIN12);
> > +	return ltc4283_write_in_byte(st, reg, LTC4283_ADC1_FS_uV, val * MILLI=
);
> > +}
> > +
> > +static int ltc4283_write_in(struct ltc4283_hwmon *st, u32 attr, long v=
al,
> > +			=C2=A0=C2=A0=C2=A0 int channel)
> > +{
> > +	switch (attr) {
> > +	case hwmon_in_max:
> > +		return ltc4283_write_minmax(st, val, channel, true);
> > +	case hwmon_in_min:
> > +		return ltc4283_write_minmax(st, val, channel, false);
> > +	case hwmon_in_reset_history:
> > +		return ltc4283_reset_in_hist(st, channel);
> > +	case hwmon_in_enable:
> > +		return ltc4283_write_in_en(st, channel, !!val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_write_curr_byte(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0 u32 reg, long val)
> > +{
> > +	u32 temp =3D LTC4283_ADC1_FS_uV * DECA * MILLI;
> > +	u32 reg_val, isense_max;
> > +
> > +	isense_max =3D DIV_ROUND_CLOSEST(st->vsense_max * MICRO * DECA, st->r=
sense);
> > +	clamp_val(val, 0, isense_max);
>=20
> Result ignored.

Ups!

>=20
> > +	reg_val =3D DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * st->rsense, temp=
);
> > +
> > +	return regmap_write(st->map, reg, reg_val);
> > +}
> > +
> > +static int ltc4283_write_curr_history(struct ltc4283_hwmon *st)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ltc4283_write_in_history(st, LTC4283_SENSE_MIN,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 st->vsense_max * MILLI,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC1_FS_uV);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Now, let's also clear possible overcurrent logs. */
> > +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
> > +				 LTC4283_OC_FAULT_MASK);
> > +}
> > +
> > +static int ltc4283_write_curr(struct ltc4283_hwmon *st, u32 attr, long=
 val)
> > +{
> > +	switch (attr) {
> > +	case hwmon_curr_max:
> > +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MAX_TH, val);
> > +	case hwmon_curr_min:
> > +		return ltc4283_write_curr_byte(st, LTC4283_SENSE_MIN_TH, val);
> > +	case hwmon_curr_reset_history:
> > +		return ltc4283_write_curr_history(st);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int ltc4283_energy_enable_set(struct ltc4283_hwmon *st, long va=
l)
> > +{
> > +	int ret;
> > +
> > +	/* Setting the bit halts the meter. */
> > +	val =3D !!val;
> > +	ret =3D regmap_update_bits(st->map, LTC4283_METER_CONTROL,
> > +				 LTC4283_METER_HALT_MASK,
> > +				 FIELD_PREP(LTC4283_METER_HALT_MASK, !val));
> > +	if (ret)
> > +		return ret;
> > +
> > +	st->energy_en =3D val;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_write(struct device *dev, enum hwmon_sensor_types t=
ype,
> > +			 u32 attr, int channel, long val)
> > +{
> > +	struct ltc4283_hwmon *st =3D dev_get_drvdata(dev);
> > +
> > +	switch (type) {
> > +	case hwmon_power:
> > +		return ltc4283_write_power(st, attr, val);
> > +	case hwmon_in:
> > +		return ltc4283_write_in(st, attr, val, channel);
> > +	case hwmon_curr:
> > +		return ltc4283_write_curr(st, attr, val);
> > +	case hwmon_energy:
> > +		return ltc4283_energy_enable_set(st, val);
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_in_is_visible(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel)
> > +{
> > +	/* If ADIO is set as a GPIO, don=C2=B4t make it visible. */
> > +	if (channel >=3D LTC4283_CHAN_ADIO_1 && channel <=3D LTC4283_CHAN_ADI=
O_4) {
> > +		/* ADIOX pins come at index 0 in the gpio mask. */
> > +		channel -=3D LTC4283_CHAN_ADIO_1;
> > +		if (test_bit(channel, &st->gpio_mask))
> > +			return 0;
> > +	}
> > +
> > +	/* Also take care of differential channels. */
> > +	if (channel >=3D LTC4283_CHAN_ADIO12 && channel <=3D LTC4283_CHAN_ADI=
O34) {
> > +		channel -=3D LTC4283_CHAN_ADIO12;
> > +		/* If one channel in the pair is used, make it invisible. */
> > +		if (test_bit(channel * 2, &st->gpio_mask) ||
> > +		=C2=A0=C2=A0=C2=A0 test_bit(channel * 2 + 1, &st->gpio_mask))
> > +			return 0;
> > +	}
> > +
> > +	switch (attr) {
> > +	case hwmon_in_input:
> > +	case hwmon_in_highest:
> > +	case hwmon_in_lowest:
> > +	case hwmon_in_max_alarm:
> > +	case hwmon_in_min_alarm:
> > +	case hwmon_in_label:
> > +	case hwmon_in_lcrit_alarm:
> > +	case hwmon_in_crit_alarm:
> > +	case hwmon_in_fault:
> > +		return 0444;
> > +	case hwmon_in_max:
> > +	case hwmon_in_min:
> > +	case hwmon_in_enable:
> > +		return 0644;
> > +	case hwmon_in_reset_history:
> > +		return 0200;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_curr_is_visible(u32 attr)
> > +{
> > +	switch (attr) {
> > +	case hwmon_curr_input:
> > +	case hwmon_curr_highest:
> > +	case hwmon_curr_lowest:
> > +	case hwmon_curr_max_alarm:
> > +	case hwmon_curr_min_alarm:
> > +	case hwmon_curr_crit_alarm:
> > +	case hwmon_curr_label:
> > +		return 0444;
> > +	case hwmon_curr_max:
> > +	case hwmon_curr_min:
> > +		return 0644;
> > +	case hwmon_curr_reset_history:
> > +		return 0200;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_power_is_visible(u32 attr)
> > +{
> > +	switch (attr) {
> > +	case hwmon_power_input:
> > +	case hwmon_power_input_highest:
> > +	case hwmon_power_input_lowest:
> > +	case hwmon_power_label:
> > +	case hwmon_power_max_alarm:
> > +	case hwmon_power_min_alarm:
> > +		return 0444;
> > +	case hwmon_power_max:
> > +	case hwmon_power_min:
> > +		return 0644;
> > +	case hwmon_power_reset_history:
> > +		return 0200;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static umode_t ltc4283_is_visible(const void *data,
> > +				=C2=A0 enum hwmon_sensor_types type,
> > +				=C2=A0 u32 attr, int channel)
> > +{
> > +	switch (type) {
> > +	case hwmon_in:
> > +		return ltc4283_in_is_visible(data, attr, channel);
> > +	case hwmon_curr:
> > +		return ltc4283_curr_is_visible(attr);
> > +	case hwmon_power:
> > +		return ltc4283_power_is_visible(attr);
> > +	case hwmon_energy:
> > +		/* hwmon_energy_enable */
> > +		return 0644;
> > +	case hwmon_energy64:
> > +		/* hwmon_energy_input */
> > +		return 0444;
> > +	default:
> > +		return 0;
> > +	}
> > +}
> > +
> > +static const char * const ltc4283_in_strs[] =3D {
> > +	"VIN", "VPWR", "VADI1", "VADI2", "VADI3", "VADI4", "VADIO1", "VADIO2"=
,
> > +	"VADIO3", "VADIO4", "DRNS", "DRAIN", "ADIN2-ADIN1", "ADIN4-ADIN3",
> > +	"ADIO2-ADIO1", "ADIO4-ADIO3"
> > +};
> > +
> > +static int ltc4283_read_labels(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum hwmon_sensor_types type,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 attr, int channel, const c=
har **str)
> > +{
> > +	switch (type) {
> > +	case hwmon_in:
> > +		*str =3D ltc4283_in_strs[channel];
> > +		return 0;
> > +	case hwmon_curr:
> > +		*str =3D "ISENSE";
> > +		return 0;
> > +	case hwmon_power:
> > +		*str =3D "Power";
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +/*
> > + * Set max limits for ISENSE and Power as that depends on the max volt=
age on
> > + * rsense that is defined in ILIM_ADJUST. This is specially important =
for power
> > + * because for some rsense and vfsout values, if we allow the default =
raw 255
> > + * value, that would overflow long in 32bit archs when reading back th=
e max
> > + * power limit.
> > + */
> > +static int ltc4283_set_max_limits(struct ltc4283_hwmon *st, struct dev=
ice *dev)
> > +{
> > +	u32 temp =3D st->vsense_max * DECA * MICRO;
> > +	int ret;
> > +
> > +	ret =3D ltc4283_write_in_byte(st, LTC4283_SENSE_MAX_TH, LTC4283_ADC1_=
FS_uV,
> > +				=C2=A0=C2=A0=C2=A0 st->vsense_max * MILLI);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Power is given by ISENSE * Vout. */
> > +	st->power_max =3D DIV_ROUND_CLOSEST(temp, st->rsense) * LTC4283_ADC2_=
FS_mV;
> > +	return ltc4283_write_power_byte(st, LTC4283_POWER_MAX_TH, st->power_m=
ax);
> > +}
> > +
> > +static int ltc4283_parse_array_prop(const struct ltc4283_hwmon *st,
> > +				=C2=A0=C2=A0=C2=A0 struct device *dev, const char *prop,
> > +				=C2=A0=C2=A0=C2=A0 const u32 *vals, u32 n_vals)
> > +{
> > +	u32 prop_val;
> > +	int ret;
> > +	u32 i;
> > +
> > +	ret =3D device_property_read_u32(dev, prop, &prop_val);
> > +	if (ret)
> > +		return n_vals;
> > +
> > +	for (i =3D 0; i < n_vals; i++) {
> > +		if (prop_val !=3D vals[i])
> > +			continue;
> > +
> > +		return i;
> > +	}
> > +
> > +	return dev_err_probe(dev, -EINVAL,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid %s property value %u, expected on=
e of: %*ph\n",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 prop, prop_val, n_vals, vals);
> > +}
> > +
> > +static int ltc4283_get_defaults(struct ltc4283_hwmon *st)
> > +{
> > +	u32 reg_val, ilm_adjust, c;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(st->map, LTC4283_METER_CONTROL, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	st->energy_en =3D !FIELD_GET(LTC4283_METER_HALT_MASK, reg_val);
> > +
> > +	ret =3D regmap_read(st->map, LTC4283_CONFIG_1, &reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ilm_adjust =3D FIELD_GET(LTC4283_ILIM_MASK, reg_val);
> > +	st->vsense_max =3D LTC4283_VILIM_MIN_uV / MILLI + ilm_adjust;
> > +
> > +	/* VPWR and VIN are always enabled */
> > +	__set_bit(LTC4283_CHAN_VIN, &st->ch_enable_mask);
> > +	__set_bit(LTC4283_CHAN_VPWR, &st->ch_enable_mask);
> > +	for (c =3D LTC4283_CHAN_ADI_1; c < LTC4283_CHAN_MAX; c++) {
> > +		u32 chan =3D c - LTC4283_CHAN_ADI_1, bit;
> > +
> > +		ret =3D regmap_read(st->map, LTC4283_ADC_SELECT(chan), &reg_val);
> > +		if (ret)
> > +			return ret;
> > +
> > +		bit =3D LTC4283_ADC_SELECT_MASK(chan);
> > +		if (c > LTC4283_CHAN_DRAIN)
> > +			/* account for two reserved fields after DRAIN */
> > +			bit <<=3D 2;
> > +
> > +		if (!(bit & reg_val))
> > +			continue;
> > +
> > +		__set_bit(c, &st->ch_enable_mask);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const char * const ltc4283_pgio1_funcs[] =3D {
> > +	"inverted_power_good", "power_good", "gpio"
> > +};
> > +
> > +static const char * const ltc4283_pgio2_funcs[] =3D {
> > +	 "inverted_power_good", "power_good", "gpio", "active_current_limitin=
g"
> > +};
> > +
> > +static const char * const ltc4283_pgio3_funcs[] =3D {
> > +	"inverted_power_good_input", "power_good_input", "gpio"
> > +};
> > +
> > +static const char * const ltc4283_pgio4_funcs[] =3D {
> > +	"inverted_external_fault", "external_fault", "gpio"
> > +};
> > +
> > +enum {
> > +	LTC4283_PIN_ADIO1,
> > +	LTC4283_PIN_ADIO2,
> > +	LTC4283_PIN_ADIO3,
> > +	LTC4283_PIN_ADIO4,
> > +	LTC4283_PIN_PGIO1,
> > +	LTC4283_PIN_PGIO2,
> > +	LTC4283_PIN_PGIO3,
> > +	LTC4283_PIN_PGIO4,
> > +};
> > +
> > +static int ltc4283_pgio_config(struct ltc4283_hwmon *st, struct device=
 *dev)
> > +{
> > +	int ret, func;
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio1-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio1_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio1_funcs));
> > +	if (func < 0 && func !=3D -EINVAL)
>=20
> !=3D or =3D=3D ?
>=20
> for all -EINVAL checks. At the very least,
>=20
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio1-func property\n");
>=20
> The "Invalid" messages are confusing. Why say it is invalid when it isn't=
 ?
> And why _only_ accept -EINVAL errors ? That seems odd.

It's a bit weird but -EINVAL is what is used by FW for missing properties. =
So if the property
is not given at all, we ignore. But we do wanna catch other error codes. Ti=
ny improvement but I'm
aware that it's also a very common pattern to just ignore any error for opt=
ional properties so I
can, also, just do that.

>=20
> > +	if (func >=3D 0) {
> > +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> > +			__set_bit(LTC4283_PIN_PGIO1, &st->gpio_mask);
> > +			/* If GPIO, default to an input pin. */
> > +			func++;
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> > +					 LTC4283_PGIO1_CFG_MASK,
> > +					 FIELD_PREP(LTC4283_PGIO1_CFG_MASK, func));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio2-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio2_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio2_funcs));
> > +
> > +	if (func < 0 && func !=3D -EINVAL)
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio2-func property\n");
> > +	if (func >=3D 0) {
> > +		if (func !=3D LTC4283_PGIO2_FUNC_ACLB) {
> > +			if (func =3D=3D LTC4283_PGIO_FUNC_GPIO)=C2=A0 {
> > +				__set_bit(LTC4283_PIN_PGIO2, &st->gpio_mask);
> > +				func++;
> > +			}
> > +
> > +			ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> > +						 LTC4283_PGIO2_CFG_MASK,
> > +						 FIELD_PREP(LTC4283_PGIO2_CFG_MASK, func));
> > +		} else {
> > +			ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_1,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_PIGIO2_ACLB_MASK);
> > +		}
> > +
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio3-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio3_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio3_funcs));
> > +
> > +	if (func < 0 && func !=3D -EINVAL)
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio3-func property\n");
> > +	if (func >=3D 0) {
> > +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> > +			__set_bit(LTC4283_PIN_PGIO3, &st->gpio_mask);
> > +			func++;
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> > +					 LTC4283_PGIO3_CFG_MASK,
> > +					 FIELD_PREP(LTC4283_PGIO3_CFG_MASK, func));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	func =3D device_property_match_property_string(dev, "adi,pgio4-func",
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_pgio4_funcs,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_pgio4_funcs));
> > +
> > +	if (func < 0 && func !=3D -EINVAL)
>=20
> The usual -EINVAL question.
>=20
> > +		return dev_err_probe(dev, func,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid adi,pgio4-func property\n");
> > +	if (func >=3D 0) {
> > +		if (func =3D=3D LTC4283_PGIO_FUNC_GPIO) {
> > +			__set_bit(LTC4283_PIN_PGIO4, &st->gpio_mask);
> > +			func++;
> > +		} else {
> > +			st->ext_fault =3D true;
> > +		}
> > +
> > +		ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG,
> > +					 LTC4283_PGIO4_CFG_MASK,
> > +					 FIELD_PREP(LTC4283_PGIO4_CFG_MASK, func));
> > +		if (ret)
> > +			return ret;
> > +	}
>=20
> Shouldn't this set the default value (inverted_external_fault) if the
> property is not provided (i.e., set st->ext_fault and write func =3D 0
> into LTC4283_PGIO4_CFG_MASK) ?

I guess this would be a wider question about what to do for all properties =
not provided? Maybe
(given there's an EEPROM) we should just assume whatever are in the registe=
rs is to be used? (When
checking your comments, I started to wonder about this for boolean properti=
es).

But naturally, at the very least, I need to include st->ext_fault in ltc428=
3_get_defaults().
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_adio_config(struct ltc4283_hwmon *st, struct device=
 *dev,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *prop, u32 pin)
> > +{
> > +	u32 adc_idx;
> > +	int ret;
> > +
> > +	if (!device_property_read_bool(dev, prop))
> > +		return 0;
> > +
> > +	adc_idx =3D LTC4283_CHAN_ADIO_1 - LTC4283_CHAN_ADI_1 + pin;
> > +	ret =3D regmap_clear_bits(st->map, LTC4283_ADC_SELECT(adc_idx),
> > +				LTC4283_ADC_SELECT_MASK(adc_idx));
> > +	if (ret)
> > +		return ret;
> > +
> > +	__set_bit(pin, &st->gpio_mask);
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_pin_config(struct ltc4283_hwmon *st, struct device =
*dev)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ltc4283_pgio_config(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio1", LTC4283_PIN=
_ADIO1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio2", LTC4283_PIN=
_ADIO2);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_adio_config(st, dev, "adi,gpio-on-adio3", LTC4283_PIN=
_ADIO3);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return ltc4283_adio_config(st, dev, "adi,gpio-on-adio4", LTC4283_PIN_=
ADIO4);
> > +}
> > +
> > +static const char * const ltc4283_oc_fet_retry[] =3D {
> > +	"latch-off", "1", "7", "unlimited"
> > +};
> > +
> > +static const u32 ltc4283_fb_factor[] =3D {
> > +	100, 50, 20, 10
> > +};
> > +
> > +static const u32 ltc4283_cooling_dl[] =3D {
> > +	512, 1002, 2005, 4100, 8190, 16400, 32800, 65600
> > +};
> > +
> > +static const u32 ltc4283_fet_bad_delay[] =3D {
> > +	256, 512, 1002, 2005
> > +};
> > +
> > +static int ltc4283_setup(struct ltc4283_hwmon *st, struct device *dev)
> > +{
> > +	u32 val, chan;
> > +	int ret;
> > +
> > +	/* The part has an eeprom so let's get the needed defaults from it */
> > +	ret =3D ltc4283_get_defaults(st);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Default to 1 micro ohm so we can probe without FW properties. Note
> > +	 * the below division expects rsense in nano ohms.
> > +	 */
> > +	st->rsense =3D 1 * MILLI;
> > +	ret =3D device_property_read_u32(dev, "adi,rsense-nano-ohms",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->rsense);
> > +	if (!ret) {
> > +		if (st->rsense < CENTI)
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,rsense-nano-ohms too small (< %lu)\=
n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 CENTI);
> > +	}
> > +
> > +	/*
> > +	 * The resolution for rsense is tenths of micro (eg: 62.5 uOhm) which
> > +	 * means we need nano in the bindings. However, to make things easier=
 to
> > +	 * handle (with respect to overflows) we divide it by 100 as we don't
> > +	 * really need the last two digits.
> > +	 */
> > +	st->rsense /=3D CENTI;
> > +
> > +	ret =3D device_property_read_u32(dev, "adi,current-limit-sense-microv=
olt",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &st->vsense_max);
> > +	if (!ret) {
> > +		u32 reg_val;
> > +
> > +		if (!in_range(st->vsense_max, LTC4283_VILIM_MIN_uV,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VILIM_RANGE)) {
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,current-limit-sense-microvolt (%u) =
out of
> > range [%u %u]\n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 st->vsense_max, LTC4283_VILIM_MIN_uV,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_VILIM_MAX_uV);
> > +		}
> > +
> > +		st->vsense_max /=3D MILLI;
> > +		reg_val =3D FIELD_PREP(LTC4283_ILIM_MASK,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 st->vsense_max - LTC4283_VILIM_MIN_uV / M=
ILLI);
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_1,
> > +					 LTC4283_ILIM_MASK, reg_val);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,current-limit-foldback=
-factor",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_fb_factor, ARRAY_SIZE=
(ltc4283_fb_factor));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret < ARRAY_SIZE(ltc4283_fb_factor)) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_1, LTC4283_FB_MAS=
K,
> > +					 FIELD_PREP(LTC4283_FB_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,cooling-delay-ms",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_cooling_dl, ARRAY_SIZ=
E(ltc4283_cooling_dl));
> > +	if (ret < 0)
> > +		return ret;
> > +	if (ret < ARRAY_SIZE(ltc4283_cooling_dl)) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_2, LTC4283_COOLIN=
G_DL_MASK,
> > +					 FIELD_PREP(LTC4283_COOLING_DL_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_parse_array_prop(st, dev, "adi,fet-bad-timer-delay-ms=
",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ltc4283_fet_bad_delay,
> > ARRAY_SIZE(ltc4283_fet_bad_delay));
> > +	if (ret < 0)
> > +		return ret;
>=20
> This (and other attributes if missing) have a default and should not blin=
dly
> return an error.

Maybe I'm missing your point but that helper will return ARRAY_SIZE(ltc4283=
_fet_bad_delay) - same
for other properties using the helper - in case the device_property_read_u3=
2() returns an error.

That is why in here we explicitly check for negative error code.

>=20
> > +	if (ret < ARRAY_SIZE(ltc4283_fet_bad_delay)) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_2, LTC4283_FTBD_D=
L_MASK,
> > +					 FIELD_PREP(LTC4283_FTBD_DL_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D ltc4283_set_max_limits(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D ltc4283_pin_config(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (device_property_read_bool(dev, "adi,power-good-reset-on-fet")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> > +					LTC4283_PWRGD_RST_CTRL_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,fet-turn-off-disable")) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> > +					LTC4283_FET_BAD_OFF_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,tmr-pull-down-disable")) {
> > +		ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_1,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_THERM_TMR_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,dvdt-inrush-control-disable")=
) {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_1,
> > +					LTC4283_DVDT_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,undervoltage-retry-disable"))=
 {
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> > +					LTC4283_UV_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,overvoltage-retry-disable")) =
{
> > +		ret =3D regmap_clear_bits(st->map, LTC4283_CONTROL_2,
> > +					LTC4283_OV_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,external-fault-retry-enable")=
) {
> > +		if (!st->ext_fault)
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,external-fault-retry-enable set but=
 PGIO4 not
> > configured\n");
> > +		ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_2,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_EXT_FAULT_RETRY_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,fault-log-enable")) {
> > +		ret =3D regmap_set_bits(st->map, LTC4283_FAULT_LOG_CTRL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_FAULT_LOG_EN_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D device_property_match_property_string(dev, "adi,overcurrent-r=
etries",
> > +						=C2=A0=C2=A0=C2=A0 ltc4283_oc_fet_retry,
> > +						=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_oc_fet_retry));
> > +	/* We still want to catch when an invalid string is given. */
> > +	if (ret !=3D -EINVAL)
>=20
> Is that supposed to be "=3D=3D -EINVAL" ?
>=20
> Because otherwise it returns immediately (even if there is no error)
> all the time.

Sure! Did not hit this because I do have these properties in my DT. Missing=
 a ret < 0 before

>=20
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,overcurrent-retries invalid value\n"=
);
> > +	if (ret >=3D 0) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONTROL_2,
> > +					 LTC4283_OC_RETRY_MASK,
> > +					 FIELD_PREP(LTC4283_OC_RETRY_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D device_property_match_property_string(dev, "adi,fet-bad-retri=
es",
> > +						=C2=A0=C2=A0=C2=A0 ltc4283_oc_fet_retry,
> > +						=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ltc4283_oc_fet_retry));
> > +	if (ret !=3D -EINVAL)
>=20
> Same here.
>=20
> > +		return dev_err_probe(dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "adi,fet-bad-retries invalid value\n");
> > +	if (ret >=3D 0) {
> > +		ret =3D regmap_update_bits(st->map, LTC4283_CONTROL_2,
> > +					 LTC4283_FET_BAD_RETRY_MASK,
> > +					 FIELD_PREP(LTC4283_FET_BAD_RETRY_MASK, ret));
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,external-fault-fet-off-enable=
")) {
> > +		if (!st->ext_fault)
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "adi,external-fault-fet-off-enable set b=
ut PGIO4
> > not configured\n");
> > +		ret =3D regmap_set_bits(st->map, LTC4283_CONFIG_3,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_EXTFLT_TURN_OFF_MASK);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (device_property_read_bool(dev, "adi,vpower-drns-enable")) {
> > +		__clear_bit(LTC4283_CHAN_DRAIN, &st->ch_enable_mask);
>=20
> That kind of conflicts with the devicetree description, which says that t=
he
> _drain_ voltage should be monitored if this property is enabled.
>=20

Hmm I messed up here during revisions. Before I was only dealing with the a=
di,vpower-drns-enable
true case and when I changed to also deal with the lack of the flag, I clea=
rly messed up.

Anyways, main idea is to remove the DRNS (attenuated drain voltage) from AD=
C2 if we already have
it in VPWR.

- Nuno S=C3=A1

 =20
> > +		chan =3D LTC4283_CHAN_DRAIN - LTC4283_CHAN_ADI_1;
> > +		val =3D 1;
> > +	} else {
> > +		__clear_bit(LTC4283_CHAN_DRNS, &st->ch_enable_mask);
> > +		chan =3D LTC4283_CHAN_DRNS - LTC4283_CHAN_ADI_1;
> > +		val =3D 0;
> > +	}
> > +	/*
> > +	 * Then, let's by default disable the channel from the ADC2 that is
> > +	 * already being monitored by the VPWR channel. One can still enable =
it
> > +	 * later on if needed.
> > +	 */
> > +	ret =3D regmap_clear_bits(st->map, LTC4283_ADC_SELECT(chan),
> > +				LTC4283_ADC_SELECT_MASK(chan));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_update_bits(st->map, LTC4283_CONFIG_3,
> > +				 LTC4283_VPWR_DRNS_MASK,
> > +				 FIELD_PREP(LTC4283_VPWR_DRNS_MASK, val));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Make sure the ADC has 12bit resolution since we're assuming that. =
*/
> > +	ret =3D regmap_update_bits(st->map, LTC4283_PGIO_CONFIG_2,
> > +				 LTC4283_ADC_MASK,
> > +				 FIELD_PREP(LTC4283_ADC_MASK, 3));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Energy reads (which are 6 byte block reads) rely on page access */
> > +	ret =3D regmap_set_bits(st->map, LTC4283_CONTROL_1, LTC4283_RW_PAGE_M=
ASK);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Make sure we are integrating power as we only support reporting
> > +	 * consumed energy.
> > +	 */
> > +	return regmap_clear_bits(st->map, LTC4283_METER_CONTROL,
> > +				 LTC4283_INTEGRATE_I_MASK);
> > +}
> > +
> > +static const struct hwmon_channel_info * const ltc4283_info[] =3D {
> > +	HWMON_CHANNEL_INFO(in,
> > +			=C2=A0=C2=A0 HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_MAX_ALARM | HWMON_I_RESET_HISTORY |
> > +			=C2=A0=C2=A0 HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_FAULT | HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL,
> > +			=C2=A0=C2=A0 HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_I_MAX | HWMON_I_MIN | HWMON_I_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_RESET_HISTORY | HWMON_I_MAX_ALARM |
> > +			=C2=A0=C2=A0 HWMON_I_ENABLE | HWMON_I_LABEL),
> > +	HWMON_CHANNEL_INFO(curr,
> > +			=C2=A0=C2=A0 HWMON_C_INPUT | HWMON_C_LOWEST | HWMON_C_HIGHEST |
> > +			=C2=A0=C2=A0 HWMON_C_MAX | HWMON_C_MIN | HWMON_C_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> > +			=C2=A0=C2=A0 HWMON_C_RESET_HISTORY | HWMON_C_LABEL),
> > +	HWMON_CHANNEL_INFO(power,
> > +			=C2=A0=C2=A0 HWMON_P_INPUT | HWMON_P_INPUT_LOWEST |
> > +			=C2=A0=C2=A0 HWMON_P_INPUT_HIGHEST | HWMON_P_MAX | HWMON_P_MIN |
> > +			=C2=A0=C2=A0 HWMON_P_MAX_ALARM | HWMON_P_MIN_ALARM |
> > +			=C2=A0=C2=A0 HWMON_P_RESET_HISTORY | HWMON_P_LABEL),
> > +	HWMON_CHANNEL_INFO(energy,
> > +			=C2=A0=C2=A0 HWMON_E_ENABLE),
> > +	HWMON_CHANNEL_INFO(energy64,
> > +			=C2=A0=C2=A0 HWMON_E_INPUT),
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_ops ltc4283_ops =3D {
> > +	.read =3D ltc4283_read,
> > +	.write =3D ltc4283_write,
> > +	.is_visible =3D ltc4283_is_visible,
> > +	.read_string =3D ltc4283_read_labels,
> > +};
> > +
> > +static const struct hwmon_chip_info ltc4283_chip_info =3D {
> > +	.ops =3D &ltc4283_ops,
> > +	.info =3D ltc4283_info,
> > +};
> > +
> > +static int ltc4283_show_fault_log(void *arg, u64 *val, u32 mask)
> > +{
> > +	struct ltc4283_hwmon *st =3D arg;
> > +	long alarm;
> > +	int ret;
> > +
> > +	ret =3D ltc4283_read_alarm(st, LTC4283_FAULT_LOG, mask, &alarm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*val =3D alarm;
> > +
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_show_in0_lcrit_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_UV_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_lcrit_fault_log,
> > +			 ltc4283_show_in0_lcrit_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_in0_crit_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_OV_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_in0_crit_fault_log,
> > +			 ltc4283_show_in0_crit_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_fet_bad_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_FET_BAD_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_bad_fault_log,
> > +			 ltc4283_show_fet_bad_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_fet_short_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_FET_SHORT_FAULT_MASK)=
;
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_fet_short_fault_log,
> > +			 ltc4283_show_fet_short_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_curr1_crit_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_OC_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_curr1_crit_fault_log,
> > +			 ltc4283_show_curr1_crit_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_power1_failed_fault_log(void *arg, u64 *val)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_PWR_FAIL_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_failed_fault_log,
> > +			 ltc4283_show_power1_failed_fault_log, NULL, "%llu\n");
> > +
> > +static int ltc4283_show_power1_good_input_fault_log(void *arg, u64 *va=
l)
> > +{
> > +	return ltc4283_show_fault_log(arg, val, LTC4283_PGI_FAULT_MASK);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(ltc4283_power1_good_input_fault_log,
> > +			 ltc4283_show_power1_good_input_fault_log, NULL, "%llu\n");
> > +
> > +static void ltc4283_debugfs_init(struct ltc4283_hwmon *st, struct i2c_=
client *i2c)
> > +{
> > +	debugfs_create_file_unsafe("in0_crit_fault_log", 0400, i2c->debugfs, =
st,
> > +				=C2=A0=C2=A0 &ltc4283_in0_crit_fault_log);
> > +	debugfs_create_file_unsafe("in0_lcrit_fault_log", 0400, i2c->debugfs,=
 st,
> > +				=C2=A0=C2=A0 &ltc4283_in0_lcrit_fault_log);
> > +	debugfs_create_file_unsafe("in0_fet_bad_fault_log", 0400, i2c->debugf=
s, st,
> > +				=C2=A0=C2=A0 &ltc4283_fet_bad_fault_log);
> > +	debugfs_create_file_unsafe("in0_fet_short_fault_log", 0400, i2c->debu=
gfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_fet_short_fault_log);
> > +	debugfs_create_file_unsafe("curr1_crit_fault_log", 0400, i2c->debugfs=
, st,
> > +				=C2=A0=C2=A0 &ltc4283_curr1_crit_fault_log);
> > +	debugfs_create_file_unsafe("power1_failed_fault_log", 0400, i2c->debu=
gfs, st,
> > +				=C2=A0=C2=A0 &ltc4283_power1_failed_fault_log);
> > +	debugfs_create_file_unsafe("power1_good_input_fault_log", 0400, i2c->=
debugfs,
> > +				=C2=A0=C2=A0 st, &ltc4283_power1_good_input_fault_log);
> > +}
> > +
> > +static bool ltc4283_is_word_reg(unsigned int reg)
> > +{
> > +	return reg >=3D LTC4283_SENSE && reg <=3D LTC4283_ADIO34_MAX;
> > +}
> > +
> > +static int ltc4283_reg_read(void *context, unsigned int reg, unsigned =
int *val)
> > +{
> > +	struct i2c_client *client =3D context;
> > +	int ret;
> > +
> > +	if (ltc4283_is_word_reg(reg))
> > +		ret =3D i2c_smbus_read_word_swapped(client, reg);
> > +	else
> > +		ret =3D i2c_smbus_read_byte_data(client, reg);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*val =3D ret;
> > +	return 0;
> > +}
> > +
> > +static int ltc4283_reg_write(void *context, unsigned int reg, unsigned=
 int val)
> > +{
> > +	struct i2c_client *client =3D context;
> > +
> > +	if (ltc4283_is_word_reg(reg))
> > +		return i2c_smbus_write_word_swapped(client, reg, val);
> > +
> > +	return i2c_smbus_write_byte_data(client, reg, val);
> > +}
> > +
> > +static const struct regmap_bus ltc4283_regmap_bus =3D {
> > +	.reg_read =3D ltc4283_reg_read,
> > +	.reg_write =3D ltc4283_reg_write,
> > +};
> > +
> > +static bool ltc4283_writable_reg(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case LTC4283_SYSTEM_STATUS ... LTC4283_FAULT_STATUS:
> > +		return false;
> > +	case LTC4283_RESERVED_OC:
> > +		return false;
> > +	case LTC4283_RESERVED_86 ... LTC4283_RESERVED_8F:
> > +		return false;
> > +	case LTC4283_RESERVED_91 ... LTC4283_RESERVED_A1:
> > +		return false;
> > +	case LTC4283_RESERVED_A3:
> > +		return false;
> > +	case LTC4283_RESERVED_AC:
> > +		return false;
> > +	case LTC4283_POWER_PLAY_MSB ... LTC4283_POWER_PLAY_LSB:
> > +		return false;
> > +	case LTC4283_RESERVED_F1 ... LTC4283_RESERVED_FF:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static const struct regmap_config ltc4283_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 16,
> > +	.max_register =3D 0xFF,
> > +	.writeable_reg =3D ltc4283_writable_reg,
> > +};
> > +
> > +static int ltc4283_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev =3D &client->dev, *hwmon;
> > +	struct auxiliary_device *adev;
> > +	struct ltc4283_hwmon *st;
> > +	int ret;
> > +
> > +	st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> > +	if (!st)
> > +		return -ENOMEM;
> > +
> > +	if (!i2c_check_functionality(client->adapter,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 I2C_FUNC_SMBUS_BYTE_DATA |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 I2C_FUNC_SMBUS_WORD_DATA |
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> > +		return -EOPNOTSUPP;
> > +
> > +	st->client =3D client;
> > +	st->map =3D devm_regmap_init(dev, &ltc4283_regmap_bus, client,
> > +				=C2=A0=C2=A0 &ltc4283_regmap_config);
> > +	if (IS_ERR(st->map))
> > +		return dev_err_probe(dev, PTR_ERR(st->map),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to create regmap\n");
> > +
> > +	ret =3D ltc4283_setup(st, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	hwmon =3D devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 &ltc4283_chip_info, NULL);
> > +
> > +	if (IS_ERR(hwmon))
> > +		return PTR_ERR(hwmon);
> > +
> > +	ltc4283_debugfs_init(st, client);
> > +
> > +	if (!st->gpio_mask)
> > +		return 0;
> > +
> > +	adev =3D devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > +	if (!adev)
> > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ltc4283_of_match[] =3D {
> > +	{ .compatible =3D "adi,ltc4283" },
> > +	{ }
> > +};
> > +
> > +static const struct i2c_device_id ltc4283_i2c_id[] =3D {
> > +	{ "ltc4283" },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, ltc4283_i2c_id);
> > +
> > +static struct i2c_driver ltc4283_driver =3D {
> > +	.driver	=3D {
> > +		.name =3D "ltc4283",
> > +		.of_match_table =3D ltc4283_of_match,
> > +	},
> > +	.probe =3D ltc4283_probe,
> > +	.id_table =3D ltc4283_i2c_id,
> > +};
> > +module_i2c_driver(ltc4283_driver);
> > +
> > +MODULE_AUTHOR("Nuno S=C3=A1 <nuno.sa@analog.com>");
> > +MODULE_DESCRIPTION("LTC4283 Hot Swap Controller driver");
> > +MODULE_LICENSE("GPL");

