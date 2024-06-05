Return-Path: <linux-gpio+bounces-7177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B90CA8FD25C
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 18:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD0EE1C237DA
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 16:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5CC01494BD;
	Wed,  5 Jun 2024 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ovx20g2s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC7C39FC5;
	Wed,  5 Jun 2024 16:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717603333; cv=none; b=N2ibU+46EZXxS1U36Aqnj8YuD8Md1ACmjZGpGcveqJxu+t2RsdOMmNrOmcVvirpm3YOqQCSPeDipY3NC9vTQU7uCIwN/8rOCujGecwzMe5Mv3loumuFd1ePQb/eGiJFF7H6Gh23fFEvzaFSHPmDDgYJN5/MXHl0gKhoteNqlcDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717603333; c=relaxed/simple;
	bh=XsCDIQqWFIAtkoUuO/wschw4i+ZQG0aINPMpmAnYKaE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=MME/iF6qg3arE7102TPcxPeJBgSEVkZfYBBM4QcF1SYjzjypvcFz/h5cglc3LDleU62ZuG/kHup0/75At5LMPRO3iq0uNl89LnV3ZahfWvUBLM3A3Fa/YAyCzVFR70K1oT9gGsWZaJYfROEFqnRbsz9BGdbJOWUWgNzRlA1sN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ovx20g2s; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717603327; x=1718208127; i=markus.elfring@web.de;
	bh=vwdXzxZFphgllAmGQX7gyl/IZ9Ketxl+VMFIZDnDGDc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ovx20g2s/J9C5oKkYJvjucrfVQDP/rxhCRXM5ltGrMGV4qnSaAiBpaqFgGUtG0Th
	 y+S5Fm8K4FYXzmfwKBbWOt6agZw4pi8QJDKaf3IyNID4ezzO1li+BGYhKIXle5wAp
	 mhowIdiZnOaDDLpLlNfNw/T7i7YFEda+YwAyR1LpohAZdHLVGsarMvJx6ckw3TSb6
	 nZR6hcQLFqE5e2TxboIDAORTtlMznOWc8GBcLWUi13wEDLKj2dt6BoByBQtwjtANn
	 RKbm/lpXax3xZ/dA+8qhn7WeUBK76R2FfTQSEMzZj6zmFbnMAk5BiPKXWG2h939X+
	 tl8pQ+IPkUhXyx9WMA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M7Nmq-1sMbFT2FrQ-00FC4x; Wed, 05
 Jun 2024 18:02:07 +0200
Message-ID: <3f6fc17e-2ab4-43f2-b166-2393a369a263@web.de>
Date: Wed, 5 Jun 2024 18:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] pinctrl: pistachio: Use scope-based resource management in
 pistachio_gpio_register()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9RDbEdHu7QE+PQrS0bke8C0f3VIemBmJCM40WoU9RNTOSkdcDoX
 Q/RV8FNC3fG8N+/9BB6imsFsz+tM3fI8AaoK6YUk0bKTIJdAsLQJWY9LzaGhE1/BzLutQ1n
 pA8g/nLVkcihD8yJZ8szRjWPYwVz5Czo6vZIJfjpgTFhY3gghAlgXK1cRWKeUu/Dw3bPrsf
 Wl6uc3i9VT26XBCAhQuQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V197F1Xci9c=;Qc4P3jy9vLPsU3CtCsJeEmLb9Jh
 Xq3lNwgUCV4/WLg42MAeuVn+YLFHCh38ZhSfn3nthnTb0Ukmsq+vucObPL12J1FVirKfkvPXX
 DDl0MSYIIDDS2a5ZzOCGG7+KEPqq6HrhWwmWA9uCi3KBzYVuf89JI4cNuYaz7q5MUPxYYiR6m
 Ep3k39wuzjzx/TNsaVjOCjaptbwm1bQoovvUe02yFHrVyAnepzBMtkMbUKiwKMwh/+qtmH7cW
 WjbSjQzn7ZH5gbqDyKHG6NoP3QWtuFODPthRi1zsDbZaDn2IJak8npf/9J+ZhPORdCwlp0VDQ
 FdrlmKWqAgZvPLkk60Wtkza83O15twEQdKZwTkDeKz0u0VNFllKzJxhCy6IoYEE3Qmc1veZMy
 ZmfPgNxNcV6YBdPUUbZw3rsz3EOUdoijwEFkJHY0kbsqlwMbymKnOvzCf6YwQpaPh+SFpQZra
 Yc5TA/pE0t7umnGPn5E0Y0sosy3o1tgRtH6KGh7qdWeIgVAlKR7paMXW785fB3vA3FOBVkD67
 Y5kC7WTJ58M1VpcvSWOvXiPAgA/01CgXALorUf3Lkst3AVKq9Bw9eg5GO42AHFz2i4/xFgESp
 47bd6obChhWTfGVMcZoe5dUsga8aNAC8jqWrNKTLT6sB8dxjhgTUebhsfJBLj0ckF3IXqN6N0
 MpvTIh7fboKokH0z/2t3OH0vfvqZFuaCXyi1G4P0v7IFuShKuPgZjBNRL9R+8m+4kCAwJWZpG
 k6lBvHyCriDY5L8QK36GAUr/HvFd5tR4PnSOyvrWrJ9uw/OG7kXMdIzgWgeYjLiV1X8AzUiQ4
 lS9gg8hHxOrNQgWJf/sae+gNgYg/kLE5F9NjErM7JVG/8=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 5 Jun 2024 17:46:52 +0200

