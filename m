Return-Path: <linux-gpio+bounces-17322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA9A5822F
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 09:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4CDB16B177
	for <lists+linux-gpio@lfdr.de>; Sun,  9 Mar 2025 08:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4E31A3177;
	Sun,  9 Mar 2025 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1gmk7Rp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D630119DF52;
	Sun,  9 Mar 2025 08:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510113; cv=none; b=eHyxv4HVWSGOrdbh9DwlveIGG4lxYklpvuTCw+bZYicvJAan49A6MAg6rwjlGAqczq6e7uJso03iCSNrN0AftnS4/+ZOIPhlyxjob7tnRC4oaju8IXMAT04dxdLafNUXmfk4J2reSfaoJfEkfmCVxg6G2z9U2fX/AjoL4VWkD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510113; c=relaxed/simple;
	bh=AbuPWLIU45qyQVYNe0RinxFUH4fVcFJyxnkCgDaB8A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unYL94TRxafCSOCShYO9+COU0AHwnJ6fyuz8GM0+QIfYEgKTsMqpyOAwVz4Z7k9kBlvUGuSy02Q3oQUpnFmjYeS0S8HtlXp+WDJygtYoU0TbkVZV1kFXACYAsQUeR9aecOEMm9pghlR/ZimL03bmqLipi2VnDBlAG4Rm5JwMcoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1gmk7Rp; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abf615d5f31so630106066b.2;
        Sun, 09 Mar 2025 00:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741510110; x=1742114910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=H1gmk7RpHYEDU77TW6Io0wbqRGZX41eDGrD6l4SjavfXjFBIWbcw+tTtoqQ0ud+lRX
         FowPu0hB29/HYZb5icBQE6V0wNJW8Gb9VNSINpfrWg3qIKp49vvN3s50opOy3FFa60Hj
         3Qw29+lENrcg44ut64+MUP3+HhhmE7HJvnuxqtZY3PrlJEiyPvUtjoPGph8dzvjMVTHv
         eF3jU1rYhyLigJKqMjIt/1UcSgXRg9NbuaCgqSSiYeJk1T2eqBlrNsZxLhuCly5dmR/H
         In1tlRwM+U1Yn7Jvxeymr9r0fL4fcIdTOx6ufcRwhG9FU9Mw9qqrPwaeQevO9l3QwQut
         bcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741510110; x=1742114910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkDL/nUvpfh1eHpxumsRvR86QwXqar6N/bhFMrxJa6g=;
        b=vY/So/SMRRCgc9zEv3xWBruM+5Qxoopg9krwfhXPt5VDmXdgmYg+4LN9KQ/Fb5GEAb
         gFt7SZNgkekqnAKVo/mXavonPY0FynA69pY7o94JmCULIb+eeqrDcGAtwIn5X5bK91Sg
         8QuszP3nCT56yKnLtXOCpCHorVS0vd43m/eQz25psM9XPFIeuuPTS+kU1nlGcboQZewF
         weoCnOryAsAFs17n3NjY9nhYqNHQgWmC/irCgxKIv5d5l3BDleJxeuoneJXEvijmwhUf
         w/a1BoZ9niUFWM7FL2CwIM7sukBUkG5bucgoTv+otxgIlVsOtsecDFf2R/BsvAAfPkgP
         1Pyg==
