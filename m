Return-Path: <linux-gpio+bounces-37721-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDNMHAf7GmoZ+QgAu9opvQ
	(envelope-from <linux-gpio+bounces-37721-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:58:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1289E60D987
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 16:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2862B3010BF8
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 14:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0B931079B;
	Sat, 30 May 2026 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkGczEAV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45DD3019A9
	for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153090; cv=none; b=GGU+GTMHzI1pj3qyJtkg0IEKfoeyQzgJVHeySYDa0002v2C6+QePeJHRGwQaDrNvZ0gVK/JHcXw5nUsz8ws9GT8Ky/uBQqJnXJctm7kIiDYyUp3ly9yti6iI87xZ0O60RsYmV4bOh2yM0RpLgsi+ZI9ZYb/d5QHv7mTK7nO2utE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153090; c=relaxed/simple;
	bh=NoCwL6dQdN9+HmFTRjZInOB9QFBV1zFmLO85nr/gL64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B9eOFec3V79xELkHpNe5HQvnsASYeafDSIXbAcyoA7M1Br0+CGCpr6txGdUrvmrlbaSqDKucfM1NC+MoUd0CJEe4vWp6eNV652kJdxcP3Dz5y0IT/+YSqXoe5FSbP+4icMgNSRjIEbw613BWFc9MlzEh2qe2LR2mXjaqloZfSWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkGczEAV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45ef6565cfdso525345f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 30 May 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153087; x=1780757887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFR/U1cx5enDuXpii0x1sB2/KzICG5y6hNgK8upvP6Q=;
        b=OkGczEAVk8gbuOu4CUv667UPruT54fw79NPd4UxGTmg/Q/mb1amj6Bj5tuvJngDirw
         WOMCDE36eB4MHetJrvFHDA+sgmb4YZqQMyaSwcubKna6oY5nkxcoQCk0UsjDpvXpWFCZ
         mOaF7gqktGEZBTFjkiH+YLWKOYfqAuq5D0d7zy2PDXEqV5fITIPxZ8wLDzRXJkfhDtyC
         tHjCQHiPJoAjdtc33k42GhmbrH1fqOp2xkVBZFAeipnVXooDUrCp23QTuL5qs9k0iv4k
         LrG0yp46KYu30uQJ6Ln0BUsf4olND7iLK5X3KSXV+oCgj1ls0rSWAtUaCxGRPVk4c9v1
         R08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153087; x=1780757887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFR/U1cx5enDuXpii0x1sB2/KzICG5y6hNgK8upvP6Q=;
        b=pQc3mLLfpA/Q90Nq+ngA52EOpNth5Ao9Ibo56UzB/JzLPhTwGhkQKQs38MeCi1wo3W
         3pK8m+KmavgWB3oxdr+MmXTefxiOOvW2SyTMCJx7cz9Al0M03UEL8HQGZNBOuYSAoeNV
         hbM2NivZBbNBV7L963pOGRMC57YP3WQoSHLx+CpP5PUJmNv9AkV1ja09R5suhF8+sv/b
         fDyXgMZH6SXcPDuaTHcshzTv5wZDZtws+5p/8busuLtSWEa3pWoiGQ+QEiZAvl2hUUdM
         K19FHHD+zp2rJN0mVZb9XNuuoOEtJt7uuXNk1uhpkMXEXdlBiUUGNe4FG7ovDBRd3PCa
         h4Hg==
X-Forwarded-Encrypted: i=1; AFNElJ9PI2j1Ac1IExsMPakYjp1UOideva6AHbtJuv/pyQyAF4OrNesyXfvRcLS8TRgflXs/DM2duRrQJk3a@vger.kernel.org
X-Gm-Message-State: AOJu0YxUDusKbjW6brZzbUouw4SYVb5UAnvdPqRcMOB5csDj6A7v9Y1d
	JEIZRC8BM/Dq1O46tAWGeSEynSm7YKVdq6c2yL8OEki9puhV1AlV2zdm
X-Gm-Gg: Acq92OH8/fL/5e5rEdbeW1ryfHKza79jLK7cHb4OyOhhuhh0V1d+hmauI4ON8ydliJf
	B//DA/F6G9PeOUnEQwwg8Jxo/pjeyw1dC/oBOTFx0Jlp1pbFNJzEMsTB9b4XDLH+1GAxU3ssvGi
	2bMPU/uRjYEJQ6KCw1Py5GjTKuX46RGJyboavnqitDjiLWOmesHylOsvJN31z/Ustd3QFin4xBl
	15MAVOTBWZUzxHFOORjXkCQu56YOHyP9u3hv9WZtmgI1FOaZsifQLCNGNiRlCYy6Licpws47KfA
	vKa7wG375TnH5oRL0b1KZl/s/+3zbyi3QE5Z1N9KeFMYFypQgMQ/bsMpM7gN/lpGz8Rv9xBDdLJ
	kftkbCnhxHa8qhtzB3C7qeyUQjCrdB6vh4X2BL7sbnt0k63c2+qn457bloWldb6eiJwCZjN4cGX
	Akv7hAU+EdhSqiDxVoZuE2YIH9yUtjhaM=
X-Received: by 2002:a05:6000:e88:b0:45e:73b4:e731 with SMTP id ffacd0b85a97d-45ef6b16255mr5752925f8f.14.1780153086827;
        Sat, 30 May 2026 07:58:06 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:06 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 0/6] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Sat, 30 May 2026 16:57:52 +0200
Message-ID: <20260530145800.1029920-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37721-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,mediatek.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[protonmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yassineoudjana@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1289E60D987
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision) can
be found here[1].

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names. Necessary cleanup is done along the way.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v7:
 - Wrap &mtk_paris_pinctrl_pm_ops with pm_sleep_ptr to fix build error reported
   by kernel test robot.
Changes since v6:
 - Mention changing MT6797 DT in 1st patch commit message.
 - Squash MT6735 DT binding patches.
 - Add debounce time to eint_hw struct. MT6735 supports the same debounce
   times as MT6765 so reuse debounce_time_mt6765.
Changes since v5:
 - Revise and fix all register bits for all group register types (IES, SMT,
   RDSEL, TDSEL, PUPD_R0_R1, PULLEN and PULLSEL).
 - Add pull_type array.
 - Use proper getters/setters for bias and drive.
 - Add minItems for MT6795 interrupts.
Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to the top
   level definition then adding maxItems: 2 under the MT6795 condition causes a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindings
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.
Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (6):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek: Add bindings for MT6735 pin controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  152 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  228 -
 MAINTAINERS                                   |    9 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++
 8 files changed, 6172 insertions(+), 245 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

-- 
2.54.0


