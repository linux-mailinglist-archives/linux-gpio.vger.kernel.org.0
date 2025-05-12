Return-Path: <linux-gpio+bounces-19990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C856AB464E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23EA7464A50
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A4F29C35E;
	Mon, 12 May 2025 21:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijkHU/ZO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9929C33D;
	Mon, 12 May 2025 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085365; cv=none; b=ZTXjltuKD0wzt+d/Nk7tn8FXtDFQXKMLtrqoM2oNeV9hDacv5RUQoUrXsfisDnq3xk741uYNEn3y5BiXYUf8fBDpVzaeRcc4nCPANLJeNnIobT2dFImd1lJJj5MSsXJ6KoKcjLgrU6NTrDzcnnawrxyDcyQPtMnf31lj9uNt18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085365; c=relaxed/simple;
	bh=aYTVAl9tpCjpSvYuv5h7flPjDKRvDIanTk0kRi3jRK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WaHoNzyF0yTe4NRzC0EP4Re2O4Ar8/VmkLlmTXuayioOw/7gbAsF0awJUdRfhLr8L346ff3IgK2fOAutXM+JQL9aCC7XpSJtgrYVbnvt0QWr3kk7CMy55Gp8cEvq/rJxGhG1024QHM7EqhGL/2PP5XOoAHWcbKsYIURftzt9DAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijkHU/ZO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso7961626a12.1;
        Mon, 12 May 2025 14:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085362; x=1747690162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szzST2rS84bZDMOoZWhP4HXje/44DCg2dZeaKbDsRF8=;
        b=ijkHU/ZOndqJYi7EjNAvuMqlNyuCQDrDBMTKDhc5vQMOR9TtoLAwLTBK2ZV9FTO+Bm
         cU1AXoaYC9PLhWBhwSm8BPq8ZxG7TGJNZP9EH+uOqfwjYXcJNUGLDwL4bsfvgakAUHCY
         cgHPQtYVXKndvZlT4hUX8N0C0fCQRbd7uDaeqLtmee2CZdzoxWk4v+LAHYEzvRwsCdcJ
         v1UMa/8A0nf9EIlmsbaislJNCnh3nckLIamTTpg+oe+2K+95XxlQ9Rbd5KHJ9ormIoY8
         qRRLNiS4F01TrAP0qlidScckOOOkloGQk7xQQZl0kueXthvir9FSg6E9oTg/g/fY2kKY
         boyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085362; x=1747690162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szzST2rS84bZDMOoZWhP4HXje/44DCg2dZeaKbDsRF8=;
        b=WrJeiZsc3XVcqJDK3sl+lD0BZV4IsRPINkscyCvjiHKPgVbOTm2qGk9TmJyIoZkm15
         Lsl10I4Iau9VaYWQBs+8RqPSWGz5CaK3dKX+jRj8xft17vOT6Z/0HC6GA9ndNPiym0aj
         SMgSMN6HbjZ1PCCqTXop3sg4fmfWGwdnucNWVkatDkmWRDYDX6hyGp9P+aPKMmEA9Hdl
         C1bUisxTS0ExwIJEWWAjluNy/ynNOcoNsu9wzEfQnc0VQ2zotH03U0e1UzySjhU8Xq/D
         B4Io74yF8c1r1lHvhd8trJEvxaMx+FT53dr8XyUEEBb+N4mZN4Ha3NyZc6DwfYvZWl0U
         t9UA==
X-Forwarded-Encrypted: i=1; AJvYcCUOS1OVGEVr2jHvhLoVvy/JDAsPO0NOchvy0nXrZrE1couk48L6pcPGTKza3zfNOjpGQ6ErUwjFFH5d/g==@vger.kernel.org, AJvYcCUo34Py33qWGzGahVwXmUbMEs6xqyuaKvOKGdOp6QjjAbVbSsT9xOtc0fyFWOThmidEQy29sLMG21a0Y1k=@vger.kernel.org, AJvYcCWHwrW5fikVyVtenIViW/GGildeS04gca2qLTIfDu0xX08zx4jctDmIbGiKqBPPBPzEwB5jn8P9zdqZ@vger.kernel.org, AJvYcCXKp3oyHgYDXzOqv7R16h9+TPEULvROzWiHgkFmAjU1DP8bEx92M1W1KQgacP3B3qNJ5Q0CnPWjAWPxJMcj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz56ZNPc7nrsS7+1nxlIo3KCENcEpr+tgLkatDbD+8qkzkO6S6A
	b+T0lXp6wdqkbzrL3pnDcVUmoqykGYuKPInsIrfKSSiCKgmkQYUk
X-Gm-Gg: ASbGncuJX5HaEzY+l0Wu0Lk9FKb740yOeeZz/llmitLEbXMoOo0bhSSjPs0DUHhBgu2
	wEO3UDqZgNZGCpvnur8W6/JWUYndxjy6eu2+aH6l5/zWk7A5FaheGDskD7Fcfm9cPQzv0NCO0BH
	If64cZxj2dxYgCA1VPZxEN3BDQtwWUsyyaU2ZuPZ6n4KEwZ0h2HIqbehF1AkBhOHfLrR5Dq8XII
	5X9V/YnlAb3yytApC9uG0OEPkpSS7CbLON2xBKUqgjbtfeoSQR+2i37uUScDsFkhFs0f9Koidnp
	W48z0Hoh1a3XhCoAtgOpUIRzBeQKSIcwUDBR8q1G5rChGwXxrjcYAqq9vqJBwtk=
X-Google-Smtp-Source: AGHT+IE7dmBvMO5cOOE3urg5qMwIbc7AnYZ1lfFEOfBXmNO7HW+iI3VfDlJjIZrjIU5AhUfuiiplGw==
X-Received: by 2002:a17:907:1b05:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ad218e48fe4mr1549312566b.3.1747085361713;
        Mon, 12 May 2025 14:29:21 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:21 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 12/19] dt-bindings: media: i2c: max96714: add myself as maintainer
Date: Tue, 13 May 2025 00:28:21 +0300
Message-ID: <20250512212832.3674722-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analog Devices is taking responsability for the maintenance of the Maxim
GMSL2/3 devices.
Add myself to the maintainers list and to the device tree bindings.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 1 +
 MAINTAINERS                                                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..f53c72e5c572 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -8,6 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Maxim MAX96714 GMSL2 to CSI-2 Deserializer
 
 maintainers:
+  - Cosmin Tanislav <cosmin.tanislav@analog.com>
   - Julien Massot <julien.massot@collabora.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index abf3afc95fc9..84078626ed5a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14192,6 +14192,7 @@ F:	drivers/staging/media/max96712/max96712.c
 
 MAX96714 GMSL2 DESERIALIZER DRIVER
 M:	Julien Massot <julien.massot@collabora.com>
+M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
-- 
2.49.0


