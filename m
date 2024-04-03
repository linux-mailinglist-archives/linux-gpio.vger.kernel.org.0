Return-Path: <linux-gpio+bounces-5058-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ADA89781B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 20:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2089282380
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Apr 2024 18:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22144153BEF;
	Wed,  3 Apr 2024 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ZwCD8duL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298915358C
	for <linux-gpio@vger.kernel.org>; Wed,  3 Apr 2024 18:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712168529; cv=none; b=oRpTfT3usNpZ9vQ/M3uMI40hLnVnhY5myotXVw2SlBuNuK9n1oBf7VtwKc1NNayFoylWLPaul1ak6mmjqCN1ZI4SftT39HZ71w1uHXz8H6AOwEof7Z1rGB5xEc7mXBHxnWJ8O5KVNCTu9D8vrqj+Oz6WBJTPw5c1NvI1rPtT31Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712168529; c=relaxed/simple;
	bh=YLQ5ks3ozTKHgLjWeRoai9T7IQizj8Dx9UVCzQpSmEY=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=Y3AwWwjymlsMWcoUkL2iZzlUQ/FJIxrzqxLKstFqpweeVBA3128eI4iXN1K8+uLGwW1gTGt5q1VeGSZ32+GNHFp/oLj0Pmdq1ZUUg55mGN0FpbvMqIVw/AlnZIlJPDgugihzuwteadpPyvy5wtBGCers3aKSkEDp2Cf04FuhoBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ZwCD8duL; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6f4ad4c57so75466b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 03 Apr 2024 11:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1712168527; x=1712773327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoPxyy6ZZevKYMVQQwthSJ0EL7SyRC2E5s9/TcAwzlA=;
        b=ZwCD8duLiCKuvl/u7C9SdR5KA7kiEXzgg9lxw5OSzEdw1T/wGKr5yIscD1y5u8+1Jb
         rEiSIY56Ll0uhQLmfdAoYDC2Lnttb2XuguTUokKOEAkOSgyPOVOeTbfdqd+d1/f0AuVo
         h8r9YkjwWATqXl4T36os3jswsTUuZ5CfYf4W4jAwrW70gP0R98mB3cW2EL1Lv7GwSJ+u
         IGStBP4q+9l/L56Zy1gtiAKzSTq4eu/zZP/Mgi9eROxXuNemHFjFOFK6sdKFwtKQP6NY
         JiCveokbXC5BI6xt1xgStRdF5YPEeiOsqUFpFv+xZ9FBnstn8e8UP3lxmzylyZu/pqXh
         +gSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168527; x=1712773327;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoPxyy6ZZevKYMVQQwthSJ0EL7SyRC2E5s9/TcAwzlA=;
        b=wzF+8/7tFTM1yzt7JwUrMyLSxV725yLFjaLgGJ3YYM5m0uATsU0X7muxaZP/Cx4bxD
         nqinJK8GN2my55TeMNOctTMFeLZBJ4cOooi1Z1EpihJ0Sz8rc4swmMcqulpEvlvoy3sF
         elJGUdjTsgudGVM5oIl2SyhnyN8J/y2RtCg5e05ON84SJtIdJjPfh5D+5EneS8c7vNyB
         NhCKKTjvdl8liPk8f/QF1WeN3ZkpPH5axEngkggP92F0RvH+r7WnUGUKHcgn9/YWEMpr
         8CCK5BIV94+PavIVcZaCoISNF3GtQqstd8pkCI2b47EY1f2uOHjH8P2rcv/2itecixFi
         QH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCU9dMl4TOB33TuIZ6SLuJgZPDThBPvnoPThcPfIB4/r4KZzHOVZKanc/UpIzLVk0181/wACa9l00ido71ujvGGl6D9hFLfSlxyA==
X-Gm-Message-State: AOJu0Yxc6bsznBGY/o5uOhcHZabFfp3o9vLE6w2drCouRFNIJsQgp9hr
	VPVDowtxHGW7a01gifkt+3niGgvvqN21cM8ov9dBPlVG03zQlyTHqc++jc9fvBw=
X-Google-Smtp-Source: AGHT+IE8xKPk+Cg4ycXY4vSQCypFZ4Jw5ScQiKmu4H6BcqJa4Y6mRodZymA7cXolnlaayPoU0XPjww==
X-Received: by 2002:a05:6a20:734b:b0:1a3:48da:1090 with SMTP id v11-20020a056a20734b00b001a348da1090mr568998pzc.14.1712168527301;
        Wed, 03 Apr 2024 11:22:07 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9-20020a17090ad3c900b0029b77fbeb7fsm14038311pjw.16.2024.04.03.11.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 11:22:06 -0700 (PDT)
