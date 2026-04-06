Return-Path: <linux-gpio+bounces-34693-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP9dHx8502kwgAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34693-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:39:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9033A175B
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 06:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF466300822B
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 04:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3289031B833;
	Mon,  6 Apr 2026 04:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfpIxvmc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA3A30EF6F
	for <linux-gpio@vger.kernel.org>; Mon,  6 Apr 2026 04:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775450371; cv=none; b=r+olxzkQR0a9Jkq0kFvwvlKOSs2F0j0+jAkOntB1Ry44e13GcxvxfFzEl9KByh8b6Cj4L+Oiacjrg+5S5hOqCu4KlIIARKcTv6weEj16P1br0orRTY/plAQNlsqBgY28r6GBm3WI6rkDcs600kADgS1DV39iOJh2mEIt9AF9Wa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775450371; c=relaxed/simple;
	bh=RzEbZjcRmdidkNJkUegPmAYcXuIFqLW3QK+aimG4ZBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o7g9cr4YfXf+NI6Le0F/h+hqs0bJC1kKjWNBUty1qY9xgyhNxmeMyA2ADGXOG08GqIfWnVozSdEObf3jmJMy0KeTzviSXk8C6nJFly/IMooJI+K4jKZnNhFOdUsO0oZleYlpiIcX/Li1Zm29SqhUWfQydxKIhyzJ3t1Ri+oMLpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfpIxvmc; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1273349c56bso4284888c88.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Apr 2026 21:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775450369; x=1776055169; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=94bs8yeSDdB1bxNykO0LbTpY30fHjkiSTFrt3pHkIKs=;
        b=XfpIxvmcRardypmqcJP/Eq/45nQ+nNbaLRhwNzkQaxyDnSqAJO1UHh25dKedy0HPa3
         VeX8w2NLy4CFhgLTpJwMtSQk9UL341ctSPZcqrdZiuQR66Xtk+ikehDY5g4F5brOjeNe
         LC81X2XsQkHm0ru9Iu9eNGq84hn/bLT/7Yc83JyCYcLZMACdPrNqqj0LavH9Fkp0FdtD
         hTkNC0/ihJ34bON2jMzSXAd2PJ3IC2UzW7Q3pEKp4Pb+ViTSdkmOcCs0LdEpPo5t3T3K
         AW0syZG/72SSK1DQNybip2uJHqxyFWyliE1tBfhFg+iKjd2VhbhwqoUx2+Fpiko7zIHX
         OhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450369; x=1776055169;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=94bs8yeSDdB1bxNykO0LbTpY30fHjkiSTFrt3pHkIKs=;
        b=FUdyDTAZb3m8QEQ92UlW3Gxknvk7GTtKAXJrpoTisW3LbKBAlTvc+TsAShIOa7a09O
         AywybV5ciZ3fKio9tgScCSuiwgAeTcKHbxF2tTe9idMuF+htSKi31BaWMhUioecIvAyF
         AcCopGR2yDweOO8/sFQOtMfx5dECNvNZaX+wgKPqYkRRrzb/4FFMOxE6b++P7HBXoHTY
         oFlkRSzJRfKP8IjYnOFbJbIorzYMdMxZI1bL70kNA38YFUDGhQrQPbTs+okxZOzJM2CI
         UGhPTH4dWcv2g2F5IbJ+LyQYY2A9s1YMe0yqmFZujCzGrhM4DqUL4IVQQqWHdIsKCn3o
         TEOw==
X-Forwarded-Encrypted: i=1; AJvYcCUYozZ/vCGgZQfYjCqsOBOkwYQo7xi+yYfTUzWenVfkqkH7xwUdTqZT44sdzCThO/ug12m4wAQkoMoj@vger.kernel.org
X-Gm-Message-State: AOJu0YxMuUiPLDcBhsgxWTkuq4U/ghxdFpDe6l2XyjJ7UFUn8BF/Srg9
	piprWVU9AHe7mnaMS7NCNdySphiZtHfcBFYDZBYOQuVovTlQwIBiNrWx
X-Gm-Gg: AeBDieusIG01IWxS2hEXirT3DG+ZkkKw7GVSnR9LheicNMjz0Bno3NniD7/miRop5Sq
	YgTBY7D0aCgWKa2kLyPY6Dk522NIcqHnEYI7H3RMpH7/xYS9dE6HI1fjaz5/wDEKB1b5u0tOToN
	0m4YNgVlwkwYx3abAytdiHjpCxgYL51EaBBxpO1erN74rxVr8E8VvuNg7n6xU8J+cjLcK6SuDG7
	pDApcl9Xr5lwLC6JayyU+6+1HasSQsp84Qm9e4jw8USZiNxRauonbi5QlUT8w3e6z3Iil0PE5zD
	iBXGpes8FX+2GwjBgijv+G2PpfcTP0Mpop/5GwShRfMxtVJHc4Fr0Flga0jmrYIWTCS+FJdGXMH
	oY0QBifO4s0Dc3c8s3EHIup2GQ/KVlh2TnuBno/cPA1jqx3TPTYlhbXXXZpxPBK93xBM2l+0rAl
	NnpS9ZOpwNh4QQmOd2WHuQJZ+KGfrvABa8OCs5W/o/lWru89tUpqHBD/GaloF0Yl9M3+/dQdGXx
	ctfIYhbV6gL4AE=
X-Received: by 2002:a05:7022:43a8:b0:119:e569:f609 with SMTP id a92af1059eb24-12bfb6ecd57mr4932000c88.2.1775450368753;
        Sun, 05 Apr 2026 21:39:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:fe13:98b9:9e98:d1bb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm15182005c88.0.2026.04.05.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 21:39:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v5 0/4] ti-ads7950: fix gpio handling and facelift
Date: Sun, 05 Apr 2026 21:39:22 -0700
Message-Id: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPo402kC/23Oza7CIBAF4FcxrJ1mCqWCK9/D3AWXHzvRigFCN
 Kbvfql304XLM5Pz5bxZ9ol8ZsfdmyVfKVO8tyD3O2Ync794INcy48hH5ByhEBiXD1oiBGP9jUJ
 pB/UrhUYzyoG15iP5QM+Pev5pOaQ4Q5mSNxur183TXHdCSoWqhx7cTCW9uhJTvE6xni6zoVtn4
 7yiE+X2eH2WVrHS/5BA+XVUFYBguAjO9QYP2m+4dVQdNgbX342hGVaOykpUdtBmayzL8gf4OJD
 WPwEAAA==
X-Change-ID: 20260220-ti-ads7950-facelift-ad8b5390a654
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34693-lists,linux-gpio=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: EC9033A175B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The original reason for this series is to make sure ti_ads7950_get()
returns result in range [0, 1] or a negative error code to comply with
gpiolib requirement.

During review David noticed the fact that the function also clobbers
gpio state. Fixing that lead to adding cleanups using guard() and devm.

---
Changes in v5:
- replace mutex_init() with devm_mutex_init() (Bartosz)
- Link to v4: https://patch.msgid.link/20260329-ti-ads7950-facelift-v4-0-c568c508c49a@gmail.com

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

 drivers/iio/adc/ti-ads7950.c | 197 ++++++++++++++-----------------------------
 1 file changed, 64 insertions(+), 133 deletions(-)
---
base-commit: 2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
change-id: 20260220-ti-ads7950-facelift-ad8b5390a654

Thanks.

-- 
Dmitry


