Return-Path: <linux-gpio+bounces-8882-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D500958EFD
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 22:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE1981F2349D
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 20:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E726A18E37E;
	Tue, 20 Aug 2024 20:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MDDHtmvG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA83165EE8
	for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724184163; cv=none; b=QYs5OBbAExzgWVMB2bL5Q2JASqyX55WQ97mAsMUKeX/UXID3A1J1rnA2I6L97/8jgfOvi1DfGKdQ5VGDYVDE7Ir7+TySSCcumHZfYUjgdv56S2jlxEpWQSTQoLK4IKzOYSN8ETMqmhyMrnPfni35tN/foYiZMVlLgWziveT79HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724184163; c=relaxed/simple;
	bh=Y2gvoPnwuPcNweX0gDBFnW2CM9DEQuzmLotgUqnurcg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TNUV+XFI7K5TprqAAPuUQXb+tamaOL9XuaIUSAbK2jFEwG92E0n6Oyj5HIfokNjg/JhYQX3hxs9qBzfdR6DLiUui2e/Ula3GEvp9VHISlaQCR8YodPyVEDu1/8KjAIipb/f+caYnHz7j5ezDnOnU7joqWAWnyU5nkO4db4hVf90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MDDHtmvG; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so8507580e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Aug 2024 13:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724184160; x=1724788960; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wn44GeaNGcKT5PtyKSFiDbQH2xpZLcD1VE9Ua/7Rbm0=;
        b=MDDHtmvGlsGInYv4MBspTuc6aqq18yE5WuYlkDlFqOyuwIQdslBuYkUHn6JQsFsG4K
         h/M0zpbdHm0QKONyu1OY8rm+CVsE/xW4R9N/15TES5E26R/b88KDghDj19wexfCxqOnL
         /Obz6y1JfFX+Cmpp5618TmSd+lpCiPYj8IBM4BOxs/+jFQuYtuBLVQ5B5t7FTK9O2Bkt
         fJUsz1w/JlWhuG+l8m88naFEpti0WmqgRTxylhEVRo8lOwx93Gw1opS+W7SBH9MJdDY6
         pt6TnETGrMxeDbZxAirPTQPlHvanOjyETlpEVcFE9xkqHeY30CibrdIEDxney8c06Wf1
         CeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724184160; x=1724788960;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wn44GeaNGcKT5PtyKSFiDbQH2xpZLcD1VE9Ua/7Rbm0=;
        b=sNPGTuzHAudHbZfJedL/hRJWqcMvNN6PA456b2EfcZR8kw2b66C7Df3vlPyenX1g5k
         M4lYOPbHvBFII6g1ZoaBhrIR4SrRJEz8nEtl73arMQlQXv72lJ5F7atVQmprs3Ul5ggV
         koecnF/r4a9RERVyplXv4q8xdHosahUfa4ZUn9d3VkZ92QZCi0EcZAU7RqImQNzKeUZ+
         tkkQuIwZL8UMDQpV49pseESDcbPAjUWHZv30z5lxBRU8ahjdGgtda5Uu5rCiLc5BBBkv
         Gy+oqz9IhL2BgEj24Pg7shexsFzflA1ub7CBwsUBaTC8wPzKFK/yHNRqEWVVt/T5fT+W
         GAXQ==
X-Gm-Message-State: AOJu0YxmidU5XYAU/cz8/1OkhoJ57/uks0WaLjZdmfpOgb8DyLOoOlmy
	VxZ4uugQH0JZCaNwVnyky+M5QSjrZrQPGaBo8ixYce2n4WfOhn9On8JA/oN0NL2jd917QcqSLIY
	64gyvU0KxcQHVvCGH+kVRoddXnos=
X-Google-Smtp-Source: AGHT+IGICkMdmQeBoPAcCsMpSkAODPNo2FxX+Phd9Wq4JO/GeU7rwvtJw5JbyIDLW6L5Hy+XNSJKf/t1p4GjGIvjyR0=
X-Received: by 2002:a05:6512:114e:b0:52c:dc25:d706 with SMTP id
 2adb3069b0e04-5331c6e3961mr10034068e87.52.1724184159657; Tue, 20 Aug 2024
 13:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 Aug 2024 17:02:28 -0300
Message-ID: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
Subject: pca953x: Probing too early
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi,

I am seeing an issue with the PCA935X driver in 6.6.41 and
6.11.0-rc4-next-20240820.

The pca953x is getting probed before its I2C parent (i2c-2):

[    1.872917] pca953x 2-0020: supply vcc not found, using dummy regulator
[    1.889195] pca953x 2-0020: using no AI
[    1.893260] pca953x 2-0020: failed writing register
[    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
[    1.905575] i2c i2c-2: IMX I2C adapter registered

This problem is seen on a custom imx8mp board.
I am not able to reproduce it on an imx8mm-evk.

If I select the pca953x as a module or insert a delay inside its
probe() function, it probes successfully.

The drivers/gpio/gpio-pca953x.c has the following comments:

/* register after i2c postcore initcall and before
 * subsys initcalls that may rely on these GPIOs
 */
subsys_initcall(pca953x_init);

but it seems this is not happening.

I have also tried to register it like this:

--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1369,21 +1369,7 @@ static struct i2c_driver pca953x_driver = {
        .remove         = pca953x_remove,
        .id_table       = pca953x_id,
 };
-
-static int __init pca953x_init(void)
-{
-       return i2c_add_driver(&pca953x_driver);
-}
-/* register after i2c postcore initcall and before
- * subsys initcalls that may rely on these GPIOs
- */
-subsys_initcall(pca953x_init);
-
-static void __exit pca953x_exit(void)
-{
-       i2c_del_driver(&pca953x_driver);
-}
-module_exit(pca953x_exit);
+module_i2c_driver(pca953x_driver);
)

but this did not help either.

Does anyone have any suggestions on how to fix this problem when the
pca953x driver is built-in?

Thanks,

Fabio Estevam

