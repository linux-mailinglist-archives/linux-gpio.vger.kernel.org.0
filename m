Return-Path: <linux-gpio+bounces-36609-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CA+MHc0AmocpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36609-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:56:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95F515574
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 21:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86ECE30060B1
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 19:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CD737F001;
	Mon, 11 May 2026 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eldR591f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA0337EFF1
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529394; cv=none; b=QMVAjW6SQZTHzQg+o/6FFcVuULHxZGadYzb3C65Nd0GBeUYDlr24uEgpMRJyjSHYJtXCAnMOlIsiWb/qnDG/Dna0b0wu2v2nZ2zWQEhobBCaxKyqFMOBASTfV59SLNhpuB1H0ZLNAq/LojRbgoZAXYHuorW/iQvCcexq9UEUNgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529394; c=relaxed/simple;
	bh=36Y76l+8L/1TfCN9D9kVNldinwW1l3CEh723aHYy5Vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eipGkNclNFFB9NVjIOMicpmKZNHIYT6Nc18tOK1SzBg9dAmDM1PuwWEU7JIjjpppmCYhux75muOxMO0VFHZ4YJfg4ah5UUvUZldaiqdRaggrBo+KmIry1yrb/06aSbg3BEVgaahLuSdRsqSM9z/u7MhOHU2T6AAqiMwTSuxHe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eldR591f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427ABC2BD04
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529394;
	bh=36Y76l+8L/1TfCN9D9kVNldinwW1l3CEh723aHYy5Vk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eldR591fT7Hwm3wg3SqMducQlfxaAEHxkYFLr5Ef3J7xYD7RoGnrXJYcpIjwkbtlI
	 6RSGX8VenN+l3okSDgTObaQdzW3nKaDtkQVQyz8HbpeUcAiD4w8JYhNVzMHW0NJuai
	 Fm9F+Yn5JPhIKa5Ik/qO4zY6JsAApRuhtp2FRBfQe+euX7te7fPrt360tBOQLnIEiP
	 8HDCu0DSrtyY5qYRTuX2fTByWiwkbgJBvri7Gjjl8axF6vpgQqJ8Ng5v5fCoIKq5ko
	 I/7xfZLtRUW+fmv8qOK9KeMzhDU2X9Xbg8rMH4QBz8jAhhqftXszgIap+OhcVhV4gp
	 AG3w6MEIHtqhg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso4885091e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:56:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bb8mje3G55VbgwfTu7hHXs8NsAA4TWW6nmCA2JaeU34TRS5EO55E3UALtkJyUfg8iwVl9hLzoPsnn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu5q5/lIKyCB6iBt++H6sroO4pqzk04ZXi565YQb2jSVoYlibF
	eNmTF4DQ6+fkRLaUWS+GXiaq+3W+JCV+KAi8dJ+NdHP2/l07NGHoXEJ4i50xpFYjiW7N09dOmdL
	q+Hfwpvb5vwUnkYTtSQXUmKEY08ID5R0=
X-Received: by 2002:a05:6512:3d19:b0:5a8:99c8:94bc with SMTP id
 2adb3069b0e04-5a899c89686mr7561830e87.28.1778529392892; Mon, 11 May 2026
 12:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505160902.1425532-1-Frank.Li@nxp.com>
In-Reply-To: <20260505160902.1425532-1-Frank.Li@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 21:56:20 +0200
X-Gmail-Original-Message-ID: <CAD++jL=BhoYCvTLvzCQyktRUiKsRrVyadUxOjCvLL7wxwBcR=Q@mail.gmail.com>
X-Gm-Features: AVHnY4I-LNT372-vzpWf6Qi-_cAA5hInJN5Jx7npmbBI4rxSPCplPzmHk8NUQv4
Message-ID: <CAD++jL=BhoYCvTLvzCQyktRUiKsRrVyadUxOjCvLL7wxwBcR=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: imx1: Allow parsing DT without function nodes
To: Frank Li <Frank.Li@nxp.com>
Cc: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CD95F515574
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[armadeus.com,nxp.com,gmail.com,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-36609-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 5, 2026 at 6:09=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> The old format to define pinctrl settings for imx in DT has two hierarchy
> levels. The first level are function device nodes. The second level are
> pingroups which contain a property fsl,pins. The original ntention was to
> define all pin functions in a single dtsi file and just reference the
> correct ones in the board files.
>
> The commit ("5fcdf6a7ed95e pinctrl: imx: Allow parsing DT without functio=
n
> nodes") already make moden i.MX chip support flatten layout.
>
> Make legacy chipes (more than 15 years) support this flatten layout also.
>
> Fixes: e948cbdc41d6f ("ARM: dts: imx: remove redundant intermediate node =
in pinmux hierarchy")
> Tested-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

No reaction from other i.MX maintainers but OK, patch applied for fixes!

Yours,
Linus Walleij

