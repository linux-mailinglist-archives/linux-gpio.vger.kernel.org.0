Return-Path: <linux-gpio+bounces-33188-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHMnByPFsWniFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33188-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:40:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C112697A0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4E933067734
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50B7375AA8;
	Wed, 11 Mar 2026 19:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TavCIgQW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC303043DC
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257978; cv=none; b=bYXBoz9BVeZAaW/QljhbXWfIXLtZYNy2PypoM1dweF5jf8bqva1lNp8ooUfgJ+Xt6OSotBdlfpyKvEm0LjDyyvtotIq5uR1BXwtHEL16xf2QYobV1q2BQZGWExmXyIZ5yNnW7grhj2O2JCtlT6ylf8pbMYNUzvkPbHDFH/qHs3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257978; c=relaxed/simple;
	bh=M5WfybRaNkVzKxgUIKGSz06vz2jfEwpqjGJn8yTFsck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U62y7XtiBkkWxjR8zpgFYJpwPp3Z7hTS0HCA4+leiyG9OEMk8isYBwE0ZqnLg9KmzWtjILtSo2LPH9x9HkcFEPinClenJygvpnmXwvNb2Gy17lTvvPAMV57QSktgN6WYSufdT7DsGOaSbVW1Ty3Bbu863IwgNzsZsyMUy9dWGTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TavCIgQW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso184605f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257974; x=1773862774; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lZkxqUuUbJ4Vbj2riO1raVFqanxfpUss3tcQOFPsGhg=;
        b=TavCIgQW4uVIwC/3wEAeWNi/yZy7ADvG1FRn93hvwPTSWODfg3IRk7GjUbZq3LT+yr
         Nfl81XQIojowbC+0K8YLV030JeTHHxqhw3EAhWfkeTsoXxiTevXrqN93cJ/F6E5Gs0XH
         fVHleyYV4aEjM6xOKnWqvHidjBgPWyYeKOuk2d3NviP/I/5Ept+MKK2kvoEc7ltVzMhy
         ViUlhRSYhydfGlg+K3rEKTyai4hZb5Q16mofqgDVnb1K20c/eWnm1EUXX2NmCN9m7FM6
         CzppDcpJ1Ec2Uegf/S5iHd4I46psQcHxLWrdIERw/2/V1DNte/yWvp6CBh3LRryEsMTi
         cVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257974; x=1773862774;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZkxqUuUbJ4Vbj2riO1raVFqanxfpUss3tcQOFPsGhg=;
        b=KtwVLgS6oYSZvB37cdk3FnQNxRPGFFVuk2tZGt8uBdNpfZ4IDPfhaomXg424tDUx0a
         k38fRO7a2xV3mkJNt85rjDYFJ8GT15HN/0R+O4yJjpMf5rxi4Uqli/3el372kv+GGbFS
         flHURTqlCdHMezSS99T90A1lXUqyRMcZ1X8l9D/TikWzDBZAoG6uvnK+iLDF+CDXblrB
         Q2TTFBSkaOCydYxxMEcyLYmpFnSIF8ohhLO0CM98l2/PShbKDyqE5MocdwNKqMmGSOcp
         LtDXil7KozoLkLx3SzWiKHbJ5RFq5+xsO//JIf6ory7G85gBOmPeKJqFnKccL1kn2B7T
         7jVA==
X-Forwarded-Encrypted: i=1; AJvYcCVzMobZhQZonwOiBqqzLkvHeCnWQ85XR062a3tzeyneb1kpQI7yXJT9W1H+zFxpx2R8jQnEZy2Kb7bP@vger.kernel.org
X-Gm-Message-State: AOJu0YztROVbbj4LEiQSWngMd3Nm4CX+MvUIz42FhKTZyDby018lHMnK
	ESahy2PwthKdYORfJ9h1z5lBMoMGHfh7X5ru95ay9Jv3ethMfAs7ufV1Yn/PUUS4uU8=
