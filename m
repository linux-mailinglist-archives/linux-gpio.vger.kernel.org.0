Return-Path: <linux-gpio+bounces-16771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B4A49358
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0907D3AFB41
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA0224503E;
	Fri, 28 Feb 2025 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GxbPKU9/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E722E23CB
	for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 08:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740730964; cv=none; b=mFBXjAqvR36bJrqycJHAC872aynNSKyZ1u9BiDtuWN+FIo2GF9mhzwt5OzLRECN15mh2ikocaMBL/4S5DVCunNaozHfgMhF989jLVjUucyw+KJ1gGrHTRVgJ+lZ534vm9nvFdnGvaY7/gGtAV+sXunVw60udCqRwSt5egfuoskY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740730964; c=relaxed/simple;
	bh=qY4oRNEHrOsAJ8xWqz1Vs/rayvoY+PfxlLB1/jphBv0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I2LbEd38CnVY4/g6EukjJv9ZrRR6fxN5HcuPrqH1gfJHRoD5/smh/wNK7vhUPKEK14Z80eHXBhMUQTBksg8IbVAlc208oCVsuyC1pVfufzgxuBPlOcRAleF80I6Pz5E46NAp1MGbPS7pi+32loWFN0A8sbCGIcu3eH+/nQunXC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GxbPKU9/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-438a39e659cso12587985e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Feb 2025 00:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740730959; x=1741335759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHgNhNb80DQy4X7ezcT4lUUrnZzt8BAUNO4RPQLnr14=;
        b=GxbPKU9/9TyW2Ioh7icrBo1J2JA3F0Ela3D8fx8qyS6YzxmfVA0q9fctAKpB1GRo6c
         K6Mz5gOcxmS+T5FwEBJb4QP/hI6VuCvMgcPeZCIRiWVQ6XljcR22F6wu9qeACrQAxaeT
         +btXqd1OXWx+1x4BNb23WMbDeTGbKNVxP1GXpax5EBOjTbxmdLqJxusKPWpEnYLXwDhy
         h4Ko1gLWHVX08cu7+Ocn4xhkCZzO5cmdY+9eFZYKgKMyvveNGwaokr+z3mclXt1gI/cE
         N9EAR8uPYi0n6HB1ec7jeQ0nFB3sg+qzuMzDwzeZSciz80f8IzTt/VBgw/wxCJ1iDwXp
         oO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730959; x=1741335759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHgNhNb80DQy4X7ezcT4lUUrnZzt8BAUNO4RPQLnr14=;
        b=tUzO1d8Xmvz5l7so524g96D43eIfUJwNOsid2wLeGL24or6jw2kZQpk9kDqMUzjEk4
         350weYDqGsH0GnQmOZbsLj0oGS9e998N4V54hggW0qsMbUiEwO1Uf6QGsbT5U3c+pTo9
         UvbpByTzKlOAoQj2nuQ0f0p7oMYQ+gtpVQC4GUQepstukAtHCuPXRaAgVN2/IRD0Viy4
         N9tcasmIH1vxdNJHAxnIuLyCpfULY66aUpQTCP8y1gSCvWphTgskgXUF+P2MY74PXAjC
         3yDzzfaI2ZUGtLldX7FeQxfjwBR3yyRenvZwn9GGEXnEvb9qho2AVy/SNJjanK4NBQMp
         ecMA==
X-Gm-Message-State: AOJu0YyS8YlkswaADVZrTNROu/0cTbSj04J71GOxXEkVX4G1od+ptyzS
	hKdtG7n2vsYCsoi5UBIrlb4SmEG85efYMfhlFC6yg7HmbvTTL3jsqaFVbdYSET4iLZBAaqZaGhC
	q
X-Gm-Gg: ASbGncva1CeqTeqo5KF3Dl6pXbnX92WuvK/HawhPLpDRa+V2Ls8At7ETYTb/8G3El0k
	0L420tG4zFAfAj/WWNqCYtuplM6fcI3WUW/vEFkhWb8nXY0K4SvyYPLjAZ1rGh8epukU4IjHlID
	ZcNIAHd7FRrhU49pfRYnqqkufH6YGKfnP8UdwqjhptjMRfeNv25+tb0d4m2IkNzomVEaq60Bpt9
	b0DDFINI7qLfjwrghyGgq1qG0rNBb478e4HIZUNUDFlZ9KxFR74Cz9T27rLYegdPvqCHRvBLKfb
	XbEhLQiCGFk0owOu3csVDQwHLQoodHT2VapNFT4h4MZ2UQ8=
X-Google-Smtp-Source: AGHT+IFh9o/6ArnjhiUzlNBx86ioNJTlHz7etf9q2i/1fT39QQaodFUpScWDIhXR/Ov2pOocchf/qQ==
X-Received: by 2002:a05:600c:1384:b0:439:9f42:8652 with SMTP id 5b1f17b1804b1-43ba6704748mr20910835e9.17.1740730959239;
        Fri, 28 Feb 2025 00:22:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737074d8sm48750365e9.16.2025.02.28.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:22:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
Subject: Re: [PATCH v7 0/5] Pinctrl: A4: Add pinctrl driver
Message-Id: <174073095841.1139542.4947939584999923520.b4-ty@linaro.org>
Date: Fri, 28 Feb 2025 09:22:38 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Wed, 13 Nov 2024 17:37:27 +0800, Xianwei Zhao wrote:
> Add pinctrl driver support for Amloigc A4 SoC
> 
> All of Amogic SoCs GPIO device requirement is met here by
> adding GPIO bank definition instead of the pin definition.
> Binding header files will no longer be added to future
> SoCs's pin devices.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm64-dt)

[1/5] dt-bindings: pinctrl: move gpio-cells and gpio-controller property
      (no commit info)
[2/5] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
      (no commit info)
[3/5] pinctrl: meson: add interface of of_xlate
      (no commit info)
[4/5] pinctrl: meson: Add driver support for Amlogic A4 SoCs
      (no commit info)
[5/5] arm64: dts: amlogic: a4: add pinctrl node
      https://git.kernel.org/amlogic/c/ce78f679e08cc4f90db1ad8e61ba9f85530c701e

These changes has been applied on the intermediate git tree [1].

The v6.15/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


