Return-Path: <linux-gpio+bounces-29200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDBAC9683C
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Dec 2025 10:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B477B346022
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Dec 2025 09:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06205302CAE;
	Mon,  1 Dec 2025 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="WVdUrAXY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CFF3016FF;
	Mon,  1 Dec 2025 09:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764582944; cv=none; b=Rf7j78uoY9SVqy/8iZILjgN36be9JM+3AgSiW3QCjh4WAcwVWMZjIA5sqgR0ssInJ9nF9vdW71AgTgdnvjkuICBprjlUUitCswnIHsPBPHiNk/8tkaMp9Usia5HyTRj0tD7gdCOxDwqZet7Bz7GZH6TWsxS6qb5AL0ZXmy+PQ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764582944; c=relaxed/simple;
	bh=Fjn5G33dLs36qZWDHd4Y/0bElxdBaBbkQE7jFjxrIls=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=o8XNN7sn0UBDIhCNNqqioqXkTSytB/CPtOfzZmoHXg7t9RAxBqKhhbCBy4jxBXkdyt4Me3/1fOMjwkaksmss4wxYqLAxeHBeNHEYX6rqLrxde5r15dQFsUMgLQ/kraF1L017Po6ZhkIqRSkikq+ptSxub6fAcRtK9OabbIM/9/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=WVdUrAXY; arc=none smtp.client-ip=203.205.221.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1764582939; bh=F4ypkbwvm4Q9S7nmJVek0k9aPuBktitqiceLOZ/SIR8=;
	h=From:To:Cc:Subject:Date;
	b=WVdUrAXYzH74UhSqDowKBpiEVJfmFNex18EzcotkOWh0axtvDygmLHXNjaz8tZCVN
	 fxMyoAfIZ2TFTDTj+UyLl1KdlmY08zBdx9iTUpyxpiLpyIxFHZnHqCtOZHxx8TJeeD
	 gJgbPN9F19tLaClJLnyXgxd/nCvzsvlZVbUxR7i0=
Received: from cjz-VMware-Virtual-Platform.localdomain ([110.176.100.65])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id D9839A40; Mon, 01 Dec 2025 17:54:24 +0800
X-QQ-mid: xmsmtpt1764582864tfs9rzkb4
Message-ID: <tencent_BB49A52B7796EBAFEC293B0B5203602BD608@qq.com>
X-QQ-XMAILINFO: OIIfS09wav6ntm171Bh8TAbzw8wRDtAnNF8Ko1/n+ir6MZx2xqXdFIXHrudTyN
	 IbBBax303iksMi33/3Ei3MxoMDfHrNJDLjJRASLA6hFGRaxa5F50ekZZfyV2ClbswKYXwgopT0gB
	 BeOH2iK91+tKEN5XztCO1N22sesEzvI1whPvzHWmLL0otcc5vuLj7C/lAtsLx9AjaSFNdlNx/qWN
	 67mLGWKNntwylyjUfeaVYZyBZk4AXKconXTplfeFcgQGMEPjf0BJBdlrZJYGBaPJZyTTd91+qLfv
	 zf1B7PIWjK7BpPZo1rVZ0jxbodfhUMs6zZANDXCgNqg48gJvHf1FqQClp+KpuNMDXF91h4GCe6HE
	 0dkCCXiyMlCaa88w7vmRhup8M4vTu5gYckhZHeD+9nkwnrNrlMn/B9OaJFZmn6LJurrMtOqUg3IV
	 QxMgQ+dpyXDqAEVBfXGyGgcRJn6sevnA3hMLD56ipsS1U+fI5hUCA4uuI3TMFqTcBrNAlak0tp3A
	 Hc/XvjsG3jw8v3SRyF4xkUIxeSu0TtNc4QCSDNm6lyZx0NHYeSUdYVA7zN/JBB6mIKjgs+MUnhDl
	 MY4jCjmKTF0X07uvbVm+BemjwsBnttgp3du6Xy8XHaAxw0ZZKe3XWx56K0AzONFhLCKORpqkMeD0
	 vhNVsj6z5JEcW7yWTPfqlob1uE4u8vuhHMPTbMhFHA6bTqvX8oULNVApOfIvaj0SrK/FHfQIOZ8R
	 Cp/d9YT5KBzPOvUoEU1eVgpxDftkVgU4geabVzXa/wHnEtsKlfkdMxaWIJlVX5k5OR6TlEaJeWek
	 GmZpDO31UssAl0aubZ7zM2jahmogQq65nmx5Td6H+oF6Ib5/ao14wNkH7SiU/W5uhR3Wvxn0syPF
	 ugHd/gFt5kPHa101v1bPO4zkXjxyrtwhY8mavLxQrBQH4d5+oHNj6+OQ5Gi1UkQYGs+lkfLPRVQf
	 cHBd/VPLeT4cUZkNd5CkzILllsPEF7Fy2v4N+NBqouKcYJ9Z+AE3/G0ywBtfH0E5m+E/chTSSFEq
	 jWbVlwLreCFrC483TiPKczpGVNog0=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: cjz <guagua210311@qq.com>
To: linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Grygorii.Strashko@ti.com,
	ssantosh@kernel.org,
	khilman@kernel.org,
	linus.walleij@linaro.org,
	brgl@kernel.org,
	guagua210311@qq.com
Subject: [PATCH] gpio: omap: add kernel-doc comment for omap_gpio_get()
Date: Mon,  1 Dec 2025 17:54:21 +0800
X-OQ-MSGID: <20251201095421.17069-1-guagua210311@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: changjunzheng <guagua210311@qq.com>

omap_gpio_get() is a core function for reading OMAP GPIO pin level, but it lacks complete kernel-doc comment (no function description, parameter explanation, or return value说明). This causes gcc W=1 warning and reduces code readability.

Add standard kernel-doc comment to fix the warning and improve maintainability.

Signed-off-by: changjunzheng <guagua210311@qq.com>
---
 drivers/gpio/gpio-omap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a268c76bdca6..ad69892e9d98 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -861,6 +861,17 @@ static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
 	return 0;
 }
 
+/**
+ * omap_gpio_get - Get the logic level of an OMAP GPIO pin
+ * @chip: Pointer to the GPIO chip instance
+ * @offset: Offset of the GPIO pin within the chip's pin range
+ *
+ * Read the current logic level of the specified OMAP GPIO pin. If the pin is
+ * configured as input, read the actual pin level; if configured as output, read
+ * the last set output level.
+ *
+ * Return: 0 if the pin is at low level, 1 if at high level
+ */
 static int omap_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
-- 
2.43.0


