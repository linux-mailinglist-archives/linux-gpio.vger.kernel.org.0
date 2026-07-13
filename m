Return-Path: <linux-gpio+bounces-39997-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ESDLDJIeVWq9kAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39997-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 19:21:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B954D74DF6D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 19:21:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=xofpQroK;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39997-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39997-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92C6D3046FE2
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 17:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B2E346E40;
	Mon, 13 Jul 2026 17:16:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEF92773DE
	for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 17:16:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963018; cv=none; b=kEzMfNcudylcOzETKOM3b2aDK+hj9td/tG5Yrrdk8pmpuvXYFqgTYO0e5d8Mn4effrjVdGB0SbJh3XTbXjx4yFgP3gMTuChxoH7eMO0WvuhNLAOrjqkb086pREB2iNlomLIjyq00Tupxz5f5e4JAdoOP8a5Cg2FVwRyd353wOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963018; c=relaxed/simple;
	bh=D2R8QizWQ1Oql3WPKOFAzvhJaMnvI8vie8NTAJWg3Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEU2ykVU5/raJts+bfVyinZM0SAl2ghd33mzFOJ34DFaC/upNNfOOJREp4UkWHkfQosHytP9uoOIT5Vlq5s1Nd+D3P8nXyDhAUHCf8u832OOszyPp21qv60D8jST9z7R20GNXmSjvI7PsdQPuZyWGOIPJJk2iIP0KqtQOU/mr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xofpQroK; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84867f07d63so3776715b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2026 10:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783963016; x=1784567816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=;
        b=xofpQroK4pwX9J6S9Vcf6aTb52C7dX8F49tJEuXn+7UCvrlGoSL5wOWiHE9AfQdA1F
         kcxdtKzrKb7xgcD6IP+Tv2BSOU/ouqnDzk+tEurIhV6AKunMbxsiIc6bJWKnFjH3Ju7E
         vnqi/8SDiV1thofzLe9w6sg+JwAxoBBByNbRUqKZgnTceVaGvqt9AzuhQVweFNbxJYir
         hV7cCGOg8vHJKDkwyBk8AbibWMTQA3Z3/HiElK6WSU8I3f72RwhMrDOe4tB4Fuy41iCe
         JnFm91Ky/R0uQxuUCaduXxgaJalnrD/IxIiHIrH2M3bUIW07M4Pv07XnIxEXIHkqc48Q
         3JeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963016; x=1784567816;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QMgQ2I83fSpv8VMH24bAJ52LUeteHATXzfSwUe6AnTM=;
        b=Y6h1x/umC3SYg3I2Q0Bm3piPJARZd1dcN4xeBrb7olTTjkv0eB0r2tszBNUS7iKdcN
         cJnviWiDVf8BbKZS/MhlsYAJ5u9KHc5Ky1toErGOqYzxut8LD3bHl7dmbxjzJCnPsF0C
         IYTCSmAzQBOi4ISLYDmFsdoPMVlIv63nMig6wEjiKeuwqBJr/gwgtrwC7UuR7nwdq2fG
         8k4Xs08vipF4V/W/BVPRCymEkRFvbDrkEOB/RdJRhunkaJxV1yHjb8dKZB5lCLasgzB2
         dolS+iUJ4Lo3VQixST3e+7Fu9SAX6s2lbIWac0TaXDKKiSN6gBAm/j0v/IQ4tHuSei3Q
         iS5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqmsvzZFRkc4D5HTrzHtfDdrGpIbTgh3Yf54DhhnCoCjAEjOzMnnLP+l2yUHzfednE9DWZ17vszfYfm@vger.kernel.org
X-Gm-Message-State: AOJu0YwWKjMqgOIFft3agHZQ3nqHA/cgN0630K9L3VugOhZwK+7cTpFf
	62JxlMsR2OFnikUq1JBuD6oOMxTWZeYRFux2iA7VQnO13mL7HZqJQTkdc6JNHQL2Kow=
X-Gm-Gg: AfdE7cnHXI1IXN860hecVbxVCVzyY3ItMfWrB5N97wsr4WmWOB5HZO8GHIi8F5zo1gb
	WOXPBhCOmfY14H5RqkTf6VBj6XZG93XlwZ7hQr3z74d6ACphRKKg7GuLr8OyC3E8kMLNWEAVcWN
	4A9GfrubKdeb3j6JQbr3ohj5+x7OBWy4Xztvk9hV3+QqL+QPOkgvyGS2FJ6Rka3lP9CfSQQgHNy
	eudn+bRkQZflU7VmZA94i0aZuEZCZLNW+FqDUMC4dAo7POjJVWtBuljE9xl/OGnh2OR51tcCvaX
	VlXfaHquxUBTUV2gJZ1ZwjeMJWZJ3c1Ifg8rjr+qCiq4mR0NP1pUlQKnqGw+jO2HnTtcSFHSfuU
	HL0vyj24TSOf25qwCCCBSL7IxQfZq6SIaUXrYKkOfkGil4sk8RGfo/42bkubOl8gv3ukR/Av0Uj
	727JZeZF0lOm0bfS+MPUwJGS/Chug=
