Return-Path: <linux-gpio+bounces-27939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17335C2AC4E
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 10:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 22F844EBFD9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 09:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66CA2EBDFA;
	Mon,  3 Nov 2025 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZIIVqjOG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88E62EBB9A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762162542; cv=none; b=YUA6nk2Cof35AB6V9CbmziDbYp6v+gdTEW6aXfWoH+tsF1Wp3CIi0S33eire7umnljuT6maXkkZhuIbsHgKbXR2rpjLNqKy/KVYVYTSIdF93LJJF6JPMps2IfYek1Z9aauFq/TDauYo9zfTArXK4QC0SOMwjBTGgLiF8Se9Eld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762162542; c=relaxed/simple;
	bh=mPvck7FBusBIrrU9DyUagtYmYc59qQeaw9PokJWo0q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q6ZmUlNvbtq7XMc4yInGHsuhSOHdTslq4x79AOnU4UvD5DOZenh8iyGt5WtCw06zT4t/Jaw1PNPGQ0YVDFOiqm0k6nuoAb51rZSFBtmtWq5sddEIXiOEi+ZcvDZFV4WFcYQFO371Ywdpx7yK0cyb9SNB8m5N6YCbOxOEsGSJ9BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZIIVqjOG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-426fd62bfeaso1690009f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 01:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762162539; x=1762767339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8B48CQ+SAe2K7TCbIb4c6gbeJWwmvGMrpBNS173gJ8=;
        b=ZIIVqjOGRLFg8cNHZ/X3+PWpT96Gkohw73TJiPQQ0JxXxVAJ2Kge3x11xOV+JoTA05
         Tk/mQtNiQcuR2iTCmMZ7EJAPkWYmOSanULylcbiFWV58g4vG26oYJZbUK8HwE/q2zvc/
         npornGaIuaC6e0HupMBdmPsTyrmaRuBPs3ulp2Rs6icmxe6uPJgCfVXhPEVhWmOlh8p5
         /yqI0i76G/42phNQRWpla5gJTMOSKBrJJZPdoa6DNb2jcxbh3M1iWDQyxfLl+4ouMwrY
         UtZRnTXo+qmbg7mbaElSaHf0NAadSQ21UO6ivp7mW/OO1MESc42AaclI76Ick0LWERtL
         LZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762162539; x=1762767339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8B48CQ+SAe2K7TCbIb4c6gbeJWwmvGMrpBNS173gJ8=;
        b=AhXNmV0jrB4X6cI3x5TcFp6xPjcaZfehQvr2+N1S2tJhuQqGXpu2fzIMMeOHq5yXIR
         6eE+qOsCsCxo/tF3OenEBDZQY0wUABEPc4pgWgm9MCEAlT8Nos1Rxy2iwsi47kynpv0A
         ImW6z9BaoQGyaXzXUbmsEDaYF5Dl46hBOXUbIVswi2CmxwnyGUKIRgXqMZWhgOzV3Gq2
         XJ7L0bhXjjXVwTLFnp8jLkNcg9asTHsu96wwx1t3Z6bYy9E59nFpwce7in8QGJavx/V9
         hvwTdZe5ZO54UvZdoQbeJf476UKhpByvlHvDJd4RLmpAS95iwmwFUPb4+n7peMfCFZ6u
         qGug==
X-Gm-Message-State: AOJu0YzmAM7ysmO9WRLy2/Xu3Mh+OgxT/cncqIx9UK0Tc9DXY6JKOUPa
	STUx0fZOoFgkoaJCoz46CAbp8Agz5BVKRMlu9yHlBGdKwZhCVtlTSk4r6Y1WO0q2oc6tZQNHTEN
	9g0JJilc=
