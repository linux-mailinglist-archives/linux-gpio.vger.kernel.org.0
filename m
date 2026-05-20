Return-Path: <linux-gpio+bounces-37167-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAjOGY4EDWrXsAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37167-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 02:47:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EB35865CF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 02:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23192305B9B4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2026 00:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0432D26AA91;
	Wed, 20 May 2026 00:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oi1gK6X1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DB0248881
	for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 00:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779238017; cv=none; b=P4TG1SR1cMxP6ok/4zCNIOdpFL6wm9lD31cq3TIzGtUZujhsv74/kekH1OJ/bxipo5S0eKSkEDABr9vBoe3DFbKDgQT1WdMxAfQXp8v8s71jLYZ/AWzuVL3UITBBfNt99W7uyBlSu90bj1ULkhtzbjrFkAQ9cl5FDnKZoUIhScw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779238017; c=relaxed/simple;
	bh=y7Fn9YFogsp8mpT4ZBz1BT2lYDSCTlD71c6vafu4GrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAV3o5qoIhW/Ioc8ABQZvCJRJxVVtIvHX8bLXjjhJvy42SI4fzywACLHR55vnQS20QqWJrwzLfHQwK1w+Vho/affGgbbwcFMoGnWjWpP4qBfELTr+bP/kPGozleQKq7HjQKKmawkxrp/MTHP0qLTjaGVx8glU6apUka+eBicQPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oi1gK6X1; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c19d23b19so5854137c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 17:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779238014; x=1779842814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T0ubYMzKkPwIELjCKI6Oon/usrmm5Tf+jdhwqr1a+Dg=;
        b=Oi1gK6X1wdaa1laIRBm5oaQHz3rdc+QnZbBsoPKdvwfxGp2l8ejVp1ZHpXea7gwW3V
         I3Y1u9ZY8gY2cnslCLHJ9TiYdgcTfRg4b/PHNzHKLokzIvZKj83WGrEbwEKx14dHDpPr
         /tm9sRYECBzfepI0NS37n0nluvJm58OBptAiqp+2EBtaG7dVjH9oRNc8VGXvTP8RBZWP
         ZmPTSD/3QGURGt7d8HArEtLhx0WsWJnXNSZnGriaSxas7II/3JSfZ1O4sdWujXtFUIn/
         DpyYf9Avp4sTN2LXkdE7DpevYGGjWKQlM3AKzSfNoXY/AVhyKVbp8xv4J1dbqCXmQApm
         PXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779238014; x=1779842814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0ubYMzKkPwIELjCKI6Oon/usrmm5Tf+jdhwqr1a+Dg=;
        b=WP9Ky2BPgunpZfjHQ7nKsbTBknudz34eFj3HOaDBTkSsvhyb9zdDFK5cXDYGTVxGAw
         T3a8PYgDQ7+v48y3DaLb7lH+OVT4rjZ0XaDYqHNxif3Z24Ve5c1KVZBzEGERdN7wpcYh
         71ScoPBkDuDtscIwReXr1ycztKQ2SsNDPdXTPSGQv4oGuj+T7svaxeYmIqUJ6+Y6we86
         Kyt6MOB0WdfSBNRCAPVBWmHPk4AEe8Ko2NxL+Mwm0G0E5Tj6phD6KY+WMD2wMJ7kT3QO
         wq0Nrt9xrgEVfYJnpFvH0Sj1nRWdlqV3UVGbrzqXiTLJmbmI3RlWJWXzLDH7p8tipM05
         +0Wg==
X-Forwarded-Encrypted: i=1; AFNElJ81hn+z3Mz7CE5pPi+7SrKKtGWgwSoLKdS+aRsGwSl+pbUf3VoMZQoYetsQMOSsbi2/nt8l2L1s+htf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeb/m2xqKTX9TBGyPw1Q7RGveSwTCg/7vmXeFDRprbNo+usQJ6
	aMei6zWQzg3XRXELhy4g/BGCQofT5RjjFKz3xUTVRGqae5BF4aWmLh3l