Date: Wed, 03 Apr 2024 11:22:06 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Apr 2024 11:21:50 PDT (-0700)
Subject:     Re: [PATCH v6 00/11] riscv: add initial support for Canaan Kendryte K230
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
CC: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  dlemoal@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, guoren@kernel.org, mturquette@baylibre.com,
  sboyd@kernel.org, linus.walleij@linaro.org, p.zabel@pengutronix.de, linux-gpio@vger.kernel.org,
  linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cyy@cyyself.name
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cyy@cyyself.name
Message-ID: <mhng-08e43080-8679-43f8-80c5-b73304e4e680@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat, 23 Mar 2024 05:09:42 PDT (-0700), cyy@cyyself.name wrote:
> K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add initial
> support for it to allow more people to participate in building drivers
> to mainline for it.
>
> This kernel has been tested upon factory SDK [1] with
> k230_evb_only_linux_defconfig and patched mainline opensbi [2] to skip
> locked pmp and successfully booted to busybox on initrd with this log [3].
>
> [1] https://github.com/kendryte/k230_sdk
> [2] https://github.com/cyyself/opensbi/tree/k230
> [3] https://gist.github.com/cyyself/b9445f38cc3ba1094924bd41c9086176
>
> Changes since v5:
> - Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210 SoCs
> - Modify existing K210 drivers depends on SOC_CANAAN_K210 symbol
> - Reword dts commit message
> - Modify dts to use Full 512MB memory
> - Rebase to linux mainline master
>
> Changes since v4:
> - Reword commit message on dts that the B-ext version of c908 is 1.0 rather
>   than 1.0-rc1
>
> v4: https://lore.kernel.org/linux-riscv/tencent_587730262984A011834F42D0563BC6B10405@qq.com/
>
> Changes since v3:
> - Refactor Kconfig.soc which uses ARCH_CANAAN for regular Canaan SoCs and
>   rename SOC_CANAAN to SOC_CANAAN_K210 for K210 in patch [5/7]
> - Sort dt-binding stings on Cannan SoCs in alphanumerical order
>
> v3: https://lore.kernel.org/linux-riscv/tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com/
>
> Changes since v2:
> - Add MIT License to dts file
> - Sort dt-binding stings in alphanumerical order
> - Sort filename in dts Makefile in alphanumerical order
> - Rename canmv-k230.dts to k230-canmv.dts
>
> v2: https://lore.kernel.org/linux-riscv/tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com/
>
> Changes since v1:
> - Patch dt-bindings in clint and plic
> - Use enum in K230 compatible dt bindings
> - Fix dts to pass `make dtbs_check`
> - Add more details in commit message
>
> v1: https://lore.kernel.org/linux-riscv/tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com/
>
> Yangyu Chen (11):
>   dt-bindings: riscv: Add T-HEAD C908 compatible
>   dt-bindings: add Canaan K230 boards compatible strings
>   dt-bindings: timer: Add Canaan K230 CLINT
>   dt-bindings: interrupt-controller: Add Canaan K230 PLIC
>   riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
>   soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
>   clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
>   riscv: dts: add initial canmv-k230 and k230-evb dts
>   riscv: config: enable ARCH_CANAAN in defconfig
>
>  .../sifive,plic-1.0.0.yaml                    |   1 +
>  .../devicetree/bindings/riscv/canaan.yaml     |   8 +-
>  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
>  .../bindings/timer/sifive,clint.yaml          |   1 +
>  arch/riscv/Kconfig.socs                       |   8 +-
>  arch/riscv/Makefile                           |   2 +-
>  arch/riscv/boot/dts/canaan/Makefile           |   2 +
>  arch/riscv/boot/dts/canaan/k230-canmv.dts     |  24 +++
>  arch/riscv/boot/dts/canaan/k230-evb.dts       |  24 +++
>  arch/riscv/boot/dts/canaan/k230.dtsi          | 140 ++++++++++++++++++
>  arch/riscv/configs/defconfig                  |   1 +
>  arch/riscv/configs/nommu_k210_defconfig       |   3 +-
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   3 +-
>  drivers/clk/Kconfig                           |   4 +-
>  drivers/pinctrl/Kconfig                       |   4 +-
>  drivers/reset/Kconfig                         |   4 +-
>  drivers/soc/Makefile                          |   2 +-
>  drivers/soc/canaan/Kconfig                    |   4 +-
>  18 files changed, 220 insertions(+), 16 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
>  create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi
>
> base-commit: 8e938e39866920ddc266898e6ae1fffc5c8f51aa

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

