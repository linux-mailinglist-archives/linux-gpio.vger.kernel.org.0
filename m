Return-Path: <linux-gpio+bounces-33209-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELPgOJv4sWl7HQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33209-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 00:19:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73426B52B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 00:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F6E1303B4E6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 23:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C9D3A256B;
	Wed, 11 Mar 2026 23:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnCxiJqX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385572F39AB
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 23:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271144; cv=none; b=YgpHbM+AnrH52ekSNAhgDa4gHowBZd3B31MVWN5O/BslTs6Jh50Fl1RTk/vdR33Zd0N+dQkgS1pv3lyYN1O6mgeoTfZLF2WB91zEf1bOPTDYmEBGtfKwJKHb7l45Ts/CT6AKcy3eBAQnIatk416TOZoUlXcSvBDaayftsS84o/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271144; c=relaxed/simple;
	bh=O6jBhetHYK3YjI5od6XbzRv137I+sjU3j7bdXLcMVIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXUtmLTLWr+Ge27UuQNptGaCK7ZFX3G95b0zSR+6BIwvllfpO7RptpTIXpWJduSWwa/3lE2rcTE1TuwiuqF1L2tMB19Bv+jYxln6pUM1FJ8uAhmxXw0LOcRROZA+PQYN83cuufiBMV08KlU8VDJBrQBbSYGbjZGc+fIWS+g4E4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnCxiJqX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ab46931cf1so12147995ad.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271142; x=1773875942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGQa5TPg+fy6f75658KrdxaLTfVS/9M1At/7AR8OAo8=;
        b=KnCxiJqXXM1lmVUKn97NqqpXhZdLhCN9uXHz5DTW8sEfQGTmXykuLB6tBB/xnnjag/
         KnSYQA0Y5YPXwLLSp8qwQKN1QdI0nkbIHLAo82yUUO5HN0aDTKrjy1rGlVKhIXR/++38
         h6vvkA2FwNuqDFp1eMQm2dYzud4ttgv7diRWElfz9ikFEwf3Dfum4aNMuDNv36DPE7Py
         8hCfsx73HDkCA8hlhce1xJErqj86xlzWrBqasQqGNrUd0AsxtGgypHtoUYdqlvpQqDJC
         oSObC9B1lZXrLnFpOf0YtjhC5FXdsPoivT0iyNb4SmoPeXIJekxF7656Le43sQMW9s3T
         R1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271142; x=1773875942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGQa5TPg+fy6f75658KrdxaLTfVS/9M1At/7AR8OAo8=;
        b=Gex84GzR8zJLW5KL2VfGN9mKbaGXird2/pPr4A5je3UNhVh2u0qPeVOgZtY3OdqnKk
         eHM3K1iK8ail31nVQtFHoHbVgslq0OMTeB7eSE7sErbvKb1ec7xp0/BFSHwxejJOQBOA
         omQymgTZ4ihiIqNLSmOOg9Y44EQa3ncC5KylhJV5O2nls//LH5HYjI8kvQpfqnhhpoZs
         BBq5rp6PRH8EFYyZKB9MCNsfIx0ON8DgCRmmot/UZzeprLponIhpXpl7cTw+wuTUksFa
         p0PrZwGSc6445Db2kXsQZ4IqNetT4rQJH2Acf7VwrD4NdY1o6ELVEAnRHSSJ3PzaSk/o
         dMsg==
X-Gm-Message-State: AOJu0Yzzf0ygDrNElQbWLdYopr4wBIbnlHqvS8v5r/EAXGPv5IUjGE6X
	idquAwaFGQn+Cw25gIKuQWv1YOUMFTklTTfyH6wbS5cfnXxQuSdnJrwQc+JJzrVK
