Return-Path: <linux-gpio+bounces-17290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16FA57CD5
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F5563A54F7
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 18:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185771F5848;
	Sat,  8 Mar 2025 18:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyNlnN1V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99CA1EB5C3;
	Sat,  8 Mar 2025 18:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741458872; cv=none; b=aUay+tLIpmx64Ht/VlEI9Vigem5e+zztqJ7JUaWHYXNQMnquMOsiXNbH0/wmV6qQ5pQjyLRlnl6gIeJ+sFoB3aGMeufGe89M+AWvssy8mg073KFZ8hPToY9CMqJsVFfUBNYzcqNEY69cWjc5AFPx1OyhYOQ/U3/7G9hUbPtpp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741458872; c=relaxed/simple;
	bh=NZUEtbJq5bu1tJCRUKEYacZtpI3V7Bf5yJ2ZzcKmhtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cHp91eMpXHaKFPipx/Du7q+DUIeNjpk9bQYnBnAQQgskuGkDqkTNfDiqR6Sk7VvZHw5/ch0oX/i3NOk7/DG8xWD/fvOXiDZG8QFZxytoyvPLjKxK7t2p37xZg6Paz5BUrERZeEryUqpZ/4usuorDSwXuxqwz4xX7KyZxp/U8ktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyNlnN1V; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaecf50578eso526311766b.2;
        Sat, 08 Mar 2025 10:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458869; x=1742063669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnph4Pjkh7NDe/vO7CvtB8Q7vW3zaR6uOeHtknwGb3Q=;
        b=iyNlnN1VqV2bIxYwWLokUawiK9IdDV0OxAwQ8TrfAcGS0j4c7cGSv1jAedrDMV4eID
         Bm5Ocw3iZxlZcR3mTr12VjdjfjgBhs5MNFB87IY7XwRflB0Q1IOzgSzcT1HfxkOOPPw0
         NruKYPijrmqfuqKZYZ20U/Y+k+XYlWP7rZHtBJadlD6Zo58xuAND4nc9Ski9HL+oH3G5
         ThNvKybjCSy0iSuJyO21VY7f8q76JyTt9YOvIxncULD49/mKF3TaTuWr/PlveKWZt5t3
         Liwu2TlPwU5WjkYJ/AcUdGEGVMUdHJvfFDHNhsCeDzbuyf69iNKSEPrCSG30ecBLdalU
         W9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458869; x=1742063669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnph4Pjkh7NDe/vO7CvtB8Q7vW3zaR6uOeHtknwGb3Q=;
        b=m0S7avk7WCZL/czkyfmzSOzE/kgDR7eeBhFm6haMSkWN8i3e1qLPDPNbYE9gs4HS2m
         OfkXdhM6M7A48qNJ1S4ee/t3QlqP+j6U1kM3jgVIiHWbg34MgOFyv/GP5KtpIij4cHAX
         4/xO9O3aASA0a3wJJFzoDSbzC/rzuXaKYDzDnn4DGwZtdGbZyxeV1n2cJkzN8kSE/R57
         dnLN/wQcCp1mp2nA29ebUvMM2QW+jwOvMnb8mwBA2C7SH3ghs2Lyrp9O+6EkFTbjg8M5
         Ku1FdkEC/D8xH9uHlb3wt5xxJVgwwqidWxpzVbUFMk0GNFLAhMRbZ3maeSq4y9Ubx4nz
         RWRw==
X-Forwarded-Encrypted: i=1; AJvYcCUNm6c8zKct85ylfkyFBXRrcuCi9jVnIj5zK9nPtncscuKp0XJKPzTxI979EglRcRMFfQB6+oIn0RPEKg==@vger.kernel.org, AJvYcCUuAX40wyGvNnBLD/LczQq9T1OsKHwNdtFyijGw7mC7LddKw0W7a3nHW3kqIXm1Qs2j1ns0VLuA3aoN@vger.kernel.org, AJvYcCW/nJaVrMKKC/zmf2HrKLn1VQYHCUC8EiPjaSmNW4ZhxMjFS8iKUXfROWf9oDAbfVTxrWQ81+RQrJ8mctXD@vger.kernel.org, AJvYcCX00YXCjWDWObc0ivLNx4WMVV6zgZME0pbahxLSIQC1mT4zyue8nNCxvyu/ZlzW+ZEf42h+P1LlDmI9mm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgTC4zKdPxbt8Px+62bC8/qn9OlhORzVuwBx43pCe0rLqAXX7Z
	xIgoMtk7WFADbI9kmGOVdytIn+QC2ypnMcL3eZhQObiT8hk5dwmx
X-Gm-Gg: ASbGncucz4KkU8/9/qpTCsL180cQiPlaBHWAi1cJSvgqZ/wzjXrR4N8TFRzLCyybhLW
	SgCPokci3k1mSHOHW0du9HP49oY7x+M09TOFDROsEW7SbSkutonQ9GwvLj6FKT91QnZTUXCygUi
	2nMrHN4pgdn+RRL1s5veG1kHPx4rHj5hoDB2e1moWq9xcQu7xd4KPnUaQeTRQdIXNdeCACl41Ys
	jpCL+o0p9tzBnlE8ITuc+Y5cAItysmsnV8f/TXcKLHcoHSgh56/tpYZnOF/7FPYoneFnU2Et4aB
	FtQ0jIPgxT62zbAP6m537vppkBXWzxDvUEq+K0tSyvhlaGJQi6gj0cWvyw==
