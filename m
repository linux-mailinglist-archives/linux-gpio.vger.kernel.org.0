Return-Path: <linux-gpio+bounces-30095-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B6CF0671
	for <lists+linux-gpio@lfdr.de>; Sat, 03 Jan 2026 22:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAE643014BC7
	for <lists+linux-gpio@lfdr.de>; Sat,  3 Jan 2026 21:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B682BE7BA;
	Sat,  3 Jan 2026 21:33:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014893A1E94;
	Sat,  3 Jan 2026 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767476039; cv=none; b=QDw9vSw+I0rrZN69LTRim8porgVTZdQxyHlA6OYxfnEp82R62G8MltGVMktQlwFeWuzuc930hmQxwjey8JZRsunyKQhjrbIDHYVoyF+l1x8U9xycTCLZJ5G32khXvHm6YcrQoGxC9LkKEz59ujaexs5DxFRYwS7sBhTnW7QGpMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767476039; c=relaxed/simple;
	bh=LNEHI1LK47UuDs1IClEHqp6dec6h83YhXQvnLUxZhl0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TI5ybuk9Q7uX5qrwJZiCFWanN7jV6W1L24WrMXoUuQWdP/tVNYaGcVJWRGdeV+KrEMC8yyqNLJX0ZEA3MH8yP/MSiawmlNQjjbFlEuY+C8dTwp8pJCS4EYYS9YIvr+LTmY7p3kZ2dBUrs4fDKryDqXbI8LqPnYg7tXo9abIyZi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0046A340B46;
	Sat, 03 Jan 2026 21:33:53 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/2] riscv: spacemit: add gpio support for K3 SoC
Date: Sun, 04 Jan 2026 05:33:37 +0800
Message-Id: <20260104-02-k3-gpio-v2-0-07377739581a@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADGLWWkC/23MywqDMBCF4VeRWXdKnJJouup7FBdexjgUEkkkt
 Ijv3tR1l/+B8+2QOAonuFc7RM6SJPgSdKlgXHrvGGUqDaRI10QWFeHrhm6VgK0dDFs9TrPRUA5
 r5FneJ/bsSi+SthA/p53r3/qXyTUqJGO5MU2r+2F4OPZbCNcQHXTHcXwBjargr6UAAAA=
X-Change-ID: 20251229-02-k3-gpio-89b6e95cdf65
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=LNEHI1LK47UuDs1IClEHqp6dec6h83YhXQvnLUxZhl0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWYs3YkiFPcy8YvUqnl5KvLFpO4Qhw4QBwSTkD
 h37dS1kqayJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVmLNxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0LlA/+P6XX6vAWVcLXgO+/CYveGkd4/PNNN4e42snZvg333GHAmWfrxwf36
 CaKPXUXa0E2T83Yij+14iXXT4odx7ZYuifXeQNfDet1V1T/MA4JkpP3pGS9ijrHrLlISpxOKwhY
 7FYnrY9ZI+Zep+AGmfw+1FG4uPqYMQ9QdkmIdH0Vhk5sat8YiaOgtu2QaEAmkiNZE2QBGDajsox
 66zPJOT0rCl8Q+tZEVsfnCu4TNyVqMsUn/ZG4TVmsrLEIWqCGqjQ0IbUrLyY3irmOzktn1tD09h
 oGR8xJalMxQWpv4AD01ECbdrQJPsnViSjU9/s3hsikyXDwg0nlEqTMUgetRnzotviEWFt9hqFEi
 c1lTXkl+rM3eHOkyc3FEKrps9v/9qL+t0lOZwkVIh8Hd6o2FJ4GHCCCdZtIaHSqOBdRfWvWPUzW
 ay73BssyUB8FLigBD9zxn9hVpeA6+mR7ep/PbxfZThd6grc7mxUtuvieu5WFFNBdOIuTg0MZsBI
 p9bzmy+3bKc2kVTGZkvEoTs9NQ0SKQ3LVzqCScu6EiECaSPlJPPZi+el60ctkfy8mY910NxMxJZ
 82Z0b7RFdggFZoP86VBlsW2QTiDkEHcvo5K51VUFIAk91iVRWUm2ht/nAsZafSovVn5LWIhJ6Tz
 aze1CT8PkqEkq007tHRDLVyT9MjqXs=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Introduce gpio support for SpacemiT K3 SoC, the gpio controller
changes its register layout and bank offset, while mostly shares
other IP logic, so adjust the driver to support this.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- collect tags
- refactor gpio register read/write, introduce helper function
- Link to v1: https://lore.kernel.org/r/20251229-02-k3-gpio-v1-0-269e76785abb@gentoo.org

---
Yixun Lan (2):
      dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      gpio: spacemit: Add GPIO support for K3 SoC

 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |   4 +-
 drivers/gpio/gpio-spacemit-k1.c                    | 163 +++++++++++++++------
 2 files changed, 120 insertions(+), 47 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-02-k3-gpio-89b6e95cdf65

Best regards,
-- 
Yixun Lan


