Return-Path: <linux-gpio+bounces-9911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 562AC9715F6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 13:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152E5283F8F
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2024 11:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE37B1B5EC6;
	Mon,  9 Sep 2024 11:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zot/KHiU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299DB1B5802;
	Mon,  9 Sep 2024 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879655; cv=none; b=jIyKCJeLfVGzwG2m5V2XolDQPd3+TwVyJr6iQEmk4/S9/CoMZh4ZvW/UeVRduzjbACTN42d2xFR2y3s48igEW8mY30IyS9vUxRp2LidB9cKcP3sRumyKtV3D5BUBqn5rrSJ6Wxrr/L4tzyAaF5Hcmz6Ce3inX1r84P9Q8vRlSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879655; c=relaxed/simple;
	bh=yg4lWFLsux2GkZkTBE5nid/8euszrOUu40JI4Fymam4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o9JTNkLB5opoKSlLaHTYUW+/qdPN5mkDjRywIiGQFSiX1oEwXBAd+pKbfmOrlX4O37K4CO2LRKnkb8qhTQIbk8wgwiM2n/WMDX/zjZ7pUCrXOHZm8pogudpNemVz39lMsjJCElLyycO+C0eQD8bz8eqELxg4cFvJux7rI99oVBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zot/KHiU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c3d209db94so4499107a12.3;
        Mon, 09 Sep 2024 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725879652; x=1726484452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFTIk59DfHte/4Im9/5rXIn7HhETWJ2FxxMWTmfCArg=;
        b=Zot/KHiUaYuhc3Gj6B3iCtYbA8apfnO9Oy/BVwTFsE5gONIzo6WbArEkU5FHJBGaP0
         DQMkteFzEfLrC4zQZfQcoSvx2/bskYpjXmWOQFjtw84HwXBr4aZASduUJRFbwhCdIU4P
         8S1Q0iXGu+pTBN3iYUMFH5BzJ03+Wp4fXdwW7RP9+G1z41gMCrnNmKruSY7N9XOr0YC3
         O7kJBz73o5qVNyByZAEL9eKtKIMp6HoPH8tk+c5Pc4tW4I5Vw1QbKSxc60DSncX6qS7p
         oHXdX1IyX+hMt/1pPB+mleUpB8CWdJAXdCYmvujN6Pdko8aNTA7VR4LgcE4vDacgfWzU
         lrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879652; x=1726484452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFTIk59DfHte/4Im9/5rXIn7HhETWJ2FxxMWTmfCArg=;
        b=FtxUoTuCWy9Dh1Y2rtkMktnEsh6D/SpWwdlg308N4m6Afmls5UK6OEGbdEm3qF9Aw9
         e6wB+IBGdnO+kfkQCQAFomFGFD/dPX5nLKKLzXxUcbM9QX6+oAENX48bTgyHdEAj++Ax
         MvU3NLQKYGMfsXnYlfqmr0zn1674isMdTTtDwg3wQU1sB9Rz29dI3N5vzSc5epIY9SnR
         L3P4TnaIB7xieHFHObM1Kq15D5S3/RAK/CvtFCfrTwBN1DzsQ6cK9LANLpHdbcwN0mV8
         DLYUQoKMKh6IzejJ3kCScAUg5ysDRfqI5Z76FWwArjysJhsG867r2lof/d+3zpPg1Pjo
         O+3Q==
X-Forwarded-Encrypted: i=1; AJvYcCULOapzUmYxPXnf6ZToSeLOuIZytwDFoRR10s4YsBCqRzrS0ZAF7UflFpt/1RhWlzaxQhUwRnH/nulp@vger.kernel.org, AJvYcCUMmLjjGZhhDi5NTLQA0BJKvbOyoo2tui+HY+CmL0kGMXNKcJb8elOwnzI59Repl6Fc/hUPwOsTGNNvRLIr@vger.kernel.org, AJvYcCW46zZqM8VE9kTYA19klVjHeCBVtBtdpaQiGy5OnfUMaNFPQG2F5/vX8mO9koI83XGGzvOz9AIJ+s9fwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNHnAsFA7Ny8ne+gzGtmIys9+fQoNsEAObizEWc98xnVHYN6OL
	Xuqtg6+JPjPC0ewRaaNxR4WChZEIZ34USmPxdVXVM3Tl2Ebm+ytwCWpQTA==
X-Google-Smtp-Source: AGHT+IEAoBSYeVLbpA6v3opaZmdIOZTV2watwI7JTAWvctEspc46xKwiTz4rhpKgmn800ilMSSqSlA==
X-Received: by 2002:a17:907:3e1f:b0:a86:79a2:ab12 with SMTP id a640c23a62f3a-a8d1c4d7748mr840434066b.38.1725879652027;
        Mon, 09 Sep 2024 04:00:52 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d5dc74sm322649666b.208.2024.09.09.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:00:51 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
Date: Mon,  9 Sep 2024 14:00:09 +0300
Message-Id: <20240909110017.419960-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240909110017.419960-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "samsung,exynos8895-chipid" compatible string to binding document.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 780ccb5ee..c50ee587d 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -23,6 +23,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7885-chipid
+              - samsung,exynos8895-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid
           - const: samsung,exynos850-chipid
-- 
2.34.1