X-Gm-Gg: ATEYQzw3ShEZlFTvAPjof8iAvsS+ODxCrvFiNHUuKxahk3KCZOIsxll0C0Q/JgE79+M
	ndsXqWDhvtz+heuApVHJY6/vi3ac7qrf/R5mq4AdUqoEo5TwxOk3RIi4tc/PjTm25yTcS10I9aZ
	JKrjil1TL1J3lv9E8LLwTOwC8jt0qPT+WfEVOe/t4Jtv/PmPridxaAJKPAKgTOFoaetKLVuF4l6
	3vAPrAEUoIqTweP1SxAuqjnK1Rrnvufmogs03XoIIDBkl270+UIzHgrbH/Rshu7XbOhpeLRIkrV
	hszB3hP7FNbiaUcwotUVmUetxWzDFoyzfUEjZDcUclyRe3GQXkRF2SXIOEobbxhmMuJzljb0WRx
	ZDAS1bIdCeVGVtBifCZF+zNzg9Qx8ajasfi4pV7XvkK0emTQ2M6X4aARwdPY+t3knQZlnuoMTbL
	Lnt/kt4Ovc3NlJ5efyaoOB1mZpVPT0Ns+DK42wxFKDu5cYQFTIoXpvfQ==
X-Received: by 2002:a17:903:32cc:b0:2ad:b213:feba with SMTP id d9443c01a7336-2aeba4416d2mr10894095ad.5.1773271142123;
        Wed, 11 Mar 2026 16:19:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae222e3asm43921815ad.15.2026.03.11.16.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:19:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv3] gpio: ljca: reduce struct allocation
Date: Wed, 11 Mar 2026 16:18:44 -0700
Message-ID: <20260311231844.17891-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33209-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5A73426B52B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert connect_mode to a flexible array member to avoid calling
kcalloc and to combine the allocations.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: make unsigned int to match original.
 v2: add counting variable
 drivers/gpio/gpio-ljca.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..93a0fd4ac507 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -63,7 +63,6 @@ struct ljca_gpio_dev {
 	DECLARE_BITMAP(enabled_irqs, LJCA_MAX_GPIO_NUM);
 	DECLARE_BITMAP(reenable_irqs, LJCA_MAX_GPIO_NUM);
 	DECLARE_BITMAP(output_enabled, LJCA_MAX_GPIO_NUM);
-	u8 *connect_mode;
 	/* protect irq bus */
 	struct mutex irq_lock;
 	struct work_struct work;
@@ -72,6 +71,9 @@ struct ljca_gpio_dev {

 	u8 obuf[LJCA_GPIO_BUF_SIZE];
 	u8 ibuf[LJCA_GPIO_BUF_SIZE];
+
+	unsigned int num;
+	u8 connect_mode[] __counted_by(num);
 };

 static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
@@ -400,22 +402,20 @@ static int ljca_gpio_probe(struct auxiliary_device *auxdev,
 			   const struct auxiliary_device_id *aux_dev_id)
 {
 	struct ljca_client *ljca = auxiliary_dev_to_ljca_client(auxdev);
+	struct ljca_gpio_info *gpio_info = dev_get_platdata(&auxdev->dev);
 	struct ljca_gpio_dev *ljca_gpio;
 	struct gpio_irq_chip *girq;
 	int ret;

-	ljca_gpio = devm_kzalloc(&auxdev->dev, sizeof(*ljca_gpio), GFP_KERNEL);
+	ljca_gpio = devm_kzalloc(&auxdev->dev,
+				 struct_size(ljca_gpio, connect_mode, gpio_info->num),
+				 GFP_KERNEL);
 	if (!ljca_gpio)
 		return -ENOMEM;

+	ljca_gpio->num = gpio_info->num;
 	ljca_gpio->ljca = ljca;
-	ljca_gpio->gpio_info = dev_get_platdata(&auxdev->dev);
-	ljca_gpio->connect_mode = devm_kcalloc(&auxdev->dev,
-					       ljca_gpio->gpio_info->num,
-					       sizeof(*ljca_gpio->connect_mode),
-					       GFP_KERNEL);
-	if (!ljca_gpio->connect_mode)
-		return -ENOMEM;
+	ljca_gpio->gpio_info = gpio_info;

 	ret = devm_mutex_init(&auxdev->dev, &ljca_gpio->irq_lock);
 	if (ret)
--
2.53.0


