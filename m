Return-Path: <linux-gpio+bounces-23476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE4AB0A72A
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 17:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 210235C00B4
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 15:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2632F2E0904;
	Fri, 18 Jul 2025 15:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBECyhH+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AF2E040C;
	Fri, 18 Jul 2025 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852328; cv=none; b=nRrIJBqrx/vNcJKRBvatGFf0xlIe88rUrKMiHjZpbqmhju0eYVbjTqM3Qsg5qkPmm1LqMm4oLznp7CEVLkvHXvsVIBmRzdIQiUe5ZNV+nVjehJ+V1ayT6bkbUljee3XzFU8IWLO5Qr+UQNA4BDsCBnuPn0qfqBlf36gPTb2gGJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852328; c=relaxed/simple;
	bh=yFTG/+IvVw+bzb3MnGzM0TmgGas2u22oztjAItw/ZPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LmJtAULtMCUeHov4FlxLQJxfKSj7taNdrefOZhRX058QaS+34Rm5rjCHNaBOpMvw3V3hyUB7urYRQK/FpKGn83R0wsHpc4f03oUQ1gaXE4f0p798DQEtlwUGCvl3sntBLvu3nseFAaJjx+Fo6NGrWwfBHMJUzdIhLr4NKBMCbxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBECyhH+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so2008399f8f.0;
        Fri, 18 Jul 2025 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752852325; x=1753457125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=GBECyhH+y6+cgOE2gqbCdhngXjIbDS3qlRlgq5dIndPZRmQ5PqehKiCNpFj7A7BSnQ
         yYnaVPTzqS3J/dBJT95MODsAIKzPTIxHkOU0BOH69kM1wi8rjlQNlru4oGoBoencvdj7
         aiZBrnayJ1aY9TUZFv/I2CaEwGae1v3l9AM8dTgZQyeqVopmKNLi13JZptbgXD7v+Gja
         JYYiuQgoQ4JjcsJEqIUcsrNfLYx0dhNuBTf1xqxnU6BXyfm+EIdyoUJ/FC+z3//XtAi3
         68BRmEuCAn2EztrUCBbvhL+Rt9GENF5I+FKxjCcGi/nGNC//2a5+R33GtYJwrI1qKol+
         6Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852325; x=1753457125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wewY8zDENwwbPbKmIemi+OnwOyoDCjMzJlIPnG076OQ=;
        b=E+jilm5rZ3pAXEiTfsu4Bu2vywSJblRsk/lQlbeg6S6H043PBB4gRNrufOc0Q1sO7O
         BM+Wxp35yZggkJpJOzO3QIv0WlEljaNh4H3BhmVinMTxoPsg0m50UAVYy5kogPF54bq7
         DOLkpAdB9EVfEPyPrgf3BsAtgojCnRQG5sllT6keJpjQ/AwhbGr/OpUWhfRrdiTl3A7L
         JJRwPg1bSWuzJ/udGMIGRDAbFPWii9cKMpnDGImKWCrNtx0U3FEKKu0tUX6t8oztiho5
         5Q1Yg4Cf05+O3Jr4NyBbTBRv8rwPdCeNqH4ztiEpGfKmyjN4kbA9Dq0s4fJ9iGynAUmc
         qc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVN1rB89qNoIr/rpxjm4Df1dkiby2n7l8WRZq8jWuQPxiRaVsUseDoAotSaeSwe9PoSiTVwNobEAOS3xYic@vger.kernel.org, AJvYcCVXLG+U9jhbIGx5hIxUN3GM5Cwgx7l0ROvD3eJGTfi1HcKCenXQxOGiEfYq9L9j434/6icAWgcf9Nd4@vger.kernel.org, AJvYcCVYPUEyzLhwaCgvrTPZ++sv+pBYwP8GyiBo9nf9m1yzR20CPa7pQC3csBPF0A3sXGWUZToQv9C56xjcZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVRKRGxd+uiUM0syABDsjPN8/NOXYsmkBeG9UX6tep1O9cxyh
	wNOg17Y9kJt5+LCHjxpTMPehApNbOgz/HLSNUjF6jAHa9FvNVx30drjt
X-Gm-Gg: ASbGnct24zhR5G0OTiir/JTvRhTj4SFq2cRBcMNNaKnrJllqSM0nWgHce0H1UNI3skH
	/BsgGAlk/9DUwEpDD4yJZJetO2WlfsGhO/1Rl5Uqvo+hqJkbtb+fwfHNatoCuya8IASNxYXmpvm
	oskJhtZGlbTSeD2Xf5cMmk6plBC/gi+uWdmnsNr+VEujBpXsSBSOu4WT2Lr+3YJeQkudvq6RGiI
	+EEzeKzP+NwweHweRY+wqjII4XZEKNriJpRmXyJb0SsaPbs1VdQWRB6end0IkAmijc0LH1UtDlq
	ASs/PKeBt3uFBwKgApY2mQQlsNfWBXxfh2lEeslJqMwUglc9iwLjQzK480r1mYBOwKe36BfgZ1i
	znI7KF587gJWo2/lK713XUP+hkYuiAQWJ9rE=
X-Google-Smtp-Source: AGHT+IE57tXda7EJpVP1rw8lpnwZGNJ2JrkTW5ITWytpCAQC/qr+BkMYkue1GB1N87LJiGAHo75/RA==
X-Received: by 2002:a05:6000:1449:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3b60dd886cdmr12074749f8f.51.1752852325423;
        Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
Received: from demon-pc.localdomain ([86.121.79.159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4893fsm2195780f8f.52.2025.07.18.08.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:25:25 -0700 (PDT)
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
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v7 06/24] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Fri, 18 Jul 2025 18:24:42 +0300
Message-ID: <20250718152500.2656391-7-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 78ecbab8205a5..02a44db982852 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.50.1


