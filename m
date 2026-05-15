Return-Path: <linux-gpio+bounces-36938-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKVdMqgwB2oQswIAu9opvQ
	(envelope-from <linux-gpio+bounces-36938-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 16:41:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3DE55199A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 16:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E75573036EEB
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 14:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8808A23A99F;
	Fri, 15 May 2026 14:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iP5J883d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4B23B3C08
	for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855888; cv=none; b=SR6/3kkLVkqaa5qWYVXdYF2dkK5tX/8OoApDac8ZnjhwKmaC15AlAAy3vZ7D19YpSSZZ6R/zJV3n1seGBbNPnigoNBJqor/ZbkT85fBepfjv/lhsPck7n4NqaV3/KGOgv5qX/SH42PQKvMSzAxEhL6gXNlAdWXKsRpP9OqQETdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855888; c=relaxed/simple;
	bh=Q6eQ/PnI/4lNyvGcIep9mTKMWp0lV6GD0D36jxEkonc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XGMWtQQz2VDhVAe0vOnEyqICZbKK0xOBVZb6dJzgIIQr8v//7RADEgcu7QJl09STkuawr78cDt9QM7Fjoq3HA/hLl1c9Txn5XK4QAcGMxTAHaCQLrnj6xzYmy7GgVCMwEQT8xFB02Zo11pSR97qDSuHkL4WuBeAAqCsN6kUesvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iP5J883d; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39396f873adso123377671fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 May 2026 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778855885; x=1779460685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=StZsbJeEJPo8M4uDdGQIgmZ75YI487IGeU37Pfexsek=;
        b=iP5J883d5YYYhZL3nq5nYkF82R8K4aq9dVpsDv+Uzcl2ucWsdmVD15/z/a+R1Dtk/I
         T6qTSt/mDC5mtdGeox4rVUwIDcjCQNs4LvzgyxkFdIB332GX8nppZG5d9bR0Bt7XAkjN
         /AN3rgSprHLTgiAPJ2iUZhX6YssvtzghIRGFdFbKazM/iV+Zo0csgvrxlSEDkpvQL9Li
         F52CLPLIHdmvvQfR77ucXscGnIkKCEXfJorXNUEmHfzj9+QgzJFMR8HmV4ZbJP9OSRod
         0l4cbYk5OwgETArKyE8rr2zgmlKzXaiaQtlswOgQ+wx8tKW8ob+ADY7r74FwxJAQ5ReI
         z/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855885; x=1779460685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StZsbJeEJPo8M4uDdGQIgmZ75YI487IGeU37Pfexsek=;
        b=NgxPvjvNSXVCbeYfoeMKzhGDVXXAZq+7s2aXG38qYuZKaiaKtaOvNLHh2l9Z7L8ypm
         TObg0jK33Rxjd+urZB9ofztk7BkodpN8pQhtYfvbbsckW9PRNswku6/nagkIRUFg6IbI
         LPw2X3mkqnTJRUUNt11+NOgFze+tyc77p/urkLrXDpzzuBLdoiXWorbrOiUNEVq6cs7L
         eEPdhz/HF2NlDbVvl4TEMeRdja3KRgtM1YkFWsne4KVDhGMv6/Q9lcw6cg0ynzDHpWi2
         p43aSHurtm4cyuj6z2VOkiWmx0fzfpDH+0BBUy5YhSQk1CJ/fRaI02PMgUT9qdrxQ1+d
         r4GA==
X-Forwarded-Encrypted: i=1; AFNElJ/897hKJRQpiqi4WDOpPl6t/qUpsuIv8155Y45sLlR4PuH2vQ7TzEq0bKPfW2pdk6hJGSTY3ISpRPId@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5oFrySmyhpsf2mvuqjX52BIYWjlTX/9byIO8Vhb6qOnFZZFWK
	a5satdCRnvj3FlewQFWwZq/R16YExo4i6ERUwm3bumJzdASqPhJFq0To
X-Gm-Gg: Acq92OFLt0FM9UqJolHNzPluv1AeQHn8bSarFYWVVDkvYw21e5T5zXPa+XebIx38DsD
	OhS4y0jqRvdJKWSaE8HlSPJieWqGVe4e4zrrhFDAeK09VRw48RJ06FFkzbWkcjf2vBJ39xsF0BE
	PCGmG3NFS4QmkGAGGv4NiZWcNCIxloqVv7ByeUtRHVNgaBbgWHShD4sEaT3q4MERaUmUwIt+TOW
	0SuLCOy4ieVXwNhLhcCoXacdv0YnGSh6OpU/CIlE+ag9r+QVAeATCpA99EZ+IvtsLHlfYLwo3AW
	SvcTL+tcspmVJ3Om81uZMElneNNS/TCXyo33VwC1pjAxputdq9JhNg/Sx45WwUsU2Xh9W8BY9ml
	1xKXaQ5bMUlCajPn8mlMmhOga/i0cECBj/xixjqoZ4zok22DXBmf4eDVGVC6QXQgJ6cUc/8N7MR
	BZpY0hMhxQO6kvK6kYMH0WFE3mZkUfRksEmJj4msynAzRRfe+EmFOkWc4=
X-Received: by 2002:a05:6512:3a8f:b0:5a8:86a8:2e09 with SMTP id 2adb3069b0e04-5aa0e733fcdmr1252639e87.7.1778855884497;
        Fri, 15 May 2026 07:38:04 -0700 (PDT)
Received: from qwas-jet.office.tvip.ru ([188.227.12.10])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb38061sm15539511fa.37.2026.05.15.07.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 07:38:04 -0700 (PDT)
From: Nikita Maslo <nikitamalco203@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Nikita Maslo <nikitamalco203@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Broken bitbang 1-wire on Amlogic after kernel update
Date: Fri, 15 May 2026 17:38:00 +0300
Message-ID: <20260515143801.2132974-1-nikitamalco203@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A3DE55199A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36938-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikitamalco203@gmail.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

I was running linux-6.12.67 on a hardkernel odroid-c2 (Amlogic S905) Amlogic board with DS18B20 on
w1-gpio (1-Wire bitbang), everything worked fine. After updating the
kernel, 1-wire stopped working the DS18B20 fails to enumerate or
reads back the broken-bus, and dmesg
gets flooded with WARNINGs from gpiod_set_value/gpiod_get_value
called from w1_gpio_write_bit/w1_gpio_read_bit.

Hardware: Hardkernel ODROID-C2 (Amlogic S905).
Kernel:   linux-6.18.15 (also reproduces on linux-6.12.69; last
          known-good for me was linux-6.12.67).

Device tree fragment used:

    / {
        onewire {
            compatible = "w1-gpio";
            gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
        };
    };

dmesg, captured on ODROID-C2 / linux-6.18.15:

  [   59.102855] ------------[ cut here ]------------
  [   59.102891] WARNING: CPU: 0 PID: 1145 at drivers/gpio/gpiolib.c:3880 gpiod_set_value+0x78/0x88
  [   59.103569] CPU: 0 UID: 0 PID: 1145 Comm: w1_bus_master1 Tainted: G        WC          6.18.15-current-meson64 #8 PREEMPT
  [   59.103618] Hardware name: Hardkernel ODROID-C2 (DT)
  [   59.103658] pc : gpiod_set_value+0x78/0x88
  [   59.103687] lr : w1_gpio_write_bit+0x20/0x38 [w1_gpio]
  [   59.104161] Call trace:
  [   59.104175]  gpiod_set_value+0x78/0x88 (P)
  [   59.104210]  w1_gpio_write_bit+0x20/0x38 [w1_gpio]
  [   59.104238]  w1_reset_bus+0x84/0xe0 [wire]
  [   59.104272]  w1_search+0x88/0x2a0 [wire]
  [   59.104304]  w1_search_devices+0x54/0x90 [wire]
  [   59.104336]  w1_search_process_cb+0x84/0x170 [wire]
  [   59.104368]  w1_process+0x1c0/0x238 [wire]
  [   59.104400]  kthread+0x14c/0x218
  [   59.104432]  ret_from_fork+0x10/0x20
  [   59.104464] ---[ end trace 0000000000000000 ]---

A symmetric WARN at gpiolib.c:3501 fires from gpiod_get_value via
w1_gpio_read_bit on every read slot.

After a little researching, the suspect commit looks like:

28f240683871 ("pinctrl: meson: mark the GPIO controller as sleeping")

I also tested bitbang i2c-gpio on the same hardware after the update,
it seems to keep working.


