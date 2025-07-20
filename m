Return-Path: <linux-gpio+bounces-23536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D28BCB0B7F4
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 21:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 302363BCEAE
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Jul 2025 19:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D196E22172C;
	Sun, 20 Jul 2025 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMu/NQuR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35FA1D8E01
	for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 19:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753040320; cv=none; b=RNasV9uVgYK3chknPCZQl3VkYqbTH/pUYP53pDpz5NxyR3yvTPtKj6Jw4ogCFo7S6lA6r6nBlo251PipCalJFssas96PrNKMRMxtsIuUO3Pxn1U+dD1M0ZOp+bDvku4aR8KVGeHR48YQknJvn5QLdIXtz3YhzwIfCDByzk0PfGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753040320; c=relaxed/simple;
	bh=cPk3QUDJyicVsrvKeLaXhnNw3hfUKvYreFrFy6p94ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7o7Kx20lpKlCmCzIkRecKg+QZLgHjgrbH4ZtT31SLV6WyBqovkWlvk91r4g7qLTxvLMEZFo3rQTB9S4A82/mKqTaazbpUFZqbw0pE0UyiHTvfkaT0ztI1suie8lgJ5atz2mcVSvlp4Plr/Zf6zUkzffJ96QFevOBPcF3MXfk14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMu/NQuR; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73e82d2ec21so1492716a34.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Jul 2025 12:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040318; x=1753645118; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STF4EnqDyXKLMLeHRmPBDx0M84uZz7Y9ipuUY9uInvk=;
        b=mMu/NQuR0B6rRCqOBvW0hhQAicVcTUTSi2MHh7PVP6x5Tfbj4lTjx0O8KU6vXuW9NL
         P558OLDpFxDj7Lqsypv1AeOBL6LLx5idg2C+RSZKCxAllx0iXzsw/wKdl/N5R1tGBhaI
         7SX55Xid74pMpn6IqnRhqxeQXqdaxPYiTCdbrRG8pN3JacNGDMw+qxKS/EDwI0pHxynY
         OQIXfrbV54iLzaqtLeAgUELgfjYXd10kgmH1MmalvA56PRonLmMO85M8yVda0ZIFGqHr
         GIr6/9hBic3NbeYWNU3iqOhpkQPYG7lVYL4UhcSt5Q0LbtvQI/MSqCKaxnm00IFEL6/l
         +Axw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040318; x=1753645118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STF4EnqDyXKLMLeHRmPBDx0M84uZz7Y9ipuUY9uInvk=;
        b=oY3BxngeVDj1I2N3wNBL4plyem2rjyR5jW32ww4CiI61VEDd/vZJAfhtAdAgMEFs7y
         Nl6LZeh2QooIFEO0LZ6zMiS4EimO5BEu7HU7cndhRRKqDwhNUz+bbUP4wYotLAwUHQbJ
         SISXNH904qFstpMWSJdA3jHIWY5On09aMobZfKpkdu/aIHTmQqkMoid2Z4cZhp5tK2gG
         V9v7iQjovKVRrXLGycEJENA+mK8JHv+3G1Y68Hd86wH6ZVSdq3j+QqvtuJbgo2Pjlfev
         8gDq0qw0I7rfh6NGX39uucVxuMF8A5A3tqDTnDF4Jz2Zx7+YAz2U0CjUm2uFDl1Gsgpo
         kThg==
X-Forwarded-Encrypted: i=1; AJvYcCW9B4sYvQcZh0QNpt4vIU+00Y3puSaviJ/HS6a9L8/u0iaIotmYlih0c0FkwRZxa6Vmem6Fa/oxMVEh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxby3u68BJ8oXYX1RuE6HIYGrHFCulh3QPb/muRCo+G+nQRezVf
	NxnhdLM/pIFw/roeFkkUK9IEOQLR5PyF95yKduKFQPKfODI+fd91G8hDaHd2FO7Gqi4=
X-Gm-Gg: ASbGnctg8sK0Kby79nC3JkOzh5538FYsba6QX2PXQDM42/6ByzOuy9NBV2CxI7pnQef
	yCfLXfovpf9jn9iBCB5etG9U1kvM4qL4RM4LTEls+7J+uhwVfSGecPIuloy3EIc4SbnmL7BT1Da
	Cvm0gyBuR6cjv3ZFn9tG2SmGEOSeWVfHpe4E2raBG1WdtUuCI/yrBFu/q+XFIziK5AZrRe4O8tj
	BDQGwwK5Sv3IhYGP7+XGjwMP1e3botdtJ+WUXaavcylLPiwYEE6Fj++l8I6TdEqZdZPNuizcllH
	NZcnGZ2QGCDk9FhEUX+903z6qxWeo4xHrfizrvQ/PvUdk2Vb9sPrhhyetn8ijKEHD13V3ZsoDjP
	am6ep1/eJWs86sMC67iWvDg==
X-Google-Smtp-Source: AGHT+IFkKgtB3ObGVLZWp4E0IcFIPQvja+e9izOMOGhmXfiPr6edCos/deJ042mUxYWb2yIkng7kUw==
X-Received: by 2002:a05:6830:8313:b0:72b:9316:d596 with SMTP id 46e09a7af769-73e751b5161mr8602757a34.3.1753040317899;
        Sun, 20 Jul 2025 12:38:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-615bcc8c2dbsm1341831eaf.20.2025.07.20.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:36 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:28 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <cover.1753039612.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is version 2 of the RFC.  The main reason I'm sending this is because
there was a bug in the first version where it didn't calculate the offset
correctly so pins and groups weren't linked correctly.

I've also fixed a few style issues that people pointed out.

These patches are basically as ready as they can be.  The remaining thing
is to figure out the format to describe it in the device tree.  Actually
that's probably already done, somewhat because people are already using
SCMI pinctrl?

AKASHI Takahiro (1):
  pinctrl: introduce pinctrl_gpio_get_config()

Dan Carpenter (6):
  firmware: arm_scmi: move boiler plate code into the get info functions
  firmware: arm_scmi: add is_gpio() function
  pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: Add GPIO support
  pinctrl-scmi: remove unused struct member

 drivers/firmware/arm_scmi/pinctrl.c     | 142 +++++++++-------
 drivers/pinctrl/core.c                  |  31 ++++
 drivers/pinctrl/pinctrl-scmi.c          | 213 +++++++++++++++++++++++-
 include/linux/pinctrl/consumer.h        |   9 +
 include/linux/pinctrl/pinconf-generic.h |   3 +
 include/linux/scmi_protocol.h           |   2 +
 6 files changed, 331 insertions(+), 69 deletions(-)

-- 
2.47.2


