Return-Path: <linux-gpio+bounces-17310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 752C4A57D22
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A329C165CAC
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7192621A95D;
	Sat,  8 Mar 2025 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsEi+0hk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B3620E702;
	Sat,  8 Mar 2025 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458962; cv=none; b=KwMNoMBUT7OPY9L5fnvdmHn2L1ZD98D+pATlZO/wt68nSnpbKeeD0Y22zur9BnTwAlIWVdLgHzT9z24S6hjYzSrN3P6dZIUSlsu2DGFNGHukDYFJ0c+1TweWbRHxtK8E8s35co7ELfngLAz9Mj2JMsxlnk6IQu9fI8zGKCd1j/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458962; c=relaxed/simple;
	bh=9o7dWxkAzzvkB2Imojs5J6AXrsEiMQLNW5n5ACM0GTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5JC6IkZIKhaVpruFmLxmsbzy3umHmjhtlzWHFwFFimpBIlfL9ULIu2Ik8Mi6iaoNY4cEoJruOy+jPEyAYn5ovDC88w69MkQIGY8x/P/g3c12/wEcrN00rTxFD2XQ5OFK1umuin2rqcM9RU1p7/+KzF6cv3ewg9Ee0C6ZENzinc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsEi+0hk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abf6f3b836aso455585366b.3;
        Sat, 08 Mar 2025 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458959; x=1742063759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=AsEi+0hku9sFE8k4miOVyiije1QBXYEo0XLRdMmveKXNdi3dVPOSykwQV89lcRzI8G
         KOWLzZvEF/78DlYHi8vlnL2lFAAHxSu6qmNlA/smQZeLFeNoct4BT54TbCZc3iknc9bk
         Ylq5yIbz837v7h3+FFjGgiLuKXnnj3sQUhVBuNiH0oOCIJ0rT/JZJwhPC6AGhsAw0kfR
         o5Is5FFIMZCvo2jq96EuWFdSbuzNU6ykzhnOwVokpY/607zDHkbqA0UVK1sUTfxgU1Fq
         hEGQ4qowTvbp9SZgiRo1eTt5aDWasxibdBiYPuzGoYskWqck4E+AQ20z9pIZEtjV7fmu
         3C/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458959; x=1742063759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dW4CzmrzcxsS+VFvHNn6mQCAsXdBank+JJs+zbf7Qs=;
        b=ftt4G67WxMGmeiLCIXd1FseJdVO23E6xUfDPAafYvR0YhLvJLDovozdUfxUsMk/KxN
         YkB2/fwB5JME/V73l1u+Eft9swcrToQS1vw8E4iLOwyv/mAtmlmB3gna8PudVtuRh0RX
         UlkgsYA2sb1uInGb3V01PoTaTTzdPhWYFK6emUPSNQE9ta4w2OfVkKxS/Dcb5MeKcSlQ
         N+/R4sijqAvE/O4WXoe2y43G/zXOCGnKnrb7vSipN4qohYx3OIe6fMXHIURqNR+M1yOV
         qcwCvG7PpQf24HDedXePoYznmh6AxmGQv913RvKcGlf/3mJJpl9ayLTVRsiP8UpwwumP
         Ir0g==
X-Forwarded-Encrypted: i=1; AJvYcCU4rR5a4mncfvXdP5ebkjRoiQQ6UVWJARNFZHf2BriGvDsDceVEczCYaY6dFgKACOCaINjdjJj7Euwzxg==@vger.kernel.org, AJvYcCUs3VAlRp6k9fQagAvoDemor+HqPUJFp2YjDy8NeI8r8UKak/ZS3+G9EhfItkWR+1d4zxmG1lduq0RktUGW@vger.kernel.org, AJvYcCW9YVmwHL8vOOD5zO61pnAjycXJUcstaZI7ytESBe6FFmotYiNilb66sS1DEWmYdBuIEhirRNp/VCjYAxA=@vger.kernel.org, AJvYcCWnxZaVdiLgj0GcpjaG6cYIZCIqZPf9joAUJVW5j87kS7+0lNsoWdd4YKgN3bv0GDSTxRdzLeWIQGhD@vger.kernel.org
X-Gm-Message-State: AOJu0YxnUEsubTSJzev2wT/UgmBuhcX42EE9EMCZdncyawK2xW5A0kLY
	f11iM482nFaKIhg4ijLbaMMg6dfgPYOJlCHaKcxJcsFKIZRg47HX
X-Gm-Gg: ASbGnctNhFuQj/K6/pTnQ7uYnSNqai1QrYmM+ja9QKzxMdtdy12aYy8Qhk2HKoVX2Op
	ieS77nhD+4vIup9bFIw4gxDnIpUwNN1uWgOZq77NRiqKRosFTc5YGGQ7ic605TjJDXBs8zmeANz
	GjTyPZnmdAMtKseKQvhaDZ2huy+TcRoLxfY+s3nLhoS20UEhCrK0BTY2JtbWHskr3o1HXlGf2Ys
	fFlVsGCgahIi5PPYEJifa1MFvxqXExrTbgy1nKBoLhJ1xy+9lreXDe+Cv1O4ZW76oA52mJkSwJ0
	LOT8+XUvIEo0ZsW895m5CLET500y9wDnsVUmv9E5Sc9kzk2mqnRwgkG9Zg==
X-Google-Smtp-Source: AGHT+IFeTY6f+Z5x+qQcdIB8S71nVbnmrDN479LQd6qexMksrmnIptmPnmurHuelrlJDcIOha3YkMA==
X-Received: by 2002:a17:907:2cc4:b0:abf:5fe7:40db with SMTP id a640c23a62f3a-ac252b5a1fdmr879505766b.31.1741458958420;
        Sat, 08 Mar 2025 10:35:58 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:58 -0800 (PST)
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
Subject: [RFC PATCH 21/24] arm64: defconfig: disable deprecated MAX96712 driver
Date: Sat,  8 Mar 2025 20:33:50 +0200
Message-ID: <20250308183410.3013996-22-demonsingur@gmail.com>
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..6e9bd9072d11 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1272,7 +1272,6 @@ CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.48.1


