Return-Path: <linux-gpio+bounces-30243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 214A7D01452
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 07:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C621301C938
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 06:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3C133C18A;
	Thu,  8 Jan 2026 06:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="sncoK/eq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0956B224AFA;
	Thu,  8 Jan 2026 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854592; cv=none; b=agSFw1teo6mv6Kcl6id2b31yaWuYDLPbLjrHKUeTEHwI7DB9jSZPB9E1on5gfFL8AUh7nlWLpn1kQUfSTtVzt92K1jwNq6L5NX3A+vQBIkdM+Zh1b//oanxIs6L1qhbAqY4mXojRFm9FPZR/gj7dXhJsNWpgGnL/owXMMJzQXag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854592; c=relaxed/simple;
	bh=ZcMJv5vySvDa5Y1bfoUtyEpyvXhIYxmk5NRRDB88Ifc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/Affw3VKREJ3SawH8tC14glSdzXjSWlggRDRdHsvwUCqtD6ecpHUbwKjKuPEtyCcNQdw40rja9/xuzPkjwoFbbeNMsOWC8DNvW0rcLFdyl5VAtOnl1pNLuVecvghywx3vzsM2K8p7mWeLWyntEkrakSNpQzUzOI0ov8hPbehRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=sncoK/eq; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854569;
	bh=9KHROnUEIvPqP19NCUXrKwxxtcouWKa/sIjP2B/yxeI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=sncoK/eqN9DEsaR1RR2VnSwWQCr72M6IWw785Incu/Gb6eu8FTltH+tUWHzY+MbcV
	 gOBHA+nuew9beynWHXI69kkdOl+H10Ku677uij0NJmfwvxhSgfr83mR+tpqVBE8pAR
	 G8M13H4FaNryB03T3sxXtJP6RDDENMfFXkennO9E=
X-QQ-mid: zesmtpsz7t1767854562t5f925277
X-QQ-Originating-IP: jpsITs+0M8zYjWpG+mRTWA7xVHFcy2hgYLaxB7MfVFU=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1930214051744861045
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/3] pinctrl: spacemit: support I/O power domain
 configuration
Date: Thu, 08 Jan 2026 14:42:37 +0800
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN1RX2kC/42OwRKCIBRFf8Vh3XOAYsxW/kfjAhHzTQoEaDaO/
 x7Zom3Lcxb33JUE7VEHcslW4vWMAa1JwA8ZUb00Nw3YJiaccsE4P8J9AYdGRT+AxAbQgnt6aO0
 o0UBDeSu5EF0pFEkTzusOl33+Wn/Z68eUKvEnewzR+td+YWYf+2dtZkBBdIyWVJ7OhSqqAc205
 MFJpUeMubIjqbdtewN4Zwz05gAAAA==
X-Change-ID: 20251223-kx-pinctrl-aib-io-pwr-domain-b02da255f95c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=1410;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=ZcMJv5vySvDa5Y1bfoUtyEpyvXhIYxmk5NRRDB88Ifc=;
 b=kri8MZhe0WMkMtzShrT1PFKK/8gTmXAPM97j6yiW7+TlGtDJEZj2R3j/dQkYjZbOTzh3v4n6q
 SUzKldhoR5yCYCaPkelY6tgE6h/2eW9X6gNLSNd1oLHGHiadPd6dEJd
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OPLQSEV68v20gIT8DqMIthvx8Lcp5sffnkag3n9mtpzn8DKB1Xh+wZ9S
	jicFbrw4pMb3DIrER2s1ET6kH81sw9Z7OIj0Pn1iWF40p08Eer/pldI4qLSBRIFWTlRiKYm
	6Nf3f7qVtPF+KXwKXAssSzXIkPr7qUN//EGGwYSwGU/b/9YmO5Fp7RyCZsHkjPuGO4u+jnu
	yepEBUp8QtUtBptYJS48xp7huGGtS2wiJI4vOkYLv+eb4nFMbDq86zmEQ86hc7fQPT0m4FH
	SkMehsXx9Q5cNOEzGkYjAPWNi+5s3xnmWiN32fDt2a5alEdBTSD1VfWoOVDFmPUtLA5XrDs
	sCkNiGc5r7McaAiy6fVXxNHP8CtKtdS6OLPtdV6oPlZi8FMLfGpRnjMQgBtA4gUQ2TqTj6O
	HXGc8nuE2lTwi3poBuzAsS6YYwbD89bKGusLyCNJ8KTfOg9VtKrWP1F+iQzSN7W+vVi5B2T
	Zq0JpnY/DEsW+rJjVDjxeAbzlaG0bRSUwmegGthj93naSX3LOVJ8uBGeFucRYW0Rq9FrktW
	ftD/snrt6VJ3YPqa0gAZQJ2UvSmktcCyoagMAAYIarAjjwkqCPrFoy9pxuSYhYGs4kYxfcg
	Y6Pv/ARoMrQhLcA8ENdrs4eVFVgnRnjK9212FnJa5/+4MrYlaKK1SMwG7yfAtlFGHu1qE3M
	cmPscHqi4KHhLTRbIKgoWcCzk8Fe5iiSYXQzSs1XTPAn0J96anE/pqsMglaskqLuuiMuuJT
	aEwJ22/zrZPNjPa5m0pAeHxBlpyZeLVHxhk5JEtewOqeJZI8WK8kISL7L3T+g1QsAOm2efR
	fcUR8ThYmeaVU+zIhKdPJ7Sz/RjO3Lx9xYQPRFFPtuaoldZ49VRCl+4OcwRhhsTgUXofXWz
	N3157+9lQQMvbbeKdIhokmveDQ0YK9qTwLeWU7uUfFp2+bZybRJhUVZBCRxEtbLV7usMT6J
	dZc0LlHRTO6Ss9viXiECA3R4Hd7ZQM3ygOZ95buQ6h6sEgKh/vLsvw6hn5l25rcQ581YsxS
	UD6I0tFWl0Ks2EtHwG806e4i0CPm5FD+4GBY+mrrr6khQ1h95Cj+9CAI3X2O9My8z4tFfZd
	4MPLe8NidZ/UDVIdInwOnnu18GwMDXyHKRY6BT/b4Q0eXlBCeA0K11bu38aSeBpn7FWs3Dl
	KDp+W77qITC52aI=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

This series adds support for configuring IO power domain voltage for
dual-voltage GPIO banks on the Spacemit K1 SoC.

On K1, IO domain power control registers determine whether a GPIO bank
operates at 1.8V or 3.3V. These registers default to 3.3V operation,
which may lead to functional failures when GPIO banks are externally
supplied with 1.8V but internally remain configured for 3.3V.

The IO power domain registers are implemented as secure registers and
require an explicit unlock sequence via the AIB Secure Access Register
(ASAR), located in the APBC register space.

This series ensures that pin voltage configuration correctly reflects
hardware requirements.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (3):
      dt-bindings: pinctrl: spacemit: add syscon property
      pinctrl: spacemit: support I/O power domain configuration
      riscv: dts: spacemit: modify pinctrl node in dtsi

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |   5 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   3 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 129 ++++++++++++++++++++-
 3 files changed, 133 insertions(+), 4 deletions(-)
---
base-commit: 168d19e604855cfa6024e9854f8ea9b1c8efa2d9
change-id: 20251223-kx-pinctrl-aib-io-pwr-domain-b02da255f95c

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