X-Google-Smtp-Source: AGHT+IFlQa0WMb2+wSlKNfDHlapXAeQqbXw15a3LXATAfKzeJE3GltkLPgSDOpIdBu646StR1yvVuA==
X-Received: by 2002:a17:906:dc8e:b0:abf:6ec7:65e9 with SMTP id a640c23a62f3a-ac252f8f556mr813756566b.43.1741458868737;
        Sat, 08 Mar 2025 10:34:28 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:34:28 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 00/24] media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
Date: Sat,  8 Mar 2025 20:33:29 +0200
Message-ID: <20250308183410.3013996-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
replacing the few GMSL2 drivers already in upstream, and introducing a
common framework that can be used to implement such GMSL chips, which
avoids code duplication while also adding support for previously
unsupported features.

While the normally acceptable and polite way would be to extend the
current mainline drivers, the choice was made here to add a totally new
set of drivers. The current drivers support only a small subset of the
possible features, and only a few devices, so the end result after
extending them would in any case be essentially fully rewritten, new
drivers.

This series depends on these two series:
 * https://lore.kernel.org/lkml/20250306-fpc202-v9-0-2779af6780f6@bootlin.com
 * https://lore.kernel.org/lkml/20250228151730.1874916-1-demonsingur@gmail.com

The following deserializers are supported:
 * MAX96712 (already exists in staging)
 * MAX96714 (already exists)
 * MAX96716 (GMSL2)
 * MAX96724 (part of existing MAX96712 driver)
 * MAX9296A (GMSL2)
 * MAX96792A (GMSL3)

The following serializers are supported:
 * MAX96717 (already exists)
 * MAX9295A (GMSL2)
 * MAX96793 (GMSL3)

Missing features:
 * The current TPG implementation makes use of the V4L2_CID_TEST_PATTERN
   V4L2 control. With V4L2 streams support added, we would like to hook
   up TPG using the internal pad feature which has not been accepted
   upstream yet. We decided to leave TPG out for the moment and add it
   back after internal pads have been accepted.

Known backward compatibility breakages:
 * No default routing. Default routing has been intentionally ommitted
   as the devices support quite complex routing and it would be
   unfeasible to provide sane defaults for multi-link deserialziers.
   It is expected that userspace programs would set appropritate
   routing. 

The following list enumerates new features that are supported by the
common framework and their respective chip-specific drivers:
 * Full Streams API support. Most deserializers have support for more
   than one link, and more than one PHY. Streams support allows
   configuration of routing between these links and PHYs.

 * .get_frame_desc() support. Both the serializers and deserializers
   implement this to query and provide frame descriptor data. This is
   used in features explained in-depth below.

 * .get_mbus_config() support. The deserializers implement this to allow
   upstream devices to query the link frequency of its pads.

 * Address translation with I2C ATR for the serializers.

 * I2C MUX where supported by the hardware for deserializers, otherwise
   I2C ATR translation - some deserializers cannot do muxing since I2C
   communication channel masking is not available per-link, and the only
   other way to select links is to turn them off, causing link resets.
   For such cases, I2C ATR is used to change the address of
   the serializers at probe time.

 * Automatic VC remapping on the deserializers. VCs are picked so that
   if they were unique on the sink pad, they will end up as unique on
   the source pad they are routed to too, prioritizing using the same
   VC ID as the sink pad, to facilitate the possibility of using tunnel
   mode.

 * Automatic pixel mode / tunnel mode selection. Tunnel mode is used
   when VC IDs do not need to be changed and all hardware supports
   tunnel mode, otherwise, pixel mode is used. The serializers are
   automatically switched between the two by using a private API.

 * Automatic double mode selection. In pixel mode, double mode can be
   used to pack two pixels into a single data unit, optimizing bandwidth
   usage. The serializers are automatically set up to support the double
   modes determined by the deserializers using a private API.

 * Automatic data padding. In pixel mode, if the data being transferred
   uses two different BPPs, data needs to be padded. The serializers
   automatically set this up depending on the configured double mode
   settings and incoming data types.

 * Logging. Both the deserializers and serializers implement the V4L2
   .log_status() ops to allow debugging of the internal state and
   important chip status registers.

 * PHY modes. Deserializer chips commonly have more than a single PHY.
   The firmware ports are parsed to determine the modes in which to
   configure the PHYs (2x4, 4x2, 1x4+2x2, 2x2+1x4, and variations using
   fewer lanes).

 * Serializer pinctrl. Serializers implement pinctrl to allow setting
   configs which would otherwise be inaccessible through GPIO: TX/RX via
   GMSL link, pull-up & pull-down (with strength), open-drain &
   push-pull, slew rate, RCLK pin selection.

