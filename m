Return-Path: <linux-gpio+bounces-17296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC2A57CED
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54F1116E2F9
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5D6213E6C;
	Sat,  8 Mar 2025 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atDeo4A0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D462135DC;
	Sat,  8 Mar 2025 18:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458894; cv=none; b=u1IKxs7b/86MUykHN6iu5pqX/4poP1cHwbotCj18ZtBX/53Eux8RxyxNHVDqhC1MxrOEK2sHRY9cdAQM04IfFuhIwioaW/nB8Jm5zIyG2pz4pd2ZNyOZiLbKiYvPjbSUtbQ5kKkR+YTGb3P7qod9UWhziTKmJvmakGvFagXdu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458894; c=relaxed/simple;
	bh=BXlA8lciQJfJQ9PsocdwlLiXf5zbL4riTB1hSsRUQWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jbkvl92imW3Z1El+xIV4rJoqam7Eh4PdXy1Txegxn+yA2RM/Wf2yoo5klpURLVhE4csuGXwWI1VtSAJitKYLsItxia4hcBuDI8wxIrcnQw+y9tuDmM4TLHUUoaWbC9QvhBMioQ+2Kgy5VIJ32kb74ZWvzUI+R7YsKFdpvTVYF2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atDeo4A0; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso1217572a12.2;
        Sat, 08 Mar 2025 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458891; x=1742063691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaoNQqy4aLD9/xA6TRYAtkr7klI/0e6BppeUXZTiyUI=;
        b=atDeo4A0HxyXZHKpHLg5e2XDzONAz6CUU/6/fME4exeC71sOAgYqMZPTNO6EIzdAFt
         dG7afYS6k+sdApdX0ZBdSz6Enuee8ZRGKYSdhsAxnOi623xEGfkEQrI1k7T4TCiIL+8+
         /AyJRigh0ShVdJThfz6lPf8P9JqUo32bOf6ccb94knlk5vauXWBFk8H/uok6OnHd3Wth
         mtZRhYdbePVOBxYfhgP9KXUUi8GHvb1GusbzUEYfrzlbrOfEeXRPlk9IQm0SpIJkmLNb
         9Jywm4imYUZN+ikltJD8oLWan6HDoq6gEfjACRUd+oKhkS7Kabp0iZFZKB52lZFUNl4f
         OkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458891; x=1742063691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaoNQqy4aLD9/xA6TRYAtkr7klI/0e6BppeUXZTiyUI=;
        b=Q48hUf/6ISfZ4ab2IJ6YfiB/1NWCNe8CGBi0po+8n8Y76lv+ZtIltFQgdR5rI00Jrv
         9JBA8CzIsnFN/OvO7gk8usXmzjWi6dTXN3DLcKQUWIvTEtFgaYTuQqcWVlvNPMti2IS+
         wcsC2D7yCuCt6D1QOsX86WaMtJkK5Z/ynhEheO/MuFFIydCaEOxyEtlo6dwZoudOvWzV
         NLzIlVC61BvcBDtv6y2dkNviv23MJaWveWq8m0GwlNZgLZrGUNOuaYCQMNTZ2kilJ0/T
         6bEao0Qr1SsJILy83UJhf/wB+3HqGqxNT6xCmYZR+iTbfGOeoAzuA4gvHEmWZMd7kKws
         yh3A==
X-Forwarded-Encrypted: i=1; AJvYcCUX4lldk9q9ZIYDAPMnSezusHaOJ7xXh/EaTfOuA5Y2HSWNlTk27x+aF4C/z65hd7AnIfqr+Llppl6ApVU=@vger.kernel.org, AJvYcCVDJ+synmjL8tsLVWfcV8ZOE5p7WfQPXCEvbCoLpXM8y5OynXZB3ItDZYJRsrK+vH0sCMvhGmLcgBIiqvO+@vger.kernel.org, AJvYcCWsv4Hikui5yLSPruk+igLSNtJohGZuxuYekvP3n2QZ3DeIAaQvI+iRglmGPY/75IZdU87CsDdYS6CuYQ==@vger.kernel.org, AJvYcCWx8woJ/pc7Sp26EojY56WVQo7zgun9n+FF+EffaGrAP2KDJUR9K0x5c9SnOzLpzRid92l3v0ohD1Zu@vger.kernel.org
X-Gm-Message-State: AOJu0YyBZQ3qbzNetjUu2k858Q4UO/iRBqkSwlwdQClKt8lIMN1BKPbf
	2RAyS78H924oBXrKYoFENxdwf3mRv98rI++SKFNNMG0hXfvp8Pu4
X-Gm-Gg: ASbGncvW+67myI554MQzrweB+wD/s0kuau2ORZPEJfMcEbcmlGZT4jYEaR3njJ90CVl
	zKnAgIRRdAtSUo1T5UUGFQiGrsTjNCdhmEcNK5QgpCgZGSut92qfR80Q6Xz9EbTL4+yNa/lOxFZ
	XxTUaWPO4WHzqAiY6W6yiG9OeTwbjEi7hD++yM1Y/NXAnDQSRiu8FLecwlKF8yb08BRSWxbMT8r
	gH+ugNdaVgeNUBQL6m1WF6mpk5b5egSU9VXqCu+LTKihARUTN2ONau4hYSNZPdzJST82/zsUT4f
	nLhrH4Dr89NObny9t6A3Sdj8kSwjQS9pH45u7Jgv6s4gLrN5S3+7JQS7QA==
X-Google-Smtp-Source: AGHT+IFezFam6alDx90TUfBdNmoublXmOdXfqhoT08gBkDkGLkO7nMPBmg+CdG3FyRvs8OOwhJtfsw==
X-Received: by 2002:a17:907:7ba4:b0:abc:c34:4130 with SMTP id a640c23a62f3a-ac2525f958amr896455566b.18.1741458891246;
        Sat, 08 Mar 2025 10:34:51 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:50 -0800 (PST)
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
Subject: [RFC PATCH 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Sat,  8 Mar 2025 20:33:35 +0200
Message-ID: <20250308183410.3013996-7-demonsingur@gmail.com>
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 1e5b85167d0e..2d7440049318 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -27,6 +27,7 @@ description:
 
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9295A only supports pixel mode.
+  MAX96793 also supports GMSL3 mode.
 
 properties:
   compatible:
@@ -36,6 +37,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.48.1


