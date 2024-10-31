Return-Path: <linux-gpio+bounces-12383-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F8D9B7DEE
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 16:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B9A8B22792
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 15:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040941A4F0C;
	Thu, 31 Oct 2024 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="sX1MyztR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14331A2C0B;
	Thu, 31 Oct 2024 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387575; cv=none; b=AKWzH9xvf/UUUUaBDZZa1qNr4QVyxq/O/PvPzuMjyNPsxt7FtFVIu+yiWSldzTDtSUHM59mEK9CrgHHdRoKv/3+ywJvxtc+yDDiO+kC4wlJnulgeJfK3OdGy0M4eyGtB5aj6uLzAX0KV30zH/GPrjjagQqAJmEjYhGSJjcjZHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387575; c=relaxed/simple;
	bh=+tb4/izulaz8mMVSG9eoJPnS/r8Ktb86Kc+teB6gjaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AZzPfTlrpTviOY+qRGRDYzH7JjgBawZX1qzaoq6m9aN2Ir/lkwFUeCZBliUMb5OBWJtY36Q38qySk8fmxxxtZelIRQvdkCtkAAy+l5nCWm3+CwFKIkj2219eNS7n72AON42M2t25cUXNmnTQh3GwIT2LL23RWWlNvBBEvSBi0PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=sX1MyztR; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from localhost.localdomain (89-186-114-4.pool.digikabel.hu [89.186.114.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7BD60891A9;
	Thu, 31 Oct 2024 16:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730387572;
	bh=uevbiNgUO6wSdVaAf7xsYSMjvK/4kt7IKBZ5U10VuEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sX1MyztR4riwYZ7O8vwQ1YRR7Q3zHDTvgijYeRu3fGqWSk7E7lCzyDus0gqzuA0g/
	 e35ChnAd7hXShkKxLNiLlrNQqXBgxJntzrnSk+ClnOcMYdfKX8tiPopetOuX/XKBMk
	 g+7N2etqbEbZgLAomJrB9ol21vbO9sEAusnnuvflK75ZjWBoNMsChBnesLXd+swHnY
	 fvdTDWbQ5DM81MFiW/x1f8ebgNt4OQndkQk1l0EuUpKcmagPXeqEcoEY+ZxkyEd85Y
	 46zTh9WPV9jh7zt/pF+0MEogw6na70qFjrlZg7cmGkMHFYTIhNaUNUH8hLnnIw/aSH
	 LRoEiuHIA4OcA==
From: Heiko Schocher <hs@denx.de>
To: linux-kernel@vger.kernel.org
Cc: Heiko Schocher <hs@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sx150xq: allow gpio line naming
Date: Thu, 31 Oct 2024 16:12:36 +0100
Message-Id: <20241031151238.67753-3-hs@denx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241031151238.67753-1-hs@denx.de>
References: <20241031151238.67753-1-hs@denx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Adding gpio-line-names property works fine for this
device node, but dtb check drops warning:

'gpio-line-names' does not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/pinctrl/semtech,sx1501q.yaml#

Allow to add property gpio-line-names for this devices.

Signed-off-by: Heiko Schocher <hs@denx.de>

---
checkpatch shows
WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
'gpio-line-names' does not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'

Ignored, as it is a make output, which helps to understand the
reason for adding this patch.

Changes in v2:
patch dt-bindings: pinctrl: sx150xq: allow gpio line naming new in v2

 .../devicetree/bindings/pinctrl/semtech,sx1501q.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
index 4214d7311f6b..fd0936545bb8 100644
--- a/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
@@ -26,6 +26,10 @@ properties:
   reg:
     maxItems: 1
 
+  gpio-line-names:
+    minItems: 1
+    maxItems: 17
+
   interrupts:
     maxItems: 1
 
-- 
2.20.1


