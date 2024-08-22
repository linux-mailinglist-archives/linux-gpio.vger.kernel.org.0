Return-Path: <linux-gpio+bounces-8971-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8897E95B214
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 11:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 448F228625A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 09:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B4D184545;
	Thu, 22 Aug 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3RqG3Fi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146E17D377;
	Thu, 22 Aug 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724319689; cv=none; b=Y4tzuOk6JAvoJPOvAHLvCHD56ukJD5FlchM/iv7FPm49ll+UYQDMJ6nj50cyjxi90Zz2AWC7sOVAArH9jrw8ivJhU1SBEMpIp1kdrVNsxD9/hc+f9jXBA1zH8fV8TLz20qYfFJR4cAesguzbt5jQnqu9uoBVQH40tRGL2CKD2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724319689; c=relaxed/simple;
	bh=SKjq0zl1AD3TiA8BotE+oEROoOlk7o+58wKeW4muaVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K9iaTdDDP21cXKvLL7ozw0oWeCOaYYpHrEpEyI1znT5QbJ1++Gl/wmgpTw/cINuDtaBZARuVSZ1tNwERGLikziwBHJknWLn1PLQ7BVTvouiLHAISQjOyGe/v9EXuL6gwBfAu4zjkzs0AeJMBBoHEL5en9uzI6DjIgtbNNAejgzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3RqG3Fi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7884C4AF0C;
	Thu, 22 Aug 2024 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724319689;
	bh=SKjq0zl1AD3TiA8BotE+oEROoOlk7o+58wKeW4muaVs=;
	h=From:Subject:Date:To:Cc:From;
	b=O3RqG3FiLdw4loGbbg6kIvjj+HdMDMbo1sO+h9qRYZmvP5TM0M76yFWQ+IU0/30Uz
	 qTGzMmA+ivNjje949iZWk62Grxw7+JZd4mZr3f8cq1bmulxpl5Je4cn+GFI3Kxqw/t
	 SugcmBQUVi7Fy68BFEibo6PX2LCZG65F626BL7W1up9DX2DlmQtTZQnfiKvQ+P38pm
	 G8HcHYEdaeEnhVKNKbFZMVXASv9DT+ng0eUzy+C7Wchl1O1hxFbFB3mp3QFZX60DVl
	 XtnQvf4Z87DhPsbucHEZczveADHhzXh8AzfwpxCc0iXlO5aQ4mEMAJUUzLuyT2TQFM
	 RS4RA9UotANcQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2 0/2] Add pinctrl support to EN7581 SoC
Date: Thu, 22 Aug 2024 11:40:51 +0200
Message-Id: <20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMHx2YC/0WPwW7DIBBEfyXiXCxYLwZy6n9UORi8OKguuGs3i
 hLl30vTSj2+w8y8uYuNONMmjoe7YLrkLdfSAF4OIp7HMpPMU2MBClA57SQVa5yWay5x50XqkDQ
 obTCQEi20MqV8fRa+nRonrh9yPzONzxo1md6Sc2FAhzZEJPTWDAHQB6A0xYTOBw+dttD3HhCxm
 /PeLZWp3OrrO3Ghpas8/40xfX416f138d+5XfgxtsrIVFkOUmsZ1iTHHj2lqNyU3PEC4vR4fAM
 0H0o4BAEAAA==
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com
X-Mailer: b4 0.14.0

Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
supports the following functionalities:
- pin multiplexing
- pin pull-up, pull-down, open-drain, current strength,
  {input,output}_enable, output_{low,high}
- gpio controller
- irq controller

---
Changes in v2:
- Fix compilation errors
- Collapse some register mappings for gpio and irq controllers
- update dt-bindings according to new register mapping
- fix some dt-bindings errors
- Link to v1: https://lore.kernel.org/all/cover.1723392444.git.lorenzo@kernel.org/

---
Lorenzo Bianconi (2):
      dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
      pinctrl: airoha: Add support for EN7581 SoC

 .../bindings/pinctrl/airoha,en7581-pinctrl.yaml    |  454 +++
 MAINTAINERS                                        |    7 +
 drivers/pinctrl/mediatek/Kconfig                   |   16 +-
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 3031 ++++++++++++++++++++
 5 files changed, 3508 insertions(+), 1 deletion(-)
---
base-commit: defaf1a2113a22b00dfa1abc0fd2014820eaf065
change-id: 20240818-en7581-pinctrl-1bf120154be0
prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


