Return-Path: <linux-gpio+bounces-39481-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lUApO9Z/SmrOEAEAu9opvQ
	(envelope-from <linux-gpio+bounces-39481-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 18:01:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4329370A8A1
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 18:01:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="gg/J40o0";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39481-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39481-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE7B13009B3A
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 16:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AD8230BD9;
	Sun,  5 Jul 2026 16:01:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7294249EB
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 16:01:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783267283; cv=none; b=oUWZrMHoz5pGQF/lXAEHiSVgXcYSNd3Hzk/Uqf7rIhW+sac6X4SyOdfT3Hv1TSq1y6mFpQl8F7u8Xy9HGwqGsnGqxpR6OzGYk1r/ZxwCT8Rfef7FD3EuHcmK+QB87rxsnNmnE5Zy3WhOH4uifcHOaHiUZt/CGBZ6iWe/56WsOPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783267283; c=relaxed/simple;
	bh=+typ/+HScwFbMEApvyU9z++JgrqwN4QzeqtS21DoCqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hlFjzS70whuW2aEjPy9kthezEbgZ/6rMTuy88JUZDIUk4fuBv2/VkKfrzs6/OIf/h83MiQX8WEZsdGfmzOeDm+ouhp8yIlFGZ8akYU5CUrNlaHBE2F0YuhMRxTuO9mlg9cb98Hw9Bk3oIJP8RNg9+a/b36aBmzDyD5gAT5ulLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg/J40o0; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ca7aaa4b85so18002675ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783267282; x=1783872082; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EW1Ejyy0fkNOhkHyIuVemSOQ/SzgAWdMlNYZSgUFnqk=;
        b=gg/J40o0YaoOF76gH/G7v8dsOPqZ/kNvLUDY6S2/Ggnak7pSStk5s+8sCC8SzPbUHi
         iPK7dvG6SHftz2JAmTZzShKCYo/GsQbVTqd2HM5gU/YqyYuVx9X661Hi2H40J98WLBam
         pychlofGLhhFEGHEYedih+xzFnhBqYmok1ZHSDS+k0/OO0Jw4T/YFvaNmddnot4brSIg
         T7WdtrytUvf9q5VBjynXNUPedCXupmrsA7uoozLlItcn39bDqfar01xEpMJAoXtO27Ki
         cCWHft5QXRTY7WZNKwqsuRySWTw//29LyBWdMkhKpzWoMFICtVN+XRyX9FYa9d49MQgz
         RYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783267282; x=1783872082;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EW1Ejyy0fkNOhkHyIuVemSOQ/SzgAWdMlNYZSgUFnqk=;
        b=l1yCvKxwZ1O3YnFgU2Q+dv40kB7NaWaqEO+e90wgsI9FcUKFMHuGUwwrz7KD7rJNQY
         cC+MOQGMsp9y/HtAMMrrSsfPRYN20KFXIOSe8ZU7+PhSIstAJLaOVJLgqzl7NyYr1CtZ
         JQxXoCB0RyZ2SoPeLpVDtfMCH88h1jcDn1yVY9XZpTqTpir4oQ7zNphIdSspZofzZJ+X
         EJ88uUXRGpIjrvLz9QmQ9D8Iq71Gd8L4d62lEWy8KIsBe36Pt0lInAFYYUx9ZlREivnm
         lN2kZrwY6VlLBS9a7g8ulm/wXo01LQiX4Gb5PMYisWBugmHIc14o4kC6xPDhGM32ApIU
         6vGA==
X-Gm-Message-State: AOJu0YwCEqvTBNILLWLdKzsXO+aS+KpdpTAHe7ebeelJc5TsfDovD2fh
	dHkabWKmZsiqtW7+klA5CPMFVPVdeUHH/p03fwRpYPPRBDFHnWg1BhcqkIca4A==
X-Gm-Gg: AfdE7ck3pQ/DWOJWQdMCgMu9OXiv32sRQzxgWY9IJNVLCze9Yh5qzRz5HK7qZoLTmk7
	UdY0SQPQrTPWjSCML2XP+oRG4Kc+0nzUBLl2FQVpLyyJtao7hqWAHTYA/Zzk+IDYZ1H0NPuMrQU
	pGwX6IsDFrw4p36K7TCmb1amQx0ScQ4jqKPoo/u0WAxc/XVduY0itc2cq36bRCY9xDUWQAFJkQo
	wtS8YYsoO5vlp1sVx7XnTxaWn+wMEtvzb12jHJKU36gu6ME4rUux35mzWKIIcfXIDOYXP0VI4rm
	NFWWLkbilsZGZGnADBjKFHZzORXPsd1/aBuKWYbaw6gFbLlUeE0HWV9uWr6+l8Hw0Xu+m/dxw3x
	QN1q/uE2rnhuaPbqkmIsZ6bH4ggKd6DxQippu/1YZHrAKcr2+Ro1bb9XKC92NsR0V32JnIV9xqU
	3vHFGKG9iA5IAJ8vDDisZYZbQ=
X-Received: by 2002:a17:902:ea03:b0:2ca:f96:865f with SMTP id d9443c01a7336-2cbb1e32dacmr70562725ad.7.1783267282144;
        Sun, 05 Jul 2026 09:01:22 -0700 (PDT)
Received: from [192.168.5.144] ([172.59.162.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad77651b5sm35644145ad.42.2026.07.05.09.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 09:01:21 -0700 (PDT)
From: Alex Tran <alex.t.tran@gmail.com>
Date: Sun, 05 Jul 2026 09:01:04 -0700
Subject: [PATCH] pinctrl: pinctrl-rp1: Make use of str_hi_lo helper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-rp1-str-hi-lo-v1-1-1b452a5a8780@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMB/SmoC/x3MQQqAIBBA0avErBtQE4OuEi3KphwIjTEikO6et
 HyL/wtkEqYMQ1NA6ObMKVbotgEf5rgT8loNRhmnemVRTo35EgyMR0LvnfWd03YhA7U5hTZ+/t8
 4ve8HaKtXtF8AAAA=
X-Change-ID: 20260704-rp1-str-hi-lo-cc64c3614be2
To: Andrea della Porta <andrea.porta@suse.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alex Tran <alex.t.tran@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=975; i=alex.t.tran@gmail.com;
 h=from:subject:message-id; bh=+typ/+HScwFbMEApvyU9z++JgrqwN4QzeqtS21DoCqc=;
 b=owEBbQKS/ZANAwAKAXT5fTREJs3IAcsmYgBqSn/L08ONRo2Jk+InIn7n+Xnewi6ayKagosZXL
 9UYBuVe3LaJAjMEAAEKAB0WIQQAohViG04SVxUVrcd0+X00RCbNyAUCakp/ywAKCRB0+X00RCbN
 yN5ZD/4sAlaXoqjGfQE8LrrFT755/x+Ghj6lEujU2Uxr6Ua0OG4gJKjX9Bw1o52n57h8Se/LQ4C
 WuvWDZMliIl5ybUnA0Lnhfz6VtLcR8r2JoSgwipKwY0QKXt8UtWnTnqb9eCd1p9mYhhTe+TYLGT
 Lw6D+IHTWdUvhOF75W3xRClfZVWobwp3BPuiQhFmlw7y1n5WJzHS3how3XPF4d1faG9qMDYD8f1
 xnEYO6LrpPTMjClCqYWL70R713DHF+R1bSBQtlVke1AAAYm/j9XfNnemvy0bK/QF9OOAsNijvSx
 n7+AzgqvoB56V1R04ilnVB7H2eOEd2VQvbIb8IusSRpua3opvwbtuQzLMny5LwonRj+lBD9pf4f
 ZfaBBhKmJcUOExHgdjArx4pedN5RHtC/t/fJBfcuPWY8IfM1AnVtrS1ucUtGKvGR9RQUYkf1zqF
 ZjlaX2WGtWYorltFSjYIJqLyqPkM2ktm8+ilFM5jURkLEbqAbFxXQUZgRDwQhO9jvMAeqV+/ouP
 KfTL9KMA0V1oXGO49WGKdbBxa9J7UDTL5j48CwswGHR+2CFY/GfzuWWI0lGvAVAkgJ3ylOzCXV2
 dIwKG/lZjCV5FJynVOAsRtup8KAc+Vn9AzHBWNH3EYK6J4qFbEA1lvVMfI8EUNZG0YEvd+ORTqk
 ogx+0B3XceIzkAg==
X-Developer-Key: i=alex.t.tran@gmail.com; a=openpgp;
 fpr=00A215621B4E12571515ADC774F97D344426CDC8
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39481-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrea.porta@suse.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:alex.t.tran@gmail.com,m:alexttran@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexttran@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexttran@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4329370A8A1

Use the str_hi_lo helper API to print value
of a pin for debugging instead of using
ternary operator.

Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
---
 drivers/pinctrl/pinctrl-rp1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index fc4ed68ea5ac0bd272afe82076a36e93beba0539..dd0e85c2ca33a1ac506bf7ff0ceb424a7bde97d9 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1085,7 +1085,7 @@ static void rp1_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 
 	seq_printf(s, "function %s (%s) in %s; irq %d (%s)",
 		   rp1_func_names[fsel].name, rp1_func_names[func].name,
-		   value ? "hi" : "lo",
+		   str_hi_lo(value),
 		   irq, irq_type_names[pin->irq_type]);
 }
 

---
base-commit: 2b763db0c2763d6bf73d7d3e69665222d1f377cf
change-id: 20260704-rp1-str-hi-lo-cc64c3614be2

Best regards,
-- 
Alex Tran <alex.t.tran@gmail.com>