X-Forwarded-Encrypted: i=1; AJvYcCUdcQUwxggvfGOuKqOsNru8I+iCXwAyP6JgwOdJ4dKjA55hmol1b+LVqL/yfgnh1Oki2tTWegZoLOcaWhJq@vger.kernel.org, AJvYcCUheU/fPeVjID0v489lUTotxYtjF2p3GbL3CZ4VJ3U6zZ/HWPLxWdgA0cLdEZzyLXRmHmKyr8+OH6Tl2nE=@vger.kernel.org, AJvYcCUmbIID3iEoXtenxBId5JWBcyWcLn5+ajsKHqgIalgQQYm5lSVqOqCE7Kl86xWXlFI9S5/XLC9mytQR@vger.kernel.org, AJvYcCWxeAWTUX1cCdzurUwRr9NJjQqhBhZOUuvorNaEoWcVkaT9x7IxzMwivq2TNJpW2bMGSWyq9b86hBNbTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdlByD6X8GZGp4VPfW57AM8wAOY7j8ZEuE8TGWaK+D1AZqK9op
	bIWtc34f7stmomrW9oCTjsCf3xDaI/XdmYwysYdgVUDUYTiJfu9i
X-Gm-Gg: ASbGnctItwafQO35CHacPILxRJaEKcyLhi/mqD3jwat/11Fn8jRrXBFuA7jYDK4ybp0
	OL67z4EIOYSP+jTRiAggN21M9EH7Xgh10hmZEwk5jXNmFFs/pPpDegtu0bmYKajVjzAZ97Y+79Z
	pwTHDgogdRtoZqu8ruFjfocMgBoa2il84aVl+tl+OmImsdwjPT6I3geK0zVwsEwSYxrDXNzGlae
	PvDeQ8LFzfUJ1tVqLGdfSElbm7bQyCV/3OZvzqtkpxPF7y4c4M53R4wEwvvHcnlNfN+q8bbyRNL
	XlvCZ2iv/iz0AEWkLxPjPlOMgQjRzxe7poJ/BjwSIM0jRT+AbVmVoblByQ==
X-Google-Smtp-Source: AGHT+IEfjqH7txw3ZNGvVC8ODURGsipO9FHidgAsOnuk5C0y4Kr3jGdwpFvRT4Ar0+alm3pK0kJ5Aw==
X-Received: by 2002:a17:907:6e8e:b0:ab7:1012:3ccb with SMTP id a640c23a62f3a-ac252628ecamr1038989766b.14.1741510110006;
        Sun, 09 Mar 2025 00:48:30 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239736153sm566347466b.108.2025.03.09.00.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 00:48:29 -0800 (PST)
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
Subject: [RFC PATCH v2 02/16] dt-bindings: media: i2c: max96717: reflow text
Date: Sun,  9 Mar 2025 10:47:54 +0200
Message-ID: <20250309084814.3114794-3-demonsingur@gmail.com>
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

This text is using weird line lengths. Fix it.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96717.yaml    | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 15ab37702a92..1026678a17a7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -12,16 +12,15 @@ maintainers:
   - Cosmin Tanislav <cosmin.tanislav@analog.com>
 
 description:
-  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input
-  into GMSL2 serial outputs. The device allows the GMSL2 link to
-  simultaneously transmit bidirectional control-channel data while forward
-  video transmissions are in progress. The MAX96717 can connect to one
-  remotely located deserializer using industry-standard coax or STP
-  interconnects. The device cans operate in pixel or tunnel mode. In pixel mode
-  the MAX96717 can select the MIPI datatype, while the tunnel mode forward all the MIPI
-  data received by the serializer.
-  The MAX96717 supports Reference Over Reverse (channel),
-  to generate a clock output for the sensor from the GMSL reverse channel.
+  The MAX96717 serializer converts MIPI CSI-2 D-PHY formatted input into GMSL2
+  serial outputs. The device allows the GMSL2 link to simultaneously transmit
+  bidirectional control-channel data while forward video transmissions are in
+  progress. The MAX96717 can connect to one remotely located deserializer using
+  industry-standard coax or STP interconnects. The device cans operate in pixel
+  or tunnel mode. In pixel mode the MAX96717 can select the MIPI datatype, while
+  the tunnel mode forward all the MIPI data received by the serializer.
+  The MAX96717 supports Reference Over Reverse (channel), to generate a clock
+  output for the sensor from the GMSL reverse channel.
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-- 
2.48.1


