Return-Path: <linux-gpio+bounces-19594-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A871EAA9222
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 13:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25933B199D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 11:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97F8205E26;
	Mon,  5 May 2025 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlDKzhRO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF52202F8E
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 11:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746444991; cv=none; b=pi9KNJ5Fu0k8BQP4wYjYybd1VBsoWyDX2VgtVMeIk9gz2CMsZgpZpizO7ZPVgketQgl9MF0lKUvvJ/oE6B1MPkWbwyS7C98cfgVRjMpbr+DajkZQNsr/pto4tY50/qJmMgf4zulFJrvBwgsDGsO/J0XQ0jDvNmXP89RL+c0Ux/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746444991; c=relaxed/simple;
	bh=zuCdXEp8oxjwTwvlSnJyhAOkN3XymDG3iNn3ScHm9cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INCmixXI3i0GSlEGkPXsChryyJlNuM1krxX29VBSmNvAUIGiL0+f75CnZOUWckkm9emercIHnkfZpMiyxi2j47eTs1Iohxh+nNClQh5JjZHy6Z+ttSREvrAVD71l+2ivxsW9xM9WVDcA/Df89uX9sipRPlYrtLbo1Ov/sJywc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlDKzhRO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3124242f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746444988; x=1747049788; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=BlDKzhROPgj63Qi8osl3tM0CkRqn1+DgoANwUklUG/OCNhueE174WCG67rRJiNpCJm
         ldhMXcQRAY6UKIalE2tNWkgKmJrrgLDgyYt9yIXyCBSmp/Qm4o0eV4m+hWF/STjEUMTZ
         TkfXq8RoMNK55hrl6zKeRLjGo8j3f1/uMy0+UO9OfL1cOYWFb/qDN+YqUSZ1MU8d/Act
         wUFDjADKtQize+Rh7NoPNk1mPP63iXMot8AVCP9UW/+0AC8VO3rKogyuGcO2YZw+mVGJ
         +4POIP04uBAC864UlB/9WNAWOkxvqsjsveQiJHKRXLXRPUiSVJQJzfgPz10jrDHtuNeg
         KP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746444988; x=1747049788;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4phepmZTHC5vAkftNyMA1bQszjxAUxrRFlBPTX3DOUc=;
        b=WMjjIL6u7j96OZh4ZtC+wefgWpiYtoRY2f6Uh8Sof0aNOoe8fcMRu59O6N+eaw3nBH
         PBHy4ZWZ4StDtxLESAHjtQr/Eu24W8sFzfvkkZjSvjaGBPTdkP4MRp+dnBR1bBjDSAK3
         yd1B+Q/P+JUIUtFCyKEgHzhKRGL/vmIjORtaIBREsLlNau/CjIyCFY6EQoSNCuuzNnQW
         LmoNK8uJMF/FgVcxOpN8XfaHFSPm7M6tdQ3POMygbEfGzq8nMw/N//vrSF35goAYD6eR
         51jhND1LvSyUD+HtAQ2uC3aNjmqR3jRckZOSIWKl+d113S43NX0GnGU7f71dIZh9difu
         yxJA==
X-Forwarded-Encrypted: i=1; AJvYcCV9J9OzDz/ACx0qgnbEYqWUUmr6RpbmOIkteQnUcsjK1FdUVm/7FE1eJn6rEn5GJeFIz0lOYJlqBd28@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Np1/yphbB+ibcI2DoR8gzHnUmhTBLf2vO6aKTybLM032/urV
	RcZ6pIDusWWmlR517EnCfwtZiG1EXV9ikRCro7jHyTFNrHNcYq6TlZNYFZO9C20=
X-Gm-Gg: ASbGncu23BGDD5Hbgc9ltGkhT4+87MFAX8l9fKrlPR9rzC5lOEj1KP9lTl1bcO+KyYb
	QWEoJzRD76RPxvtgwKKV/ml2cCtIfPezhUSjOAJEYCmQ9lLdJtNiyFWAOn0dLZfI1OOHN3ON7Yv
	0SAsLaddz5FwaZS33+h5q7DQRLsSU3fYBOYD2R2jLYOmvmTSmTNVwW/qrl19GfOvwwbaHBEhQkH
	mr3wCU323t+KnXzNOjSpn7r0IEs8YYfpUm14HaRpO3HV+sx2ERSJ/ynYJIs6vyrtJ/h4lEbDTMf
	tMe/Urb9SgiEVKzslC7hSp/53qB0bDe645syiz57Yx6ruA==
X-Google-Smtp-Source: AGHT+IHX3DPUoK2CBbvL9XMu5PuYfd3Tv12xdlZ7tadSos7vJLC5At+2jHITPcFn3QPH+KLU59woSg==
X-Received: by 2002:a5d:47a8:0:b0:399:7f44:5c74 with SMTP id ffacd0b85a97d-3a09cf3df66mr7016749f8f.55.1746444988093;
        Mon, 05 May 2025 04:36:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae3c1fsm10234470f8f.37.2025.05.05.04.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:36:27 -0700 (PDT)
Date: Mon, 5 May 2025 14:36:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Girish Pathak <Girish.Pathak@arm.com>, Peng Fan <peng.fan@nxp.com>,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: [RFC 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset adds GPIO support to the SCMI pin control driver.
AKASHI Takahiro did some of that work earlier, but we decided to make
this a part of the pinctrl driver instead of a separate GPIO driver.

I'm not really sure how the device tree stuff wires it all in.  I've
been using a mock driver on SCP with virtio to test it.

Dan Carpenter (7):
  firmware: arm_scmi: move boiler plate code into the get info functions
  firmware: arm_scmi: add is_gpio() function
  pinctrl: introduce pinctrl_gpio_get_config()
  pinctrl-scmi: implement PIN_CONFIG_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: Add GPIO support
  pinctrl-scmi: remove unused struct member

 drivers/firmware/arm_scmi/pinctrl.c     | 146 +++++++++-------
 drivers/pinctrl/core.c                  |  35 ++++
 drivers/pinctrl/pinctrl-scmi.c          | 213 +++++++++++++++++++++++-
 include/linux/pinctrl/consumer.h        |   9 +
 include/linux/pinctrl/pinconf-generic.h |   3 +
 include/linux/scmi_protocol.h           |   2 +
 6 files changed, 339 insertions(+), 69 deletions(-)

-- 
2.47.2


