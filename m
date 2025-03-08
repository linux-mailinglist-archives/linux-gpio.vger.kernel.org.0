Return-Path: <linux-gpio+bounces-17295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27022A57CE9
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:36:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709193B1C3C
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D399C213222;
	Sat,  8 Mar 2025 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJ9S4yzH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3780211A33;
	Sat,  8 Mar 2025 18:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458890; cv=none; b=nnN0EYhHnFKxxTxppEah1uIEKr9v2RowW60j5PpVa6KVshjfx1QtLX3UE0TJObNNCy6Bh0xqCAHpKExX3vr/YC0v0R2YGaf1CkZ0V6Jizonz9AwD/lEhxQCElzsMKBihRwEM3FBrhd6UaR8+m8Pkta06BzQmuE6KOxWT0q1Kgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458890; c=relaxed/simple;
	bh=5BmJ708+8yLNhEiLFxS9ZrT1GPmVWS8r+iO9v8SdOuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKxWhc3G3fIG7NnpDfrGWrwnvMTyoxLXZ5bIyzjG1YWjPm8q/zw/QrIp85j4iH+D2m4BKKaIDza2hQqznbKO5hIQti+8Fgns6R69TPgj8rDnc4z+HQP7uJXoRDygZiFiqQ0BrBqPBVLtPLyeu8yWE21sbBNVhVUyqMjw/hoH8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJ9S4yzH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso4772665a12.3;
        Sat, 08 Mar 2025 10:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458887; x=1742063687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niTukLIvAiAEZdTX9VzP25J+OMwBy7xtkz5/2stDFtA=;
        b=lJ9S4yzHMJPmliNAAxnmqQegUhs9/pF8Em9gBiymNEwh6Zeg2v7QcEE45Afxni0gJG
         N/ZcvEQbZIfEB4Cz2EO7nhFuTg8qPVPGFy5voBPjtcGeSYcShqmG+ELH6X9qbmUuItwv
         e2rmG3zLocGRnQcOk5BdzZ/O1yH4fbqqKqKAoNnxSlOFr+f4sHplMc40xYmQNgzn6GVe
         0/VxkzrH2ltN+QgdD27rnDMtC+3cMRuJ8JkNeEM+N6JBRAycCs2EUnGZxNkLLrQa2+W6
         etkx2nDm9Qemtm1MSHEL4YQRm3AxVvAYZDLmyRl0+yM+cl6iF7cuy8GlGk3oew17i+Jr
         w1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458887; x=1742063687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niTukLIvAiAEZdTX9VzP25J+OMwBy7xtkz5/2stDFtA=;
        b=GDeuHYY25BLdeqyRUCMWSy0J2xPVGSDgVVsIGV1MnIKBihcoI6oPmMcX+CZF8SINfn
         KZhxKghkgX54IoA4b6ulV+uMu+/DBzz0/3uGVCkmTp+nDTE8PxQwW11bNsWCUZXxZ52e
         24lDOJuptQmZtwwl0IMMa9mnMrf5O9in2+rO1TEFpwLP5l3bwEedB7K6rVN0Z+MrhU/n
         0Xci9mi2aOj/VuR9UmYPLU4ASdEOkfT9Xfg0zXDC+YoYvX4DOe33B9bGA/81Zf6kxqNm
         Say2kAZ4tCpTv6Lgmxt2m/aKHlb+Fr+Op2U29UBs9dCRgUOutVr3z9HOIw+uz+JZmPNK
         blhg==
X-Forwarded-Encrypted: i=1; AJvYcCUTBghGCC7htYqK95vU2+CeVCpTWhPmPQEAtTwURz/0XkIjJ1CYeNWoRXNjoPlXoQfm1y5rJ2UUVtmhCQ==@vger.kernel.org, AJvYcCUcx8oh9jNS/wUpVavApDV5pq37eWkTb8GMM669YS5tWatkklj/ET/XPKQw1QmAHmS5F7Bc0n/g9MJj8RrM@vger.kernel.org, AJvYcCV4C2MVhKBNn9DoocW1pAefeGbLDppcfzRu9wjNqABO13e+G9ouDZCWcmq4TL8ZWXueeNfxxmzeE+n54K0=@vger.kernel.org, AJvYcCXBF6ycnZjKwFswJ8Mqz0ip7m7LikW+zfNzr0/Wll+zyf+Z0gxxICLqM2NZBCoOMm+bZJnRD5UXPffg@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHNSXjOqfO5Qnfvqwr5VOTCoHaZkl0vNtU6FImAYWYQIJH8pe
	Kf95uMVrAo3yUNAH2L2ykVUQuEvMqD6TPHzWe3QA/IAmz+eYalfI
X-Gm-Gg: ASbGnct/0cvQMRw5h1Rvkeuf+KW79e8F2cMInKQE+Alg7E9hdJtKjTIOMQWdcVMWiW9
	cdvPqZZw23QYImO3K4Xv14Qu3u3PO0wzexHNJzAf62V1AbZFXak5AHHVsPU/es8qccvlI26yHVJ
	1lmOIpRB50XihvNigfzJx2CBFIQHvGjpU4YOW7pkCngT55aWqCjArn4Dd/hJxcQkF/uLvHchKLQ
	uWInq0lltRJUPglALaqVJAIiv9HJp13gYk1HLG4GEan5xgIWwHzU+b30sgLVlkXPvB0cpgNv3YU
	n3JIILST6PX7kzf86+CCsJp9kAjGdrWgm76aRONFhvJjDJk4bJrM8N/eIg==
X-Google-Smtp-Source: AGHT+IEYfnZZSKKwlnhzVkFTovCEetnxmc3aAYiYEW+59CxQQ6vlMjKTl8zXdIYjCmymG9n4u7FXQg==
X-Received: by 2002:a17:906:f59c:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac252a9e5demr952699666b.15.1741458887103;
        Sat, 08 Mar 2025 10:34:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:46 -0800 (PST)
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
Subject: [RFC PATCH 05/24] dt-bindings: media: i2c: max96717: add support for MAX9295A
Date: Sat,  8 Mar 2025 20:33:34 +0200
Message-ID: <20250308183410.3013996-6-demonsingur@gmail.com>
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

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 20114c252e01..1e5b85167d0e 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -24,11 +24,14 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
+  MAX9295A only supports pixel mode.
 
 properties:
   compatible:
     oneOf:
+      - const: maxim,max9295a
       - const: maxim,max96717f
       - items:
           - enum:
-- 
2.48.1


