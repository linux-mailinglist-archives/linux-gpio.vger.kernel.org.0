Return-Path: <linux-gpio+bounces-26088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A641CB557B0
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 22:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 059DF1D62F5D
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 20:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C317E2417E0;
	Fri, 12 Sep 2025 20:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b="i/yNa6K0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from 20.mo550.mail-out.ovh.net (20.mo550.mail-out.ovh.net [188.165.45.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C6A2DC76D
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 20:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.45.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757709440; cv=none; b=cXjT7J6QWP4zrKjesYbvyMsP113SM3VOTj/tBXWz7R84jxu6mNleGzAF5YraxMVDLhj3WQdAN2aw0XvkVrJ6byhV5ayjmUgROEc5VLwZ/mSswNaIHA89hT1VuNeVCiTni0EQPYyy7la9eVzqjeSrg0gh6J8zkA+a71tKukeK2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757709440; c=relaxed/simple;
	bh=g9s4aBgq9mUA/MaM7/N6IjRsE8phQz3zLoYU9BI7XB4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hjyEZckjkdTvt6OWYdABSfAEFDkSLtviR5ltRfEeW6aTsSXMLn7YH8hmDFB9GvjQ0/H+2S7P5Bg3kAZ8EoNEnfHTFpxoTpnWbAJY/OZrJgGTRceu3AYB3lEEhQCqeKGs5I1W97Jwm+xOAc+eY9tHsUHrOwgeUt7oyakDPU34OKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com; spf=pass smtp.mailfrom=armadeus.com; dkim=pass (2048-bit key) header.d=armadeus.com header.i=@armadeus.com header.b=i/yNa6K0; arc=none smtp.client-ip=188.165.45.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armadeus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armadeus.com
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.249.41])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4cNm3X6FxFz5xtv
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 20:19:04 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-8lnd4 (unknown [10.110.188.251])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2D59FC15C2;
	Fri, 12 Sep 2025 20:19:04 +0000 (UTC)
Received: from armadeus.com ([37.59.142.112])
	by ghost-submission-5b5ff79f4f-8lnd4 with ESMTPSA
	id LoviOjeAxGilAw4AMdo/aw
	(envelope-from <sebastien.szymanski@armadeus.com>); Fri, 12 Sep 2025 20:19:04 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-112S006d9550b98-7ae0-4798-a2a1-6fec4990740f,
                    24C0CD233B02D59DA4C9EFE158FBDB7975D525F0) smtp.auth=sebastien.szymanski@armadeus.com
X-OVh-ClientIp:86.243.209.203
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Fri, 12 Sep 2025 22:18:50 +0200
Subject: [PATCH] gpiolib: acpi: initialize acpi_gpio_info struct
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250912-gpiolib-acpi-fix-v1-1-1a41acbffadf@armadeus.com>
X-B4-Tracking: v=1; b=H4sIACmAxGgC/x2MUQqAIBAFrxL73YJKUXaV6KPsZQtRohBBePekz
 xmYeSkhChIN1UsRtyS5zgK6rsjt8+nBshYmo0yrrDbsg1yHLDy7ILzJwx3QWINlbdFTyUJE0f9
 ynHL+AObJw7RiAAAA
X-Change-ID: 20250912-gpiolib-acpi-fix-7ee492ebd5e8
To: Mika Westerberg <westeri@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
X-Mailer: b4 0.14.2
X-Ovh-Tracer-Id: 9239134636664548198
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvleellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepuforsggrshhtihgvnhcuufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepleelgeetueelieekffeiveekvddukefgfeetvedtgedvjedtgedvheehkeeuleetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeeirddvgeefrddvtdelrddvtdefpdefjedrheelrddugedvrdduuddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=p8MdL3xIorxozybFE1L91018QY5I/1ptU7GUsykpYEE=;
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1757708344; v=1;
 b=i/yNa6K0lMjZqi+wijFic2vsqkF2gxMVzZxSAwTGjghyf8NUs3NVmAznCr9v3dNSfU5+63yp
 APiYmO2HTAaYrbd0JWjGeRkh4hu/o/jA8I6nJX0LqDvNq/F8CTQBd6MBsCfK57THcQ7bSTKc4z1
 D6hydl1YdpZMQHWHwVzHiBSXSmy/YQqek9sCub1QjlZoN9kP0HC0jJRri4vszDQVg6hZ9D/sDb2
 Z3chzBacKjv36GASfqsKokTU0TLE3h9uP5Tt8yjDmCwZazazdsvNHFUCX5WOJ6usIkdnJtGN/J2
 E7v8q8irfevLf3fIPuuqmWyWrbc0Wx8HV/DBgOmJJdJ3w==

Since commit 7c010d463372 ("gpiolib: acpi: Make sure we fill struct
acpi_gpio_info"), uninitialized acpi_gpio_info struct are passed to
__acpi_find_gpio() and later in the call stack info->quirks is used in
acpi_populate_gpio_lookup. This breaks the i2c_hid_cpi driver:

[   58.122916] i2c_hid_acpi i2c-UNIW0001:00: HID over i2c has not been provided an Int IRQ
[   58.123097] i2c_hid_acpi i2c-UNIW0001:00: probe with driver i2c_hid_acpi failed with error -22

Fix this by initializing the acpi_gpio_info pass to __acpi_find_gpio()

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220388
Fixes: 7c010d463372 ("gpiolib: acpi: Make sure we fill struct acpi_gpio_info")
Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 drivers/gpio/gpiolib-acpi-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi-core.c b/drivers/gpio/gpiolib-acpi-core.c
index 12b24a717e43f17621c054bfc4e9c2e287236d8c..d11bcaf1ae88421e5e5a11a2ba94983f437c413a 100644
--- a/drivers/gpio/gpiolib-acpi-core.c
+++ b/drivers/gpio/gpiolib-acpi-core.c
@@ -942,7 +942,7 @@ struct gpio_desc *acpi_find_gpio(struct fwnode_handle *fwnode,
 {
 	struct acpi_device *adev = to_acpi_device_node(fwnode);
 	bool can_fallback = acpi_can_fallback_to_crs(adev, con_id);
-	struct acpi_gpio_info info;
+	struct acpi_gpio_info info = {};
 	struct gpio_desc *desc;
 
 	desc = __acpi_find_gpio(fwnode, con_id, idx, can_fallback, &info);
@@ -992,7 +992,7 @@ int acpi_dev_gpio_irq_wake_get_by(struct acpi_device *adev, const char *con_id,
 	int ret;
 
 	for (i = 0, idx = 0; idx <= index; i++) {
-		struct acpi_gpio_info info;
+		struct acpi_gpio_info info = {};
 		struct gpio_desc *desc;
 
 		/* Ignore -EPROBE_DEFER, it only matters if idx matches */

---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250912-gpiolib-acpi-fix-7ee492ebd5e8

Best regards,
-- 
Sébastien Szymanski <sebastien.szymanski@armadeus.com>