X-Received: by 2002:a05:6a00:4405:b0:848:2f7a:2e56 with SMTP id d2e1a72fcca58-84889753bcfmr8957113b3a.69.1783963016003;
        Mon, 13 Jul 2026 10:16:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3ead:2a56:27bf:77cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm137812b3a.59.2026.07.13.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:16:55 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:16:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alUdg9iTysXCFUa5@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39997-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shenwei.wang@oss.nxp.com,m:linusw@kernel.org,m:brgl@kernel.org,m:corbet@lwn.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:skhan@linuxfoundation.org,m:linux-gpio@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:shenwei.wang@nxp.com,m:peng.fan@nxp.com,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-imx@nxp.com,m:arnaud.pouliquen@foss.st.com,m:b-padhi@ti.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,foss.st.com,ti.com,lunn.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mathieu.poirier@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,p14s:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B954D74DF6D

On Thu, Jun 25, 2026 at 10:54:26AM -0500, Shenwei Wang wrote:
> From: Shenwei Wang <shenwei.wang@nxp.com>
> 
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
>  Documentation/driver-api/gpio/index.rst      |   1 +
>  2 files changed, 272 insertions(+)
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..7d351ff0adb0
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,271 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG (Remote Processor Messaging) Protocol
> +================================================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers on remote processors via the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 8-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |     cmd     |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> +
> +- **line**: The GPIO line (pin) index of the port.

Here and throughout, please remove any mention of 'port'.  This is handled by
the endpoint device, i.e one GPIO controller (port) per endpoint.

> +
> +- **value**: See details in the command description below.
> +
> +
> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field.
> +
> +The SEND message is always sent from Linux to the remote firmware. Each
> +SEND corresponds to a single REPLY message. The GPIO driver should
> +serialize messages and determine whether a REPLY message is required. If a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.
> +
> +GET_DIRECTION (Cmd=2)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      2      |    line     |             0             |
> +   +------+------+------+------+------+------+------+------+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status | value  |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +- **value**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +
> +SET_DIRECTION (Cmd=3)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      3      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +
> +GET_VALUE (Cmd=4)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      4      |    line     |             0             |
> +   +------+------+------+------+------+------+------+------+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status | value  |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +- **value**: Level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +
> +SET_VALUE (Cmd=5)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      5      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Output level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +
> +SET_IRQ_TYPE (Cmd=6)
> +~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      6      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: IRQ types.
> +
> +  - 0: Interrupt disabled
> +  - 1: Rising edge trigger
> +  - 2: Falling edge trigger
> +  - 3: Both edge trigger
> +  - 4: High level trigger
> +  - 8: Low level trigger

I'm in agreement with cmd 3, 4, 5 and 6.  

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +SET_WAKEUP (Cmd=16)
> +~~~~~~~~~~~~~~~~~~~

I already commented on messages that are not part of the virtio-gpio
specification.  

> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      1      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Wakeup enable.
> +
> +  The remote system should always aim to stay in a power-efficient state by
> +  shutting down or clock-gating the GPIO blocks that aren't in use. Since
> +  the remoteproc driver is responsible for managing the power states of the
> +  remote firmware, the GPIO driver does not require to know the firmware's
> +  running states.
> +
> +  When the wakeup bit is set, the remote firmware should configure the line
> +  as a wakeup source. The firmware should send the notification message to
> +  Linux after it is woken from the GPIO line.
> +
> +  - 0: Disable wakeup from GPIO
> +  - 1: Enable wakeup from GPIO
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +------+--------+--------+
> +   | 0x00 |  0x01  |  0x02  |
> +   |   1  | status |    0   |
> +   +------+--------+--------+
> +
> +- **status**:
> +
> +  - 0: Ok
> +  - 1: Error
> +
> +Notification Message
> +--------------------

"Interrupt Messages"

> +
> +Notifications are sent by the remote core and they have
> +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> +
> +When a GPIO line asserts an interrupt on the remote processor, the firmware
> +should immediately mask the corresponding interrupt source and send a
> +notification message to the Linux. Upon completion of the interrupt
> +handling on the Linux side, the driver should issue a
> +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> +
> +A Notification message can arrive between a SEND and its REPLY message,
> +and the driver is expected to handle this scenario.
> +
> +.. code-block:: none
> +
> +   +------+------+--------+
> +   | 0x00 | 0x01 |  0x02  |
> +   |   2  | line | trigger|
> +   +------+------+--------+

2 things here:

1) You did not include messages that mask and unmask interrupts at the driver
side.

2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
protocol should be about thar:  

+------+------+--------+--------
| 0x00 |       payload         |          
|  Q   |                       | 
+------+------+--------+--------

Q = 0 requestq
Q = 1 eventq

The "payload" part is simply the format of the messages as found in the
virtio-gpio specification.  From there, the only thing left to mention is which
messages are not supported, i.e get line names.

> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **trigger**: Optional parameter to indicate the trigger event type.

Not part of the spec - remove.

Given the refactoring work that is still needed, I will not look at the
implementation.

Thanks,
Mathieu

> +
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index bee58f709b9a..e5eb1f82f01f 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -16,6 +16,7 @@ Contents:
>     drivers-on-gpio
>     bt8xxgpio
>     pca953x
> +   gpio-rpmsg
>  
>  Core
>  ====
> -- 
> 2.43.0
> 

