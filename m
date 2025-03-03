Return-Path: <linux-gpio+bounces-16893-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B4CA4B878
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 08:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 464E716AFEB
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 07:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DF91EA7C9;
	Mon,  3 Mar 2025 07:46:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC341D9663;
	Mon,  3 Mar 2025 07:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740987978; cv=none; b=tZ8CEjTys1tM6ntJAoES9WgAQDNwBJRNy9q9pTJ+x4UKRDpGRFGSnu90rMC9zFcNLPTGhfT+4JBXmKUoaN6z+3Y/i3oOCd4OEceHPctpP+CMDPGcBId+riJS1S8R2masiJjB/bQpz8LcJ5DLLeTLm44QElUoijmpzyqRaWQI/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740987978; c=relaxed/simple;
	bh=45/qDsmDCCyOu9HMAdSnCWnN/LJOZXdy7hLvXkjsEd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uLY0GlXBUMmktDanWxJsFtnR5PLnkExqjKn/2nNDSxRUTEA+jPEfRSOGk02cWMZOFdGagzx9sK9mFA+gJLuaqhZVV+NgQGXrJ1dbZ/I7ceqFqFO5aCpkL+xJTygpCk1H0fR9NtpM+Wlj1ygmQnRawZq5Fk2Q6ptnXYblSFHiHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.156])
	by gateway (Coremail) with SMTP id _____8DxOGo_XsVnqPmIAA--.38086S3;
	Mon, 03 Mar 2025 15:46:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.156])
	by front1 (Coremail) with SMTP id qMiowMAxzMQ7XsVn1GEzAA--.57437S2;
	Mon, 03 Mar 2025 15:46:04 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/2] dt-bindings: gpio: loongson: Add new loongson gpio chip compatible
Date: Mon,  3 Mar 2025 15:45:51 +0800
Message-ID: <20250303074552.3335186-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxzMQ7XsVn1GEzAA--.57437S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtw43uryrtF1UZFy8WF18Xrc_yoWDKFg_Ja
	4IkF4kCrs5AF9aq34jvr43Kry3X3yay3W3CFnxtF48Zw1jv3s8CFZ7Aw1YkryxXr45ur13
	ZFZ7Grn5AF1IgosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUc9a9UUUUU

Add the devicetree compatibles for Loongson-7A2000 and Loongson-3A6000
gpio chip.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
index cf3b1b270aa8..b68159600e2b 100644
--- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
@@ -20,7 +20,10 @@ properties:
           - loongson,ls2k2000-gpio1
           - loongson,ls2k2000-gpio2
           - loongson,ls3a5000-gpio
+          - loongson,ls3a6000-gpio  # Loongson-3A6000 node GPIO
           - loongson,ls7a-gpio
+          - loongson,ls7a2000-gpio1 # LS7A2000 chipset GPIO
+          - loongson,ls7a2000-gpio2 # LS7A2000 ACPI GPIO
       - items:
           - const: loongson,ls2k1000-gpio
           - const: loongson,ls2k-gpio

base-commit: 8a5680bffb2f681688b5788751c767fc380ff9b7
-- 
2.47.1