X-Gm-Gg: Acq92OGnyzxDpNY0WBcSboFQknJ8yEsGgqeOvNkFP9y/7MEb7ba0dss73As4ZZsblJ6
	q5NHKdQMPpJtG1SdhMZBpqjyoNWP09vWDywIRDqJmm/tczwoBRkP6uxMwV7zcfRp27gjFnXp7EL
	kGoo+Xj2JLd358ja3+SCe/LikAKTOhEIle2KfbV5n/7rqOkO5sNpjqwgOrbyJPDd+Ky57FN6xIq
	vl6jA3iO0maiol3jGazb7crYQJx2qHb5ZjM1pFsNxFqSAtMwf3+tvkOMPr+ieTDqmYj+DW3CzaW
	r4XrNL3lxJPcwdG8tIRHQWiNB3jmLp7FZoTMEqN/gZhBc8r22KTHODqO9OlEUziealH8mKchCON
	ZX/thnc52c1BXP0Kap+p5fyM8SWwyXUQdD8wz/8PakVB8x1z7jhmamhadm0Ktge4wSAC9Kluh1X
	0FHY+cAK12DMHJnMz65/DB0NSynkXA7u+Yu1ISHTbJ4AQdzvLNj9zpGc1mNN00juIW
X-Received: by 2002:a05:701b:271b:b0:135:da70:c2d4 with SMTP id a92af1059eb24-135da70c454mr1271166c88.25.1779238014087;
        Tue, 19 May 2026 17:46:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7677:c3e6:c92a:e780])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed2232sm25928705c88.7.2026.05.19.17.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 17:46:53 -0700 (PDT)
Date: Tue, 19 May 2026 17:46:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Frank Rowand <frowand.list@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 5/6] gpio: remove machine hogs
Message-ID: <ag0Dn66ZVnbTc7J2@google.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
 <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-gpio-hog-fwnode-v2-5-4e61f3dbf06a@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37167-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,linux.intel.com,iki.fi,atomide.com,armlinux.org.uk,lwn.net,linuxfoundation.org,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D2EB35865CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 09, 2026 at 01:42:41PM +0100, Bartosz Golaszewski wrote:
> With no more users, remove legacy machine hog API from the kernel.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Argh! What is the replacement for this? I have patches for rsk7203 to
use them to get rid of legacy gpio use, like this:

diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
index f8760a91e2f1..5bbd3b31cffb 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
@@ -12,7 +12,7 @@
 #include <linux/smsc911x.h>
 #include <linux/input.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <asm/machvec.h>
@@ -165,6 +165,19 @@ static const struct platform_device_info rsk7203_devices[] __initconst = {
 	},
 };
 
+/* The base of the function GPIOs in the flat enum */
+#define SH7203_FN_BASE GPIO_FN_PINT7_PB
+
+static struct gpiod_hog rsk7203_gpio_hogs[] = {
+	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_TXD0 - SH7203_FN_BASE,
+		 "TXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
+	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_RXD0 - SH7203_FN_BASE,
+		 "RXD0", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
+	GPIO_HOG("sh7203_pfc-fn", GPIO_FN_IRQ0_PB - SH7203_FN_BASE,
+		 "IRQ0_PB", GPIO_ACTIVE_HIGH, GPIOD_ASIS),
+	{ }
+};
+
 static int __init rsk7203_devices_setup(void)
 {
 	struct platform_device *pd;
@@ -172,12 +185,10 @@ static int __init rsk7203_devices_setup(void)
 	int i;
 
 	/* Select pins for SCIF0 */
-	gpio_request(GPIO_FN_TXD0, NULL);
-	gpio_request(GPIO_FN_RXD0, NULL);
+	gpiod_add_hogs(rsk7203_gpio_hogs);
 
 	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
 	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
-	gpio_request(GPIO_FN_IRQ0_PB, NULL);
 
 	error = software_node_register_node_group(rsk7203_swnodes);
 	if (error) {


If there is no replacement maybe we can resurrect this? Or shoudl we
have add swnode support for hogs?

Thanks.

-- 
Dmitry

