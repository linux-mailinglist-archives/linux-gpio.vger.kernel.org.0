Return-Path: <linux-gpio+bounces-32655-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF3kNwu2qml9VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32655-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 12:10:03 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B9221F751
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 12:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5061303E3A7
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 11:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E8734EF06;
	Fri,  6 Mar 2026 11:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmGLmRIg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C31BC2FF
	for <linux-gpio@vger.kernel.org>; Fri,  6 Mar 2026 11:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795399; cv=none; b=LwcLPi42Q6eNnQgguianB70wTWnQCyAnMnsvApHbSYdsWXLn+xz2HO6BAaIsMb3+R+VrzxvTooVjXgsvj18vuIYxeqieJDJ0HIt+jwFLJBk7RFo94AnJdTGI20CghARGXDNuxpuJW2d8p+r1loq4pCmr7TyA+khd2EEtP224/1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795399; c=relaxed/simple;
	bh=37uj15VkYiEiK0DWYtrCmT0EZiHtcqIpATA720OLKgQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=gReN3CzN/x0i1IZ4ZgkIWWjkc900Qw+M+NFB7YrST2Uk24glBR08KHuIGtxbjC3zm0xr0EOsR74LUbJWdMaFQ7t/bOUc6f/VtdaivJECruCzHk1Fyo26w/zncfAUWvt+0A64LuzGJGHpoxwhmP6NtHQNKYHZuG+Q3/pxgiPLfVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmGLmRIg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so60229295e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Mar 2026 03:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795396; x=1773400196; darn=vger.kernel.org;
        h=mime-version:user-agent:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kttMBzHg+juqC6SVQbUdDrxVokJqpZ9PuLEVgaRB0Y4=;
        b=PmGLmRIgvxclAU7zYAjnZGS/3VcsDH53v240VqI1h+bd24cTKrfDQ6AS7aa97kWvki
         0lQoq31VRy6P+q/gcQuXzI+8zizayf05Nj6pgVjVIBKhWESRPEJkf6yS4UYue9M64ptx
         /BKms7Z7cDiIuJ+e0aqNhe7jFUKij2FvDToov3OnccbbQ1lMLyI/TOtLFs/UHCbpvaKo
         Iq6n3Z3V7UAv4mXOH40akR5iuYrmdHqh5AeC6eAy3Fwc8Wu8ci4qxG33+lk3SqCYaRPF
         CPn0/yk0Jxh7zDQ9fpHArLTHE9FHFMYBQmtxgROuE8EoJsa8MJTcvUlezs4KS5wlYxxJ
         7qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795396; x=1773400196;
        h=mime-version:user-agent:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kttMBzHg+juqC6SVQbUdDrxVokJqpZ9PuLEVgaRB0Y4=;
        b=Cyj1D5jvMqeiI7Yb9UnWAJ+wqPpmsBqNtYPE2BxUCwfo5M5hfxaZG1ZS+xKAmLGdUD
         X8/jXgDeYlXrGfYk31NVkI5wNOe9XjXCAmBkW6EvQe8kN2w5NePXmB7JaGURsL4KzAHw
         cwyI+aD9TzRe01ev/vArN2P0MTen2w48VwRAJPvJLrSo4MJ7lDVE8R3vSaCxZRN4D/bT
         LuHckJVRndhhBhYJmVHrCcBhpJ7LiYzRAaPpVjgXWSyXKHZpdtvJiEFw3OVsZx45heSO
         wlKM2kwejagm3KxSgTzrO1j+KaQ9uT7GME43EdS6qwyUbhfPe5UkoLwPiRypvXqtBdJC
         w9kA==
X-Gm-Message-State: AOJu0YxSiMavmIb2mMW96cTSZG8BK7WhPgnrd+DP5MZkv5z/cU8kW5/H
	GKzJv9xjVCS9Sb1kIJ1QiiK+M3jAW8jxKfEYpLSBfAvWVGuXskFp6Q44vKs5SaGO
