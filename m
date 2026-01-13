Return-Path: <linux-gpio+bounces-30492-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B7D1976F
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 15:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACB2D3019BED
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 14:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6972BD013;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAPzgEvl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85525287508;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314589; cv=none; b=nmx5grTinpubQqenIl9jRzCM6Dj+ANQLotqoUz8Ev5F9Su1S0WDzDlzVb5x73pNd1Er7LMf97xRiUwg7jciFASfqxxltKCx1lDHSidLAIO9wXiZRfo0UxAJicisI89FvGMZwL945SMHxV5waJ3u6E93vNxQ/DBnVj/Lldajve7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314589; c=relaxed/simple;
	bh=06Yl975+vnTWDTbPJXQ82WwbzE0P4Eyw/LDsEzrePRY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I+jEReJRFizckwol5XZyqeDobUwt6vhIW6UXyqXTh2YrKQqrBF0tKxs+CyCEBYd00C6lL+6z0a3kBj40zzLEQvdZ3YzQ5CVJROsD+lrA2mC0Gvd1ZKEjrwWr8iqdThOmkMOoyZ824JPQmMiJU9iE3r3YOgDOji3K+bW+q54Rh3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAPzgEvl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E3CEC116C6;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768314589;
	bh=06Yl975+vnTWDTbPJXQ82WwbzE0P4Eyw/LDsEzrePRY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BAPzgEvlxan7TSdCJpptv8iWbH+wnUOwv7qNYc6t9iqFsruoPr2Kt76HP1UJFeXaW
	 OiVf5+PUIbaLsJZTbj1PSeChRn/4szJeaLNzC3YxrY9SA4HaeXF+W/5pl2IOH/B6cr
	 8GWkcifVjs0M+zXCCx9jHpemPMt8nsgi2h+6vWxXXwhPwK9NKmWA3ikaZbULsHFZBX
	 TXfDDeAWZG2eD2gjV4D6LXJTaq8GqaroujzOx0Byay32wcIyIuN5kWs4mzns5BAeGr
	 DZqXyDJvj8Yf1mx3i4IUVRcwmStkVzZUoy3enDbwMwZdc/LclE1JssCAE1Zs3kdAyR
	 8fU/9yEB72sDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E56D2D0EB;
	Tue, 13 Jan 2026 14:29:49 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Subject: [PATCH 0/2] pinctrl: mcp23s08: Enable gpio-line-names for
 multi-chip configurations
Date: Tue, 13 Jan 2026 15:29:46 +0100
Message-Id: <20260113-mcp23s17-multiple-addr-names-v1-0-f14b60f92c82@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpWZmkC/yXMwQrCMAwA0F8ZORtY0qHor4iHro0aWWtpNhHG/
 t2qx3d5K5hUFYNTt0KVl5o+cwPtOgh3n2+CGpuBe973RIwpFHZGB0zLNGuZBH2MFbNPYjiwoyF
 E73g8QitKlau+f/358rct40PC/D1h2z7D/Q9VgAAAAA==
X-Change-ID: 20260112-mcp23s17-multiple-addr-names-42314cda32b9
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768314588; l=1719;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=06Yl975+vnTWDTbPJXQ82WwbzE0P4Eyw/LDsEzrePRY=;
 b=1/HWneVKW6gV+ahQYeOezXywv6G3CSjoZ1lg4NnL5HHkiseUKQgW0jOTczZO5kHetRxCRRt7l
 h9wkVYcAhslD6iQCtwWw4Fdn9CLlWFRksF6apC15Bo3lsQ1K+qBVZ1t
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Reply-To: jeanmichel.hautbois@yoseli.org

The MCP23S08/17/18 SPI driver supports multiple GPIO expander chips
sharing the same SPI chip select via hardware address pins (A0-A2).
However, the gpio-line-names device tree property could not be used in
these configurations because all gpio_chip instances tried to use names
starting at index 0.

This series enables gpio-line-names support by setting gpio_chip.offset
for each chip based on cumulative GPIO count.

Example device tree usage:
    gpio@0 {
        compatible = "microchip,mcp23s17";
        microchip,spi-present-mask = /bits/ 8 <0x03>;  /* chips 0 and 1 */
        gpio-line-names =
            /* Chip 0: 16 names */
            "EXP0_A0", "EXP0_A1", ..., "EXP0_B7",
            /* Chip 1: 16 names */
            "EXP1_A0", "EXP1_A1", ..., "EXP1_B7";
    };

Patch 1 implements the driver change (9 lines added).
Patch 2 adds documentation with a complete example.

Testing:
- Verified on AM64x hardware with 2 MCP23S17 chips at addresses 1 and 2
- Confirmed gpio-line-names appear correctly in gpioinfo output
- Each chip's 16 GPIOs receive the correct sequential names

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Jean-Michel Hautbois (2):
      pinctrl: mcp23s08: support gpio-line-names
      dt-bindings: pinctrl: mcp23s08: Add multi-chip example

 .../bindings/pinctrl/microchip,mcp23s08.yaml       | 33 ++++++++++++++++++++++
 drivers/pinctrl/pinctrl-mcp23s08_spi.c             |  4 +++
 2 files changed, 37 insertions(+)
---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260112-mcp23s17-multiple-addr-names-42314cda32b9

Best regards,
--  
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>



