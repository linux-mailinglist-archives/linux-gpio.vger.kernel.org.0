Return-Path: <linux-gpio+bounces-29808-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F8CD883E
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 10:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E581C3022185
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Dec 2025 09:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71562322C80;
	Tue, 23 Dec 2025 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="j0gU4kkG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB84D322B9A;
	Tue, 23 Dec 2025 09:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481103; cv=none; b=Ks7WNXmcBkivVpPnuhhlmdHOFDtbNHeI9Qlwnx1njIHY1Y9zEu3ag2vxlzFPl2vsJRprP1tuZPmjNzGt4pDRi95f+aLHyblpoyk5ulVC7xTF6ek+5mQsPc5hzEcYEoewVaFYNRrNUHkCgDES8lI1Xd32ihvYd7pLjPTcDQy3cTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481103; c=relaxed/simple;
	bh=/Qy63wA7Y1r24zibFO0aO/HQu/hapCRtKKDOroyPo1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=P93kxIvOfH2G9Ecc39VoRO7VBAtlL4+IHJOVa9+GRHvV7S9VkmBmWlJet0dhVbZrMlH8nTjREA3LiHZLv3+FTBouLUQmw/XklPEWH53NZ6QGdoYJsw254JL/8HFxo8aVn6wJNu0zMs+z/amvQ0XxDcJfqpMDLpTtiE1qgOFW4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=j0gU4kkG; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766481085;
	bh=vkg79EMz9L8oFjhmFaO8dgtw4MQE2grCjBZHqRgAWic=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=j0gU4kkGadMjZIL0ej4DrJ7+OnGnHnWrln0TPTlvSgAIRySpGEDY4aG8wtQdLByEd
	 tI9JUckWt65S+I1Jd13u47JrCXAhIh2l/kfixEZ9PDYXU8mZBFwuDggkfUjYuxKUPp
	 cNp9bAqsjVaZhAepJNVb5cutPbSSCnDvQWR11n+Y=
X-QQ-mid: zesmtpgz6t1766481075t2d0932cb
X-QQ-Originating-IP: moyYXklt29oP9BlIlW7fWfKsjaaOlmBl7T1eL5JMtw4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Dec 2025 17:11:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12213458338995436147
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] pinctrl: spacemit: support I/O power domain
 configuration
Date: Tue, 23 Dec 2025 17:11:10 +0800
Message-Id: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK5cSmkC/0WNy26DMBAAfwX53JXsxQ6GX4k42N6lXaU8YmgaC
 fHvcRKpPc4cZna1chZeVVftKvNNVpmnAuajUukrTJ8MQoUVanQGsYbLHRaZ0pa/IUgEmWH5zUD
 zGGSCqJECOje0LqmSWDIPcn/lz/2bM19/ymV7y/9JV70WBh1ohEv9d2lqnyJRZNtSdzPPbAwrQ
 5rHUbau8oOONiW21pshIp5cfWqbIsiTJm01Nika9qo/jgfDG+3U7wAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481072; l=1603;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=/Qy63wA7Y1r24zibFO0aO/HQu/hapCRtKKDOroyPo1M=;
 b=MaFPNL0TDDt1VLjqVP5PiTSo+HZbkjaoX+3zP2cBpz0Qz58J+M00s8KAgPUrMksjfBXu0DXFl
 7QnGWIrPcazAmvXhEVQsYXp4tcd7m8jKwU8qHRKPIjgMQP2xNkZKmkY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OdSP+T7n4psJjcbt2VukC4erePYoAwT1DgVfkuDMGz3mYdalB8r8P6RY
	MvqqAMrg94dbqLxkZWdiXRirdKH3fu2r6O3u/Htl8FQFM6tEOWRM72RGpnCh6qB2qcCglil
	Q9y7iPMZpdXZ7cBfn88Qd/HM3hWjuPfI4ZraBvsPlfMiWooQF7hYHtf7AWH3Gq2BXGeeUtP
	8/IGnxZmPPcvUoP3xJz6mL1/llDyz0U8vYtqlSToDM5x4QSwOfIlpI/FNkdVcawVAdYcVDY
	UI3XJJvtKjnt0N5pKDt3FyD/I5RsdEUFQbg5EA2rYdh8OM5A0XJX3SRaoy+EgVUr3i3C80b
	0GUClFjb8rSMl6O2yhv5erv0fYF+xYDpeXtaqSktnIM7Y7lc55p7HxHjtGVWSbcFbggcvs/
	V5Vkq8UuxqI8oFkz2RdGfQ9MHLCO31Pg8Fw3n5o8A3F4aSev11HcahFzQd0D7aYU0rUmvyv
	M/ach+AFl0shPFJLOL/o8SA/vZK0MRUqAqbY9KuCmX5fLS167urBYDLZ26dVU7Ly2CRJM/W
	73frwUNOqp7V3VEVQDP1RJX3W1kXN5mXzspIkZuv7+dAjxe6Npu5nAUehSXJ1sw2/EgV/DZ
	Qt7Z71jq8Gh5Lftee5a24hWfk34Fr8pwtjJ2jqix7CPNwtEZTdkmHJ59VnWtUnxpiTZMz5D
	eFR7LMeT4cZVH9His5qYuemHZ3zSrZ+11iip02/IPfumlUATiigJ+2kiO9nC8toUCySo0aP
	F3sHnWQ73cxTnVjh2w/OSlEXm4jcypi5EzypeOMCbxtLAnIaeBsN6dttwokwu/hxgAoNjvF
	CFztKEYDmmiKToq4xwvCplA6MTGkiKQB/d2SR7jvN3k9m6XfDaV7NUw6jDU3GVt2lCERzpb
	W72jKJb/hi/Oix2vhz0ejYoAHfBCafD1N06dC0FqpwRldRtOgoMknlniN93tyEZkdm6naz8
	czTx6gMkFu6qYWzIR2Op1m5RyqY933w26zS77x1e4huP+S3R8/fzSh9eRCQOezIwulGWN8y
	/mJchI3q2/BUgemKjL8cR8/8uU7O8mISllm7cqG6bEbstRNek5uPT6j8SDRiUiDJN1LFsU/
	BclYI7XA1+dLGZYMTg27SBiq+wcP8L4PWCI9o60mwq7MQ8vBXeHdJmORTPZ+a8gSaIKeFBn
	BtzlbFPOyFbGCH4=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Troy Mitchell (2):
      dt-bindings: pinctrl: add syscon property
      pinctrl: spacemit: support I/O power domain configuration

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  11 ++
 arch/riscv/boot/dts/spacemit/k1.dtsi               |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 131 ++++++++++++++++++++-
 3 files changed, 142 insertions(+), 4 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251223-kx-pinctrl-aib-io-pwr-domain-b02da255f95c
prerequisite-change-id: 20251125-02-k3-pinctrl-738cbddbe49d:v1
prerequisite-patch-id: bfa2def3e13eeaff0bb88e5b3411041d4e2a61ca
prerequisite-patch-id: 3a1590265f1222f1497fb55608a09388df3efdef
prerequisite-patch-id: 26d923faae23d9248bbf650f5f8ceb02479466f4

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


