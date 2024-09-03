Return-Path: <linux-gpio+bounces-9641-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C538969E17
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A26FB24E9D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 12:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1FE201254;
	Tue,  3 Sep 2024 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZABy0xfS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBD41DA0FE;
	Tue,  3 Sep 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367480; cv=none; b=dYtP21xj5wlznKMINQ+pquRzJYW1RoU0uT582PzJQvszPEOAExcK+GB3tm3VA17W3UvgAQUuwmeL+lxRZ1kwZaz4tHWXQopBfGyHZwe0oSHovm+78twlJXj8/7SyVe2IED3D8pNZwVQk51fhAHcl1Z8LOcHnxDuTf6rqUcfKLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367480; c=relaxed/simple;
	bh=yg4lWFLsux2GkZkTBE5nid/8euszrOUu40JI4Fymam4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q4+BmKVw6T7pGD01Nf4B/KwlTVQcumd+yIETVjAs5ta8g21DhJT0KVjbqTcDqAO+tiK4XbqGrvvTjMEKZH8mnHVTz4uvXAEWX7ufHqthMqweg2dT21vIkWT1ymnlnLwzdKqCsGMr889bdpwjpI0jjzhhEihqZRAV+d2k/sPV8mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZABy0xfS; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f4f2868710so57270841fa.1;
        Tue, 03 Sep 2024 05:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725367477; x=1725972277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFTIk59DfHte/4Im9/5rXIn7HhETWJ2FxxMWTmfCArg=;
        b=ZABy0xfSxz1oCTg4JL9vQVuqTzR3hiMZXCru8wxTLiuPKCcpMJN92uG0BeI3vico6e
         jmY0+XJCWFXU9TdIE1DV7ImCyloARW2ZAUWnnRLPSOscOXKYcXmljyRIo89iSqti7zHG
         O2smDofFJmaeSsI9DDkQRrAFsYh1Far89zfXTKW696W2zO6iAuCL5eu3pXIDvGq2hYso
         jQrxGL95svKvh0xs5CjsedaiM02UI4lKH+3ROZVNSk5j2hfJU1IxKChbynX44yJ9+Pys
         9U+UC7knSPG3CoM7OFaln6e2y3H+tCaK0UfCrgjWp+k1qdT+Tks7CtmSdrD0gwaCxz9Y
         PUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725367477; x=1725972277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFTIk59DfHte/4Im9/5rXIn7HhETWJ2FxxMWTmfCArg=;
        b=CoiDpXv7z3J25DNXMMe1tQMDMq5om4gx5rE0vcq9LJ4SXMjDgD+ZstsGnX5bRA6jop
         12OxdkPT4gjZspXU8cnKdycJ8SS3U6VAKSgUt7wLLrIYTqUffUIm33841ybzxnmeVbg5
         escQQ0b4E6sxNnyIyU0Xu4xgxr3XkEVsFfamH6ULw7IVK83f8EZdS2GEUykgEiiG1QqC
         kOd5Xs2ozmIcqUv+OudpMZWouNz+dU/bvAkQFU8RQp+l9rvBiG4TnwW3+SU82vMgH81J
         /+v60is+j5KC6XkiAqk+Kmy81C/JNJi5ysq1UuYipeWYJ+7jeoBa2SKpetILvAs0H/7+
         NiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw590OyauvbzMUhXNN6ecxv1O8dt5lIJpw8dKWsiVwg3iYNFxYNz3yYXUP5LMk/GnVGc6nl8ftCZON3g==@vger.kernel.org, AJvYcCWrrQrH6FbgpMYVpkERmfnPJ8vSNGf/Mi8ok24Kg9vTu4WiebVva546xYLl7wq0S262fXOjAp/jgi+U@vger.kernel.org, AJvYcCXD7Rb5axWXFzwGrABKwo5/0X7UP/SRt+uSgr+x0xuuOsMikihEygp4eGhUtjh2YvaBYBvBxqZRjz54VLQI@vger.kernel.org
X-Gm-Message-State: AOJu0YzoUWGf+Ymy2jVKQoVVKR51335y6LsD6m8sHSxW/E4YlxotDLOr
	kMoRMqnmvG+4HMwVWD1L4PZJd8R7oNYpOl4Q20ttuvAXbJug5SbJU+URI36Q
X-Google-Smtp-Source: AGHT+IEpEAqX7+et6qE5IHLB/U849Ho1CLSRH4HalsEhoi+qFkkIlCAJ9Uulr+CNaVHf+LqAI40OmQ==
X-Received: by 2002:a05:6512:10cc:b0:530:b760:92b3 with SMTP id 2adb3069b0e04-53546b3fdc7mr10412871e87.31.1725367476569;
        Tue, 03 Sep 2024 05:44:36 -0700 (PDT)
Received: from ivaylo-desktop.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989223199sm678461566b.219.2024.09.03.05.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 05:44:35 -0700 (PDT)
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
Subject: [PATCH v3 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
Date: Tue,  3 Sep 2024 15:44:21 +0300
Message-Id: <20240903124429.107076-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
References: <20240903124429.107076-1-ivo.ivanov.ivanov1@gmail.com>
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


