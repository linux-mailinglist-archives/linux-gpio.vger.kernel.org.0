Return-Path: <linux-gpio+bounces-143-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D27D7EC34A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 14:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062FE280FD9
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Nov 2023 13:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B93E18C07;
	Wed, 15 Nov 2023 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vm7WabX2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5518B0B
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 13:08:55 +0000 (UTC)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2E911D
	for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 05:08:53 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-41cc7b67419so42243131cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Nov 2023 05:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700053733; x=1700658533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00ATIXVFBGhxLdhohuNcYTvt+T04SzCwSceArLs8rqI=;
        b=Vm7WabX2L9VJ4kqJcr331iVd9N4UGiHnPmSaHejKrEyaXN4Jhi5cUhJ5KAZ/P0eCaH
         bLsvoAAf8O3H056aKiYJ1P9/y86IiXCMRiJVlrJke6QYuyHvHHqx6pdGqFvW3PvEAIXO
         BFUzTuvCiAwtAPoeVvcOvVCh1AhvaawGzHutodxTEyYruNQ0GzkqpTlb9Hdg35yh608q
         QV3Cwq7uVN+hwT2mcTMSQTJsRL2v9vpvhIEh4+3L4+csxPUSgkReoFKBXCgm1RReKsYo
         1GihYJGayig9Y4Orf3R+OspAROtoeg2pjAB0YxweE+2UCEJ3tqNX4LB0rIyNCE9qn2IO
         w43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053733; x=1700658533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00ATIXVFBGhxLdhohuNcYTvt+T04SzCwSceArLs8rqI=;
        b=Yz4uSlPxfBkZw3jgaFuo8HFH6OsUS+Yqb6nhzoAg83z5vOi902diBVQHtPBAtbx+yl
         D5JzgvP7UpftIE+NPbQhJsBSCXx0qWCOpqaMKggaoni69Mj0oxbEG+1VTZN7wJ+zW2zd
         TJhR4dX+TYkj2pMU27HYPz7+VcYgrQf7Np2Kaln2anc5GFSCxXHYSLEjFJB4LmidOKGS
         BfkkRo+2KABRvC1ZBGFHvwPfcQPAMMeXI3iIlaAZrPuYRaALbmk8SaAgRmffjylSRnh9
         606JLP0+96A6gHDoj+YAXbDKeBYoD8uuPMjIhcbEga/51XtDFTPHZMn0XMtjRWL7mTJI
         FaAw==
X-Gm-Message-State: AOJu0Yzrqvs9fFXhYStg5eI+gopvQ63lPaFoVyACE1s1laVQ9cyuTsjl
	WEgfkG+PuVhp7+fNepWTvqXAhA==
X-Google-Smtp-Source: AGHT+IEQT8wvSMBcf62eIW3F4aWMFp+D1AcNgOdwSNIkKMd6dhgIMdRVnWgsbwXwQE6Nult31piXLQ==
X-Received: by 2002:ac8:5e4d:0:b0:41c:bf67:37bb with SMTP id i13-20020ac85e4d000000b0041cbf6737bbmr6541560qtx.59.1700053732829;
        Wed, 15 Nov 2023 05:08:52 -0800 (PST)
Received: from krzk-bin.. ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id fp3-20020a05622a508300b00417dd1dd0adsm3549129qtb.87.2023.11.15.05.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:08:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 00/12] Introduce ExynosAutov920 SoC and SADK board
Date: Wed, 15 Nov 2023 14:08:41 +0100
Message-Id: <170005362858.21132.4200897251821879805.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115095609.39883-1-jaewon02.kim@samsung.com>
References: <CGME20231115095852epcas2p21e067efe75275c6abd2aebf04c5c6166@epcas2p2.samsung.com> <20231115095609.39883-1-jaewon02.kim@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 15 Nov 2023 18:55:56 +0900, Jaewon Kim wrote:
> ExynosAutov920[1] is ARMv8-based automotive-oriented SoC.
> This SoC is the next generation of exynosautov9 and AE(Automotive Enhanced)
> IPs are used for safety.
> 
> This patchset is the minimal set for ExynosAutov920 SoC and SADK board.
> Currently, ramdisk console is available and Clock, UFS, and USI will be
> added after this patchset.
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: soc: samsung: exynos-sysreg: add exynosautov920 sysreg
        https://git.kernel.org/krzk/linux/c/20862a23260a3ab76ea5b425f93967d0683b28a2
[02/12] dt-bindings: soc: samsung: exynos-pmu: add exynosautov920 compatible
        https://git.kernel.org/krzk/linux/c/705672285530cd513b5549f96f92b2a9fcd63017
[03/12] dt-bindings: soc: samsung: usi: add exynosautov920-usi compatible
        https://git.kernel.org/krzk/linux/c/7a5e832d05025a3679d0fcd60584e6e946a3e358
[04/12] dt-bindings: serial: samsung: add exynosautov920-uart compatible
        https://git.kernel.org/krzk/linux/c/9433b8d8d35bd0b17d6e0df76ec135dd2fe63e7c
[05/12] dt-bindings: pwm: samsung: add exynosautov920 compatible
        https://git.kernel.org/krzk/linux/c/d2d9e80a0ba6b1f507c14d6d8e2b833a474744d3
[06/12] <DIFFERENT TREE>
[07/12] dt-bindings: arm: samsung: Document exynosautov920 SADK board binding
        https://git.kernel.org/krzk/linux/c/8bd05d4a86d5e1cec35dc7b8d1a5c0d925ecde1e
[08/12] dt-bindings: hwinfo: samsung,exynos-chipid: add exynosautov920 compatible
        https://git.kernel.org/krzk/linux/c/92b022550ae55527b4ce8f8cae7863857c7b795a
[09/12] soc: samsung: exynos-chipid: add exynosautov920 SoC support
        https://git.kernel.org/krzk/linux/c/beea67c7c2ef161c6ee7ef4e39d842fc0be3995c
[10/12] <NOT APPLIED>
[11/12] arm64: dts: exynos: add initial support for exynosautov920 SoC
        https://git.kernel.org/krzk/linux/c/1a035f71803af961fa72264d22716b5b5b85fdc1
[12/12] arm64: dts: exynos: add minimal support for exynosautov920 sadk board
        https://git.kernel.org/krzk/linux/c/a0282075cf5e6abc6d8cae89c1d5fedeb8f32c49

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

