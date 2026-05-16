Return-Path: <linux-gpio+bounces-36976-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCALJIr7CGpgDgQAu9opvQ
	(envelope-from <linux-gpio+bounces-36976-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:19:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DA555E3ED
	for <lists+linux-gpio@lfdr.de>; Sun, 17 May 2026 01:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 166623025722
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2026 23:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C709139D6D4;
	Sat, 16 May 2026 23:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Qv03CgDy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9194238E10C
	for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973539; cv=none; b=g35GZ0ns/eR7UVWmEW8qK2VJl5kaYoUIJZOAINXKbS1slUaN05CsXSJOWXJ9htlmTKcXYj3jHonkmYCjRpSdbvdA10eHlyiW27YIFjHvPelmGhxMnzWk2YX6Y001Yfl7SukwnSUA/xHoxNdnUEo6/rztEuq+dTP6QfisWfJRTnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973539; c=relaxed/simple;
	bh=wsfn1MbAM5mT+uBLpfkIk6VPVX8dfOOxOV1mjJK+BXo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trYXt6iWBrNV78Ku+Dcu5WxZSGR+AGNMB9xm/y60luO2v5AuqkZV6fYPh/K7BzVqmyfBVz+NtQXtZaEzuG3TAn7NwHVxb4m5urfpL48fiTZTMR66CDgu3wQmW467ulpovlntYY2vrLXrzLmAbIWbN+DuSPR4JQBdhqlRzDdzG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Qv03CgDy; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1329fc4bf77so1695351c88.1
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2026 16:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778973535; x=1779578335; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fz3Z7xk7sYmHcnQNijrkJ53RnF0rGP8+OWF9DAgytjM=;
        b=Qv03CgDyvOtJ3yhwxBix4g1f2iG0VUI/rEfH7gsXqowJV2GtxEtLhWU7uwkbTKl49w
         QREC+Sp38okf9h8tRGbtzdRtMzH/UpJopsRTS5m2PHgtoVaagPbHP0Nu+gpWAaboYRHS
         FUpSAyFzYDawnv+31sZqcDUjSD9Jg13nIMlAa1lPjT+oovpheQKJI6TJ1u9Do2Qysc/Y
         h93ayIkuPwiTYc4Gj99ffCTlkjRAXefR4b/3nWxuftFyiv+xX1AditSExVNB9Y1LqQh2
         ks+yCj5d/iMyQOHgJpCS3tCBKkeFZXNQ2oVlCZXeZiwUj3PrwpSAG6YExfYKU7YUXIee
         oC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973535; x=1779578335;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fz3Z7xk7sYmHcnQNijrkJ53RnF0rGP8+OWF9DAgytjM=;
        b=G9lwgPGB5HeHdfmEYYVGu8GeTIwQS3nolQr0ttm7wj6SQm18bbX3fo9B1F1v+dixCs
         TVkvoMeeWRttFTUh2XSGxfGNvxuwnb/h63QIFhRgrXBZqSxF8nvVr7Dfghv0FoQAR3kp
         CsKEagzg04ca3sgE5e8taCYkMvaC1yL3YKNfZGndhHiFpvCzfAQq4u14zfKvgG5/yJV6
         Vvdp6v2dXgyWKqDkiBxwUXnO2qZ2yFx2o9se8w8Bfl9V/FrGvbcpTdcRxPrWreWIo44l
         XyFgL4fMeRm0we26eLYko/vrqmmtyNwP86yGyTbj9fBD2bTUJX1uSbA3A7mdvSIfSWcp
         JExQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lkLzlbKpuuWyppxGJwTmXe+ySf/WOAcTC+Xx+BhtFUlMo/Tr0VF5U88tCXud2RtIzmrlcc7JBOXMp@vger.kernel.org
X-Gm-Message-State: AOJu0YwCg7gdXNkPWU7MmWPC2my1/i754GvyozCqXAReUlZtbBEfTTfK
	1t6si+HD7RcnEOoxbmC8oDz5KorG7baGAsKVnOmJPWZZFftp1YJL+yMjzRTMszM2A960aDTzyd1
	oX7I5efo=
X-Gm-Gg: Acq92OGYnrXzE0YpqH6v01FHWSSTOz64m0BoEGoFYDjr9dV4OyUnmg51TayyAFFUjiI
	Z5an0YON/UJHBpr3ieL3Htm/bcabmei3UY5wOFHRvcjeJhgu+q9uhjjtvkDV3BCmaxf/7TC+JCX
	BgASiqrBmnPntjtYTw6ysMytl/pjM5vB7eo+OZ3VLNsuuqwtIDrteAcFxqMpjeUYugLTKue6oRZ
	IRkiY17hNtrUw0fmtXat9phTeHFCLUbdW6EZIhwPWEwWa4zbXOULX/vbdSgap/SdZvwBlE3UIHJ
	Pop7J9tZtfDFRSlHK/vfj49yC+6W7bIewbT2OYQGeo0sKx2NfB7q/V7Oq4V8yB7reD0wpjPZ+/K
	mEujDrxm3tJ59LXkFoPNWp2FAy2D35hNoUaYmIbWtZ1pvs200L21zxJfi4hOuDQHozycUU8eBga
	Lrd+BHa8BbdFEk8P0JJXtuxyLq9Q==
X-Received: by 2002:a05:7022:e984:b0:127:3915:76b2 with SMTP id a92af1059eb24-1350484e87amr4490067c88.27.1778973535255;
        Sat, 16 May 2026 16:18:55 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb9ef5sm14722254c88.2.2026.05.16.16.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 16:18:54 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 0/5] hwmon: (pmbus/adm1266) GPIO accessor fixes
