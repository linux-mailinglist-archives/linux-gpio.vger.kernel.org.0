Return-Path: <linux-gpio+bounces-31214-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAdcMkDaeWlI0AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31214-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:43:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A39E9EF70
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 10:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F06FA300FB7B
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 09:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B705E34A773;
	Wed, 28 Jan 2026 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jADakhnf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0111A33C539
	for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593403; cv=none; b=GtXZOLtKh1l7QmtBDTFTUtC6Etw7Fxit+8rHJuAQalLSrq/LHMzdNGdqqizDdOWxRHVRMnU155E7K1lWNitNBj2xbnY9Ew7Dkq1wzkUk6gdy41zIYvKvjMREvItPNJrVp8nTQYp3QJsGQ+t+OCKYaqmsZf1nDbMdRTyvZb1WTKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593403; c=relaxed/simple;
	bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wlyx+Vx7CklYkTzRhSlNMfQgyU174bTdwR7K6P9C5ZjYBlhkGXcRPJA/9bQpPMMLN6pXnQgEmzlSqgbSpWa031iJrjkn03fBoonEVwP3qBu8x3iviaH0qzmh7mPmIOxwobUzNvG22nwAzYciqHDQNEjAW/7t8hERFMX79Uo6www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jADakhnf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-432da746749so3687152f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jan 2026 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769593400; x=1770198200; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
        b=jADakhnfc0qcVxohGd46xY/Hp3hxsOp+AMTPJdcbVZTEzMusz072E4fkW/elIVKuE8
         HyhslAvF0zxzucX3+ZvLd0sVZCKtHhKvSG5qlx41BiKtLEALZ4pR6e8YFAUEKxm/3B/s
         dj2MVfJeKwoYo3vGr45VJBmpcCB6W/fPkYD54Wup2hMNJ7RTq7px2pfBfwqJfgp/JE3W
         g/HAQETM4oxzKC7xyqHB3HJCHERYfQwZFb6diKni+rS98BF9ZUswwq7Mwj1lKYxo3dIb
         H9GyzTaLjeyLa5/+LNQozO1Q44xOlB1/R3kxTNvJwHZZs8tiQHOgn1JmAdPWUFeGKe3Q
         4hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593400; x=1770198200;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
        b=rvHy80wdXnYsi3IvaGyjgZvoMcXq1EY1yBWDr9VOS+EBoxKgILRLa8gv947yk1Mknp
         C5JTGZdH+ZEkOPLJGDD7CP5cnyoP1yMyxeT1IMsLqyyiWMHRBV5OrzNZI2oZ28tVnPTj
         ibmq15wQXMWw4ApEB9BVEqA9QdaQaqPtn4ZhOuOhMmO7Vt2Mn8qDGQUjBAafxAuY2Y7m
         mxnRrunotKthV3VIYOUBbC8W/CxG77FL0EuyoN94LDvmkmXRCgQCL1n1BL6n/Icp7ULh
         W6pxWAIFC5e5fY377m0VB2RaViUNGVjBV4Hkzdx1xXLGJYskmiOzPejQpqRLcXj14faa
         1NdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXECq9ryTApBa60TOF1lmOCoaw6YNTwjEeWvkj4XW/UVJjd78Q2LBmDAau50VlgXZbn1t2JiV8G747B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cwaJAGefcgIaS3uaBIa0s27vPwFQHAfdfR/INv1j2h24GjiK
	MzXKE7YUCT77kRA2bB8Lsp/WJHOM+3YRTPBWAcelcxBSmInxTt+IGuPZ
X-Gm-Gg: AZuq6aIVbgv1ioRRhCA5vHRvdnBRInB1oCWORFZsaQzeFIZ3mIfGt407eN9aKlczyhZ
	PZncjTCjD8dKcasIrZo5jMkL94q50wUvF6E5VETo9YrydYpKBmOuvkg6UxOve82eZqZ6SOnJ12I
	PU6b6S/STiHbtrtdezDnYp0bdoU6Pj/fCmaIJ7Zj4Rwi8kBwbmg/lz5Rd/VBXIWQyyUdJWkmYbB
	zHel0cdNPCho0Mqx43M+QMwyF895+yZKHHddlzyBH2FQ2nlrlTlW08VvvA+CBifPmdYAchADqig
	oh5+/ebaqxO0kQ8n1fzeTx/0CFOCTnMsXxUyFKUManHUVxXfABlY3I+LZvOsrS3GsJib/z5cIng
	jXMydvvJppHQUjgMjQBjzWleD+/XrMJE9x428B7wrhzTcfx8rK/dD3yuPe7VWTPUARIGYc3D/ak
	eSLD0pMbPvPhSteZNAwmQ=
