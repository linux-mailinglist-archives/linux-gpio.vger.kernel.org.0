Return-Path: <linux-gpio+bounces-17330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A3A5824F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46AF83AD88B
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2801C3C05;
	Sun,  9 Mar 2025 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rb+a8PKe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE91C2443;
	Sun,  9 Mar 2025 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510138; cv=none; b=T/FVTctk53imzKuvRpzYqwVLuq9FNi2xTZgP7n8hVOHSFHkLPcE0XfCUUMZJga6LL3sGKnmdh3NUYib1LKpcRsOz1dshp1Oj518+NIGCk0rYowCMZO5QefAJMYkpTQx1Y1Dh+PBN2HY5p+p1J1zHriDDwR+nGflc3SHz3zl0RwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510138; c=relaxed/simple;
	bh=PEXQRR5MIciIEUGd4xGFdf3IYjMGvIzyL0quXHDtWHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQ37vDZoss/iy7JyhPQ04EDWwBDVIBRmu0/T7HLJvPzV3Gl/qfLCr6g3KFsXKVKBQjDUtw+Myibap1w/VuFEXWyrXSAb5n2ebrLN3YYUMBXQ37i914S+etLpxdwjy7MFgCvJtnRzBmnie8cjtt07jqCDNbPGWVysHz/ItAntUig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rb+a8PKe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7430e27b2so569871266b.3;
        Sun, 09 Mar 2025 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510135; x=1742114935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7binUbZaUuDaOb3p2Eu7VlTLMfhBcoFyA3aW55N69bM=;
        b=Rb+a8PKezqr5AJ2pBnkhlXp3U6Bot5thODBpmtjOB1VLkOcN8wCoSl2YD/1JBW6YcK
         YbnqKlp2VyJVMDX8ZdvUNeC4MHuxdR5p/5MFo10FlASJU3Yhv9Ozp788OpAe6sgKoBLk
         2zZLEN2ITOly8cBQuvk2zxo8kwf5k9oihJlICkjQJa1bM3qJAE4lMgQW7cUbdU1FfriW
         20kN+qJSFiKnfDV8W5OPxuhmu0jbAayRj1TfHnlUiJ09GPP3uICH/LP8tIL5D1F+UFRe
         ftbR6SMnM4oFsJtZfWyhyAt1cxFLOYjUPAgIn0cjjsrsP5Equ0l0Wk0H7ixhnjTbO7rk
         n9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510135; x=1742114935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7binUbZaUuDaOb3p2Eu7VlTLMfhBcoFyA3aW55N69bM=;
        b=JU9eqQhlnx9COwXR8Kk/2SDVlesJhzPNwZXmZJXyFGL6qBl88rcy4M0Bbh5dVPG0mC
         ZI9H1VPYqC3fKuaF/rXVyWN3AVAqvZ8ke/gLoONeAHKDoqb6Y7Qj5I6rAc+f6MAl6NXG
         eDkDKeWVTak+9+xajmRcwJHGFGSksc4z//EhI1Tz4UoSy+whH6cLwt7tw8c8XiuBpGls
         CBFB7sXrBGkcK2CnXn39HSRFncEWlEU7GQvQF+xbzvdCNPNox7eIg2WbxxeEkcFMgzyh
         6JCO7n5m0utHgMKHgHTeG3V/ofkFYIGGAMPmCgl67lTnL7yLFmcbC/XAcXQW6Xqy5WnJ
         BjCw==
X-Forwarded-Encrypted: i=1; AJvYcCUBsFTDFCKfg8jIiJ1bNAq44D3Eu4nh4ACY6/CevJdmR9RWRoEYeNKQOgspTPYrELi38nTIAp8xRd1WPQ==@vger.kernel.org, AJvYcCVJDW4c9x31DWOdCEWNGHZrb72fLuiW2LSxnQAW8EpMl7HaDqBCq/h/rJ9EaegolEmz7eYK9/EYTv4TH6U=@vger.kernel.org, AJvYcCWD46dtz6z9HpZnOMeJOiyzQDtz1cPRS92CPOjylqzvi+6OearFZLGMNZQTaXlrF8LDjsrZ11k+7OPqWW0D@vger.kernel.org, AJvYcCWmqtPIWWQl+4WOLJRv2bjL7YnWlqYbQE9DU7oPhVakbq2tg7MmjR5k3CGHWuFptD5NvxeNcxqF0i+3@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCLKVtvLbPXimsc9H+94C+hgZjRMyXMtRuV+RNMqkvoXNgURq
	yt26Y5GdppBYeS9Sq3/1jpzKVMwdbudEMcyZTezlRx7OPAg/UR6q
X-Gm-Gg: ASbGncvCgR30PjUwI/xqto6A5yWIoPyScBpF013M43GcsYi6gWUDVKfpoamr528gxzG
	hUkieMySxKx5cDKwq8cifr3f/77U/sYTctxVicQ6RIDUVytiljsVDeC6osf7+Y19gGCuBHucBb7
	RT8TTBSSP1dW7VFCgdYK3hBEUTEE0kgdII6an/IIqqFQTTsP3uCcvjdV7TsO/Sw/N42ai5Uq//w
	olKT65bnziC8ilgIciOKSxwmjUkl6eZ5rzTvBdoJg6moS8EtNPbvLamsnoLLj877b/Jng93p8JK
	kG4epOYfyySN4JhI08c2x3WKcSSxYB+70UKpVrtqtzZ10BXdes9DfLaRdw==
X-Google-Smtp-Source: AGHT+IHmESnp20S37aW3Ui2usQAvY/2Y8u4CD0NZ6eDoOr+o1EaAHluADrNw5wzWwlijBh6ABetEoQ==
X-Received: by 2002:a17:906:6a29:b0:abf:40ac:4395 with SMTP id a640c23a62f3a-ac252bb26b7mr1238784266b.31.1741510135400;
        Sun, 09 Mar 2025 00:48:55 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:54 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Taniya Das <quic_tdas@quicinc.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH v2 10/16] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Sun,  9 Mar 2025 10:48:02 +0200
Message-ID: <20250309084814.3114794-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309084814.3114794-1-demonsingur@gmail.com>
References: <20250309084814.3114794-1-demonsingur@gmail.com>
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
index 9e27568e0105..a497c7af645e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -85,6 +85,10 @@ properties:
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
2.48.1


