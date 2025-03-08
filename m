Return-Path: <linux-gpio+bounces-17309-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286CA57D27
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1BB33B3587
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B448219E93;
	Sat,  8 Mar 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8XRsgKM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C098219308;
	Sat,  8 Mar 2025 18:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458954; cv=none; b=OEYCQ7jSWuLTl1qojBYxqpowoO/8Tby2dbe4xoLnRridqShBxmZZ1D8PbN60+7gbHsHHlKunH8ZAqrrFjhGLmXUdck6mQQVpswBrJUOV5BPZES/7KxYUIXia12obY/tlI4SQXg/2DHFeRI7Xye+UBPJoQN8My18BUdHEOlHq+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458954; c=relaxed/simple;
	bh=FznTDNtKWojR9Ye+Jrb2h3xMj/oOzdqTZQIRY2kpr2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttpLbixeAdRRG7EdYR3m6sqcX3NkcdXJPN0UfKgtzXRcrgii7D3f34UsfCQTVESV5EhRbFhIGd7ze1C3OS7UjrERxTYXzzcgURKwmdqzhmKoTNlkAIdstd7wPEPxxhR6YPaPeKgkUCLbNaDg6l8dtoBr4NchPAxSBZ3pRKAlpa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8XRsgKM; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so5411461a12.1;
        Sat, 08 Mar 2025 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458951; x=1742063751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xre/RsxIANW+aBbofEjpmFCtWlH5fWozQWnveyUbcrg=;
        b=J8XRsgKMOHu2TBg4z5a0qtt2Vd45kaocrsCnDkXfs14wJDtgrLQ2RVLBFeCzuJMnJE
         0+ptHgTsMg5qJmqtU+DU97wssHQzGIjqxBwixRmzgkkhq89CO6HbidUGjh4Pk58vWdBL
         jE+AIwvfCTV8rZT8z3v9/IG2+3TMrfiCV9HrTNWpaD1Tr/MmZdoFCrSHAzCbg9BwdyXt
         36lNC1TTsy7Kyk9U5unuip1XZlLM5MI7So+S76F4kjhT3voKmxJafv1cx72sZhMvZ85T
         bjo/p9c681OtTysE+YG6S97A70HNVA7Drb7Qk9QV/EdfbMCCAsaMK7jBZFU//99QOATP
         2ObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458951; x=1742063751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xre/RsxIANW+aBbofEjpmFCtWlH5fWozQWnveyUbcrg=;
        b=tHVpQsmEzCnREU7cpz2tB9ngPSQb/W/E7Kj10TpcyG6e4QU4kXMNvLkkaqH1HwKtva
         ORG3zqNqeDPfgzo7azoJA8LWZOC+cpJ7GnoPMCMM3o5X90k8DmaBgDm9kKt8BaDxqowb
         ZrhBJAOe42ZZivz/wtA5mVFcA+z/6nhoIUEH3pMadepzr2RJncFvRA/79DlJqY9ONrof
         haQDmliC6q6yAyjkwmZu+muoBzSY7odINs3RQyN5cNJRVkWknIO86oJ5XuKJB9R4tn9j
         dlf3V+shTE/p+I0AXqKVfowkG8b++NFZMZv0yN0Bc2WP5siIAd2dtFAJSGthD5vPhZVH
         WaoA==
X-Forwarded-Encrypted: i=1; AJvYcCU/zt10ENGanLOBQplZ8GemsI95KdgHY4Byru+ESNrkPcvf2xTC5LRY0zmeIO2EEJq+H9NeEvV/DhrMZe0=@vger.kernel.org, AJvYcCUfdoDbZqx9ha12cEcVQRqak8be5DTFlZStMV8IgWAVxwX1Y0OV9cZY7ItTg6jttsTrvsBjTvDDtM+oaA==@vger.kernel.org, AJvYcCVonjNrv899RzAoUv9JjxeRVoVbJCw8SQAfGX1V+Wosawyj3KjiK+OLeaFix430s1Rj6AxIYfGvuLRH@vger.kernel.org, AJvYcCXg2pNf9+7g3OwzwmbDhCRXGQmsyQFQeL+EpjrZ87lyTwzA6MFSVTHQcZIfEASKj76IsHmpKi9U1u2xUlTe@vger.kernel.org
X-Gm-Message-State: AOJu0YyNRaOvqRFLSLwNo7rrPTUnozCBv0iRVNHQ27x3PGnZUTFTlIYw
	Aj4z8+Gl7G+OhLz+Sd/8X313SYf6GkBOhrVknzP87U0mFjEUC4HW
X-Gm-Gg: ASbGncs8k7gOe6YaNdVvd7MTQ1bmustJfwuUKAWBH7nfJkw7ya8ZHR1JuhQE0pUBAza
	nEQVilCZ/slJZEWF4ZzBmhyzUN2Rdt3E3/Ycyy1f4Jcd91ntSt23ituZx8YmmaC1FmBkGlGDBQ3
	r23rAb8Z7ChNKCtQv+wn4sC7txgaFgsAKSqRmQXyZtup5FHeCfqx1WvXoRPWD9qriVOFshkMleG
	kQAqNSolNUPOmaNp4uCUlTA0NBcB4s/5Q92LbEvcDhlxd+pL2LNtw7U3WQW6OtyXf00ct6tWzfb
	jCNgQsuYvgDkKhTXTEMdHaX1V8snyD4TCmvlT1i5UorK6txXhEfUHqWvHQ==
X-Google-Smtp-Source: AGHT+IE7HcMcv8UGE2u8zJcS8GFDxgYSucRdRKjubTzY1De4Hv/qmaFr8IpaN1Nvc57DsiT+CQcqYA==
X-Received: by 2002:a17:907:94d4:b0:ac1:df33:25b9 with SMTP id a640c23a62f3a-ac252ba291fmr945250566b.40.1741458950505;
        Sat, 08 Mar 2025 10:35:50 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:50 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
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
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 19/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Sat,  8 Mar 2025 20:33:48 +0200
Message-ID: <20250308183410.3013996-20-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
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
index 4c4542d041cd..1680d99b1f36 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -87,6 +87,10 @@ properties:
       - required:
           - port@7
 
+patternProperties:
+  port[0-3]-poc-supply:
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.48.1


