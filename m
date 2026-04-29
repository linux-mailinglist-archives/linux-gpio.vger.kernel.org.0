Return-Path: <linux-gpio+bounces-35796-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGajAvIV8mnEnwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35796-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 16:30:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B42495C0B
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 16:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 076C5304C4F9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2026 14:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAD3336EF8;
	Wed, 29 Apr 2026 14:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIRtjrT0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFB126F28D;
	Wed, 29 Apr 2026 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777472906; cv=none; b=Zdvm7mH0rA2cNzvkh/VeroOlLVUvfNyjkf7or7AZ4Q39N6tFtAQ6VzkOf2JWVAMNE556QhM2FiLNAVi5Vb2LwfK+q/pRWbP3Y6UJZK6iwzCwm1ujtM+lRumQnP5WAk3zRgy4gCPIDGMj05gLHBbl8TZQYN5dMtgOGDH5C1JCv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777472906; c=relaxed/simple;
	bh=NG7wnStbNGVSAyuO0z858ZLJDnWlS6H44BMy/Yc3QyU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CuVRgm8DS3hQQlGLBdDOkjlxrp6kmYxbXk4gn1xXnMltEHFPKorrvNlagFeiR6dGjNeuEUx721STS9Q1kcEPOyuUZhmI0IzYeeI2Qy+xr1xH/0XOQTCZXQ/vUrd0D0/4TjsNvpUUxqMl3P5M6wUAcOjiFcAk5afhrKpDR4couhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIRtjrT0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9C9DC19425;
	Wed, 29 Apr 2026 14:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777472905;
	bh=NG7wnStbNGVSAyuO0z858ZLJDnWlS6H44BMy/Yc3QyU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=eIRtjrT07U1BuQAtMlrSVQZ9LmUGDj10M3/RVMnxp8+ifKGkZ4HpSEdXylsvcZoa2
	 4eoZZh08xiM59d1o6JqyZaW8H2mcet+yuE6eEBe93VKmO9HLLS0GLWvFyvw3JAqgTt
	 AV2BCubKb/ZNSFVz5cV4kHens53FQjHOvmIv0Po1bKjFfe/45CGl85AQ/ZMCu9JQPp
	 x1yZAAdPmd1ro7acS5VpP219rPEHzisn3sySQsfGbLO02edqL/FE2QhcD7edekH5uA
	 UD92jG/IRJ3vco1XKUQU5IJyEd+ceH7h8IluhqXscOERnR34ytpEZvIQlNCdihhMuV
	 +OfEdbIQDF8nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B159DFF8875;
	Wed, 29 Apr 2026 14:28:25 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Subject: [PATCH v11 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Date: Wed, 29 Apr 2026 15:28:25 +0100
Message-Id: <20260429-ltc4283-support-v11-0-27ccde619dad@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOQW7DIBAF0KtErEs0DHjAWfUeURcUQ4KUGgtcK
 1Xkuxdnk0Qoy/+leX9urPgcfWGH3Y1lv8QS01iDEB875s52PHkeh1owBCSQIPlldgqN5OV3mlK
 eOZAM2ljnOqtYvZqyD/F6J49fNZ9jmVP+uy8stLXvrYU4cB+8EB1gsAN+2tFe0mnv0g/bsMU8A
 ahbwFRAaTF47LpBo2mA/gEooBboK/BN5ILTqkcSDSDgSUDTCgK2HwJSUKR64eQLsa7rP79Y2VF
 1AQAA
X-Change-ID: 20260303-ltc4283-support-063f78acc5a4
To: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777472958; l=2151;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=NG7wnStbNGVSAyuO0z858ZLJDnWlS6H44BMy/Yc3QyU=;
 b=gUGEFQCje73mGm/tKWu/14p63uX6sHrdYTPKrCSRt8QAir2sDiCmCa7D2DItWF0PGosEJ/Mp2
 Vhz5mDIKiJQADoYmyy6Ws5DoYACSB+kweAMtxjZlw5RGo8vAY8goH54
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com
X-Rspamd-Queue-Id: A7B42495C0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35796-lists,linux-gpio=lfdr.de,nuno.sa.analog.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[nuno.sa@analog.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:replyto,analog.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

This is v8 for the LTC4283 how swap controller. 

Similar to the LTC4282 device, we're clearing some fault logs in the
reset_history attributes.

Guenter, for my last email worrying about rsense low values, this is
what I got internally:

"10uOhm at the smallest sense voltage of 15mV would be 1500A and 72kW, which
seems a tad excessive. The highest currents I’ve seen are around 200A, and
the -48V market 4283 serves is generally a lot lower than that. Normal values
are around 200uOhm.  I’d say the resolution should be around 1uohm and if a
minimum is needed, 50uOhm is probably safe."

For the resolution, I'm pretty sure I got the tenths of micro
resolution for ltc4282 so I just kept it in here. So, if you don't mind
I would prefer to keep it this way to be safer and changing that now would
require me to change some formulas and I would prefer not to do that at
this stage.

---
Changes in v11:
- Patch 2:
  * s/LTC4283_VPWR/LTC4283_CHAN_VPWR in ltc4283_read_in_alarm()
- Link to v10: https://patch.msgid.link/20260428-ltc4283-support-v10-0-4f26f46491c3@analog.com

---
Nuno Sá (3):
      dt-bindings: hwmon: Document the LTC4283 Swap Controller
      hwmon: ltc4283: Add support for the LTC4283 Swap Controller
      gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller

 .../devicetree/bindings/hwmon/adi,ltc4283.yaml     |  272 +++
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/ltc4283.rst                    |  266 +++
 MAINTAINERS                                        |    9 +
 drivers/gpio/Kconfig                               |   15 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-ltc4283.c                        |  218 +++
 drivers/hwmon/Kconfig                              |   12 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/ltc4283.c                            | 1795 ++++++++++++++++++++
 10 files changed, 2590 insertions(+)
---
base-commit: 30a90fa04af6937493fbba20e3e923b5b5a162b4
change-id: 20260303-ltc4283-support-063f78acc5a4
--

Thanks!
- Nuno Sá