X-Gm-Gg: ATEYQzxGa6nMcNydiQJMOUaS2rW6VcJjTFTqGcSRkrgbGE6ghwaBHi/53+6UFkBf/7W
	//frr0yWScb0VLnPCXx6Fi2UuaouJ8KvpegNq2GXtArJ1vJPL+PJ/3guxo9uN3jg/PCzApNF72n
	w/kRloAh/GI+0RfzzXP9Y1ktFazh9E7N1iXkce8vQeNnqUl3Lcg4L6d6O7wlWx9Rc+OHMv6N6Kb
	5j7MIQ3m4dwuIFbHWx0yemJMSj/rvVzTPJqJP4TfPcHV9qO9Yx7jhaH8Q8WNa3N7wU1l5SyP304
	BPjd0Tnyc3uzVGN1wyDW+Bc03ff6Vqvn1lq0AwIox625vKznaF44PRRq4NUFWz5uVvcJSy4hLAP
	OSzp4fHHtMx4KDoUDtiXxwylIZVNa3WFXOecMOcn5JVyRrtmMecA17mYkI7ykUIyA6Y18jVVbFq
	lYoMlE1cPiZG2KbgR10tJnX0mB05uK
X-Received: by 2002:a05:600c:4e56:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-4854b0fafb9mr59007345e9.22.1773257973713;
        Wed, 11 Mar 2026 12:39:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0d4a37sm24019345e9.20.2026.03.11.12.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:39:33 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:39:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>, AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Alice Guo <alice.guo@nxp.com>, Anis Chali <chalianis1@gmail.com>,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Eoin Dickson <eoin.dickson@microchip.com>,
	Greg Malysa <malysagreg@gmail.com>,
	Ian Roberts <ian.roberts@timesys.com>, Jacky Bai <ping.bai@nxp.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Marek Vasut <marex@denx.de>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Oliver Gaskell <Oliver.Gaskell@analog.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Philip Molloy <philip.molloy@analog.com>,
	Ranjani Vaidyanathan <Ranjani.Vaidyanathan@nxp.com>,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>,
	Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de,
	Utsav Agarwal <utsav.agarwal@analog.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Yao Zi <me@ziyao.cc>,
	Yegor Yefremov <yegorslists@googlemail.com>, Ye Li <ye.li@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	arm-scmi@vger.kernel.org, linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2 0/4] u-boot: add SCMI GPIO/Pinctrl support
Message-ID: <cover.1773256350.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33188-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,analog.com,microchip.com,timesys.com,mailbox.org,denx.de,amarulasolutions.com,linaro.org,bp.renesas.com,altera.com,konsulko.com,lists.denx.de,foss.st.com,renesas.com,ziyao.cc,googlemail.com,intel.com,kernel.org,oss.qualcomm.com,vger.kernel.org,arm.com,amd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8C112697A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is an existing SCMI pinctrl driver in drivers/pinctrl/nxp/ which
lets you configure the initial state of the pins via device tree.  This
patchset is a more generic version which provides GPIO as well.

I wrote two small cleanup patches to the NXP driver, one which renamed
an enum and another which made some white space changes.

The next patch adds an pinctrl driver which lets you configure the
initial state for the pins.  But the main thing is that we need one
driver to handle the SCMI pinctrl protocol so the pinctrl driver does
this.

The last patch adds GPIO support over SCMI.

I tested this code using the SCP SCMI server on OP-TEE over Qemu.  I
created a custom mock pinctrl device in SCP.

Changes since v1:
Address Peng Fang's review comments.
Use the standard gpio-ranges to describe the pins instead of
inventing a custom format.

Dan Carpenter (4):
  scmi: pinctrl: add pinctrl message IDs
  scmi: update comments for scmi_pinctrl_config_set_in()
  scmi: pinctrl: add pinctrl driver for SCMI
  gpio: scmi: Add gpio_scmi driver

 drivers/firmware/scmi/Makefile            |   1 +
 drivers/firmware/scmi/pinctrl.c           | 365 +++++++++++++++++++++
 drivers/firmware/scmi/scmi_agent-uclass.c |   4 +-
 drivers/gpio/Kconfig                      |   6 +
 drivers/gpio/Makefile                     |   1 +
 drivers/gpio/gpio_scmi.c                  | 248 ++++++++++++++
 drivers/pinctrl/Kconfig                   |   9 +
 drivers/pinctrl/Makefile                  |   1 +
 drivers/pinctrl/nxp/pinctrl-imx-scmi.c    |   2 +-
 drivers/pinctrl/pinctrl-scmi.c            | 365 +++++++++++++++++++++
 include/scmi_agent-uclass.h               |   2 +-
 include/scmi_protocols.h                  | 379 +++++++++++++++++++++-
 12 files changed, 1371 insertions(+), 12 deletions(-)
 create mode 100644 drivers/firmware/scmi/pinctrl.c
 create mode 100644 drivers/gpio/gpio_scmi.c
 create mode 100644 drivers/pinctrl/pinctrl-scmi.c

-- 
2.51.0


