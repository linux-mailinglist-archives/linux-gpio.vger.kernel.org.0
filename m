Return-Path: <linux-gpio+bounces-30245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0DD0146A
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 07:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF14C3062E1A
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 06:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EB333D4E5;
	Thu,  8 Jan 2026 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Le7JQplL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C6133CEBF;
	Thu,  8 Jan 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854612; cv=none; b=nNS7E7w9Xau0PFHw0er25wqkppK69Vk2pWrSFCJthv5DimaocuB7F78tczZ0S+w059RD3Io0oI007Fkd4wEDhgTESsu7bj4M0iLQ3uESP51lCMdJgHJTYBO5llO8cn1SBTNyIR4RhTVjVrCUljvVxKU5WViH68tdxYfbtYFk9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854612; c=relaxed/simple;
	bh=Yg9i3WROboYmxNA0p0LX5mimjEeDeDaKPbSXU95jUTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=glLcjt3QVYpVHXFN+u4jdXCjfya3J9KRtoAPTXGkUg59vHdPY6Od62jQe0ZsF/kRQtoSaL4BCa56SqTXAgFiREDs4ik+5odnFr9ED7w35O+axUskcPMQVdGIVKBF3mTqduROmUm1c9xW9zRfzg6ZYZAfNfa/5otjJ+bN6D2X3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Le7JQplL; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854579;
	bh=RmI7oW3Ye7H0Gv7gofrIS2/gqWoZQQpysgRh3vTjGSA=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Le7JQplLuA9W20XgCL+rBW5uCbDP9Cziq4Fy5I3ctXGA7bIZeb0xQUV6XozoxXGAy
	 3tU0YR7ZqlGKy/kMElkinn4XbPcuFU7F6PXiKaiW20h5Bm9vwmkqYt/dbNXTmhPVCw
	 wjLscr1T+wWD/dLj8FOMvsy2jy79sYmp+TSVdLEI=
X-QQ-mid: zesmtpsz7t1767854574t1b45140c
X-QQ-Originating-IP: nqhtGQEKzZptD8rA4rJPzNemzRzLbeCF+vPr7zaTLgE=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13233925994878137357
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 14:42:40 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=1383;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Yg9i3WROboYmxNA0p0LX5mimjEeDeDaKPbSXU95jUTs=;
 b=00D5FRFx/hf/cFWmq3s6IJG6Z/e0lXKG3YIdSEnvh73fycgm0SkQ9AxYeRgxWbCZyqrDFCYYR
 wQV18mZxONpCcTvrinbhEzKwJDrgX5cV8RpKj4Lh4yKh7KOXM/7Br6t
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NuQldXZpfNnZQBy4VouBhqyKX3372DMJbk5K6Lz1r8qGJ275nXIcYh10
	hZ93Hb4PfCLZ1yen1Ub7PXTTIY071g4uJ8GpTRXhfsXKzNIZlZyhOrsryIhL7byq16uLHOS
	tixbkpe1Uq8y1r3k+0el65MDvMUOHvWPn//liPycWu545FVj9YHiiTEAWWxF1zR3ljjXeaf
	YmduhSfWuRPwtOxaHF78t3KPT70Fo+Eoms3b4BebbhTpprFQfPPQdZ4O4km60PFMbzzpGI2
	VfXiRyJMbO2JFhFOfDIqJKiChtNgvshZNGPUvKRgWHL7pcsTOfTQlyl6v57r6HNK5gyjDpg
	t0bkKEyORkmBuImJNnfqrM2R6b5bZnOM2moZzyqxMKTKITrrBvvhJNPyBxjuuQbQmwzYpyK
	aVng8Soi5do0qfKYlIKxJupAphHNkObX4P1HyHkn8I27SAdKTWxoMUmJadmJZvAcKpBGoZd
	oggZwBODpBGQbHSv7JdA1NsoUhmrP8LLIepMp6WkFCUZMtCS6VwaUR5bFaZl2bcVEvnitrX
	5HEJ73lSj09zKTOj9ApYgQhsw02ysAZx1FM1Q0tGOJBW+kMdrbFuZUvUVdA92aCSmj9rDLA
	E3ShP1BgWDo1Sa9utBi21IT9nSAYqTUS7tgQkse9P34b4MkratVlt/kGNybWf/TA1mu+2tf
	oPPNYrSZnKtyTT1jTA3wxrn0Es0eSgGNK3w4L4n8rA1EIWgBeTrXEMDMvm+imjU775hR5mO
	3je/h7/ZaF4yttaj8rxv/M3cNGKtDD+BgSrJP3elf86mtl68LZBEt76Iy/cZYB/J834YWH0
	rNNhAIUcr8QI4gZRgqcIzaRWdRVRDeskb3rIjABSGgOO+8ZQj8q+vhjjTSBqDBnFcOcbjZs
	8Xhw3pMTsDZmqAz5P1/7aTYcCRQKpqLAFeGsdZVmoRteZAxDGmLHaZfwfUWvbh/y04dLSRF
	B7susrMBQDYLabhm5sp09fLYiKFlQERCMIlf/TREJbPNwmC5ASjgHeSviVONI9/yyUBB4hv
	sEioyV+Ar5RAnz3hEnwN1q2eODyp3m8QMn/EZ5KeiX5/LOYbXuH11ZiuMZvCPaUyxW66PDB
	+Jt7+PGNe2616yRQuK449SW3XVswBc7eZ0trCmDCW1JTvj26QM93za1IW3nYK2cQJj/DxsA
	g1DGRsnRkJJPM7U=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Change the size of the reg register to 0x1000 to match the hardware.
This register range covers the IO power domain's register addresses.

The IO power domain registers are protected. In order to access the
protected IO power domain registers, a valid unlock sequence must be
performed by writing the required keys to the AIB Secure Access Register
(ASAR).

The ASAR register resides within the APBC register address space.
A corresponding syscon property `spacemit,apbc` is added to allow
the pinctrl driver to access this register.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6a7755722919a5958512aa11950ab..f05429723d1bbbd718941549782461c49196ecef 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -565,10 +565,11 @@ i2c8: i2c@d401d800 {
 
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
-			reg = <0x0 0xd401e000 0x0 0x400>;
+			reg = <0x0 0xd401e000 0x0 0x1000>;
 			clocks = <&syscon_apbc CLK_AIB>,
 				 <&syscon_apbc CLK_AIB_BUS>;
 			clock-names = "func", "bus";
+			spacemit,apbc = <&syscon_apbc>;
 		};
 
 		pwm8: pwm@d4020000 {

-- 
2.52.0


