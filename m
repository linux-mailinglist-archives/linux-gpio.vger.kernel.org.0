Return-Path: <linux-gpio+bounces-32578-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Dj6J2J8qWkh8wAAu9opvQ
	(envelope-from <linux-gpio+bounces-32578-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:51:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68A212222
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Mar 2026 13:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BEFC30CD90E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 12:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9725F39B968;
	Thu,  5 Mar 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbmOC6dP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FAF35F601;
	Thu,  5 Mar 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772714994; cv=none; b=O0bXFSHQ03m8WVSGcCbDk8c9bW89u2sKRtTA6I1VzBaFiWSTMxkteXUt6hJKyWPypOS053AU/drYKTYy+v1hzn5pbBUFRUEppHsTS9/srOIVWixqfeT5hkSlsyUl0568BJb1hlSl/uvF0xTm5oPhNG7VUqLU5ZanMhsKkaicqdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772714994; c=relaxed/simple;
	bh=GRplRnjGLxrUWNDzEKltsK68sTgM/gx+kRwmcUGj1Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ltu3M46N8Pi5FP2ag477c1UwVi5fgKLkGa8ZerQZUuzI+/t5ZtXcNwNcf7OM9+CQU0h8gI+p6mQBLNZEdxfEFEEbv9t5sDBpXvN7rJyBUo7j16LyK5UqbzvfszFhBn54pB5B93eWHi4Q/H1665TtUcSCLGaEdDujp6rdoeAqX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbmOC6dP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8058C19423;
	Thu,  5 Mar 2026 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714993;
	bh=GRplRnjGLxrUWNDzEKltsK68sTgM/gx+kRwmcUGj1Jg=;
	h=From:To:Cc:Subject:Date:From;
	b=EbmOC6dPVZq40MZt6N7YMik71gKO3KM6r4ijuf9CW9wuGA3o7OXt3ayBLs2b9sCLf
	 w7/mX1l6feDfE9eXE3kwA2qe+pvye4fWnx113Dd4fZaleniCrId7qy3aiOQ178gq65
	 gl/dhr5B8vm676A2DMNSXgL8e6BjcJKSe6NzyJAb2QOAa+zvW+Fdoz2JlT/lUee+ah
	 dTDZztE02tw+P/uVbk9GHQ9Yq5dIiZ+/ibFaMw6UQts4Ke6ivJWRyGbBVmpvTd0oK9
	 V74zIRr16xa4/G3+/CowqKhhd2RChfRw6F91Ry9Zc43BDaTfLMGBqafqIFAFA1LuGv
	 rv6Q1/F/kk5kw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy89H-000000002o5-2I8j;
	Thu, 05 Mar 2026 13:49:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] gpio: mpsse: drop redundant device reference
Date: Thu,  5 Mar 2026 13:49:45 +0100
Message-ID: <20260305124945.10781-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EF68A212222
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-32578-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpio-mpsse.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mpsse.c b/drivers/gpio/gpio-mpsse.c
index 12191aeb6566..a859deab2bca 100644
--- a/drivers/gpio/gpio-mpsse.c
+++ b/drivers/gpio/gpio-mpsse.c
@@ -548,13 +548,6 @@ static void gpio_mpsse_ida_remove(void *data)
 	ida_free(&gpio_mpsse_ida, priv->id);
 }
 
-static void gpio_mpsse_usb_put_dev(void *data)
-{
-	struct mpsse_priv *priv = data;
-
-	usb_put_dev(priv->udev);
-}
-
 static int mpsse_init_valid_mask(struct gpio_chip *chip,
 				 unsigned long *valid_mask,
 				 unsigned int ngpios)
@@ -598,11 +591,7 @@ static int gpio_mpsse_probe(struct usb_interface *interface,
 
 	INIT_LIST_HEAD(&priv->workers);
 
-	priv->udev = usb_get_dev(interface_to_usbdev(interface));
-	err = devm_add_action_or_reset(dev, gpio_mpsse_usb_put_dev, priv);
-	if (err)
-		return err;
-
+	priv->udev = interface_to_usbdev(interface);
 	priv->intf = interface;
 	priv->intf_id = interface->cur_altsetting->desc.bInterfaceNumber;
 
-- 
2.52.0


