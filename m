Return-Path: <linux-gpio+bounces-38123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jxpvBYguJ2pJtAIAu9opvQ
	(envelope-from <linux-gpio+bounces-38123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 23:05:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C6165A9A3
	for <lists+linux-gpio@lfdr.de>; Mon, 08 Jun 2026 23:05:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=reactivated.net header.s=default header.b=G37tR6IJ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38123-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38123-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB7A7302C15F
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 21:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E7D37649A;
	Mon,  8 Jun 2026 21:02:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from out13-174.antispamcloud.com (out13-174.antispamcloud.com [185.201.17.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A422D5925
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 21:02:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952529; cv=none; b=rKgUWq2TUajBozU5qd4aiAa/zSsttNUIalpgYCFzTmh4pn+KcYShiIfGEE0sCtnfAtHPhzLqrZkplioVgy2sZGKq5alIs5gBPYMNIZ8qKN5PHPIVMjk2eYPFAvImEjyXs5rRu9RDOaxu4E+0+hLqj0l+wWNHbRONChC9BLol2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952529; c=relaxed/simple;
	bh=srESrZ3r7ugcJSaXrdZKdJzjbhNjM5YE61nmpGoRp2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EanGgVkJeAHPAbXygEBO6BZqh6q1e4Rap/oxiwVvmzxSi/czu80SFj+dQSn42Zyk4/MgU8fZeImEo/Clo7XJpYPb/IBx6YrNNA0V2F3KO+wSoyRUMy40OMG3dwexA+eOJ0i59l694DyHBWGA95Lh3iaj97tnZATAf9EoAIFOmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=reactivated.net; dkim=pass (2048-bit key) header.d=reactivated.net header.i=@reactivated.net header.b=G37tR6IJ; arc=none smtp.client-ip=185.201.17.174
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx199.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wWh6f-004mve-0F; Mon, 08 Jun 2026 23:02:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rzfx3/2Lg9FedtoMYav8nQPZl3cNmNWSkqzUmxYUKB0=; b=G37tR6IJQC4ThP9e1mxPGfn8DA
	qIFuCw+JS7LoPaGBorrrKy6yZ99pfq5Spb6dSbm9sbt2mb4LrHMr0HxeXHUwKUY+OfEvMIMeC74We
	JrSfKGxOyui0kJ8ZdP/oyKByyAcmsLfGT/nHpujuQhhuFqWgyCo4yH07uxA7u0B3QKhigdE3h0qAI
	ablDBrKJH5z/naPJpqcbFZ5IvVCtpB+9o6t81/cR0JEZFuhHj44OQc2W2coB1JlWSqdoF5yk0FxwW
	keBMEQTiWcdymI4IMdwxusicGkXjfX4nLXFJLU9UIn0kXMUFdzTs5SYCJpveDS0z5f/aL+5432ek7
	j2dlpr8w==;
Received: from [188.251.249.2] (port=48646 helo=numbers)
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wWh6Y-000000022ez-3X24;
	Mon, 08 Jun 2026 21:01:54 +0000
From: Daniel Drake <dan@reactivated.net>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Drake <dan@reactivated.net>
Subject: [PATCH v2] gpiolib: handle gpio-hogs only once
Date: Mon,  8 Jun 2026 22:01:08 +0100
Message-ID: <20260608210108.36248-1-dan@reactivated.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.05)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXD8nP0t5KbJKt1nTB5RgjSropx1bgdiqtr
 ZszKkmfHPCu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIMNMtFmNil/JOMFlKm1w9vmGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWAg1NJkF77+oGQ+lxJlCrsUeB7itP8hgjDRserKv4bhb0/SRhwoSlflSk9103+2bwRWBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAvW7iH+6DoE8NeDBUxImZIxHxsBXq5d
 3sVlH8/8/BVjaCxdqoPv0tTPBZ82RqaKH6ZJMkXL9fD6+WIpcQ2t8oQM/WEMAHr5BYwqeYfWeqTu
 1YC/tOVjI4dWyTvfTQXGjT+aEfC5mTBtCltny75g3MKubALAOajlmHbHzeutXs2uHosTaX/E9TB8
 42c3huE/T1c93SsS4aMXJmiJ2G0eb5ahq2kqyMRk6DLUUjpi54Q90umYmC9jerRVX9sTO+FXU2n4
 L0nk+TooPV1h2BXu3/c8Dfd/7JO6UaIAUVkvSizih0TzynhIhk347ucixeDFxznIHYi/jghIJpVk
 vIZQze0B3kz8gN6WZ2gYjiDJZ8+Xhccq6eblGj9pTfEleg7j+bhXujwKUFU8sFr6iwXfZAUpoMJ6
 ZvLBGAuQy7kKe35X8A4hD1HJK3j/SWnY9PEN+60i4mPHPjd3IwkPyc5LFKq/kOGb0cYHyPY2j2dm
 0K42EWNTFNprR2YbHabvwl5Tonl6S6BRBSooSF0jYMHjtHZIXlwnafkB5tRGEHfx/aXf18fhf5LC
 X5mVYquwf/zw2es8CVsONrMJuGzuoGnKTKcyg3bcd7cgjVVOyYbTvAjTK9NRUZyZh3i1BVa95w3H
 U/64kfarWNx6rm5P0Cgcvjq6fukZTu7P1CHYFiX+k4WJzymhN1wTLjVDHau03TfE9xTeNHk15Vol
 AGHS5rCXQKDy0SfOZK4LO/8RiwiQiWEeCWHDWbQkk7jdCVxF0EZ0jGH7WQnM6idBM1wpwQ7gvWTg
 fukZTu7P1CHYFiX+k4WJz5FUgW/lUuMzise8yz5SBwf2OKHH5lr9xXvSM4nM3avg
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	R_DKIM_REJECT(1.00)[reactivated.net:s=default];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[reactivated.net];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38123-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dan@reactivated.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_AS(0.00)[dan@reactivated.net];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dan@reactivated.net,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	HAS_X_GMSV(0.00)[dan@reactivated.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan@reactivated.net,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[reactivated.net:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60C6165A9A3

Commit d1d564ec49929 ("gpio: move hogs into GPIO core") introduced a
behaviour change that breaks boot on Raspberry Pi 5 when using the
firmware-supplied device tree:

  gpiochip_add_data_with_key: GPIOs 544..575
    (/soc@107c000000/gpio@7d517c00) failed to register, -22
  brcmstb-gpio 107d517c00.gpio: Could not add gpiochip for bank 1
  brcmstb-gpio 107d517c00.gpio: probe with driver brcmstb-gpio failed
    with error -22

gpio-brcmstb registers two gpio_chips against the device tree
node gpio@7d517c00, one for each bank. The firmware-supplied DT includes
a gpio-hog on RP1 RUN, and this gpio-hog is attempted to be applied to
*both* gpio_chips. This succeeds against bank 0 (which hosts the GPIO)
and fails for bank 1 (which does not).

In the previous implementation, failures to apply gpio-hogs were
quietly ignored. In the new code, the error code propagates and causes
probe to fail.

Closely approximate the previous behaviour by using the OF_POPULATED flag
to ensure that each gpio-hog is processed only once. The flag was
previously being set before the gpio-hogs were processed, so as part
of this change, the flag now gets set only after the gpio-hog is actioned.
The handling of gpio-hogs on a DT node with multiple gpio_chips remains a
bit incomplete/unclear, but this at least retains the ability to apply
hogs to the first gpio_chip per node.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 drivers/gpio/gpiolib-of.c | 5 -----
 drivers/gpio/gpiolib.c    | 8 ++++++++
 2 files changed, 8 insertions(+), 5 deletions(-)

v2: move OF_POPULATED flag setting to happen after the gpio-hog has
been applied (otherwise all hogs were considered already-applied
and never applied at all, oops!)

This bug is only exposed by the RPi5 firmware-provided DT that has the
gpio-hog. The DT shipped in the mainline kernel does not have the hog
here. I'm not sure to what extent Linux cares about supporting the
downstream firmware DT.

I'm also happy to consider other approaches. This multi-gpiochip setup is
a bit weird and gpio-brcmstb could perhaps be converted to register only a
single gpio_chip covering all banks. I verified that the other drivers
that obviously follow this same multiple-gpiochip pattern
(pinctrl-amlogic-a4, pinctrl-st and pinctrl-stm32) do not seem to be used by
any board DTs that include gpio-hogs.

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2c923d17541f..813dbcb91f6f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1066,11 +1066,6 @@ int of_gpiochip_add(struct gpio_chip *chip)
 
 	of_node_get(np);
 
-	for_each_available_child_of_node_scoped(np, child) {
-		if (of_property_read_bool(child, "gpio-hog"))
-			of_node_set_flag(child, OF_POPULATED);
-	}
-
 	return ret;
 }
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..b02d711289d0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1031,9 +1031,17 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 		if (!fwnode_property_present(fwnode, "gpio-hog"))
 			continue;
 
+		/* The hog may have been handled by another gpio_chip on the same fwnode */
+		if (is_of_node(fwnode) &&
+		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
+			continue;
+
 		ret = gpiochip_add_hog(gc, fwnode);
 		if (ret)
 			return ret;
+
+		if (is_of_node(fwnode))
+			of_node_set_flag(to_of_node(fwnode), OF_POPULATED);
 	}
 
 	return 0;
-- 
2.54.0


