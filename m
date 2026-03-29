Return-Path: <linux-gpio+bounces-34371-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIs7NjmsyWnn0wUAu9opvQ
	(envelope-from <linux-gpio+bounces-34371-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:48:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93435455B
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 00:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9182300F5C5
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Mar 2026 22:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FE635FF6B;
	Sun, 29 Mar 2026 22:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AE+WXEZC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE930EF75
	for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774824433; cv=none; b=HIu5jRxaoyXztKuxyrb6rVnx1x+gQaaco9e/4spJ9ZozFNVtMmjJ+/v2Tn2mjNI59bittIz8OnN9uuG/+7QPSNFoW8j4Ja4rCocVramuFUD7Y9xea4oCGqBXltdiTZLzyXhfqn785xlxUjQ2lFr6swNf/2q9sBbo5yRrYwr8s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774824433; c=relaxed/simple;
	bh=zq6gDkkgz0EgiEfb/l1u6tCsi5Cu5yaY3sZxVmtTF4w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EqesnRA2UZPvMtoNvZV02YlcHQj/ZY+Byx2CT/AP82tsv49UrU/mv+3RfDnbpWEREHhk5QSbzQ7wkLQMRoaembxCQfzTLfZX7YRmXkhG4M+8BiyxBj+utKsj1XHnDpTvHAYGd0+SIcCu0cUDCzYB2CRieoNmYUQWFWN44Wq1bV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AE+WXEZC; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so7680825eec.1
        for <linux-gpio@vger.kernel.org>; Sun, 29 Mar 2026 15:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774824432; x=1775429232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApS/GEmTLQev4aIUqsAr4eNKyPgGdrlmvrkZf5VLHGY=;
        b=AE+WXEZCBEzTTwAv1tNdXveSUCCiNmIJBuYJiSBEKSfmWtq34Ncix7QQw+9WI4FH+S
         rlJgvXaZEc0NmiPRN1+4OAvh+aDWt81Ht8HQrGQPjSMaEulstGilJGqyJOdFlZvlw+ja
         zhtlFFeDZkcTH0mHsffUBHPPHEQvc0eElji+12Ayo3bApRMvHeagWVlQ2cuGAxMk38Fi
         OpSLTCrjqsNlzHp5K9hpinNa5x2mC002O2TcTioijI1XLGAqmNyGv+V2044FuC5XJNIP
         ZdUgt1BPKglqWG7q73gnkJuWWiwsa5qDdUDv3c7iGfSQ95G/dYMuLfE3cH2lHEcrBglg
         Gbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824432; x=1775429232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApS/GEmTLQev4aIUqsAr4eNKyPgGdrlmvrkZf5VLHGY=;
        b=gx0h6LUE5r9Hx/vx3g3N4hV98n08EVo472Uk2EUAxEO9bnnLEudV2Nw5eF0mPwqlm5
         cPLKaA178xKqWalLtBQ7IIN+frKrjxDT+uSnOZmQhRskHEE1nIgtJ3Y/jq6baBlHP0w5
         hl3bu5Z/xBU5mF81+8OQb07aD4hh7qUUfOSZoC25xytr1CExEggPMJoxjN/Ed61du1cQ
         tIPQPYSkSfMzr4rsNxQqOyXx6g3I+edq2lO5hbItZHYRIUKIlSErBhpASlc+lYSFkTUi
         Ub4ntjXS1tLOJJO1WF8ea8rh1pW1Jsad7XgCiTJ6QVLQZaDSKnpKaIicwX+/PPs4O9kF
         LtOA==
X-Forwarded-Encrypted: i=1; AJvYcCVUHHYdXhoH3ke5ibM4dC74zFfiui2d1zVQcPfDHVCWF7eZNb+QLVDo5jFMbSopQ//70OXQe1hzHgY6@vger.kernel.org
X-Gm-Message-State: AOJu0YzXR7MfbCqL17MtvOpuVDc0USowSP8xCDE6YpvMrWsBBKD+7Mir
	vYTuTMUGdljm4iXBXdCwi42p1R1/GjG4p6TiDPMquOowRf9R+pKc/oKg
X-Gm-Gg: ATEYQzz0jsMb/PC/r40+D9vo87tnX1lGkyF7H1CbUHAZZdO5hKZsNadonzct6/ZvnTa
	W9DO9CMJskiDPhMemVK7Q3/hbb/hEofo/UoSq8d9Rai4+7oKqEu4TaPmFp5zmfxLSPGApdvqvhY
	fZa4+y+oYme5TOdJDF07sAoNMjXvklbP5fWVh0yHEO69Icml3lMHFK8gQRtpzU8zRh2IrxdBh9F
	Qg77Y8wBszjOAQK3zZ2/3tSe0XRClKfr+u+qYbKCi1BK+Dd/mSsRy3AOwEEglBLYp+ff/xEBgW0
	xIzxMVHeCa/JaBJUf1V26wi/zUAsMx5pX6mvlIy7Q+UH8ScKvpo3PdqVJlsyHj9WdiSB10FKqt4
	kxYf5oUEzBkygkUV3UQw0NMhrRnTkQT0GqNNme4227BXFyyxgNyXOsuoZTUcf1tY6qneCe7jmhJ
	Ivrk6iRKGjvhycuPGM87hoXHo6RNzOmKxo8/R8SQZV69RClZ1MEK8vruCm0eiR/0lFcE2SZQHqs
	0Bv+OzEzEaXC0o=
X-Received: by 2002:a05:7300:6d22:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c185df79edmr5833234eec.13.1774824431654;
        Sun, 29 Mar 2026 15:47:11 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm5840295eec.30.2026.03.29.15.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:47:11 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v4 0/4] ti-ads7950: fix gpio handling and facelift
