Return-Path: <linux-gpio+bounces-33541-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD6WFXcSuGk7YwEAu9opvQ
	(envelope-from <linux-gpio+bounces-33541-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:23:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6FE29B44B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 15:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9783300AC29
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 14:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A6727BF6C;
	Mon, 16 Mar 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lerrBZ/K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E29279336
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671025; cv=none; b=UT2hvUBL5R2pnpQnpR8TDqGlH7/h5Ko++t7Iiv5ci6CkCIG1xsjUn2yad+MIT4dkiWOYl1jL3tmDJ7QiOMgIANL6l/xbGUhZiP8ak1wMyuxOngz9iDJzDfmUKhAaFz2+zrH02ROG65CEJGN1EuPi9OEVzIuVCH2h8GhdWG0GTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671025; c=relaxed/simple;
	bh=o9qImMPTFN9l13pEaVZexXF0+F/wHlqkeGvCWUWvFc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eqo/jLEOaiS/SrgTl85ksdmc5yOsBzUvbkBhRDTyQAIR3COESvpTxCc139S8je2zF9CAj620M5FGfyWr3C3JQ7sh0/2/fwLum/WDCkL7cq6k+yVgkbFQ0DUdWouSDt+goVTdDcFq9aiCTjQIns78x7JTD8pcpZdE3g+PJxbJ8WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lerrBZ/K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E412AC2BC9E
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671024;
	bh=o9qImMPTFN9l13pEaVZexXF0+F/wHlqkeGvCWUWvFc0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lerrBZ/KGuLRCqDi8QDq3Z4lav1q9Lmf48/oXadd5KiYL7fl81kmHa5FgkQx/rl4I
	 /Coru6bY4PIlpGBUtFCUWYfPsDPiqtUxgsaB87V6MOQSV2T1w5z70XbTqNlcsN44ED
	 IsO5hB2WnG3n5J+nu7KW9DO4HSyOFuxzqEg+jLDRgqZZV4KpHzDRPWFw4BU5eGAKYP
	 kDy43LSi512VfdVhfPO9rIGK+7bJOyMtvZMbPJALP+Soz/pxflhFKsWrYTbfwnmzrp
	 agHCjenfumnAxCwWeO2UYavUgmD7Suk5+9EED+aTTRAv6cl3Bo0wkIJmMxwd9mEE/Y
	 dJB0nBtVkqlfw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e4989dacdso5230208e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 07:23:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPayrBkyM+iu/lhcJpImxZskrtIQPIPtuc/GD8479otIp6IEPa6YttSCyyXcqIPpbqJSa48oaYbPKy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/0P3Oo7PGraajqNd1zRVqVJkvdmID2C20CHFCXvQ0+tUbR7qf
	6yIWJjOnJmhssTJ3TuVBs+hmbJ+Gnl7ZjWtgDiE0HGxQ49OnuY5SA+EG+IwyhvKt+zFZY+IyuZE
	L87pdtqpDlxhKITrxlWKIlmHMeQmP5aU=
X-Received: by 2002:a05:6512:1589:b0:5a1:3f66:1d75 with SMTP id
 2adb3069b0e04-5a162b1feb3mr3926051e87.43.1773671023606; Mon, 16 Mar 2026
 07:23:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
In-Reply-To: <20260313195801.2043306-1-shenwei.wang@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 15:23:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
X-Gm-Features: AaiRm51oPQ0PGDQyh1c2t_SBzYfjFDmFeidRXonO75pnfFoM__wwYFbbiMK8ux8
Message-ID: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33541-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,foss.st.com,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[i.mx:url,mail.gmail.com:mid,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA6FE29B44B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Shenwei,

On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:

> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.

I think v12 looks pretty good, if Arnaud gives his ACK on this patch
series I think it's ripe for merge.

Yours,
Linus Walleij

