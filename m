Return-Path: <linux-gpio+bounces-40018-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bbB8GpTkVWqAuwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40018-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:26:12 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 480DE751D2A
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:26:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=iMOVo9sL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40018-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40018-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D2803010D38
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16DB3EFFD7;
	Tue, 14 Jul 2026 07:25:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D093EE1C0
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013922; cv=none; b=q2XsROwWyjJgrP2kFElWTGgKdPvTajdTkxNZDMYZgTw7QjrjlJOQ/vacxSZL35k3ee2f6yAu6PtgbdCy6k7CDIlLGevAvZGdvcBZ9eZkgcGkAQukfRzTAPZVPN3Hh8taQaSmW8Y/Hp0RWZmD/0JUyVqtQqOW5Lgc/bU2V1NNhBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013922; c=relaxed/simple;
	bh=1YHDAZL/VKIOuAUSWre+dm6O+suVLC6nUaloUPB/U18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=isV49eHzFBlOp3SF5goKX1kCkAOH0Jni5fGnsJdLRgpY5xNRWwo2yDs0wXoNJS8O4qiKvqxgLDU3JS/ba5X8SgWwutgEQ1GKvvcdVF4wIE2y5z9N8w1WPNx7Emo30GnogVNOewxdzJ35Zw/B4qCqbzmJ1hSbY4F3C9nkc75DiHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iMOVo9sL; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b966dd74so15075155e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013919; x=1784618719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJpUBI9vLGJhYFZarTj4HNRi3GoxbMQwRbE69cVXqNc=;
        b=iMOVo9sL/wyc2S6K4dev8V1wJ6eBiWgfss6/dozzYe1O83OuaPH57UbM6a+nrCKomO
         CJrsqAM8lbFXZ4qEPiQKISkfrj6pBV34Qew3ol0iP+MprjQSUP06Lm/2sqlIs+5QeIV4
         go6Q5flXpVTeuqhqAh/5i6s0+wBzc58ReRvm88OVwHckRQWm4VnZafcKeYNccE/1KKqc
         wGpBw0OYmN6Bwgw00ZVoRQOfEs8NlC3CyKOgF+Bg0LavNIfKdbcPVHUwI3S/aQtGSrUL
         51LBW/3ewvldJjyakGXtLrnkoDW+1VcDBwULBVuJ+YgxJS0W6TMuMZkg1kwXeZVbrxMG
         ynxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013919; x=1784618719;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJpUBI9vLGJhYFZarTj4HNRi3GoxbMQwRbE69cVXqNc=;
        b=Lp5FPfYvHjsjKJcrv5Z8pKV9tJ65LBRwW4phNgvIff1lpcZRRy97sSg7IFpznQDawM
         BNyJvc2v+/5NnyfDjoBUuSepwJE6sAQvoo0OUYIPpdbkMVlrf3i++AsVQ8ApTqBR0cL0
         85dgdnVxa/qXKk7PK5n9o7s7tYSN5pgxhBxR8mYXt4wzl9e7R1ZzAJkPY6kU5xUOk3/0
         mjI/kfpgZEKk3oD7GxO9JRZaOFsQ9csYOgbscPezMTFXNZGIfd1H6o4dpUBp8VnTZD0r
         BQUL1K0MotRcRWNoXFYiQPmNqbM8J25dt4+vARVm76J2dRHnjfdMOaKbHWOFqQacSpFR
         t4rQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYk4qjGNNtd82AcxK2hkRrVhBLB/Dgrog7OL1fz1ZMQ2y4Vzlr3VW28J4v/I0nHy/ElsHOdx36RDHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxFkHIkavU0O9BTyShLc1lfjuNFBYUZX9Nky0GS8Lzm8/6A9qvh
	Wakl2vbZ8ak68lDn9VRjwwJOXVS7Xw71DpYuIPjbhPfuhV9n6qm64FBGdJOaud9XxEc=
X-Gm-Gg: AfdE7clU/pzvqcCLLKgAvlOZ7p/2Df5e1KqFSFQ0RQpq9SvzGblNNdwB8WF+QgkDSz7
	VaRlZ1NWCl3fXXBdTn7jd0MMnjXd8WwFlJHCbN5rhY3h7y89sXYp2b+EdT1Fd4UT+/YnWtAq8j0
	c8cN+dXRWT3faJxCFuEjOuQfd2MsFC8KQM1Hq/Cy6V8DW/6PYroWpWwMWhDd6uf+7iWo3l7CYCN
	lrqbBbjKpUNrS2peo8EB++Yp3elkXVMvav+Q4eF9rCB0DnMJlIhrQntnlG3SkkFroXLiKBIfnlT
	LmzRWA3Gb0C9DnehojzXeukp3jIdAcWviH1Xhc+JsqGP9FdBdxVUnxhvHiz6B/1Pl9o8YvlGhg2
	9jxRkuiyEnIaD/a3ODMzh+KzeTDt5mkK2XotjnQk45RMj3Fo3KUI+KfVoLKzU+6iUvZGjRWZ10c
	9X286pfVmk7lO3xdd8BYE3eJt9XqdvOMggw7gHkED4a22HpVTWv9AMwOoj2WZE7VpRz1O773GKA
	y1I
X-Received: by 2002:a05:600c:a08e:b0:492:6f9b:572e with SMTP id 5b1f17b1804b1-493f883aa3cmr118959835e9.37.1784013919577;
        Tue, 14 Jul 2026 00:25:19 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a32b9f3sm63312615e9.13.2026.07.14.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/20] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
Date: Tue, 14 Jul 2026 09:24:05 +0200
Message-ID:  <0ae42630bcf5e07ad7db5568f3e87a8196f69c84.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=1YHDAZL/VKIOuAUSWre+dm6O+suVLC6nUaloUPB/U18=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQlgeqnk8+qFCArTmdQxI8OiqhrzkpIRfvZs hemNloK6jWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkJQAKCRCPgPtYfRL+ Tl1yB/4n7A0CN7V5OrIc5Zs+zq9bnil08U+YW52nSbwE73T8WsCNiqhZV2VMYRawtAOqsecFxc+ G3Hh5YF1l/vVOPN1aWmpx4ugwuLLHVmDSgjwJKa8F5j554C2jD1UzlWeKkqRzMQrnMswnGFK/nQ jVVlD8F9GPR4ijy9YpSJUrJJGXyZz3fDYtAwK7HomurhXW0vsGesgACjNRDlXr2xVFC29SwRUYY 5xiyRgAINx8VvfsaYxcHZxO0QExMkGFwcTCgX9GGRZ0zohThGez2n57zvTMoBrmd+VA0yl0roXK gDtQp1yD1L0L/WHFtBD0jO9fmCDWrhBRYZjBX+8WrXkr9kz/
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:lixu.zhang@intel.com,m:sakari.ailus@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-40018-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 480DE751D2A

The driver explicitly sets the .driver_data member of struct
auxiliary_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..ad5dc9a3a119 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio", 0 },
+	{ "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
-- 
2.55.0.11.g153666a7d9bb