X-Received: by 2002:a05:6000:2084:b0:435:8d02:b9cd with SMTP id ffacd0b85a97d-435dd05f1c5mr7512803f8f.26.1769593400162;
        Wed, 28 Jan 2026 01:43:20 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1048a54sm5346836f8f.0.2026.01.28.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:43:19 -0800 (PST)
Message-ID: <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Jan 2026 09:44:03 +0000
In-Reply-To: <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31214-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nonamenuno@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A39E9EF70
X-Rspamd-Action: no action

Hi Guenter,

On Tue, 2026-01-27 at 09:39 -0800, Guenter Roeck wrote:
> Hi Nuno,
>=20
> On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > This is v3 for the LTC4283 how swap controller. Main change is that I'm
> > now using the auxiliary bus for adding the GPIO device (done depending
> > on FW properties).
> >=20
> > Similar to the LTC4282 device, we're clearing some fault logs in the
> > reset_history attributes.
> >=20
>=20
> I ran the patch series through an AI review. Results are below.
> Please take a look.
>=20
> Thanks,
> Guenter
>=20
> ---
> # Deep Dive Regression Analysis Log
> Date: 2026-01-27
>=20
> ## Commit 5998c620fbd8: gpio: gpio-ltc4283: Add support for the LTC4283 S=
wap Controller
>=20
> **Context**:
> - Adds a new GPIO driver `drivers/gpio/gpio-ltc4283.c`.
> - Depends on `drivers/hwmon/ltc4283.c` for regmap and MFD instantiation.
>=20
> **Findings**:
> 1.=C2=A0 **Typo/Naming Issue**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - File `drivers/gpio/gpio-ltc4283.c` uses `LTC42=
823_ADIO_CONFIG` definition.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `LTC42823` appears to be a typo for `LTC4283`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `drivers/gpio/gpio-ltc4283.c:26`: `#define LTC=
42823_ADIO_CONFIG 0x12`
>=20
> 2.=C2=A0 **Logic Verification**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - GPIO direction and value setting logic appears=
 consistent with bitmasks provided, assuming
> register `0x12` and `0x11` layout is correct as inferred.
>=20
> 3.=C2=A0 **Regressions**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - No critical functional regressions found in th=
is commit alone.
> =C2=A0=C2=A0=C2=A0=C2=A0 - Code quality: Typo in macro name.
>=20
> ## Commit 82433332ce16: hwmon: ltc4283: Add support for the LTC4283 Swap =
Controller
>=20
> **Context**:
> - Adds core HWMON driver `drivers/hwmon/ltc4283.c`.
> - Handles I2C communication, regmap initialization, and MFD child creatio=
n.
>=20
> **Findings**:
> 1.=C2=A0 **Critical Regression: DebugFS Use-After-Free**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - `ltc4283_probe` calls `ltc4283_debugfs_init`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `ltc4283_debugfs_init` calls `debugfs_create_f=
ile_unsafe` creating files associated with
> `st`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `st` is allocated with `devm_kzalloc`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Issue**: There is no explicit cleanup of deb=
ugfs entries (e.g.,
> `debugfs_remove_recursive`) and no `devm_add_action` to handle it.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Consequence**: When the driver is unbound/un=
loaded, `st` is freed by devm. The debugfs
> entries remain. Accessing them triggers a Use-After-Free on `st`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Fix Required**: Use `devm_add_action_or_rese=
t` to remove debugfs directory/entries on
> driver detach.

So actually a nice deduction from the agent but not accurate given that all=
 the entries should be
removed in [1]. If you want it to be explicit, I can add the action but giv=
en that the dentry is
given by i2c, I would argue it's fair to assume i2c will take care of the r=
emoval. Thoughts?

I'm also planning to pick this up again but was caught by something else. S=
o hopefully next week.=C2=A0

On another topic, I also (you questioned it in another thread) looked aroun=
d and I do have a ltc4282
board with me. Given that I just need to power up the digital parts to acce=
ss the i2c bus, it should
be pretty straight to get a register dump. So if you're still interested on=
 that, I should be able
to do it.

[1]: https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/i2c/i2c-core=
-base.c#L634

- Nuno S=C3=A1
>=20

