Return-Path: <linux-gpio+bounces-32675-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLBJHz/Vqmn3XQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32675-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:23:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685A221842
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 14:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 524E730E6FCB
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 13:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C37D39659F;
	Fri,  6 Mar 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHbqGrmy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED9395D87;
	Fri,  6 Mar 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803324; cv=none; b=ICU667sgRTDw/IsfYHDRVUozPARqzjPV6mM4LzMJhLrSMSmbiZAJhEZITpd90Lk8sxxjxe0C789WXLSfPjDuR39zJ5Q3Tv1saxMK2vtWWMPUbomukZEPA4wiwTb2GVYWJyuUFwuWoHslzWN3NNPxQJ3X7vpyg9FAryfXy1W5xVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803324; c=relaxed/simple;
	bh=NJHi9UE6B7k4HX132rW8BDVazxPXELdfJWmQQW6qgOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Dv83jI/rJIVZVhQSI3fGkIGEyLQhWHRTIPLu2p5CZIQB68gALyVNJ68mBaPhKVjCp0NA1L7cd/baBYgL6Qu0dKpPw8IrTeyhI+pE1fTzOhaAl6JM10UPyhdR7DreIG4ZqPoZK4Ua+xaOuCZcNSxIPB1OcVi4lQ9e7Rn9OWAEm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHbqGrmy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E347C4CEF7;
	Fri,  6 Mar 2026 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772803323;
	bh=NJHi9UE6B7k4HX132rW8BDVazxPXELdfJWmQQW6qgOI=;
	h=From:Date:Subject:To:Cc:From;
	b=ZHbqGrmyKGYH2y5ZwV/12M71uDwXdqnMOfEpCdAYN6ExpJXAopCXQ+2X2Tk0AhmPA
	 gVVt4L39uD1DUYr1jHSaLE77Zrp+OWICzCJvUJc6OfsBg7ajzg4Sj8oYeDUrbObyXA
	 Hst6eyhm2ZMmvJPmgXKTsUKuxwjF5khf8qHb3+tYBMXkwojcV+KncLGYvTE3/8Zwhg
	 c2RfBD0nYMIfP8NBq7CYECpJwMAASuxxRm96is83ia5RVEef5i7Gdq1DwZGeBjsEEX
	 Rj4j/ZXq5us0TnKRnTZ/mTKaOy7/rsBztSUfJS+JO6uwT7RnrLrfR6mLKKrHHh4VB5
	 R+7HsGccUbo1w==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 06 Mar 2026 14:22:00 +0100
Subject: [PATCH] gpio: Document line value semantics
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-gpio-doc-levels-v1-1-19928739e400@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBswp1x0lWgROtWAqChIEN49a
 fkW/79QOAsXWIcXMlcpEkPHNA5g7yNcjOK6QSttFCmDV5KILlr0XNkXXIitIzJuphl6lTKf8vz
 HbW/tA59L+mxhAAAA
X-Change-ID: 20260306-gpio-doc-levels-53ecd336d434
To: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Jander <david@protonic.nl>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 2685A221842
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32675-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonic.nl:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

It is not clearly documented that the GPIO driver API expect the
driver to get/set the physical level of the GPIO line and the
consumer API will get/set the logic level. Document this in
relevant places.

Reported-by: David Jander <david@protonic.nl>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst | 27 +++++++++++++++++++++++++++
 include/linux/gpio/driver.h              | 10 ++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 85d86f92c41b..a4f160b95089 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -87,6 +87,33 @@ atomic context on realtime kernels (inside hard IRQ handlers and similar
 contexts). Normally this should not be required.
 
 
+GPIO level semantics
+--------------------
+
+The gpip_chip .get/set[_multiple]() line values are clamped to the boolean
+space [0, 1], low level or high level.
+
+Low and high values are defined as physical low on the line in/out to the
+connector such as a physical pad, pin or rail.
+
+The GPIO library has internal logic to handle lines that are active low, such
+as indicated by overstrike or #name in a schematic, and the driver should not
+try to second-guess the logic value of a line.
+
+The way GPIO values are handled by the consumers is that the library present
+the *logical* value to the consumer. A line is *asserted* if its *logical*
+value is 1, and *de-asserted* if its logical value is 0. If inversion is
+required, this is handled by gpiolib and configured using hardware descriptions
+such as device tree or ACPI that can clearly indicate if a line is active
+high or low.
+
+Since electronics commonly insert inverters as driving stages or protection
+buffers in front of a GPIO line it is necessary that this semantic is part
+of the hardware description, so that consumers such as kernel drivers need
+not worry about this, and can for example assert a RESET line tied to a GPIO
+pin by setting it to logic 1 even if it is physically active low.
+
+
 GPIO electrical configuration
 -----------------------------
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index fabe2baf7b50..af93bf401cb4 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -344,11 +344,17 @@ struct gpio_irq_chip {
  * @direction_output: configures signal "offset" as output, returns 0 on
  *	success or a negative error number. This can be omitted on input-only
  *	or output-only gpio chips.
- * @get: returns value for signal "offset", 0=low, 1=high, or negative error
+ * @get: returns value for signal "offset", 0=low, 1=high, or negative error.
+ *	the low and high values are defined as physical low on the line
+ *	in/out to the connector such as a physical pad, pin or rail. The GPIO
+ *	library has internal logic to handle lines that are active low, such
+ *	as indicated by overstrike or #name in a schematic, and the driver
+ *	should not try to second-guess the logic value of a line.
  * @get_multiple: reads values for multiple signals defined by "mask" and
  *	stores them in "bits", returns 0 on success or negative error
  * @set: assigns output value for signal "offset", returns 0 on success or
- *       negative error value
+ *	negative error value. The output value follows the same semantic
+ *	rules as for @get.
  * @set_multiple: assigns output values for multiple signals defined by
  *                "mask", returns 0 on success or negative error value
  * @set_config: optional hook for all kinds of settings. Uses the same

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260306-gpio-doc-levels-53ecd336d434

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


