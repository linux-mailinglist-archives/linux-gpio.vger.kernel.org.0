Return-Path: <linux-gpio+bounces-37238-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMM4EsiUDmrJAQYAu9opvQ
	(envelope-from <linux-gpio+bounces-37238-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:14:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E916A59EFA6
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 07:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B75A30573FD
	for <lists+linux-gpio@lfdr.de>; Thu, 21 May 2026 05:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B52533AD9C;
	Thu, 21 May 2026 05:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bchZZlDx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB533E34E
	for <linux-gpio@vger.kernel.org>; Thu, 21 May 2026 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340424; cv=none; b=h+d6q5FfM33nB5vzgxR7Qi0nAF8thYW8cbw/n7rgMCSeOAeqnD0Ovbf3MyeQtO1DNHd7o+1WYm8dgUoiuWF9sP5psUFtFERVsKzYax2Ivh244itc6o9rrFBBRwfYaCf2Lb9oUnJ1Qt5WglS9OLNbiEzNwqzVhBYJbhO6bGo2N+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340424; c=relaxed/simple;
	bh=V98m1+0octd7GZV73B+kVvkgTFXAFAq4EIFfr2kWVpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lolIVYp2QleUAdBYyDjeNKK5bdASh4e0Kg7BMjxLXGDFBC804RQK8zDbfUtZxz7Hb0ET2YkNuPpjPnEbmp4Zi4fbWtIY2+fYsnumva6u4aI8nQbWY3GmslcPGw19lNYNLQcwH8nn0t8FHYywRBcp6kmoVEsmsFdlQLtE695gDNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bchZZlDx; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1363fe80fe8so80165c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 May 2026 22:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779340422; x=1779945222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15uEAzMKA+H+ojfSPLhPEYofIvVWsChvdMIoi7uyS4E=;
        b=bchZZlDxjHZ3177c7waBx91yr2AFemv1jay3iRJ2ykiYxVtPZw+YGZmckU98YBs5kF
         ai22M3aBxNpwBsJG7G0QmFrpE/dBOuuxgDp+JPa1oHEP1zO3cQXvk/wQwtntxhTyZHX0
         9Vw2ytb2+rBRoEO0jgCVhKK2fHsQSzGUDezrwAOWyl/opC5Ue5YrU7fyt5PEtY57t6Up
         PxXpPer4/6siO4XKBg3sr/POOan38CqwXajngyR81/haI5q8Fe0MrjOs8PsVy6d6On/0
         FfwLK788Knw/HrkkTkb5V1UzR2e20G6EVMRuspn9KOQieV2aPEY0fdI0vc3Mo4KXdOG2
         zecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779340422; x=1779945222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15uEAzMKA+H+ojfSPLhPEYofIvVWsChvdMIoi7uyS4E=;
        b=LXm1Nn/n28vijeyXhwlnsBS88aeDPAh216Plkv/JlLifvCULICviL+E5baH0t33zgt
         tZOJRvdZLQKBJsGzulptGDr2qsyCrghmMM9/nPPO/7gVEEZS9PkCdfs6bnVH9bdFv/as
         tgSe6AiF+ggviRH/p0XpX6iKSwS4C4nVeMgn+5E82tkVdyqCoDD0aMcFHU/QQBSMccDe
         frN80Wf9SWLPHK7aFd3CBjpPopbRfsuLHZLCC/AuNiuUKJi27e3Ha1phfYLcux8OjfT8
         gzqZo0Xr8c9JOL0yHDm56c/M+GW7Y2RHyjhYL1tTYweKnvP8C6oiGD2SZtw902zC27YK
         DXPw==
X-Forwarded-Encrypted: i=1; AFNElJ8dVRBs8E3YdyPVHCkZhqLiziTD6JTdHcMPf+7v7/SdLd1adXZIqItmJxEh8Z7VjCT36qvMZuV8ZVIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YySN3nmUIzhliZRdx0rVTQLW0+0HCOdAqQ3knDMIYJQfGa8C882
	+XtXX8+8/LE+8oX8nIqKc3RK/1yJiahdP3BMxXxscG0EE9L2Kg+qR7Gt8Ertug==
X-Gm-Gg: Acq92OGMslkv54xHYiZRW9XUD6cfJoKvGJMg+M3Ut5WdObKpLFtMprn25kwxL/HkayX
	b1UIf7UwmFk0O4VIbBQMEJCIXitWfU6yK5t45v4Q5EYz5ndlgBODmzZDVLLitkc7Xcuvghj+H0R
	KNz7QguDP37jRRoo2kMrODX4yoY4m3WR0vqp0WkFdXbItQi+c/m0z0tC9skxlcGsjWfQhn+EFjA
	yPq5HnzXyGIAaMtwwxnTdi/2Gk1S0YNiIAECxv5+0Yd4GU0B+FZcUDJmjgI7VJr6tWfWBG8hiwI
	bFvgwFyEp4lbT5rpaqSA8211QcRvcW8FZPjN5RMAssTz/1jB8Du9s/iHMfGwKP+QkxutsKrJpAw
	QAGcsHEOzCyX+i6K8rQTQFJ8rEIyiPLm2CI5mGjlKKeZm2P6HRTB8tu4CxZNXC6BTdxybpCrBkt
	NQHFzHyLgRPKBLJFccfTi92Cgf5RMGetdCnx1FB6HgLoNLfo9LQ7t2dkTsfzrIeEWm3T1pOJHcy
	+JWWWFVgCYSPQ==
X-Received: by 2002:a05:7022:f305:b0:12a:6c7e:bef2 with SMTP id a92af1059eb24-136327e4b6amr342425c88.7.1779340422089;
        Wed, 20 May 2026 22:13:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:d457:597:d576:1eb8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-135e5c0a918sm6231360c88.14.2026.05.20.22.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 22:13:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 20 May 2026 22:13:17 -0700
Subject: [PATCH v2 1/5] pinctrl: renesas: gpio: isolate function gpiochip
 from parent fwnode
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-rsk7203-properties-v2-1-465f3308021b@gmail.com>
References: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
In-Reply-To: <20260520-rsk7203-properties-v2-0-465f3308021b@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37238-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E916A59EFA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The sh-pfc driver registers two separate gpiochip instances: one for
real GPIOs and another for function GPIOs. Since both share the same
parent platform device, gpiolib's fallback logic causes both chips to
share the same firmware node (fwnode).

This causes ambiguity when using software nodes to describe GPIOs, as
gpiolib may apply hogs meant for one chip to the other if they share the
same node.

Explicitly set gc->fwnode to ERR_PTR(-ENODEV) for the function GPIO
chip. This satisfies gpiolib's check for an existing fwnode and prevents
it from falling back to the parent device's node, while ensuring that no
actual properties or hogs are found on the function chip unless
explicitly assigned later.

Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/gpio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 2293af642849..4e59dadb7364 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -278,6 +278,12 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)
 
 	gc->request = gpio_function_request;
 
+	/*
+	 * Explicitly mask the parent's fwnode to prevent gpiolib from
+	 * reusing it for function GPIOs.
+	 */
+	gc->fwnode = ERR_PTR(-ENODEV);
+
 	gc->label = pfc->info->name;
 	gc->owner = THIS_MODULE;
 	gc->base = pfc->nr_gpio_pins;

-- 
2.54.0.669.g59709faab0-goog


