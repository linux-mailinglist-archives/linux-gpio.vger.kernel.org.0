Return-Path: <linux-gpio+bounces-19986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DFFAB4640
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E745519E8306
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B45029B788;
	Mon, 12 May 2025 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdHsEnSX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96D129B773;
	Mon, 12 May 2025 21:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085356; cv=none; b=OMTWZMPdU+2KJycci3KqD3ZTg0cycstZU8Ths7Rc6mfvDNSl5o9rW9arpBE0pfFfnU8aineYZQzqykY35UFvnZDFcIUqvpdY6rtf3NgchcxS3Hz6x/T37YK0xjxE/POs2YI6jYOmz1aPk+KJVfcX33rqbZrY+7coSJIl9/5LCXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085356; c=relaxed/simple;
	bh=AI5HO+L98N+ked6mjPhmFqainzTC06f5MQRiYCifuC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anVw4kw4hteTWqgNe4IIAu/nTwtJouvofN7iYWL/l+qpqtAyQ6+ZEzWGRvIW+Cueu4A5XFk6+u4WMRU9lkMHdlHbWJMyFaUPtKsitl7UTSSyke/kckCi1fZM6/Tk3eLOTvm6apgdF0HDHvkWT111siliI+nnr46wExTsh5pDvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdHsEnSX; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbf534f8dbso7595176a12.3;
        Mon, 12 May 2025 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085353; x=1747690153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHff/oT7sQk2aOClrUOYHK15KjAUKpAGfLp7PK5vDVQ=;
        b=LdHsEnSX4xW4N060cpnAGHJyg3EqxPW0SdvWKkIi4k65USosoHxGUJhC43pZY7V6BH
         g2nLa48Olo3/+71IAbicPHe7Ky7B74O1zZ1o0KzMHsbU3Q5Q/Rs+Uol52TuIeTKcivdD
         EVbEuyTNleSlS8KK4a1TB6W46gLqI9EhCliZcvtgK6ebkYsWYwF6KNVp9MX/e+W49SWZ
         N4iws9lq3JvJ6WAyElzF/Wd/j5J9IzDAGsQoOynu4V+fqwtK2lSvwsbwelIwZuRPEq/d
         iFUqxzoaMh5ErVugCrLkwzHgqorprZaWW7GqCEoo9C20Bc4GieHIPXMwu9n07Ecv/vnV
         M4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085353; x=1747690153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHff/oT7sQk2aOClrUOYHK15KjAUKpAGfLp7PK5vDVQ=;
        b=Me6hgmMLLGPZzbmEEFz9esJWa2Si3je67CiyuCHVMTtQ+qHUTTc1934T3we614RjLY
         o/yqM5bOzBPbKC8mDL/EZqlhuM1Rin9sbS14ROtGKAAnfRN6YvY6HUablsQA8hRX0fSh
         NP5atoWJ8FvXLxkjjO3+icKaNagnoINvC17jKQgxT91FTFYj5n91Lsk6uuotJ826Zx//
         eL2rEZtseO4bWOhIGBzcU0NQ8IeY1hILGENQXmUM27/5eDY3wzrucSHSzC01fUSRTy79
         01A2MkA7dF57SLGTbmWd64/OAuAa5FPx9kQ6rR6hrEp6nx84cblEqKVaR4VPo82EPIpa
         PEPw==
X-Forwarded-Encrypted: i=1; AJvYcCU5u5eBbHq/1F1UJKbbl4O2muu6MWTGH3RVN/yW9ANQUVH/a+LvO8cA3F+jMD65JpVhzsSwvmH8J5I42zw=@vger.kernel.org, AJvYcCW2bGmLPlasJI19MsvMwZ9S1FL3WvJ9/VbQTfB391ykQAL8hz8QTqlBzDByteon1UfhuFJvRuvHo3h8TpGD@vger.kernel.org, AJvYcCW5j8Hi4ZyJxbDg149R5Qokhn6+aOyu37lSIe2K83YkMIwKGjbddIaa+V5iBcvhjBp7Zl3jIeUj+gHM0w==@vger.kernel.org, AJvYcCXGPWulHSENLqucLDVRywzgiahbxQzeFOelZl7CB1UZtUMMlsLo/XdunRVaQX0XYLVriB0WNzWA9nTp@vger.kernel.org
X-Gm-Message-State: AOJu0YzQM0ipcM9u6OkkwnkaUwD9OmEtGzwbdNR0op8tAazmcbfn/6WQ
	rjqN7WcQNLFP+PeJpIlvuAeBO7yxaiK0TttlRSu866F9qP3Zfdld
X-Gm-Gg: ASbGncsUt6gII8Gmiuft8s/8ghisjKTM5Djxkn4wflCt50bWcBdyzNoAuFsMx8qCa9P
	EUFlyzSTus/3hXVkG6XZv7mu1CCtf/2bGdbcEU4V2qgafvBWdDzzRheR9zTnczfyte2/kEm3STX
	KiGdqoZEqk7Jmd+xs5zGSJQf2VsMmY8tyIvOa8Ccv1E4VFrdxRHKI/7tyDOXWiDNiQDkyGp7DL1
	+Onxt59V/nscSmIjxdmUF992czgVxYt4Og9twOXOpKb+bWfqfGruBx+89yVB1lUQARUd24sSiS0
	5Je13aXy9AYz/dghvWJIsqoV1UgasAINkQWWm+y51pQYVpJUyK0GZ4fWJtjKxFc=
X-Google-Smtp-Source: AGHT+IEn/Ow2gvZ4FE7aKd+7Z9RkGF19BSAk0UsqyhXis2AK9rexBmvFZbe0MFYZuKP4CsSSd+al+A==
X-Received: by 2002:a17:907:6a13:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad218f072e0mr1388653166b.13.1747085352861;
        Mon, 12 May 2025 14:29:12 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:12 -0700 (PDT)
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
Subject: [PATCH v3 09/19] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Tue, 13 May 2025 00:28:18 +0300
Message-ID: <20250512212832.3674722-10-demonsingur@gmail.com>
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d..b345305acc4c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.49.0