The drivers have been tested on the following hardware combinations, but
further testing is welcome to ensure no / minimal breakage:
 * Raspberry Pi 5 + MAX96724 + 4xMAX96717 + 4xIMX219
 * Raspberry Pi 5 + MAX96792A + 1xMAX96793 + 1xMAX96717 + 2xIMX219
 * Raspberry Pi 5 + MAX96792A + 2xMAX96717 + 2xIMX219
 * Renesas V4H + MAX96712 + 2xMAX96717 + 2xIMX219 

Analog Devices is taking responsibility for the maintenance of these
drivers and common framework, and plans to add support for new
broad-market chips on top of them.

Special thanks go to Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
for testing the drivers, helping debug and coming up with ideas /
implementations for various features.

Cosmin Tanislav (24):
  dt-bindings: media: i2c: max96717: add myself as maintainer
  dt-bindings: media: i2c: max96717: reflow text
  dt-bindings: media: i2c: max96717: add support for I2C ATR
  dt-bindings: media: i2c: max96717: add support for pinctrl/pinconf
  dt-bindings: media: i2c: max96717: add support for MAX9295A
  dt-bindings: media: i2c: max96717: add support for MAX96793
  dt-bindings: media: i2c: max96714: add myself as maintainer
  dt-bindings: media: i2c: max96714: reflow text
  dt-bindings: media: i2c: max96714: make i2c-gate conditional on
    compatible
  dt-bindings: media: i2c: max96714: make ports conditional on
    compatible
  dt-bindings: media: i2c: max96714: make supply conditional on
    compatible
  dt-bindings: media: i2c: max96714: add support for MAX9296A
  dt-bindings: media: i2c: max96714: add support for MAX96716A
  dt-bindings: media: i2c: max96714: add support for MAX96792A
  dt-bindings: media: i2c: max96712: add myself as maintainer
  dt-bindings: media: i2c: max96712: use pattern properties for input
    ports
  dt-bindings: media: i2c: max96712: increase number of output ports
  dt-bindings: media: i2c: max96712: add support for I2C MUX
  dt-bindings: media: i2c: max96712: add support for POC supplies
  media: i2c: add Maxim GMSL2/3 serializer and deserializer drivers
  arm64: defconfig: disable deprecated MAX96712 driver
  staging: media: remove MAX96712 driver
  media: i2c: remove MAX96717 driver
  media: i2c: remove MAX96714 driver

 .../bindings/media/i2c/maxim,max96712.yaml    |   49 +-
 .../bindings/media/i2c/maxim,max96714.yaml    |  245 +-
 .../media/i2c/maxim,max96717-pinctrl.yaml     |   71 +
 .../bindings/media/i2c/maxim,max96717.yaml    |   75 +-
 MAINTAINERS                                   |   13 +-
 arch/arm64/configs/defconfig                  |    1 -
 drivers/media/i2c/Kconfig                     |   34 +-
 drivers/media/i2c/Makefile                    |    3 +-
 drivers/media/i2c/max96714.c                  | 1024 --------
 drivers/media/i2c/max96717.c                  | 1103 --------
 drivers/media/i2c/maxim-serdes/Kconfig        |   53 +
 drivers/media/i2c/maxim-serdes/Makefile       |    6 +
 drivers/media/i2c/maxim-serdes/max9296a.c     | 1146 ++++++++
 drivers/media/i2c/maxim-serdes/max96717.c     | 1500 +++++++++++
 drivers/media/i2c/maxim-serdes/max96724.c     |  905 +++++++
 drivers/media/i2c/maxim-serdes/max_des.c      | 2321 +++++++++++++++++
 drivers/media/i2c/maxim-serdes/max_des.h      |  135 +
 drivers/media/i2c/maxim-serdes/max_ser.c      | 1584 +++++++++++
 drivers/media/i2c/maxim-serdes/max_ser.h      |  132 +
 drivers/media/i2c/maxim-serdes/max_serdes.c   |  302 +++
 drivers/media/i2c/maxim-serdes/max_serdes.h   |   88 +
 drivers/staging/media/Kconfig                 |    2 -
 drivers/staging/media/Makefile                |    1 -
 drivers/staging/media/max96712/Kconfig        |   14 -
 drivers/staging/media/max96712/Makefile       |    2 -
 drivers/staging/media/max96712/max96712.c     |  487 ----
 26 files changed, 8523 insertions(+), 2773 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/maxim,max96717-pinctrl.yaml
 delete mode 100644 drivers/media/i2c/max96714.c
 delete mode 100644 drivers/media/i2c/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/Kconfig
 create mode 100644 drivers/media/i2c/maxim-serdes/Makefile
 create mode 100644 drivers/media/i2c/maxim-serdes/max9296a.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96717.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max96724.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_des.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_ser.h
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.c
 create mode 100644 drivers/media/i2c/maxim-serdes/max_serdes.h
 delete mode 100644 drivers/staging/media/max96712/Kconfig
 delete mode 100644 drivers/staging/media/max96712/Makefile
 delete mode 100644 drivers/staging/media/max96712/max96712.c

-- 
2.48.1


