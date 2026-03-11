Return-Path: <linux-gpio+bounces-33117-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFZnA71EsWlCtAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33117-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:32:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A9C2623DF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 11:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 177BB303E157
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 10:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77853CEBA1;
	Wed, 11 Mar 2026 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YoF0F3IM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA1A3CEB8A
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773225087; cv=none; b=qg4wyiShs/mEti72zwTl95NthjpRGU93332vKKlLolRH680xdrDbxXy5SutAn/SU7NlDJbQQnJDWXXAk+QmF4FkyKWfyoJHBVD6c45uXuPFS/8SOJ4n3KecqxCazlT1RMGGj/Kqt8GXk38ID/IYd2KSxOLA6r+L75Q+9FxjI47E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773225087; c=relaxed/simple;
	bh=g4ITlUf74w11MGQR1Cb/Ltl1+AaJybLpyy4A6yusbF0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hf71tgjKDjoobjdmsu7MnyeOntqYUhkVeOuyg3LsenDPmOWpgNkAt5svI1X/dlKNskXn0R/1LW3ZEmV8az42LZdWF3EqxyKeJ915wraR+2P2w+T+Opg90MXZzG2By+qrfHlwApma5OzUkPOJWvxRrcky3nPI0Fj1b7Kzb6RdWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YoF0F3IM; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso114657165e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 03:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773225083; x=1773829883; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vg/rJbkjr27zoJh7G6fUGyq3XUZAC/xG31bL1Efg5D8=;
        b=YoF0F3IMDLyuyghbhpcSndLTHLVZD5SpPiO21FFj4uf1Koj7pwIhTGzRu0ZFiPsPBm
         lbDw6cVLZ/s9w9LcQJItAnAizOnQi7E9gs6C0Xk/U5VjwryhJgNMwc1SZwkog8v3/aA6
         SjgPwL/70hhHtPn/OzCd3CQ1hcn1kuzJUZk5ExEF80P22iAKjLMkpqTgIQemsI8Hp1bF
         gywvpWEd6iDdhoqEEzRQg3wnueowhIGKma7i489++kunSU8eCAngMFSoWOuyRNnf1yli
         l/xYUQmkOdj+xtNoT+D4bORfQ/Dl+7CSlUxyl1L0h4ekq72KVlzov63W+AmDmGn1PFmH
         MafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225083; x=1773829883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vg/rJbkjr27zoJh7G6fUGyq3XUZAC/xG31bL1Efg5D8=;
        b=DytmTkg0CJx5wdTW5eozQKHqpg/8GmxW0znlaPrSOAkaNXERFotqp4gdG6b8rR9N3C
         jurtOyDgofctj5OQWoZHiE3/ZeFrsvgeXJCcj70HM7JXcqwq4oiUXtzHCTsvnzX82BJz
         NLdHv/bNeYuu2XzsEQ7k28f3yu0RGr8LzIlhqgYycEq0R/4nWnI7aBj9aJY+0Qtxr3bj
         NaAHK5c7PDdUELbkfnqExSKjEV+oVx7kdcfhX8eBoWbC38dD4ZxQcRNPUVFCHXQnZWyf
         AD23qbnbH5dK+sVn/qyC8jcna12XQCHz4B9vfXhQe3AqvYv6JuDdVaY/+H6QX73oQdDB
         T2pw==
X-Gm-Message-State: AOJu0YyJxjgxm6wOlBU+h3iYl2MeYEEULdDgME/rvJdUSDurf17wYsbe
	M6YNgCqYlVxI2CZKeNmz5XmW1EQff9FfveuzHgz8IzxW3d1NxbbzrhCb
X-Gm-Gg: ATEYQzwh55AMIVl6jHGVRc/TJUqxKQ+mtZR9U5lmX/VCbJ6aIrhK2eIGSqdNcPOBQoM
	fwESOXj+Io2U76T6lH8JEI3MPPg2C9NpNYkeCFcqAna6I0usOfcV+jY3nDxSY1PM+1xU8NZdZeW
	C3pZIT0pHGZpOtteLOHS1Ds91Oqs3WJlF3JjTlJXP07VsuZA/ISwVm+53HFyF72/78if33gKRhx
	uO/2eFdmGwulZFxAAAEXwKxgvFW64Ev6GdAJw3GlYB4uA2KAJ+/H4FS5mFptsQ4irbyTGwtnlCH
	5hx3Gl2KZNKJT5chwG3r9geA8UE2ojinzoQmqiYODwG0patFxldnkwfEpPsz1k+PXF4mDI5CrnC
	t0A8QZh7q11kdg/5IAmrDvsurhAvsbQfZN+Y7njsIcp5ZKKd4msVtr8zdGsMJxuFlS0biRhIQ6g
	mdrlYF5fiKY/TtJ16xXeh6NzBdjk63jo8=
X-Received: by 2002:a05:600c:8b45:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-4854b0ac451mr31033355e9.7.1773225082280;
        Wed, 11 Mar 2026 03:31:22 -0700 (PDT)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0bff95sm27652875e9.3.2026.03.11.03.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:31:21 -0700 (PDT)
