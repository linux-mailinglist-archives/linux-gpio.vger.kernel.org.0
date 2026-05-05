Return-Path: <linux-gpio+bounces-36191-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFlXLO/d+WlPEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36191-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:09:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E98F4CD3D3
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90A973025E5D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0199B41C317;
	Tue,  5 May 2026 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3B+Pwnj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77193914F5
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982940; cv=none; b=CvhOT84hAnRuKtS4a1iZ4nPZK9Bg9ujAyz0qBCRqbF2o40TnDxJc6K4t7a8NCpSxA+7LeT/w6OQkFVZziPlkREcfLMN+d729gAcDjMvKazaNP/kp5tVtNcjDI8lzHo/yW5Q+xljuvVFF/z7cTGajKX75AznHWwO+yLY78kQJVs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982940; c=relaxed/simple;
	bh=w+WRCZqU8kokq2AXExK/588X3QQVWVSPSVOh/11hPGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SdgFuR+r+Wly5rxCPt26uu/p072xSfaWokX27WTwY74LsmJmT3Ybp6S1D5y6x36fZGQql0TrEInzKZVagsTZTuFn1J0Mi/1S0ik/l49ZN5U/ji/Q9ayNtcj/4ClyRDQQbPpMwSXqfBq0oLoQkGZJsZPJPN2WUqErzTKEgTpCLC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3B+Pwnj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBA3C4AF09
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982940;
	bh=w+WRCZqU8kokq2AXExK/588X3QQVWVSPSVOh/11hPGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=b3B+PwnjLg4F92fOf2RhMpitepo+xrov8Zv3b2ypMbJj/qgHo5iWQyMJZpxQGBMQw
	 SF9LEetMBzyrftAYw0aWkcoGtxv7mPHzv1KIiFYOXwrquhz0bIziich4OtyclbmSv8
	 mDMHVBq5+GieIruK6BjtFRiVqwMefB2uvINNnLkHSKfQ71JuArB9+KyPFzzSEcRIrG
	 mJGGU1UCwWvboaiqLu+rNH027uzU9l8HdQulvFTG4Hkw0kA57Ov/ao5O1HtYYicdFq
	 3EMdDJm/p2IuIIpXbxztxz3Z64YoLCIQV65pirnH/ipQzctA7HmK9dLg4ZJA4sHknW
	 Y+WK2xUUOp1FQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4784526e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:09:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YyErwZeIo3+m4qWYHI2iA1s7AsXv+wNT/PG2ATyFXZ5h1rb56LI
	8PFGtRDMUfM1xEMcF9Dr7uQyQiRf9FFyay08uGMtvnxmlFEZuz+PcYnB8+e5WnMHSi/w0UI9LZI
	aUuJ0Rjabv27/311BoSnsrqgXeExqVRo=
X-Received: by 2002:ac2:5287:0:b0:5a8:64c4:38cd with SMTP id
 2adb3069b0e04-5a864c43a8amr3843936e87.21.1777982938915; Tue, 05 May 2026
 05:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430220409.74885-1-rosenp@gmail.com>
In-Reply-To: <20260430220409.74885-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:08:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLk10PN8854hqQbdy0A57UWiT2Pvmw3ew+vSVb5WBZZBxg@mail.gmail.com>
X-Gm-Features: AVHnY4ISJ-qRQ6ihp4NmbHNATxkVPj9rgXjSk2ExZ5KttDPUUPe2UT7Wx7DXr10
Message-ID: <CAD++jLk10PN8854hqQbdy0A57UWiT2Pvmw3ew+vSVb5WBZZBxg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sophgo: allocate power_cfg with priv
To: Rosen Penev <rosenp@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>
Cc: linux-gpio@vger.kernel.org, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5E98F4CD3D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,gmail.com,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-36191-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Rosen,

thanks for your patch!

On Fri, May 1, 2026 at 12:04=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Use a flexible array member to combine allocations and simplify code
> slightly.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

I have applied the patch with the following augmentation:

iff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
index 154ba9a4f08c..59318a42690f 100644
--- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -27,8 +27,9 @@
 #include "pinctrl-cv18xx.h"

 struct cv1800_priv {
-       void __iomem                            *regs[2];
-       u32                                     power_cfg[];
+       void __iomem    *regs[2];
+       unsigned int    num_power_cfg;
+       u32             power_cfg[] __counted_by(num_power_cfg);
 };

 static unsigned int cv1800_dt_get_pin_mux(u32 value)
@@ -421,6 +422,7 @@ static int cv1800_pinctrl_init(struct platform_device *=
pdev,
                        GFP_KERNEL);
        if (!priv)
                return -ENOMEM;
+       priv->num_power_cfg =3D pctrl_data->npds;

        priv->regs[0] =3D devm_platform_ioremap_resource_byname(pdev, "sys"=
);
        if (IS_ERR(priv->regs[0]))

I think this has been mentioned before?

Including a counter for dynamic arrays makes it possible for the
compiler to insert runtime checks akin to those that are used for
Pascal or Rust arrays making it harder for the arrays to be indexed
out of range.

Yours,
Linus Walleij