Date: Sat, 16 May 2026 16:18:46 -0700
Message-Id: <20260516-adm1266-gpio-fixes-v2-0-801f13debcb2@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFb7CGoC/32NzQ6CMBCEX8Xs2TVtkcZ68j0Mh/6ssCZS0iLBE
 N7dgnePX2a+mQUyJaYM18MCiSbOHPsC6ngA39m+JeRQGJRQWtRSow0vqbTGduCID54pY3DBGS+
 FPXsFRRwS7UHx7s2P89s9yY/b0tboOI8xffbXSW69vweTRIHVJZgQKuOMqG89zWMXh5NlaNZ1/
 QJeHLXjxwAAAA==
X-Change-ID: 20260516-adm1266-gpio-fixes-dbdb9c10a4c2
To: Guenter Roeck <linux@roeck-us.net>, 
 Alexandru Tachici <alexandru.tachici@analog.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778973534; l=3922;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=wsfn1MbAM5mT+uBLpfkIk6VPVX8dfOOxOV1mjJK+BXo=;
 b=za08h5g4ZpshHcx+Wg3asjfc48fBSz7c/93TL0dYoERmUOOCNValX69QCzPvKeDUMLaJF8vOn
 o1MSwKepTH+D+e5GUx4i9YPVftkcjnnecfZSpXDwcw/Q5HhCrj2dIX8
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-Rspamd-Queue-Id: F0DA555E3ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nexthop.ai,none];
	R_DKIM_ALLOW(-0.20)[nexthop.ai:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nexthop.ai:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36976-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abdurrahman@nexthop.ai,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nexthop.ai:email,nexthop.ai:mid,nexthop.ai:dkim,roeck-us.net:email,msgid.link:url]
X-Rspamd-Action: no action

Five pre-existing bugs in the adm1266 GPIO path that all landed when
GPIO support was first added (commit d98dfad35c38).  Each is
reachable any time userspace queries an ADM1266 GPIO/PDIO line via
the gpiolib char-dev or sysfs interfaces, or reads
debugfs/gpio-<chip>.

Patch 1 caps the PDIO scan loop in adm1266_gpio_get_multiple() at
ADM1266_PDIO_NR (16) instead of ADM1266_PDIO_STATUS (0xE9 = 233, a
PMBus command code that ended up in the bound by mistake).  As
written, the scan walks find_next_bit() up to bit 242 across a
25-bit caller mask, reading out of bounds and -- if any of that
incidental memory contains a set bit -- driving a corresponding
out-of-bounds write to the caller's bits array.

Patch 2 drops a redundant "*bits = 0" reset that sits between the
GPIO and PDIO halves of adm1266_gpio_get_multiple().  As written,
the GPIO bits the first loop populates are immediately discarded
before the PDIO loop runs, so any caller asking for a mix of GPIO
and PDIO lines sees the GPIO half always reported as 0.

Patch 3 adds the missing "ret < 2" length check after the three
i2c_smbus_read_block_data() calls in adm1266_gpio_get() and
adm1266_gpio_get_multiple().  A device returning a 0- or 1-byte
response would otherwise compose pin status from uninitialised
stack memory and leak it to userspace via gpiolib.

Patch 4 moves adm1266_config_gpio() past pmbus_do_probe() in
adm1266_probe() so the gpio_chip isn't registered (and reachable
from userspace) until the PMBus state the GPIO accessors depend
on is initialised.  This is a prerequisite for patch 5.

Patch 5 takes pmbus_lock at the top of adm1266_gpio_get(),
adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
GPIO PMBus reads can't land between a PAGE write and the paged
read pmbus_core does in another thread.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v2:
- New patch 3: reject short block-read responses in adm1266_gpio_get()
  and adm1266_gpio_get_multiple(), so a 0- or 1-byte response from
  the device cannot leak uninitialised stack memory to userspace
  through the gpiolib interfaces (Sashiko review of v1).
- New patch 4: move adm1266_config_gpio() down past pmbus_do_probe()
  in adm1266_probe() so the gpio_chip isn't reachable from userspace
  before the PMBus state the GPIO accessors depend on is initialised.
  Prerequisite for the new patch 5; without it the lock acquired by
  the GPIO accessors would race adm1266_config_gpio() / pmbus_do_probe()
  setup.
- New patch 5: take pmbus_lock in adm1266_gpio_get(),
  adm1266_gpio_get_multiple(), and adm1266_gpio_dbg_show() so the
  GPIO PMBus reads serialise against pmbus_core's PAGE+register
  sequences (Sashiko review of v1).
- Patches 1 and 2 are unchanged from v1.
- Link to v1: https://patch.msgid.link/20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai

To: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
To: Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-gpio@vger.kernel.org

---
Abdurrahman Hussain (5):
      hwmon: (pmbus/adm1266) cap PDIO scan in get_multiple at ADM1266_PDIO_NR
      hwmon: (pmbus/adm1266) don't clobber GPIO bits before PDIO read in get_multiple
      hwmon: (pmbus/adm1266) reject short block-read responses in the GPIO accessors
      hwmon: (pmbus/adm1266) register the gpio_chip after pmbus_do_probe()
      hwmon: (pmbus/adm1266) serialize GPIO PMBus accesses with pmbus_lock

 drivers/hwmon/pmbus/adm1266.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)
---
base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
change-id: 20260516-adm1266-gpio-fixes-dbdb9c10a4c2

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