Date: Sun, 29 Mar 2026 15:47:05 -0700
Message-Id: <20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOmryWkC/23OQQ6CMBAF0KuYrh0ytFSoK+9hXFTaykSwpm2Ih
 HB3C25YuPwz+S9/ZtEGspGdDzMLdqRI/pVDdTywttOvhwUyOTOO/IScIyQCbWKtJILTre3JpXx
 o7lIo1CdZsdx8B+vos6nXW84u+AFSF6zeWaXKnuKqEFI22JRQghkohalIPvhn58fLY9DUF60fV
 rSjmB/TtnQUK/2DBMq/o0YBCJoLZ0ypsVZ2x92WZfkC2NJDtPsAAAA=
X-Change-ID: 20260220-ti-ads7950-facelift-ad8b5390a654
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: b4 0.15-dev-a6826
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34371-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 3D93435455B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The original reason for this series is to make sure ti_ads7950_get()
returns result in range [0, 1] or a negative error code to comply with
gpiolib requirement.

During review David noticed the fact that the function also clobbers
gpio state. Fixing that lead to adding cleanups using guard() and devm.

---
Changes in v4:
- rebased on top of latest next
- dropped the 2 already applied patches
- restored inadvertently removed mutex_init() (Andy)
- stopped calling devm_regulator_get_enable_read_voltage() on ACPI
  systems as it is guaranteed to fail (David, Jonathan)
- removed call to spi_set_drvdata() since it is not needed anymore (David)
- Link to v3: https://patch.msgid.link/20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com

Changes in v3:

- Added "Fixes" tags
- Picked up reviewed-by tags for #1 and #2
- Dropped the conversion to "error" variables
- Avoid using scoped_guard (per David)
- directly return results of function calls at the end of function (David)
- Split spi_sync() error handling into a new patxch (Andy)
- Switch to using devm_regulator_get_enable_read_voltage() (David)

Changes in v2:

- style fixes in #1 (per David)
- fix to not clobber state (#2, new)
- #3 and #4 (new)

---
Dmitry Torokhov (4):
      iio: adc: ti-ads7950: switch to using guard() notation
      iio: adc: ti-ads7950: simplify check for spi_setup() failures
      iio: adc: ti-ads7950: switch to using devm_regulator_get_enable_read_voltage()
      iio: adc: ti-ads7950: complete conversion to using managed resources

 drivers/iio/adc/ti-ads7950.c | 195 ++++++++++++++-----------------------------
 1 file changed, 62 insertions(+), 133 deletions(-)
---
base-commit: 3b058d1aeeeff27a7289529c4944291613b364e9
change-id: 20260220-ti-ads7950-facelift-ad8b5390a654

Thanks.

-- 
Dmitry


