Return-Path: <linux-gpio+bounces-29905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF30CDEB4E
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 13:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1BA77300B80D
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Dec 2025 12:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA933320A3B;
	Fri, 26 Dec 2025 12:58:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD4D1494A8;
	Fri, 26 Dec 2025 12:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766753928; cv=none; b=RWMQEBOF31qTgugtUHDVWDgUT6m7N68aouAVrJ6ckJMLb3GWBFU5jedDWB/ywi7KvTSoM7UmNUQWLFdfrmpRYORcMP54CmqgRbOYIIroaS52Hwwlkhb23m5q5Rqh+9HbeGkLjcLbKsiSlpx1PHGuehrveTX4Dh/ValQm0YO4eXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766753928; c=relaxed/simple;
	bh=mISs6e4sFOmpqFJF5huwwA03CYAmRcdBj3UxE2vX5+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M7J7VqowoelJt84u+pPt7X0evC1xAWkLq+DyzcefjqFUYO7Ocag2qKTz3JxK7YxUCdQp/sQAxCFJ/oTtQT8q31llE8SPdHaHlW9QkV5XRac0S573GFq4l+C2t0+oU2EyfwESr10Tbnmcl5h0hyWKKDmZP5YzzMxrWA5h6lXCd7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3A3A23415E9;
	Fri, 26 Dec 2025 12:58:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 0/3] pinctrl: spacemit: add support for K3 SoC
Date: Fri, 26 Dec 2025 20:58:23 +0800
Message-Id: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+GTmkC/13Myw6CMBCF4Vchs3ZMO1y8rHwPw6LQKUw0LWkJ0
 RDe3Yo7l/9JzrdC4iic4FqsEHmRJMHnoEMB/Wj8wCg2N5CiWmuqURE+SpzE93N84qk89521HVc
 XC/kzRXby2r17m3uUNIf43vlFf9efRKT+pEWjQte4yrBplOncbWA/h3AMcYB227YPvB1YaasAA
 AA=
X-Change-ID: 20251125-02-k3-pinctrl-738cbddbe49d
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=mISs6e4sFOmpqFJF5huwwA03CYAmRcdBj3UxE2vX5+w=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpToZ2sXKWCLz7sikw7eDEqH4mys554B/JUlG6x
 g94EcrjLsSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU6GdhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3nAg//bcFwZe43UMQMUvof6Cd+Ra84AQgnlE06KFJldrRDftkiQBc7+qcPX
 03m/xs+cpvQfDH70A/iG7D7aomvbrjii9ydC4lhnJdjanvrmOQ/fnP26QKciI4twg8wLc+iLPcY
 awK8e7z4j0vpu7He9m1n3mmKl/96bMJcvWcIKvYdZBSJ5x/i5BS4yAz/TpTVZHcYA4JvdPCt2+k
 QOuLYIFOvRjGfj1pqi1pZ+16a1ICpx0aJ74ifrefy/VKsxnP+pPBGWFQkaD+7HsXhma5gja9kqs
 hwzZ2SDtPNSRtChi9Zh54xE+Y3umbo/Ft2RhQsd6lWaPjEImL/J//3+VDBuPPv+u/y5qM9o5RPP
 qAYTIQSQYoxM89Zz2HwZR/eM+5M0iJrRyiKd3I0kzX4FVT9UCuMZzUa6V4pNfC7bSa62aYWw0ut
 AW/jrZ2JIUQyryK29hJlpQNZ+Y3nNznhsv88SXeDKCnRt6ftxytK61F5Yaw21JuKzkzBLkkpnJR
 gEgTFtlunDT9su0XDqu3jwvf9Ag6E5LNlEvKq3RHXhd0TOi40D5SfNsMWXAEDw1LIG5rk3V7SXi
 KmWwLqDG4n8wy/VgG3J+N6vdbCPAYaIeJdHn9nSwlAV4lDRaBts5pF5/Jc15CV91vSxPo92aYjf
 gyC0dXXDdomG+8DW8zRdr4ZZfooO2s=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This series attempt to add pinctrl support for SpacemiT K3 SoC,

I've removed the RFC tag as the driver is tested on K3 SoC.

The K3 pinctrl IP shares almost same logic with previous K1 SoC generation,
but has different register offset and pin configuration, I've introduced
a pin_to_offset() function to handle the difference of register offset.
for the drive strength and schmitter trigger settings, they are also changed.

The patch #1 try to add pin support which should handle pin mux, while patch #2
adjust drive strength and schmitter trigger settings accordingly for new SoC.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v2:
- RFC tag removed
- update dt-binding docs for drive strength
- fix wrong argument for drive strength
- Link to v1: https://lore.kernel.org/r/20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org

---
Yixun Lan (3):
      dt-bindings: pinctrl: spacemit: add K3 SoC support
      pinctrl: spacemit: k3: add initial pin support
      pinctrl: spacemit: k3: adjust drive strength and schmitter trigger

 .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      |  12 +-
 drivers/pinctrl/spacemit/Kconfig                   |   4 +-
 drivers/pinctrl/spacemit/pinctrl-k1.c              | 517 +++++++++++++++++++--
 3 files changed, 477 insertions(+), 56 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251125-02-k3-pinctrl-738cbddbe49d

Best regards,
-- 
Yixun Lan