X-Gm-Gg: ASbGncvr//JvbW9u+OC15QTNJdzYRw4nC4YSnjLiNVuVEDr4kkEe1HNJKiQk6kbvgmZ
	5oOr/QDh8Aq6gHkx94uwrAm+5M0SRZjGGCNJVjeK7qsyeLCmxB0+TKTJ5MijwCHy56tc0bssOO5
	yRcPvPULvIlJoonEKvk6zFMW3EtY5pG7UMeU2xcwhV4EV6H3R6IoASiuwIGgWPb4cS2MK2dxrEW
	n5fVoM1iH1vm7sCS5JkJP3k89Qnc88Ks1XE9s5AHb+P0DsT89L8ZBa+z3Bll46+V8tIHvDDeddq
	BOAD8hrPzVk0rVpzqRz123PoI66hiYx5kwmFVhzrFV5wLMpHlCGGJQkW3YvibHHjiuksbrrHYFD
	91q1FGvBbylhqc53IKtAUnF1sxt2dGIpG1T8GxoHd8i1y1GPyb/HfVYEd4Lw5oClCRU5ShA==
X-Google-Smtp-Source: AGHT+IHfu9OcksipHflpqjCQ92EerKc5s6qdafFQZQsWv4ZSgHg4geHKeDG/1frk/G+Q89VmFDb2HA==
X-Received: by 2002:a5d:5d83:0:b0:429:8bd9:571f with SMTP id ffacd0b85a97d-429bd68d090mr8088868f8f.23.1762162538612;
        Mon, 03 Nov 2025 01:35:38 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c4ac5d6sm147285675e9.8.2025.11.03.01.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:35:37 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Nov 2025 10:35:21 +0100
Subject: [PATCH v4 01/10] software node: read the reference args via the
 fwnode API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-reset-gpios-swnodes-v4-1-6461800b6775@linaro.org>
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
In-Reply-To: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SV4IzN+VcOwOjZe7Sl4nz98LmAMqSJepmGpgIZqgDMU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpCHdkajN+2UJXULO0gRWdo33RyPbNYEQqxjBtc
 hXqRX69jc6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQh3ZAAKCRARpy6gFHHX
 cpJsD/9w+Iw+J790OWkhVJtQY9JTsw0MQBsIW33yqUuXrhdQM0jpfqYnE7s5thQeJVzIgtQLQtB
 Rwge+GfVlxrVEYTF5kY5aYsWJQPPSI3nBhTZ4l50i7rQLwM3ds91MpuzYldh8vTjo3I34Pq4+zF
 gdv42cYZac7aQR0537bMArdctppn0polCA0bkjcXRSt4RoBI2g6r/NC67EN9i7jC8VDUTiv0uka
 FttcUOJw3/8wQQYJJYekLRjm1+w355yQSe82NraYvivVs0/nOyLwSeOeSnbE2S9GAoTj9jqKSSD
 n5FFcthtAMmURWsOglbYDUau4PyDIqqSXlxOiHg6R5jsBmQiNF6W8UydTUSnKiQ5/TYhKP2y1HM
 Fhba9bRXzhbirtR3ANVy0TRc2WoYYZXbJykvLp58Dnoa7cVgyM4QXUW0QjJ8k62vWp42cOdkZ23
 QNugqQcqolsBG4gR+JasP2a6ioZwaMcsGMVF8yIhrMXp6i5ffDL8Lx3Y9xi/z7r6pvhDBCGhdO1
 PJkLqThPBo4674CyWXFMglw/uBM9Qe5VwN06B/grSkp1Hf2sR+Hs6c5ZObNtJDDd/+lbZ49u8o9
 sFgWocYOyFYQ1+2ajdIhmS8rvSwlU3+oSaZmCD4RSscK3xWM3O6XNFTK89cU6q4T20PZjAP2735
 sqWbpGbtGBAZqEw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Once we allow software nodes to reference all kinds of firmware nodes,
the refnode here will no longer necessarily be a software node so read
its proprties going through its fwnode implementation.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/base/swnode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index be1e9e61a7bf4d1301a3e109628517cfd9214704..016a6fd12864f2c81d4dfb021957f0c4efce4011 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -540,9 +540,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -ENOENT;
 
 	if (nargs_prop) {
-		error = property_entry_read_int_array(ref->node->properties,
-						      nargs_prop, sizeof(u32),
-						      &nargs_prop_val, 1);
+		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);
 		if (error)
 			return error;
 

-- 
2.51.0


