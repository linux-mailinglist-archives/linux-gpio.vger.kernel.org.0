Return-Path: <linux-gpio+bounces-31093-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOEAD7Skd2k9jwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31093-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 18:30:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2A8B7BC
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 18:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74FDA30157E2
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 17:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859EF34CFBB;
	Mon, 26 Jan 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQlVSl9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E29E34C9A1
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 17:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448614; cv=none; b=m0BzFF+mKvewBEmP40d7dFOJayCWxVpk+2CCEontZ1U3duNMZ3h6hsM/4c3ekNFNcPuqsi1pipEtLNejZ6xq2jHOhc4EfBETMRoucmqktfEl4ZZnCWJunwUAIdXZwWuSi91lEkkjMNtwbDhk8D2cSTloG4xpCyvGA6+7L3O8A/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448614; c=relaxed/simple;
	bh=uTwubkwE+ivwWxf7Ez9DcEqsmyCTQKSKG9A94OtkCSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FN28c36VQjaEvzcdhaROt1DzQTH9jEot85MsNC7VfjpVyFeFqTVYaaJk2y1l3KRWwKiLdryrs5ERZ4cY9yjOZNiAUufx932PYGzbinT6YtlTA7v80eQKIGbPou3SFBsQGKGFRS5o/+smKZeaDOM+ZIOSP4UGzOX63jzQnX5ERh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQlVSl9h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso116857b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 09:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448612; x=1770053412; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m1VymzyEZQ1GW8HUdY4DzBAeVbamE/3XvlGQUQ5dl2I=;
        b=KQlVSl9h7FKyUptiGUe3auuM9XFSFeDQxol3O1rFeW1E7z3hbeRZ0kew1iGIhyVYdC
         109L0yNYBejYoSsOFHNCaTYYTcSaCh6LL2ZyYhR7KHX7mTrYZ8biB97JXnpPXVyy3XBS
         w8mqEfSdwOKfRjBG7lol4N51HFUPfNfC304K4KFpQgevICvfMLrO54uIfZf+J4NZbCNw
         I0Fyw0KK24LYPnLAvNgthBlLBHN2ROJoYUnrLer1f/X23Xx87uMD8ru14gm0wqsJCJTv
         fX/B0O9AkmWbNEqmUVnh5n5M0e7KRQUDauxhd5AWOKMjWZz6fPMP1lAYaRL/sncEvQe4
         HYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448612; x=1770053412;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1VymzyEZQ1GW8HUdY4DzBAeVbamE/3XvlGQUQ5dl2I=;
        b=nXrQ8e5faKZzl5WW9l4ARuuVi5EkD0Pjl70GMtlC8/ByUoSwEZHlSs3uNfig7wSijl
         yPeo3+FwzYa0831ctSHxztfU8jBuVQHD7rU+00IHo6bfwmGRA8PwHncKmeedAGlSNGoj
         muaBTaMJJQiB+IPsieV927nH6WwOWPbAlqVUSfee08r9Kt/jOVFBGeHP2KXjcNSjFi+E
         /ZTkoX2NZQmLmmwQDwPqNJJsqVI6YNDMFPKkmf8xdslo5ekJOlUYkI5PXVsS+pZHQ5Fr
         Lez3G1LVeB58yRNAqwV2yQvtz9uN5y3dA2o+VOeATPNIsOX/F8DWrTMrg3xan+gZR1+1
         AkIQ==
X-Gm-Message-State: AOJu0YzcYZMc4/zixbwvge8355jB8+l9c01gQmQ5i2iTjYz5tnctOmQv
	ZaAeDxb5jyysVPaNFEaHSOkX4qiW4Ur/zebxEAbmGiLTazv29po2UU/0J2E5JIH3TK0=
X-Gm-Gg: AZuq6aKd6E1hjzVjWMuH8luhjOXFaFK97RSquF881/lxaKRsOURUVHggi7h1UTveVpo
	TfHk6GExku7m9Wnc4u4KeG4rg0Aa7CUtaM7IRQjxKHGRyvS/asds1QC1IFkNccXJFMHZf1ygdkI
	XoSju3Z9cjK5upeU26llTLTXQhCJBCR0WQs6MMPIMzRhQjJwBBdQRTZdaObO62wRi7TmC9k1MMd
	XS36uPmaiP0FuQG/cvUhl/+uMqKTEf4Su4eM1wWgPFeIOh2cfUAy0v1rbVsznx7GD92DTuQuZ80
	xQxAC4So8YUf3xhxt9BoGI+QSBJoffc2CgwPkDIL4kfq3cuytD7zV5436Oo0FD6Zk+SrabUDlNt
	7AnER+aed6403Uftbdf4spLgLUczmEdzMUzTrGTWTQyvA+AWv1EMpB+qTyhc+szavIlX+LHySuj
	aImshEFDFy/M/W+KE3z71r4hs=
X-Received: by 2002:a05:6a21:6813:b0:35e:e604:f787 with SMTP id adf61e73a8af0-38e9f1cbf1dmr3757936637.39.1769448611979;
        Mon, 26 Jan 2026 09:30:11 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.166.246.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a4135e6sm8685127a12.25.2026.01.26.09.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:30:11 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 27 Jan 2026 01:30:07 +0800
Subject: [PATCH] pinctrl: equilibrium: Fix device node reference leak in
 pinbank_init()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-pinctrl-equilibrium-v1-1-6ae094ac3bf8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJ6kd2kC/x3MSw5AMBRG4a3IHWtCB15bEQOtW/6E4haRiL1rD
 L/BOQ8FFnCgJnlI+ELA6iPyNCE79X5khSGadKaLLNel2uDtIbPi/cQMIzgXVdre2Lo2VeEcxXI
 Tdrj/a9u97wehCKNMZQAAAA==
X-Change-ID: 20260127-pinctrl-equilibrium-7cabc99b86ff
To: Linus Walleij <linusw@kernel.org>, 
 Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769448609; l=1193;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=uTwubkwE+ivwWxf7Ez9DcEqsmyCTQKSKG9A94OtkCSA=;
 b=h/WPJw5HexHjsJTnfCwregEkHKWcRvmJTltUG1dPrA8WbKXXaSBELNRf2lk08I0YoIj81hAm+
 Qd2t05p18OZAMd+hwqNDti68Be1v5vVQ2gMKDaMUNwNsNXITpT6gYPb
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31093-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A0B2A8B7BC
X-Rspamd-Action: no action

When calling of_parse_phandle_with_fixed_args(), the caller is
responsible to call of_node_put() to release the reference of device
node.

In pinbank_init(), the reference of the node obtained from the
"gpio-ranges" property is never released, resulting in a reference
count leak.

Add the missing of_node_put() call to fix the leak.

Fixes: 1948d5c51dba ("pinctrl: Add pinmux & GPIO controller driver for a new SoC")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 2d04829b29c9..48b55c5bf8d4 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -846,6 +846,7 @@ static int pinbank_init(struct device_node *np,
 
 	bank->pin_base = spec.args[1];
 	bank->nr_pins = spec.args[2];
+	of_node_put(spec.np);
 
 	bank->aval_pinmap = readl(bank->membase + REG_AVAIL);
 	bank->id = id;

---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260127-pinctrl-equilibrium-7cabc99b86ff

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


