Return-Path: <linux-gpio+bounces-35361-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL6BCrPy6GkdRwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35361-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:09:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DB72B448438
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB52B307F4F7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139B137D13A;
	Wed, 22 Apr 2026 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwSGLXR3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4B937D10A
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873912; cv=none; b=BIRC6tZKdcx7agEyG7b4lrP0UYke5vo9VNzkAtO9aBcxDPyHPwNXQyn/BdWp55vtYuq26nrKDsC8XQMriA4Oj36/bejLPq6cZISiRGdwZ5QLHQ8Kx1sAWZBRBur2c1yF0nuFvSP4//9oNS5RscKh09cjmivr3IaiVw7w71s/eMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873912; c=relaxed/simple;
	bh=Tr/lZj2BPFruRnd6bHXXaaBZdHcN2WN1PTBnF3Qh+d4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ed0MrowFcDAUMpJoNbMRokxTGTaduZB8X8gFyM47dteETx9A2bIgYk7pok+67eYv6sOc3eRVGJ3qIQLq51O79nPnSPrin4yTRnj7cWWrAZS12Cgfr60Rx25ydubfxNVLv6KlgkyovSzidVfVpuyN0msM/5LRaP9eCSTEfNnF0Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwSGLXR3; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82735a41920so2325072b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776873910; x=1777478710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tB86gMfHGoJ2KWqInX4kv4EkEdH3ANzmQQzn8Z0dCas=;
        b=pwSGLXR32mce0cs4ZHu/q8OYuyqhxrYC6ATklbXOjPXvtEAq74kpx1YsXGoLHLxFh6
         aWg0VwzMbVcRzUscsrBRNT4KadttNSNyRDNE8+1LBcevCMPLl2ogUjsOaeavA2c0zWv5
         E9GGCTGkYtUbXt9YaBE80v0kCBg0bzJRL5nco6+25yud8yO8k+sCC2g/1R4UTR8TaqNO
         6wWNTnVLjLbQ0EfsAfE2nPL9spYEIeoyVIqec+OLt7IcuOzCCllkUESFf+0LKndov0O9
         FAY7LDVpbjKO1nOIXXt/gduyxCBpj4TFPR4V9Qnao20TbxSXLU36zsLieuQ8BP7wvYZP
         At1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873910; x=1777478710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB86gMfHGoJ2KWqInX4kv4EkEdH3ANzmQQzn8Z0dCas=;
        b=JVsdlrzKlKc1Fg+iUe9ziIG72j1YuHZU2UWzTR0Pt0zXxbMqnkSPBbsmjlo75AjlA7
         3Jsz8HIoj0FrVzXuXPgfhFPJ5HOV+kBSNxE4KrzQatqf/dFUkPDSscHyXEgP5DNj4VCG
         GLlbH+Hqaq5MswW1wLcQbG858kCYj313xUpTOLF00gGcANbnHvKk1UoKYqvZtiDdbHFD
         UTvB+l6/AmNMAgrN2y9rrHOv44IHzJC5blGcqUNbbR1g7x3d+TPKKM684kONmUS7B6G/
         gjFYYg2XZcVxLFyVKOeBlha4rOkZXRqiVIMYYa2Kf5/7cRnLL7Aid8aIxVkbQPJt85pF
         N0Zg==
X-Gm-Message-State: AOJu0YwleKxy3W1YZqYBUHDPQLo46xfopPrXYGvXQpmw1auVGo3B6dlP
	2EA3oGZ546mB+F6druR5l00sZEpFcrKHat5C6mAUZDFcDE7wrwcljSLf
X-Gm-Gg: AeBDievaa+gIJTnDKK+U1hemUPcoD3/5J+g7QTJmspiW48fCPfCc1ZT9ekJyoI2ksTq
	kbem74GMqMX4ThcpPJXo0LPomtAREcztosQ5vOIAcRnFpDA7b/QeUYAq+KSpzRtRTlVxL8WHoFk
	LTotF6hnWD4Daqhk7LRHiUWxS/araKT2Bd7QXPSl360NX+b79WNoqzAxV/tJejnp73MQorlNMyB
	fTER1QnZ313zbWuT40nX4CVc2tMztwPD9kWWFC0hZeCHOMbN0UE+Tyf9HudVaiS0fpY0krb0xy0
	cFWRHvXgg+iH0n0D1aqidSuaRHGGInQ7Jy1zvFS1x0kn/8MHdDCdZwZTL5RiIieZB+2e+5edxKr
	kgp3pVtmVoIkl8xn4KWJjx1vEVftW/LhFk1ow+HtE2v9zAVgmB8WKl7if9VoJVLTrjH6oxTH26w
	RZH4nAsk/iNRXU/s00ulMOTMlFF5Hv2M39R6HbHMfkMWiaANv+h8cocm7dVTyssson
X-Received: by 2002:a05:6a00:1956:b0:824:afe1:f7e3 with SMTP id d2e1a72fcca58-82f8c82bc5fmr25641307b3a.15.1776873909802;
        Wed, 22 Apr 2026 09:05:09 -0700 (PDT)
Received: from happycpu-p1.. ([121.160.151.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec003dcsm18151031b3a.52.2026.04.22.09.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:05:09 -0700 (PDT)
From: Chanhong Jung <happycpu@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] gpio: 74x164: seed the chain from DT at probe time
Date: Thu, 23 Apr 2026 01:05:02 +0900
Message-Id: <cover.1776872453.git.happycpu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35361-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[happycpu@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB72B448438
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi all,

This short series lets the 74HC595/74LVC594 shift-register driver
initialise its chain to a board-specified pattern before the gpiochip
is registered, via a new optional 'registers-default' DT property.

Motivation
----------

74HC595 chains latch their outputs from the first serial write onwards.
The current driver always issues that first write from a zeroed buffer
during probe, so every output comes up low until user space intervenes.

Boards that wire the chain to signals whose power-on state matters
(active-low indicators, reset lines, early-boot status LEDs, etc.) have
no DT-level way to express the intended initial pattern today, and must
recreate it in user space after every probe.

The property and layout documented here have been honoured by U-Boot's
matching driver (drivers/gpio/74x164_gpio.c) for years, so this change
also restores binding parity between the two boot stages: whichever one
owns the chain first can leave it in a known state for the next.

Validation
----------

Tested on stm32mp153d-ssonic, which drives 16 active-low LEDs from two
cascaded 74HC595s with 'registers-default = /bits/ 8 <0xff 0xff 0x00
0x00>;'. With the series applied, the LED bank comes up in its defined
off-state from probe onwards; without it, the bank flashes on briefly
on every reboot until the user-space init writes the pattern.

Tooling:
  - scripts/checkpatch.pl --strict: 0 errors, 0 warnings on each patch
  - make dt_binding_check DT_SCHEMA_FILES=fairchild,74hc595: passes
    (example DTS extracted, compiled, and validated against the new
     schema)
  - dt-validate on a built stm32mp153d-ssonic.dtb against the updated
    processed-schema.json: 'registers-default' accepted cleanly; no
    regressions against the rest of the 74hc595 binding

Patch 1 adds the binding property. Patch 2 consumes it in the driver.

Thanks for your time and reviews — feedback very welcome.

Chanhong

Chanhong Jung (2):
  dt-bindings: gpio: fairchild,74hc595: add registers-default property
  gpio: 74x164: support 'registers-default' DT property for initial
    state

 .../bindings/gpio/fairchild,74hc595.yaml           | 10 ++++++++++
 drivers/gpio/gpio-74x164.c                         | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

--
2.34.1


