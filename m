Return-Path: <linux-gpio+bounces-31805-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH8RBt8NlmmNZQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31805-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:07:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC7158E5C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 20:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 494363014129
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 19:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997BA346769;
	Wed, 18 Feb 2026 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+PIQHIz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A61F32C333
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441626; cv=none; b=I4/kdZYxHUV49YpAbkKPwlWiYR4AJc5PGdPva25gmiF3QXrHcsuHzAfwVxHlOcnQKs1uKu5XRZkLLehRFZ36R6p+b7orYMEm3is0UxjRj9cI2CjITNIpboCR3aENcNWSKbrV/+/ax0KoetX7VUpJ+4tfRvDoYJDpDqQQGc/G0GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441626; c=relaxed/simple;
	bh=YKPkyVn84djsQ21bWqlvEVJbXexeyER9SFfhVqwo93Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VJ6Ocqqcql/MUa4OH89vCZ3Bf82GPn4wSPeriIyUjRJfYQyNgef9j06/dCAU9L0FIWtvbw9R3zZuyYGNu3Mvf4tylEGDZcOc+YAEdVFh5omgIBqmyMmNjxYfJprMBJJPZYJAJuW9LVNwCT7hYw8PIu+qb1++tgDMBkCQtZoeI50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+PIQHIz; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd3b0bc201so288887eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441624; x=1772046424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+7WWfDDZVRSfcq4msP//TUc4nSkyyaxEIfGm3pf7aN0=;
        b=l+PIQHIzA+HKm0zRZzGUW7+qqt4oR2keLQ6AxNnKe3CHXcaSEa89Jg9Ht6P1qw7TAA
         aZt8N41nowI62lmbuDCbbzK58FM0JKQLufF5zNEC19lKbmAE0rfjXciaK/1IYFYzdMnl
         EKfXBb1Q5U7NcpbevdMvGLQhhl3OpnslPWRnnnMWWpFRMtXttLtkd47tj7edDNd/3wAC
         V7nVOwdn3xQ51rLlQCbLTibtEhDMTepWoTtGxObr/6a7AJkY2wXkRDQUPryni8nwD8Nx
         ZkvAhndgWuQDbu1L146oX5v29xxFFWL1E/cJEVj0H0TtOhmpCUVAg4XBEFoi8oxCVY3U
         hcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441624; x=1772046424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7WWfDDZVRSfcq4msP//TUc4nSkyyaxEIfGm3pf7aN0=;
        b=IH+MkhaNQQMbi13XH5cEn0Eg1LeST7zwoHnNIMH6zSf4q8IaYTvnPhRZP5qTUVDmny
         PFRPZCtrwCX2HQO18pf4pwQVLHV7UBt6eIUyJ1nflGiJZk5eiflTEEwQL/DjxT3ULKUa
         7gSHA8VG5q/T6/AwmlUBe6wNJSzHPwYqsbznWpDgk6xl53lp9nEhqzbmla0q0scaSWDo
         BXQtjnflKfJ/ZU3kPVd+P12ehkgsYLlw4DtthSoEmqVaYY/dNGnPakcM9Kf2LYz20iYy
         6Ftj8jmlFDREkygvFArMtz2yVoGAlFwNpOjWCbTqw8Q78i6sP50j8qbv0j8Rmif48bRi
         2VxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjIB6eTM7fLcMKyN9kzq+vpIn7SiXpckFjVw7JOeWupa3v5WYR29kxjPcbXd7rLJRcS1+Ty34dB/n8@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdvt3zjvbXgx1JyoarxmH/k5AwQ59B+hsffQ38bITIrFNNsqL
	6uo4kwzla6qLpAfAumZDRD6h47Zt3/hhUAQ/gRFtGdfzP73ykodXi1Vy
X-Gm-Gg: AZuq6aKPZilQBBNlGhFUDfgQ78e/ZKuTrL73a5fd5yIYbmOJ5GpRr2j7bOhVLGWtwKF
	CZoqFda3Ogyq//zVtJtl46tTNrGzdD12+y7YbHqYw8AZBkWHC0NscryW1myUbG8axGxUzPb9JTd
	plBzdiqvRyaK+e2F2CvduDz1+1e97NIL2bZ39EnaVe7gPb6CqwsQTmZ7CtwhXNI+6Hgqnk5vUid
	6HkJgPsmKvaAL6yJOFUIIZankC4B1E/J5cXNa9CORpb/famfi9QPr+QdfRn920zMxakmGxzh5gA
	9V5S89OdWTDmX2MLcchj4ZOdkRx9DzlHHIV2w+QQRkdSSSemwL1BWMd31H973DoB2gZYdd2SEmc
	1vZqbbyTIUjjMP+bKGcV6u0azFoLLvuVOYcnwK0jbEA9EVEbeylDpnJeSPrjQkz5ZMOTx3ZUkcV
	nautflnasY6l9w5e+g3SU6QHBxmo/E1csT4FQp1B16epIGcYY93aKu0m8KoQ4Qqu/DuDKxONmkc
	mGZVKfJfY9wmCk=
X-Received: by 2002:a05:7301:38a8:b0:2ba:94c1:6c8c with SMTP id 5a478bee46e88-2bd5b40e440mr250179eec.39.1771441624161;
        Wed, 18 Feb 2026 11:07:04 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d80sm22108652eec.1.2026.02.18.11.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:07:03 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 1/7] gpio: bd9571mwv: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 11:06:50 -0800
Message-ID: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31805-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,bootlin.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83EC7158E5C
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by bd9571mwv_gpio_get() is
normalized to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-bd9571mwv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bd9571mwv.c b/drivers/gpio/gpio-bd9571mwv.c
index 7c95bb36511e..cc5b1746f2fe 100644
--- a/drivers/gpio/gpio-bd9571mwv.c
+++ b/drivers/gpio/gpio-bd9571mwv.c
@@ -69,7 +69,7 @@ static int bd9571mwv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	if (ret < 0)
 		return ret;
 
-	return val & BIT(offset);
+	return !!(val & BIT(offset));
 }
 
 static int bd9571mwv_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0.335.g19a08e0c02-goog


