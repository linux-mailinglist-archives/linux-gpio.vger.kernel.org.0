Return-Path: <linux-gpio+bounces-37422-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBoLBiD3E2puHwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37422-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 09:15:44 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1D5C6FEB
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 09:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09FC830015AD
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 07:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12603C584B;
	Mon, 25 May 2026 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5kGxe9R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4B3C552B
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779693322; cv=none; b=PLI/e7D5eCngU6gxMXzHLrW412QEAdVxCMrQjUhoA+nbsIwGdVe+k8LtTrJ3pljpBtcdJEtvWD1BPZMx4ojyL7O4iBAJ7fvFYEc1d99StL56l9OhcExIo6l2lKdgV33LBSWuee8rRG5xLtr7OeZE8a6+tAO36iJbhVVJRLVOoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779693322; c=relaxed/simple;
	bh=mZ4KnxOox8XVDHY1nDh0/a8GjdvSDmvGTIyanCnS7MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pXX6x7GViYoBoivL2JozVx1ii5ZMGtYBUPT+4oPJ7dOobE3MiNDs7yeQWvN8OQzXh662/IoPXZzBTeYooOUZ/fGy9QpxWm4mmlz+thNqIyAbip7f7F9+ln0gCk/H5emRliT36v01OR5DpTNAmo8awDWsZ4+VRN2OILOcxk0XlWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5kGxe9R; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so68554065e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 00:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779693320; x=1780298120; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47oa6+bWcTdZtRyJkBYrwULdTRG5mV9VUpeXnfu9Pl0=;
        b=g5kGxe9RYQGtcMrjBYQ/Rb5QZHkPY7D25USs8q0oHmHMqphXLXGvitgte9f9TSYa/X
         njI9go/vXdx/GOQGHzKeQfC5WGYKzHet7+wE89n6uORqc6soo//r/DpC75u2CIH17nyS
         axtD86txzWDE1wpihQitq10h+5n7g60WJBQruqse1/WRb0EaUjfacgv2gMD58AW8H2Tj
         tJVBu9jNC8CTeC1oGyX+6VMXkMFouIvzDGPX+VbebzfY3NZI3DGCcASgnTeQbRposAXE
         qhSjI9n2jp+NgAIqR60M3s2itlSK1FE4EchK4+7+l4QDuDio5+U5Ls66CslzLLkOiep+
         Z4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779693320; x=1780298120;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47oa6+bWcTdZtRyJkBYrwULdTRG5mV9VUpeXnfu9Pl0=;
        b=kqb6ZiAdqbVikYLAU985x+EJJSgUQQi0ahEI+zFFkMTMk9/+HeCCxXL61ZLssSUT1a
         t0TefyLuN4pcFvkDuxJCcZ7Job8JKrIeySiEs1Kw/YBVozZUjnKJk/27GUrBoKARxa2d
         4a/cC2NsByw+xMSMalJh4zO+iM36lXgBMnYGA5xnnFXD64Wg2rWDk/npi4rI+rWuqrSc
         iOwQI4McUt0ZBx3dlgmSQJtQ5kZjcwowd+dbGlfwCdWVUfLZJxqrsjs08/nDhC8pkJDk
         ewtZcsG7Il9L/SEh/Yk6GCCBewGFNx8omrwlYlvgfOgz+uP86H23RDeKdZTcHLyqZTQl
         Q5eg==
X-Forwarded-Encrypted: i=1; AFNElJ+JO1M+FcHA0SCXKY3BRJxC1gFePaSla9Ot36Gtcn+7PMAvM39GaNFRKVdIGCWLmS0e0+xXZJvMJGcv@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0x0vo7w+Tp+RKpxDr2l/dowpLE56+ovYQ3BiplN8BEPh07gDQ
	/taCZTcGnzSGIVr1jNWwLH+rXgmj7Fi6DojgMD1qSBcgMurYhmqxk0wNa0fmow==
X-Gm-Gg: Acq92OErOr0YYRSWG4eqNSzGv8EPS+TpExPt5m20dg9v2juN8UQaX+y2C/b1CSPga1a
	/7hX6HljAaLJ9+fzTLGLyZWdRfW5cfZ3Vm/Rb7d1IeXVbOuezoZL4iFsxEwiYElLTX33BXoXERV
	vroNRh+JHsQEDsdDbSHW0dOcvZfXMYLUG6gK0UYogISkJXmx0BZd5dbgY1p6DcN2AcbJdY/MUQV
	BB+Ohkmn3awanOOU54dS+TmdLaHVFOf2lvsf9H3aW0Hhh0Abl6DIbbEBvcrMut7Vmhg0/n1X/Mh
	ek79ohHlV8w16FBDm82ulMwfZVFU6ob56hGBb6T0gGqxErZUZlD7dc13n+SeRENEEtQKdMj7B5z
	xX6WLozycee7RsZUVIajAXCmv/auylNuCW6sT1VxT0BD7oU2Snhg2utT12jRfiOaS1zwAhXMhDF
	Yy3yUsp0qb5rLvodQX8EQLKnKe+OX2NSvr1g==
X-Received: by 2002:a05:600c:3593:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-4904225ae0emr248431945e9.0.1779693319595;
        Mon, 25 May 2026 00:15:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49044f2bad3sm244022805e9.0.2026.05.25.00.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:15:19 -0700 (PDT)
Date: Mon, 25 May 2026 10:15:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] gpio: virtuser: Fix uninitialized data bug in
 gpio_virtuser_direction_do_write()
Message-ID: <ahP3BJWWy-m_qI0X@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37422-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,stanley.mountain:mid]
X-Rspamd-Queue-Id: 1EB1D5C6FEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If *ppos is non-zero then simple_write_to_buffer() won't initialize the
start of the buffer.  Really, non-zero values for *ppos aren't going to
work at all.  Check for that return -EINVAL at the start of the function.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---

 drivers/gpio/gpio-virtuser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 128520d340d4..846f8688fec5 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -397,7 +397,7 @@ static ssize_t gpio_virtuser_direction_do_write(struct file *file,
 	char buf[32], *trimmed;
 	int ret, dir, val = 0;
 
-	if (count >= sizeof(buf))
+	if (*ppos != 0 || count >= sizeof(buf))
 		return -EINVAL;
 
 	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, user_buf, count);
@@ -622,7 +622,7 @@ static ssize_t gpio_virtuser_consumer_write(struct file *file,
 	char buf[GPIO_VIRTUSER_NAME_BUF_LEN + 2];
 	int ret;
 
-	if (count >= sizeof(buf))
+	if (*ppos != 0 || count >= sizeof(buf))
 		return -EINVAL;
 
 	ret = simple_write_to_buffer(buf, GPIO_VIRTUSER_NAME_BUF_LEN, ppos,
-- 
2.53.0


