Return-Path: <linux-gpio+bounces-17304-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F02A57D0A
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47A416C301
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF138216612;
	Sat,  8 Mar 2025 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPSAfbsM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB72163B7;
	Sat,  8 Mar 2025 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458924; cv=none; b=TRKfY/hmMNVs+Dk/3Rqu4qe5xf2rxD4q5O95L7sFdhWU/PjFhaRBPsjS1fS+YuxSj2Z8ihkkj34prnAN4Y7M6aiUtok5AgiPO5Q7OobfnLsZfz6/ZE4iUosY9ARgqJFxhaMDN021gie4QKmjg8+/OugeCsjsAgLAMuzZsJrGlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458924; c=relaxed/simple;
	bh=ECI+YYqiSDocPmZgoGfiqNbqVHbdsHypglZK4S7zrnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDev2QXUwWdprAJZbzE7jv7DI/LwM3yaOj3HYM5kUVCIRlAgo0QFZGxjBv2FsW+bcHqFgIOyisdXdoO9S/6RG1JQfoEo63IEV0yOLraRrF6F8A19M5S5+yGdokL2HNyHC8OZBo+OPNRodETeWRS70YxEAD/cPwiVOnkOsRACDb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPSAfbsM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so4716a12.2;
        Sat, 08 Mar 2025 10:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458921; x=1742063721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baE3FlbyAib1Dal/N03f+Lej7yknyKf0UFF4oZGMBs4=;
        b=LPSAfbsMyQQWCYwtNFmQvDRTRgm19YGmEB2ERR1Ppq+jkwi79zsc3O6JxuyVObqEhL
         grjjro1qTL4ECEjIEQSSExjQmZoq85Kp6tBBun5l4jx75TGm8xURsLdYDay+8CS0SVzS
         kcKjhYzzzMQ6xvXQlYehEDfDXUJrzvFLfoAi1DKkB/F4CG45tCog7YzN+CmhMGsnI4gw
         mGbpvx9cREA0ut4j2O0pWi8bK0F8z/1PHVAE4+aRC5a4jV0z6kLOtRvgGXJGfi04xZfI
         UVmfTr+AVTNarhvhVw6R1hmPl7Sg+mgwSK3orTsp3wYbFftWjhuuPOrKSWF+ZZI1pY1i
         zI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458921; x=1742063721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baE3FlbyAib1Dal/N03f+Lej7yknyKf0UFF4oZGMBs4=;
        b=Lii6xjO0P+jXaW//YCTs+xoPStqzjSrB1zxWikufW2jXj13tttYwuzCeaqWJ36Cw96
         MgUE33feuKaAosRuQBE2FXYDpkY/fmFD+Q3v+sC0vzwFFlMYsbmojUbQBKvj3UYeeivY
         5VogGFdGndHSx0VxzMu4bYetFgHoOHYs7pDaIa2u/ZqHR/Och4KdFE4ohZdCuc2YDJQn
         v1xoVU83+4dqGSIr2ESjy+cqpQB0cvTTe4CDhxy8h5P345caIP693UWxQ3VS6tW/e3v6
         eCTy8XRvpZCn8FVsraJXYqurzrHyzVj83F+SL8EQqWqAcn5ztxVWNLGJZl+21CC7BTMj
         FEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgi0okQPszjLhdd8nyFrmasTayhfwjY9h14Dsk7e1Mx0c3c43AZCY0SjcPxExNo6S0WUvsZhKc0ouS@vger.kernel.org, AJvYcCVkuej5CLZrGsuprZWEa0SXNPclbslwSc75LefkEtHGQ514DavprOnkJ6o9HUZLhOJSDyInNZtnfIbf+g==@vger.kernel.org, AJvYcCVoQNDqks3SkG+Yn/RFPX9S7T4mIoJieV1vWOEnGe6vjBQ3ki0+DsQAJtECnztCH/vKwfGGJXHqBb+bUY8e@vger.kernel.org, AJvYcCWkvz4CjAczz+UnEy2FOTJDtCRGoqt0zEYsmGYKsyy5OyODXxsMfbOdewwHlQmQBudcxxaT+n0OODxqJZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzl3l2nJTvE++3SH3aOTehnMG+Joj08sh6mViLPhzniJJPljNE
	D/sghUz76/dEXx2X/zgK8tS4FL1isKEUNQfMZAlNUQRNWpzIU4so
X-Gm-Gg: ASbGncuJLXqAI91NOzDU7OV9XF3grcEvn42jvcOFSx1SkSx2xA6OdDHOV+ExxVMZv/g
	y3L1lH5TuAO59vQC2CLo3pR8xX3FgHrCvCqxTEHcg34DGsc8CkUm7zbum0pL8tfRUXdEKrJRDXi
	wBXRbclljSmYo/1pGHE8+zIXSSFHnmIRW5wzatkN+PS829b5JiJYPWl4dFZaXQzTgin3EW4lKkH
	0YDkQndWtK8dgL/K9DOM3XfZJSc0knTxb+aEuRE8SzvP70Plwh3GyXjw4fYYlo8qfft9CQE8B3m
	ki7K0P8Gzjvwh3H9WZzbYdM6m6k2VHgiUDTkfAhKJkBDnX4huF3NdDDT1A==
X-Google-Smtp-Source: AGHT+IFeoNQFzdeGQAk7Bpgr0BvM/R3lxDF9QM900UyUvrHBnqHPA0/fWbTTYKQNUdbDVHoVSrFw+g==
X-Received: by 2002:a17:907:3f2a:b0:abf:77f3:d1d8 with SMTP id a640c23a62f3a-ac252a9e1c5mr850948766b.19.1741458921149;
        Sat, 08 Mar 2025 10:35:21 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:20 -0800 (PST)
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
Subject: [RFC PATCH 14/24] dt-bindings: media: i2c: max96714: add support for MAX96792A
Date: Sat,  8 Mar 2025 20:33:43 +0200
Message-ID: <20250308183410.3013996-15-demonsingur@gmail.com>
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

MAX96792A is a newer variant of the MAX96716A, which supports GMSL3
links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index d4055ecf673f..a392da39c154 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -26,6 +26,7 @@ description:
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
   MAX9296A only supports pixel mode, and has two GMSL2 links.
   MAX96716A supports both tunnel and pixel mode, and has two GMSL2 links.
+  MAX96792A supports both tunnel and pixel mode, and has two GMSL3 links.
 
 properties:
   compatible:
@@ -33,6 +34,7 @@ properties:
       - const: maxim,max9296a
       - const: maxim,max96714f
       - const: maxim,max96716a
+      - const: maxim,max96792a
       - items:
           - enum:
               - maxim,max96714
@@ -120,6 +122,7 @@ allOf:
           contains:
             enum:
               - maxim,max9296a
+              - maxim,max96792a
     then:
       allOf:
         - $ref: /schemas/i2c/i2c-atr.yaml#
@@ -163,6 +166,7 @@ allOf:
             enum:
               - maxim,max9296a
               - maxim,max96716a
+              - maxim,max96792a
     then:
       properties:
         port0-poc-supply:
-- 
2.48.1


