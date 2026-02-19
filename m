Return-Path: <linux-gpio+bounces-31831-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMcXDKtflmkTegIAu9opvQ
	(envelope-from <linux-gpio+bounces-31831-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 01:56:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C37DC15B443
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 01:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A76301E6F8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 00:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4275522D9E9;
	Thu, 19 Feb 2026 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/w/Jay/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F161EBFF7
	for <linux-gpio@vger.kernel.org>; Thu, 19 Feb 2026 00:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771462566; cv=none; b=n4C9SbEkyfLvnYMVO0xXy9vnPR8zGFQZkU2tA7aHJqh4qerJ+yBB+3SVDGZpDv9B8wHxi1+hqlPIYzFOmLTaxadYJCanIKdZPieJY7r6ZtIdqgXK04y+fghZxKzk7WHZGW/5pC3PdAaHc+p5xUusdBwxtbHE6VDXMNwg1urR+GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771462566; c=relaxed/simple;
	bh=ArX//496bE2FskhpynLTmC6UDYXpDSzY0XjLm4x0EFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcNN50cyGSDXaxpR4razTvVKowvvw9+LxlFDoauud3x0JmcFF2sR2K9SGziEYsNryaBo8r/4CWJSzkw5GKxmR0/Tzql6efLUil8VA/NiY+aJ50cX5rSXMfjx4yWScb+wcMLBV4QVTbYSElgAEYMLI+5/XfUfgCMoJ0jVIx3LskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/w/Jay/; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1271195d2a7so325756c88.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 16:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771462564; x=1772067364; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGgT8gl4BQs4As/G6azTBQb16A9Jfxh7/HDWdFmRLcI=;
        b=S/w/Jay/t0W3W9uB4C8DAp9kQUvZjsm+j+7g+b2tzxSfl4Gm+iytx1UiR/6rzNGc9D
         NsamUPXceAcpUx7DSefv/CxElhAGLPHB+Qk+5SKtbVbVk/zHYSCICn6JFfyvl0BxeaB9
         Uyn6HtQx5uu9nayyfThKkfycm/+XjNkP7BEMJxRqNIwc1YJh6iO93chmnn3igpRG81ft
         u6bLk8ZY2EsCxAefgOH+rE1rXt7uJOquFwgHUOQLgOuDnzOi5hNQrukGo6FJ37A9DYXE
         MVfgSQfM9OAetvM3PjBA5Nnojop1jxeExB+MNkZWK/xdwQbdxNz5E4XPYx1RYsifgcbq
         JzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771462564; x=1772067364;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGgT8gl4BQs4As/G6azTBQb16A9Jfxh7/HDWdFmRLcI=;
        b=srARC4GbswUxhBma1vSICaYhwQSH5bcAbiI8+F0SgrokaRL+ki2oq3QjL71ht9KYzc
         h9Ldg+v94H48rWVn/Rw6nKRsTFoOKZRet1p+GdiZqHdfeBXOVQ0Khy/MQXYfl4tU8sHy
         OO3+emptmHDIeuGTAsxBlobkKZowRwAJX+LU1rT1T/Ea8S7V6+l1VWBh2Ip1coOCvOPw
         FNBiKpgVWJxyD64yP1iLqM6+mIUo61YMmcw3Z18Xye73TGK/obV5wScnNFb0GCks7qq9
         U6nyWYJvNct4l/i3RHbgu/hYclai+Ro1V6xfI8yf8vQjHEpubewSgzitW+55u1Xq4zhx
         3sVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGHmIkqN9hFMMNSh9XmzzME2MGAvdOnrc5qkl2q+lBlnftQTLKzdlVxZUBCtwjBUIyTfmbjWoUsve+@vger.kernel.org
X-Gm-Message-State: AOJu0YwJeqWpn9/iVWI5z8G5c0Tj75/uEan2iBT3cAPZ8djxjw/WQ+7P
	7IJ4oPAGexkDHbI4zdTYz0Yuct5nHBkD1qanglcCfzJ5yrRPFr4sKpek
X-Gm-Gg: AZuq6aIcdCOmD/ekGfBQBKpZo2ziMUL+Vxwqb92VzAAYjDNRk9OPqMDiUJm7s0cCUaG
	O/eao8qnWJAAXn1GUNy8gzhEgkfig8nf+7RDC+iH3NYwhjPPKXoiH08f+oE1jH6lFBhK62hOwRW
	wHBiQ7n36hEQUiN/0OiqI073clrG9g+RuvVWXUmZpOLJKgTDxec1/3c2W58xN+LrMYRc+PLyiL3
	9jH6sQKfstZfirhCFVuZl3MUAdi5ucXkgDtRklyaV198DU7xScXAkz8EkQL832X73jvFUr/pQTW
	NbuqbHMdnzuI5nrXY7b+nR4jvjpQk5W4xU9JvVKcryxDjX70LzPtd9VsQI7AZp88JJ087IYDAlU
	wA6lOV3LP4DwYRlio6xHx3IpxdxJWUHc86tqbQ2NcoxM20I8cGwllmHjg6VA717YoqvcrGpQ40m
	fIkzIqtypwutEOMmoBJM2BxHll89n8s4PkEzSOOtE0zEsrIl5Q3eYpL/hHf+gKQLql
X-Received: by 2002:a05:7022:396:b0:11d:f440:b758 with SMTP id a92af1059eb24-12741bc0129mr7691550c88.25.1771462563993;
        Wed, 18 Feb 2026 16:56:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cbc900sm23969207c88.14.2026.02.18.16.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:56:03 -0800 (PST)
Date: Wed, 18 Feb 2026 16:56:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH net v2] net: phy: qcom: qca807x: normalize return value of
 gpio_get
Message-ID: <aZZeyr2ysqqk2GqA@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31831-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C37DC15B443
X-Rspamd-Action: no action

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by qca807x_gpio_get() is
normalized to the [0, 1] range.

Fixes: 86ef402d805d ("gpiolib: sanitize the return value of gpio_chip::get()")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: add correct netdev tree prefix and "fixes" tag.

 drivers/net/phy/qcom/qca807x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index d8f1ce5a7128..6004da5741af 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -375,7 +375,7 @@ static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	reg = QCA807X_MMD7_LED_FORCE_CTRL(offset);
 	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, reg);
 
-	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
+	return !!FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
 }
 
 static int qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
-- 
2.53.0.335.g19a08e0c02-goog


-- 
Dmitry

