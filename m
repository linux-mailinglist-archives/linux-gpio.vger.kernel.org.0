Return-Path: <linux-gpio+bounces-11179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D13F99A33C
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EB3A1C20E3E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB62921500F;
	Fri, 11 Oct 2024 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXbYvKDC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A4A19923C;
	Fri, 11 Oct 2024 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728648342; cv=none; b=kiUriHrIsFnKp3KNQAS7BhiRqLBoRvu3hg+KV1W08qwPqoPkgrGao85WaUSrGixQNNbJ85jgcM4NEJ73xvXxGFsi+UwKru1G8dIGghtNnp1K+mrSBtOUwtR/ZF9ttPFf6iAfZSd6rgowMPXeBhJl/UgTOTboXR7iXF2qd2HlrWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728648342; c=relaxed/simple;
	bh=YFfS9e7Xy/HGqNY0ms5BgOEaQecnVNO9e9YPNo6MKHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YK5Bke6gdPFYpIU1iUhfblwObIS50ldQ8caIb5ke0pFKadKKvHwWl64uFXkaeUOzlvPqvwkvO48rO9a8oN0SpcKWEOj0cSeKRHou5YcvoWhIJW0aGs9EuWHB4s/mrWzyd+QX2B6qA/ThPbTqKHnoz7jKd6c8ItNkxpDffaqxGIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXbYvKDC; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so650809a12.2;
        Fri, 11 Oct 2024 05:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728648339; x=1729253139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knj4iyceQ5slQxHMWQ23f65+4O6ZSQmh9/DDT8JHkyk=;
        b=HXbYvKDCwb/MMYZ7Pyq14do1+p1HlEkxPHo70hNHAVuIhkdlA+bD4hlIMFoKLDqFGx
         ECdA3HknOdApjjjrMHOLJ6O7aKMDdA4aRJKf/EvwBpUXei/foJQf5LUKRZ4oIzOTN01w
         mlCzGn/1ubrURWeN30XDiDu2O3QfJVpKMUvX+XHUnDNQx46rip67d/qrflO7b2kaS5SA
         uSVoDMEgJp+LPvA8VF4e1tqAlPPHGfrqHiR6YJ91mm3BjeCqrxAHltoYjA7Q5aM2rtLj
         QINzGvrThllLlEmvEzW5QGQ9VStRIu578zBISOtuFtE9dmmtDAgWbNdtJT5SWPJIQfUG
         iEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728648339; x=1729253139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knj4iyceQ5slQxHMWQ23f65+4O6ZSQmh9/DDT8JHkyk=;
        b=h7t7hC4EEhu5XWonb2G/ghjY5Sh+yBcCfNf8AWxUm219mWGODUVOI+eWMMn2L6LKDr
         VQYnAREkghdBviP/uFUnHcmtCv3ps1qCpkR1dxmkV3ulAGu+fg5wIdIHv1FCZZ989Eo7
         gmf1YrQldxXVaB9aAwxCzufhB9nS9cSIbuC++PJfTsOzf3Coq/xxs7VxFfw126WWC+H2
         JDEiOsyp5eO0r9cCMa22yA7hfs43H9LOu8UoTjpii/iCjIbp1P8r/FEfCxxMjvHVCv9z
         F3tE3jyNWW1lFUgA35EnhFvRGsFZIh1GEpbGV3CTg17Qka1bo1+sYGVynUQ8z2TZ6noi
         CIMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKwLMi6sh1WtBzQeGmqxNJAcyYNlS2UjamriJzKdM0Xi3wI5v4ZpZix/S7S7AAIK74nKf9qzd+5kCuPg==@vger.kernel.org, AJvYcCUb0b/4B+LDELjW5csJRRkJJmq6vHBKW5QnVpCP7C7e+5JOAhAw72fTJ4kc67TD+2O3sjDqBbScRJKd/+eg@vger.kernel.org, AJvYcCVHnZk5cgmc6x0MvOr3BB19OvOit3PPRAC9xUySqXIb7Dcwg9Eaau7NpnkthckxrxIs//xqVHXz5PV9@vger.kernel.org
X-Gm-Message-State: AOJu0YzqUpD9kSM4wEvEBwKKdNVDCc9hkUerYU1ggtpUw9jSMLaEobDJ
	jHTd79EeaXCKhZqKmIUYg0ekoZe9lK7dZ2WAe4iJyewAxLobkvVZ/oGRtL0c04k=
X-Google-Smtp-Source: AGHT+IGMP8cyZjEIxPba+iTIKgstjGnGcwHKJB1zqw/qhTxhHKDo0hhPTQXebtPL0aKrYHvp68eRpw==
X-Received: by 2002:a17:907:9610:b0:a99:90b6:1b10 with SMTP id a640c23a62f3a-a99b8eea8bcmr224593366b.0.1728648338769;
        Fri, 11 Oct 2024 05:05:38 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99b804ea59sm88962366b.151.2024.10.11.05.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 05:05:37 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/8] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Fri, 11 Oct 2024 15:03:45 +0300
Message-ID: <20241011120520.140318-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Yassine Oudjana (8):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT
    bindings
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek: Add bindings for MT6735 pin controller
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6735 pin
    controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  191 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  228 -
 MAINTAINERS                                   |    9 +
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |   20 +-
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++
 9 files changed, 6221 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

-- 
2.46.2


