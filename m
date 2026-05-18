Return-Path: <linux-gpio+bounces-37014-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDBxBdO+Cmrb7AQAu9opvQ
	(envelope-from <linux-gpio+bounces-37014-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:25:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222C567764
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 09:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BE2E30221D3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 07:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7E03B9608;
	Mon, 18 May 2026 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YO4QrE21"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896C3CF663
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088747; cv=none; b=kJtDzG1xZaaZ/PVsUxG7v7Z74MkxvfbngxU/CHaT21RflGh5T6gzgdCZ1UsEq7aajkRSa+Hurq+ndiW31+Co84aR8xBN2yB68BD3PH7c0HAf3JuEA5V9a5DYg7RS6zYKaFhJONpPLyxWhcg5uS179KCBrgP7ye1y0PTOMtCkpIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088747; c=relaxed/simple;
	bh=3zgbl+Vnys9G91p4kZihIoo0LDe81gK1wYRdxc8lXZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qlet0SwXEino8zhO1+tclVYDk6KB2jIDpwfcpw98oHDGWDZ74ZGnlFftbthS/yAt96c8OLET4KC8ZX0fmvoFa8qxbG9lUPXBmUsJr4iAJxaeoo9j1Iq38SF9vwrfXYRldy7uQdWTmKKh6nKW11GbelUVEl+LqclUHtfZa6x82uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YO4QrE21; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bab82d75fdso8184555ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 00:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779088745; x=1779693545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kNGdCGqRn/4V78cFmjLpgCf2Ei+cJeExb1kfSHeZ4PQ=;
        b=YO4QrE21KyCyn8xQFpCXauJD1KutqJGdUXUx/3hzjt1Y7sd8YZeCPj3NVpRCMuY7IR
         Mq24CAhGIybKe4cp0OR9Cug6RwAGKdW0KvqeTX/PcUN6RCs0ZGvWwPFmVyHkGQpjJnPd
         2J9FufCbpW3Uv7LcAD9eGqkHiXylZA2vgry0NEPPc7KG72ooOnASDnJiPdoQ5pycOCli
         G3k8w2Snr5tamtk5FGAgTOac9ELYZtt7unGZsPhzvdWJHG2FHmyPHcIeGziQ+m36oARN
         +pQDjFCMEeADNcFOaL2IYOKyC+AJJ+sY3EQIGc2xjGZU+DN1nLVz/3lb3NZwriGfbWdp
         nvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088745; x=1779693545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNGdCGqRn/4V78cFmjLpgCf2Ei+cJeExb1kfSHeZ4PQ=;
        b=DbbzTIryE/Vc2sSE3Y8dNcCOMK2T9jBhHVpJBODdRKmIbcn1krilf5ZeTXFjeul/CK
         PC4UzScFfdf24wziORV8skC4wS/1Y3K6ibWWkLugjGQS6VnFa599EFy5ZtIDUUO7HNNN
         o1ejh2I9qlgfRiwjo9RUj0j2wChReEYSnLWxKKuH/0/JmOkMBWpjKqxrYo5QwPGtsB/u
         9E2FsTnYCK+Qx+rc5jIUl2qOPz0CtRGZx+QoJSRazsYZcjQWOP7iWaCsZcVVS51xSl0S
         bja1IPtaFos00STrJd8KaZD61D4jtt+yzSPMf7wbdrdb6CBtHZfdgQl+umCtyHXHpD3V
         nX8Q==
X-Gm-Message-State: AOJu0Yyxe+9pwuqGRIQMQOomAyivkMLdxJ5yyFXJK1yEUgpWVywsXnil
	HizPMB89yKlTg8/aLNB0PcTV3WlC5h0gabMlwjkfNAg3iA0S0SsMTEiR
X-Gm-Gg: Acq92OF50Ek708rMCeaqsHIyc2RL7O1VjMBG4nULOA0m/Wosk2loUijlSStqWNb6huc
	lWi+ec8abJnBEr2G2ZzNbCSM2TPpQ1seJwWlN/gFhzTkTWT0Nx1MH+i3yLeegbfb1BDHEK/exhX
	kwexZIzoElHalLVowFhHMAvcR9C6n26i5Zg4eWtfFQuV7wf5uw40cI+KWXkDW9ZRgpFhh2RZKW3
	wPrdZtrZjkZBXOLX2yIEpQm/lXUF9Usy/bwJwVNj8BE68kXDN1daooO6NdxrraGA3q6YC4oI+Zv
	sGC2WSZk0azvB7gC6xAyNrZQCFoZIo8jALRkiV7j2wg/vp5I610XPee+sJzvWv3NN8OPbx0S/Ch
	kY+WuYpj83ii3oNXmxc7jp+6eAVpDZYx3AmuuMyrH5KLzS7xNeaZ0SOGhsI48P97ExDQiatoBXn
	MtL/vHlgp9zO0dwrbBvYvRsRWtONd9j7JgQOQeuVGKA3g9YtyRQEr2aBHN/nqT0mIT1ilTpynT4
	ZhyDraEc7aVU5wUnOIpeCJm+kn1gHGHB8lfON4/L1V78fa4nSSbd4O2GvAxV5PM
X-Received: by 2002:a17:903:1250:b0:2b9:ea53:4cfc with SMTP id d9443c01a7336-2bd7e886e11mr147452075ad.19.1779088745363;
        Mon, 18 May 2026 00:19:05 -0700 (PDT)
Received: from hardik-yoga ([2401:4900:1c65:166e:af67:d4b8:e4e0:1695])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc4c2cd64sm62276215ad.78.2026.05.18.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:19:04 -0700 (PDT)
From: Hardik Prakash <hardikprakash.official@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: linux-gpio@vger.kernel.org,
	wsa@kernel.org,
	andriy.shevchenko@intel.com,
	mario.limonciello@amd.com,
	brgl@bgdev.pl,
	basavaraj.natikar@amd.com,
	linus.walleij@linaro.org,
	Hardik Prakash <hardikprakash.official@gmail.com>
Subject: [PATCH v4 0/1] i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7 14AGP11
Date: Mon, 18 May 2026 12:47:56 +0530
Message-ID: <20260518071816.26629-1-hardikprakash.official@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8222C567764
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,amd.com,bgdev.pl,linaro.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37014-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardikprakashofficial@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Patch 1/2 (pinctrl-amd GPIO IRQ fix) is already in Linus Walleij's
tree. This series contains only the i2c-designware probe ordering fix,
based on top of that commit.

The root cause: i2c_designware probes AMDI0010:02 before pinctrl-amd
completes, so GPIO 157 (WACF2200 GpioInt per ACPI _CRS) has its
interrupt bits cleared when the first I2C transaction is attempted,
causing lost arbitration errors.

Mario Limonciello suggested promoting pinctrl-amd to subsys_initcall
to fix the ordering without a quirk. This was tested across four
combinations:

  subsys_initcall alone:         arbitration errors, WACF2200 does not probe
  subsys_initcall + patch 1:     arbitration errors persist
  patch 1 alone:                 arbitration errors persist
  patch 1 + this patch (v4):    clean boot, touchscreen fully functional

The subsys_initcall promotion does not resolve the race on this
hardware — i2c_designware still probes AMDI0010:02 before pinctrl-amd
finishes regardless of the earlier initcall level. The explicit
device_is_bound() deferral is necessary.

v4:
 - Rebase onto Linus Walleij's tree (patch 1 already there)
 - Use --base so series is correctly 1/1 (Andy Shevchenko)
 - Add subsys_initcall test results (Mario Limonciello)

v3:
 - Fix variable declaration style in dw_i2c_needs_amd_gpio_dep (Andy Shevchenko)
 - Add BugLink tag (Andy Shevchenko)
 - Add -v3 subject versioning (Andy Shevchenko)
 - CC AMD engineers (Andy Shevchenko)

v2:
 - Replace custom HID/UID lookup with acpi_dev_get_first_match_dev() (Andy Shevchenko)
 - Use acpi_get_first_physical_node() for platform device lookup
 - Use device_is_bound() under device_lock() with explanatory comments
 - Fix dev_warn to use dev_name() instead of hardcoded suffix
 - Fix commit message (removed incorrect "existing" reference)
 - Add Assisted-by tags per coding-assistants.rst

Kernel bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221494
Related: https://bugzilla.kernel.org/show_bug.cgi?id=221454

Hardik Prakash (1):
  i2c: designware: fix probe ordering for AMD GPIO on Lenovo Yoga 7
    14AGP11

 drivers/i2c/busses/i2c-designware-platdrv.c | 77 +++++++++++++++++++++
 1 file changed, 77 insertions(+)

base-commit: 3812a9e84265a5cdd90d29fe8d97a023e91fb945