Scope-based resource management became supported also for another
programming interface by contributions of Jonathan Cameron on 2024-02-17.
See also the commit 59ed5e2d505bf5f9b4af64d0021cd0c96aec1f7c ("device
property: Add cleanup.h based fwnode_handle_put() scope based cleanup.").

* Thus use the attribute =E2=80=9C__free(fwnode_handle)=E2=80=9D.

* Reduce the scope for the local variable =E2=80=9Cchild=E2=80=9D.

* Omit explicit fwnode_handle_put() calls accordingly.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/pinctrl/pinctrl-pistachio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl=
-pistachio.c
index 53408344927a..d0a18296fb27 100644
=2D-- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1368,11 +1368,12 @@ static int pistachio_gpio_register(struct pistachi=
o_pinctrl *pctl)

 	for (i =3D 0; i < pctl->nbanks; i++) {
 		char child_name[sizeof("gpioXX")];
-		struct fwnode_handle *child;
 		struct gpio_irq_chip *girq;

 		snprintf(child_name, sizeof(child_name), "gpio%d", i);
-		child =3D device_get_named_child_node(pctl->dev, child_name);
+
+		struct fwnode_handle *child __free(fwnode_handle)
+					    =3D device_get_named_child_node(pctl->dev, child_name);
 		if (!child) {
 			dev_err(pctl->dev, "No node for bank %u\n", i);
 			ret =3D -ENODEV;
@@ -1380,7 +1381,6 @@ static int pistachio_gpio_register(struct pistachio_=
pinctrl *pctl)
 		}

 		if (!fwnode_property_present(child, "gpio-controller")) {
-			fwnode_handle_put(child);
 			dev_err(pctl->dev,
 				"No gpio-controller property for bank %u\n", i);
 			ret =3D -ENODEV;
@@ -1389,12 +1389,10 @@ static int pistachio_gpio_register(struct pistachi=
o_pinctrl *pctl)

 		ret =3D fwnode_irq_get(child, 0);
 		if (ret < 0) {
-			fwnode_handle_put(child);
 			dev_err(pctl->dev, "Failed to retrieve IRQ for bank %u\n", i);
 			goto err;
 		}
 		if (!ret) {
-			fwnode_handle_put(child);
 			dev_err(pctl->dev, "No IRQ for bank %u\n", i);
 			ret =3D -EINVAL;
 			goto err;
@@ -1406,7 +1404,7 @@ static int pistachio_gpio_register(struct pistachio_=
pinctrl *pctl)
 		bank->base =3D pctl->base + GPIO_BANK_BASE(i);

 		bank->gpio_chip.parent =3D pctl->dev;
-		bank->gpio_chip.fwnode =3D child;
+		bank->gpio_chip.fwnode =3D no_free_ptr(child);

 		girq =3D &bank->gpio_chip.irq;
 		gpio_irq_chip_set_chip(girq, &pistachio_gpio_irq_chip);
=2D-
2.45.1


