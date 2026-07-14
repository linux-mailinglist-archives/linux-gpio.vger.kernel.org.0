Return-Path: <linux-gpio+bounces-40027-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BVYCHGnlVWr4uwAAu9opvQ
	(envelope-from <linux-gpio+bounces-40027-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE50751DCC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 09:29:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=aSk3KKP8;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40027-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40027-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 544B030B126B
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2026 07:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AC93F075D;
	Tue, 14 Jul 2026 07:25:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9603F44DC
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013939; cv=none; b=Jeg5GqhWG242lREu2P7UC6UK3iMH2YL5A2degXwkq/8g/Ew4Fbcg+q/CSRbH2rMAXKUqjhynUInxl+sftTal0WiHj7PzX5qmhsAkXsTUUKJ88+KHj/mpKnxb0fecq9uLGGyQl+/kKXahmYU2ZBO8+oRIMvjlccZDuD7q0FiheMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013939; c=relaxed/simple;
	bh=zK32KFTfK2VeZqkps/3UVR2LG/9RZKDrXVPkrweLYjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+t4SzjsoSrQ7LVXcbt+qfKo2asQ3U8jPQt8zD4eHgZMdynGrqCoFi35KHLE67HaVbYSOuwlvPXd20tE4JvYo5FJgVijEAYX4YtWe+qNLlnzNZEGWAiX/IFcS7QMakDR4DCkggU6GaGEgs8Ce2VUFKWG/wI5Peu5ZRUXIBHzs4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aSk3KKP8; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493ec555a26so25527775e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013935; x=1784618735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OTtEYT4IybISQ68wyIhRqfBdv7sO2ZJrx2Yj4/Wp88U=;
        b=aSk3KKP8i3kYUw9tK50WuYS0HDw1I21nSjPX/3f9hfVCXqg8BphlfrJin06SD7IMF+
         tUBW7dVi0SD9JcYUnNVutFQse8DSGEGGQ66zfi12Nkm3tSkfhsnVmw45UIoiS5Jtdi4V
         kDDFgOGvfrGqD5VM3LRzSqpuxgAs7Vg1sMX1yPb6XRlURuwo5IQpIjFlrkYAdGEte2LI
         I0twfP9RBMeAJzVlNzm+K11qvgGDLxdHRmyfJrx1X+u4yj3ckYIdF/mk57Rvz0P+AaBX
         ol9b+ULe6hKB/dLu6CHZg5dmH+nW1kegJ7jROB+ewMbnT1Fvc+PKqrdeUEgz/tKh9Frn
         XTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013935; x=1784618735;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTtEYT4IybISQ68wyIhRqfBdv7sO2ZJrx2Yj4/Wp88U=;
        b=izHhynKknYkf+B2/OBx49euHVNO516eAp3FoMgexdbfFAb+cBl0zZ1p+RZ6nUpZ6o4
         vcsOYrCRkhew74X/VphHSDyimh2LAKtoKYk1RbysbHECeUe/J31d4Kc4oaXPQbqVJC9v
         mtMKcQ6nTLCH8uaA6BEQhb93vVIPyj/87+mXaT2RaD1RJL+6cqYNcmB/cM/ehb4D5hpZ
         4S1OBTb6TzrcuU2+xB+sTb4Nz91Y8XnZw7908HN24UJKoAgakoi8lcLDGdHEyN0CsyGB
         zb1/dUNMsaaBxo4wYmqms1bJKU02rEwDLuNnD0fcyvEPNmXXNw0lNTVbY6KFgzlue/bt
         QXjA==
X-Forwarded-Encrypted: i=1; AHgh+RoqenRtHDLgnNyHBcRZ4nuIeJng1RMhI2XiUHhMkhCFV6hAxWWQnz1lf/Z91O9j4LXaFNtBpbdKZuAj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0mdLrrjqp4b1lwGDnfMPPOPSReUWl0Dc32dAHF4fjztSpw5AD
	HTFSTaGGoI1D/iM9KQNWZoMDGvJFBqH0UkmeHb/ACyY0W3I3tKRUWb/gHyhPS43+Sdc=
X-Gm-Gg: AfdE7cmyF117Vq6ZZKCANT+ImWhlQ3MXoE0FGmV3BU4E9XTMJbdSjm9Xn+eZmdFPOCA
	3ULX82zg/PCixbEWNtjpYQEmQKS5do+5bcPSQKd4KI8lz7Rcj0qqTEMQK6cUqkTpdncwK4dXWd8
	/etrbkb/IZca07drJRWpYVJp3VczR8YdkcuEydMZgx5ujnH981c796jsV1qTx25Ibze/G3w+PgH
	mu6ZaZziQB/VZksl+eDj9++8ao+5Ph1IYO4pJyLNKl3Qalrx3iOz7QavPPSoO+S+6USHjJM+Rdd
	+e6zaf0hDE1789UXBTJJkzpxwnglAmPQG3KpZpzjNhyHX6so9PK5oTmeZ/XXhbpmsOPFOuDrnKE
	xlxU4EYD/n5jkxPPBaTAOvNT2D/SDQu+MgdpI1DAGcUy10auCJueY2aZtR+gM/26HmAgAqhKQFh
	APshd3YtAd7w6mKK7RGL2/VvkHAdMltYpFK4tWLmP0EE3XwiVCF9ObNegwcQUClzGvNTpShAaAb
	Vfy
X-Received: by 2002:a05:600c:4746:b0:493:e034:a3b5 with SMTP id 5b1f17b1804b1-493f8818cb0mr137611825e9.24.1784013935594;
        Tue, 14 Jul 2026 00:25:35 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493f2d97527sm370187275e9.2.2026.07.14.00.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 13/20] gpio: virtio: Use a named initializer for virtio_device_id array
Date: Tue, 14 Jul 2026 09:24:14 +0200
Message-ID:  <1f764e00e8cbe7624f4c9f3d8e5c368fd9a13e08.1784013063.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=zK32KFTfK2VeZqkps/3UVR2LG/9RZKDrXVPkrweLYjs=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQ8jD+oZAE7W5RXF8rKJUVerBaw/+SR/Ptvb A6uSgxdM8mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkPAAKCRCPgPtYfRL+ TncWCACxbyPh7OXwKnrY3teE/nhaOHCimlr7xEX7xf1tiLRQ/ZNVnlSU5LsOUMmenvmSyuvt9fC VPvSlR+D9pSJO/stSpJqY2kgjflibPOZu1REykCiz0Ip+bMfzhru84SFm+JMSX3xdLmqsLtjKZP GsuT4ghM2n4ZNJ12CeYNmdeKAOCalR0bIwVFF9eqA/nonLt2GLo04ANip11W8u4/hEJY2JoM+tK SndFhJGFR/PRKG3tsUChrDuGz7k0SrG37zqDQ49lWHcU1+Ke6g/SEDDXehXubqDNo0szl4NAjYC w5iWTkMyhZqiL0oNvM0CLi8lEtVXz+QOAGRM5ORZ9HunZ/ND
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@kernel.org,m:info@metux.net,m:vireshk@kernel.org,m:linux-gpio@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-40027-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:mid,baylibre.com:email,baylibre.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAE50751DCC

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..42871db05ec1 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -646,7 +646,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 }
 
 static const struct virtio_device_id id_table[] = {
-	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
 	{},
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
-- 
2.55.0.11.g153666a7d9bb


