Return-Path: <linux-gpio+bounces-23376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B49B07DD0
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 21:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACDCE7B04E6
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 19:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44172E2668;
	Wed, 16 Jul 2025 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU77YN2Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A52E1753;
	Wed, 16 Jul 2025 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752694309; cv=none; b=QhYZ04MWT19phsO7iqdUWhOafjirINqPh0K1adeS+35TilRmq2Dh7I+fnQNiMrtz3bCyykjQs+OLOJQVk5aAwvQ8cmuAjL6oEn+NP9zkxkpuCCi2nFFLSKjmA2wfHsK2ic+YmRVEd3RRLjnl3uqPKYaSHLpKz+x/Rt+ckvzFbLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752694309; c=relaxed/simple;
	bh=P//8vOwQWbcKu1kVR/H3otGF8zqkQSkNHGIA2UNKsxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RGDZOHwiEgHQiSg5QRs73+HfKJeE17dUei1+Twg7PQ/m0bNmPJdUWcZ/WVweMdCve/7BJV5j6kyojVmHhuZC2P3dins7Mx2CEw4y/WZYaZrFgzp1maaFOAsvt4YPKBaBRi3y7lLn0d8mIHJALeDfJ0bk4RhdyDVpHNGmtPbokmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU77YN2Q; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-612a338aed8so311620a12.1;
        Wed, 16 Jul 2025 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694306; x=1753299106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=TU77YN2QSYialMIz2hl5oOzmNlC6ZJTgsqsk5s7Vq5HtKXFNAmXrIsN6NpNKrDa+Iq
         dWzFT3Qlb6ndCkyvZYMMpHxN7Ax21mMJT6x194LPUYjHsxBnBe2vfDOhP60omwB6XR+5
         VcRBcUIm0XCRpVnvDO5jsPXQruLJCX+HjwadUj9BxVeRNCnJW+QTDw5630lK752exjfx
         EOobmOPOw02EWXQGWgp8gdoVU51q+Kk6E/Yxvt3SyGdo+rtvrxKihGPA/QgUfE+LBe5J
         9dIDxr5CIfSP4hf20wqNgsKGdxUQvdsVjVOUiEpNzBsEt0/xFJdq7Wqkk2HBKFsFbRNe
         yErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694306; x=1753299106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdBDnL7BrH+Qd3yEtV/VsVDERkiLaY1kbfNQ5MlWHRY=;
        b=S1N8iW6jVIm2utQimjCWjXqRh6+K/zHaBfgC8L0ZKSFPssFLv5+KKaVRj29eKalG46
         eJPmhTwiIW1Vjyld4OR9duzP1E6wRxvoPYo3wuIHHXIVBtDA2IXgGyb2cYoUMR81ggH/
         UFplEwxgbGxDocj2hdf2f2PdoenKk9He6Zkgl/qBF0rHTQJqFQvlfN7m8kIbuduZXIMx
         5lhM3XB9DRoA+OLvU3gdcQ35wniK5UVxLz1jXZUWRHd99IQakCABsnKSxu13+vXoWtGk
         iGgqOQIvUD1vfSCvP3LvkU6rLtFYyh4/fnxN8yi5+L3XGqggTF/lS9Sp8TF7am3e9rb2
         STow==
X-Forwarded-Encrypted: i=1; AJvYcCUMyv8MoLhNhJTDI2ksWi9A1RoICW0zPjn4721LaQZ7KwO9N9ie1mTZO0ApfkpzjIsKeSTM5xwELEwUnA==@vger.kernel.org, AJvYcCUdS8vgpZBhae/vWYD37PoB/5LMTQqONfrRp/2cUXfL8zSCw5rMDYrrN/WEs2wbcuRTzCFJPF73XTH0ls8y@vger.kernel.org, AJvYcCVp9lAyLvIaFEKjbwJ1cFwKjTitF4Ev1A/cSATPgquHK+wKXc4o5f6lxJ1PbyJktojaszej7LUX8t5t@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3u2nt+CgToJeOGjW8zXr+FIh+ivSjU0HFW2lkxiKK0cNmSF7K
	LhJLrNRGMA+ea3caF2pf8P+3NX+HthAMeF2Kl39rMYoo58SfGCanTJUs
X-Gm-Gg: ASbGncs2QYQxZWmw7NLepCVJj8Omj7toopbjvcb9Jc171N2r+ZHu4bLcN2a0oHM4GLq
	jvCJ63nAr0SvTbqwJAlQxgy9kfK/qcpYoyS5n1PUbFcsH4ijt8mEQofGDwKQTcMni/+aNUJt1iS
	Wqu7bfVxQvcny8oxQD04t9S9bhv+sUAK83+iY52VFpksMeJHVsGy9N9S3zDjr1j+rwhhIRn3JYi
	AZyNqxfRy+EPUbGGLy0tuOw1L26fkalGDzztC7wSmcHTcoLLOMTRvkGq6QQY6Uq5BfsFYqeYFOP
	G1fcK4u9Cn9niMt0lWUPHFXdDXzBjlvfxc3MKETUsjxMmdDwtznlY9/b8QhRNC+5iIKgFf6rIHG
	svHkJtpA+po2nSmM2YaIq/PHv7Ac78ZCSOoo=
X-Google-Smtp-Source: AGHT+IFaK/OXpvsJKvME49U7HD+Bha/pUwWnsP3IoA6+d5T4dj66SFhtOG3KA8dw/D4IcnhUOjtIwg==
X-Received: by 2002:a17:907:60cf:b0:ae6:dfa0:ec12 with SMTP id a640c23a62f3a-ae9ce0f930emr389145166b.41.1752694305979;
        Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 11/24] dt-bindings: media: i2c: max96712: add support for MAX96724F/R
Date: Wed, 16 Jul 2025 22:30:56 +0300
Message-ID: <20250716193111.942217-12-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index b345305acc4c3..5dcafd46344cc 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -24,12 +24,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address
-- 
2.50.1