Message-ID: <bd251f9c2605e802807f638d82cdbb93e2b98d39.camel@gmail.com>
Subject: Re: [PATCH v6 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linus Walleij
	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 10:32:06 +0000
In-Reply-To: <5afaaffd-3817-4c8c-be32-3a3d13902147@roeck-us.net>
References: <20260303-ltc4283-support-v6-0-efe11502fad2@analog.com>
	 <20260303-ltc4283-support-v6-2-efe11502fad2@analog.com>
	 <5afaaffd-3817-4c8c-be32-3a3d13902147@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 95A9C2623DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33117-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, 2026-03-06 at 09:41 -0800, Guenter Roeck wrote:
> Hi,
>=20
> On Tue, Mar 03, 2026 at 05:00:41PM +0000, Nuno S=C3=A1 wrote:
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
>=20
> Feedback from AI review below. As far as I can see, the concerns are vali=
d.
> My own comments are in [ ].
>=20
> > =C2=A0Documentation/hwmon/index.rst=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0Documentation/hwmon/ltc4283.rst |=C2=A0 265 ++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0 1 +
> > =C2=A0drivers/hwmon/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 12 +
> > =C2=A0drivers/hwmon/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> > =C2=A0drivers/hwmon/ltc4283.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 1780 +++++++++++++++++++++++++++++++++++++++
> > =C2=A06 files changed, 2060 insertions(+)
> >=20
> > diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.=
rst
> > index 559c32344cd3..eab95152abee 100644
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
> > index 000000000000..225ba886531d
> > --- /dev/null
> > +++ b/Documentation/hwmon/ltc4283.rst
> > @@ -0,0 +1,265 @@
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
> > index 13ae2f3db449..38d22cf622b7 100644
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
> > index 8f7ce66ae3a2..c529f622c2b8 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1158,6 +1158,18 @@ config SENSORS_LTC4282
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
> > index 556e86d277b1..cb77938dbe07 100644
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
> > index 000000000000..83f1f741abac
> > --- /dev/null
> > +++ b/drivers/hwmon/ltc4283.c
> > @@ -0,0 +1,1780 @@
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
> > +	u8 raw[8];
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
>=20
> This reads 8 bytes from `raw` which is only partially initialized, as the=
 block
> data read is 6 bytes. This accesses uninitialized stack memory (`raw[6]` =
and
> `raw[7]`), which can trigger KMSAN warnings. Could we initialize `raw` to=
 zero?
>=20
> [ Yes, the uninitialized data is then shifted out, but KMSAN won't know t=
hat. ]

Yeah, that was my reasoning but ok. I'll initialize it to 0.

>=20
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
> > +	if (val > st->power_max)
> > +		val =3D st->power_max;
> > +
> If `val` is negative, the signed comparison works correctly, but `val` is
> then passed to the multiplication below.
>=20
> > +	__raw =3D DIV64_U64_ROUND_CLOSEST(val * BIT_ULL(8) * st->rsense, temp=
);
> > +
> Here, `val` is implicitly cast to `u64`. A negative `val` will become a h=
uge
> positive number and write a garbage 8-bit value.
> Could we clamp `val` to 0 as well using `clamp_val()`?

Alright, clamp() it is.

>=20
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
> > +
> If `val` is equal to `fs`, `__raw` will be exactly 256. Since this value =
is
> later written to an 8-bit register via `i2c_smbus_write_byte_data()`, the
> value 256 wraps around to 0. Writing the maximum value to the threshold
> will thus inadvertently set it to the minimum.
>=20
> Should `__raw` be clamped to 255?

Don't think so. Will do the same as in ltc4283_write_in_history() for the e=
dge case.

>=20
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
> > +	u32 reg_val;
> > +
> > +	reg_val =3D DIV_ROUND_CLOSEST_ULL(val * BIT_ULL(8) * st->rsense, temp=
);
>=20
> `val` is not clamped here. A negative user input will be implicitly cast =
to `u64`
> and produce a massive value. Also, a very large user input will cause `re=
g_val`
> to exceed 255 and wrap around in the 8-bit register.
> Should `val` be clamped at the lower end, and `reg_val` at the upper end?

I guess we should clamp to vsense_max. So, val * rsense <=3D vsense_max

>=20
> > +	return regmap_write(st->map, reg, reg_val);
> > +}
> > +
> > +static int ltc4283_write_curr_history(struct ltc4283_hwmon *st)
> > +{
> > +	int ret;
> > +
> > +	ret =3D ltc4283_write_in_history(st, LTC4283_SENSE_MIN, st->vsense_ma=
x,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LTC4283_ADC1_FS_uV);
> > +	if (ret)
> > +		return ret;
>=20
> Is this missing a multiplication by `MILLI`?
> `st->vsense_max` is in millivolts, while `LTC4283_ADC1_FS_uV` is in
> microvolts. Since `ltc4283_write_in_history` divides the value by the ful=
l
> scale, using `st->vsense_max` directly results in a raw value ~1000 times
> smaller than intended (e.g. 60 instead of 60000). This prevents SENSE_MIN
> from accurately tracking the lowest historical current.

good catch!

- Nuno S=C3=A1

> >=20

