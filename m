Return-Path: <linux-gpio+bounces-36898-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOmdDijlBmoHowIAu9opvQ
	(envelope-from <linux-gpio+bounces-36898-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:19:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ACB54C453
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 11:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABD5A306D978
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6580A42B75C;
	Fri, 15 May 2026 09:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JczgL5Hx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E05372698;
	Fri, 15 May 2026 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836101; cv=none; b=Wj+YSCPs7IqWov+3X6rTaJvOghvuC8cOSAhzl/7/xxByWLHByqWUZbkrbQfQesCLwOrWxw7KIerJKpM0QRKcC2HVkNc3mcVLaCAFOJEH35FIiNFkt/1inJbQ2Bngl2xvIhdARzKoIG09+c3CG9JYcKFvA+liehYWO1phZvSei9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836101; c=relaxed/simple;
	bh=2bUCsiw2Cto0Ity0ozs93wolttoe2hHc4vItg7Mo7jw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EiZQ7wACXIGwwVbnAb73UF/utjW3ZU3TQqvDOy2EQyRD1wjM1vZfTOAGrYNJ1SMRmMYwPCD4B9pMaB6vuMGu+/cEU/7W74R4IIgmKT9CfgSAk0wW+NI/5nxLhqsvhSgaqjimR8+f1ZAtMgnXawGKjgjO1Vns2YD4552wnlUa/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JczgL5Hx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A7AC2BCB0;
	Fri, 15 May 2026 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778836100;
	bh=2bUCsiw2Cto0Ity0ozs93wolttoe2hHc4vItg7Mo7jw=;
	h=From:To:Cc:Subject:Date:From;
	b=JczgL5HxqvPZZ+UQQ4L2UOldlwlZ0xJXVyvdQtMFcwc3KM2VZQ+X2TDb6PAA4fZti
	 L1kYnn64zxgKzPK8QgQsJrhYBCNqwC8OuOBEa8C2Vun9SIrjR8keDx4TyOsyANhEZ+
	 gIqjo3aUvFKb80IFNe9YfJ8iyQbwMuNQtnVTHHBZ3AUZREW9F2khAzmLwsa92FKe42
	 ulQGj+eBC8f6kd3k3aC1Vj8TAipMakxeLu6cPwhxe7l+4KFsfGg6SFVDArZOwz3Hzb
	 3ubuHYFOupWAG98E2H4hohNhvKNR+H9CEYhBIV8gkrcqXiAecZyQxUq23IZqRm2o6x
	 cOC9zsAz97jeg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Jonathan Santos <Jonathan.Santos@analog.com>,
	Radu Sabau <radu.sabau@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] iio: adc: ad4062: add GPIOLIB dependency
Date: Fri, 15 May 2026 11:07:53 +0200
Message-Id: <20260515090814.437092-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8ACB54C453
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36898-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

The ad4062 driver gained support for the gpiochip and now fails
to build when GPIOLIB is disabled:

390-linux-ld: drivers/iio/adc/ad4062.o: in function `ad4062_gpio_get':
drivers/iio/adc/ad4062.c:1383:(.text+0x3dc): undefined reference to `gpiochip_get_data`

Add a Kconfig dependency for this.

Fixes: da1d3596b1e4 ("iio: adc: ad4062: Add GPIO Controller support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/iio/adc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index 8550917226a1..2c96e500c684 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -78,6 +78,7 @@ config AD4030
 config AD4062
 	tristate "Analog Devices AD4062 Driver"
 	depends on I3C
+	depends on GPIOLIB
 	select REGMAP_I3C
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
-- 
2.39.5


