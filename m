Return-Path: <linux-gpio+bounces-11594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D103D9A3814
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 10:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30456B21425
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B8E18CC1E;
	Fri, 18 Oct 2024 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NW43lSKE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF0313C816;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729239054; cv=none; b=gIer4Z6cRuVqSuxjQdM6sL52HWLjcrU/AQmVrnqkr2eBq0raXtf4+7j7e56Ce4Fr1yukUYFT67gO8wI/fG2sS2IkLpyq/tn1uqhiRZG2ug80/+0oEa1dKT+Ro+gxrUfnHyCz4jRtgT/QS9vE1mqdd2lE6V0WFyWDIPF0MdB/lPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729239054; c=relaxed/simple;
	bh=0jSZIq74UoBUGP7sVuPkM+U0ov+Rh81ZaHUpjUfRr1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bf6CVsb6po5Dfp7zGZF82s/ouhmwxP1r+33ZYNosFJqVDmEGDBoSLyZ/p7T2JmtZW6zpDNVbyo/1MghZw65j0WvzJc7Nyp1mJxqcBGIO8lzRmisvK+DaAeAasfHKpGu1pC3MO31WqX9TNeQ/q29V/PRKAUGiNtgzNYMP53FVaCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NW43lSKE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E7A3C4CECF;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729239053;
	bh=0jSZIq74UoBUGP7sVuPkM+U0ov+Rh81ZaHUpjUfRr1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NW43lSKEVVqmmj6zeh0xKJQv/zwcvhdRoZ0akAAS6LEV6hoSQ0WD3KffUj6ioOKFg
	 9kEvnHHYVJDT2rztqn1lwQrxNg1AGFFRz7bI0KdvUyJ9GpWXxp1WfHhP7UEgZzqNzb
	 F175ZEOVeYUPzygRGQ8pNCNpwmon0dVJ+62PU0Kjy85+sTdlx7FMgNn8uk/p33tyVK
	 9mOru02j20zhvHBOXoVP6VSYPTblXAmORzBQbS/WeQKEJkonqwiCSxznP+oIY6sB6K
	 V1IXdGqWGe/rpZyQeWh2Ob0KcV6098p0+WjDJtYhTUx8U6QMJeWhIWzcX5r0N9kg5v
	 rZPQVIOcWi1Jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B95D2A53A;
	Fri, 18 Oct 2024 08:10:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 18 Oct 2024 16:10:50 +0800
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
In-Reply-To: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729239051; l=946;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=erHuvYG/t/AVd4eUd14dcFM5SWvZGqssHP0bU7TcvIg=;
 b=QQK13099mw5FxDBedU9SIlHR292xdMjHxwMhyib4JdFOStJsapbeWZd8kEfxU2YcA5scA5VLp
 49+oeQuh/YxBxPGr3ZTa94juPul8ps9zbb4i1/314xKn9J5AbgAsoH9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the new compatible name for Amlogic A4 pin controller, and add
a new dt-binding header file which document the detail pin names.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
index d9e0b2c48e84..f5eefa0fab5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
@@ -15,6 +15,8 @@ allOf:
 properties:
   compatible:
     enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
       - amlogic,c3-periphs-pinctrl
       - amlogic,t7-periphs-pinctrl
       - amlogic,meson-a1-periphs-pinctrl

-- 
2.37.1



