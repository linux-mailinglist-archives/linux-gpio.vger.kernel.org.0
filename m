Return-Path: <linux-gpio+bounces-19991-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E7AB4653
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 23:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA003B5803
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 21:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6595729CB40;
	Mon, 12 May 2025 21:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NchLw8UA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B9229A317;
	Mon, 12 May 2025 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085368; cv=none; b=RxU3s1NT+EWf2PLNm7pMuqdGvjbmfHK3A0NgCbbZotHjKctWjIUwBoEQNATvvOBsnp3FwaLSk6Ht2XTWVJkPfOnlOh/PYd2Ky/U7AWGlDoqueNPABSHD6jPUitJZODFk0l8iFrsvq8yFV8nucNcKge1KD1wTh/+1Fn0aavr/Aig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085368; c=relaxed/simple;
	bh=6/hWs9iUt5Ui+lx+1OO9Uvb8OroHkgOYmK/XVAYbSHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bG+8jNYP7zcZRWIdUa84SIJo3j7R7pmaPX/OWxBduyv5bddRFOy4d9FM4U1KB2/N+2QxNJDHgFhZi+DENdozZrZnLzNcrUfEVBbRnobdg2aEiVD/M9ifoyUsgXbPBBMP/wypwHSeObcov2yJ6mt98j7ehOLujFklnOOVRP7tM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NchLw8UA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad257009e81so229449766b.2;
        Mon, 12 May 2025 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085365; x=1747690165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2wj/D5H6Qe+Mu8ENnwOehkOgYhIq8MIIeAM0Q4Nh29A=;
        b=NchLw8UAlgObZtrpys10E8LSBXU2Lsi9/D88Ng/Q/28Cee4F+im+L333WQ2N/Dwptd
         qp4d0GZldmyuxN3QQlCl2sEIHGT/0Idui68PbtpmOt8sY5WfExlhmsUFXbCqN/p0bTy4
         XEVSyX2NtAHTk9SPGX49msfNhI023ItBNcOhIJgfdEI54bXS04YoonLNdiVTJCflnKGu
         9/Ji5hnl8Hi1E+Ca13OAfKZSy8bkLzVgXq/VQoPoS407zChzASm6/UszbyY4K8cSFy8P
         FthwAlf9cO3yaTzlAfdqgRHtB0st7KyF5ELfOV2XyJaJg+9Xl6KCQ8Ttlkl+moS4xah9
         jnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085365; x=1747690165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2wj/D5H6Qe+Mu8ENnwOehkOgYhIq8MIIeAM0Q4Nh29A=;
        b=PH/8C4un3IBDSWamJUGauMK/b9JSkF9XZpiQI7I/IMuSAbIGRCTx0+CHhptlV8S3QX
         uxYEoCuDIXCV+cLw7Go6S37RNi+k2HvKH+1pFMJZzOFBRPu+PjYVzXpw77qv1jVwND1n
         yC9kw630g/PxRwuNHpnT7au7GDOC0xqQ74EshDa8xGe+fKD0x5u0Dc5FdRYh3cRyhtPk
         qdpk1kbpqdLH5q5edk7Zjz3X8+0zsjrkfRnSTOOZfaIkBTDGCZTZIQzXKZgYq6bgTa57
         pGvi2s89OCgvv4Q7Rt/2c7y4zCza/U6zeDQxonwhWJnfYL3PKVBUB0vFAmwgsV7vExYu
         XC2w==
X-Forwarded-Encrypted: i=1; AJvYcCU3creR0J6C0Sx7ENoi3I6dWB72/wJQQCcB/GJNKsTQCfH9WDQ5DLjL6UVtb9uWFuZT4kC6v8UcwifLEQ==@vger.kernel.org, AJvYcCUbO7PJhl3lz9V20Qap+3qyQz92kFImr+16ziilmFp6YerY93onOFJKA9yIpMebBNANEwLRObcyRYcI@vger.kernel.org, AJvYcCUxO7FWsg8YD+8KFc5lrQbL54UNA294Ql2r5b5aPwglQ6M/AN2Ie09bfT/6IBdVgbWkARD2LH+Yf2UGvbw=@vger.kernel.org, AJvYcCVBuiFAjzAexCKT5HeCg49pF3jPJiQjPuZfWMLU3diSr/OGwEKaApFsLNXNpoUZVDQ/zQS5lyjXO1BUw4SO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4TlXOqailn857Ao+e1KvuBsLqDfMewcqQyP9PFMAmAQ+jffri
	NTy3B1nUHWBi/+AO+AZ6Qp0TFi9gQzgD89RRCqVbC7Mm14asv5Uj
X-Gm-Gg: ASbGncsvymHyCgd1TlS3PPCcl1xA59C5ik4FY4kH3sPkvRjmvXwEZJoKeZH45yi5EHz
	Lb7khmd2or6UlrFG6p1I8v6H+/HYHppzhUZReqBczGxPHK9BSD64cxEh4rw+APz0wHLjtNTaaed
	UOV4eIY4TylXpli8USFt5AjEINjMG/WCw3TE73GsRkPMwewbMBoNg3A0i0+lPr3SLjVOhtwoXmS
	fFAMmMWPjBCCJaz73+phBvzY07KOZxBJuaTeLjN+yaV7QwNagzEdiFxWMVITtX+dwQ4Wt15CUIu
	40kx+IH+dVEiC8d+U3djnSnytlJNU6fAEUbtI7Ib0ET0zKwm6Pnzf213uL5j7e0=
X-Google-Smtp-Source: AGHT+IF9mrznUIGYs+0D303n81wrWCXoOyXY7upv/Aad3B9G+edHBUuhmp9z4B5iKaMEI6AxjGibgg==
X-Received: by 2002:a17:907:3f29:b0:ad2:50ef:4925 with SMTP id a640c23a62f3a-ad250ef495cmr634015066b.25.1747085364606;
        Mon, 12 May 2025 14:29:24 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:24 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
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
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 13/19] dt-bindings: media: i2c: max96714: add support for MAX96714R
Date: Tue, 13 May 2025 00:28:22 +0300
Message-ID: <20250512212832.3674722-14-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96714.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index f53c72e5c572..1c97624833eb 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -23,7 +23,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -32,6 +34,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:
-- 
2.49.0