X-Gm-Gg: ATEYQzwWxwKbOcdQH+LzQrZSQaMejd+GKUQ4hnyLtHPKnE4f0VFHSchSJlYNMxEc7x5
	giaSbpfLW8Cf25WTcmmQSzcMeK/bl+M9IuU0MhKO9lWz+beG0UTc67vTtaRJ6tDcYHxApRPJhEH
	lQDzx7+3FtBoNRJYF/TMpVec5jqremm8okH2t2kDw3XRBdpQkfv0aDUejjhCQDFi8C0PwgOGMka
	rv4thS5hDDjtWKMmF4NCpbXE8GG34So0gpvXROIUoTFaBRNkEhZ5VJOZbGixrMeuipAaomV75ki
	byvL6SM3Xnznk71QGzyDLGFUY6Az1pBw9e6kFRcYE8K+v5hk3k9DQhO8f7MVAVttwv800WEqrJZ
	MUqZ6uMZ771rDQwXfXJxyjmFyH4NW9zpmj5yIiWd+47gUa0pdj0ll3S5BovkTFVLzEN0Q9RDQ23
	b/vkULF5ZFDeyZGNP0/zuEobhxKWl2hLywT4vOOJuyM7e89FcONt8jOxIzAxUF2CYHtSZw3ieDm
	g==
X-Received: by 2002:a05:600c:1c0b:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-4852691c6e5mr27523605e9.2.1772795395665;
        Fri, 06 Mar 2026 03:09:55 -0800 (PST)
Received: from ?IPv6:2a01:e0a:fed:c460:9150:e0a:62e8:ed8a? ([2a01:e0a:fed:c460:9150:e0a:62e8:ed8a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9ccsm3788942f8f.19.2026.03.06.03.09.54
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:09:54 -0800 (PST)
Message-ID: <cf52e066ba190f52bbfbfcfdcbdf7addc8998616.camel@gmail.com>
Subject: Help regarding IO configuration of multiple lines
From: joussemetmathis@gmail.com
To: linux-gpio@vger.kernel.org
Date: Fri, 06 Mar 2026 12:09:50 +0100
Content-Type: multipart/mixed; boundary="=-/EScU3KCcacW4ESUqneb"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 53B9221F751
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ATTACHMENT(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32655-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:~];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joussemetmathis@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

--=-/EScU3KCcacW4ESUqneb
Content-Type: multipart/alternative; boundary="=-IpU0bdcI3+a7JxsZ87Un"

--=-IpU0bdcI3+a7JxsZ87Un
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to learn how to use libgpiod on a Pi 5. I created for that
goal a simple circuit with a push button and 2 LEDs, one of which turns
on on a button press.
Since I want to keep my program as modular as possible, I created a
pinconfig function that configures the pins according to the parameters
passed in main.
However, when trying to pass an enum array of gpiod_line_direction to
the function, the code no longer works and the LEDs no longer turn on.
I suspect it is due to the way the array is handled, but since this use
case isn't shown in the examples and that online ressources seems to
only talk about v1 of gpiod, I'm a bit stuck.
Could someone help me? You'll find my code attached in a zip in this
email.

Thanks in advance=20

Mathis Joussemet=C2=A0

--=-IpU0bdcI3+a7JxsZ87Un
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hello,<br><br>I am trying to learn how to use lib=
gpiod on a Pi 5. I created for that goal a simple circuit with a push butto=
n and 2 LEDs, one of which turns on on a button press.</div><div>Since I wa=
nt to keep my program as modular as possible, I created a pinconfig functio=
n that configures the pins according to the parameters passed in main.<br>H=
owever, when trying to pass an enum array of gpiod_line_direction to the fu=
nction, the code no longer works and the LEDs no longer turn on. I suspect =
it is due to the way the array is handled, but since this use case isn't sh=
own in the examples and that online ressources seems to only talk about v1 =
of gpiod, I'm a bit stuck.<br>Could someone help me? You'll find my code at=
tached in a zip in this email.<br><br>Thanks in advance <br><br>Mathis Jous=
semet&nbsp;</div><div><span></span></div></body></html>

--=-IpU0bdcI3+a7JxsZ87Un--

--=-/EScU3KCcacW4ESUqneb
Content-Type: application/zip; name="pinconfig.zip"
Content-Disposition: attachment; filename="pinconfig.zip"
Content-Transfer-Encoding: base64

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


--=-/EScU3KCcacW4ESUqneb--

