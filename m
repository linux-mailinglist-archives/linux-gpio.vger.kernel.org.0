Return-Path: <linux-gpio+bounces-31296-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7odMLh5Me2nkDgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31296-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 13:01:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E78AFDAB
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 13:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFECF3016C9C
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3082EE607;
	Thu, 29 Jan 2026 12:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJpROGAz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5B029ACD1
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769688089; cv=none; b=i1pAQae6Yqqf8y6l6FiQzkIFpx1nrmIkCsZeajteej5VCND2xqN9eHSQbLpJ5oZ6AegBlhILkp+st/4lqBx9wAU6aR7ENoFXTizc/4FL0jJlF/zTfxBbKB+MKwHnn9p+O1lrWbV1CV9eUToWBIB6+ogG7Tt8+iz525CUXq6R2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769688089; c=relaxed/simple;
	bh=I38MUjkcoH9V79CpUKSDz1OC341UmQxGErHv0ex1jmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MAMyeLpNfFvlDAryvzeVH0JXpQN/YCX0RG9jJx6ZX8luKJKtibo0Gmg/CVtuk1dTeGtgoJ+l6yCTgAWQveu15SVeSLbbKTaDz76Fu5VlcHyHUI3ye786z8/WvSI2ajUX61bbTmhM61CK9nUjhHwAErzEWL1ox6afodmQavYMlq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJpROGAz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8710c9cddbso115940066b.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 04:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769688086; x=1770292886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=DJpROGAzoSrzmq9TwCme9FosDE4zggT7X+xVJ9CK2vMo2CRXeaZByyKKrG8qtfAeeN
         g7BxY0AgZV6Kx2QSggLblWfWvxzZ7NkgiDLgoE4g93yH8+PPBryMktyhnxgDsaUArroS
         tpcGAZxq+xLvDECR6E9BmgWWClJdJWILMYpbcCtCRrNdDvxmwT2iPE69X/JeVG9JVLYC
         Asl5YWONcPTgE98PRnU+icDwDcV625p31aY/NlRarMKDvVRHdFsmK7SSRHMY2zsxRg1p
         oG7wu6YJYUudxf4+ySp5uD+CpT1t9EPu5kTYK0GtGjxBj3Qz/aUwJo8c1/B0YbevgFc0
         6AkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769688086; x=1770292886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkBngwJnmvxY2ZcqFRWqtKhnXiiLbRs1c6I12xgJLLE=;
        b=Cgt8E8Kd3vsH4wWw6NDH5p4Ngfjyj7lh9dtEGM1jO6Cqn2smWjymJVPcZzeeKWPfBS
         0h7/2luskcQYLVDn0xS6hOepV/EVeC4rGID432/4PJpRti44SNekIrPuOo6p+7k3beex
         E5er60C5F7ZITd5h6iufmKd8p2W/oHt+ky8gGuAo2xb8zafq/WXsZm5UEjY9Aoz2QZeN
         F7FEkHebC/hGKPR0OEpsdwhFG3Xp4h3vuip1PHIVSVPzAxJ12xeYyXGwiWleNcSu7EJr
         uoL1LmpS4CoIZfs/N9V4snIpdkOf1N3uMt21KFoNl9zHe8ks2nJpFdPL4KN8cqN5l8f6
         cluA==
X-Forwarded-Encrypted: i=1; AJvYcCWd/K8ug39JW+oQMtQ+ihVfWTD1BnvSXKyclqygvKr++8hLWxFzBoWkEX/y34mBDSjfXq3mOUBbAgld@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yncnwi7ft3ddTo7EH1q1UdoMYPn+LAUNlgZKVGX63xplA8MO
	NK8qu2dcqXyC1oWu4m99g24w7nnxn0uiuHm5d3T533Phrefzl9RKjYp/
X-Gm-Gg: AZuq6aJ/PxrRi59px1sgmAq3X/j7zDmNMu2pf1hnRGYXAfccUudP6rGtQ6GjINk28CK
	h63zWqjkotqSgxjbHZDaOy3CBFuU+96OssbuMVfrregoJuhkH7PYOkh+FseukfNC+zfKgDxOuiM
	v9tKqXXqS6xILFvNG9DwP9NhPYS1HTnbUkjQ/p/JBMJCIDCeKnk+0zLxYvST//LciMbuxr2j9RX
	pIkMrOEYlMSTOrXqITWOHoaIeg3JjaQh789KSve3Y1WEuxxuBCaiWTRSMHu2v852Cro03C9B86w
	eYPKzdyMtaOpzJiCffKrgEji094xhmvkRJ4PBiit7bcxlGxTvhhXH9ByOu/xDbBbjACQj1EDhVt
	xEHRn1SOa6jVIlFawCc+6fQUUbvo5TWoMDfVPVEJlVhGELzJijiHI7D55IGMlY6ic4dW5EFDDTW
	Qqr5vvVXrGU11Oo6vulSNddOgn7RE=
X-Received: by 2002:a05:600c:3b86:b0:47e:e5c5:f3a3 with SMTP id 5b1f17b1804b1-48069c5414fmr115342325e9.24.1769681810702;
        Thu, 29 Jan 2026 02:16:50 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:50 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 0/9] Add Renesas RZ/G3L PINCONTROL support
Date: Thu, 29 Jan 2026 10:16:35 +0000
Message-ID: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31296-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 18E78AFDAB
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series aims to add basic pincontrol support for RZ/G3L SoC. The
RZ/G3L pinctrl has OTHER_POC register compared to other SoCs for setting
IO domain volage for AWO, ISO and WDT.

Document the reset-names as all SOCs has multiple resets.

Document the bindings for RZ/G3L SOC and add pinctrl definitions in
driver.

Add pincontrol device node and add pincontrol support for SCIF0 and GBETH
nodes.

Note:
Some IPs needs to set the register IPCONT_SEL_CLONECH in SYSC to control
the clone channel of the IP. Plan to add clone channel control support
later. The IP's involing clone channel needs to do the setup as per the
below flow

(1) Set SYS_IPCONT_SEL_CLONECH register as necessary
(2) Set the PWPR register to allow writing to the PFC_m register.
    After setting the PWPR.B0WI bit to “0” (initial value = 1), 
    set the PWPR.PFCWE bit to “1” (initial value = 0).
    Select the required function from Functions 0-15.
    (Hereafter, Function1 setting example)
(3) Set PFC_m = 0001b and switch to Function1.
(4) Set the PMC_m register to “1” (initial value = 0).
(5) Set the PFC_m register to write-protected. After setting
    the PWPR.PFCWE bit to “0”, set the PWPR.B0WI bit to “1”.

The clock and dtsi/dts patches depend upon [1]
[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (9):
  dt-bindings: pinctrl: renesas: Document reset-names
  dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
  clk: renesas: r9a08g046: Add GPIO clocks/resets
  pinctrl: renesas: rzg2l: Add support for selecting power source for
    {WDT,AWO,ISO}
  pinctrl: renesas: rzg2l: Add OEN support for RZ/G3L
  pinctrl: renesas: rzg2l: Add support for RZ/G3L SoC
  arm64: dts: renesas: r9a08g046: Add pincontrol node
  arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface

 .../pinctrl/renesas,rzg2l-pinctrl.yaml        |  16 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  10 +
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  13 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |   1 +
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  92 ++++++
 drivers/clk/renesas/r9a08g046-cpg.c           |   6 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 285 +++++++++++++++++-
 .../pinctrl/renesas,r9a08g046-pinctrl.h       |  39 +++
 14 files changed, 465 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

-- 
2.43.0


